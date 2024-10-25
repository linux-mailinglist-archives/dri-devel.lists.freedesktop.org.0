Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281F49AFB22
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 09:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9248510EA0F;
	Fri, 25 Oct 2024 07:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HDP2mQ0k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E0410EA17;
 Fri, 25 Oct 2024 07:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729841494; x=1761377494;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wgKSaQis4zdZUO9DbmJ3oOFTjhRBFeYyBYuqbSUl1j4=;
 b=HDP2mQ0k2BWsYhRfT2bGmX8GTJbf+3SKhX721vm89eMNJ9Sr4epB/Sff
 OqPEUqmoSL6yHDh2jrEJGoi4kozOj63v9K2/KJq4tstInum/JmM6P7vdY
 JLjGlM3p5LiB8a/Hxj2Wfpy3zSg4wKCLBQ76Ec8KWvNILVa1dDEZk9jmS
 8axLM96lBDfLD3huUPl5SpioUlDB2qH6457gBbjEowJkbpTYS0Hlscdd4
 FPM9jUGSTHZY92DJr6x1QOgt7u8orQsIGxvKEDTkTRhw6R/6pnFIzmvnJ
 u8mLQO4dYM1+YK6KSsrqCOCI8c2wdBx+1RrpsgZxzRnquUVfbFnauI3UB w==;
X-CSE-ConnectionGUID: tzRd5VoETN20K6jtaydmCA==
X-CSE-MsgGUID: hhDiX8eFQjO35n/IZF7zog==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40609824"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40609824"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 00:31:33 -0700
X-CSE-ConnectionGUID: z9KtXCqwRpmCiRWA+ApLMQ==
X-CSE-MsgGUID: BZb7GytMRj2FDhBlL3JDZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="80751856"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO [10.245.246.191])
 ([10.245.246.191])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 00:31:28 -0700
Message-ID: <dfdd7040f846234cc4ec18d71e4e4746739c1848.camel@linux.intel.com>
Subject: Re: [PULL] drm-xe-next
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Date: Fri, 25 Oct 2024 09:30:59 +0200
In-Reply-To: <ZxqeXxbcdVt8lN4k@DUT025-TGLU.fm.intel.com>
References: <ZxqJS8bCWc9ZgIav@fedora>
 <ZxqeXxbcdVt8lN4k@DUT025-TGLU.fm.intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

On Thu, 2024-10-24 at 19:22 +0000, Matthew Brost wrote:
> On Thu, Oct 24, 2024 at 07:52:11PM +0200, Thomas Hellstrom wrote:
> > Hi, Dave & Simona,
> >=20
> > This week's drm-xe-next PR
> >=20
> > Thanks,
> > Thomas
> >=20
> >=20
> > drm-xe-next-2024-10-24:
> > UAPI Changes:
> > - Define and parse OA sync properties (Ashutosh)
> >=20
> > Driver Changes:
> > - Add caller info to xe_gt_reset_async (Nirmoy)
> > - A large forcewake rework / cleanup (Himal)
> > - A g2h response timeout fix (Badal)
> > - A PTL workaround (Vinay)
> > - Handle unreliable MMIO reads during forcewake (Shuicheng)
> > - Ufence user-space access fixes (Nirmoy)
> > - Annotate flexible arrays (Matthew Brost)
> > - Enable GuC lite restore (Fei)
> > - Prevent GuC register capture on VF (Zhanjun)
> > - Show VFs VRAM / LMEM provisioning summary over debugfs (Michal)
> > - Parallel queues fix on GT reset (Nirmoy)
> > - Move reference grabbing to a job's dma-fence (Matt Brost)
> > - Mark a number of local workqueues WQ_MEM_RECLAIM (Matt Brost)
>=20
> This breaks CI [1] - my mistake. Maybe omit these in this weeks PR.
>=20
> We need [2] merged to fix this. Waiting on an RB but I'd like to get
> all of this in 6.12.
>=20
> Matt
>=20
> [1]
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v2/bat-lnl-1/igt@xe=
_exec_fault_mode@twice-invalid-fault.html
> [2] https://patchwork.freedesktop.org/series/140406/

So this CI failure is a warning only and IMHO for drm-xe-next (6.13)
it's not catastrophic. There might be a window in the bisect history
where this warning appears. It's perhaps more important for -fixes,
though.

If we need to wait for the scheduler patch going into drm-misc-next /
drm-next/ backmerge we'd hold off this branch for too long I fear.

@Dave, @Sima=20
If you feel differently please skip this PR for this week and we'll
work to get the scheduler patch merged asap.

Thanks,
Thomas


>=20
> > - OA synchronization support (Ashutosh)
> >=20
> > The following changes since commit
> > 2eb460ab9f4bc5b575f52568d17936da0af681d8:
> >=20
> > =C2=A0 drm/xe: Enlarge the invalidation timeout from 150 to 500 (2024-
> > 10-16 16:11:10 +0100)
> >=20
> > are available in the Git repository at:
> >=20
> > =C2=A0 https://gitlab.freedesktop.org/drm/xe/kernel.git=C2=A0tags/drm-x=
e-
> > next-2024-10-24
> >=20
> > for you to fetch changes up to
> > 85d3f9e84e0628c412b69aa99b63654dfa08ad68:
> >=20
> > =C2=A0 drm/xe/oa: Allow only certain property changes from config (2024=
-
> > 10-23 12:42:20 -0700)
> >=20
> > ----------------------------------------------------------------
> > UAPI Changes:
> > - Define and parse OA sync properties (Ashutosh)
> >=20
> > Driver Changes:
> > - Add caller info to xe_gt_reset_async (Nirmoy)
> > - A large forcewake rework / cleanup (Himal)
> > - A g2h response timeout fix (Badal)
> > - A PTL workaround (Vinay)
> > - Handle unreliable MMIO reads during forcewake (Shuicheng)
> > - Ufence user-space access fixes (Nirmoy)
> > - Annotate flexible arrays (Matthew Brost)
> > - Enable GuC lite restore (Fei)
> > - Prevent GuC register capture on VF (Zhanjun)
> > - Show VFs VRAM / LMEM provisioning summary over debugfs (Michal)
> > - Parallel queues fix on GT reset (Nirmoy)
> > - Move reference grabbing to a job's dma-fence (Matt Brost)
> > - Mark a number of local workqueues WQ_MEM_RECLAIM (Matt Brost)
> > - OA synchronization support (Ashutosh)
> >=20
> > ----------------------------------------------------------------
> > Ashutosh Dixit (7):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/oa: Separate batch submission fro=
m waiting for
> > completion
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/oa/uapi: Define and parse OA sync=
 properties
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/oa: Add input fence dependencies
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/oa: Signal output fences
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/oa: Move functions up so they can=
 be reused for config
> > ioctl
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/oa: Add syncs support to OA confi=
g ioctl
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/oa: Allow only certain property c=
hanges from config
> >=20
> > Badal Nilawar (1):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/guc/ct: Flush g2h worker in case =
of g2h response
> > timeout
> >=20
> > Fei Yang (1):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe: enable lite restore
> >=20
> > Himal Prasad Ghimiray (26):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe: Add member initialized_domains t=
o xe_force_wake()
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/forcewake: Change awake_domain da=
tatype
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/forcewake: Add a helper xe_force_=
wake_ref_has_domain()
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe: Error handling in xe_force_wake_=
get()
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe: Modify xe_force_wake_put to hand=
le _get returned mask
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/device: Update handling of xe_for=
ce_wake_get return
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/hdcp: Update handling of xe_force=
_wake_get return
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/gsc: Update handling of xe_force_=
wake_get return
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/gt: Update handling of xe_force_w=
ake_get return
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/xe_gt_idle: Update handling of xe=
_force_wake_get
> > return
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/devcoredump: Update handling of x=
e_force_wake_get
> > return
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/tests/mocs: Update xe_force_wake_=
get() return handling
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/mocs: Update handling of xe_force=
_wake_get return
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/xe_drm_client: Update handling of=
 xe_force_wake_get
> > return
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/xe_gt_debugfs: Update handling of=
 xe_force_wake_get
> > return
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/guc: Update handling of xe_force_=
wake_get return
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/huc: Update handling of xe_force_=
wake_get return
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/oa: Handle force_wake_get failure=
 in
> > xe_oa_stream_init()
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/pat: Update handling of xe_force_=
wake_get return
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/gt_tlb_invalidation_ggtt: Update =
handling of
> > xe_force_wake_get return
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/xe_reg_sr: Update handling of xe_=
force_wake_get return
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/query: Update handling of xe_forc=
e_wake_get return
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/vram: Update handling of xe_force=
_wake_get return
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe: forcewake debugfs open fails on =
xe_forcewake_get
> > failure
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe: Ensure __must_check for xe_force=
_wake_get() return
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe: Change return type to void for x=
e_force_wake_put
> >=20
> > Matthew Brost (5):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe: Use __counted_by for flexible ar=
rays
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe: Take ref to job's fence in arm
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe: Mark GGTT work queue with WQ_MEM=
_RECLAIM
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe: Mark G2H work queue with WQ_MEM_=
RECLAIM
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe: Mark GT work queue with WQ_MEM_R=
ECLAIM
> >=20
> > Michal Wajdeczko (1):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/pf: Show VFs LMEM provisioning su=
mmary over debugfs
> >=20
> > Nirmoy Das (4):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe: Add caller info to xe_gt_reset_a=
sync
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/ufence: Prefetch ufence addr to c=
atch bogus address
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/ufence: Warn if mmget_not_zero() =
fails
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe: Don't restart parallel queues mu=
ltiple times on GT
> > reset
> >=20
> > Shuicheng Lin (1):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe: Handle unreliable MMIO reads dur=
ing forcewake
> >=20
> > Vinay Belgaumkar (1):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/ptl: Apply Wa_14022866841
> >=20
> > Zhanjun Dong (1):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/guc: Prevent GuC register capture=
 running on VF
> >=20
> > =C2=A0drivers/gpu/drm/xe/abi/guc_klvs_abi.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0drivers/gpu/drm/xe/display/xe_hdcp_gsc.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 6 +-
> > =C2=A0drivers/gpu/drm/xe/tests/xe_mocs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 18 +-
> > =C2=A0drivers/gpu/drm/xe/xe_debugfs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 27 +-
> > =C2=A0drivers/gpu/drm/xe/xe_devcoredump.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 14 +-
> > =C2=A0drivers/gpu/drm/xe/xe_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 25 +-
> > =C2=A0drivers/gpu/drm/xe/xe_drm_client.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> > =C2=A0drivers/gpu/drm/xe/xe_exec_queue_types.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 2 +-
> > =C2=A0drivers/gpu/drm/xe/xe_execlist.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A0drivers/gpu/drm/xe/xe_force_wake.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 134 ++++--
> > =C2=A0drivers/gpu/drm/xe/xe_force_wake.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 23 +-
> > =C2=A0drivers/gpu/drm/xe/xe_force_wake_types.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 6 +-
> > =C2=A0drivers/gpu/drm/xe/xe_ggtt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A0drivers/gpu/drm/xe/xe_gsc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 23 +-
> > =C2=A0drivers/gpu/drm/xe/xe_gsc_proxy.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +-
> > =C2=A0drivers/gpu/drm/xe/xe_gt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 110 +++--
> > =C2=A0drivers/gpu/drm/xe/xe_gt_debugfs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 13 +-
> > =C2=A0drivers/gpu/drm/xe/xe_gt_idle.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 26 +-
> > =C2=A0drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c=C2=A0 |=C2=A0 35 ++
> > =C2=A0drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h=C2=A0 |=C2=A0=C2=A0 1 =
+
> > =C2=A0drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c |=C2=A0=C2=A0 5 +
> > =C2=A0drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |=C2=A0=C2=A0 5 +-
> > =C2=A0drivers/gpu/drm/xe/xe_guc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 15 +-
> > =C2=A0drivers/gpu/drm/xe/xe_guc_ads.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +
> > =C2=A0drivers/gpu/drm/xe/xe_guc_capture.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> > =C2=A0drivers/gpu/drm/xe/xe_guc_ct.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 20 +-
> > =C2=A0drivers/gpu/drm/xe/xe_guc_fwif.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0drivers/gpu/drm/xe/xe_guc_log.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +-
> > =C2=A0drivers/gpu/drm/xe/xe_guc_pc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 50 +-
> > =C2=A0drivers/gpu/drm/xe/xe_guc_submit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 29 +-
> > =C2=A0drivers/gpu/drm/xe/xe_huc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
8 +-
> > =C2=A0drivers/gpu/drm/xe/xe_mocs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 14 +-
> > =C2=A0drivers/gpu/drm/xe/xe_oa.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 678
> > +++++++++++++++++++---------
> > =C2=A0drivers/gpu/drm/xe/xe_oa_types.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 12 +
> > =C2=A0drivers/gpu/drm/xe/xe_pat.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 65 ++-
> > =C2=A0drivers/gpu/drm/xe/xe_query.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 +-
> > =C2=A0drivers/gpu/drm/xe/xe_reg_sr.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 24 +-
> > =C2=A0drivers/gpu/drm/xe/xe_sched_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A0drivers/gpu/drm/xe/xe_sched_job_types.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 3 +-
> > =C2=A0drivers/gpu/drm/xe/xe_sync.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +-
> > =C2=A0drivers/gpu/drm/xe/xe_vram.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 12 +-
> > =C2=A0drivers/gpu/drm/xe/xe_wa_oob.rules=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0include/uapi/drm/xe_drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 17 +
> > =C2=A043 files changed, 997 insertions(+), 487 deletions(-)

