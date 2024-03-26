Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A17088D1AC
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 23:51:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C306D10F46E;
	Tue, 26 Mar 2024 22:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="rFHvmS7m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com
 [209.85.128.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FA910F454
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 22:51:15 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-60cd62fa20fso121029687b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 15:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1711493475; x=1712098275;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=CZzmmX233kO6dJHGiFcs8o01xSEeeqyqo5FiT9OgEo8=;
 b=rFHvmS7m6Ucuayzj1VWcpfPlxCaiGR0SSEHDPBEMIkYzStamTCKDj8zFCVuB2COKVE
 NSy5lhbOsonKUhNF4WC2/En1Kaf+G6dDXN8eneYMduS4gB6u9tcXCayI81rjU/OP2dKa
 nWB8+NcV+4v7uUrdXmLho3VWdSsF/MP7jEZjUeUBjHnncT80pHEOr3Mk0Lz/7GFAJUl3
 ISQ3U0d2tL3qdCemIXSd7MUmI71nSKpTcoGWn3OFhYJdAhx/Ouye7fqqTZ5ZxQqe1x/H
 00ScHJ/Zh82ybQVjd58f+3hj2SI8V64QxMKDOhlJ3uqA3f58iItC4PNNv3hbImgpypOi
 HPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711493475; x=1712098275;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CZzmmX233kO6dJHGiFcs8o01xSEeeqyqo5FiT9OgEo8=;
 b=RxZQ5uAPbttB/86rP2Q3zpeE9AlBwalvGRTIdaJb+XSC3fXsHZvtoNyjadg2v1mYE6
 MQ5+K8J6SKsM0KBfq/5ryzcAeVtxv6s5zT6cMIybXRg/Os3cu4+k0LF7InHl3cyYMT8n
 R8FJtP01gLm7bHe/Q5bqzPDgv2cHFKTUrLj5DuHzBb09gJg1v4aGFAKSx/7+ig8/AGJj
 ha2HfCM2WdcpwZSQFxYlAgqrBPUjhWvGKxRUCEGSxQ87UOG454dCLOcfRHKutIUFGiU7
 uEkjb2JqemnvKQuk60o99GrAriOxDf8jcGfeusa32h7ImwdFpIR487OKxxwFcGahsbw/
 DgMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU61Ob3H6O/xS+6q/KTfIiShcHe9iskEknQp2/qm33UPUatt2bYcVLj/Qz3ZhpC9uKfU6f9v8VKXDE43zufg3T/H+2TUAN81LBcQZl2accY
X-Gm-Message-State: AOJu0YyKfo6AXvCGE6yA5P/Va8xZT49VQAktrRMpfEa3P+wVqqLDkDZ5
 dG2eRGi/Gy+00qeE9Fd2AUdFIofKh4Mr53nvjH+54h7mShwU+yhIfGG3pKUm5KBURoAOilRbpAp
 CDY2S7gjKX4JXshK2eH9abg==
X-Google-Smtp-Source: AGHT+IEdweUGIR8RlliYPxgmCB5NPj7h583EZe+Yg+FD0SYphKZA41Usogavdhs3vjHXEwXSKCTDdpaqjb4oBXVhgQ==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:c51e:bdd0:7cc8:695c])
 (user=almasrymina job=sendgmr) by 2002:a05:690c:b9e:b0:611:28f9:aa21 with
 SMTP id ck30-20020a05690c0b9e00b0061128f9aa21mr2572176ywb.4.1711493474784;
 Tue, 26 Mar 2024 15:51:14 -0700 (PDT)
Date: Tue, 26 Mar 2024 15:50:40 -0700
In-Reply-To: <20240326225048.785801-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20240326225048.785801-1-almasrymina@google.com>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Message-ID: <20240326225048.785801-10-almasrymina@google.com>
Subject: [RFC PATCH net-next v7 09/14] net: support non paged skb frags
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
 Pavel Begunkov <asml.silence@gmail.com>, 
 David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yunsheng Lin <linyunsheng@huawei.com>, 
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst <jeroendb@google.com>, 
 Praveen Kaligineedi <pkaligineedi@google.com>
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

Make skb_frag_page() fail in the case where the frag is not backed
by a page, and fix its relevant callers to handle this case.

Signed-off-by: Mina Almasry <almasrymina@google.com>


---

v6:
- Rebased on top of the merged netmem changes.

Changes in v1:
- Fix illegal_highdma() (Yunsheng).
- Rework napi_pp_put_page() slightly to reduce code churn (Willem).

---
 include/linux/skbuff.h | 53 +++++++++++++++++++++++++++++++++++-------
 net/core/dev.c         |  3 ++-
 net/core/gro.c         |  3 ++-
 net/core/skbuff.c      | 11 +++++++++
 net/ipv4/esp4.c        |  2 +-
 net/ipv4/tcp.c         |  3 +++
 net/ipv6/esp6.c        |  2 +-
 7 files changed, 65 insertions(+), 12 deletions(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 78659c8efa4e..8143aee8d911 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -3483,17 +3483,53 @@ static inline void skb_frag_off_copy(skb_frag_t *fragto,
 	fragto->offset = fragfrom->offset;
 }
 
+/* Returns true if the skb_frag contains a net_iov. */
+static inline bool skb_frag_is_net_iov(const skb_frag_t *frag)
+{
+	return netmem_is_net_iov(frag->netmem);
+}
+
+/**
+ * skb_frag_net_iov - retrieve the net_iov referred to by fragment
+ * @frag: the fragment
+ *
+ * Returns the &struct net_iov associated with @frag. Returns NULL if this
+ * frag has no associated net_iov.
+ */
+static inline struct net_iov *skb_frag_net_iov(const skb_frag_t *frag)
+{
+	if (!skb_frag_is_net_iov(frag))
+		return NULL;
+
+	return netmem_to_net_iov(frag->netmem);
+}
+
 /**
  * skb_frag_page - retrieve the page referred to by a paged fragment
  * @frag: the paged fragment
  *
- * Returns the &struct page associated with @frag.
+ * Returns the &struct page associated with @frag. Returns NULL if this frag
+ * has no associated page.
  */
 static inline struct page *skb_frag_page(const skb_frag_t *frag)
 {
+	if (skb_frag_is_net_iov(frag))
+		return NULL;
+
 	return netmem_to_page(frag->netmem);
 }
 
+/**
+ * skb_frag_netmem - retrieve the netmem referred to by a fragment
+ * @frag: the fragment
+ *
+ * Returns the &netmem_ref associated with @frag.
+ */
+static inline netmem_ref skb_frag_netmem(const skb_frag_t *frag)
+{
+	return frag->netmem;
+}
+
 /**
  * __skb_frag_ref - take an addition reference on a paged fragment.
  * @frag: the paged fragment
@@ -3524,25 +3560,23 @@ int skb_cow_data_for_xdp(struct page_pool *pool, struct sk_buff **pskb,
 bool napi_pp_put_page(netmem_ref netmem, bool napi_safe);
 
 static inline void
-skb_page_unref(const struct sk_buff *skb, struct page *page, bool napi_safe)
+skb_page_unref(const struct sk_buff *skb, netmem_ref netmem, bool napi_safe)
 {
 #ifdef CONFIG_PAGE_POOL
-	if (skb->pp_recycle && napi_pp_put_page(page, napi_safe))
+	if (skb->pp_recycle && napi_pp_put_page(netmem, napi_safe))
 		return;
 #endif
-	put_page(page);
+	put_page(netmem_to_page(netmem));
 }
 
 static inline void
 napi_frag_unref(skb_frag_t *frag, bool recycle, bool napi_safe)
 {
-	struct page *page = skb_frag_page(frag);
-
 #ifdef CONFIG_PAGE_POOL
-	if (recycle && napi_pp_put_page(page_to_netmem(page), napi_safe))
+	if (recycle && napi_pp_put_page(skb_frag_netmem(frag), napi_safe))
 		return;
 #endif
-	put_page(page);
+	put_page(skb_frag_page(frag));
 }
 
 /**
@@ -3582,6 +3616,9 @@ static inline void skb_frag_unref(struct sk_buff *skb, int f)
  */
 static inline void *skb_frag_address(const skb_frag_t *frag)
 {
+	if (!skb_frag_page(frag))
+		return NULL;
+
 	return page_address(skb_frag_page(frag)) + skb_frag_off(frag);
 }
 
diff --git a/net/core/dev.c b/net/core/dev.c
index e10610698a0a..8228432cb600 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -3411,8 +3411,9 @@ static int illegal_highdma(struct net_device *dev, struct sk_buff *skb)
 	if (!(dev->features & NETIF_F_HIGHDMA)) {
 		for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
 			skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
+			struct page *page = skb_frag_page(frag);
 
-			if (PageHighMem(skb_frag_page(frag)))
+			if (page && PageHighMem(page))
 				return 1;
 		}
 	}
diff --git a/net/core/gro.c b/net/core/gro.c
index ee30d4f0c038..eef20c82c5c3 100644
--- a/net/core/gro.c
+++ b/net/core/gro.c
@@ -380,7 +380,8 @@ static inline void skb_gro_reset_offset(struct sk_buff *skb, u32 nhoff)
 	pinfo = skb_shinfo(skb);
 	frag0 = &pinfo->frags[0];
 
-	if (pinfo->nr_frags && !PageHighMem(skb_frag_page(frag0)) &&
+	if (pinfo->nr_frags && skb_frag_page(frag0) &&
+	    !PageHighMem(skb_frag_page(frag0)) &&
 	    (!NET_IP_ALIGN || !((skb_frag_off(frag0) + nhoff) & 3))) {
 		NAPI_GRO_CB(skb)->frag0 = skb_frag_address(frag0);
 		NAPI_GRO_CB(skb)->frag0_len = min_t(unsigned int,
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index b7e974f0ae51..b4ea842ac9c7 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -1375,6 +1375,14 @@ void skb_dump(const char *level, const struct sk_buff *skb, bool full_pkt)
 		struct page *p;
 		u8 *vaddr;
 
+		if (skb_frag_is_net_iov(frag)) {
+			printk("%sskb frag %d: not readable\n", level, i);
+			len -= frag->bv_len;
+			if (!len)
+				break;
+			continue;
+		}
+
 		skb_frag_foreach_page(frag, skb_frag_off(frag),
 				      skb_frag_size(frag), p, p_off, p_len,
 				      copied) {
@@ -3142,6 +3150,9 @@ static bool __skb_splice_bits(struct sk_buff *skb, struct pipe_inode_info *pipe,
 	for (seg = 0; seg < skb_shinfo(skb)->nr_frags; seg++) {
 		const skb_frag_t *f = &skb_shinfo(skb)->frags[seg];
 
+		if (WARN_ON_ONCE(!skb_frag_page(f)))
+			return false;
+
 		if (__splice_segment(skb_frag_page(f),
 				     skb_frag_off(f), skb_frag_size(f),
 				     offset, len, spd, false, sk, pipe))
diff --git a/net/ipv4/esp4.c b/net/ipv4/esp4.c
index d33d12421814..3b2a6a033efa 100644
--- a/net/ipv4/esp4.c
+++ b/net/ipv4/esp4.c
@@ -114,7 +114,7 @@ static void esp_ssg_unref(struct xfrm_state *x, void *tmp, struct sk_buff *skb)
 	 */
 	if (req->src != req->dst)
 		for (sg = sg_next(req->src); sg; sg = sg_next(sg))
-			skb_page_unref(skb, sg_page(sg), false);
+			skb_page_unref(skb, page_to_netmem(sg_page(sg)), false);
 }
 
 #ifdef CONFIG_INET_ESPINTCP
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index d20b62d52171..9f6497c53d61 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -2167,6 +2167,9 @@ static int tcp_zerocopy_receive(struct sock *sk,
 			break;
 		}
 		page = skb_frag_page(frags);
+		if (WARN_ON_ONCE(!page))
+			break;
+
 		prefetchw(page);
 		pages[pages_to_map++] = page;
 		length += PAGE_SIZE;
diff --git a/net/ipv6/esp6.c b/net/ipv6/esp6.c
index 7371886d4f9f..342c07f0c6c4 100644
--- a/net/ipv6/esp6.c
+++ b/net/ipv6/esp6.c
@@ -131,7 +131,7 @@ static void esp_ssg_unref(struct xfrm_state *x, void *tmp, struct sk_buff *skb)
 	 */
 	if (req->src != req->dst)
 		for (sg = sg_next(req->src); sg; sg = sg_next(sg))
-			skb_page_unref(skb, sg_page(sg), false);
+			skb_page_unref(skb, page_to_netmem(sg_page(sg)), false);
 }
 
 #ifdef CONFIG_INET6_ESPINTCP
-- 
2.44.0.396.g6e790dbe36-goog

