Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F02AB0974
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 07:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA5210E137;
	Fri,  9 May 2025 05:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FIibJ2kM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E81E10E215;
 Fri,  9 May 2025 05:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746767592; x=1778303592;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=7VE74RNdNBykzPFSbgsEnHn7yE3JsTx56M0bXEP0/o0=;
 b=FIibJ2kMRtuM6roLwBUR6etaaFjbhrPaD0s4vlOX0Z+4o9JWqOic3yVv
 vkWcIm7ERGxOQozZ2R361NGe/aYVy49ArAyTdjQfPwC9/ALfE4V9aq+M2
 gtDkMS3scs1oRUH6DMC5y0HkqY/7RdG0f4nUFcWF7FpO4kKQSHYuTwFX0
 dBAuprf+QQ7O9qF5wIuSMiQ3QXy8RhwQwZ8y2AYO7d1VDnwkVNEKGIIUZ
 VlHWMec4RK0IJbFN5zFaBJ0E4nuVVa6lYIpZypy7zqTepv9WiVs5/lUaN
 m3PFSHkTg48W+Pf6M1HWxvndZTbWnuJdtNzrIh7HjdhF5aciWcp7nRz46 g==;
X-CSE-ConnectionGUID: NvWohttrQnu72l0hj/Xpgg==
X-CSE-MsgGUID: MR02PhHiSDK/0sPqQw/ssA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48731525"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="48731525"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:13:07 -0700
X-CSE-ConnectionGUID: l9deqX92RYivd7p5E+uWQA==
X-CSE-MsgGUID: Uy/JCya+ScOdEKTNGUEyOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="136900565"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:13:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 22:13:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 22:13:06 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 22:13:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bS6pq7rXTP/GjoqAbTxeXt7GSSWKkN9eLlA9nh9mIPokBJBKKZdFjENwERtyM/pi9Hg4udrLrIqz7wKCsY1ffSwROdinDxZIfWBT4xX3uYDiygBies80FM654EXY+pBzdpxAEn63hjGu/7wFPTPs9mbc5fgYCdl7NVKe9Gju3uN0SxS18Ch2AzioEMve7sOiYguSMd+SXcvV+9FIPQajOqexV9hjK+PyMluXiw5+iUtZbtcTjZLW4OxqkDB1OupvCSXkweWpe+GDtKwxCh1TWklmNneYQDK7CDZYaNTLzDRyL/URvgJ3724obIZ2Fvc3H13f2udNYh5vsnf1eZFeqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BS26u4ibshvav+B8eTO64OeUmMURkeSOFZBwX0vDbG4=;
 b=GfmU3P/OkDP3tQbvK2PtSBfIOisO5OmLW10KTLdaiP1qSPWyOqtZtyIXR+r/RmRTHQWzHkvTgpC6vQdYtW60j3ba+oh1xU6uYM1JB3ApH8H4nGqy/baAJAOsrYcyzNcoxM7HpM1bfZo9Lrk2jS6g1B91r6jT5X3Z4OB8m2kXEda5XQ39PbctVS81TVytbSJhWn7iZbATs1HwYY4Slwk0NgPAz6qHH0Q5x/+mM5dobNbR9Sh1ys6B5/ojXdzDMO/2hjIlNA8YX3VLzj64Stbz+ZIaGXO7RrNsoiFKQw7/2Ym9N7oX6Uktu0j3M24YqdzEjDvjDNgdoxOz50uADUvxXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB7488.namprd11.prod.outlook.com (2603:10b6:806:313::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Fri, 9 May
 2025 05:13:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8678.027; Fri, 9 May 2025
 05:13:01 +0000
Date: Fri, 9 May 2025 00:12:57 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-fixes
Message-ID: <jffqa56f2zp4i5ztz677cdspgxhnw7qfop3dd3l2epykfpfvza@q2nw6wapsphz>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
X-ClientProxiedBy: MW4P222CA0008.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB7488:EE_
X-MS-Office365-Filtering-Correlation-Id: 39126d1a-0e81-4ef6-f103-08dd8eb82b94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LmsFRtpOMLwn3Km814A96HSuF69KmJHVpSzhK+x4ggWISqA5tNb5u3zMf2ZZ?=
 =?us-ascii?Q?GFfxkEY6wAOZmvMVIkg6FS1YkG6OZsfNckxTwhZGsCw2vY3TwO9+XeupVSbw?=
 =?us-ascii?Q?Prll4F0XuDSbtsPnNccqIWFbtpQe1i54VNY07RIH+dgdkxumMFd/kgIsU++J?=
 =?us-ascii?Q?3qNQqtwGEK81VZisrLg6suDKlo1qcZHE/Hr4A7tUNPKq/zZKX4hXGkcgzYek?=
 =?us-ascii?Q?5b9bkuFzqC5/F5VoK263XrbwVS5xNE6tbR6j1ywphY8wJiSpLlr6gxAw1xya?=
 =?us-ascii?Q?Spgo72bcWt8EElXenyhqJ3FiGh3CmWypn/GC/NxLZuWug/CDulAGYC4Wtj+a?=
 =?us-ascii?Q?CkrPFlivQ3VLYVXLexfGa3pc995Xiqat4wFjSbyTplGegI1TmFRCDba8n/jz?=
 =?us-ascii?Q?jytQeGY8BFGo2wHyYaE5Zd/0D2ZkANPuNMAGpljjHx0uGb7d+QWlrDzvUJTl?=
 =?us-ascii?Q?RSpS0VOtY7HEEaiYLGG7L4HfFIW0qyeX9BuxP0kapaw7jnvxDwRPRxOd47eL?=
 =?us-ascii?Q?WnRZtRFzsA6OtmG3KqFqVFdhZlBvTL3UJG+M3LQYdpqqw3tEdfL/hxTbWu+p?=
 =?us-ascii?Q?MbbER3e0AFTIeD4vpdsJpxwCfHea+mba/MOfQqhsvPZTnBL/sHUpmAfK26nu?=
 =?us-ascii?Q?QWlPlSxxUuKoeLfqj4XpzqJio3+hFJ4YNp9y0RGqUOAx1uPb8Y42uo2Sk7+e?=
 =?us-ascii?Q?ZthILm59GjqSgDmG23Xn/NVV77jPPCdI84K/uwU30kB28rIUXxEaEULfF1BE?=
 =?us-ascii?Q?sgqDdQ9HRAwrgjNOLjUXOWFueIM0CW9RnRmGG0qDxwoOawBFUui64QkzH5Of?=
 =?us-ascii?Q?fydNF2lUxOZgMB7ASJLTOf9L/KKykFddLZ4uKGSz2Zs6BqEf6epDiNgwAlAb?=
 =?us-ascii?Q?TOoZbdcU83ensd+fRkeZGUCtHjbh6Nf1g1RNHHhrFvPpr1LroH1cbSOqcOMR?=
 =?us-ascii?Q?WJ8lP8xtoPiiZM3Q35DBpfMByHAQ9gmRakLCWwYU6t0fV+Smmy2eWZjgkRr0?=
 =?us-ascii?Q?dk6w0nCbNqVrsXbHlN5ocHOyfzouOVTiCacgsoP4UIf1ZBaciylxR6TfEKZd?=
 =?us-ascii?Q?fI2VnGvFvXEtjAS4WXSUuIrpVInBsX0ibsYcRXFJ5ARydvgy8Ka9PGrXEJfk?=
 =?us-ascii?Q?AztznwfAeqprM1i5Y27SjCJBfcnmn3Kd3jFMiGaDjPtFvjX34QKZ9aBxurkY?=
 =?us-ascii?Q?wzU2hZ4yUJjmts/j7ea6+/h4s6Gjq68oZFa2mXg0q54xuk3BFSKwAZ3XzJ1+?=
 =?us-ascii?Q?5eC/XAuvW5F6tRtLzzy74XSFhU6jUxUSrFR1kByCsdx82TpuFT0lUihz8hVd?=
 =?us-ascii?Q?CAzC8yF62aTSJLxpubjXGNNrGnLkH6Fk2r1h2SSfEo04EN6RiE7vKjwZKiX/?=
 =?us-ascii?Q?igly4ak=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EEXUziY+maNJoM9ts1pOjx86v3/auZNNpEKG9bVUcEsJ/niDuFyCt7BmHmWO?=
 =?us-ascii?Q?LGT+VRWUFHpyyGpDoRoon+yOvMiAL0bUHsUB72KVDmXxQ3UCwohXK4yrGqqT?=
 =?us-ascii?Q?DSa4ZmQpltpn8e/jI84lgcQKyxv7qSSv6jPFps3rb3ML7Jzdtf/3gDW9zRM8?=
 =?us-ascii?Q?qExtmQ5JTqE82jpcy2pAkSrxsjI9iNJGWlpi5jbbNgygpKFSpKRv5EyPOAu2?=
 =?us-ascii?Q?jv3f13wqOjz0MXyXfxwpovyJhygz+85Ofa8UDhuaRLrrahIid/WitWq3judA?=
 =?us-ascii?Q?8iBpUTv92UEdnPf9RdzOJPLelQDzLmkHAyJNegkurJ5d0crj1Pe9SJ4vks2S?=
 =?us-ascii?Q?Ahfoj6fvTJrgnJgixRBP9Dtm+qXUL5XXm4yhyd2Vijan/jCETHtTAQge2vId?=
 =?us-ascii?Q?+5r8V9huJljebAyyzHVnVVq37VTbnLiG727yakgA0islIQHOIG7Lx9S7Dnqf?=
 =?us-ascii?Q?tZKkt+bQyK+27Mbvha8v6pUpXxP5qk2intcyrMk91COoI4Y0LSs8RhvURpep?=
 =?us-ascii?Q?HF+sWoowfxdObxF3M3AT1XnOXDOhZvxeN4Lg44RsztTtZV4NXfVMYqWaDlMh?=
 =?us-ascii?Q?2OlX9OHOaN3dBLowFUAPRyT66yQx7sLOf+foTy4VN+zpAeHzqoxl3Y0djDZy?=
 =?us-ascii?Q?0G8hBll2uaAMwzUgViulv/HG9Amy2Ih97TBnh/AC6QZ8OuU1Dnbjtxb67uQg?=
 =?us-ascii?Q?q4B3Y4l8E5ojMivcgPuQpYZHDf6A70xhf3b4RJlmlXbs7FcgHfsbfwjZhLmQ?=
 =?us-ascii?Q?isO5COFCPRD4DruwHkiLH0+ctfPjgDFK1lE94KI6jPzAbEsmzyhp739I5GTG?=
 =?us-ascii?Q?XVIkSx5DWfq7kAVt5P/uUHm0sKgF+P0LiFJ7Yb6LTxJdvXiulN7yjWPLGKLf?=
 =?us-ascii?Q?PpOrNx4wi+0yzMPbSErd8w/YtbjnMSjIl2syzEolxraTqA0LojDHcoYLPQhO?=
 =?us-ascii?Q?1cXee7Jbt1lI/YmtzC8VwFtyxR7iN5WjkUU6l9QyzGFptbt+CW3IEMAoZGBo?=
 =?us-ascii?Q?LDvfN3VzE+UHO5RgsSoKI04i3dPzB5S2PgjmSeZAEy4aT53kKLdYSkCfWuGp?=
 =?us-ascii?Q?UnWmnRxobPweFoSrsv4fOFrU3Yw+HlfB++LTcftRVY1TjTeq3uOdIGZ/15R0?=
 =?us-ascii?Q?hkjQMKbgqFF+sUknR0tss9iU1LkXByqcsY3zLw0VIxX8TG8+AAdhSOqzz6YI?=
 =?us-ascii?Q?sSXqqBowDUbVY3KjqMd1RHN5ClEOkur4PfCdfS32IlYgi0q6hNhBcpsOihcr?=
 =?us-ascii?Q?6PeHomlDwIZ3e3iedsmOumnjs/r1sodMLjvbwgkVkwCtbOBNrn+RO0R33Mz1?=
 =?us-ascii?Q?ROMSWrK3L4XdULEzd10J0NnaXYk5ZLKNFlu2yl+VNceDSwEgm4/4fbsCGHLK?=
 =?us-ascii?Q?t07alMM282Z6BLSazhN/FXveTc958q7kLUutPZnT8SUnHH678AfxcpgaUGq5?=
 =?us-ascii?Q?Qa+Nxgiq1s52efnqJM0zQFAduEAYSbyGQwZCmLe9UFPlc/orLMlyZJH/ivzj?=
 =?us-ascii?Q?Iv3oN2tMBPr2y/QI8qHqXb7DQXb8rQKTpzFwNG1Irr7TnDq3IXJrMYesevee?=
 =?us-ascii?Q?oJNAmGD18gv90yf+e9s8WoC5SuwhvZVvC5pM/y5nmYgjDtKe/yVTKPfsz6vU?=
 =?us-ascii?Q?mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39126d1a-0e81-4ef6-f103-08dd8eb82b94
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 05:13:01.5566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: akgwYnYNtwrDqirFhlDkREKejbIF8kABLWoqlTwQukjDqI5xdeF7WTmLMGkHMeX2cuJbl9PplJxJcHeUP04jlgHxWywwUlYebzJdDe15jQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7488
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

Here's the drm-xe-fixes for 6.15-rc6.

drm-xe-fixes-2025-05-09:
Driver Changes:
- Prevent PF queue overflow
- Hold all forcewake during mocs test
- Remove GSC flush on reset path
- Fix forcewake put on error path
- Fix runtime warning when building without svm

thanks
Lucas De Marchi

The following changes since commit 92a09c47464d040866cf2b4cd052bc60555185fb:

   Linux 6.15-rc5 (2025-05-04 13:55:04 -0700)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-05-09

for you to fetch changes up to 564467e9d06c6352fac9100e8957d40a1a50234c:

   drm/xe: Add config control for svm flush work (2025-05-08 13:57:52 -0700)

----------------------------------------------------------------
Driver Changes:
- Prevent PF queue overflow
- Hold all forcewake during mocs test
- Remove GSC flush on reset path
- Fix forcewake put on error path
- Fix runtime warning when building without svm

----------------------------------------------------------------
Daniele Ceraolo Spurio (1):
       drm/xe/gsc: do not flush the GSC worker from the reset path

Matthew Brost (1):
       drm/xe: Add page queue multiplier

Shuicheng Lin (2):
       drm/xe: Release force wake first then runtime power
       drm/xe: Add config control for svm flush work

Tejas Upadhyay (1):
       drm/xe/tests/mocs: Hold XE_FORCEWAKE_ALL for LNCF regs

  drivers/gpu/drm/xe/tests/xe_mocs.c   |  7 +++++--
  drivers/gpu/drm/xe/xe_gsc.c          | 22 ++++++++++++++++++++++
  drivers/gpu/drm/xe/xe_gsc.h          |  1 +
  drivers/gpu/drm/xe/xe_gsc_proxy.c    | 11 +++++++++++
  drivers/gpu/drm/xe/xe_gsc_proxy.h    |  1 +
  drivers/gpu/drm/xe/xe_gt.c           |  2 +-
  drivers/gpu/drm/xe/xe_gt_debugfs.c   |  9 +++++----
  drivers/gpu/drm/xe/xe_gt_pagefault.c | 11 +++++++++--
  drivers/gpu/drm/xe/xe_svm.c          | 12 ++++++++++++
  drivers/gpu/drm/xe/xe_svm.h          |  8 ++++++++
  drivers/gpu/drm/xe/xe_uc.c           |  8 +++++++-
  drivers/gpu/drm/xe/xe_uc.h           |  1 +
  drivers/gpu/drm/xe/xe_vm.c           |  3 +--
  13 files changed, 84 insertions(+), 12 deletions(-)
