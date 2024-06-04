Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2CF8FAFC5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 12:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF6F410E391;
	Tue,  4 Jun 2024 10:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CUWLOeCC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C92FB10E391
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 10:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717496636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gKigJcIbs9B/HNEmDazSe4HaJqUizC2mRGUdcgjE9OM=;
 b=CUWLOeCCUP3zdMl8pb6Ihc66X2Fp3/mVwnc1lUHH7fPXvwXQ+FMal36WP0H+TGTSi37F93
 YsiougSw0GO+v45UOOdvj4yFk5PaXQg81eBuDHSJh3iFfivonJ/eiQ0pXuiaLnMQnUhLeq
 vM83rR2mVGKPvN2JSAuGXP8Eur207dI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-fRxb2WvoNRq7Xt3hEuAv8A-1; Tue, 04 Jun 2024 06:23:53 -0400
X-MC-Unique: fRxb2WvoNRq7Xt3hEuAv8A-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-421353b0178so3795615e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 03:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717496632; x=1718101432;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O6tikh5JBiLBm1a4LVwhDF58Q+DFMaskKtK9m6Z5K2w=;
 b=FrtWbK4vKbd75oVTIaOwjMcuNsZ/RD8X5eyhJH66bHvbewaiv57YIOyI8BHzi62a/N
 Y2J1WxMcjXl5jzM8NM+ckr22i+LfQvtaf9nBp/YrcofcnKi/8A5ZjQvU0rc3tq96Z7tb
 i5hU5jzJcwJIFOLWzgeHkXYtF/nnRN5L1+Vo7T78JqyydvEjGjI6kKp5dkGSyoylna88
 Qe3OQokL3DgaQ4FWAh4Hw/SPhR4yoelbOqeUkkBYrOmmJSEzRZaQKzw30bL3O42XDxye
 expsZKgslYAAdeBAAo7Un04Pul1VOVWS4j4QHdTnZ0sE22Zz783dM1MKGh7gkkIyA35y
 +Ldg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLt80XnZc+UUbRnQ+2Pp6sFpcf9Vx0wuCwQ335SCm7Oxz6JXVrN87Wrf7x3lRrwtOt9sugx9S7CGjGoedocvZUTEGO4t6DJaFBhT6eSF38
X-Gm-Message-State: AOJu0YxnyFBlg6ihjuuGVJUlN0stPHVS/XZExjfGvQsknkQfw9wZNJIT
 9317FcX2D9/2zGojOJQQCk+bMW4JyOxwZNCwfESilSfcyhar7Swd5GYHEi9bYldH2AJdQ4UsO3q
 zPVWTUmsPnr86bsuxWeWeMdCU0r2sSyw9mUgpjL47GynH0Z4e6yYaddALDpPem7V1zA==
X-Received: by 2002:a05:6000:400a:b0:35e:51cf:6908 with SMTP id
 ffacd0b85a97d-35e51cf6a65mr6304473f8f.0.1717496631997; 
 Tue, 04 Jun 2024 03:23:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrhzH032AI5YL7gUIyX1AtuXBZC4N92hUDih0vFJ9VAbnPZz6xUFLcLH2nJjeRcYQ09o42TQ==
X-Received: by 2002:a05:6000:400a:b0:35e:51cf:6908 with SMTP id
 ffacd0b85a97d-35e51cf6a65mr6304415f8f.0.1717496631543; 
 Tue, 04 Jun 2024 03:23:51 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3344:1b74:3a10::f71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04c4388sm11260215f8f.14.2024.06.04.03.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 03:23:51 -0700 (PDT)
Message-ID: <31b376371d52797894809ad8a2edd4b76a76775f.camel@redhat.com>
Subject: Re: [PATCH net-next v10 06/14] page_pool: convert to use netmem
From: Paolo Abeni <pabeni@redhat.com>
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>, Donald Hunter
 <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Richard
 Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky
 <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
 Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer
 <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven
 Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Arnd Bergmann
 <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>,  Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,  Shuah Khan
 <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Pavel Begunkov
 <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Jason Gunthorpe
 <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand
 <shailend@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>
Date: Tue, 04 Jun 2024 12:23:48 +0200
In-Reply-To: <20240530201616.1316526-7-almasrymina@google.com>
References: <20240530201616.1316526-1-almasrymina@google.com>
 <20240530201616.1316526-7-almasrymina@google.com>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, 2024-05-30 at 20:16 +0000, Mina Almasry wrote:
> diff --git a/include/trace/events/page_pool.h b/include/trace/events/page=
_pool.h
> index 6834356b2d2ae..c5b6383ff2760 100644
> --- a/include/trace/events/page_pool.h
> +++ b/include/trace/events/page_pool.h
> @@ -42,51 +42,52 @@ TRACE_EVENT(page_pool_release,
>  TRACE_EVENT(page_pool_state_release,
> =20
>  =09TP_PROTO(const struct page_pool *pool,
> -=09=09 const struct page *page, u32 release),
> +=09=09 netmem_ref netmem, u32 release),

This causes a sparse warning, as the caller is still passing a 'page'
argument.

> =20
> -=09TP_ARGS(pool, page, release),
> +=09TP_ARGS(pool, netmem, release),
> =20
>  =09TP_STRUCT__entry(
>  =09=09__field(const struct page_pool *,=09pool)
> -=09=09__field(const struct page *,=09=09page)
> +=09=09__field(netmem_ref,=09=09=09netmem)
>  =09=09__field(u32,=09=09=09=09release)
>  =09=09__field(unsigned long,=09=09=09pfn)
>  =09),
> =20
>  =09TP_fast_assign(
>  =09=09__entry->pool=09=09=3D pool;
> -=09=09__entry->page=09=09=3D page;
> +=09=09__entry->netmem=09=09=3D netmem;
>  =09=09__entry->release=09=3D release;
> -=09=09__entry->pfn=09=09=3D page_to_pfn(page);
> +=09=09__entry->pfn=09=09=3D netmem_to_pfn(netmem);
>  =09),
> =20
> -=09TP_printk("page_pool=3D%p page=3D%p pfn=3D0x%lx release=3D%u",
> -=09=09  __entry->pool, __entry->page, __entry->pfn, __entry->release)
> +=09TP_printk("page_pool=3D%p netmem=3D%lu pfn=3D0x%lx release=3D%u",
> +=09=09  __entry->pool, (__force unsigned long)__entry->netmem,
> +=09=09  __entry->pfn, __entry->release)
>  );
> =20
>  TRACE_EVENT(page_pool_state_hold,
> =20
>  =09TP_PROTO(const struct page_pool *pool,
> -=09=09 const struct page *page, u32 hold),
> +=09=09 netmem_ref netmem, u32 hold),

Same here.

Thanks,

Paolo

