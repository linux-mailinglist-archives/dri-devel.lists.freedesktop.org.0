Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A56966DB9
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 02:43:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53CCF10E840;
	Sat, 31 Aug 2024 00:43:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="c3uMkgi6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com
 [209.85.128.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE6710E805
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2024 00:43:48 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-6b4270bdea3so53579927b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 17:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1725065028; x=1725669828;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=jKys/joTXpfZhwIK7WZYB+S0gWaRcW4vQQYF7K5JoYU=;
 b=c3uMkgi6IFquuKLdGbmr/0Yp0T5i8dbnDZcpk5mT/qwb5J70cRGr8IqyXo+/mWfQZM
 tpX9nN85rTGPzdTKGEYOL8KUSfAxPt6UO3jiyuP2lnVHoZnL5E3nC+pGdesKZNJaWRUg
 XCeNQIfSh891sPQBZ7StMb0KyXTMny+8PW1JuhKrJhreqx2KP5MAfhbvTSigPp8jJvpp
 qWBclleUWwgQvAfa7GGwRju42skDvGJW8uXLEND/F1I4z5OkqG4L6litpqj8uAb2kBdr
 XFRh573Fl8eEj/nIW4X/sOv1gIfJme6TQ5XJ7G2xCI/+++kmhAhNr5fXmQ21HhFp/cdb
 kRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725065028; x=1725669828;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jKys/joTXpfZhwIK7WZYB+S0gWaRcW4vQQYF7K5JoYU=;
 b=K0qETz++HNUC40tK3wkyl7GUc3FsDkeyu3S6m1gFpQzM8mfPkuufKG/z8WAZ5pxKcL
 /riEdR/OsVQcpMjJtEgQbRNAWC5ctyebU9RUYpKcqAbliaAYNAJj+OZ/yy6Jo5FSDTSJ
 khOrm+AKRXPM/PWCtqiW59dvKBV+Omr6Rwm6elK1KZAPj+mNugUrGP2gy1EoT+Bvq6vb
 OruHSQxf2Roj/qftne1h+yby3hs+DkWUY78l0WlFxObBgp3ENn7+gSpGD1P6YwAtccxO
 n4djfwhClsezNAeVaADJceV5SlCG+VosZ7V8nlddG9fylpbWyrz5JwAXoY8INsFQ/c1N
 l17A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX43NoCjuSWPwO6QqLgn+n5H2Qd065MMTumUKM+iAEW62nGQR4LbgMW8okdLA8EjPJ8ZN5a3qtawOE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxmGExhWFpFttd02eDnmFkHX90IHIqeURdJJnUuMzxIPl1bTXG
 fjNDPOsXW74qMYJ3J8CAxJIyNI5laloCGKqUbT+0o1VEi1p8KQHrcvaW58R2HHi7ezJCxE7xdF6
 1hiOIehAh786KniRXucYaYg==
X-Google-Smtp-Source: AGHT+IEP9h/T/b2TDoRsNPvD8OrnhsPa1JJNyOh9WVxRax47/ulcraGc7q6+qsDZyEAq7CCaWYiLVoEr/5fe/OVsUQ==
X-Received: from almasrymina.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:4bc5])
 (user=almasrymina job=sendgmr) by 2002:a05:690c:47ca:b0:6ad:feb0:d01c with
 SMTP id 00721157ae682-6d40f342178mr76997b3.3.1725065027663; Fri, 30 Aug 2024
 17:43:47 -0700 (PDT)
Date: Sat, 31 Aug 2024 00:43:13 +0000
In-Reply-To: <20240831004313.3713467-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20240831004313.3713467-1-almasrymina@google.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Message-ID: <20240831004313.3713467-14-almasrymina@google.com>
Subject: [PATCH net-next v24 13/13] netdev: add dmabuf introspection
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Cc: Mina Almasry <almasrymina@google.com>,
 Donald Hunter <donald.hunter@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>,
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

Add dmabuf information to page_pool stats:

$ ./cli.py --spec ../netlink/specs/netdev.yaml --dump page-pool-get
...
 {'dmabuf': 10,
  'id': 456,
  'ifindex': 3,
  'inflight': 1023,
  'inflight-mem': 4190208},
 {'dmabuf': 10,
  'id': 455,
  'ifindex': 3,
  'inflight': 1023,
  'inflight-mem': 4190208},
 {'dmabuf': 10,
  'id': 454,
  'ifindex': 3,
  'inflight': 1023,
  'inflight-mem': 4190208},
 {'dmabuf': 10,
  'id': 453,
  'ifindex': 3,
  'inflight': 1023,
  'inflight-mem': 4190208},
 {'dmabuf': 10,
  'id': 452,
  'ifindex': 3,
  'inflight': 1023,
  'inflight-mem': 4190208},
 {'dmabuf': 10,
  'id': 451,
  'ifindex': 3,
  'inflight': 1023,
  'inflight-mem': 4190208},
 {'dmabuf': 10,
  'id': 450,
  'ifindex': 3,
  'inflight': 1023,
  'inflight-mem': 4190208},
 {'dmabuf': 10,
  'id': 449,
  'ifindex': 3,
  'inflight': 1023,
  'inflight-mem': 4190208},

And queue stats:

$ ./cli.py --spec ../netlink/specs/netdev.yaml --dump queue-get
...
{'dmabuf': 10, 'id': 8, 'ifindex': 3, 'type': 'rx'},
{'dmabuf': 10, 'id': 9, 'ifindex': 3, 'type': 'rx'},
{'dmabuf': 10, 'id': 10, 'ifindex': 3, 'type': 'rx'},
{'dmabuf': 10, 'id': 11, 'ifindex': 3, 'type': 'rx'},
{'dmabuf': 10, 'id': 12, 'ifindex': 3, 'type': 'rx'},
{'dmabuf': 10, 'id': 13, 'ifindex': 3, 'type': 'rx'},
{'dmabuf': 10, 'id': 14, 'ifindex': 3, 'type': 'rx'},
{'dmabuf': 10, 'id': 15, 'ifindex': 3, 'type': 'rx'},

Suggested-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Jakub Kicinski <kuba@kernel.org>

---

v24:
- Code cleanup, no cast and use 1 if statement (Jakub)

---
 Documentation/netlink/specs/netdev.yaml | 10 ++++++++++
 include/uapi/linux/netdev.h             |  2 ++
 net/core/netdev-genl.c                  |  7 +++++++
 net/core/page_pool_user.c               |  4 ++++
 tools/include/uapi/linux/netdev.h       |  2 ++
 5 files changed, 25 insertions(+)

diff --git a/Documentation/netlink/specs/netdev.yaml b/Documentation/netlink/specs/netdev.yaml
index 0c747530c275..08412c279297 100644
--- a/Documentation/netlink/specs/netdev.yaml
+++ b/Documentation/netlink/specs/netdev.yaml
@@ -167,6 +167,10 @@ attribute-sets:
           "re-attached", they are just waiting to disappear.
           Attribute is absent if Page Pool has not been detached, and
           can still be used to allocate new memory.
+      -
+        name: dmabuf
+        doc: ID of the dmabuf this page-pool is attached to.
+        type: u32
   -
     name: page-pool-info
     subset-of: page-pool
@@ -268,6 +272,10 @@ attribute-sets:
         name: napi-id
         doc: ID of the NAPI instance which services this queue.
         type: u32
+      -
+        name: dmabuf
+        doc: ID of the dmabuf attached to this queue, if any.
+        type: u32
 
   -
     name: qstats
@@ -543,6 +551,7 @@ operations:
             - inflight
             - inflight-mem
             - detach-time
+            - dmabuf
       dump:
         reply: *pp-reply
       config-cond: page-pool
@@ -607,6 +616,7 @@ operations:
             - type
             - napi-id
             - ifindex
+            - dmabuf
       dump:
         request:
           attributes:
diff --git a/include/uapi/linux/netdev.h b/include/uapi/linux/netdev.h
index 91bf3ecc5f1d..7c308f04e7a0 100644
--- a/include/uapi/linux/netdev.h
+++ b/include/uapi/linux/netdev.h
@@ -93,6 +93,7 @@ enum {
 	NETDEV_A_PAGE_POOL_INFLIGHT,
 	NETDEV_A_PAGE_POOL_INFLIGHT_MEM,
 	NETDEV_A_PAGE_POOL_DETACH_TIME,
+	NETDEV_A_PAGE_POOL_DMABUF,
 
 	__NETDEV_A_PAGE_POOL_MAX,
 	NETDEV_A_PAGE_POOL_MAX = (__NETDEV_A_PAGE_POOL_MAX - 1)
@@ -131,6 +132,7 @@ enum {
 	NETDEV_A_QUEUE_IFINDEX,
 	NETDEV_A_QUEUE_TYPE,
 	NETDEV_A_QUEUE_NAPI_ID,
+	NETDEV_A_QUEUE_DMABUF,
 
 	__NETDEV_A_QUEUE_MAX,
 	NETDEV_A_QUEUE_MAX = (__NETDEV_A_QUEUE_MAX - 1)
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index 582b67dd921b..2e5086950385 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -293,6 +293,7 @@ static int
 netdev_nl_queue_fill_one(struct sk_buff *rsp, struct net_device *netdev,
 			 u32 q_idx, u32 q_type, const struct genl_info *info)
 {
+	struct net_devmem_dmabuf_binding *binding;
 	struct netdev_rx_queue *rxq;
 	struct netdev_queue *txq;
 	void *hdr;
@@ -312,6 +313,12 @@ netdev_nl_queue_fill_one(struct sk_buff *rsp, struct net_device *netdev,
 		if (rxq->napi && nla_put_u32(rsp, NETDEV_A_QUEUE_NAPI_ID,
 					     rxq->napi->napi_id))
 			goto nla_put_failure;
+
+		binding = rxq->mp_params.mp_priv;
+		if (binding && nla_put_u32(rsp, NETDEV_A_QUEUE_DMABUF,
+					   binding->id))
+				goto nla_put_failure;
+
 		break;
 	case NETDEV_QUEUE_TYPE_TX:
 		txq = netdev_get_tx_queue(netdev, q_idx);
diff --git a/net/core/page_pool_user.c b/net/core/page_pool_user.c
index ce5167eb5548..92d8b1d1022a 100644
--- a/net/core/page_pool_user.c
+++ b/net/core/page_pool_user.c
@@ -213,6 +213,7 @@ static int
 page_pool_nl_fill(struct sk_buff *rsp, const struct page_pool *pool,
 		  const struct genl_info *info)
 {
+	struct net_devmem_dmabuf_binding *binding = pool->mp_priv;
 	size_t inflight, refsz;
 	void *hdr;
 
@@ -242,6 +243,9 @@ page_pool_nl_fill(struct sk_buff *rsp, const struct page_pool *pool,
 			 pool->user.detach_time))
 		goto err_cancel;
 
+	if (binding && nla_put_u32(rsp, NETDEV_A_PAGE_POOL_DMABUF, binding->id))
+		goto err_cancel;
+
 	genlmsg_end(rsp, hdr);
 
 	return 0;
diff --git a/tools/include/uapi/linux/netdev.h b/tools/include/uapi/linux/netdev.h
index 91bf3ecc5f1d..7c308f04e7a0 100644
--- a/tools/include/uapi/linux/netdev.h
+++ b/tools/include/uapi/linux/netdev.h
@@ -93,6 +93,7 @@ enum {
 	NETDEV_A_PAGE_POOL_INFLIGHT,
 	NETDEV_A_PAGE_POOL_INFLIGHT_MEM,
 	NETDEV_A_PAGE_POOL_DETACH_TIME,
+	NETDEV_A_PAGE_POOL_DMABUF,
 
 	__NETDEV_A_PAGE_POOL_MAX,
 	NETDEV_A_PAGE_POOL_MAX = (__NETDEV_A_PAGE_POOL_MAX - 1)
@@ -131,6 +132,7 @@ enum {
 	NETDEV_A_QUEUE_IFINDEX,
 	NETDEV_A_QUEUE_TYPE,
 	NETDEV_A_QUEUE_NAPI_ID,
+	NETDEV_A_QUEUE_DMABUF,
 
 	__NETDEV_A_QUEUE_MAX,
 	NETDEV_A_QUEUE_MAX = (__NETDEV_A_QUEUE_MAX - 1)
-- 
2.46.0.469.g59c65b2a67-goog

