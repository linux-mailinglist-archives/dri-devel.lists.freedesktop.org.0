Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC889B00EB6
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 00:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645E010E985;
	Thu, 10 Jul 2025 22:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wmyh8wLd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892D610E981;
 Thu, 10 Jul 2025 22:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752186554; x=1783722554;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=7FfwiaeEyKfKD6VDqgLVCSx9/joKBvuTE/sfR2RwUX4=;
 b=Wmyh8wLd4g8T+3IMJoa2C/nxl4VfonTtCk6qClKamtCrZwmd12xuKj63
 7Gd2ipcNW/KSqPXFKKcWChNAguAanHNlfZ5FJVYV8ZSUPP8BBZhMS1AaK
 jCK1D3Lpm91jQMfHDIxV9Cpm60uHCsNGW2lMaBd3aHNaLeJ5eLlE+Nrxu
 qRdn3K3BitKKnSFvl4aPxUfc+mqFLKSh4WCkXsdoZ6l5VXwjDT5pVnBWr
 stMKatDRXh/jgQOBcFT153H9n5wgm/kdX8NUT2qoo3LjYUOsZgD4ou2af
 X31y1Ua8beUSxphMQalKn3Jgc8RybMQxjxYdK/7sev7PqolY+EvQ0rdSt g==;
X-CSE-ConnectionGUID: /WFBObLJR764zItUiK1NmQ==
X-CSE-MsgGUID: /DpvxdMsS4iRaUzoCxAOuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="53589846"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="53589846"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 15:29:13 -0700
X-CSE-ConnectionGUID: K7RegQ4hRHmXbmDZzsojGw==
X-CSE-MsgGUID: 7x7qeknVSr63eya/SiXF0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="156337818"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 15:29:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 15:29:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 15:29:12 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.49)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 15:29:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bp3l55NmXKjydYcW4xQyUGE9SGzwhoj8Coqys+4ZAvVU5a8beY8RmDyEVFHBh2jAVEkd1cjcTNkVljVGtECMD0aLNLQoJytLH9y1fEaL/JpMs+fT3gqQeXB+CUGmSbTNjImq++FkEiuXxptruH2MkBziztnkXl/As+A7JNaeNJIA6kVbM/Td+U+zDY1K3AAHeTX9FXUZBy1vd59tTLCF+vGAX2OGF/XM8VpGPmqKoI9rGnkx6ME7ps/KbJohoUwxlOQwif58K8GUiFpoJkwkBfsYQ5diQuHBnobbFlUhpwaPtbpqeTgkKk06kCPz6RKBAvttFVuwz61qkMfZKMWABQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1HEGajhANbqy7MIvqktccSl2LKYijjYvKqERP25HPrI=;
 b=Zcap8D6eKgBx2uazwwFC37XQ90PP2BOeWnK22E1cW/kIpjxO8dpm3Ki5W+4iEXu0D0sny1FZFWkPNM5NehZwFbebLl2TMbpBjyTy+yEFSH7vncv6ljCNFd23xX50OPDq7HctgtcjNmCrMegen2n0UXTSnBcCiZIbcFhM1WepiHr1208o2X7Eb3Cr37As64qPaSAChpSMA/+TN5+FpRoR0HEwj2YUi1u7Vf8rkMnYnaAr3Jg0JQc2ZfGjopQFZ/PeLgQT/jLhWhWeTcbObNCOqNsCumhxBmbUMPvjPY/LhsIiVTITo7CRWCQDwOpjk1wrLRZ5U4L3BNPmBuFG8uiCdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA1PR11MB6870.namprd11.prod.outlook.com (2603:10b6:806:2b4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.22; Thu, 10 Jul
 2025 22:29:04 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 22:29:04 +0000
Date: Thu, 10 Jul 2025 18:28:58 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-intel-next
Message-ID: <aHA-qrFQ00TaNsGr@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR13CA0203.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::28) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA1PR11MB6870:EE_
X-MS-Office365-Filtering-Correlation-Id: 74078fe5-d14c-4d00-c102-08ddc0012d17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iMqiB2185kNB3s9H4hvbjW06eAkxZ2CG3lm0iKHiBhtGSWnkGLyLRf2Bvggg?=
 =?us-ascii?Q?1Fnvqt3kf5KjSOknDq3Cil5KoYv8nO3D/ZG3Jy7ossuV/El51SVOwFnC33sj?=
 =?us-ascii?Q?tt+CtXhjmHUnPWPm1VAHBNPcop/gi0fwpPMJDFujyXEawfOSkLtKkyq3r/l3?=
 =?us-ascii?Q?asN2BLGiAozp3mTnvuTaXLNkr32ESNUDqHGCOeALmMFU73wRxIcRVQEdW7BD?=
 =?us-ascii?Q?T6qEpVHZ90YzFKZHyANRu2oJAGrt2hkB+FswfPulHExpyUq9+hdzjpp4LZ/e?=
 =?us-ascii?Q?sfWIda7ZpSGrvpogIW/kBt5EKaHbMZA3L50i/WwRFOc2hAUd+6/cZVqiJXE/?=
 =?us-ascii?Q?aEXcVCnsJMWZeGlVHeRIHxZzT4YQr1AiqIWXfIinf4AlC4/Q3XvahtatZt7m?=
 =?us-ascii?Q?KaiAFij5ehdkmsAyYRsem9DJ3fqAsHJcy9ZVtXsC1BR4dX+dUDytN0JiE8Kk?=
 =?us-ascii?Q?JB4UQ/x+Z9pWWdbsxE+o64cy15v1hsT4s4B/9SwV0EMzoTBmO42WK1izYRQK?=
 =?us-ascii?Q?tXc8faAjPEJN+CNtnx16Xf3AZrbobw5GI9ZuOaWLhOnR5tfhaFoo5D0sW4WU?=
 =?us-ascii?Q?NFjCjR0Gv/in7U0Q9JHi2wObvRPXfj+TAQeLpWsLGoRCs05ockz2aD//nRvp?=
 =?us-ascii?Q?fLLik/1myYttMTE4tzCLvLr4iULpszpwNVMKx91ePSA/b3kL7L6NJeq6J6LR?=
 =?us-ascii?Q?9tQ/ilKmLMZXlXzHcZcBP2Ns8j6bgdYjQtG9A1y/8FEO2PVnjkRiB7b85eDH?=
 =?us-ascii?Q?lKDMPDTRjS1dtVPZt7z6YqxksNaIe4/ePeSbgFtwVMORnN2vNhZ/MJ3P0O4i?=
 =?us-ascii?Q?pqK2hz4YsEtAacajPk4nkjBPCTxQ8/EkZlA5M1ZzDElmSfRjbdcHw48IPxn0?=
 =?us-ascii?Q?r2mjXu0x9nqJgd5zwEMLNmW0e2yE73pVSVcIupHwfCfHLsoB/QugxOKCa7Ei?=
 =?us-ascii?Q?b4pc6TmEwiivzsMybs0z5NENxDv5PPNaW6gn1JsJz+kikIh0KxmqRxeCX57+?=
 =?us-ascii?Q?OVWIdYBt3arpLZFVuVr48VxR22luHWKchsS7FXOI28FKO70VY934dXwqD3nN?=
 =?us-ascii?Q?Mn5NPMWNcsByNMg9m8oX7fuG8LJq/HHhkzl002zmWXOB86y2I1VxXYOYX3gu?=
 =?us-ascii?Q?f+XsMfJ4nTJesQJWFuZ8b2W87Ds3XSP2X6lPyeRn/rolCvjzOfa+zyosqPSx?=
 =?us-ascii?Q?bLtubE3Sl+dlhKcLFS5z/y/cM6lN1ewwaKLbSrb9B7eLKpuE94RuHxxwKFyW?=
 =?us-ascii?Q?wacVExjv8MvllGSLPHkFQzB36o2j3dlFo2o995isK8LrrQyI2xvm/z5FYf4y?=
 =?us-ascii?Q?r+nnRtAkouJl3JZC+OClE4e/zDVc5puQt7k52OtQhRhZgUpVFbADZpW5Yb0D?=
 =?us-ascii?Q?z7Z0Zd0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qyWs2HAJTzs5BOk6hSThOsqD4Nd6SIumZdJgvooUz5RDOA8TzmjC1QBldEBz?=
 =?us-ascii?Q?hZPAS0+Kh98AWFfYPiNEazoDJrvxOeepVy+1b/WztUqtPkk3kxVPB1vflxxy?=
 =?us-ascii?Q?I84pNA2vm141PPgpUESXvHNu6g7aPv9anrz6DUxrsnfZPVobgnb3rC7U+oDz?=
 =?us-ascii?Q?v+pgHOieDJjKkCQfNPQDIUOd5tUjw0shjNv4sBdJXjFEUCSn8W/L98y6eOil?=
 =?us-ascii?Q?XoeUy2B1HYBgFC9JAVfi5rrwIK67mEtwfmifNKGRT0ufMEYXYmor5csbhXVc?=
 =?us-ascii?Q?oJHN6B96sHUkZHQ4M7KkIFsVeX3zyyYQc2IDDiXIAqT91kWJuS46VsFct8TX?=
 =?us-ascii?Q?BO51r7nr9qX7RLrDHA8YiIY1u+4Uf3cR5kD9TdK8nz6X6UOGVFwSpQ6/Yrtm?=
 =?us-ascii?Q?zyltFVoDT/SKNqlKa+1dzDb4trbIlw3vjqBJsNpw3/8eUNCioXPFYpKzKsxF?=
 =?us-ascii?Q?/KjM9puoAVSKGU5p9gwwkJ+XDygmc2y3IBEPBb9IbdKMRrWk2Wr77XA5eZ6H?=
 =?us-ascii?Q?UsFcEN+4D6SLkC+vgp5th1rlTHx66exqQ9+5v0COv/0e/0sonEm4Ex/1AJv/?=
 =?us-ascii?Q?tg6KtR7v6dMmcqjWdajDE7AhW5J5nEHB4q0AvcQbLae/E8qu5pSWcnKLo62F?=
 =?us-ascii?Q?xYU5s3GeQbInw61nTj8xeLid6RGTQjNeIZQkjJ73hSWP9i9P9yX/Gv8BserZ?=
 =?us-ascii?Q?lqsh54zOr0nyTxPiy828BpAaFvxzHYCiLX1yBKjMw6WQtPYXH3BHW+mJmcmZ?=
 =?us-ascii?Q?fy3DlD+gz0IvDIeSVhRvb5DaGdlXA9LDNmMfR2ILXkTbWPPWLymNXjjKMCkp?=
 =?us-ascii?Q?Us9xuGve9NU3KfUJlcJ15HoLNwAMLJW5PsAbqcZ+H2Sb61YyTibML/ZaOaOQ?=
 =?us-ascii?Q?kkF+EDViFC+f2jGCK8aoVGFg1ZkX+mE65vH0rnkpOQH2Q6coQJObwVcfvZjj?=
 =?us-ascii?Q?ue/VBQBlmIbOztLMjsIgtsaHXWZephYvd7HuJFBARW/Vxg9eKOZNsLFa1bLL?=
 =?us-ascii?Q?2cLcFcFCdB/j98/FbCPeO785GBaDg1dEUYOht1ENWxLokldFHtsApICyuG5D?=
 =?us-ascii?Q?qlO4SwTxUTt+zdlc4xzZNzEy1jUvy14+7oSi2k/Qo08wilVYmrjW0JcF2P2E?=
 =?us-ascii?Q?mqmjAeRpBHSgefr0AiQzdfcUVc6yUGPP9JVYDtjD39nFvOkc9awVtIlAqtmE?=
 =?us-ascii?Q?oBjn8Vojge3+bwpm7HygZvyYki5rSA56vtL9/gV2k1QeBev+tBFVaNLGSUkT?=
 =?us-ascii?Q?ra8mr3viUodslTy9A+5BqM8Kvk9LbherjPKw8F83xXqB7blZPLJ1QKx7rgy0?=
 =?us-ascii?Q?YbTwsalVETs+ewQMwUCvJq7W2Nt+AYx+pBlKsSDkuhjn2GX3bdayC3eB7IZH?=
 =?us-ascii?Q?t8B6DyOKpZu2xDLRdbgwY1aAmFv95pZCchIUFBDw+JDainSMuzrOA/Yvb9ZG?=
 =?us-ascii?Q?mR780amRLLN0nRS8vqzxLeZ3B7KDRSRC+AwvVG1l9+tVH0xMcvH0d5FXmpXO?=
 =?us-ascii?Q?HFaq2nOf6//+6Ig2Asfz/vyqXgKIoJ+hSwuULPuYK02M+vXklVMYqszFXWXM?=
 =?us-ascii?Q?dKGkpbtYzImhSUMbvivy7hw09rkINU7wQFnGL4SEFuvV7HmvV82+dkP6LgQO?=
 =?us-ascii?Q?OQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74078fe5-d14c-4d00-c102-08ddc0012d17
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 22:29:04.3018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 95k6OD4CWYL3Uwx8Mk5bYZZsKZ9ftAYzRkXY+cnWYtlQOaiXrvgSv7cWr12f/nc1+Q0ODHyKt2rUlNX7K4ZUxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6870
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

Here goes the last drm-intel-next towards 6.17. I'm covering for Jani here,
but in the end we got just one patch that is a fix, but let's push that soon
anyway and minimize the -next-fixes round.

Thanks,
Rodrigo.

drm-intel-next-2025-07-10:
Driver Changes:
- DSI panel's version 2 mipi-sequences fix (Hans)
The following changes since commit d6a59ee852758bc69c4cc821954db277a2bd5b93:

  drm/ttm: Remove unneeded blank line in comment (2025-07-02 13:31:20 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-2025-07-10

for you to fetch changes up to 11895f375939d60efe7ed5dddc1cffe2e79f976c:

  drm/i915/bios: Apply vlv_fixup_mipi_sequences() to v2 mipi-sequences too (2025-07-10 11:30:32 -0400)

----------------------------------------------------------------
Driver Changes:
- DSI panel's version 2 mipi-sequences fix (Hans)

----------------------------------------------------------------
Hans de Goede (1):
      drm/i915/bios: Apply vlv_fixup_mipi_sequences() to v2 mipi-sequences too

 drivers/gpu/drm/i915/display/intel_bios.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
