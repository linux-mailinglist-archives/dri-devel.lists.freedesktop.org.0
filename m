Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1CC8A9EF3
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 17:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19AF10EE43;
	Thu, 18 Apr 2024 15:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NWLFiToj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5114410E1BC;
 Thu, 18 Apr 2024 15:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713455265; x=1744991265;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=TsPKQVJSRlALo7Xq0guzpfU1CMsiiKDjtvsxQpSUtCM=;
 b=NWLFiTojWrLTMv7MsdNPamLmYwoPrvnora/W7CfppcovmLTrF91EWb5X
 yYz9Rt3k6p8+mL0MP2XNVIu8Kc8egaaiEU4yIRAOBhxFOdWyCFiFQZAbf
 Oby5cePDTcZS6FAE3IRPDEXsnh+uUENgAl+dvlyKiE6iCAHsd1lUJNtfd
 1PJwFTGKUbtZIcXyF+lrVqZpZo+8N3rskVlJe7Q9yw0iUidMwtVIxSuAu
 93+j5d7vl/kQLVTW8TDOXKObGCF/CLxyHpp3olGhZp2bJDaDvBQhC4GZE
 B43ENxDUNYzIo5wey3JQnejRDCwlGB+q1BJSN3IPmr8MIsokNE6pNc/yd Q==;
X-CSE-ConnectionGUID: OOkb1H6xTquU6uEvvjlQQw==
X-CSE-MsgGUID: VtNSM3g8RXKYICDsf/W3rA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8937294"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="8937294"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 08:47:43 -0700
X-CSE-ConnectionGUID: wjbXzdQwT5GyLggts+z7fw==
X-CSE-MsgGUID: EvmIg0MYSsCHx9kwr5InrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="27477379"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 08:47:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 08:47:42 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 08:47:42 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 08:47:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EhEaQpRos0OO2vgxEOpjeh3J8Dbz/Tz5u1FeMNWWPeKl0lHExaRVoHYVaorRZBDMKxUApPxOqlGPYnhRMDJFEN7wwGOOou69sAfPmepS0pX8fL+ngLGub4srAHoEtrDKXhRF7oz5C0UW2Jia2EmpZdl+tgtjMYd0wJUpmfLwtqqIy/hXwCVLTxrYrOj00a0eBi8grL7WWZEuTl4RqQknY/x3l/ejPCDF3BUDKCLasnce6ZSSR5t5hGpOMNe53gTgdj8yYVEow0WtlD6qzz0DVPrL8pZy5YUJ7L17RF77F7FyyQL4ECYTxJucRYM93nyBmy/7YrTAMZv62a82PBprZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTXv8TeuqLaPQWIDSXntY9jBD3a0rYHOCa+jF0mB4E0=;
 b=Y5FykvSl5lGlsnsfBi0MF05G/BqyA76ECX1Qo3GyF0fbiDAi90UF4LT5PFRC2TLP5IKjyOYB3BKGisyAv3r/PnSu2g44hrX6bSyiIDGIGtAzzKUOdi2dpEzZEg5IA44fVylH5wu6RePkdPHW0SI/EVxtf1U3mC4i6trFj0Kku/wGiedtfGEe/5OytNdHJDhPwEyro0ff490ZNG+UeUoOvDvrl/1a/L30mBLaEqDfpYTJNNtn6Ro67XX7AlZk8ojwUtMjFrp/jr4gsly2ecGnr3AU0ydaI7FF3XENh4AEO7Pyu9cke5qYQ/4GIm4gB98w692yK7CAGBOpcbSeJ5dkiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7165.namprd11.prod.outlook.com (2603:10b6:510:1e9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 15:47:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7519.010; Thu, 18 Apr 2024
 15:47:40 +0000
Date: Thu, 18 Apr 2024 10:47:37 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
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
Message-ID: <xjguifyantaibyrnymuiotxws6akiexi6r7tqyieqxgquovubc@kkrtbe24hjjr>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR13CA0046.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7165:EE_
X-MS-Office365-Filtering-Correlation-Id: 59dcf078-d2ae-4336-aeab-08dc5fbee113
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TqlnNWfjF9QGao+HM0Ce1iJhfEE6ZfnKB9dUOXnOCiH2LNQqLVQ3MfZFi/DYkcg/HCdKCjoh6VvujwIVP+ZOwSNYRfha9G9DYdciyckiKqQ2rvt88tVwsOtWYThaNvl2AW2mPf5PpIC05WmU2er6HXZjxAk2wgYDcMFqJKmWuGeUYbPipJHpGGAqgpDnta23LIXvPhPoRHBkVXXT71QvGCM6qpMiy5Va3Wq14MR/gVgDl9OHwQIoYweIfLqkzDFAtxaqCLAVv80wmavN/P3xU0AIEpXc7gWtkLM7AX4Js/WQHZMLkrwXGAEuwWxRens/a5CCRMMSN7byqQVBUxNy2ONpcNq4wJuY9FvbWay4kynx2zNchjMCtujtGrCvKyjl6yO96+wOtVrjWIqV7990bPfGS3icazwprf7jRNb6GbXkLQ8E6M0epuw0TZFxD25CsxACzk1iaQ9AzN+qqadbSIM5Ue1h1UP33+MH/a4lWtErUzS435PZHUu3SP70PX+i64kxFE21Eg+4yJfZSSpc+tXKkSBbrbuig92skFIAWTq6JWhQV2G1nUK8TiOMVaUxbla84bxPC2STC15uJe9OThHS6VK5LyOYjOsggVjPExQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(7416005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Yj5nskdmSP2V0kvJp6IkEXN1gINJlyxXb5WOHGkXHHcG027JLkA2vHGyU0k4?=
 =?us-ascii?Q?2RtP9AHcOJiZDLct8JtjYSALlPuAiTjZ8R2bP8zppbZr0DxtDl3IHsVz6fZi?=
 =?us-ascii?Q?JJVbniLrMojPL/yPuPoQ8xKyBSfRy+0+BVe0SN7KGjcQZSqZi8FGl4+NguTw?=
 =?us-ascii?Q?O0fIl4wKf5IMEy9tuiRPRHM+6uGwIAm99YU9dxPbEU7LAxLuxzahJymyWa+8?=
 =?us-ascii?Q?yq3q09EwpMyTbF8kjJTmkks6vQfq8XmUxuSZ3/PI7acCM6/qnAtnb/MzhVE8?=
 =?us-ascii?Q?F/yH42452ESGWo9LpG3iRFpWlSILyPleV8q9DmfWlVf7FvQ7VBRSSF1CxCJg?=
 =?us-ascii?Q?GtwJLKWKVSxenjvTrr/qUcN9g4v9hLTGxdQ28OOV/FXN6Jgg7tCd3FGxp6/F?=
 =?us-ascii?Q?xyb9zne3W9N+UAztpuhA6p+GWwerd2ew4BXmlP+ZmwD6bgVaQ9glTGEesUCo?=
 =?us-ascii?Q?gRHeVGQH4/xHyDRUgPsNNkOT2u8PHUQcVsR/YyjjrnW//eMoDK35ga51BgF5?=
 =?us-ascii?Q?5N11yYzkDknVl6ieN+CLYsH9uFkimpqxOeHctCluZL5OZtAGpWxJI1hHLtxz?=
 =?us-ascii?Q?UA5T6GO8NErupnIApi+qX07G1i/7hgkH0vFlrEHgxrauoirUtMRgpgp668gO?=
 =?us-ascii?Q?n8npe2VqlSx0uYBiGnO83bwSoSYsE9XxZsHrhjbrkliKHc6U8+05wEaGBHvM?=
 =?us-ascii?Q?q5TLPd6bmT22Lotu4ujiX0d8E/Nst1jpt3VBlQvEIvkJ2akmyQ9LlnMqol7x?=
 =?us-ascii?Q?Fov/+5UT2GU+VxWLBwiQyNxIjHg5M9bNFoH3PzZ2Mf7igPONk4okSOUJ6lDQ?=
 =?us-ascii?Q?Smc/zmr823gtezlUpJgv5M4QDheL3r+Fog6dUAVz0RSTqEodvp9iz2xP6bEO?=
 =?us-ascii?Q?kDZaa9vOjyb7vmzWAa3LcpjtBgNCbT0rXWBJufolZ64GHr4XV9+I/NoQS86F?=
 =?us-ascii?Q?3emGiqfE+eHkgIzmqom08s3ollmY3Qj9K6gZlfUoGFO6f5GfpChe/2uazgos?=
 =?us-ascii?Q?zXGy+WW3OBGFlpYCdf2kB51/Iv7GJ2rE6o4CbuJaqpY9sXv6PCUXBPHt3Nmc?=
 =?us-ascii?Q?9wyMxpFdt4HgVjd4kYxgVF8535poSUmSE+Fbxz2riiGhx22zYCuVe20DTfXt?=
 =?us-ascii?Q?OCqDugPtTj5uCrLSutj9UfEH4rcQb3RNtGNarg2pxWzJFC+gNHER5/8nZrPI?=
 =?us-ascii?Q?aX3W4eMfMTxRb9YjcReGgCHn1wxRqZ0oJfn7H2wc5dFwpFvX0z9DnQqBK1bv?=
 =?us-ascii?Q?ccaEhY85lb8bpD/VBxHZ4fsUAvWdQyycQOQLC3N11q4hD5GgxuE4Ng5fg3AQ?=
 =?us-ascii?Q?i6B1BRiR4kcElx1u58xiFIL9WeefTIKvhMugar6ZPJG53vvCc4trPYXceHve?=
 =?us-ascii?Q?UoRha7JhTspx3yo8goJGC2I7jqnlSe5QuM59ZJb5L64KRz0WTw6hAVQrhvcn?=
 =?us-ascii?Q?5g+fPtPdiYy8w1m8lE0xilMdM7UxkWpAr4/adeauEgCYwXXzLb/Q9nLIn169?=
 =?us-ascii?Q?KKhwVtKYsFjadVD2s0NIzlS9n7gVoTXgIGg0jNPBOSplrDaML+FFWZTC1YtT?=
 =?us-ascii?Q?s0lPN3RL5l4ISeuoYT+8l0aJIAvD276HkxsGOlmRVm7eG2CA0PSFYszMDUSY?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59dcf078-d2ae-4336-aeab-08dc5fbee113
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 15:47:40.6207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aB/L1sagXaSfN5S1N8vx6/QGnyJrbOmP8OReK5gb2Vo1ozvUkwpozuPZdOgS8aVDBhcKifjtxtVpRv0JBL2Nsp29xU5peSH6A4IpinLbyr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7165
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

Please pull the drm-xe-fixes for this week targeting v6.9-rc5.

thanks
Lucas De Marchi

drm-xe-fixes-2024-04-18:
- Fix bo leak on error path during fb init
- Fix use-after-free due to order vm is put and destroyed
The following changes since commit 0bbac3facb5d6cc0171c45c9873a2dc96bea9680:

   Linux 6.9-rc4 (2024-04-14 13:38:39 -0700)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-04-18

for you to fetch changes up to ca7c52ac7ad384bcf299d89482c45fec7cd00da9:

   drm/xe/vm: prevent UAF with asid based lookup (2024-04-17 08:03:13 -0500)

----------------------------------------------------------------
- Fix bo leak on error path during fb init
- Fix use-after-free due to order vm is put and destroyed

----------------------------------------------------------------
Maarten Lankhorst (1):
       drm/xe: Fix bo leak in intel_fb_bo_framebuffer_init

Matthew Auld (1):
       drm/xe/vm: prevent UAF with asid based lookup

  drivers/gpu/drm/xe/display/intel_fb_bo.c |  8 ++++++--
  drivers/gpu/drm/xe/xe_vm.c               | 21 +++++++++++----------
  2 files changed, 17 insertions(+), 12 deletions(-)
