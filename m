Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E89148960A4
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 02:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE6FB112212;
	Wed,  3 Apr 2024 00:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="MWKchU9D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com
 [209.85.128.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54288112210
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 00:21:11 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-610b96c8ca2so102367987b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 17:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1712103670; x=1712708470;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=7nhXcrf/psLdQ173XjHGFDimEkHTNNBO9mtpBEGwTzo=;
 b=MWKchU9D4izGRrLb6HIG3+d+iZtHOgprtHbGCchYgptuUVPjq9BO/OJqIjPaAcuKCy
 KUsdJiXK6UxpTiO1/OGLXU079WK1ZoowPCqdJdUpXAdIoz7OS+IsIL2E447hReIcZmSd
 eqqCnrKP0cIob0WP/ooFo0xthgA7S8qLcxVQeqXWj0ZEfKGVJ5G9B2QPPzJUsiLDKPNV
 1Ja2o66Nsdau+Rf0xGNUfNDW3R2NHX6nF16agcAgg2gIpSTXGavUS4mN5/zYR59JWD1V
 C+Rw102ftY2Zd2wI4WfZgS0iBWAJHtiBuYSpMZQniJNdH/D1jz/Q1vKll84XT5eCbOxb
 8z+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712103670; x=1712708470;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7nhXcrf/psLdQ173XjHGFDimEkHTNNBO9mtpBEGwTzo=;
 b=If9fPTFIyGNrRbRGiFCl0TvgttV8dAJPhQYEwLooFr7iD7vTpVH9GyvOIG2t1/pgvh
 BRcrW7TDqqH0uhc0GGGM8E9wgYN5N8uzWSeK/rHNN/u1T0KDtwt0aYn9I5qvG2F3BycC
 MiVts2+Eu9hSVRGp4SGrxV0znol0TKvFJhuE0VMercoOPo6sUViEvyBLDxmbxLRIEd0f
 M4YKCJk9D8l6V55SVbkgG+oxLV38VqYhOEEii9uKYa9H1imXRM1m+jxVue2fVtpgsZlp
 CzE1ZviWf6cXDrKG9VRZjrH2oaxRjqEieGQ6a1nV6zrlJu1vFfWbCI8o60J4+mI+8vS9
 d25g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEDnYJB/t9KJab1Wq0+LSwfRU51ilXivk1vgVcvwwrgW/htg/KK0rlkLVTp1jBpuYAr7CsfTTCYDWKrvegtq8LNvOPMDp5B1gP0NulHnfG
X-Gm-Message-State: AOJu0YwACTAe19szpdLZCa1tcgdAM0GjfJN1q5HuNuEjG0huCaOSxZ0U
 XBkEQHfxC3DsHDlDUMo1lf02jllCkkdP1AnCgo4HFhAkUNFVckX76Xr+CLL2VTJWUMAadAlvB/V
 0E84OioSA0xKHLyeMv3I3LA==
X-Google-Smtp-Source: AGHT+IHMXdCvPN5+ndYi96zUruWX8N0e3AstuGfCxpXeaq2Uu1jKjeIcbqjKoYhElRNSOqkr/xQVDtinASCTT2HEZg==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:1726:7620:90a1:78b9])
 (user=almasrymina job=sendgmr) by 2002:a81:52c7:0:b0:615:102e:7d3b with SMTP
 id g190-20020a8152c7000000b00615102e7d3bmr1133480ywb.1.1712103670342; Tue, 02
 Apr 2024 17:21:10 -0700 (PDT)
Date: Tue,  2 Apr 2024 17:20:42 -0700
In-Reply-To: <20240403002053.2376017-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20240403002053.2376017-1-almasrymina@google.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240403002053.2376017-6-almasrymina@google.com>
Subject: [RFC PATCH net-next v8 05/14] netdev: netdevice devmem allocator
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
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, 
 Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, 
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
 Amritha Nambiar <amritha.nambiar@intel.com>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Alexander Mikhalitsyn <alexander@mihalicyn.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>, 
 Christian Brauner <brauner@kernel.org>, Simon Horman <horms@kernel.org>, 
 David Howells <dhowells@redhat.com>, Florian Westphal <fw@strlen.de>, 
 Yunsheng Lin <linyunsheng@huawei.com>, Kuniyuki Iwashima <kuniyu@amazon.com>,
 Jens Axboe <axboe@kernel.dk>, 
 Arseniy Krasnov <avkrasnov@salutedevices.com>, 
 Aleksander Lobakin <aleksander.lobakin@intel.com>,
 Michael Lass <bevan@bi-co.net>, Jiri Pirko <jiri@resnulli.us>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Richard Gobert <richardbgobert@gmail.com>, 
 Sridhar Samudrala <sridhar.samudrala@intel.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 Johannes Berg <johannes.berg@intel.com>, Abel Wu <wuyun.abel@bytedance.com>, 
 Breno Leitao <leitao@debian.org>, Pavel Begunkov <asml.silence@gmail.com>,
 David Wei <dw@davidwei.uk>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Shailend Chand <shailend@google.com>, 
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>, 
 Willem de Bruijn <willemb@google.com>
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

Implement netdev devmem allocator. The allocator takes a given struct
netdev_dmabuf_binding as input and allocates net_iov from that
binding.

The allocation simply delegates to the binding's genpool for the
allocation logic and wraps the returned memory region in a net_iov
struct.

Signed-off-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>

---

v8:
- Rename netdev_dmabuf_binding -> net_devmem_dmabuf_binding to avoid
  patch-by-patch build error.
- Move niov->pp_magic/pp/pp_ref_counter usage to later patch to avoid
  patch-by-patch build error.

v7:
- netdev_ -> net_devmem_* naming (Yunsheng).

v6:
- Add comment on net_iov_dma_addr to explain why we don't use
  niov->dma_addr (Pavel)
- Refactor new functions into net/core/devmem.c (Pavel)

v1:
- Rename devmem -> dmabuf (David).

---
 include/net/devmem.h | 13 +++++++++++++
 include/net/netmem.h | 40 ++++++++++++++++++++++++++++++++++++++++
 net/core/devmem.c    | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+)

diff --git a/include/net/devmem.h b/include/net/devmem.h
index fa03bdabdffd..cd3186f5d1fb 100644
--- a/include/net/devmem.h
+++ b/include/net/devmem.h
@@ -68,7 +68,20 @@ int net_devmem_bind_dmabuf(struct net_device *dev, unsigned int dmabuf_fd,
 void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding);
 int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
 				    struct net_devmem_dmabuf_binding *binding);
+struct net_iov *
+net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding);
+void net_devmem_free_dmabuf(struct net_iov *ppiov);
 #else
+static inline struct net_iov *
+net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding)
+{
+	return NULL;
+}
+
+static inline void net_devmem_free_dmabuf(struct net_iov *ppiov)
+{
+}
+
 static inline void
 __net_devmem_dmabuf_binding_free(struct net_devmem_dmabuf_binding *binding)
 {
diff --git a/include/net/netmem.h b/include/net/netmem.h
index 72e932a1a948..33014370a885 100644
--- a/include/net/netmem.h
+++ b/include/net/netmem.h
@@ -14,8 +14,48 @@
 
 struct net_iov {
 	struct dmabuf_genpool_chunk_owner *owner;
+	unsigned long dma_addr;
 };
 
+static inline struct dmabuf_genpool_chunk_owner *
+net_iov_owner(const struct net_iov *niov)
+{
+	return niov->owner;
+}
+
+static inline unsigned int net_iov_idx(const struct net_iov *niov)
+{
+	return niov - net_iov_owner(niov)->niovs;
+}
+
+/* This returns the absolute dma_addr_t calculated from
+ * net_iov_owner(niov)->owner->base_dma_addr, not the page_pool-owned
+ * niov->dma_addr.
+ *
+ * The absolute dma_addr_t is a dma_addr_t that is always uncompressed.
+ *
+ * The page_pool-owner niov->dma_addr is the absolute dma_addr compressed into
+ * an unsigned long. Special handling is done when the unsigned long is 32-bit
+ * but the dma_addr_t is 64-bit.
+ *
+ * In general code looking for the dma_addr_t should use net_iov_dma_addr(),
+ * while page_pool code looking for the unsigned long dma_addr which mirrors
+ * the field in struct page should use niov->dma_addr.
+ */
+static inline dma_addr_t net_iov_dma_addr(const struct net_iov *niov)
+{
+	struct dmabuf_genpool_chunk_owner *owner = net_iov_owner(niov);
+
+	return owner->base_dma_addr +
+	       ((dma_addr_t)net_iov_idx(niov) << PAGE_SHIFT);
+}
+
+static inline struct net_devmem_dmabuf_binding *
+net_iov_binding(const struct net_iov *niov)
+{
+	return net_iov_owner(niov)->binding;
+}
+
 /* netmem */
 
 /**
diff --git a/net/core/devmem.c b/net/core/devmem.c
index 02a6abaecf40..268fc8455a6d 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -103,6 +103,42 @@ static int net_devmem_restart_rx_queue(struct net_device *dev, int rxq_idx)
 	return err;
 }
 
+struct net_iov *
+net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding)
+{
+	struct dmabuf_genpool_chunk_owner *owner;
+	unsigned long dma_addr;
+	struct net_iov *niov;
+	ssize_t offset;
+	ssize_t index;
+
+	dma_addr = gen_pool_alloc_owner(binding->chunk_pool, PAGE_SIZE,
+					(void **)&owner);
+	if (!dma_addr)
+		return NULL;
+
+	offset = dma_addr - owner->base_dma_addr;
+	index = offset / PAGE_SIZE;
+	niov = &owner->niovs[index];
+
+	niov->dma_addr = 0;
+
+	net_devmem_dmabuf_binding_get(binding);
+
+	return niov;
+}
+
+void net_devmem_free_dmabuf(struct net_iov *niov)
+{
+	struct net_devmem_dmabuf_binding *binding = net_iov_binding(niov);
+	unsigned long dma_addr = net_iov_dma_addr(niov);
+
+	if (gen_pool_has_addr(binding->chunk_pool, dma_addr, PAGE_SIZE))
+		gen_pool_free(binding->chunk_pool, dma_addr, PAGE_SIZE);
+
+	net_devmem_dmabuf_binding_put(binding);
+}
+
 /* Protected by rtnl_lock() */
 static DEFINE_XARRAY_FLAGS(net_devmem_dmabuf_bindings, XA_FLAGS_ALLOC1);
 
-- 
2.44.0.478.gd926399ef9-goog

