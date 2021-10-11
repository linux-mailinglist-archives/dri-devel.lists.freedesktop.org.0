Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCA242954B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 19:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBAA6E907;
	Mon, 11 Oct 2021 17:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8766E901;
 Mon, 11 Oct 2021 17:08:29 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="313118535"
X-IronPort-AV: E=Sophos;i="5.85,365,1624345200"; d="scan'208";a="313118535"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 10:08:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,365,1624345200"; d="scan'208";a="526065135"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga008.fm.intel.com with ESMTP; 11 Oct 2021 10:08:28 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 11 Oct 2021 10:08:27 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 BGSMSX604.gar.corp.intel.com (10.67.234.6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 11 Oct 2021 22:38:23 +0530
Received: from fmsmsx611.amr.corp.intel.com ([10.18.126.91]) by
 fmsmsx611.amr.corp.intel.com ([10.18.126.91]) with mapi id 15.01.2242.012;
 Mon, 11 Oct 2021 10:08:22 -0700
From: "Tang, CQ" <cq.tang@intel.com>
To: "C, Ramalingam" <ramalingam.c@intel.com>, dri-devel
 <dri-devel@lists.freedesktop.org>, intel-gfx
 <intel-gfx@lists.freedesktop.org>
CC: Daniel Vetter <daniel@ffwll.ch>, "Auld, Matthew" <matthew.auld@intel.com>, 
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>
Subject: RE: [PATCH 14/14] Doc/gpu/rfc/i915: i915 DG2 uAPI
Thread-Topic: [PATCH 14/14] Doc/gpu/rfc/i915: i915 DG2 uAPI
Thread-Index: AQHXvrputm43rCifYESyi86XFy9daKvN/vpQ
Date: Mon, 11 Oct 2021 17:08:21 +0000
Message-ID: <5e402f44acc1452a95ab4f44d06ace00@intel.com>
References: <20211011161155.6397-1-ramalingam.c@intel.com>
 <20211011161155.6397-15-ramalingam.c@intel.com>
In-Reply-To: <20211011161155.6397-15-ramalingam.c@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
x-originating-ip: [10.22.254.132]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
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



> -----Original Message-----
> From: C, Ramalingam <ramalingam.c@intel.com>
> Sent: Monday, October 11, 2021 9:12 AM
> To: dri-devel <dri-devel@lists.freedesktop.org>; intel-gfx <intel-
> gfx@lists.freedesktop.org>
> Cc: Daniel Vetter <daniel@ffwll.ch>; Auld, Matthew
> <matthew.auld@intel.com>; Tang, CQ <cq.tang@intel.com>; Hellstrom,
> Thomas <thomas.hellstrom@intel.com>; C, Ramalingam
> <ramalingam.c@intel.com>; Daniel Vetter <daniel.vetter@ffwll.ch>
> Subject: [PATCH 14/14] Doc/gpu/rfc/i915: i915 DG2 uAPI
>=20
> Details of the new features getting added as part of DG2 enabling and the=
ir
> implicit impact on the uAPI.
>=20
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> cc: Matthew Auld <matthew.auld@intel.com>
> ---
>  Documentation/gpu/rfc/i915_dg2.rst | 47
> ++++++++++++++++++++++++++++++
>  Documentation/gpu/rfc/index.rst    |  3 ++
>  2 files changed, 50 insertions(+)
>  create mode 100644 Documentation/gpu/rfc/i915_dg2.rst
>=20
> diff --git a/Documentation/gpu/rfc/i915_dg2.rst
> b/Documentation/gpu/rfc/i915_dg2.rst
> new file mode 100644
> index 000000000000..a83ca26cd758
> --- /dev/null
> +++ b/Documentation/gpu/rfc/i915_dg2.rst
> @@ -0,0 +1,47 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +I915 DG2 RFC Section
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Upstream plan
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Plan to upstream the DG2 enabling is:
> +
> +* Merge basic HW enabling for DG2(Still without pciid)
> +* Merge the 64k support for lmem
> +* Merge the flat CCS enabling patches
> +* Add the pciid for DG2 and enable the DG2 in CI
> +
> +
> +64K page support for lmem
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +On DG2 hw, local-memory supports minimum GTT page size of 64k only. 4k
> is not supported anymore.
> +
> +DG2 hw dont support the 64k(lmem) and 4k(smem) pages in the same
> ppgtt
> +Page table. Refer the struct drm_i915_gem_create_ext for the implication
> of handling the 64k page size.
> +
> +.. kernel-doc:: include/uapi/drm/i915_drm.h
> +        :functions: drm_i915_gem_create_ext
> +
> +
> +flat CCS support for lmem
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +Gen 12+ devices support 3D surfaces compression and compression
> +formats. This is accomplished by an additional compression control state
> (CCS) stored for each surface.

General introduction, OK.

> +
> +Gen 12 devices(TGL and DG1) stores compression state in a separate regio=
n
> of memory.
> +It is managed by userspace and has an associated set of userspace
> +managed page tables used by hardware for address translation.

I don't know the purpose of this paragraph, do we need to mention TGL/DG1? =
This is "Gen 12", not "Gen 12+" in first paragraph.

> +
> +In Gen 12.5 devices(XEXPSDV and DG2) Flat CCS is introduced to replace
> +the userspace managed AUX pagetable with the flat indexed region of
> +device memory for storing the compression state

Because this is DG2 document, do we need to mention XeHP SDV?


> +
> +GOP Driver steals a chunk of memory for the CCS surface corresponding
> +to the entire range of local memory. The memory required for the CCS of
> +the entire local memory is
> +1/256 of the main local memory. The Gop driver will also program a
> +secure register (XEHPSDV_FLAT_CCS_BASE_ADDR 0x4910) with this address
> value.

I think it is not necessary to say the CCS base register. This is internal =
detail.

> +
> +So the Total local memory available for driver allocation is Total lmem
> +size - CCS data size

Well, we need to minus the GTT, lmem stolen (DG2 only), and WOPCM.  Maybe j=
ust say, total local memory available is smaller because of other reserved =
regions.

> +
> +Flat CCS data needs to be cleared when a lmem object is allocated. And
> +CCS data can be copied in and out of CCS region through
> XY_CTRL_SURF_COPY_BLT.

OK.

--CQ

> diff --git a/Documentation/gpu/rfc/index.rst
> b/Documentation/gpu/rfc/index.rst index 91e93a705230..afb320ed4028
> 100644
> --- a/Documentation/gpu/rfc/index.rst
> +++ b/Documentation/gpu/rfc/index.rst
> @@ -20,6 +20,9 @@ host such documentation:
>=20
>      i915_gem_lmem.rst
>=20
> +.. toctree::
> +    i915_dg2.rst
> +
>  .. toctree::
>=20
>      i915_scheduler.rst
> --
> 2.20.1

