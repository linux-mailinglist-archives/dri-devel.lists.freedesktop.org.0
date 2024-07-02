Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE65B924271
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 17:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA12310E081;
	Tue,  2 Jul 2024 15:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="P76FXFws";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="jXBwNC94";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 383 seconds by postgrey-1.36 at gabe;
 Tue, 02 Jul 2024 15:32:01 UTC
Received: from flow4-smtp.messagingengine.com (flow4-smtp.messagingengine.com
 [103.168.172.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543E210E081
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 15:32:01 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailflow.nyi.internal (Postfix) with ESMTP id 5235820044E;
 Tue,  2 Jul 2024 11:25:37 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Tue, 02 Jul 2024 11:25:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm1; t=1719933937; x=1719941137; bh=//A1hzQZrR
 Fs+Jf7FIQ+nCDerLffGWLM2hRD5dKs7d4=; b=P76FXFwsOo7hAvN7FhkXZKuWg4
 cU69dSn5DMGs3t6BYkPyNRQrDLusjOTJmSfZoAwfvnZEhLIOqIv7lQIksCKvTATH
 1N5mlcMWWeTYEJCHEax1IrK93NmRKbOJshHxQGCynZi2Y/EhBpoPAFZtpAwVjl5b
 zaDGLYOCro18Zl8f5T/z0LH4fQHIpESjkdV0B8dATA6zWsid8Z7jybVSSW+Fq4sZ
 cVxbCOjzIQgBO2JqCPNGTsDocJJSWTL23MOWWHoF7JcO4vGouuvjHTAOymkHJRMU
 wO6osUpL5XkAq2Q6YooI73LwU9WBp0p/Hk7MstHgpUnkBDk5cOFutxHeENBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1719933937; x=1719941137; bh=//A1hzQZrRFs+Jf7FIQ+nCDerLff
 GWLM2hRD5dKs7d4=; b=jXBwNC94RZbs4uDVz+9TADBIiBywE834uNGinUBZl9Bw
 X7UUW/yTMDN9zrirZ1sp4CGbT6fr4Vd//SnjfpjZ4vCzWtbEGyuqufdOu5mJqfMO
 M8uyU1gI7Nflwb3pgDvbMhcOXHbRg/tZxRh+am/ECkm5rYp/rUK245UirtcqbMSW
 KhO70eJqrudEplbvGeVVmB+ECmaJDEwO8D2xCfEIfSzsFfPZjiG/WAecP1zJZuOs
 4XGxqXLf6CPtpPlaFMydUC4TSLh+loO0BejpkDxHsW8BkQOSCs9cLt81CDqkGOG8
 8SHn32sOoLtEQrZQzOlKf+CvjaQKywiwsJiqTGxGwA==
X-ME-Sender: <xms:7BuEZiZoiHpwbeiR8SdCQiCUgJflo7fj9MN7UTClHs2tJplgkJRJfg>
 <xme:7BuEZlaYpPjgjYQglVKTEOgl69qf-JLDm3RNum260VCELeCQmcH98DWh3-KdBqft3
 96D0bmbiW5QVCvwxrE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehgdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
 ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
 hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:7BuEZs94mrnHyr8v7-tTowCKzGIbJDL66cUQ-nMJsW29i7G_65E-dQ>
 <xmx:7BuEZkrWBvU1mf7jWRZ9kU7ZAabwUrZgJOWTz4W_8SKYprAKYfhjfw>
 <xmx:7BuEZtp962zRAIgElrOujPgc7sHVrLbHyZZTD1SKVPx4Gu-SfKoh2g>
 <xmx:7BuEZiQONYUgthjQMVxfi_qCDvAXnEtcwFMPsWQXG3dA5TWKes69gQ>
 <xmx:8RuEZr5Bq8INdRPstDZHKCuhLrGVJTRIqyW_xafSiAKawIdbvbq2rGJG>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A1149B60092; Tue,  2 Jul 2024 11:25:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-566-g3812ddbbc-fm-20240627.001-g3812ddbb
MIME-Version: 1.0
Message-Id: <35691b55-436c-4c52-b241-f0c5326227cb@app.fastmail.com>
In-Reply-To: <20240628003253.1694510-11-almasrymina@google.com>
References: <20240628003253.1694510-1-almasrymina@google.com>
 <20240628003253.1694510-11-almasrymina@google.com>
Date: Tue, 02 Jul 2024 17:25:11 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mina Almasry" <almasrymina@google.com>, Netdev <netdev@vger.kernel.org>, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>,
 "Donald Hunter" <donald.hunter@gmail.com>,
 "Jonathan Corbet" <corbet@lwn.net>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Ivan Kokshaysky" <ink@jurassic.park.msu.ru>,
 "Matt Turner" <mattst88@gmail.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Helge Deller" <deller@gmx.de>, "Andreas Larsson" <andreas@gaisler.com>,
 "Jesper Dangaard Brouer" <hawk@kernel.org>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>,
 "Steven Rostedt" <rostedt@goodmis.org>,
 "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>,
 "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>,
 "Martin KaFai Lau" <martin.lau@linux.dev>,
 "Eduard Zingerman" <eddyz87@gmail.com>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>,
 "John Fastabend" <john.fastabend@gmail.com>,
 "KP Singh" <kpsingh@kernel.org>, "Stanislav Fomichev" <sdf@fomichev.me>,
 "Hao Luo" <haoluo@google.com>, "Jiri Olsa" <jolsa@kernel.org>,
 "Steffen Klassert" <steffen.klassert@secunet.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>,
 "David Ahern" <dsahern@kernel.org>,
 "Willem de Bruijn" <willemdebruijn.kernel@gmail.com>,
 shuah <shuah@kernel.org>, "Sumit Semwal" <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Bagas Sanjaya" <bagasdotme@gmail.com>,
 "Christoph Hellwig" <hch@infradead.org>,
 "Nikolay Aleksandrov" <razor@blackwall.org>,
 "Pavel Begunkov" <asml.silence@gmail.com>, "David Wei" <dw@davidwei.uk>,
 "Jason Gunthorpe" <jgg@ziepe.ca>, "Yunsheng Lin" <linyunsheng@huawei.com>,
 "Shailend Chand" <shailend@google.com>,
 "Harshitha Ramamurthy" <hramamurthy@google.com>,
 "Shakeel Butt" <shakeel.butt@linux.dev>,
 "Jeroen de Borst" <jeroendb@google.com>,
 "Praveen Kaligineedi" <pkaligineedi@google.com>,
 "Willem de Bruijn" <willemb@google.com>,
 "Kaiyuan Zhang" <kaiyuanz@google.com>
Subject: Re: [PATCH net-next v15 10/14] tcp: RX path for devmem TCP
Content-Type: text/plain
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

On Fri, Jun 28, 2024, at 02:32, Mina Almasry wrote:
> --- a/arch/alpha/include/uapi/asm/socket.h
> +++ b/arch/alpha/include/uapi/asm/socket.h
> @@ -140,6 +140,11 @@
>  #define SO_PASSPIDFD		76
>  #define SO_PEERPIDFD		77
> 
> +#define SO_DEVMEM_LINEAR	78
> +#define SCM_DEVMEM_LINEAR	SO_DEVMEM_LINEAR
> +#define SO_DEVMEM_DMABUF	79
> +#define SCM_DEVMEM_DMABUF	SO_DEVMEM_DMABUF

Something is still wrong with the number assignment:

> --- a/arch/mips/include/uapi/asm/socket.h
> +++ b/arch/mips/include/uapi/asm/socket.h
> @@ -151,6 +151,11 @@
>  #define SO_PASSPIDFD		76
>  #define SO_PEERPIDFD		77
> 
> +#define SO_DEVMEM_LINEAR	78
> +#define SCM_DEVMEM_LINEAR	SO_DEVMEM_LINEAR
> +#define SO_DEVMEM_DMABUF	79
> +#define SCM_DEVMEM_DMABUF	SO_DEVMEM_DMABUF
> +
>  #if !defined(__KERNEL__)
> 
>  #if __BITS_PER_LONG == 64

so alpha and mips use the same numbering system as
the generic version for existing numbers

> diff --git a/arch/parisc/include/uapi/asm/socket.h 
> b/arch/parisc/include/uapi/asm/socket.h
> index be264c2b1a117..2b817efd45444 100644
> --- a/arch/parisc/include/uapi/asm/socket.h
> +++ b/arch/parisc/include/uapi/asm/socket.h
> @@ -132,6 +132,11 @@
>  #define SO_PASSPIDFD		0x404A
>  #define SO_PEERPIDFD		0x404B
> 
> +#define SO_DEVMEM_LINEAR	78
> +#define SCM_DEVMEM_LINEAR	SO_DEVMEM_LINEAR
> +#define SO_DEVMEM_DMABUF	79
> +#define SCM_DEVMEM_DMABUF	SO_DEVMEM_DMABUF

parisc uses a different number, but you start using the
generic version here. This is probably fine but needs 
a comment.

> index 8ce8a39a1e5f0..25a2f5255f523 100644
> --- a/include/uapi/asm-generic/socket.h
> +++ b/include/uapi/asm-generic/socket.h
> @@ -135,6 +135,11 @@
>  #define SO_PASSPIDFD		76
>  #define SO_PEERPIDFD		77
> 
> +#define SO_DEVMEM_LINEAR	98
> +#define SCM_DEVMEM_LINEAR	SO_DEVMEM_LINEAR
> +#define SO_DEVMEM_DMABUF	99
> +#define SCM_DEVMEM_DMABUF	SO_DEVMEM_DMABUF

These on the other hand look like a typo: did you
mean number 78 and 79 instead of 98 and 99?

Alternatively, you could continue with number 87,
which is the next unused number on sparc, and have
the same numbers on all architectures?

     Arnd
