Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A5DAFFB02
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 09:36:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E4510E88F;
	Thu, 10 Jul 2025 07:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YeAF51fE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC02710E367
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 07:36:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EB264A542F6;
 Thu, 10 Jul 2025 07:36:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F563C4CEE3;
 Thu, 10 Jul 2025 07:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752132966;
 bh=mue2JFn58Xcox+gqmOTPe7zIvbnkjtHDu9euATkcNVo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YeAF51fEBgve2cj8TTkkBVcVZftaDtNa2vKCye50KkTYB6V58VR69pEHVtJFWKj0C
 bYonbs/rFRWGwmUC4vqDFMRwsS4lJW0ckF329I6pYiXOsPhMDGmODpbh0qvrc2oFr+
 CmILLBoWy74hzGqAnBxA+sLvUVWzPod8yRi0qb04joZK0ryc+0F6YMgbNCfOWAvTPw
 k5w63jllp35HDD5FKBAQZdQ4BC4dE1U3G4S0hVxRZR7wwAjE8T+1viF5Ka8ud4Z60m
 3ssDLrhC3wMJHrxuRxMb73thEXfsgfjrH/e2S5H0eQ9cvdfKFgBrySXQRPxPoZS84Q
 434MPGU0K/HhQ==
Date: Thu, 10 Jul 2025 09:36:03 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Andrew Davis <afd@ti.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Jared Kangas <jkangas@redhat.com>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 iommu@lists.linux.dev
Subject: Re: [PATCH v6 1/2] dma/contiguous: Add helper to test reserved
 memory type
Message-ID: <20250710-sincere-dainty-marmot-1cad58@houat>
References: <20250709-dma-buf-ecc-heap-v6-0-dac9bf80f35d@kernel.org>
 <20250709-dma-buf-ecc-heap-v6-1-dac9bf80f35d@kernel.org>
 <8b36f958-3406-421d-ab94-5e49f911f92e@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="b2q4t2bjxzo6g2kd"
Content-Disposition: inline
In-Reply-To: <8b36f958-3406-421d-ab94-5e49f911f92e@ti.com>
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


--b2q4t2bjxzo6g2kd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 1/2] dma/contiguous: Add helper to test reserved
 memory type
MIME-Version: 1.0

Hi Andrew,

On Wed, Jul 09, 2025 at 10:55:40AM -0500, Andrew Davis wrote:
> On 7/9/25 7:44 AM, Maxime Ripard wrote:
> > A given reserved-memory region can be of multiple types.
> >=20
> > We have currently four types defined in the tree: contiguous, backed by
> > CMA, coherent and swiotlb, backed by their respective allocators, and a
> > platform-specific one for tegra.
> >=20
> > However, some users, like dma-buf heaps, might be interested in the
> > exact type of a reserved memory region they are getting. It would thus
> > be useful to have helpers to test if a given region is of a given type.
> >=20
> > Since we only care about CMA for now though, let's create one for CMA
> > only.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >   include/linux/dma-map-ops.h | 13 +++++++++++++
> >   kernel/dma/contiguous.c     |  7 +++++++
> >   2 files changed, 20 insertions(+)
> >=20
> > diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
> > index f48e5fb88bd5dd346094bbf2ce1b79e5f5bfe1a6..ea646acb6367bd062619b33=
7013db221749f85ab 100644
> > --- a/include/linux/dma-map-ops.h
> > +++ b/include/linux/dma-map-ops.h
> > @@ -153,10 +153,23 @@ static inline void dma_free_contiguous(struct dev=
ice *dev, struct page *page,
> >   {
> >   	__free_pages(page, get_order(size));
> >   }
> >   #endif /* CONFIG_DMA_CMA*/
> > +#if defined(CONFIG_DMA_CMA) && defined(CONFIG_OF_RESERVED_MEM)
> > +struct reserved_mem;
> > +
> > +bool of_reserved_mem_is_contiguous(const struct reserved_mem *rmem);
> > +#else
> > +struct reserved_mem;
> > +
> > +static inline bool of_reserved_mem_is_contiguous(const struct reserved=
_mem *rmem)
> > +{
> > +	return false;
> > +}
> > +#endif
> > +
>=20
> Should this all go in linux/of_reserved_mem.h?
>=20
> >   #ifdef CONFIG_DMA_DECLARE_COHERENT
> >   int dma_declare_coherent_memory(struct device *dev, phys_addr_t phys_=
addr,
> >   		dma_addr_t device_addr, size_t size);
> >   void dma_release_coherent_memory(struct device *dev);
> >   int dma_alloc_from_dev_coherent(struct device *dev, ssize_t size,
> > diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> > index 8df0dfaaca18eeb0a20145512ba64425d2e7601e..ace4982e928e404315cf385=
51e1596f7ed445156 100644
> > --- a/kernel/dma/contiguous.c
> > +++ b/kernel/dma/contiguous.c
> > @@ -493,6 +493,13 @@ static int __init rmem_cma_setup(struct reserved_m=
em *rmem)
> >   		&rmem->base, (unsigned long)rmem->size / SZ_1M);
> >   	return 0;
> >   }
> >   RESERVEDMEM_OF_DECLARE(cma, "shared-dma-pool", rmem_cma_setup);
> > +
> > +bool of_reserved_mem_is_contiguous(const struct reserved_mem *rmem)
>=20
> Needing to check where the reserved mem comes from seems wrong, it hints
> that the reserved mem region drivers, like this one, are not in full cont=
rol
> of their regions. Instead of looping over all the regions in DT in the ne=
xt
> patch and searching for the owner, how about the owner (this driver) call
> into __add_cma_heap() if it chooses to expose the region in that way.
>=20
> (I know RESERVEDMEM_OF_DECLARE callbacks are done very early and the CMA-=
Heap
> driver might not be able to deal with adding heaps at this point, so maybe
> keeping a table the heaps driver can later iterate over would also work).

It's something I considered but wasn't too sure about, so I went the
less intrusive way.

I'll work on that for the next version, thanks!
Maxime

--b2q4t2bjxzo6g2kd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaG9tYwAKCRAnX84Zoj2+
dirHAX9y8X3F+DfFYUDveJIb9DstTlSvimj5QRvPEuzVfmbJoGCEVCl3SFChG0nH
Dl2sh0sBgJIDvY1QFYOlOAUR1G4Ec2V12xDBUeAYbip+I9SmiZyQ5mpDfHQUD4pH
kPC3oAIFNg==
=8N7z
-----END PGP SIGNATURE-----

--b2q4t2bjxzo6g2kd--
