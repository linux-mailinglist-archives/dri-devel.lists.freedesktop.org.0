Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C99389106C
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 02:33:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310D410E543;
	Fri, 29 Mar 2024 01:33:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DdR67Vl+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E24B10E3C4;
 Fri, 29 Mar 2024 01:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711675997; x=1743211997;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=m9+eFPTi2a8KOhyN20rVWA6wGcgz1V6fVFZLyPTjziM=;
 b=DdR67Vl+072Kl5VHECq9kGj74XeoGpiC+WgtklEc8mrOaP9AwEGHW4ny
 QzZArT9Md96BQ82XErj4mAgQ7t/m4EsRalmLY8IB3OPNaNUYvdLtX9siK
 ZVBqgeqFhUlcUw8eGQF9r5i/3JITtZNit6JPO5oLBqYwiLhQFAg1vwrmf
 8ck6flShyOhun1wYWBH36WmhsQf884DzhuJAQRQlYyhw5GguB1xafVwOe
 J9D4KJKso0Rjrir0PE4GT9oWrSpHVmWGWsPdClVTn3DLVqvTI62dOqbzd
 1p4bGjZLcYKdNmLHHAR9ncoYzzs2YEbT6UVvtRrN7B7PwAt8Bc5YVW50P w==;
X-CSE-ConnectionGUID: TAwVNjw6TyW9sHXKeRBTKg==
X-CSE-MsgGUID: BoDmLrNdSnmvYbYtO45vnQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="18242146"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="18242146"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 18:32:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="21339368"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 18:32:26 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 18:32:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 18:32:25 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 18:32:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PRMF/12/H8zr4Oj2RWguV8gh4/4fTAKveuLECpwGfqri+9s7E8XCoDEDpvYbB3dHckoZQ0Ty9kGBTgStM47JCDe0P0+U9JZPo61bghw1KbHAfTwDArsfbZ9RiVVxbI8Lwx65eQEe78U6RKlXZtOBp19kuGhTh8jt/bbVYfMQjKjgWrGARC6r/wgtoxDpKFWFpnTkmAfHBQFf2QAmluUmRfruCbOuBscx4AAOA9NdgvrqYA8t4QC+jeJ8hsfu02ZGNy57A1X/FIOq3ifVrrr8JNQ3SfVssDukoLuRuZ6+opgtqDTF/QRFxD2WSCuI+7MNSQv3CJwzXx/1Cx77V4jqlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vzDS9g/FJtMqHKVDjahz5BxPWWjjQ/hxZUpC7w0cbIk=;
 b=Fxd4k2dV0EJtIQKidAwBA7A+xoTkhZgXJJg7Gi2yZYkEiKL4atIJMg4l1yx/trMgdCjZa/icMgGePZRTylWzN2KxIrz30dcmxYANQ11qedkvEjeNRxQrVntzEn+NMyEXWad1wUWBc628SGRxqAVYKHk7cCQmyZrkwJIxaUKMwWQtZAipu6FOfkTMCsoJlSGzMRHs8nnmMku9DoI+CtDrb9qMHjvLzpTOU+fBAPtHv9UIdvxJ+A4I2ajTjBpFH/193/GASY9M2rBciNKY3w9tm98NGKifnn+NfZfLhTR+BufWJiy8bMcY0SYqKxpS7ZT0qfQ1xJK99vaxvGnc6X/sPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB7022.namprd11.prod.outlook.com (2603:10b6:510:222::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Fri, 29 Mar
 2024 01:32:23 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.031; Fri, 29 Mar 2024
 01:32:23 +0000
Date: Thu, 28 Mar 2024 21:32:17 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-intel-fixes
Message-ID: <ZgYaIVgjIs30mIvS@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0109.namprd03.prod.outlook.com
 (2603:10b6:a03:333::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB7022:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lz+OTtCzjpZ9Q3NFJoZyBuyLS8VQ/P8uaaTQocsVB9VuOvwu9oI3wH7n3YUnfl/vRlSCpSd9wTRijt21tIMPVitSjxC1uIDpfDObbzbBA5JOJzfPWmM8oacfjQfxZh7OiBafnQi6+op6XNp8Q0ROSXhSO7D3Cs9nglyrytBDm+gR/jgKyerqkKn6WBEgSOGoxpftFdZRqW7eWXI719agM0HBF1oflYnkeKUN4spHTkPeBqMYH3Nc4eOpAby/Y1FqE6G6vaMcqv59PGySXzLSs8nrXN3Ptl5xaGbHXESz7ISpsbr+Z8d2E4SRyx/HcUq/HZlyhzhnmLFOYko5nDtc6Nl3aVkUodGyG+Zk0nc9gIg/lJ7nILeQpQC1aHXVaYDDsC9aKBgp17E+f42XXnNCpkM5jkfvI1IU4AhLKsm8q6k2cykjVk05HYLTiU7tP9uytuJ9AekBXDcV8DB9HWFbPZ7KLfGZWKx7WnWTtLYnfpL7pKJdLvu7M1Z0ubXZoFR/beZBjwpwbr9eGBm9wMvH9qvdvfoYuSuLu9XhGnOhzL4VKhgjRtfzQLZg8tUH/lVmtwD5YoEj3X/OcoAJlH4yydgjANjcjmELyunAVGU49ENCW1MESR5ujeM34L9gbDXm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vqmvGPUxBMU8k5+zUojJr6XELZNBBsSKF3T0CfHQ+Q4CeTV0vrkfBIOQEC?=
 =?iso-8859-1?Q?0lvwJdogKW/a8gc7leimQtqmE2a4Q2ow3rzdsO+XJ3GlRqJDZdZ/lTIKre?=
 =?iso-8859-1?Q?gzDMJh9PjxOOcsStS8NzYcKfUwE+yiCq89EvGzg7qic2wANhpV7uWRMSp/?=
 =?iso-8859-1?Q?Qv49KiMxM6rPr+OwGisMDNmEljb/GT5iAeg9wOsO2uBIfTFjJkbG1ZVU4r?=
 =?iso-8859-1?Q?iT9cYVTmnGj3GYCseZSpOBU6dxo8pANywK0VDd+bIQvHCaimpJAc/r8ZIb?=
 =?iso-8859-1?Q?sfZ6agK89kPm5O17P+vZBgoMwYgA1pfyutNUFASD44po8V1MBQOeuXp8ko?=
 =?iso-8859-1?Q?QDQYVXa4WVEK9j2brslpCsgI5xMaYgpAe3l16LsdtiK+fD8IuFcCM0UHAh?=
 =?iso-8859-1?Q?b7PrIrTT8EfkpUViC4Ti7wX85HDvJn26fHBzs04y2RFSAysmxTTOVrreuI?=
 =?iso-8859-1?Q?oT5mG4HbDLD2/eTkoWyS49COmDHzsldGC90ekk+ky+t7STAgRy8qIPeOQA?=
 =?iso-8859-1?Q?iJMEt/htspRyJ8sSS4HnJ2LspXoGGzvfaNzObXdDMJG+UASAA2xZA5F10N?=
 =?iso-8859-1?Q?uX/iqhubPUdVJbc97xmLDkcOrYMX/8NWUCOYAvAwRroax0bbxZpZCOJuPi?=
 =?iso-8859-1?Q?A1DBMhD/e73W5xDC9TkVRimintJqeEKyhXP/VRTEcxGR950gsOpm06xEDe?=
 =?iso-8859-1?Q?TdirxKv7H3ZH/Qt4p7AUKR7MJfGwDh6bBRNF6bMJ90k8UMNxRmUzjznqSb?=
 =?iso-8859-1?Q?LIQ9YAYXcXhQ2RhsueYCzP1c4Wnb/RSfMn96EJjuiqNzjD+7pXaMaa6jP7?=
 =?iso-8859-1?Q?Qy5xCoAl9WHPaCVzNRiezpZEvIWmSg4Gz8MqVbtjxbY5KPHMaRFSZTi8ey?=
 =?iso-8859-1?Q?J0aEqxCDYxvV6VI4SdoaQbn2beQW+RYBbmvD9c7LgGQvrNFBAcfEljf5Mr?=
 =?iso-8859-1?Q?+9/sMqaCSNID85X4LGC0+mrxJcPsQCHeSaeHk/mpQpNlhrasKx5WQufOsq?=
 =?iso-8859-1?Q?mVA7FL/EB/0c3jNM8Wg8mes0/wrNyRDRbPAntAy+b4OSKSMF5CxUu4sSyw?=
 =?iso-8859-1?Q?M5Uttm4Q0+uuA30E/93Fupb5IOXBIAUJyAgbwh7mkkA8o/oQCPNoKPsJBH?=
 =?iso-8859-1?Q?pe9Q5cn5CQokbe5yDmkcN2E/uZpeNjk7Wgiy5lvAmfaBffu/3Nhn3VosB7?=
 =?iso-8859-1?Q?a2q3A+ZCJeQOHUfPSBoyNNgiwLf4p0fLyJkR8v7akn+YjWgnC7LFNbFlNx?=
 =?iso-8859-1?Q?lImhV40OTE4J6EvXCh3OoE2TZiYQLCtcVY+NVwjFPQn8I9ZuU03hd+yIFB?=
 =?iso-8859-1?Q?xT1F4nIo7ZjF2X76Jfsqd5JLvryFZKs65iN9ROiLAoMK2L/Nq7rp7yffzj?=
 =?iso-8859-1?Q?UlM5fxw5Q3c4R11x1D7WVfm0Zlbm6N72700mm/drmnG/YV8WoZJBjcU3ui?=
 =?iso-8859-1?Q?mGWHo5psiTtG9BmOszeA1Rq5vtEZjK4HFrQpWH/3+zcCb8msLV1moV1sHl?=
 =?iso-8859-1?Q?h3oRBL9wF3tS/86DeQ5zLuVXO5jpH07nEW1kDtDQn8jsiWi+OvBHZs4o0B?=
 =?iso-8859-1?Q?BYMK3vTx8E9RMNOE7odVox3OR74sdXDBQgvbP+Vt6f7mBSAsY5wWuQPCtL?=
 =?iso-8859-1?Q?l/gJOY1S9MLUMIGEP+JTYR2PUkWJc2nqyvcFsaCGxJFLw6PbRD5nLG5Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5abdafce-6095-453d-7e11-08dc4f90153d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2024 01:32:23.2895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v2BFbNQKRtOzslxL9Ndwxu764klU2m9TpViAOh8HYNCkiMRUqIhKA1iB2qTihOyh2QGA3ZIyjwCKM17XPErndw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7022
X-OriginatorOrg: intel.com
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

Hi Dave and Sima,

Here goes our first PR of this round.

Our CI is not working as I would expect:
https://intel-gfx-ci.01.org/tree/drm-intel-fixes/index.html?

Well, at least it caught some build failures on runds 832 and 833.
But after I fixed those, the 834 (with v6.9-rc1) and the 835 (with
all these patches here) didn't show up yet. So I have run manual validation
on my DG2+ADL here.

Everything looking good here, and it is yet -rc1. I'm confident
that we can move ahead with those while we work to get CI back.

Thanks,
Rodrigo

drm-intel-fixes-2024-03-28:

Core/GT Fixes:
- Fix for BUG_ON/BUILD_BUG_ON IN I915_memcpy.c (Joonas)
- Update a MTL workaround (Tejas)
- Fix locking inversion in hwmon's sysfs (Janusz)
- Remove a bogus error message around PXP (Jose)
- Fix UAF on VMA (Janusz)
- Reset queue_priority_hint on parking (Chris)

Display Fixes:
- Remove duplicated audio enable/disable on SDVO and DP (Ville)
- Disable AuxCCS for Xe driver (Juha-Pekka)
- Revert init order of MIPI DSI (Ville)
- DRRS debugfs fix with an extra refactor patch (Bhanuprakash)
- VRR related fixes (Ville)
- Fix a JSL eDP corruption (Jonathon)
- Fix the cursor physical dma address (Ville)
- BIOS VBT related fix (Ville)

Thanks,
Rodrigo.

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://anongit.freedesktop.org/git/drm/drm-intel tags/drm-intel-fixes-2024-03-28

for you to fetch changes up to 32e39bab59934bfd3f37097d4dd85ac5eb0fd549:

  drm/i915/bios: Tolerate devdata==NULL in intel_bios_encoder_supports_dp_dual_mode() (2024-03-28 12:16:17 -0400)

----------------------------------------------------------------
Core/GT Fixes:
- Fix for BUG_ON/BUILD_BUG_ON IN I915_memcpy.c (Joonas)
- Update a MTL workaround (Tejas)
- Fix locking inversion in hwmon's sysfs (Janusz)
- Remove a bogus error message around PXP (Jose)
- Fix UAF on VMA (Janusz)
- Reset queue_priority_hint on parking (Chris)

Display Fixes:
- Remove duplicated audio enable/disable on SDVO and DP (Ville)
- Disable AuxCCS for Xe driver (Juha-Pekka)
- Revert init order of MIPI DSI (Ville)
- DRRS debugfs fix with an extra refactor patch (Bhanuprakash)
- VRR related fixes (Ville)
- Fix a JSL eDP corruption (Jonathon)
- Fix the cursor physical dma address (Ville)
- BIOS VBT related fix (Ville)

----------------------------------------------------------------
Bhanuprakash Modem (2):
      drm/i915/drrs: Refactor CPU transcoder DRRS check
      drm/i915/display/debugfs: Fix duplicate checks in i915_drrs_status

Chris Wilson (1):
      drm/i915/gt: Reset queue_priority_hint on parking

Janusz Krzysztofik (2):
      drm/i915/hwmon: Fix locking inversion in sysfs getter
      drm/i915/vma: Fix UAF on destroy against retire race

Jonathon Hall (1):
      drm/i915: Do not match JSL in ehl_combo_pll_div_frac_wa_needed()

Joonas Lahtinen (1):
      drm/i915: Add includes for BUG_ON/BUILD_BUG_ON in i915_memcpy.c

José Roberto de Souza (1):
      drm/i915: Do not print 'pxp init failed with 0' when it succeed

Juha-Pekka Heikkila (1):
      drm/i915/display: Disable AuxCCS framebuffers if built for Xe

Tejas Upadhyay (1):
      drm/i915/mtl: Update workaround 14018575942

Ville Syrjälä (6):
      drm/i915: Stop doing double audio enable/disable on SDVO and g4x+ DP
      drm/i915/dsi: Go back to the previous INIT_OTP/DISPLAY_ON order, mostly
      drm/i915/vrr: Generate VRR "safe window" for DSB
      drm/i915/dsb: Fix DSB vblank waits when using VRR
      drm/i915: Pre-populate the cursor physical dma address
      drm/i915/bios: Tolerate devdata==NULL in intel_bios_encoder_supports_dp_dual_mode()

 drivers/gpu/drm/i915/display/g4x_dp.c              |  2 -
 drivers/gpu/drm/i915/display/icl_dsi.c             |  3 +-
 drivers/gpu/drm/i915/display/intel_bios.c          | 46 +++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_cursor.c        |  4 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c            | 12 +-----
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_drrs.c          | 14 ++++--
 drivers/gpu/drm/i915/display/intel_drrs.h          |  3 ++
 drivers/gpu/drm/i915/display/intel_dsb.c           | 14 ++++++
 drivers/gpu/drm/i915/display/intel_fb_pin.c        | 10 +++++
 drivers/gpu/drm/i915/display/intel_sdvo.c          |  4 --
 drivers/gpu/drm/i915/display/intel_vrr.c           |  7 +--
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  3 ++
 drivers/gpu/drm/i915/gt/intel_engine_pm.c          |  3 --
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |  3 ++
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |  1 +
 drivers/gpu/drm/i915/i915_driver.c                 |  2 +-
 drivers/gpu/drm/i915/i915_hwmon.c                  | 37 ++++++++--------
 drivers/gpu/drm/i915/i915_memcpy.c                 |  2 +
 drivers/gpu/drm/i915/i915_reg.h                    |  2 +-
 drivers/gpu/drm/i915/i915_vma.c                    | 50 +++++++++++++++++++---
 22 files changed, 162 insertions(+), 63 deletions(-)
