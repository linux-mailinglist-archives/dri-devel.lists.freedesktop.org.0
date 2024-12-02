Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CE69E02B2
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 14:00:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1047610E730;
	Mon,  2 Dec 2024 13:00:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kfWpwYJ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E210410E72F;
 Mon,  2 Dec 2024 13:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733144451; x=1764680451;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=A0NzQvgUaRVqkjJue2Vp7eQZGT0PFqqmEXPHOJdmJpM=;
 b=kfWpwYJ/fWpEBugrnAdRK9jqFhilYEe/2QG/wf8CN/4qYEAeIJlHEDVB
 60FnlCIH53t6F0KgPdNJa/9TFwExwtfoDd4MvF7GnZCn/jC3K0FSFztDw
 openRsnV9J/bkFA3MtUAcewLyZejFM6sScwtqndeuDJ3uTeCZ+6WI7wNY
 C/PZVHPC/qmunN1whIYIaMRbNlWs4Jvb0YXXZsTLOYlzDJ7hlbCfSi5M/
 Zano6PTnZ9PW8lX/DajS5k3i/hKJaSA6R3Y25tlo3zJfmLu9nbM4AVfSk
 M8TY5zMuYHhPDezFqyZRpE3mxW5NxOGmlrnc6do8zLF+7U/MHFKXY7Std A==;
X-CSE-ConnectionGUID: qApYWvWLT6WIirf+NlVtMA==
X-CSE-MsgGUID: z+Ud8CvcS9a+TKDBPSS12A==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="44687352"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="44687352"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 05:00:50 -0800
X-CSE-ConnectionGUID: 4A7iq46XQ7yyPUzaR8L9Sw==
X-CSE-MsgGUID: vaQdtLBjQcyuthw/TOUKUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="98060450"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.72])
 ([10.245.246.72])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 05:00:47 -0800
Message-ID: <bb203f1695b12ade536dde449023a894f3b22193.camel@linux.intel.com>
Subject: Re: [PATCH v2 29/29] drm/doc: gpusvm: Add GPU SVM documentation
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Mon, 02 Dec 2024 14:00:44 +0100
In-Reply-To: <20241016032518.539495-30-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-30-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
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

On Tue, 2024-10-15 at 20:25 -0700, Matthew Brost wrote:
> Add documentation for agree upon GPU SVM design principles, current
> status, and future plans.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0Documentation/gpu/rfc/gpusvm.rst | 70
> ++++++++++++++++++++++++++++++++
> =C2=A0Documentation/gpu/rfc/index.rst=C2=A0 |=C2=A0 4 ++
> =C2=A02 files changed, 74 insertions(+)
> =C2=A0create mode 100644 Documentation/gpu/rfc/gpusvm.rst
>=20
> diff --git a/Documentation/gpu/rfc/gpusvm.rst
> b/Documentation/gpu/rfc/gpusvm.rst
> new file mode 100644
> index 000000000000..2d3f79a6c30a
> --- /dev/null
> +++ b/Documentation/gpu/rfc/gpusvm.rst
> @@ -0,0 +1,70 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +GPU SVM Section
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Agreed upon design principles
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +
> +* migrate_to_ram path
> +	* Rely on core MM concepts (migration ptes, page refs, and
> page locking)
> +	=C2=A0 only
> +	* No driver specific locks other than locks for hardware
> interaction in
> +	=C2=A0 this path

We have previously been discussing the bo lock to protect the bo from
eviction during migrate, if the vram allocation is bo-based. This is a
cross-driver lock with a well-established locking order and I suggest
we allow this. Apart from that I think the above statement needs some
elaboration: What is the problem we are trying to avoid with driver-
specific locks, written so that it's easy to understand it's a bad
idea.

> +	* Partial migration is supported

Exactly what do we mean by partial migration.

> +	* Driver handles mixed migrations via retry loops rather
> than locking
> +* Eviction
> +	* Only looking at physical memory datastructures and locks
as opposed to...

> +	* No looking at mm/vma structs or relying on those being
> locked
We're violating this with the current implementation, aren't we?


> +* GPU fault side
> +	* mmap_read only used around core MM functions which require
> this lock
> +	* Big retry loop to handle all races with the mmu notifier
> under the gpu
> +	=C2=A0 pagetable locks/mmu notifier range lock/whatever we end up
> calling
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 those
> +	* Races (especially against concurrent
> eviction/migrate_to_ram) should
> +	=C2=A0 not be handled on the fault side by trying to hold locks

This actually contradicts my comment written above about using the bo
lock to block eviction here. The alternative would be to pin vram
allocations during migration until the mm_truct has references on the
allocation, but it'd be good to clarify exactly why locking here is a
bad idea, and why we can't rely on lockdep?

> +* Physical memory to virtual backpointer
> +	* Does not work, no pointers from physical memory to virtual
> should
> +	=C2=A0 exist

We actually still have the private zdd structure, but it's strictly not
to virtual but to the allocation metadata. Is it verified that the
zone_device_data field is allowed to be modified by the pagemap between
allocation and migration?


> +* GPU pagetable locking
> +	* Notifier lock only protects range tree, pages, pagetable
> entries, and
> +	=C2=A0 mmu notifier seqno tracking, it is not a global lock to
> protect
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 against races
> +	* All races handled with big retry as mentioned above

Adding a note here about "pages valid" for subranges rather than
relying on the wider notifer seqno. I.E. a subrange can be valid even
if the notifier seqno says otherwise.

Performance considerations:
Perhaps mention that notifier (core mm) performance is more important
than gpu fault (driver) performance when considering optimizations that
improves one at the cost of the other?

> +
> +Overview of current design
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +
> +Current design is simple as possible to get a working basline in
> which can built

can be built

> +upon.
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
> concurrent GPU faults
> +	* Should be possible with fined grained locking in the
> driver GPU
> +	=C2=A0 fault handler
> +	* No expected GPU SVM changes required
> +* Ranges with mixed system and device pages
> +	* Can be added if required to drm_gpusvm_get_pages fairly
> easily
> +* Multi-GPU support
> +	* Work in progress and patches expected after initially
> landing on GPU
> +	=C2=A0 SVM
> +	* Ideally can be done with little to no changes to GPU SVM
> +* Drop ranges in favor of radix tree
> +	* May be desirable for faster notifiers
> +* Compound device pages
> +	* Nvidia, AMD, and Intel all have agreed expensive core MM
> functions in
> +	=C2=A0 migrate device layer are a performance bottleneck, having
> compound
> +	=C2=A0 device pages should help increase performance by reducing
> the number
> +	=C2=A0 of these expensive calls
> +* Higher order dma mapping for migration
> +	* 4k dma mapping adversely affects migration performance on
> Intel
> +	=C2=A0 hardware, higher order (2M) dma mapping should help here
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

Thanks,
Thomas

