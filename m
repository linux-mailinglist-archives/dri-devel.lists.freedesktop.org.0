Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D24A35071
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 22:23:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED74110EBB4;
	Thu, 13 Feb 2025 21:23:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="H7ADysvA";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="QFDpXexv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b1-smtp.messagingengine.com
 (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B059C10EBB1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 21:23:24 +0000 (UTC)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal
 [10.202.2.47])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 9397B25400FA;
 Thu, 13 Feb 2025 16:23:23 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-07.internal (MEProxy); Thu, 13 Feb 2025 16:23:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1739481803;
 x=1739568203; bh=2YBwoQx1jhXXzHgwlmtwwwI5G9BcfG0CVeHyendjRs0=; b=
 H7ADysvA1CG1ZSoqTA684Un+3NSqCbcsuunC0K38ovLtObaOoRsQVmfJTIgGiSkQ
 nnG7ixpcOoGB3aRv/yLNd6q8kK6kEOcJrbWNSQZdoV8T2zhEwivzJLstW8oRxQ9+
 zdEBeBXq9bJLtWOSHs3jm41MH8DWFSAF/WpUipX/oXnSn1+EkYG9BoQXiWFjZCG+
 ufSlgxhhwN8aY+g526MyDmtLLWT0ga51+89I/cCj/ptYajMYHsC20qK2oZNxGrpS
 LFxxvD7/NB0qLsbMtNnfuvk5GHpePHuY7HqbHwvzzv6QBiVUVpgyeQJxCh4rgZQ/
 msh/JyThn9n2ng6DQNvlrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1739481803; x=1739568203; bh=2YBwoQx1jhXXzHgwlmtwwwI5G9BcfG0CVeH
 yendjRs0=; b=QFDpXexv48ZAqKGrs7/vx8vXcVPraudzI/oHc76NjOdCyiLUqNX
 79pR0pGPCAmXwYF+JSR6o0LrCscvGwR4MFHUClUZFhgD6bMyfFLjD8DyU0juhJ2e
 VNPmFL9KLk+YOsKjK9ufUuyQDw6SxWuZxccUygtCOUTsLJ1CFT8QRanZNaQAIflz
 tk4h6CfDFjguh98x2peDrlLpgUbs/Au4iYG/rVmr70dWNNMwqOOFtSkPNSyvLYcw
 rpaeWMlPkE40WdZZrh3oOxUl7oBoACwWejNpdn8Gyi1tW0FL0eiY5GcN6YaXU6Po
 Q9q2QcbnbB1YskOQnCl6PHrQ13dmcaElyGA==
X-ME-Sender: <xms:y2KuZ8_iJI2QvdNICWJXumlwijrGqdKW08RFs9WlczeAFiIc90TELA>
 <xme:y2KuZ0uoRB31QjVUhezMcd9GNISdH_PjIMMiKERFT6knkdHI7ZIvBl4L2F8t4N-GS
 7AYiuHwRjnUhaw>
X-ME-Received: <xmr:y2KuZyBi80sIaLADm92zriqcUH5yMsCs2f2OHJeFj-pfvvvG_UQFX4pOCiw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegjeekgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdej
 necuhfhrohhmpeffvghmihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeigfei
 feevfeejhfdvtdduheeftdevjeeujefgheetvdekleegudeikeffudeuvdenucffohhmrg
 hinhepfhhrvggvuggvshhkthhophdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepuddtpdhmohgu
 vgepshhmthhpohhuthdprhgtphhtthhopehmrghtthhhvgifrdgsrhhoshhtsehinhhtvg
 hlrdgtohhmpdhrtghpthhtohepihhnthgvlhdqgigvsehlihhsthhsrdhfrhgvvgguvghs
 khhtohhprdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvg
 gvuggvshhkthhophdrohhrghdprhgtphhtthhopehhihhmrghlrdhprhgrshgrugdrghhh
 ihhmihhrrgihsehinhhtvghlrdgtohhmpdhrtghpthhtoheprghpohhpphhlvgesnhhvih
 guihgrrdgtohhmpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgt
 phhtthhopehthhhomhgrshdrhhgvlhhlshhtrhhomheslhhinhhugidrihhnthgvlhdrtg
 homhdprhgtphhtthhopehsihhmohhnrgdrvhgvthhtvghrsehffhiflhhlrdgthhdprhgt
 phhtthhopehfvghlihigrdhkuhgvhhhlihhnghesrghmugdrtghomh
X-ME-Proxy: <xmx:y2KuZ8fzLHvDcsT43a7rNfHFyThzNcWDXpM9KgTGIgm_pVQAv852cQ>
 <xmx:y2KuZxNa4F4zombS3Fs3Zd1tVbpOVmnt04F-GmI_vg5LNVj4zYTulA>
 <xmx:y2KuZ2kI3voHhTTv3g89g6A7HuGvUiZzGUaahmRnb2Eo8KjQhTQajQ>
 <xmx:y2KuZzt8gY3sjA6oPfu6X22sCkcFBTWzcfWgzwYqnlQnT-7xdirl3A>
 <xmx:y2KuZyGXrVgIKoH79N0zIZcAI77WB7OG5vNshOBcV1GI8WTvn-uJDat->
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Feb 2025 16:23:22 -0500 (EST)
Date: Thu, 13 Feb 2025 16:23:06 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: Re: [PATCH v5 00/32] Introduce GPU SVM and Xe SVM implementation
Message-ID: <Z65ix566lLCPOsob@itl-email>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1VPiR4+hFRDhCtB9"
Content-Disposition: inline
In-Reply-To: <20250213021112.1228481-1-matthew.brost@intel.com>
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


--1VPiR4+hFRDhCtB9
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Feb 2025 16:23:06 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
	thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
	felix.kuehling@amd.com, dakr@kernel.org
Subject: Re: [PATCH v5 00/32] Introduce GPU SVM and Xe SVM implementation

On Wed, Feb 12, 2025 at 06:10:40PM -0800, Matthew Brost wrote:
> Version 5 of GPU SVM. Thanks to everyone (especially Sima, Thomas,
> Alistair, Himal) for their numerous reviews on revision 1, 2, 3  and for
> helping to address many design issues.
>=20
> This version has been tested with IGT [1] on PVC, BMG, and LNL. Also
> tested with level0 (UMD) PR [2].

What is the plan to deal with not being able to preempt while a page
fault is pending?  This seems like an easy DoS vector.  My understanding
is that SVM is mostly used by compute workloads on headless systems.
Recent AMD client GPUs don't support SVM, so programs that want to run
on client systems should not require SVM if they wish to be portable.

Given the potential for abuse, I think it would be best to require
explicit administrator opt-in to enable SVM, along with possibly having
a timeout to resolve a page fault (after which the context is killed).
Since I expect most uses of SVM to be in the datacenter space (for the
reasons mentioned above), I don't believe this will be a major
limitation in practice.  Programs that wish to run on client systems
already need to use explicit memory transfer or pinned userptr, and
administrators of compute clusters should be willing to enable this
feature because only one workload will be using a GPU at a time.

> Major changes in v2:
> - Dropped mmap write abuse
> - core MM locking and retry loops instead of driver locking to avoid races
> - Removed physical to virtual references
> - Embedded structure/ops for drm_gpusvm_devmem
> - Fixed mremap and fork issues
> - Added DRM pagemap
> - Included RFC documentation in the kernel doc
>=20
> Major changes in v3:
> - Move GPU SVM and DRM pagemap to DRM level
> - Mostly addresses Thomas's feedback, lots of small changes documented
>   in each individual patch change log
>=20
> Major changes in v4:
> - Pull documentation patch in
> - Fix Kconfig / VRAM migration issue
> - Address feedback which came out of internal multi-GPU implementation
>=20
> Major changes in v5:
> - Rebase on s/xe_mem_region/xe_vram_region
> - Bit for uAPI has changed given PXP has landed
>=20
> Known issues in v5:
> - Check pages still exists, changed to threshold in this version which
>   is better but still need to root cause cross process page finding on
>   small user allocations.
>=20
> Matt
>=20
> [1] https://patchwork.freedesktop.org/series/137545/#rev3
> [2] https://github.com/intel/compute-runtime/pull/782
>=20
> Matthew Brost (28):
>   drm/xe: Retry BO allocation
>   mm/migrate: Add migrate_device_pfns
>   mm/migrate: Trylock device page in do_swap_page
>   drm/gpusvm: Add support for GPU Shared Virtual Memory
>   drm/xe: Select DRM_GPUSVM Kconfig
>   drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR
>   drm/xe: Add SVM init / close / fini to faulting VMs
>   drm/xe: Nuke VM's mapping upon close
>   drm/xe: Add SVM range invalidation and page fault
>   drm/gpuvm: Add DRM_GPUVA_OP_DRIVER
>   drm/xe: Add (re)bind to SVM page fault handler
>   drm/xe: Add SVM garbage collector
>   drm/xe: Add unbind to SVM garbage collector
>   drm/xe: Do not allow CPU address mirror VMA unbind if the GPU has
>     bindings
>   drm/xe: Enable CPU address mirror uAPI
>   drm/xe/uapi: Add DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
>   drm/xe: Add migrate layer functions for SVM support
>   drm/xe: Add SVM device memory mirroring
>   drm/xe: Add drm_gpusvm_devmem to xe_bo
>   drm/xe: Add GPUSVM device memory copy vfunc functions
>   drm/xe: Add Xe SVM populate_devmem_pfn GPU SVM vfunc
>   drm/xe: Add Xe SVM devmem_release GPU SVM vfunc
>   drm/xe: Add SVM VRAM migration
>   drm/xe: Basic SVM BO eviction
>   drm/xe: Add SVM debug
>   drm/xe: Add modparam for SVM notifier size
>   drm/xe: Add always_migrate_to_vram modparam
>   drm/doc: gpusvm: Add GPU SVM documentation
>=20
> Thomas Hellstr=C3=B6m (4):
>   drm/pagemap: Add DRM pagemap
>   drm/xe/bo: Introduce xe_bo_put_async
>   drm/xe: Add dma_addr res cursor
>   drm/xe: Add drm_pagemap ops to SVM
>=20
>  Documentation/gpu/rfc/gpusvm.rst            |   84 +
>  Documentation/gpu/rfc/index.rst             |    4 +
>  drivers/gpu/drm/Kconfig                     |    9 +
>  drivers/gpu/drm/Makefile                    |    1 +
>  drivers/gpu/drm/drm_gpusvm.c                | 2230 +++++++++++++++++++
>  drivers/gpu/drm/xe/Kconfig                  |   10 +
>  drivers/gpu/drm/xe/Makefile                 |    1 +
>  drivers/gpu/drm/xe/xe_bo.c                  |   54 +
>  drivers/gpu/drm/xe/xe_bo.h                  |   20 +
>  drivers/gpu/drm/xe/xe_bo_types.h            |    4 +
>  drivers/gpu/drm/xe/xe_device.c              |    3 +
>  drivers/gpu/drm/xe/xe_device_types.h        |   22 +
>  drivers/gpu/drm/xe/xe_gt_pagefault.c        |   18 +-
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   22 +
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |    2 +
>  drivers/gpu/drm/xe/xe_migrate.c             |  175 ++
>  drivers/gpu/drm/xe/xe_migrate.h             |   10 +
>  drivers/gpu/drm/xe/xe_module.c              |    7 +
>  drivers/gpu/drm/xe/xe_module.h              |    2 +
>  drivers/gpu/drm/xe/xe_pt.c                  |  393 +++-
>  drivers/gpu/drm/xe/xe_pt.h                  |    5 +
>  drivers/gpu/drm/xe/xe_pt_types.h            |    2 +
>  drivers/gpu/drm/xe/xe_query.c               |    5 +-
>  drivers/gpu/drm/xe/xe_res_cursor.h          |  116 +-
>  drivers/gpu/drm/xe/xe_svm.c                 |  964 ++++++++
>  drivers/gpu/drm/xe/xe_svm.h                 |   96 +
>  drivers/gpu/drm/xe/xe_tile.c                |    5 +
>  drivers/gpu/drm/xe/xe_vm.c                  |  374 +++-
>  drivers/gpu/drm/xe/xe_vm.h                  |   15 +-
>  drivers/gpu/drm/xe/xe_vm_types.h            |   57 +
>  include/drm/drm_gpusvm.h                    |  507 +++++
>  include/drm/drm_gpuvm.h                     |    5 +
>  include/drm/drm_pagemap.h                   |  105 +
>  include/linux/migrate.h                     |    1 +
>  include/uapi/drm/xe_drm.h                   |   22 +-
>  mm/memory.c                                 |   13 +-
>  mm/migrate_device.c                         |  116 +-
>  37 files changed, 5326 insertions(+), 153 deletions(-)
>  create mode 100644 Documentation/gpu/rfc/gpusvm.rst
>  create mode 100644 drivers/gpu/drm/drm_gpusvm.c
>  create mode 100644 drivers/gpu/drm/xe/xe_svm.c
>  create mode 100644 drivers/gpu/drm/xe/xe_svm.h
>  create mode 100644 include/drm/drm_gpusvm.h
>  create mode 100644 include/drm/drm_pagemap.h
>=20
> --=20
> 2.34.1
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--1VPiR4+hFRDhCtB9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmeuYsIACgkQszaHOrMp
8lOOxBAAi6IRIrbovubZoNdKoggeYgY+mCBC1yyuti6IOaSL58kNPkU0lU0nSv8G
UIk1B9020xRtug2BaOV/82VB/KGLrWBhmD/G9bhFDULC9+ZI6WxpagwaBL9k5hxj
tGGUbmUGN6YbLXQJkL4NJNNhmnAmqcl5LdTVWRkAkCoN5Y+JRbmpnS023N7KlbOi
R1iE2JjQKwMOrzKUZ6gcoDx2+Y4IOMhZeRdyf5nTCKbC76OgrllUUP7oJR8z5rXx
fTkQBLFwS6XnTnbzQXn1dAqSz7JCX9B6nmaN/ijLLWskIwMBKL3F1VZnb9h/Vpfv
RwxghozM8KfclX3MFAeaEEmRnTSgiqfFzyxaC8igAV+rIY7BZC08mQjnib/33SJ9
u98pt8yJBwLI2X4vvcf4e/Yl2v0T1r2ugVrNj/geA7rITzuXnSFrAslSHaBGEJ4R
iYcr3BFEVELICyTVRzTBTWgbGjYkJXnqU3NxFPllxdYAoAYY6BQuomxq/IKgJJ+e
CwmqhYyTDoyNX0p8K+LCqHKHjElkp8CPqOVnYKJMRTR97gOz9O5X1/ATrLqtXahQ
uHCLBKEJsswqrIP8l+zYL/oden6Wa2jCU9tYrrTadJBV7OeNpHOz0YyXbhQYp1Co
B5uVutynNBfux52V/Aql3YVbAmWHzMfX/FErFuLQcnatOWgLASo=
=onyn
-----END PGP SIGNATURE-----

--1VPiR4+hFRDhCtB9--
