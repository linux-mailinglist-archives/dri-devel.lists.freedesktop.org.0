Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD23973E76
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 19:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B181210E8A0;
	Tue, 10 Sep 2024 17:15:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="dloGX3Sa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com
 [209.85.128.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D4B10E89D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 17:15:20 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-6d9353e1360so30397777b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 10:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1725988520; x=1726593320;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=sdOXB2LFY1U7Whl+dw/pp7B7g7zmM9tRRPBgefo/nXc=;
 b=dloGX3Sanhzf9ql7QL6d1iGFDpb4TGeDo+ODBTenYnIBXha4Ufg2UimT3Q2OnBk07e
 9Yj5wWaLjpREzKJyPnYAL6/kF62M01Tc91UHpLdYNKLp6NznpsUvreqfuhOXChV/BehN
 Mj32V5L7WSvgx/+DVnGwqO1YQKqU7HWshg+Xkc0jj5iyhP2u2CbmZnTpkbOw+bllLhJq
 aMsblfkm6/pZmv2R2xynvK1+8hsdsacA12HvFRcMMx4+AUWsVhC3AderLww1a71vQ3Pj
 M5wPUMMdWEP42M8aoET8f8JMiwBiHpbaE2fs3BmBpfs/b1k0rwi5Iw3xm+Tg97LWCMiO
 3fTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725988520; x=1726593320;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sdOXB2LFY1U7Whl+dw/pp7B7g7zmM9tRRPBgefo/nXc=;
 b=r/pAFsi3AjH3o2Efjd/5bAz3Rb7qIfdmFhQuTjdgkaput9RbYEhm/1uMzj4gdzwHZG
 lDzD30VplzSx/YUT2pWNRLeeZYFVASu3LtxougSTwovSmxAtMnLSp4VvGuoVbbE/67RS
 urrXQIPIYsQYOt+JmXfGM0WvQ2rTaOr5cr0koNoA6tTFDiiEio6MuxtDNxha3AuaGNWe
 WoDUt2WEPfmeXjEZejhMm2Y3RYY2/M8scvZ/Dg7zuBG4iifFLQqbfTDCc4tKE+qtIrLm
 KY30YO15+U6TZvSs7TxpEL8O98o7XbF/TBb3WWCn+EWUnkUsBgzytH9P9jn+g5vrAhnB
 sVFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbTtysU7hiitTPsXRf2inFZcGjmUxyCQIL9OoCifLa9U0MmoCePhkInjAjUwZeiBqGw0fEmgiZWt8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywn3xEM3nyLrkGCXVWoNJ2TL+s0+bR8uZgCBlZPdRMOOfTYgsZ6
 6UzSw1d8Tq9xsl77HnhXgAW8i3wlontBOX5A17p/8tB0HGaRfk7/iMqWx5M6Tc7SlPY5ej/UuRe
 dBjIzKLKG1kC8pi1150BmLQ==
X-Google-Smtp-Source: AGHT+IGOCfxtxOEWkMf6F1XW1Cpo/N+WlxqPoBDoDrv4Oan+6cn72iQeLi0hRvSk31B40joXaJvdcGVXnQI0nNrQPA==
X-Received: from almasrymina.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:4bc5])
 (user=almasrymina job=sendgmr) by 2002:a05:690c:f8b:b0:69a:536:afde with SMTP
 id 00721157ae682-6dba6e1440bmr59027b3.5.1725988519740; Tue, 10 Sep 2024
 10:15:19 -0700 (PDT)
Date: Tue, 10 Sep 2024 17:14:54 +0000
In-Reply-To: <20240910171458.219195-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20240910171458.219195-1-almasrymina@google.com>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
Message-ID: <20240910171458.219195-11-almasrymina@google.com>
Subject: [PATCH net-next v26 10/13] net: add SO_DEVMEM_DONTNEED setsockopt to
 release RX frags
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
 Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>, 
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
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

Add an interface for the user to notify the kernel that it is done
reading the devmem dmabuf frags returned as cmsg. The kernel will
drop the reference on the frags to make them available for reuse.

Signed-off-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>
Reviewed-by: Eric Dumazet <edumazet@google.com>

---

v16:
- Use sk_is_tcp().
- Fix unnamed 128 DONTNEED limit (David).
- Fix kernel allocating for 128 tokens even if the user didn't ask for
  that much (Eric).
- Fix number assignement (Arnd).

v10:
- Fix leak of tokens (Nikolay).

v7:
- Updated SO_DEVMEM_* uapi to use the next available entry (Arnd).

v6:
- Squash in locking optimizations from edumazet@google.com. With his
  changes we lock the xarray once per sock_devmem_dontneed operation
  rather than once per frag.

Changes in v1:
- devmemtoken -> dmabuf_token (David).
- Use napi_pp_put_page() for refcounting (Yunsheng).
- Fix build error with missing socket options on other asms.

---
 arch/alpha/include/uapi/asm/socket.h  |  1 +
 arch/mips/include/uapi/asm/socket.h   |  1 +
 arch/parisc/include/uapi/asm/socket.h |  1 +
 arch/sparc/include/uapi/asm/socket.h  |  1 +
 include/uapi/asm-generic/socket.h     |  1 +
 include/uapi/linux/uio.h              |  5 ++
 net/core/sock.c                       | 68 +++++++++++++++++++++++++++
 7 files changed, 78 insertions(+)

diff --git a/arch/alpha/include/uapi/asm/socket.h b/arch/alpha/include/uapi/asm/socket.h
index ef4656a41058..251b73c5481e 100644
--- a/arch/alpha/include/uapi/asm/socket.h
+++ b/arch/alpha/include/uapi/asm/socket.h
@@ -144,6 +144,7 @@
 #define SCM_DEVMEM_LINEAR	SO_DEVMEM_LINEAR
 #define SO_DEVMEM_DMABUF	79
 #define SCM_DEVMEM_DMABUF	SO_DEVMEM_DMABUF
+#define SO_DEVMEM_DONTNEED	80
 
 #if !defined(__KERNEL__)
 
diff --git a/arch/mips/include/uapi/asm/socket.h b/arch/mips/include/uapi/asm/socket.h
index 414807d55e33..8ab7582291ab 100644
--- a/arch/mips/include/uapi/asm/socket.h
+++ b/arch/mips/include/uapi/asm/socket.h
@@ -155,6 +155,7 @@
 #define SCM_DEVMEM_LINEAR	SO_DEVMEM_LINEAR
 #define SO_DEVMEM_DMABUF	79
 #define SCM_DEVMEM_DMABUF	SO_DEVMEM_DMABUF
+#define SO_DEVMEM_DONTNEED	80
 
 #if !defined(__KERNEL__)
 
diff --git a/arch/parisc/include/uapi/asm/socket.h b/arch/parisc/include/uapi/asm/socket.h
index 2b817efd4544..38fc0b188e08 100644
--- a/arch/parisc/include/uapi/asm/socket.h
+++ b/arch/parisc/include/uapi/asm/socket.h
@@ -136,6 +136,7 @@
 #define SCM_DEVMEM_LINEAR	SO_DEVMEM_LINEAR
 #define SO_DEVMEM_DMABUF	79
 #define SCM_DEVMEM_DMABUF	SO_DEVMEM_DMABUF
+#define SO_DEVMEM_DONTNEED	80
 
 #if !defined(__KERNEL__)
 
diff --git a/arch/sparc/include/uapi/asm/socket.h b/arch/sparc/include/uapi/asm/socket.h
index 00248fc68977..57084ed2f3c4 100644
--- a/arch/sparc/include/uapi/asm/socket.h
+++ b/arch/sparc/include/uapi/asm/socket.h
@@ -137,6 +137,7 @@
 #define SCM_DEVMEM_LINEAR        SO_DEVMEM_LINEAR
 #define SO_DEVMEM_DMABUF         0x0058
 #define SCM_DEVMEM_DMABUF        SO_DEVMEM_DMABUF
+#define SO_DEVMEM_DONTNEED       0x0059
 
 #if !defined(__KERNEL__)
 
diff --git a/include/uapi/asm-generic/socket.h b/include/uapi/asm-generic/socket.h
index e993edc9c0ee..3b4e3e815602 100644
--- a/include/uapi/asm-generic/socket.h
+++ b/include/uapi/asm-generic/socket.h
@@ -139,6 +139,7 @@
 #define SCM_DEVMEM_LINEAR	SO_DEVMEM_LINEAR
 #define SO_DEVMEM_DMABUF	79
 #define SCM_DEVMEM_DMABUF	SO_DEVMEM_DMABUF
+#define SO_DEVMEM_DONTNEED	80
 
 #if !defined(__KERNEL__)
 
diff --git a/include/uapi/linux/uio.h b/include/uapi/linux/uio.h
index 3a22ddae376a..649739e0c404 100644
--- a/include/uapi/linux/uio.h
+++ b/include/uapi/linux/uio.h
@@ -33,6 +33,11 @@ struct dmabuf_cmsg {
 				 */
 };
 
+struct dmabuf_token {
+	__u32 token_start;
+	__u32 token_count;
+};
+
 /*
  *	UIO_MAXIOV shall be at least 16 1003.1g (5.4.1.1)
  */
diff --git a/net/core/sock.c b/net/core/sock.c
index 468b1239606c..bbb57b5af0b1 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -124,6 +124,7 @@
 #include <linux/netdevice.h>
 #include <net/protocol.h>
 #include <linux/skbuff.h>
+#include <linux/skbuff_ref.h>
 #include <net/net_namespace.h>
 #include <net/request_sock.h>
 #include <net/sock.h>
@@ -1049,6 +1050,69 @@ static int sock_reserve_memory(struct sock *sk, int bytes)
 	return 0;
 }
 
+#ifdef CONFIG_PAGE_POOL
+
+/* This is the number of tokens that the user can SO_DEVMEM_DONTNEED in
+ * 1 syscall. The limit exists to limit the amount of memory the kernel
+ * allocates to copy these tokens.
+ */
+#define MAX_DONTNEED_TOKENS 128
+
+static noinline_for_stack int
+sock_devmem_dontneed(struct sock *sk, sockptr_t optval, unsigned int optlen)
+{
+	unsigned int num_tokens, i, j, k, netmem_num = 0;
+	struct dmabuf_token *tokens;
+	netmem_ref netmems[16];
+	int ret = 0;
+
+	if (!sk_is_tcp(sk))
+		return -EBADF;
+
+	if (optlen % sizeof(struct dmabuf_token) ||
+	    optlen > sizeof(*tokens) * MAX_DONTNEED_TOKENS)
+		return -EINVAL;
+
+	tokens = kvmalloc_array(optlen, sizeof(*tokens), GFP_KERNEL);
+	if (!tokens)
+		return -ENOMEM;
+
+	num_tokens = optlen / sizeof(struct dmabuf_token);
+	if (copy_from_sockptr(tokens, optval, optlen)) {
+		kvfree(tokens);
+		return -EFAULT;
+	}
+
+	xa_lock_bh(&sk->sk_user_frags);
+	for (i = 0; i < num_tokens; i++) {
+		for (j = 0; j < tokens[i].token_count; j++) {
+			netmem_ref netmem = (__force netmem_ref)__xa_erase(
+				&sk->sk_user_frags, tokens[i].token_start + j);
+
+			if (netmem &&
+			    !WARN_ON_ONCE(!netmem_is_net_iov(netmem))) {
+				netmems[netmem_num++] = netmem;
+				if (netmem_num == ARRAY_SIZE(netmems)) {
+					xa_unlock_bh(&sk->sk_user_frags);
+					for (k = 0; k < netmem_num; k++)
+						WARN_ON_ONCE(!napi_pp_put_page(netmems[k]));
+					netmem_num = 0;
+					xa_lock_bh(&sk->sk_user_frags);
+				}
+				ret++;
+			}
+		}
+	}
+
+	xa_unlock_bh(&sk->sk_user_frags);
+	for (k = 0; k < netmem_num; k++)
+		WARN_ON_ONCE(!napi_pp_put_page(netmems[k]));
+
+	kvfree(tokens);
+	return ret;
+}
+#endif
+
 void sockopt_lock_sock(struct sock *sk)
 {
 	/* When current->bpf_ctx is set, the setsockopt is called from
@@ -1211,6 +1275,10 @@ int sk_setsockopt(struct sock *sk, int level, int optname,
 			ret = -EOPNOTSUPP;
 		return ret;
 		}
+#ifdef CONFIG_PAGE_POOL
+	case SO_DEVMEM_DONTNEED:
+		return sock_devmem_dontneed(sk, optval, optlen);
+#endif
 	}
 
 	sockopt_lock_sock(sk);
-- 
2.46.0.598.g6f2099f65c-goog

