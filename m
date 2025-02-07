Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3A5A2C649
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 15:54:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD9E10EB28;
	Fri,  7 Feb 2025 14:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hFIjYAay";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0545610EB28;
 Fri,  7 Feb 2025 14:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738940077; x=1770476077;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=2R28/enDT/jyucKOu85Cf3H/mEya1V2Ubcybmz292Ps=;
 b=hFIjYAay48MA1q4oRwGn+0s+fwR+O0PFt30sx9suj20W+kf69yz7421t
 T2kecLIrFX3nA18aCDoyrN48V22b8oWuC8DXHBlWnNZ4FpBK9RCjLBAeS
 RYhz45C5HvfJUmCUxx/dO29odiqwj4DhpgoaHNczwFPCCN6ipbV8F0t0Y
 2ULCE3gQ2DDbiL7c0y2QzYFvBC6piUb0WsTl9hhVIUIvpI63IDtmgIb9e
 nTSZ+IAEj56lrCSGpR0OiEH3bKNwzA+DrmuEEaVuK7mNm0l/A9/Jw+91V
 y+xk1OdxebQT5/TZou1+5FqJcDXuzl4hON16X8O56pUjY2hXpCFIYRF4M w==;
X-CSE-ConnectionGUID: j13JKyy9Ta+0RxIhXRUn6A==
X-CSE-MsgGUID: FzdIz0FWRlevxiMMFOtmmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="50563474"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="50563474"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 06:54:36 -0800
X-CSE-ConnectionGUID: BRLmwAsxQ/mc2//jSdoOmw==
X-CSE-MsgGUID: /iMHUMvCSse3rJMrmslB9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="116487164"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.246.108])
 ([10.245.246.108])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 06:54:34 -0800
Message-ID: <93607383b62b0eaf147d0858bd51c01dc6952b36.camel@linux.intel.com>
Subject: Re: [PATCH v4 33/33] drm/doc: gpusvm: Add GPU SVM documentation
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Fri, 07 Feb 2025 15:54:31 +0100
In-Reply-To: <20250129195212.745731-34-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-34-matthew.brost@intel.com>
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

On Wed, 2025-01-29 at 11:52 -0800, Matthew Brost wrote:
> Add documentation for agree upon GPU SVM design principles, current
> status, and future plans.
>=20
> v4:
> =C2=A0- Address Thomas's feedback
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0Documentation/gpu/rfc/gpusvm.rst | 84
> ++++++++++++++++++++++++++++++++
> =C2=A0Documentation/gpu/rfc/index.rst=C2=A0 |=C2=A0 4 ++
> =C2=A02 files changed, 88 insertions(+)
> =C2=A0create mode 100644 Documentation/gpu/rfc/gpusvm.rst
>=20
> diff --git a/Documentation/gpu/rfc/gpusvm.rst
> b/Documentation/gpu/rfc/gpusvm.rst
> new file mode 100644
> index 000000000000..2d88f5981981
> --- /dev/null
> +++ b/Documentation/gpu/rfc/gpusvm.rst
> @@ -0,0 +1,84 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +GPU SVM Section
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Agreed upon design principles
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +
> +* migrate_to_ram path
> +	* Rely only on core MM concepts (migration PTEs, page
> references, and
> +	=C2=A0 page locking). The reasoning is that this is not required,
> can lead to
> +	=C2=A0 livelock cases, and is generally not a good idea to seal
> races using
> +	=C2=A0 driver-invented locks.
> +	* No driver specific locks other than locks for hardware
> interaction in
> +	=C2=A0 this path.
> +	* Partial migration is supported (i.e., a subset of pages
> attempting to
> +	=C2=A0 migrate can actually migrate, with only the faulting page
> guaranteed
> +	=C2=A0 to migrate).
> +	* Driver handles mixed migrations via retry loops rather
> than locking.
> +* Eviction
> +	* Only looking at physical memory data structures and locks
> as opposed to
> +	=C2=A0 looking at virtual memory data structures and locks.
> +	* No looking at mm/vma structs or relying on those being
> locked.
> +* GPU fault side
> +	* mmap_read only used around core MM functions which require
> this lock
> +	=C2=A0 and should strive to take mmap_read lock only in GPU SVM
> layer.
> +	* Big retry loop to handle all races with the mmu notifier
> under the gpu
> +	=C2=A0 pagetable locks/mmu notifier range lock/whatever we end up
> calling
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 those.
> +	* Races (especially against concurrent eviction or
> migrate_to_ram)
> +	=C2=A0 should not be handled on the fault side by trying to hold
> locks;
> +	=C2=A0 rather, they should be handled using retry loops. One
> possible
> +	=C2=A0 exception is holding a BO's dma-resv lock during the
> initial migration
> +	=C2=A0 to VRAM, as this is a well-defined lock that can be taken
> underneath
> +	=C2=A0 the mmap_read lock.
> +* Physical memory to virtual backpointer
> +	* Does not work, no pointers from physical memory to virtual
> should
> +	=C2=A0 exist.
> +	* Physical memory backpointer (page->zone_device_data)
> should be stable
> +	=C2=A0 from allocation to page free.
> +* GPU pagetable locking
> +	* Notifier lock only protects range tree, pages valid state
> for a range
> +	=C2=A0 (rather than seqno due to wider notifiers), pagetable
> entries, and
> +	=C2=A0 mmu notifier seqno tracking, it is not a global lock to
> protect
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 against races.
> +	* All races handled with big retry as mentioned above.
> +
> +Overview of current design
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +
> +Current design is simple as possible to get a working basline in

baseline

With that fixed,
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> which can be
> +built upon.
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/drm_gpusvm.c
> +=C2=A0=C2=A0 :doc: Overview
> +=C2=A0=C2=A0 :doc: Locking
> +=C2=A0=C2=A0 :doc: Migrataion
> +=C2=A0=C2=A0 :doc: Partial Unmapping of Ranges
> +=C2=A0=C2=A0 :doc: Examples
> +
> +Possible future design features
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +
> +* Concurrent GPU faults
> +	* CPU faults are concurrent so makes sense to have
> concurrent GPU
> +	=C2=A0 faults.
> +	* Should be possible with fined grained locking in the
> driver GPU
> +	=C2=A0 fault handler.
> +	* No expected GPU SVM changes required.
> +* Ranges with mixed system and device pages
> +	* Can be added if required to drm_gpusvm_get_pages fairly
> easily.
> +* Multi-GPU support
> +	* Work in progress and patches expected after initially
> landing on GPU
> +	=C2=A0 SVM.
> +	* Ideally can be done with little to no changes to GPU SVM.
> +* Drop ranges in favor of radix tree
> +	* May be desirable for faster notifiers.
> +* Compound device pages
> +	* Nvidia, AMD, and Intel all have agreed expensive core MM
> functions in
> +	=C2=A0 migrate device layer are a performance bottleneck, having
> compound
> +	=C2=A0 device pages should help increase performance by reducing
> the number
> +	=C2=A0 of these expensive calls.
> +* Higher order dma mapping for migration
> +	* 4k dma mapping adversely affects migration performance on
> Intel
> +	=C2=A0 hardware, higher order (2M) dma mapping should help here.
> diff --git a/Documentation/gpu/rfc/index.rst
> b/Documentation/gpu/rfc/index.rst
> index 476719771eef..396e535377fb 100644
> --- a/Documentation/gpu/rfc/index.rst
> +++ b/Documentation/gpu/rfc/index.rst
> @@ -16,6 +16,10 @@ host such documentation:
> =C2=A0* Once the code has landed move all the documentation to the right
> places in
> =C2=A0=C2=A0 the main core, helper or driver sections.
> =C2=A0
> +.. toctree::
> +
> +=C2=A0=C2=A0=C2=A0 gpusvm.rst
> +
> =C2=A0.. toctree::
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 i915_gem_lmem.rst

