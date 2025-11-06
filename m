Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE8BC3BC10
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 15:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E77C10E8F7;
	Thu,  6 Nov 2025 14:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QcJmq2fz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF86410E8F7;
 Thu,  6 Nov 2025 14:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762439517; x=1793975517;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=ITWHtF9P+c5+0qIk6H+QrhpJID03ZRLeAaJuq3alfaI=;
 b=QcJmq2fzWIm9J1EqmnG/nolV7r6IO8AvXZivvCW3WByDl/PIxpgZ3GoF
 DgPvIpr/jAXGRpzG8s7opIj2mAB/jCzOGzAYhzf078iKBFponR/4HZS50
 jOITjMCbN1TFhnt9CE9zKTiKeBXq5pz01cTqyxV+F4xOrzpIZ5iFXngNP
 qSiRMAXaAGusSezfkIXuV/04Sfth/HkiBSnDz49scO0/7YVtGaUvZCeBi
 LIvv8wlslma7z2+gqDkJJOCSaaK/tz1RQaeVKoXldwgw40o7zuHjlvml3
 L55EuWl3JycIyHNTbVJ0Y+G8x1Q19u7TTbTPXyiJvofrDYucBkbHChfg0 g==;
X-CSE-ConnectionGUID: AYpp6ml8T0+MNtEwPRxvDw==
X-CSE-MsgGUID: RTxFlKpRS6aHyN2OpQYkYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75691654"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="75691654"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 06:31:57 -0800
X-CSE-ConnectionGUID: xf8IU+RvQk+EAa9HGbsTbg==
X-CSE-MsgGUID: xYOmjey4Qoia0ZDT059kyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="187714618"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 06:31:57 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 06:31:55 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 06:31:55 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.10) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 06:31:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RzfQUYJkJ2rs7Z2H6vuRIG6D+K0p62Cs3ip0oJ1sMOizWPVh+WqyYj3kGOVnkLwuWrUe5EIEUZnJQEQ6AIJR/8Wm7K0kYvHdjr4WIK/b8ZuYYeXEjW/dfvwtNhNKbav2hYJqUxeQdHvdJrca3nd4MmnZ/Kk6Kp9KJAUc1F3+rD2EKTR0LjiLwLgba5ohHoBXWb90eUWSMzWmqXuqvkbF5bhLIIlDueZJ8CiyNozOKJW9qxAwb+98D2awCQuxoDWjCfc5ZaCUzHFeFHtx04yk5EIz2dpVbdf1CPGxfmlL4SkfLkh3PDM9rRiV8o3AAkTEVdtNNmA7oXLs+GvV2p06Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udpo5jUh0Z2RPmjroBf3O+cd9TdqR1Ghs2Y9Ufvic6Y=;
 b=dgTxvSYIgm3t0GLmHT6Qd8m6lnzfphNN3PrA6gE7bmJFnETjNA+DLERdP1sCMxNTyWoSEpXvKCiSN/UatJUd3OGQTkaEIygOo4AXRs/rw8021gYtNOU7XA62EvhiU+0B617uMT33Df3ezsIy7KnJ49FjlU1yc4YMC4farscEpl/SZsshsCWmr88l3tfp7w0XNn+vIeepdXphrFRk5hstHvEN5Ptk+S20VzuEvuGdZJw9kTcv0uf+86feDacmMzMcMDgoYGThSBWCfC0jDMvvfUoqwTF9N3R9cNF/UcgejOEi50JoCJM8kftYwGQehyeOxSUofi3d9xfJbXWCcS6IhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by BL1PR11MB5256.namprd11.prod.outlook.com (2603:10b6:208:30a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 14:31:48 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 14:31:48 +0000
Date: Thu, 6 Nov 2025 09:31:43 -0500
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
Subject: [PULL] drm-intel-fixes
Message-ID: <aQyxT1D8IW-xcDbM@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SJ2PR07CA0024.namprd07.prod.outlook.com
 (2603:10b6:a03:505::14) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|BL1PR11MB5256:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d80cd46-bbe4-45a4-f8e9-08de1d4137fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NrFb14qyrq4zz2+PRNhvNzwGGNTaQeNynKmmFpuaMuWmR/NE6xeGi/SsB3ei?=
 =?us-ascii?Q?8VVosLZ5DSrQHqDIEIFO3RU4rRplEk7p/T2MXU09ofVi6SdkPxiWTtSS/0sv?=
 =?us-ascii?Q?wi2E3BdNPhwyPsyWuyZFl6D1mGEfy0tOR2lGriwRLN0CxIwgBUYh69X10qa+?=
 =?us-ascii?Q?2/S4aV5HkAsdsZa7B9i1XO4vr9jkCv+OpSYBsMWobJnKvEXcjx26Bd7iT1zr?=
 =?us-ascii?Q?3FUEjjf/N+UpsFWgphWpPQERJqytsI996OiovM/J6o6mm+8FatnyNRGkyjNH?=
 =?us-ascii?Q?71f2EOn2uLhsmUOdc6BJXXmL/JBZBMYkI2Bd/MvH4Iinbz/EWdC90CTHTXa1?=
 =?us-ascii?Q?Jl7RsCgxS0MbzJTTCOBTmYAHDXz06aDBC82Pc+iNCerxWfDzqcjnFtsI3gee?=
 =?us-ascii?Q?cCOQU2OgAgbqCWPsQcA+JRE9jVaMs9NTvMBN4tZJqZND6buhXrGSZRIMTBOr?=
 =?us-ascii?Q?7twLQNvr7L7WVWmVyzWB92b73VNrJZ6+FWmdL38WC7QXZGMpuyHNw+jbDofp?=
 =?us-ascii?Q?S2V8i2gcMpq5yrI6Di+slk0HRuwBcXNDHBeQpufImbMoynr1yeMIvVNi2YVf?=
 =?us-ascii?Q?jOLxDjuvPVg3mjzSXNWuW/hV1CMJ0g4UAlhzFovulVBTMdJk9B+bdE8lh8As?=
 =?us-ascii?Q?xQIrceyZb68LrRU4CS7ljsJUSVujQHgZf9E6KJt3UOgCvzWwxep+XFsHxTMo?=
 =?us-ascii?Q?x2Trwiw57yw0bEv5wN7Ci9Qt2kf3F+zpe2aZ+lrZYOKtEPULIq+jSlEUhtUA?=
 =?us-ascii?Q?BqihtVCK2T+51Fv4l4QtbkviQ5nlpHmOguYJKnsPP6wQXUoQ8soRNq0CLxTY?=
 =?us-ascii?Q?yFEmrfZiDkLORjCb4ZhE5niOv9k2Fe5voxAoMZJ6sAbm3U9uh4aUZJunMM5t?=
 =?us-ascii?Q?fsBJTWZxE6nznpljBLHIn9+QO5DNqyy4hD4RNxfQuENRDpPnwpUjwgbXaGwt?=
 =?us-ascii?Q?+1XghgPy0Jw8cHp0mBA9OVqyLOWJkapcrfThEUUjkCToJgWTIzwO8Lna52O7?=
 =?us-ascii?Q?Rizq1sNRQSZqszdwnvyv7ctbLajPbuIamAda2ou0K2sKImCLUnA3F9w4dCpS?=
 =?us-ascii?Q?mgYNTChS+1YOIaSi+4PiywfGoCr674mcjwAEIUVIy4cbPLqYf62n22Q8/y9p?=
 =?us-ascii?Q?0nThb8zpfRiEfYmXc9f7zMFRkBnmbu3WyuIZxGzDbYi6V0KhC6w0ip5x/dQO?=
 =?us-ascii?Q?7C+XOME7I2HtYyokIFdHjp2/Gp8XvDEfkt8JuuMpdFb6R0rD6GKpEceQLHGW?=
 =?us-ascii?Q?t2hNHZADXA7ikscwJQ5/YCusDuOCAQtamGY3V5VjgOatdZVJNGwcmoXqU8zX?=
 =?us-ascii?Q?7fvO9DefqPqvFF1dIUv978XlHMuengh3OztwR9PGzaQWUNPZQIKMuMWBYriF?=
 =?us-ascii?Q?fpbVZweA9VaA3R49lyNPB+f0eBOjNRBPDEd3LlH/E1PBtH5yyA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iOAc1V+Su5yIOBo/Qw64SgZPUszMSDOxOZYnYvpSV5uxSHUff0Gij6SBR17d?=
 =?us-ascii?Q?NPsRBw4O5CObYh3umzmsE1mOm0yODZxo/j1iupqSHJwRvjn/h6szcGoIlmDa?=
 =?us-ascii?Q?FZOoTWThXCKf34zHnqbIVFgEenigN3qxc/cDYxIn8BWUwORp+xQgM60AI9vl?=
 =?us-ascii?Q?PCv5NAQdE9CPNeJ9hFI9a+S3Ip+x6xzAjo/eJuFAcOvfO3zeZ66rH53k33NU?=
 =?us-ascii?Q?kfz4oRaU4m5GIKJz+0PiYp8K6UNz4AHNkkiO33Qr1NhUK7q9z9npc5sP5hLW?=
 =?us-ascii?Q?I6kYO7P0iRAZnaDROlko9yrz99B2RgQF4Uu9Gk+UwG4HVYfCEXlhCyhcapos?=
 =?us-ascii?Q?WDfFo0Ksl9miVX2TemojY1qb/aq13jXjaYGJNRoMpyOi9iqt1CpfZ13BIcsT?=
 =?us-ascii?Q?kgQoujoshCuhpyVr9/XX64LW5lbb+EvvLRwYJgmmRKS2SUv2d3kgyOQq+ijY?=
 =?us-ascii?Q?w/2xiUSkbg1deRUz6x7x5ZDDX2xqPXlLhBZ1K78CImZSOKHM+A3EJERJOrj8?=
 =?us-ascii?Q?IzgBoF/heI6JScpoo0WBSWtpViSrb5V8GmduY66ySXffeZeD/VUlfiCMn7tq?=
 =?us-ascii?Q?wGhwD2Gbv11xoEJiIagpKeJOOCEb0LHmjmeuQpoU7Ej5+MTowEIpqROOuspa?=
 =?us-ascii?Q?ut51i4HHgHi+YNcob6zqQcfX1QmyeNr6hb7Cx7z7aiGFifmIrqDSmvun4Nie?=
 =?us-ascii?Q?ZYJ/fseB34fcWr53TXqYLwQVmMxVg8wZKahHpSp2qZQRFJnc+rVJ4T/HeSAD?=
 =?us-ascii?Q?wsBXgIEiJ9eQDR+dRRB+9mPAYQClGN8lRzS8v8Rb3Tr4yL9N8JvFqlf82YeH?=
 =?us-ascii?Q?iD+/9ZyzstE0i0IxdJ5YHomyehbLKMISYQhlq+oAv8FSp8c0pRDAmQo1h/53?=
 =?us-ascii?Q?JLGWHjw3N5mn2zZHWGOrEjBmrDUnuWQif4EnzYlfoAqM6j7PwxJGwFtHicI9?=
 =?us-ascii?Q?K4ZsBU/vYZQggpuGsBdWcbjvd/eL1gaXVqvIk8JKvxzNbJu2o+8EIvx8HrFn?=
 =?us-ascii?Q?7ejT9pDM9Bztx8ap8uZKS3LRlXwhlgmwlDvPEBR7aMBPw/zLmHmsogjA5vvU?=
 =?us-ascii?Q?604etYj5z/15T7Y90jhzwwBBzbXJxYMgLbIMlN7sjOsfM9PRbA3xUY7SbOOn?=
 =?us-ascii?Q?XCLB+4iX7xflQ2JRiFeFBnb7DoXHE/Cb+rqbkLCtfwt742HoDWoY25QKriH6?=
 =?us-ascii?Q?DZqJEMBzieI4QLn4eoFUNSSKbOyZthZpmsK/hsD7T28WpntO50i/5SozOpge?=
 =?us-ascii?Q?Zi6lCLd9hhTi1n1nhzO0//OThORc92/jrAz2naxk4T+ODSVpcBOkDUagVuFW?=
 =?us-ascii?Q?HRS1tOKR5XEC4Imtf9VNeAc38tc7MZNY93flri+7ZclYTipDLkh34O8+8/aV?=
 =?us-ascii?Q?0ujTU9HlqYcpoiqf/R7rRm7S46IESR0QlaPzZvaasF1oE3COy9suk/sFF5NM?=
 =?us-ascii?Q?aZrS9G99d5bwazP3Vjt/g0wKOPrLfvyqKuQVPHVnHyc0TZcFRoIDv0keDQYM?=
 =?us-ascii?Q?sYfMBLD3/ofvaQhV6/EM9g2Dnqx2ilIP5xsCVSzTS8m8XySS1hc4B45HsXg0?=
 =?us-ascii?Q?5kljqkiNxIiEr1wvAUHGmrAkzd++fJD4njKm+gLU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d80cd46-bbe4-45a4-f8e9-08de1d4137fc
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 14:31:48.5148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wogzpi5k37CYCjf6hg9q8CpUQc7U4z7TGIKZ8FpWZB6lLPM7/iwF1sGrapeiJi4tFipirznJ+QNMR1C4HYcybw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5256
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

Here goes the drm-intel-fixes for this week.
Only 2 fixes in this round, one for lock inversion and one
for clock conversion.

Thanks,
Rodrigo.

drm-intel-fixes-2025-11-06:
- Avoid lock inversion when pinning to GGTT on CHV/BXT+VTD (Janusz)
- Fix conversion between clock ticks and nanoseconds (Umesh)
The following changes since commit 6146a0f1dfae5d37442a9ddcba012add260bceb0:

  Linux 6.18-rc4 (2025-11-02 11:28:02 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-11-06

for you to fetch changes up to 7d44ad6b43d0be43d080180413a1b6c24cfbd266:

  drm/i915: Fix conversion between clock ticks and nanoseconds (2025-11-03 11:18:15 -0500)

----------------------------------------------------------------
- Avoid lock inversion when pinning to GGTT on CHV/BXT+VTD (Janusz)
- Fix conversion between clock ticks and nanoseconds (Umesh)

----------------------------------------------------------------
Janusz Krzysztofik (1):
      drm/i915: Avoid lock inversion when pinning to GGTT on CHV/BXT+VTD

Umesh Nerlige Ramappa (1):
      drm/i915: Fix conversion between clock ticks and nanoseconds

 drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c |  4 ++--
 drivers/gpu/drm/i915/i915_vma.c                | 16 ++++++++++++++--
 2 files changed, 16 insertions(+), 4 deletions(-)
