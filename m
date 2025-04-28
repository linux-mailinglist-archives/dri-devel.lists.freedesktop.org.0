Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A36A9F4AC
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 17:40:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029E610E595;
	Mon, 28 Apr 2025 15:40:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ndJYznVl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F2910E216;
 Mon, 28 Apr 2025 15:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745854814; x=1777390814;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=HZWVWnVrgobxJLV0WGSK0gxzCivg2XZ/DVAgJBGqOEw=;
 b=ndJYznVlLZQUOnII+DVw2F/iJfCNtszDmbiIfcRUykw+9OiTG/AF5gnW
 8WOVzsqIkToBhxNXeYe1TJla6G1kFjwPBtG9qGq3AvFkRw0xgq9GPV1EP
 sIkp9OBx0H40JY6tr1ikOUWM1ZgS6tMeMiWwbbEGE+vPu6LQrLkA8caKB
 yUEAyUquSSamiE0/1MISqFLHPpU1bkiQ9AdBBLVNDgpoprCBGcrIU5H8n
 WKDsRYWniMC0ehFGKIuXL7SBe/VxrHUfLitzoTlyxltBFtue24s3R1bB+
 tc/enp5rVhB/hpsVmExBmIe6EmNrivo/RwAPvBPmbALfZH9DqnbkwbicP g==;
X-CSE-ConnectionGUID: LG+Mb1IeTuibdDKyRy0IWg==
X-CSE-MsgGUID: QZhcg433ThafNjhQFfAcww==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58102067"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="58102067"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 08:40:14 -0700
X-CSE-ConnectionGUID: rGONtg+3RreVK72AfvL80Q==
X-CSE-MsgGUID: HlqIzjBhQtqUBRWh40jljg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="134053229"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.246.179])
 ([10.245.246.179])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 08:40:10 -0700
Message-ID: <ee418b94f1952f12eccc340edab8405e76426565.camel@linux.intel.com>
Subject: Re: [PULL] drm-xe-next
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen	
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Oded Gabbay <ogabbay@kernel.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, 	dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 	intel-xe@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org
Date: Mon, 28 Apr 2025 17:40:07 +0200
In-Reply-To: <aA-QSfTtn0otDRM1@fedora>
References: <aA-QSfTtn0otDRM1@fedora>
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

On Mon, 2025-04-28 at 16:27 +0200, Thomas Hellstrom wrote:
> Hi Dave, Simona
>=20
> An additional drm-xe-next PR as requested on IRC.
> A lot of fixes but some new stuff as detailed below.
>=20
> Please note that the top commit,
>=20
> "Drop force_alloc from xe_bo_evict in selftests"
>=20
> carries a Fixes tag that is not an ancestor, but that
> commit is in drm-next so should not be a problem once
> merged, I hope.
>=20
> Thanks,
> Thomas
>=20
> drm-xe-next-2025-04-28:
> Core Changes:
> - Add drm_coredump_printer_is_full() (Matt Brost)
>=20
> Driver Changes:
> - Do not queue unneeded terminations from debugfs (Daniele)
> - Fix out-of-bound while enabling engine activity stats (Michal)
> - Use GT oriented message to report engine activity error (Michal)
> - Some fault-injection additions (Satyanarayana)
> - Fix an error pointer dereference (Harshit)
> - Fix capture of steering registers (John)
> - Use the steering flag when printing registers (John)
> - Cache DSS info when creating capture register list (John)
> - Backup VRAM in PM notifier instead of in the suspend / freeze
> =C2=A0 callbacks (Matt Auld)
> - Fix CFI violation when accessing sysfs files (Jeevaka)
> - Fix kernel version docs for temperature and fan speed (Lucas)
> - Add devcoredump chunking (Matt Brost)
> - Update xe_ttm_access_memory to use GPU for non-visible access
> =C2=A0 (Matt Brost)
> - Abort printing coredump in VM printer output if full (Matt Brost)
> - Resolve a possible circular locking dependency (Harish)
> - Don't support EU stall on SRIOV VF (Harish)
> - Drop force_alloc from xe_bo_evict in selftests (Matt Brost)
> The following changes since commit
> d755887f8e5a2a18e15e6632a5193e5feea18499:
>=20
> =C2=A0 drm/xe/dma_buf: stop relying on placement in unmap (2025-04-16
> 09:59:24 +0100)
>=20
> are available in the Git repository at:
>=20
> =C2=A0 https://gitlab.freedesktop.org/drm/xe/kernel.git=C2=A0tags/drm-xe-=
next-
> 2025-04-28
>=20
> for you to fetch changes up to
> 84a11c519234bfa3f6971f30d1a7c84077a4d681:
>=20
> =C2=A0 drm/xe: Drop force_alloc from xe_bo_evict in selftests (2025-04-27
> 19:39:06 -0700)
>=20
> ----------------------------------------------------------------
> Core Changes:
> - Add drm_coredump_printer_is_full() (Matt Brost)
>=20
> Driver Changes:
> - Do not queue unneeded terminations from debugfs (Daniele)
> - Fix out-of-bound while enabling engine activity stats (Michal)
> - Use GT oriented message to report engine activity error (Michal)
> - Some fault-injection additions (Satyanarayana)
> - Fix an error pointer dereference (Harshit)
> - Fix capture of steering registers (John)
> - Use the steering flag when printing registers (John)
> - Cache DSS info when creating capture register list (John)
> - Backup VRAM in PM notifier instead of in the suspend / freeze
> =C2=A0 callbacks (Matt Auld)
> - Fix CFI violation when accessing sysfs files (Jeevaka)
> - Fix kernel version docs for temperature and fan speed (Lucas)
> - Add devcoredump chunking (Matt Brost)
> - Update xe_ttm_access_memory to use GPU for non-visible access
> =C2=A0 (Matt Brost)
> - Abort printing coredump in VM printer output if full (Matt Brost)
> - Resolve a possible circular locking dependency (Harish)
> - Don't support EU stall on SRIOV VF (Harish)
> - Drop force_alloc from xe_bo_evict in selftests (Matt Brost)
>=20
> ----------------------------------------------------------------
> Daniele Ceraolo Spurio (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/pxp: do not queue unneeded terminat=
ions from debugfs
>=20
> Harish Chegondi (2):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/eustall: Resolve a possible circula=
r locking dependency
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/eustall: Do not support EU stall on=
 SRIOV VF
>=20
> Harshit Mogalapalli (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/svm: fix dereferencing error pointe=
r in
> drm_gpusvm_range_alloc()
>=20
> Jeevaka Prabu Badrappan (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe: Fix CFI violation when accessing s=
ysfs files
>=20
> John Harrison (3):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/guc: Fix capture of steering regist=
ers
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/guc: Use the steering flag when pri=
nting registers
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/guc: Cache DSS info when creating c=
apture register list
>=20
> Lucas De Marchi (2):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/hwmon: Fix kernel version documenta=
tion for temperature
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/hwmon: Fix kernel version documenta=
tion for fan speed
>=20
> Matthew Auld (3):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe: evict user memory in PM notifier
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe: share bo dma-resv with backup obje=
ct
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe: handle pinned memory in PM notifie=
r
>=20
> Matthew Brost (5):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe: Add devcoredump chunking
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe: Update xe_ttm_access_memory to use=
 GPU for non-visible
> access
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/print: Add drm_coredump_printer_is_ful=
l
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe: Abort printing coredump in VM prin=
ter output if full
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe: Drop force_alloc from xe_bo_evict =
in selftests
>=20
> Michal Wajdeczko (2):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/guc: Fix out-of-bound while enablin=
g engine activity
> stats
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe: Use GT oriented message to report =
engine activity error
>=20
> Satyanarayana K V P (2):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe: Introduce fault injection for guc =
mmio send/recv.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe: Introduce fault injection for guc =
CTB send/recv
>=20
> Thomas Hellstr=C3=B6m (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Merge drm/drm-next into drm-xe-next
>=20
> =C2=A0.clang-format=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 7 +
> =C2=A0.gitignore=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0


Please ignore this PR since the diffstat got excessively long. Probably
because that back-merge above was done before the previous PR was in.

I'll generate a new one.

/Thomas

