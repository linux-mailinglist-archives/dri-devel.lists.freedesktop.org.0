Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D61A484EF
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 17:29:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3FD10EB33;
	Thu, 27 Feb 2025 16:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UTvk1bBl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C6F10E046;
 Thu, 27 Feb 2025 16:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740673743; x=1772209743;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=mXFbYEBzcH84IIcwUP4OThpwKsJQcGJ8ozWCUXMLVPs=;
 b=UTvk1bBlPDXQN7BsOtZtYJ2TYfkkKoJ5KDi4QXtLb41BuLPKxG0UN+91
 bGdhYGPWgcKIl5sbVe9KL69VXjg5C8zED+7iblCDBjOAwB2jG1tbT3KvN
 w6YPmY3Mlx9cWTJ+wN6leIf0+PZmmwVAhKLmHbsSfT3w496gZDNdYqUPS
 /gIBtBZnGh1R11ID9h3TqRyI6t67I+VJqgDuGwHhKIJdNjChKb8m/CwGl
 U1vtpGCloSf1ylv0Atz7u3aq94v9z8HU1x17awOEBXDAspw1NKxH40W9v
 gBsB2MXlM8uF+RAntK9YnrMrKCIqdGiojzfq8kVO4Nfvepeaq9LkEBMvv Q==;
X-CSE-ConnectionGUID: 0NLspHXZTO6/c0X6z3MTOw==
X-CSE-MsgGUID: tjDfqv1OSt2L/oFcxNz+8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41599098"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="41599098"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 08:29:02 -0800
X-CSE-ConnectionGUID: VZAZOHpLRHKl+aPTYo4Aig==
X-CSE-MsgGUID: uxSiWexlSkqZmwNHtYJK6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="147990631"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2025 08:29:01 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Feb 2025 08:29:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Feb 2025 08:29:01 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 08:28:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xSMANqq1lyfHvvvs6zX5Cp6stXKBfGFgI2FqvwES0+L9uduU4KXEpwizO5/9yXOS2dtEl1Zx95idD2Aa9pF70kpXJGOn9GkmjcFcH+Ajwonex7W4WeZBPUSIQ+qxTr1Zta+HO0sgSnqt0eN+QMEYfOEtK2D5p2LBOgiZvnBpYQ4N4gwstlmSXgOsOwFZO8XYUigVt91wxYiq4TtcK7ixsg4+3pKRhKBkplB6iawOM/sdpfJ8Us3NDcBnzAhvTfOAUaYzzlkZuDUOf+AvWbcMKeemFRiuniyG8vy4sSqzPCGn5yNezuUyH4woePcFAKaVXbldWQXTm7RS2m41Zr1Ysw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zkRKJm0HvrD2CvugJBPZFMRlwLlaVIpjeMqMfhy8oc=;
 b=niO5KX1NQUkAShgzA5Ujc4djQIZnTCNLZtLBdltVnvfTWdf4x54XY3/cvXAZGbwobYiQccucdEPuYfsHZ3SqHd+7lt1qU1wRgjtT3gi4B+kpcxZpA2dbvVIxfpfbJp9zKr/6SCd9+ut+ixrXv+DJ8/el/uLDF0EYqAILPkMdM/oFBhjE4bbtCw4LbWqJVPq9AFTHesQmkzpHoZAdVflBEOGgkzoVq2vRS9+OqQ2TnaLtR1wrCCgplkh8PQemPsRryxD4sIKR+/FUJKnLsHiRjUeBPjK37yyHnJqaA2NRN5sEdss/JDM/SxUuLQNYZtVTPZJxQtAws7lP89IdkM9Knw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by PH8PR11MB7047.namprd11.prod.outlook.com (2603:10b6:510:215::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.20; Thu, 27 Feb
 2025 16:28:29 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 16:28:29 +0000
Date: Thu, 27 Feb 2025 11:28:24 -0500
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
Subject: [PULL] drm-xe-fixes
Message-ID: <Z8CSqJre1VCjPXt2@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: MW2PR16CA0065.namprd16.prod.outlook.com
 (2603:10b6:907:1::42) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|PH8PR11MB7047:EE_
X-MS-Office365-Filtering-Correlation-Id: 642c5e96-eb05-4481-a54d-08dd574bc4a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aaIv6kitCpyghkk3c5bKbcUt4LIpvKyLhtoxurWWY7F+VAVoafcjwjLUflbg?=
 =?us-ascii?Q?YQZvPjQLHQkCkPXhymH5AAJyaQafBrRWh9q9kYQ4L8X0hOuvlCCkL/AcUTO7?=
 =?us-ascii?Q?z6WA6h6sQIUXco+JOy3BcLOoBYLfvv/U+5kJ1AWArEkPoHwqveNEY/89Cfqr?=
 =?us-ascii?Q?AurFn3+AQKH9bBUN8mOtQweobSK3ec+PFuAhDdqJWfF3b+IvTaRHoAiLfJdn?=
 =?us-ascii?Q?TQ6WHUslh/lf+5qkziXlaQPkD/HMg76eZerEGFmeux17oa9V7T3+4r0Hq4UP?=
 =?us-ascii?Q?la0euGpno/h9RZ12KWKAroCq165YKPlJU6S1RRNieSBY/0WdGGUsVC2K3ux/?=
 =?us-ascii?Q?YNBTfV4fZCbuxj3UjdBFfcD0UDbb+QZjvbUcaJ7UtYE9TYlibPLV46GGWyeT?=
 =?us-ascii?Q?7VzNXt9Dr098czYbWACBgVLxl/hFF4YqBGKOIdWO0TgsOB5fJwMfNe90+hYE?=
 =?us-ascii?Q?cmru7ZyowZX105WYJmbmna4CAXeM6Tt6eWnmtxmBaxOUyHc5NJ0E2PqgSRiB?=
 =?us-ascii?Q?aW3p0VCaxszcO2E0hYT628ByvT5ZXdJa4HUgXi0SjZtg9PnByvIwVtA+uF3Z?=
 =?us-ascii?Q?FeiVcrfDFrEhL80IwSMOoezROEy+Hg0r7TG3Zn9kpW/DgGwouA9XrF1oKEhd?=
 =?us-ascii?Q?3EQPr97H3jFvHO0Ph6ZjpmBctLVa7CXtbTWCtJuK+lzxylTUI3QoqeejCZDX?=
 =?us-ascii?Q?KJemW+aWV9gWgx/T1zRvdQFpu6Mf4od6OuAulQSfYbP+23Dg5TFM+Rmmy4d5?=
 =?us-ascii?Q?F79sfy2Ck3vqO27Xf+Okugw/Vo2q3oj0MhxNPeOmZjy2s7eopKPfSaPGZgi9?=
 =?us-ascii?Q?xw1c00MELFbw0q9ElSTqTLYtCxkBOaTRxqzYGITX6Q4br1TIHQCxR4Isx4dm?=
 =?us-ascii?Q?XNo0Q3bYb1ReUHnh3oCHUNbOxVdItioGL4mhrnvT3mSuy4TjPodGdU26fV0b?=
 =?us-ascii?Q?AM5fPTFf5vGRhQtI23l8xBGfa2yZnGD973r7dWBqyVEB1EyA+NzOmbCHvXrV?=
 =?us-ascii?Q?GG6FwOYaOvqzMGbSjWSpRCic1IjF9s4ztoKg/1GyJj00uDvf/gjtGo4kBiAM?=
 =?us-ascii?Q?xzhsY53bhkrS4xeYVVw08KDd/vT3Bqgt1BBr03dAaUTbGtmfnAadz2OZkjeD?=
 =?us-ascii?Q?ZLtwuzbFn8psgMMfQ3fbhv5QmCh113FGsrPqoNNnGwVtMlmt6OdyezH8aaRB?=
 =?us-ascii?Q?StRaVAzAz4pp9WtbeeikFpMXAAgYnwNwPgxHQl+/yOE+7YWuO4PRL+gRunHX?=
 =?us-ascii?Q?oFp4F9kcfYdRZ9NM1NWNrk1u4C8k1FSf/SuZYQ7v6kRiIqqbRgzR2xGa9yWW?=
 =?us-ascii?Q?2ZFsQBTGYAppPfVs9JgP08bt8MkFfoKZ705t46qZ/TkG1A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?de/GtwCEF5G06LZJgxC4YBGFnkqnZC07iMhDnMSbM5+L/CCHYfjyUMV7UjVY?=
 =?us-ascii?Q?caAZTVZ+lBbE1a/FJIHHgLC+VGbYH80Nuoy7rAgm6mYtwhMW9v1N33jYsHB3?=
 =?us-ascii?Q?UbWu7Q9CKc+pYmmFpyIf0PIMSS5Sypg9/VnkjvV1lmpwXLpF9n6YE88F6LpJ?=
 =?us-ascii?Q?lOaHMHBEZ+rrPgGjDvCcXLOsR9mMp1fbIclYYiwllaHuGlyy588UgG4pH4DF?=
 =?us-ascii?Q?aAG5aX9ctiIKMcZzuzG+3Rht5gT2l46xo6MuJ+T1xSXWXzIcixH0hqC93eRn?=
 =?us-ascii?Q?TEX9oshKHgtt73uwaI55wue+KSX1SnmORUIsLxnkmKrsH0D36AgVukwZrJJE?=
 =?us-ascii?Q?MSkdabv6PKevwYrLZs802wLIw/cauEFsGAQcTuft2CcRwJSq+qWerTdrNxqi?=
 =?us-ascii?Q?2m0UU7+3t9RXFobUCVZnTw75Qoz5vo9zLBaugA3ULjxOPMnnwIEuAcR2rwhI?=
 =?us-ascii?Q?k7voxZUot56ErRkHDLd5EqIJOcgVQPpWx8pYmuJ3nze0KUgTXwlimDnq5VMr?=
 =?us-ascii?Q?3ezEaWl/GtkQq8z178SOKp/SEuI1sSC3k5D4I8GfA5MeytJa6FpkNLDAaYEK?=
 =?us-ascii?Q?tGWG1/3eM87bsdNiq6jt9EzpYiXKyNVDdt0pCf7VFeMhuiVWhJ5FSL06Grur?=
 =?us-ascii?Q?wTNlbS1PZ87CHpdlRS4PXBqeBsWqhCduLcWbRl6tynyygoagV2/ZVrTjKpP8?=
 =?us-ascii?Q?wXrEGdAZ/A0TzxPZgZ+eZe6WvNVcS9qkyVDVNxK4oNgct4TIpI0VuaUwjKSB?=
 =?us-ascii?Q?LyOTgd+JwdQBbAOp0K2IU4zhR02oGzKh0Gk/YhPKS9LyZqNc1rfebXbue1G5?=
 =?us-ascii?Q?oZm/o7WlCkXlddZD4CmdSDB4G9Z2x5RkhIZMS7T2yqnCnlB2uvb2/gfGtt5j?=
 =?us-ascii?Q?NUBuwiDwbVs+Q2tMVRvXuWl3oX66s1C3nDOJBHdAW4xJ0TldBgHoBzl27Lul?=
 =?us-ascii?Q?g3GDb+O1SjHpCexPfXH4yteKLCdz8ObhbOvA9f2ffb2jGKkVL86EqULIpX1T?=
 =?us-ascii?Q?h1rsM5TQ8tNutDaLaRCR2L82G1Vj5MWeo9HrUaxNsumEiE0YNXaHsus0bhb5?=
 =?us-ascii?Q?c2tLlXKXVNgQMggSfrBF0UetoeQ1fB66f///O4wnUy8sFfDu/iUeGtwPPAfF?=
 =?us-ascii?Q?wrGdUFA8zsdplQKO75m0+0Qj0mzGtG544/4sSuTswfajxreJWj6BMuYn48U9?=
 =?us-ascii?Q?GSXr+kjx9B/ERlv0Q7wpAcmH33cy2krgm+aBJJzzfcc7dQ3n2e8QynRKOMZQ?=
 =?us-ascii?Q?6arCWR/rE+V5JnsWMfchUAkPT7xOzAv5u5XFGpI60SrUNy7+6uNjHWVdEnxc?=
 =?us-ascii?Q?lxA1RIkOncJ8f5goWDXjkYvVN/TrjTX+IEBv9TV1cBPxXckgidnlnfYZBvdj?=
 =?us-ascii?Q?1/GSNbniRAfF0RfnegdvrR4WSOmviRcvM2Brum1FPVzcvI59po31FcqGvULx?=
 =?us-ascii?Q?+1SyP0EUJH3+0Uqce3G9CR9K7hv/JUHFxQEKiGvUw6KHgJK1bcQD1GmdUBGE?=
 =?us-ascii?Q?TCreRbqJs+/9oIPuwguS494UJEEgKZggar6y1NYH3zkNKoNAKUYGP1oe859A?=
 =?us-ascii?Q?V+eVDioBT1OIHILN01JvudsFRKOoXRR2gY0Nzl6v5LQQ8IQT8MmaUdBAGUBa?=
 =?us-ascii?Q?fA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 642c5e96-eb05-4481-a54d-08dd574bc4a8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 16:28:29.2240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X9YIz93W2DPKOPxI5Nfz/FboLyoUkzeETNayvYird+Thw+L0o8vkBNiU9xWd33NpJwszWRktekNIz4m2pidZUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7047
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

Here goes our xe fixes for this round.

Thanks,
Rodrigo.

drm-xe-fixes-2025-02-27:
uAPI:
- OA uapi fix (Umesh)

Driver:
- Userptr related fixes (Auld)
- Remove a duplicated register entry (Mingong)
- Scheduler related fix to prevent exec races when freeing it (Tejas)
The following changes since commit d082ecbc71e9e0bf49883ee4afd435a77a5101b6:

  Linux 6.14-rc4 (2025-02-23 12:32:57 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-02-27

for you to fetch changes up to 12c2f962fe71f390951d9242725bc7e608f55927:

  drm/xe: cancel pending job timer before freeing scheduler (2025-02-26 08:16:21 -0500)

----------------------------------------------------------------
uAPI:
- OA uapi fix (Umesh)

Driver:
- Userptr related fixes (Auld)
- Remove a duplicated register entry (Mingong)
- Scheduler related fix to prevent exec races when freeing it (Tejas)

----------------------------------------------------------------
Matthew Auld (2):
      drm/xe/userptr: restore invalidation list on error
      drm/xe/userptr: fix EFAULT handling

Mingcong Bai (1):
      drm/xe/regs: remove a duplicate definition for RING_CTL_SIZE(size)

Tejas Upadhyay (1):
      drm/xe: cancel pending job timer before freeing scheduler

Umesh Nerlige Ramappa (1):
      drm/xe/oa: Allow oa_exponent value of 0

 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 -
 drivers/gpu/drm/xe/xe_guc_submit.c       |  2 ++
 drivers/gpu/drm/xe/xe_oa.c               |  5 ++--
 drivers/gpu/drm/xe/xe_vm.c               | 40 ++++++++++++++++++++++++++------
 4 files changed, 38 insertions(+), 10 deletions(-)
