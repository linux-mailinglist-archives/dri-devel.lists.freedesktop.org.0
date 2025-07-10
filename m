Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF687AFFB37
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 09:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537A510E1B0;
	Thu, 10 Jul 2025 07:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZBtK6QCz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7728110E1B0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 07:44:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B66D8A5431C;
 Thu, 10 Jul 2025 07:44:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10819C4CEE3;
 Thu, 10 Jul 2025 07:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752133489;
 bh=b3Rdbdf5MNwNMAtyitEKPxtTnss96mJKH9ynZvJLS8Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZBtK6QCzjWH7FsS27j9XD+N0h2S++QDXv+gOAh9fbbGuLZKCgE6cMHt+pWvUjikG4
 JoAa5A4gHENBPMVSvo6swTHfUMuSGR3qrpu1p7W5sdEKrzL9n6WXjKc6QUTi2QI8WB
 A8uZJtm/ta5m1vxe2ePJGAQHKCpBcRsYC/lV8vRsIP12QJN8/Kb+jWFoUmH8pNZlfL
 aYi4ii3Bc0akOBPclJR6SARhg9e45GoJPZDGxRyTil1LCBiEPiEk2NkYDhQhIAKySB
 Y0+WhJ/0mVe52qQHC+gf36jU7UpiAPg8XpfVFzb8mwn+rO0hRmeCgSOezPYXhcj/bu
 dk69Jm3CIKCjQ==
Date: Thu, 10 Jul 2025 09:44:47 +0200
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
Subject: Re: [PATCH v6 2/2] dma-buf: heaps: cma: Create CMA heap for each CMA
 reserved region
Message-ID: <20250710-daft-secret-squid-fb3eee@houat>
References: <20250709-dma-buf-ecc-heap-v6-0-dac9bf80f35d@kernel.org>
 <20250709-dma-buf-ecc-heap-v6-2-dac9bf80f35d@kernel.org>
 <6045bcfb-35ef-410b-bd7c-0ca7c5c589c4@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="2ftlwphj6gvo3egm"
Content-Disposition: inline
In-Reply-To: <6045bcfb-35ef-410b-bd7c-0ca7c5c589c4@ti.com>
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


--2ftlwphj6gvo3egm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 2/2] dma-buf: heaps: cma: Create CMA heap for each CMA
 reserved region
MIME-Version: 1.0

On Wed, Jul 09, 2025 at 11:14:37AM -0500, Andrew Davis wrote:
> On 7/9/25 7:44 AM, Maxime Ripard wrote:
> > Aside from the main CMA region, it can be useful to allow userspace to
> > allocate from the other CMA reserved regions.
> >=20
> > Indeed, those regions can have specific properties that can be useful to
> > a specific us-case.
> >=20
> > For example, one of them platform I've been with has ECC enabled on the
> > entire memory but for a specific region. Using that region to allocate
> > framebuffers can be particular beneficial because enabling the ECC has a
> > performance and memory footprint cost.
> >=20
> > Thus, exposing these regions as heaps user-space can allocate from and
> > import wherever needed allows to cover that use-case.
> >=20
> > For now, only shared-dma-pools regions with the reusable property (ie,
> > backed by CMA) are supported, but eventually we'll want to support other
> > DMA pools types.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >   drivers/dma-buf/heaps/cma_heap.c | 52 +++++++++++++++++++++++++++++++=
++++++++-
> >   1 file changed, 51 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/c=
ma_heap.c
> > index 0df007111975447d555714d61ead9699287fd65a..31a18683ee25788a800f3f8=
78fd958718a930ff7 100644
> > --- a/drivers/dma-buf/heaps/cma_heap.c
> > +++ b/drivers/dma-buf/heaps/cma_heap.c
> > @@ -19,10 +19,12 @@
> >   #include <linux/err.h>
> >   #include <linux/highmem.h>
> >   #include <linux/io.h>
> >   #include <linux/mm.h>
> >   #include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_reserved_mem.h>
> >   #include <linux/scatterlist.h>
> >   #include <linux/slab.h>
> >   #include <linux/vmalloc.h>
> >   #define DEFAULT_CMA_NAME "default_cma_region"
> > @@ -421,7 +423,55 @@ static int __init add_default_cma_heap(void)
> >   				ERR_PTR(ret));
> >   	}
> >   	return 0;
> >   }
> > -module_init(add_default_cma_heap);
> > +
> > +static int __init add_cma_heaps(void)
> > +{
> > +	struct device_node *rmem_node;
> > +	struct device_node *node;
> > +	int ret;
> > +
> > +	ret =3D add_default_cma_heap();
>=20
> Will this double add the default CMA region if it was declared
> using DT (reserved-memory) when all those nodes are again scanned
> through below? Might need a check in that loop for linux,cma-default.

Yeah, but we probably should anyway. Otherwise, if linux,cma-default
ever change on a platform, we would get heaps appearing/disappearing as
we reboot, which doesn't sound great from a regression perspective.

Both would allocate from the same pool though, so we don't risk stepping
into each others toes. Or am I missing something?

> > +	if (ret)
> > +		return ret;
> > +
> > +	rmem_node =3D of_find_node_by_path("/reserved-memory");
> > +	if (!rmem_node)
> > +		goto out;
>=20
> Can just return here, "out" path doesn't need to put a NULL node.

Oh, right. Thanks!
Maxime

--2ftlwphj6gvo3egm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaG9vbgAKCRAnX84Zoj2+
dhE7AX4qkBWa5ZWiID3zn8WXSc0q1AtFAPMK56gTj7jnaDHxnE1SSQcTUZlRCu9C
slsYIiEBfjo//pmNGOx7O0UkqHsO1eIaZGLtBbckuR5ZibGSaAiwWITXBzaZc85V
4qMLp8n/JA==
=Wof7
-----END PGP SIGNATURE-----

--2ftlwphj6gvo3egm--
