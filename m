Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMWsAS/gpmkPYQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:20:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 611441F0190
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4EE10E040;
	Tue,  3 Mar 2026 13:20:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Rxq8YKY/";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QIpotY8x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8B710E040
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 13:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772544041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8HeSeolQ1fBhOJOln5m5tn/ig4w91f0rYiMidADsnM8=;
 b=Rxq8YKY/G0MAzRHW70jR/uxPVvH1nHRtu+bppm/uTpFOnBZFyuh0DVbUoxn/kEbH6edYQH
 HBMW38YqkVC2puMmCBRmXH0u7l/yX5IuaUmW1NuHYUYrMsb9ygXwmEkJgiMnpBSgefDchZ
 xBZJua9+qdrY5b/r/7FErxYln+YB2rU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-v0SHcyVtMB2qL3btdB54FQ-1; Tue, 03 Mar 2026 08:20:38 -0500
X-MC-Unique: v0SHcyVtMB2qL3btdB54FQ-1
X-Mimecast-MFC-AGG-ID: v0SHcyVtMB2qL3btdB54FQ_1772544037
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-439c2a0d821so277831f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 05:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1772544037; x=1773148837; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8HeSeolQ1fBhOJOln5m5tn/ig4w91f0rYiMidADsnM8=;
 b=QIpotY8xYtPsZX1mxGMV7IEVPhkKMBz6egUQYvH2d+DP9ZD2mgbaDZYBMcFByLj2Og
 YdMGg6CN/iLG7RNoXDTRunfCTVpShHVyQkgxHq3ZyCvh3/eOkqz5jWNs86JVmB8GInyL
 gGcFmMAWBMgRkihG3xJpcIwI103pEX8Eg5r5rL3J9D43/enryl5CxQj4JrZFJnWj0GDR
 7USZm99X5U1b+IJFPtgMxQI5SabWSLKt3g/d9wCcOA1OhxkP48jl9wP46lBtqEeHCacX
 Pl14mK8avewSDux0RkJGdXnFcHRS8o9u5vU6kSjBcI6N5sg6lZtDyvkKx/lC5QtQ8QmK
 ZPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772544037; x=1773148837;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8HeSeolQ1fBhOJOln5m5tn/ig4w91f0rYiMidADsnM8=;
 b=cdJNgmYjpa7ONX9McXjlfwwzD0sUfZzia72HW5hpKZIQMBJ4AgGmVLm87GmSM0T/uq
 vdTZpP77K2okTCbHh/ty7e+dANixvJ/FHgjT4+uKnNjvR1O+1ysIdzq4xDNQhf65PzAn
 ignf6itvp37NaFWuN04ANLr/OKMa9jy4E+t7adXqaTCP3NbzapYyhJT5XIDYFsB2g177
 yh8LDV3Np2QYUHYsGr/uiNX+MFVpY+fTQ/CQgM9OYUMLqvK7tCQjc3ojcAPSjL9CHs4I
 IvoTE57iTM24Oxe6NeNu6ewSkCg22VnRMKRzb81+No8DZUy4+xKttt7i2Kxjj94Kmarv
 kLjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZvZy5BabkkVebSzizjmuaYvjft4c8GLZiA5VVwSkc24B2z+DmmkHhvgeo+hRMIKdJ9CUEYDELPU4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4azFoSkXWKkpTdbMsZPKYguDQuWAv90i41jF1HkDQUfga8bfQ
 i2qjsPNALos4IuUk80qFg9hxQhdMhb5V+DUFHLnCq/QwUv9hLUAKRYXlL0LoGoa74u7ec/TvYXV
 ePvOTjcOO/wfcHLDOH8p4xmeHDrqvpX76Ng8E6Ag8JP9fZY7spQAeMnHjUXJGj1JWBnOSYyqn24
 iZ/Q==
X-Gm-Gg: ATEYQzxQAQHgR1+ETgDqKQlCF1XXK3/6hNnmDEn+kHJsPsEk14JCpZh4P0yTqQhAxvF
 oVIAehbW8Pb4XBRqPZ1Mom/lU9uiUj30OsCF0notMKTR4z/I7eTqlzRU0rWBMjIiT3mcDXT/oN+
 ipKQYx5hx9kJZ2iVTovbln9vVJYVFH6Or0HmtJpy2GdJu2flKwXDz7Sj4hwnKX6Ke2aU8Fw5+64
 K3EKPyXUeXSsc2F9QUeXCnKYWmp1maqlsVShUMsmew+OEH33PGFpV8W8a2YHhfCPf63KS8Ees3P
 BgPXrqw7ow3gGlZMwU6pT21GFcZYhKi2EesMdXPGQ4djuu9CVAwUsmQuM6b5USQXN2/MITgHKw=
 =
X-Received: by 2002:a05:6000:25c6:b0:439:c14b:2100 with SMTP id
 ffacd0b85a97d-439c14b22d7mr3433780f8f.12.1772544036635; 
 Tue, 03 Mar 2026 05:20:36 -0800 (PST)
X-Received: by 2002:a05:6000:25c6:b0:439:c14b:2100 with SMTP id
 ffacd0b85a97d-439c14b22d7mr3433696f8f.12.1772544036002; 
 Tue, 03 Mar 2026 05:20:36 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439af926c53sm24022288f8f.8.2026.03.03.05.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 05:20:35 -0800 (PST)
Date: Tue, 3 Mar 2026 14:20:34 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@kernel.org>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org, echanude@redhat.com
Subject: Re: [PATCH v2 4/6] dma-buf: heaps: Add Coherent heap to dmabuf heaps
Message-ID: <20260303-rigorous-cow-of-saturation-23f87b@houat>
References: <20260303-b4-dmabuf-heap-coherent-rmem-v2-0-65a4653b3378@redhat.com>
 <20260303-b4-dmabuf-heap-coherent-rmem-v2-4-65a4653b3378@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="3oyzr26awgsnuxvr"
Content-Disposition: inline
In-Reply-To: <20260303-b4-dmabuf-heap-coherent-rmem-v2-4-65a4653b3378@redhat.com>
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
X-Rspamd-Queue-Id: 611441F0190
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.91 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aesteve@redhat.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:robh@kernel.org,m:saravanak@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:echanude@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[mripard@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mripard@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action


--3oyzr26awgsnuxvr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 4/6] dma-buf: heaps: Add Coherent heap to dmabuf heaps
MIME-Version: 1.0

Hi,

On Tue, Mar 03, 2026 at 01:33:47PM +0100, Albert Esteve wrote:
> Add a dma-buf heap for DT coherent reserved-memory
> (i.e., 'shared-dma-pool' without 'reusable' property),
> exposing one heap per region for userspace buffers.
>=20
> The heap binds the heap device to each memory region so
> coherent allocations use the correct dev->dma_mem, and
> it defers registration until module_init when normal
> allocators are available.
>=20
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  drivers/dma-buf/dma-heap.c            |   4 +-
>  drivers/dma-buf/heaps/Kconfig         |   9 +
>  drivers/dma-buf/heaps/Makefile        |   1 +
>  drivers/dma-buf/heaps/coherent_heap.c | 426 ++++++++++++++++++++++++++++=
++++++
>  include/linux/dma-heap.h              |  11 +
>  include/linux/dma-map-ops.h           |   7 +
>  6 files changed, 456 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 88189d4e48561..ba87e5ac16ae2 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -390,8 +390,8 @@ struct dma_heap *dma_heap_add(const struct dma_heap_e=
xport_info *exp_info)
> =20
>  	heap =3D dma_heap_create(exp_info);
>  	if (IS_ERR(heap)) {
> -		pr_err("dma_heap: failed to create heap (%d)\n", PTR_ERR(heap));
> -		return PTR_ERR(heap);
> +		pr_err("dma_heap: failed to create heap (%ld)\n", PTR_ERR(heap));
> +		return ERR_CAST(heap);

This looks unrelated and should possibly be squashed into the previous
patch that introduces dma_heap_create()?

> +static int coherent_heap_init_dma_mask(struct device *dev)
> +{
> +	int ret;
> +
> +	ret =3D dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(64));
> +	if (!ret)
> +		return 0;
> +
> +	/* Fallback to 32-bit DMA mask */
> +	return dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
> +}

Why do you need to mess with the DMA mask? I'd expect that device to be
able to access everything.

> +static int __coherent_heap_register(struct reserved_mem *rmem)
> +{
> +	struct dma_heap_export_info exp_info;
> +	struct coherent_heap *coh_heap;
> +	struct device *heap_dev;
> +	int ret;
> +
> +	if (!rmem || !rmem->name)
> +		return -EINVAL;
> +
> +	coh_heap =3D kzalloc_obj(*coh_heap);
> +	if (!coh_heap)
> +		return -ENOMEM;
> +
> +	coh_heap->rmem =3D rmem;
> +	coh_heap->name =3D kstrdup(rmem->name, GFP_KERNEL);
> +	if (!coh_heap->name) {
> +		ret =3D -ENOMEM;
> +		goto free_coherent_heap;
> +	}
> +
> +	exp_info.name =3D coh_heap->name;
> +	exp_info.ops =3D &coherent_heap_ops;
> +	exp_info.priv =3D coh_heap;
> +
> +	coh_heap->heap =3D dma_heap_create(&exp_info);
> +	if (IS_ERR(coh_heap->heap)) {
> +		ret =3D PTR_ERR(coh_heap->heap);
> +		goto free_name;
> +	}
> +
> +	heap_dev =3D dma_heap_get_dev(coh_heap->heap);
> +	ret =3D coherent_heap_init_dma_mask(heap_dev);
> +	if (ret) {
> +		pr_err("coherent_heap: failed to set DMA mask (%d)\n", ret);
> +		goto destroy_heap;
> +	}
> +
> +	ret =3D of_reserved_mem_device_init_with_mem(heap_dev, rmem);
> +	if (ret) {
> +		pr_err("coherent_heap: failed to initialize memory (%d)\n", ret);
> +		goto destroy_heap;
> +	}
> +
> +	ret =3D dma_heap_register(coh_heap->heap);
> +	if (ret) {
> +		pr_err("coherent_heap: failed to register heap (%d)\n", ret);
> +		goto destroy_heap;
> +	}

I guess it's more of a comment about your previous patch, but it's not
clear to me why you needed to split dma_heap_add into dma_heap_create /
_register. Can you expand a bit?

> diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
> index 1b0ea43ba66c3..77e6cb66ffce1 100644
> --- a/include/linux/dma-heap.h
> +++ b/include/linux/dma-heap.h
> @@ -9,10 +9,12 @@
>  #ifndef _DMA_HEAPS_H
>  #define _DMA_HEAPS_H
> =20
> +#include <linux/errno.h>
>  #include <linux/types.h>
> =20
>  struct dma_heap;
>  struct device;
> +struct reserved_mem;
> =20
>  /**
>   * struct dma_heap_ops - ops to operate on a given heap
> @@ -53,4 +55,13 @@ struct dma_heap *dma_heap_add(const struct dma_heap_ex=
port_info *exp_info);
> =20
>  extern bool mem_accounting;
> =20
> +#if IS_ENABLED(CONFIG_DMABUF_HEAPS_COHERENT)
> +int dma_heap_coherent_register(struct reserved_mem *rmem);
> +#else
> +static inline int dma_heap_coherent_register(struct reserved_mem *rmem)
> +{
> +	return -EOPNOTSUPP;
> +}
> +#endif
> +
>  #endif /* _DMA_HEAPS_H */

Do you still need that now that you switched to an iterator-like
function?

> diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
> index 60b63756df821..c87e5e44e5383 100644
> --- a/include/linux/dma-map-ops.h
> +++ b/include/linux/dma-map-ops.h
> @@ -12,6 +12,7 @@
> =20
>  struct cma;
>  struct iommu_ops;
> +struct reserved_mem;
> =20
>  struct dma_map_ops {
>  	void *(*alloc)(struct device *dev, size_t size,
> @@ -161,6 +162,7 @@ int dma_alloc_from_dev_coherent(struct device *dev, s=
size_t size,
>  int dma_release_from_dev_coherent(struct device *dev, int order, void *v=
addr);
>  int dma_mmap_from_dev_coherent(struct device *dev, struct vm_area_struct=
 *vma,
>  		void *cpu_addr, size_t size, int *ret);
> +struct reserved_mem *dma_coherent_get_reserved_region(unsigned int idx);
>  #else
>  static inline int dma_declare_coherent_memory(struct device *dev,
>  		phys_addr_t phys_addr, dma_addr_t device_addr, size_t size)
> @@ -172,6 +174,11 @@ static inline int dma_declare_coherent_memory(struct=
 device *dev,
>  #define dma_release_from_dev_coherent(dev, order, vaddr) (0)
>  #define dma_mmap_from_dev_coherent(dev, vma, vaddr, order, ret) (0)
>  static inline void dma_release_coherent_memory(struct device *dev) { }
> +static inline
> +struct reserved_mem *dma_coherent_get_reserved_region(unsigned int idx)
> +{
> +	return NULL;
> +}
>  #endif /* CONFIG_DMA_DECLARE_COHERENT */
> =20
>  #ifdef CONFIG_DMA_GLOBAL_POOL

To preserve bisectability, you shouldn't do it that way. Introduce this
function into a preliminary patch, and then use it in this one.

Maxime

--3oyzr26awgsnuxvr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaabgIgAKCRAnX84Zoj2+
dpoAAYDbvla5ginFJZBwWscCdbzpqxZu0Nmn5Wmi+a860nETKwKEQNqs0s5JuwUy
LJBvBPIBf3AhBVl15Ze7xHfd358n8N5AmjXfB9uhtuZLkCNeqTzjr/j0hj5xhQ45
SMroDA+cOQ==
=6R14
-----END PGP SIGNATURE-----

--3oyzr26awgsnuxvr--

