Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC70291BEB7
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 14:38:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941C410E21A;
	Fri, 28 Jun 2024 12:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DOqtLb61";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F2810E222
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 12:38:22 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-421f4d1c057so4302115e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 05:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719578301; x=1720183101; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UkB9FJLP2us4SWIDZi7Xked72Jv5/nb/0qDRVeIMogM=;
 b=DOqtLb61MXR5+JNFSOadolbAJfowlVpKqS1LWXGdWr7gnNIJ3kRzKS/6g/X9buYxR6
 72H5n7r+exSOFLt6XndiKQIBuPZegmKQ+83IA818DePfRm9CAwHHHu8cD+Qc8TS8afb0
 oYF4cyFV7TZEtcvW6qujTmxVBF4Hqyf9YG6/WHc+PL1CmE25uMoO2w5WgnoWEqaUE/jL
 gjpJi6SI2A7urNeaa4czu62K5i2bs81apakveZ5/6QN/KvVBwWQYhz1gXcFb00z6FXnT
 E+NhBNb6h/o5ZIWG4tv/nA47R49QsKIE0a4LaxcKiw/TF5FGYBJtLZ1xgSUx/FqQ0nZ4
 llLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719578301; x=1720183101;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UkB9FJLP2us4SWIDZi7Xked72Jv5/nb/0qDRVeIMogM=;
 b=VwRC350Ny4fsHgQKjWSphCeQspzq59Sm/jU36LEaFfWAzJv54ss24m9Q6By+1BrtWZ
 0s4N0AIJv3oLHQzAXhi5MmPc9+CeOPs1cLeK/36bCWsn9/N3brR9a+XA7PAArbttwQh3
 zk6DYg+L0ARIbEHvHapryUpqzhziEpXOP9AxfI977FPzUfGmQm5YFwpKFgqiupeIg5xf
 09qKRAbI7alrdj7WPUxo3jONEkPs4Yk7WlUmoJQBJFspZ2ukTQQpfxJvFGH16UOJeWhh
 FchjCVxDT93/4yacDYOpOfF352wgsUJSJVv9bRy59V8F6XsQlkV5a2iK/OAA9wHgzvO3
 lapg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7Afh/NdTq0gUseZEOfNMiX5SmX1oPj9GYpkt3l/QbXeDdI+DW8yewCpE6n15VKMfCZql9VcBXvcUv1rj0NL7UM7VpCygJiYfbI3T70b8U
X-Gm-Message-State: AOJu0YzxTgwtZQglkrpkBsGhC5eckryLUExv2io/bteAPCRSeoL93gUb
 ufUBuIqI+dTPcye++TPo/tatNQpZulwomEcUpAwshrqtyhBccn7o
X-Google-Smtp-Source: AGHT+IGKPig1mllBhdyoWDfOAICdvFqpjzxk+CF0oztCa+Z2hIe/+Ak7GWhb6YuhdCYfjXEa57wE4g==
X-Received: by 2002:adf:fd4b:0:b0:367:2ae1:9c4d with SMTP id
 ffacd0b85a97d-3672ae19d30mr5464759f8f.29.1719578300608; 
 Fri, 28 Jun 2024 05:38:20 -0700 (PDT)
Received: from orome (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0fc4c9sm2197872f8f.86.2024.06.28.05.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 05:38:20 -0700 (PDT)
Date: Fri, 28 Jun 2024 14:38:18 +0200
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
Subject: Re: [PATCH v5 7/9] dma-buf: heaps: restricted_heap: Add MediaTek
 restricted heap and heap_init
Message-ID: <pmweipswfysn3sjwf7jphwcjkt36s5d2o5ox6e63btqiyj7taj@kti5j36ttfbc>
References: <20240515112308.10171-1-yong.wu@mediatek.com>
 <20240515112308.10171-8-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5z4oex5oy2lm7v2z"
Content-Disposition: inline
In-Reply-To: <20240515112308.10171-8-yong.wu@mediatek.com>
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


--5z4oex5oy2lm7v2z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 07:23:06PM GMT, Yong Wu wrote:
> Add a MediaTek restricted heap which uses TEE service call to restrict
> buffer. Currently this restricted heap is NULL, Prepare for the later
> patch. Mainly there are two changes:
> a) Add a heap_init ops since TEE probe late than restricted heap, thus
>    initialize the heap when we require the buffer the first time.
> b) Add a priv_data for each heap, like the special data used by MTK
>    (such as "TEE session") can be placed in priv_data.
>=20
> Currently our heap depends on CMA which could only be bool, thus
> depend on "TEE=3Dy".
>=20
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/dma-buf/heaps/Kconfig               |   7 ++
>  drivers/dma-buf/heaps/Makefile              |   1 +
>  drivers/dma-buf/heaps/restricted_heap.c     |  11 ++
>  drivers/dma-buf/heaps/restricted_heap.h     |   2 +
>  drivers/dma-buf/heaps/restricted_heap_mtk.c | 115 ++++++++++++++++++++
>  5 files changed, 136 insertions(+)
>  create mode 100644 drivers/dma-buf/heaps/restricted_heap_mtk.c
>=20
> diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
> index e54506f480ea..84f748fb2856 100644
> --- a/drivers/dma-buf/heaps/Kconfig
> +++ b/drivers/dma-buf/heaps/Kconfig
> @@ -21,3 +21,10 @@ config DMABUF_HEAPS_RESTRICTED
>  	  heap is to manage buffers that are inaccessible to the kernel and use=
r space.
>  	  There may be several ways to restrict it, for example it may be encry=
pted or
>  	  protected by a TEE or hypervisor. If in doubt, say N.
> +
> +config DMABUF_HEAPS_RESTRICTED_MTK
> +	bool "MediaTek DMA-BUF Restricted Heap"
> +	depends on DMABUF_HEAPS_RESTRICTED && TEE=3Dy
> +	help
> +	  Enable restricted dma-buf heaps for MediaTek platform. This heap is b=
acked by
> +	  TEE client interfaces. If in doubt, say N.
> diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makef=
ile
> index a2437c1817e2..0028aa9d875f 100644
> --- a/drivers/dma-buf/heaps/Makefile
> +++ b/drivers/dma-buf/heaps/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_DMABUF_HEAPS_CMA)		+=3D cma_heap.o
>  obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED)	+=3D restricted_heap.o
> +obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED_MTK)	+=3D restricted_heap_mtk.o
>  obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+=3D system_heap.o
> diff --git a/drivers/dma-buf/heaps/restricted_heap.c b/drivers/dma-buf/he=
aps/restricted_heap.c
> index 4e45d46a6467..8bc8a5e3f969 100644
> --- a/drivers/dma-buf/heaps/restricted_heap.c
> +++ b/drivers/dma-buf/heaps/restricted_heap.c
> @@ -151,11 +151,22 @@ restricted_heap_allocate(struct dma_heap *heap, uns=
igned long size,
>  			 unsigned long fd_flags, unsigned long heap_flags)
>  {
>  	struct restricted_heap *rheap =3D dma_heap_get_drvdata(heap);
> +	const struct restricted_heap_ops *ops =3D rheap->ops;
>  	struct restricted_buffer *restricted_buf;
>  	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>  	struct dma_buf *dmabuf;
>  	int ret;
> =20
> +	/*
> +	 * In some implements, TEE is required to protect buffer. However TEE p=
robe
> +	 * may be late, Thus heap_init is performed when the first buffer is re=
quested.
> +	 */
> +	if (ops->heap_init) {
> +		ret =3D ops->heap_init(rheap);
> +		if (ret)
> +			return ERR_PTR(ret);
> +	}

I wonder if we should make this parameterized rather than the default.
Perhaps we can add a "init_on_demand" (or whatever other name) flag to
struct restricted_heap_ops and then call this from heap initialization
if possible and defer initialization depending on the restricted heap
provider?

> +
>  	restricted_buf =3D kzalloc(sizeof(*restricted_buf), GFP_KERNEL);
>  	if (!restricted_buf)
>  		return ERR_PTR(-ENOMEM);
> diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-buf/he=
aps/restricted_heap.h
> index 6d9599a4a34e..2a33a1c7a48b 100644
> --- a/drivers/dma-buf/heaps/restricted_heap.h
> +++ b/drivers/dma-buf/heaps/restricted_heap.h
> @@ -19,6 +19,8 @@ struct restricted_heap {
>  	const char		*name;
> =20
>  	const struct restricted_heap_ops *ops;
> +
> +	void			*priv_data;

Honestly, I would just get rid of any of this extra padding/indentation
in these structures. There's really no benefit to this, except maybe if
you *really* like things to be aligned, in which case the above is now
probably worse than if you didn't try to align in the first place.

Thierry

--5z4oex5oy2lm7v2z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZ+rroACgkQ3SOs138+
s6EB/hAAlquMNwNzbko/vJ18thfHMMKEC/LnnxyK/L6hWo7sf3oV1B8fuUN/r+A5
qzDZZmYdzjgCrR7bY/80cCOUVhJz1/y+eiQXSyBoG/5UM7SDPSSnRHCDYxGk8PUs
6Tl7I1KmB994jWeX3qBUs8jM1EQym+2aYPevhR9E7bmKUfdGaaeBOwOv85Ku0rC9
DhnQfteSJx9jRhnMzQE+ADzjqtnVhR4oSmfpugMPXV/WkVhJ81fMLDr6O3YAfFMy
59NfXGreJN+yG/9FmuF6aIsesBcH8loA6UyM+RIv7eubHAZCCzAbXrHvdBg3neGN
F2lRw/QN3PYdXAayYTDTw1619gN9oABCreu1TMJEPZmxypM8T89h17rSl06wUjxe
tgFwkbvdsYQzpYBT54Jugie8+HCkQAxItrb2uFHI4zHKcg4OuvrlQP4ZLpA2qh4q
2DK34GYRim44TCdKhL+R3LWAGVEIbzdnIUFt69k44rwj0qwTXaFofMQhDC/zS8Z6
H1g4Ls4sNl7iPhnwfxtphdhvtw33ofgAqKtffPYlJKzSR+T08vOTENLDWIWf62NZ
5R0I+LJ8DHBzZKprzeBkA7KL4mlctZKGEaf/d3G2cPoWBoCdBkRDOi+XTFtiVHKa
kuNAR3Rsd/TbSDZYGcozLxD+mGBgZclxEO8kyHNENQR+xvetWiY=
=oI/a
-----END PGP SIGNATURE-----

--5z4oex5oy2lm7v2z--
