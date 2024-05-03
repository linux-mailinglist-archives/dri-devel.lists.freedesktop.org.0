Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B6B8BAD45
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 15:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A47210FF94;
	Fri,  3 May 2024 13:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WywTV05g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DD8112AE8
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 13:14:07 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-6f44dd41a5cso398809b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 06:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714742046; x=1715346846; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=S6Kz22nN7XZpw5/QYn8eU3Vl5d2ZzmTa9J6l4Ufw1zs=;
 b=WywTV05g65MfIXmHqVuyPKvDsGi/xMABdy/NxrsemiekVHCZFQbytqETG11aAGane4
 P90IUO3Jh6N/zWE9Q2cpVWgpyybVvOnh/z3OkyWFXgvgA/27ULGMMelP/O1hjf4Xk44x
 9br4JYFN4lKrwS9XcD/l7me4cItP79rYQQJVWXDWs00TAPlH1jL3WPlNMKv0SrHxFcV8
 ubOVMqU3MaLPmu6ElOlolmd4TY1Wdolyb5KzvZrRuzZrpYDIxZonNDxaOGKxL7/wPaB4
 g+GCDCvycZQ8+M5m63JJ8jc2NULgNEWRDTgAceyV9oZi0FeJnhCsAwPymtCpHyALv9Me
 uQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714742046; x=1715346846;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S6Kz22nN7XZpw5/QYn8eU3Vl5d2ZzmTa9J6l4Ufw1zs=;
 b=lsBPljde7lGzJB0euTlEEoNH7fZ4R1Nv5YpahryTSCXUtejGh7t+OqLC9tZvJQjFZH
 LIbcr7+YCVjSdMAJ4U7pu6JT6hHQNI1bOmx5MINRhxKG8q069PdOid7AJX8o9ZN9X4sq
 rqoJPne/B0/KbMQpZrC8YeMkKf/dwHzbxJ2bEiyv/E8tOy5ErygP0d06oG2oim79Mqsr
 7n9QRhultP7KoaWnEkN+IoR6MWW+9Y03X2+rV51usZ7dq2IV2IBz1ubA+qqH4cBZulJr
 pgvq7fcMpdhYUqGsbDExP4pxf9GJbGSznZaFEjROnUHyI3srWFR2qbVSAVNFApUqcuLV
 xjpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqnOv0+jtWltz13ecpEvNQfzWc/XsiQQQYGGyl4dMTnll/F5qOYPU0otukI8i6EVrFAZfjLLvRsw9Rk+keUIB2jMxqpDL/Dd7oJVf0LZd6
X-Gm-Message-State: AOJu0YypCBYe5Yn1NCGT3GgvAPueqQk4E3kEIzOLEODVSvolXpI1zZmN
 rgrKZA5qLKzgbRxTIl8oYOxCTRRhkwyc17L1ObUloYiX7achqgXS
X-Google-Smtp-Source: AGHT+IGAxZcx6M5jku9xJQNGsk1mq4nfDpmBwjTTeZ5TRCe/HqThlL4pFRsVfzRAFzuWYWRs0QPHbQ==
X-Received: by 2002:a05:6a20:3cac:b0:1ac:c8dc:3e5e with SMTP id
 b44-20020a056a203cac00b001acc8dc3e5emr3146813pzj.24.1714742046301; 
 Fri, 03 May 2024 06:14:06 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 j1-20020a170902da8100b001e509d4d6ddsm3203863plx.1.2024.05.03.06.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 06:14:05 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id C0EA918462B27; Fri, 03 May 2024 20:14:03 +0700 (WIB)
Date: Fri, 3 May 2024 20:14:03 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Amritha Nambiar <amritha.nambiar@intel.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Alexander Mikhalitsyn <alexander@mihalicyn.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>,
 Christian Brauner <brauner@kernel.org>, Simon Horman <horms@kernel.org>,
 David Howells <dhowells@redhat.com>, Florian Westphal <fw@strlen.de>,
 Yunsheng Lin <linyunsheng@huawei.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Jens Axboe <axboe@kernel.dk>,
 Arseniy Krasnov <avkrasnov@salutedevices.com>,
 Aleksander Lobakin <aleksander.lobakin@intel.com>,
 Michael Lass <bevan@bi-co.net>, Jiri Pirko <jiri@resnulli.us>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Richard Gobert <richardbgobert@gmail.com>,
 Sridhar Samudrala <sridhar.samudrala@intel.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Johannes Berg <johannes.berg@intel.com>,
 Abel Wu <wuyun.abel@bytedance.com>, Breno Leitao <leitao@debian.org>,
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>
Subject: Re: [RFC PATCH net-next v8 13/14] net: add devmem TCP documentation
Message-ID: <ZjTjG_INUM4G1Pf5@archie.me>
References: <20240403002053.2376017-1-almasrymina@google.com>
 <20240403002053.2376017-14-almasrymina@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="p760D9CQLIFGzr8t"
Content-Disposition: inline
In-Reply-To: <20240403002053.2376017-14-almasrymina@google.com>
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


--p760D9CQLIFGzr8t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 02, 2024 at 05:20:50PM -0700, Mina Almasry wrote:
> +ncdevmem has a validation mode as well that expects a repeating pattern =
of
> +incoming data and validates it as such::
> +
> +	# On server:
> +	ncdevmem -s <server IP> -c <client IP> -f eth1 -d 3 -n 0000:06:00.0 -l \
> +		 -p 5201 -v 7
> +
> +	# On client:
> +	yes $(echo -e \\x01\\x02\\x03\\x04\\x05\\x06) | \
> +		tr \\n \\0 | head -c 5G | nc <server IP> 5201 -p 5201

What about splitting server and client usage?

---- >8 ----
diff --git a/Documentation/networking/devmem.rst b/Documentation/networking=
/devmem.rst
index e4e978fbcdbd5f..f32acfd62075d2 100644
--- a/Documentation/networking/devmem.rst
+++ b/Documentation/networking/devmem.rst
@@ -245,12 +245,14 @@ To run ncdevmem, you need to run it on a server on th=
e machine under test, and
 you need to run netcat on a peer to provide the TX data.
=20
 ncdevmem has a validation mode as well that expects a repeating pattern of
-incoming data and validates it as such::
+incoming data and validates it as such. For example, you can launch
+ncdevmem on the server by::
=20
-	# On server:
 	ncdevmem -s <server IP> -c <client IP> -f eth1 -d 3 -n 0000:06:00.0 -l \
 		 -p 5201 -v 7
=20
-	# On client:
+On client side, use regular netcat to send TX data to ncdevmem process
+on the server::
+
 	yes $(echo -e \\x01\\x02\\x03\\x04\\x05\\x06) | \
 		tr \\n \\0 | head -c 5G | nc <server IP> 5201 -p 5201

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--p760D9CQLIFGzr8t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZjTjFwAKCRD2uYlJVVFO
o9RPAQCNza/o9eilURPtLMgckHLWGXSLgl+m05JS4n+5eQOBfAEAuaR+vADZuSKC
PnV18jn47Aqz1SmrD+MDjjeFy4rw0gM=
=E6BN
-----END PGP SIGNATURE-----

--p760D9CQLIFGzr8t--
