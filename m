Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E21A4963A35
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 08:01:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B0C10E195;
	Thu, 29 Aug 2024 06:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="N4X/4Xmk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com
 [209.85.128.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC3510E195
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 06:01:36 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-6643016423fso7833837b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 23:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1724911295; x=1725516095;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=i/PEygQn081YuovQ6b+Ov4J7AW7lnL8H+wq29MS093A=;
 b=N4X/4Xmkd8pubfZQs/n89/rEUfnUuR07GT0JdSVVnVyLzuoY5ar5/6nlBOKlB1mhAl
 xDvW/SJlPcKeVWO33PnTaNqjQAsFgap3HtgrWI6VNWLivghUuMhVgCL8Ne7fpnpUSYZN
 a6UtDK//8A/Gfc606cgOaqV+vubkAzIAmbzdwEH4BCViU0bMJV6p8VMs00GIJuv/uWR6
 uwnQZvAVsNaL9WGmap8eg8zdG04qtYwxWXGvmfkzSESSSqMlor/RnngBiGZM4VxWoVx/
 C53h0ZTqHIRs3ijxmvYPeNzBbUJFqXJc4nrRAoLsV3zvF9WPXgJle4Vu0VVj1LHr4QE9
 BnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724911295; x=1725516095;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i/PEygQn081YuovQ6b+Ov4J7AW7lnL8H+wq29MS093A=;
 b=V7hqt75licEow96QFxZ/er9PN370bi4lmoKlBjmLl552xufbR919q2QW6kcSpHeVQ8
 Fs8D5kpnfABwi0tzZJaTEqEZLTVSaN44znP2pjgd2xlBVB8UDGLS9lbC83Ve+BALjNRC
 X1znOFSnDQB8jPyXiw72W3Fz40nTThQGohxiFr9h/uRmJ5KDXjimKyCD78pJXBzKDlpv
 nzXoNIKSk2O3U1JcvOJrimgKGrYR1w1iKrej1pdaAy1jgL0T+cGSj1EhusBwyxM3Ud+5
 UizxKSe7+MKQx18AE3jsg6/cFsXyqoFqJnmJfDHarQ0l13SF4Wic4zCXUA4Jda5EsIu4
 Pbcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsBZ/vL5aPWXUokxtJC5d/aIZlQjASKkdO58+WXrRSIT6uA5ZsLvsjfwt0ySsvGeRpaar8FXXlh+4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOC+PTRW0iA9ce6hCOHW8kYf2Ol0FvOSg97PEWBRMtE8ckv3aZ
 f/Wi43P+KDwU2vBD9W/jVN9zzkDdy6v0jE6BIF5tWJlnle2yR+XR5KEQTNG4efUT7Io0Dn4fsi6
 EXYH8UOfynzIVVrvr531sUA==
X-Google-Smtp-Source: AGHT+IHvqWZDkrImA3Rll27PLuurKUm0K0X8L9TBDk2/fyfIpF78bA7ar3FjJSbSKg89517H5D9SO6G54NnViWGM6Q==
X-Received: from almasrymina.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:4bc5])
 (user=almasrymina job=sendgmr) by 2002:a81:a804:0:b0:6b0:57ec:c5f9 with SMTP
 id 00721157ae682-6d2c38cabbamr264437b3.0.1724911295124; Wed, 28 Aug 2024
 23:01:35 -0700 (PDT)
Date: Thu, 29 Aug 2024 06:01:14 +0000
In-Reply-To: <20240829060126.2792671-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20240829060126.2792671-1-almasrymina@google.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Message-ID: <20240829060126.2792671-2-almasrymina@google.com>
Subject: [PATCH net-next v23 01/13] netdev: add netdev_rx_queue_restart()
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Cc: Mina Almasry <almasrymina@google.com>,
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
 Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 Matt Turner <mattst88@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, 
 Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Arnd Bergmann <arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=" <bjorn@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>, 
 Shuah Khan <shuah@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
 Pavel Begunkov <asml.silence@gmail.com>, 
 David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yunsheng Lin <linyunsheng@huawei.com>, 
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst <jeroendb@google.com>, 
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, 
 Christoph Hellwig <hch@infradead.org>,
 Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add netdev_rx_queue_restart(), which resets an rx queue using the
queue API recently merged[1].

The queue API was merged to enable the core net stack to reset individual
rx queues to actuate changes in the rx queue's configuration. In later
patches in this series, we will use netdev_rx_queue_restart() to reset
rx queues after binding or unbinding dmabuf configuration, which will
cause reallocation of the page_pool to repopulate its memory using the
new configuration.

[1] https://lore.kernel.org/netdev/20240430231420.699177-1-shailend@google.com/T/

Signed-off-by: David Wei <dw@davidwei.uk>
Signed-off-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>
Reviewed-by: Jakub Kicinski <kuba@kernel.org>

---

v18:
- Add more color to commit message (Xuan Zhuo).

v17:
- Use ASSERT_RTNL() (Jakub).

v13:
- Add reviewed-by from Pavel (thanks!)
- Fixed comment (Pavel)

v11:
- Fix not checking dev->queue_mgmt_ops (Pavel).
- Fix ndo_queue_mem_free call that passed the wrong pointer (David).

v9: https://lore.kernel.org/all/20240502045410.3524155-4-dw@davidwei.uk/
(submitted by David).
- fixed SPDX license identifier (Simon).
- Rebased on top of merged queue API definition, and changed
  implementation to match that.
- Replace rtnl_lock() with rtnl_is_locked() to make it useable from my
  netlink code where rtnl is already locked.

---
 include/net/netdev_rx_queue.h |  3 ++
 net/core/Makefile             |  1 +
 net/core/netdev_rx_queue.c    | 74 +++++++++++++++++++++++++++++++++++
 3 files changed, 78 insertions(+)
 create mode 100644 net/core/netdev_rx_queue.c

diff --git a/include/net/netdev_rx_queue.h b/include/net/netdev_rx_queue.h
index aa1716fb0e53..e78ca52d67fb 100644
--- a/include/net/netdev_rx_queue.h
+++ b/include/net/netdev_rx_queue.h
@@ -54,4 +54,7 @@ get_netdev_rx_queue_index(struct netdev_rx_queue *queue)
 	return index;
 }
 #endif
+
+int netdev_rx_queue_restart(struct net_device *dev, unsigned int rxq);
+
 #endif
diff --git a/net/core/Makefile b/net/core/Makefile
index 62be9aef2528..f82232b358a2 100644
--- a/net/core/Makefile
+++ b/net/core/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_NETDEV_ADDR_LIST_TEST) += dev_addr_lists_test.o
 
 obj-y += net-sysfs.o
 obj-y += hotdata.o
+obj-y += netdev_rx_queue.o
 obj-$(CONFIG_PAGE_POOL) += page_pool.o page_pool_user.o
 obj-$(CONFIG_PROC_FS) += net-procfs.o
 obj-$(CONFIG_NET_PKTGEN) += pktgen.o
diff --git a/net/core/netdev_rx_queue.c b/net/core/netdev_rx_queue.c
new file mode 100644
index 000000000000..da11720a5983
--- /dev/null
+++ b/net/core/netdev_rx_queue.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/netdevice.h>
+#include <net/netdev_queues.h>
+#include <net/netdev_rx_queue.h>
+
+int netdev_rx_queue_restart(struct net_device *dev, unsigned int rxq_idx)
+{
+	void *new_mem, *old_mem;
+	int err;
+
+	if (!dev->queue_mgmt_ops || !dev->queue_mgmt_ops->ndo_queue_stop ||
+	    !dev->queue_mgmt_ops->ndo_queue_mem_free ||
+	    !dev->queue_mgmt_ops->ndo_queue_mem_alloc ||
+	    !dev->queue_mgmt_ops->ndo_queue_start)
+		return -EOPNOTSUPP;
+
+	ASSERT_RTNL();
+
+	new_mem = kvzalloc(dev->queue_mgmt_ops->ndo_queue_mem_size, GFP_KERNEL);
+	if (!new_mem)
+		return -ENOMEM;
+
+	old_mem = kvzalloc(dev->queue_mgmt_ops->ndo_queue_mem_size, GFP_KERNEL);
+	if (!old_mem) {
+		err = -ENOMEM;
+		goto err_free_new_mem;
+	}
+
+	err = dev->queue_mgmt_ops->ndo_queue_mem_alloc(dev, new_mem, rxq_idx);
+	if (err)
+		goto err_free_old_mem;
+
+	err = dev->queue_mgmt_ops->ndo_queue_stop(dev, old_mem, rxq_idx);
+	if (err)
+		goto err_free_new_queue_mem;
+
+	err = dev->queue_mgmt_ops->ndo_queue_start(dev, new_mem, rxq_idx);
+	if (err)
+		goto err_start_queue;
+
+	dev->queue_mgmt_ops->ndo_queue_mem_free(dev, old_mem);
+
+	kvfree(old_mem);
+	kvfree(new_mem);
+
+	return 0;
+
+err_start_queue:
+	/* Restarting the queue with old_mem should be successful as we haven't
+	 * changed any of the queue configuration, and there is not much we can
+	 * do to recover from a failure here.
+	 *
+	 * WARN if we fail to recover the old rx queue, and at least free
+	 * old_mem so we don't also leak that.
+	 */
+	if (dev->queue_mgmt_ops->ndo_queue_start(dev, old_mem, rxq_idx)) {
+		WARN(1,
+		     "Failed to restart old queue in error path. RX queue %d may be unhealthy.",
+		     rxq_idx);
+		dev->queue_mgmt_ops->ndo_queue_mem_free(dev, old_mem);
+	}
+
+err_free_new_queue_mem:
+	dev->queue_mgmt_ops->ndo_queue_mem_free(dev, new_mem);
+
+err_free_old_mem:
+	kvfree(old_mem);
+
+err_free_new_mem:
+	kvfree(new_mem);
+
+	return err;
+}
-- 
2.46.0.469.g59c65b2a67-goog

