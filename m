Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F4D9B8F75
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 11:42:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5AF310E998;
	Fri,  1 Nov 2024 10:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JtMGIWSA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048B710E998;
 Fri,  1 Nov 2024 10:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730457720; x=1761993720;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=Vsu9kOp+oO2WIMCeHUOGh83ZRE/Sq6Kyg59C+jUsS6s=;
 b=JtMGIWSAyGWd7+KsWaBrkkwrEdDQO6MjK7FV6BO+nOeUyJ2m5Mi/uyKu
 DtxbGEjAx+upbSPz7J+RQS83GY7/DtvtqoT2bdsBPQ/zZ1xj+aYCV0I+x
 DpENdzcQb3KwivJlC2UcLtNnu0/Sl3h7xsqsjYjdFqidT7Wf9Y7gqK96P
 VKEuopGNkun7KKrS9hSN1l3IY9QCp4dCKezT7IapD6bSpCgvIkZAFcuvv
 cFvXnEn8bdmbVsxQYVbY3GwgJQhLMl/sbIgsAo2upiKeycZELNtiCthpG
 s2hIk31WYz+ms2XCvrJQnAkGjAdBgmj7SYCexUEVnCcxme2O6fQtLYrYo Q==;
X-CSE-ConnectionGUID: r/O89EEzRd677FXmCQwrnw==
X-CSE-MsgGUID: uVaL+UxKSHeffLHUkMQDpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="34156392"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; d="scan'208";a="34156392"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 03:41:59 -0700
X-CSE-ConnectionGUID: 6mpAOZJ1RuSI5fkRoHJc/g==
X-CSE-MsgGUID: +8afJJk2QoS3lUr+c3XRNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; d="scan'208";a="87468284"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Nov 2024 03:41:59 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 1 Nov 2024 03:41:59 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 1 Nov 2024 03:41:59 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 1 Nov 2024 03:41:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T1CsVz67b+vOCoavVx0UJMku8QPi6iuFKxqxNZtu8zQmxj2C//99GP3wdX/7WYeO+0Q7bm6I3yAOgtz7iQBPWp6ZfgurvFT58QYp7BkvW64ylTgdYjz7e3XTUVXpQWSKuAH7yZk/VzTw7wUch81VPWX9Fl2KDQ2lJJiE8ZIYP4k9Pid2MKja26h4nWpvRhmBTwblBOJCphliCllqh+IqaLfS4aDOdUtzJw+eV8FdGWCdtEy1YivZ1f202BA+tRM9wybLhfxeUzLu1J89hEYD2ZLvmBYen0N6h+PP5DDydi3reVZu5lDf3R6AQ0XXLNmoVfWBLwRYch0B/AHxynC3xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hG2IpAXnJ6okDOI59YmyEB/p8E33gcDTSgXfJvZ/HcI=;
 b=Oa0RQ8DQRu6RChqkRMRZNwWr+bEkkNjEkl1eoXYvcmtRIfXnP/rAaxZQOyS+Y1NDcLzlHAcXMCDcWtm6i5MFvNumNmVyXcx0u5ZORIklILcukiRgOub0EY/BfX+fZGqhxyjJpcmkneGDmSfhv1spYfdMh53AHiE7Re/odOrru038PF4m5NX0YEMjinAwCZqAnP8s4QiJgtmw690JxnYtcW9HtU6azD8TQyhWCIyD08WCcncGF/4dKeqFMQ4V9alW+6xZTUrjEV5keB6VwXQqSiOdpuC0LunU6bTXjHAtbBslp2z+IgfySmF0MNjMiSougFf2xd9fK7dmVX1ymdHGLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6099.namprd11.prod.outlook.com (2603:10b6:208:3d5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Fri, 1 Nov
 2024 10:41:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 10:41:56 +0000
Date: Fri, 1 Nov 2024 05:41:52 -0500
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
Message-ID: <tsbftadm7owyizzdaqnqu7u4tqggxgeqeztlfvmj5fryxlfomi@5m5bfv2zvzmw>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
X-ClientProxiedBy: MW4PR03CA0040.namprd03.prod.outlook.com
 (2603:10b6:303:8e::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6099:EE_
X-MS-Office365-Filtering-Correlation-Id: f8aa3595-590d-4f4e-072d-08dcfa61ce86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WLuNpaJyhlYJbjkuFWj0RL+XfUErHoT/Ka57JYN4gdyEwcRGqsF5gNl2OUNi?=
 =?us-ascii?Q?vvuHS61Rjgp2OH6FdqVlRkxGsmEbfmTlIoTwpcVYO+sQ6fUMtomBBLHsQSQA?=
 =?us-ascii?Q?x+VnjGKAeh1ZAVAZ3nWa1rKZovyPyIS127/uWn5lCkeRYqIsN88I4I+8+zUr?=
 =?us-ascii?Q?mI64hCYmNplbspvomilrZLHel5F+Ccq4eYYiTe2u5D/iRe3MKQ6VE3ZOmY2S?=
 =?us-ascii?Q?0x7rV8hw9+Hsbfx7Esufzti9bhaKnmnB9oLFmdNFqLgEz5P3NsoU+fTvpS1z?=
 =?us-ascii?Q?ie3INi93X9b9Xy5etF4n0o2Vb4p/mWf69e+h5MLTjK/vlDSfwWi14zLxIitA?=
 =?us-ascii?Q?zZtRnWhwgzcG4V4IgEAbdF7FF3mWdJmK/fj43Utr6wzSUvmzlwoltw1c96Dx?=
 =?us-ascii?Q?HHfMxLio6pggMv3ThWK7t9u2X4TuRT3NDcb4+qVXXNwG4MGfB/V9EO4RezLZ?=
 =?us-ascii?Q?wtYf7J4O0gagOdCWjP2Lm2QTUO4xkVp7lOGmGicNv2czLx0ePT0anRsuAPMS?=
 =?us-ascii?Q?P5i8M497SyQOyY7A/UTuxVOs5QA5K993HLq39EaMR8yLm0G0OfVPYwC30KEv?=
 =?us-ascii?Q?GrdczQH8QmdTJYPXXFAOS3or9ob71MZCBjPk7125wcucEALcdUWCZ6TBq4nc?=
 =?us-ascii?Q?fpJh3RnWebwoUo18a8e//SC2SgcnNczv5gQH0W8/ozNPFnimEM8CW0DRLT1X?=
 =?us-ascii?Q?8T3K8IdC47gCpluyKrfBxclNY9gei0XXZ01Q9c4h/StTvt6BUPihArmWk5R/?=
 =?us-ascii?Q?rXiEp7rKGD2I2cGvz/MwitSpYwzTEcId6v3exUQJMLD9bB28mgCkKWXM/+Jk?=
 =?us-ascii?Q?TI4bcnvmipgFXENuf8QdyMU2IguKNhPv7Sy9hqmGvmL8nsJQvRiSZzGkDIMj?=
 =?us-ascii?Q?uCDy1x3w3ELa5QhXotQaDvgxPbwYMzlDUcNZBmX42lkXH0yvKPgZD5Si+hGw?=
 =?us-ascii?Q?vWZ2hrrwcC9wLZXJ1Mdwb+B5MhEXGQPXbU3ztOkSlywriB3UnF1ySS6J/Vcc?=
 =?us-ascii?Q?SjEeGz63yilm3BgXzlAvJkhbNxO3hQfAhr0TQ9KXGoqEvpO0K+eOsAqB6+im?=
 =?us-ascii?Q?FjOJz9lw//QR6WrNzFwUPAhcejPsxPjym5qE1LRbGm0v/P8ajMTFXKPfq4G5?=
 =?us-ascii?Q?fZnZ06EhfsnUVW8MRuqBrJALGZrRPfznfjZsDUgN6TvS9+holBvHmnij0YL0?=
 =?us-ascii?Q?akOzbqAY/fMIR23Z+ueqi3LWxVl7uEAAjsa18VjR00DGE5+uvhdIn7GscOaf?=
 =?us-ascii?Q?PU0G2k8leJFoC51Dn8IV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DK3qh3KYW2m7zXIFxr5qd2CPf/S8IiV7mbPjpp35nrbnEruGrWPekxUVAA6u?=
 =?us-ascii?Q?ecSYbJGGFuYYuhHhYLeNWlcrjiaSZd832MyXeOug75jDZZ6+9+mK3iDATx5H?=
 =?us-ascii?Q?X6iWRU0FrySYG4gcmBHFR9VZwZ+cP3TzFUpbLrH0on7HHksL70B5QwQjzyY4?=
 =?us-ascii?Q?/G37/Mf7u9Dz5qQHMhtLdPAb8oCiQQ77j3wkPcn/MkkjjYMoh2hHzaMsaZZB?=
 =?us-ascii?Q?w4LN1c2f0L06lDXLxoTJqVWhGLKQlEeFSYMPMKRNBjXox8oOFRwLHwJpT+MU?=
 =?us-ascii?Q?PN+Q51LSa5UtG7rHBSXqCaWzCasllp+jtnatxyb1Yg3PBwpcGzYOVMvhKLAJ?=
 =?us-ascii?Q?2hrv2tO6rTa/LEycakyAfmb22K5s6zUAmYLWTHWFxHIM/xkRiD5MaQFm2Zyx?=
 =?us-ascii?Q?8AzHytm6aQxE2BrwDuwSxM7eU7jslFyGf1uINWCVMGymAw+PTkF5WcOB0voI?=
 =?us-ascii?Q?8uAh2l4XkwAeFOy6DhebcbyouIF+kmg4vBZjC0+/WOa9aKPWPyDam8xef8TZ?=
 =?us-ascii?Q?Uo6kpbh6YAHzQfSUvJaUc92Zr2LWs7VsIk8qyOrl+o1Ab3MyXO0pYpKRRfCN?=
 =?us-ascii?Q?brpHFRhd0vo8IQxYimTcl3eiDSn/vJiUyeDKaQcH9ytx+rsde60NWFJBZtpg?=
 =?us-ascii?Q?sE7wSUZuebAuw5RV4ytYZi1isjpdYOI6XLrCNCNzaFHFcLYLdmX5o506EDTK?=
 =?us-ascii?Q?4yKF7f7K8b3JU8G93j+JlTdZSLK7LspYXCsWzNhFVmQfDUrcnxFlKnB2ggki?=
 =?us-ascii?Q?GxephaiRJ9ocoS09EYffTD+yQ3Klu896bn6AlduZqnwp/OzH6EH1de3X5fZV?=
 =?us-ascii?Q?1DJ1qdLaeogg85jm/MWdKjhTHiplnjwxFA5BVCYTIF2UT0QHNJrAbiKan5eL?=
 =?us-ascii?Q?aIp52JaWygdDgzKZ0jFYV4mddTtbjk2LGX2V4Ua3RDS/cnTnmBEBehN7tQo6?=
 =?us-ascii?Q?rRzHL+vFT4v5t2HkQPTZH9KZXA7Refr9xsio93gskm/7Jpi4WSIM56ATu1e2?=
 =?us-ascii?Q?lhC+NgS2J4iUVQMFrBUPjnB1wlduwjh+LYM1f1v7mAarUI+RRNz0ADZZYXio?=
 =?us-ascii?Q?JrUkgkwimpqLuKK+tP1bPG+fIYvpVVvDtUxHXS90/gtyy6E6XvSmROJq6TKC?=
 =?us-ascii?Q?jko5ZFoTk7/KftO0AAjR8QvzeUA+F+2NcxePuzg6lp4RtXI2m3/h+fJ4ukZD?=
 =?us-ascii?Q?IaRqzwWGotTbYWAcMAqAVe63simh2ISQUW0C8R1qz2ai1qI31JDYmYuklLsT?=
 =?us-ascii?Q?MRTZujIyp+S+/MYYL8mYcp2QfRCE+oMSPG3SPulgMocRNycFSgOLJIatmb/8?=
 =?us-ascii?Q?leg44EEinLi+t5JzAEswHfUNWDdM+JknykR6LBHU0gBhzSapHvweHssCSUxg?=
 =?us-ascii?Q?J9Sdjd338iZdGazUcERC1it7hZ+S2PiYZCBHNme2GrVHPhfJbiVNkYUTK4JZ?=
 =?us-ascii?Q?yIz8CgII6ucEFdPzMPDqym3P5rQGmYFLPgufT4nrkYLzWIwfh88/SL0FiK9X?=
 =?us-ascii?Q?3RfjcoUV9QD5U/K0Khlx1GJMNCVH/Ut90eoH4xQIgavfqRtDSj735OrHf0GM?=
 =?us-ascii?Q?rYRlxAilPtPSH7nWD5JhCkXOM0UbnWNOCHrujtBfDRR8Dbxy8P6iu1BxWNTq?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8aa3595-590d-4f4e-072d-08dcfa61ce86
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 10:41:56.5498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +/DDbBs6p7VkKL2NhRrpca1Pu5FJwjYtjwN+G5MnF/6xqXvX1ezlTIC2H/MRRKQUJbxgPIw4W5Vw97vcsHwRQAJ7F6qWs8PHIORkThps8ME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6099
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

Hi Dave and Simona,

drm-xe-fixes for 6.12-rc6. Two important fixes for LNL and one missing
hpd enabling. This last one brought in a refactor as dependency,
otherwise it would cause some headache with conflicts.

thanks
Lucas De Marchi

drm-xe-fixes-2024-10-31:
Driver Changes:
- Fix missing HPD interrupt enabling, bringing one PM refactor with it
   (Imre / Maarten)
- Workaround LNL GGTT invalidation not being visible to GuC
   (Matthew Brost)
- Avoid getting jobs stuck without a protecting timeout (Matthew Brost)
The following changes since commit 81983758430957d9a5cb3333fe324fd70cf63e7e:

   Linux 6.12-rc5 (2024-10-27 12:52:02 -1000)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-10-31

for you to fetch changes up to fe05cee4d9533892210e1ee90147175d87e7c053:

   drm/xe: Don't short circuit TDR on jobs not started (2024-10-31 07:03:14 -0700)

----------------------------------------------------------------
Driver Changes:
- Fix missing HPD interrupt enabling, bringing one PM refactor with it
   (Imre / Maarten)
- Workaround LNL GGTT invalidation not being visible to GuC
   (Matthew Brost)
- Avoid getting jobs stuck without a protecting timeout (Matthew Brost)

----------------------------------------------------------------
Imre Deak (2):
       drm/xe/display: Separate the d3cold and non-d3cold runtime PM handling
       drm/xe/display: Add missing HPD interrupt enabling during non-d3cold RPM resume

Maarten Lankhorst (1):
       drm/xe: Remove runtime argument from display s/r functions

Matthew Brost (2):
       drm/xe: Add mmio read before GGTT invalidate
       drm/xe: Don't short circuit TDR on jobs not started

  drivers/gpu/drm/xe/display/xe_display.c | 71 +++++++++++++++++++++------------
  drivers/gpu/drm/xe/display/xe_display.h |  8 ++--
  drivers/gpu/drm/xe/xe_ggtt.c            | 10 +++++
  drivers/gpu/drm/xe/xe_guc_submit.c      | 18 ++++++---
  drivers/gpu/drm/xe/xe_pm.c              |  6 +--
  5 files changed, 75 insertions(+), 38 deletions(-)
