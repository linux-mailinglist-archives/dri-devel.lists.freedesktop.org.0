Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F63FA31093
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 17:03:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD6E10E23C;
	Tue, 11 Feb 2025 16:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OZ2plD9Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142EB10E23A;
 Tue, 11 Feb 2025 16:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739289796; x=1770825796;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=IHlMIaUgzxz8fzV4OZnZ5QnpTV+O3JpPoAameZPFfQg=;
 b=OZ2plD9ZExEdqG7s+PG5biC0Xi0aMjsWGULscMCAyOosg+YUjH4x25Xk
 q6NeHOpJTI18VoCVrnIfF9U+ehR1bN9L348FTVadALNRNDnYp7TJ621SU
 tWpo+YAbBm+/MFQ1oV/RICwLz+NAD1qBiiBRLBrMrfyekhU2vRYvFwI1x
 yTYt6d2uO3t5YBtWGKWjWP7y6++hobV2D+Z9rRETEcCvtf2KZ9K+gU1Cl
 eu4k+BQnHtVUmgcaS5GPoYOyiiEOlY/EhLivc0J/ndAu5spqQs/PsIPVV
 NK3P/rnE2CR8NpjUsVnZcrqrBNE8HyY80OoVhQPfkjy8Qnz8e/CQd42WV A==;
X-CSE-ConnectionGUID: blC8c9ujRzej8hzfh3PvLA==
X-CSE-MsgGUID: ioA1bxfCRymhiIKDxq1bYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39111308"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="39111308"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 08:03:15 -0800
X-CSE-ConnectionGUID: fsrimmLlRE+8Xh3Ts1SaCg==
X-CSE-MsgGUID: 1ACLRTaAQp+0VoMj6Gj1HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116636692"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.71])
 ([10.245.246.71])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 08:03:13 -0800
Message-ID: <7842182aeb75205fccde42ca4e0700a7c52bbebf.camel@linux.intel.com>
Subject: Re: [PATCH v4 04/33] drm/pagemap: Add DRM pagemap
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Tue, 11 Feb 2025 17:03:10 +0100
In-Reply-To: <Z6pIY16rfPNDS0Xr@lstrano-desk.jf.intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-5-matthew.brost@intel.com>
 <1c642a05ec279837394864e1e99226ea3e22421e.camel@linux.intel.com>
 <Z6pIY16rfPNDS0Xr@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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

On Mon, 2025-02-10 at 10:41 -0800, Matthew Brost wrote:
> On Fri, Feb 07, 2025 at 09:34:00AM +0100, Thomas Hellstr=C3=B6m wrote:
> > On Wed, 2025-01-29 at 11:51 -0800, Matthew Brost wrote:
> > > From: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > >=20
> > > Introduce drm_pagemap ops to map and unmap dma to VRAM resources.
> > > In
> > > the
> > > local memory case it's a matter of merely providing an offset
> > > into
> > > the
> > > device's physical address. For future p2p the map and unmap
> > > functions
> > > may
> > > encode as needed.
> > >=20
> > > Similar to how dma-buf works, let the memory provider
> > > (drm_pagemap)
> > > provide
> > > the mapping functionality.
> >=20
>=20
> Trying to parse all of this.=20
>=20
> > It should be noted that the long term idea for dma mapping is to
> > have
> > that done by the client instead of by the memory provider, which
> > Jason
>=20
> - Client here is the device mapping the memory.
> - Memory provider is the device where the memory is located?
>=20
> Did I get this correct?
>=20
> > reminded me of in a discussion on dri-devel. The dma-mapping here
> > is
> > modeled after how it's done for dma-buf, where the exporter maps
> > dma.
> >=20
> > So following that, it might be that we should move these dma-
> > mapping
> > ops to the drm_gpusvm().
> >=20
>=20
> So we move ops to the local client (gpusvm) rather than remote
> device,
> right?
>=20
> > The situation I can think of, where this might be a problem is that
> > if
> > the device-private struct page to dma address mapping is not known
> > to
> > the client.
> >=20
>=20
> I'm not following this but I agree if dma mapping at the client we
> need
> the remote device structure given how the dma mapping API works.
>=20
> So to wrap it up - what, if anything, do you think we need to do to
> this
> individual patch as part of this series?

I've been thinking a bit more about this, and I think a change we can
do is to rename these methods to something along device_map() and
device_unmap(). The purpose would be to emphasize that the resulting
addresses are typically not meaningful outside of the driver, and not
to be confused with standard dma-mapping.

/Thomas


>=20
> Matt
>=20
> > /Thomas
> >=20
> >=20
> >=20
> >=20
> >=20
> > >=20
> > > v3:
> > > =C2=A0- Move to drm level include
> > > v4:
> > > =C2=A0- Fix kernel doc (G.G.)
> > >=20
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > <thomas.hellstrom@linux.intel.com>
> > > ---
> > > =C2=A0include/drm/drm_pagemap.h | 105
> > > ++++++++++++++++++++++++++++++++++++++
> > > =C2=A01 file changed, 105 insertions(+)
> > > =C2=A0create mode 100644 include/drm/drm_pagemap.h
> > >=20
> > > diff --git a/include/drm/drm_pagemap.h
> > > b/include/drm/drm_pagemap.h
> > > new file mode 100644
> > > index 000000000000..2b610ccf7e30
> > > --- /dev/null
> > > +++ b/include/drm/drm_pagemap.h
> > > @@ -0,0 +1,105 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +#ifndef _DRM_PAGEMAP_H_
> > > +#define _DRM_PAGEMAP_H_
> > > +
> > > +#include <linux/dma-direction.h>
> > > +#include <linux/hmm.h>
> > > +#include <linux/types.h>
> > > +
> > > +struct drm_pagemap;
> > > +struct device;
> > > +
> > > +/**
> > > + * enum drm_interconnect_protocol - Used to identify an
> > > interconnect
> > > protocol.
> > > + */
> > > +enum drm_interconnect_protocol {
> > > +	DRM_INTERCONNECT_SYSTEM,=C2=A0=C2=A0=C2=A0 /* DMA map is system pag=
es.
> > > */
> > > +	DRM_INTERCONNECT_PCIE_P2P,=C2=A0 /* DMA map is PCIE P2P */
> > > +	DRM_INTERCONNECT_DRIVER,=C2=A0=C2=A0=C2=A0 /* DMA map is driver def=
ined
> > > */
> > > +	/* A driver can add private values beyond
> > > DRM_INTERCONNECT_DRIVER */
> > > +};
> > > +
> > > +/**
> > > + * struct drm_pagemap_dma_addr - DMA address representation.
> > > + * @addr: The dma address or driver-defined address for driver
> > > private interconnects.
> > > + * @proto: The interconnect protocol.
> > > + * @order: The page order of the dma mapping. (Size is PAGE_SIZE
> > > <<
> > > order).
> > > + * @dir: The DMA direction.
> > > + *
> > > + * Note: There is room for improvement here. We should be able
> > > to
> > > pack into
> > > + * 64 bits.
> > > + */
> > > +struct drm_pagemap_dma_addr {
> > > +	dma_addr_t addr;
> > > +	u64 proto : 54;
> > > +	u64 order : 8;
> > > +	u64 dir : 2;
> > > +};
> > > +
> > > +/**
> > > + * drm_pagemap_dma_addr_encode() - Encode a dma address with
> > > metadata
> > > + * @addr: The dma address or driver-defined address for driver
> > > private interconnects.
> > > + * @proto: The interconnect protocol.
> > > + * @order: The page order of the dma mapping. (Size is PAGE_SIZE
> > > <<
> > > order).
> > > + * @dir: The DMA direction.
> > > + *
> > > + * Return: A struct drm_pagemap_dma_addr encoding the above
> > > information.
> > > + */
> > > +static inline struct drm_pagemap_dma_addr
> > > +drm_pagemap_dma_addr_encode(dma_addr_t addr,
> > > +			=C2=A0=C2=A0=C2=A0 enum drm_interconnect_protocol
> > > proto,
> > > +			=C2=A0=C2=A0=C2=A0 unsigned int order,
> > > +			=C2=A0=C2=A0=C2=A0 enum dma_data_direction dir)
> > > +{
> > > +	return (struct drm_pagemap_dma_addr) {
> > > +		.addr =3D addr,
> > > +		.proto =3D proto,
> > > +		.order =3D order,
> > > +		.dir =3D dir,
> > > +	};
> > > +}
> > > +
> > > +/**
> > > + * struct drm_pagemap_ops: Ops for a drm-pagemap.
> > > + */
> > > +struct drm_pagemap_ops {
> > > +	/**
> > > +	 * @map_dma: Map for dma access or provide a virtual
> > > address
> > > suitable for
> > > +	 *
> > > +	 * @dpagemap: The struct drm_pagemap for the page.
> > > +	 * @dev: The dma mapper.
> > > +	 * @page: The page to map.
> > > +	 * @order: The page order of the dma mapping. (Size is
> > > PAGE_SIZE << order).
> > > +	 * @dir: The transfer direction.
> > > +	 */
> > > +	struct drm_pagemap_dma_addr (*map_dma)(struct
> > > drm_pagemap
> > > *dpagemap,
> > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device
> > > *dev,
> > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct page
> > > *page,
> > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int
> > > order,
> > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum
> > > dma_data_direction dir);
> > > +
> > > +	/**
> > > +	 * @unmap_dma: Unmap a dma address previously obtained
> > > using
> > > @map_dma.
> > > +	 *
> > > +	 * @dpagemap: The struct drm_pagemap for the mapping.
> > > +	 * @dev: The dma unmapper.
> > > +	 * @addr: The dma address obtained when mapping.
> > > +	 */
> > > +	void (*unmap_dma)(struct drm_pagemap *dpagemap,
> > > +			=C2=A0 struct device *dev,
> > > +			=C2=A0 struct drm_pagemap_dma_addr addr);
> > > +
> > > +};
> > > +
> > > +/**
> > > + * struct drm_pagemap: Additional information for a struct
> > > dev_pagemap
> > > + * used for device p2p handshaking.
> > > + * @ops: The struct drm_pagemap_ops.
> > > + * @dev: The struct drevice owning the device-private memory.
> > > + */
> > > +struct drm_pagemap {
> > > +	const struct drm_pagemap_ops *ops;
> > > +	struct device *dev;
> > > +};
> > > +
> > > +#endif
> >=20

