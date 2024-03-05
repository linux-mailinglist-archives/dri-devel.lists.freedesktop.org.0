Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4AE871295
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 03:02:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33547112824;
	Tue,  5 Mar 2024 02:02:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="oQbxW20h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com
 [209.85.219.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190EC112820
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 02:02:05 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id
 3f1490d57ef6-dcdc3db67f0so7076861276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 18:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709604124; x=1710208924;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=G9Y5Scp28ZqCYcu39ok93LJAzx/1WlCB4rvVWoIV5aE=;
 b=oQbxW20hvh9ov6f4x2DxpmtulBMQRw0eTpFplxqBzH78W1rxOjAsmdOxDZMnSbs6Fp
 0GFuK4MJou4CbaNdgNEpmK+deMaUqh3TABB4cU0g/Q4NJ6UEhdc0wyThrKmOO1dyRlAD
 vUd6JFqWDhEE5q7D8RRV6+AQkWbTU421l5ksEcXrROkEdMLiS4yZainEnss5dO/iAz0T
 wWjtYV8iCgCUebHbgWgBYhu53uYdHWXPd2B1qvhUMB/gL1qbgnAzBksFMpRM/VvReTiF
 ChAHlhVupbEMj/5TvP+KGDkGu5H7lqPobJiOGuInrC5Z38tMh9lbkG+EtKrNBUh5m1o0
 fB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709604124; x=1710208924;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G9Y5Scp28ZqCYcu39ok93LJAzx/1WlCB4rvVWoIV5aE=;
 b=kMFqHwc3LXTPcw//cWWF8zV47KBiZ8e2R2smU/cswrJCtni4NqM9CNjLpGD+IKX1+1
 hLI3xS2yWP9xZ6XvNzKlqmah1wkuIfkWrd5y7JW+cx/LLnkVFZB6I4+lY3pMSCun03Pe
 qgl8hjGq3K6GXQ9zOdzkCo82ow+feEIvpgQHgdjUxg9pFLIBDY81A2JO6r5y7b0ZQfzB
 QMKllzuhRh1RljfXMgxnodjTdf7naZv3zPhdvMoFZ8GESR9aiFAlrCV+XIcAvDemQUfE
 9woZ6LErFKU+TtxFIm6pQlyPjcGobuSge9vXkjAGYiCv3EJ9lOVcW/a6SMvgKuqG7HFZ
 oMXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWR1ZnBIjL5S7b0u82CN1UW508TctT9c147U4i1sB+TwG6huZQvHbYBuBsp5I7OfTBpHIr/2wFmCCFadlV8+PbJOH9gNE5ibsGF2iGsrAu
X-Gm-Message-State: AOJu0Ywzxe5+zfd0HfGh5aK+CcPzA1aE/cJtJOOYUK7rM3vAQcybt4nR
 +iKrH3CGnFEfHWZ2ugu9NyVCEkljiN5gEH9IdEXyYWpfeJthjs2+HMzWPVW/W+zHYStVb1HGmG6
 HQiEwSkJLSiux1ke5+UYW6w==
X-Google-Smtp-Source: AGHT+IEWVOX8ecOfPBAQKvSAdDi7mXxA37voW2PjP2/k7/WW1wkAZw+RIjB2g4prAu6X3Z9fh0hm2+1kWtRsqaYHTQ==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:b614:914c:63cd:3830])
 (user=almasrymina job=sendgmr) by 2002:a25:690d:0:b0:dcc:5463:49a8 with SMTP
 id e13-20020a25690d000000b00dcc546349a8mr245459ybc.6.1709604123917; Mon, 04
 Mar 2024 18:02:03 -0800 (PST)
Date: Mon,  4 Mar 2024 18:01:38 -0800
In-Reply-To: <20240305020153.2787423-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20240305020153.2787423-1-almasrymina@google.com>
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
Message-ID: <20240305020153.2787423-4-almasrymina@google.com>
Subject: [RFC PATCH net-next v6 03/15] net: page_pool: factor out page_pool
 recycle check
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
 Jiri Olsa <jolsa@kernel.org>, David Ahern <dsahern@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
 Pavel Begunkov <asml.silence@gmail.com>, 
 David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yunsheng Lin <linyunsheng@huawei.com>, 
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>, 
 Shakeel Butt <shakeelb@google.com>, Jeroen de Borst <jeroendb@google.com>, 
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

The check is duplicated in 2 places, factor it out into a common helper.

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/core/page_pool.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index 8776fcad064a..fe9de4ecce94 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -684,6 +684,11 @@ static bool page_pool_recycle_in_cache(struct page *page,
 	return true;
 }
 
+static bool __page_pool_page_can_be_recycled(const struct page *page)
+{
+	return page_ref_count(page) == 1 && !page_is_pfmemalloc(page);
+}
+
 /* If the page refcnt == 1, this will try to recycle the page.
  * if PP_FLAG_DMA_SYNC_DEV is set, we'll try to sync the DMA area for
  * the configured size min(dma_sync_size, pool->max_len).
@@ -705,7 +710,7 @@ __page_pool_put_page(struct page_pool *pool, struct page *page,
 	 * page is NOT reusable when allocated when system is under
 	 * some pressure. (page_is_pfmemalloc)
 	 */
-	if (likely(page_ref_count(page) == 1 && !page_is_pfmemalloc(page))) {
+	if (likely(__page_pool_page_can_be_recycled(page))) {
 		/* Read barrier done in page_ref_count / READ_ONCE */
 
 		if (pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
@@ -820,7 +825,7 @@ static struct page *page_pool_drain_frag(struct page_pool *pool,
 	if (likely(page_pool_unref_page(page, drain_count)))
 		return NULL;
 
-	if (page_ref_count(page) == 1 && !page_is_pfmemalloc(page)) {
+	if (__page_pool_page_can_be_recycled(page)) {
 		if (pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
 			page_pool_dma_sync_for_device(pool, page, -1);
 
-- 
2.44.0.rc1.240.g4c46232300-goog

