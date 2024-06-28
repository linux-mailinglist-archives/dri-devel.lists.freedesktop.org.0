Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E78191BE7F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 14:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBDF10E013;
	Fri, 28 Jun 2024 12:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NzhmYO9L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C14A10E013
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 12:26:49 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-364a39824baso360514f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 05:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719577608; x=1720182408; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=X/VQJz2hM3Y4F448nQxVS0VxqvpF+TwhJySiPDWqGzs=;
 b=NzhmYO9LI4gE1olRPebogxHefdQm6Me0EwZpjnwzWhN0aBwiX0Pc+rXZaomtMaI9qS
 LwSuF2mROlAde/1tSwZZefffFl+QdnhCg72twXli3OPw77kuMBPPoIT/EpIt2SvTi9kv
 R4kpmKVvLzDX03/Iox/7ZaLfbCZH6bB+wjfK/0b4IV6tuLrZiFC3Hx9W43VM3VW1zVmZ
 Q6A1AHouZfQHnyFy3eUahuQPztr8Y1R7KNNJ9VkXFR4CEq7Y6rgeKtKiUYbtEZtKP0cl
 BRY0JnsK00cJNIu4k4cb4VZpYOYjbDmSNwRMXE+g44oUiXmYvo1bzcSH0R55yBCEGS3h
 rC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719577608; x=1720182408;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X/VQJz2hM3Y4F448nQxVS0VxqvpF+TwhJySiPDWqGzs=;
 b=XoV53RlBZ3qjrE36hRHgLiMeSGExiRy9rLDIABSgL2gbpC+Wm/0PGEF8kNsZGXHS9E
 19wVDhCj4qs/SHbCYgMsSuU9wAKimXGP3YQoa2FLdla5NdmIEN47fjxqK0UyOsqZTXyq
 CMWV8bo/UC/7+d/Lg21N+GW6qdstNiBkqkoSbcLk4WjXB6Xtu7lw/IRXBcSeYioanwhv
 R6qGQrGMeUk0tkIRx4yU7ZiGJ7qN1jh1EAchS59fC1paex7Nvl8UTZQZ/HGYKoVQBfu3
 6RwGXq6gVqX7sOBZ2iqRBQbewYd7PhAJoSr3HA8NbdRVW0PfWOhfiDKFwv3MYKyXMBb+
 w99g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWKMX7yMUu2QSFDL2vm16Yj4T08q8HLQhzSu2xjFXivR4gmIyWIhJOLO7CoeobEU7lkYKWL+OkRyQQVdfiAdEz10Xu8pNKygeZLhOahmFa
X-Gm-Message-State: AOJu0YwKkdaWAZtxJloXIZneTdWbAPKN6nBQ5KhF919hwTmQTHDjpNre
 hwbbOOnBI6yP20K+dw1/a6N6gUC9E2juBwDzef6jINItSI602HfV
X-Google-Smtp-Source: AGHT+IEBnJj0jcIPr2SKFxa+XB8hdZdf8p61oiEXssLzKDdbv2pquDD9+yIevx/3N4QZrH7J7OMy0Q==
X-Received: by 2002:a5d:4c43:0:b0:367:403d:a1ef with SMTP id
 ffacd0b85a97d-36742bd156cmr2987417f8f.62.1719577607204; 
 Fri, 28 Jun 2024 05:26:47 -0700 (PDT)
Received: from orome (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0cd784sm2204336f8f.7.2024.06.28.05.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 05:26:46 -0700 (PDT)
Date: Fri, 28 Jun 2024 14:26:44 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, christian.koenig@amd.com,
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 tjmercier@google.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Robin Murphy <robin.murphy@arm.com>, Vijayanand Jitta <quic_vjitta@quicinc.com>,
 Joakim Bech <joakim.bech@linaro.org>, Jeffrey Kardatzke <jkardatzke@google.com>,
 Pavel Machek <pavel@ucw.cz>, Simon Ser <contact@emersion.fr>, 
 Pekka Paalanen <ppaalanen@gmail.com>, willy@infradead.org,
 Logan Gunthorpe <logang@deltatee.com>, 
 Daniel Vetter <daniel@ffwll.ch>, jianjiao.zeng@mediatek.com,
 kuohong.wang@mediatek.com, youlin.pei@mediatek.com
Subject: Re: [PATCH v5 5/9] dma-buf: heaps: restricted_heap: Add private heap
 ops
Message-ID: <gbj6vakab74yuhbkazlxvrz3x3bia3nb7loo7c74fadlh4wc2q@qjf44kr3mrqe>
References: <20240515112308.10171-1-yong.wu@mediatek.com>
 <20240515112308.10171-6-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vbf3vgeqgslvvuj2"
Content-Disposition: inline
In-Reply-To: <20240515112308.10171-6-yong.wu@mediatek.com>
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


--vbf3vgeqgslvvuj2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 07:23:04PM GMT, Yong Wu wrote:
> Add "struct restricted_heap_ops". For the restricted memory, totally there
> are two steps:
> a) alloc: Allocate the buffer in kernel;
> b) restrict_buf: Restrict/Protect/Secure that buffer.
> The "alloc" is mandatory while "restrict_buf" is optional since it may
> be part of "alloc".
>=20
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/dma-buf/heaps/restricted_heap.c | 41 ++++++++++++++++++++++++-
>  drivers/dma-buf/heaps/restricted_heap.h | 12 ++++++++
>  2 files changed, 52 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/dma-buf/heaps/restricted_heap.c b/drivers/dma-buf/he=
aps/restricted_heap.c
> index c2ae19ba7d7e..8bb3c1876a69 100644
> --- a/drivers/dma-buf/heaps/restricted_heap.c
> +++ b/drivers/dma-buf/heaps/restricted_heap.c
> @@ -12,10 +12,44 @@
> =20
>  #include "restricted_heap.h"
> =20
> +static int
> +restricted_heap_memory_allocate(struct restricted_heap *rheap, struct re=
stricted_buffer *buf)
> +{
> +	const struct restricted_heap_ops *ops =3D rheap->ops;
> +	int ret;
> +
> +	ret =3D ops->alloc(rheap, buf);
> +	if (ret)
> +		return ret;
> +
> +	if (ops->restrict_buf) {
> +		ret =3D ops->restrict_buf(rheap, buf);
> +		if (ret)
> +			goto buf_free;
> +	}
> +	return 0;
> +
> +buf_free:
> +	ops->free(rheap, buf);
> +	return ret;
> +}
> +
> +static void
> +restricted_heap_memory_free(struct restricted_heap *rheap, struct restri=
cted_buffer *buf)
> +{
> +	const struct restricted_heap_ops *ops =3D rheap->ops;
> +
> +	if (ops->unrestrict_buf)
> +		ops->unrestrict_buf(rheap, buf);
> +
> +	ops->free(rheap, buf);
> +}
> +
>  static struct dma_buf *
>  restricted_heap_allocate(struct dma_heap *heap, unsigned long size,
>  			 unsigned long fd_flags, unsigned long heap_flags)
>  {
> +	struct restricted_heap *rheap =3D dma_heap_get_drvdata(heap);
>  	struct restricted_buffer *restricted_buf;
>  	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>  	struct dma_buf *dmabuf;
> @@ -28,6 +62,9 @@ restricted_heap_allocate(struct dma_heap *heap, unsigne=
d long size,
>  	restricted_buf->size =3D ALIGN(size, PAGE_SIZE);
>  	restricted_buf->heap =3D heap;
> =20
> +	ret =3D restricted_heap_memory_allocate(rheap, restricted_buf);
> +	if (ret)
> +		goto err_free_buf;
>  	exp_info.exp_name =3D dma_heap_get_name(heap);
>  	exp_info.size =3D restricted_buf->size;
>  	exp_info.flags =3D fd_flags;
> @@ -36,11 +73,13 @@ restricted_heap_allocate(struct dma_heap *heap, unsig=
ned long size,
>  	dmabuf =3D dma_buf_export(&exp_info);
>  	if (IS_ERR(dmabuf)) {
>  		ret =3D PTR_ERR(dmabuf);
> -		goto err_free_buf;
> +		goto err_free_rstrd_mem;
>  	}
> =20
>  	return dmabuf;
> =20
> +err_free_rstrd_mem:
> +	restricted_heap_memory_free(rheap, restricted_buf);
>  err_free_buf:
>  	kfree(restricted_buf);
>  	return ERR_PTR(ret);
> diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-buf/he=
aps/restricted_heap.h
> index b448f77616ac..5783275d5714 100644
> --- a/drivers/dma-buf/heaps/restricted_heap.h
> +++ b/drivers/dma-buf/heaps/restricted_heap.h
> @@ -15,6 +15,18 @@ struct restricted_buffer {
> =20
>  struct restricted_heap {
>  	const char		*name;
> +
> +	const struct restricted_heap_ops *ops;
> +};
> +
> +struct restricted_heap_ops {
> +	int	(*heap_init)(struct restricted_heap *rheap);

It might be worth moving this to a later patch when it's actually
getting used.

Thierry

--vbf3vgeqgslvvuj2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZ+rAQACgkQ3SOs138+
s6EcbxAAiZuHIyjN3NZQtDif4ifUoMPGxGZ4nEdFZbnDVkpJtKmk85RLLw6vq+8j
DggReAg+weGgbc+4qVdxZP8GKJvRcXUi9RIwQIj7/9U+R+VG+YCBwkoY81PnkYFF
DDCTn9dfvf/r6SaJPj8mWase4q61go1K7R79XU7SwJ5SbCz7BC0RI89lSiUShJQ4
PGDa1AQgNlKaYlMR6qjs9RFD6IHFt2Shge4S2/lbKcMgHxy3nbAZOULriFyPtkkg
PYKZlsje5AAUR4pnABwU6qhZMp7svIiuUJX1+zldt+LCsyqMScvBnUfe1QijtiBn
gg4sL1TTb1PVuUHPg15eyS5K9GHQilys2UXzCf+V8WT0Crr0gFz9+ClLYSSZh9NV
phSCQY9YRUhAC0c7xwc8Ov1IxgJ0nqL6Ig8BoeZnhQkVf3wPzPk9B8hVvJMVZ13s
blUxWO8qPdIzT6NsFK+A4RhN30gfqC8uy4DzyvhQR7+OWywHEaCZm3EdUZg0VHJp
U51n4uVREXlO8/a4GwgvwWmc6Y7oiHjH9n9iYM2ua6EYc0HW+YvmJp4FbWBa3VRL
e/ta+yMQWQYH1jfTqeQE1DJhBYEsKsgDjL7wv3USp+yMCkURiKWkos4b7ZXzCNVG
Z6xBSJbmND7bujopIY7A81K15p0SM787q9XHn1MaAMJrk2Xd0lY=
=OWnB
-----END PGP SIGNATURE-----

--vbf3vgeqgslvvuj2--
