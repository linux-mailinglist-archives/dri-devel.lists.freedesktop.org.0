Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C24BBC7BC2A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 22:33:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA1D10E90A;
	Fri, 21 Nov 2025 21:33:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L3S6Z5m7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1B310E906;
 Fri, 21 Nov 2025 21:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763760804; x=1795296804;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rdvolk21G4dS71euzdpLttUi/g5blXrTvJe38YfceDI=;
 b=L3S6Z5m7XaktInuiFOzOKr1AENiOuZe+rXyQWVEW7Ap1fMwtI6dRHxhc
 cKfdYFSiLBt4cKzdQM4CPaSyq2xkhje/wN15CmwYMIrJv06CVGQVOiv0s
 JRh9T2XuXIMSlhcV7E/iTCHWrlVIYD472qqA9AjPlnZcddjIR4//ZLfuj
 25t3bQCGIuTk43y8k+j3/8kEys/1d4N02oUhjoEyp1Pb+fvNxVe7NaThC
 /XvBVCXzZvXOaiKRuxTAqAGMd2R1nhcvsXp5tDSVVrZ/z6wmRQjw5FBIo
 Vlx7MBdrZO8TUJADJAYL6AAs+uaBKgokBgE5We5Sy8P3zmQOTnMISucrr Q==;
X-CSE-ConnectionGUID: GaC96T+kTLWFETuyUDXTCg==
X-CSE-MsgGUID: cK4ZFws4RdmavZ9T4Eq6LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="69480563"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="69480563"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 13:33:18 -0800
X-CSE-ConnectionGUID: cOzHpAw9RxWgjsBm/52rYA==
X-CSE-MsgGUID: 7RBgue1fTLqs2z0Fxycvqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="191580806"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 13:33:16 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 13:33:15 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 13:33:15 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 13:33:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eeg78IBgMaQHyj0baxqF8mGr3pTH40qwciLPM400DiZJCzrNlyqGoJ98mCH6wiZPnoyximLM+oY/Rn08SivdXjBFOZuYH2gqPzHRdcBiUUJIa33sa9egv/q5XI0T6575bn3PCIQDZqhv/xg7K1TWSnXPs1s25CcdPyypcikkOPbhqrOCznBvjeMg+ck1EQX91eGr7NjwdOy+Y0/JfbAOYxTnIiEaD0p8zYBT6gV95Bwj7J4aHdQWxwQvXVyC+yWGdDhBea/E1Vgq8jFselvIAujlTHqBsw9Z1dXNUueUDyI+ipTh8fJ+QvRYM/VOl508dIWBbwx1+lhIgZboZNoJdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abOPyD6jcrCsZQgDS34bcXUeD3eLlM+cWzNnuVa/vIs=;
 b=M1S6SIo6Ddnwu9l8RTPLAYQxooyHahzMJNB84u3qPTD+NU18IUsAncxpPOXR9u6ptAcD4K+EsnblIb9iYv4dxOx0ekW7/xpUmYZsUmr/S479l4YEIOowP8Ni0g87BxBmuw+skoxMn1MbMJgp6pT+lZoD1Mh32RMGh6NIXc4dsZPQWpJU0Np+vdu763mik1ztUS0EgA4/gnWuVlh1M4qXwX+nJo+7hbncpwecmvhdHxocAlvZnsDetL0TP/00hlt0/4B27lyU9mUIHtO+zXvRdTDbtDs91pEB4xAIOKYlYHpdiKUjWej2syeMFCro74hbm+nm0vHyKti24qwDLx4jTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ5PPF183C9380E.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::815) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 21:33:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 21:33:09 +0000
Date: Fri, 21 Nov 2025 13:33:06 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <niranjana.vishwanathapura@intel.com>, <christian.koenig@amd.com>,
 <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [PATCH v4 8/8] drm/xe: Avoid toggling schedule state to check
 LRC timestamp in TDR
Message-ID: <aSDakpVxNmWmeY/d@lstrano-desk.jf.intel.com>
References: <20251119224106.3733883-1-matthew.brost@intel.com>
 <20251119224106.3733883-9-matthew.brost@intel.com>
 <aR97CAIbMmgLQ0eJ@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aR97CAIbMmgLQ0eJ@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: MW4PR03CA0318.namprd03.prod.outlook.com
 (2603:10b6:303:dd::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ5PPF183C9380E:EE_
X-MS-Office365-Filtering-Correlation-Id: a9a803b0-80c8-4ca3-f585-08de294590f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pR6s5pwamiwUjeyFC7qeDcqf9NNdD2F+ARNDkoz19t6Zk80IRgMelx7TqG/y?=
 =?us-ascii?Q?zJPTXmx4NSPYSmJHKTi0QlziW/jk1Ho7oZ4T/dDWLtC8SIboZlfyA1uFqBG3?=
 =?us-ascii?Q?iSaILQGYcJ59UvPT/LGqd67w/Voqne88VjpC971Z6tyLx1V/alp7WoPcPtJF?=
 =?us-ascii?Q?mZCvw+gZU0mbqcmEp5U1b2rjuwnNyCeWVZk0XZ4i4t5bbABtSnjHC7KQecMY?=
 =?us-ascii?Q?k/tgnxsiLeEQgTihJMLAuFRAswk0RoPZFh6laHl01f34tRnOBOj009io5SCe?=
 =?us-ascii?Q?r4CwGtvEwWx51uEIad683sYxTV1ozLp1wxFY2PeX2iA8vKVoVmGBgUj0BEHR?=
 =?us-ascii?Q?4qxOxeBL8Kgfpd6JVmJxwzz1k7amHbTujdIYnoAFfnFHsGCc+XOLq9vXDP5j?=
 =?us-ascii?Q?+4ktxnQ1ZIxHyZjaLKtiltshsjzjgQ28FSQyKvaKZMdOLnVBj6X/18SUezYb?=
 =?us-ascii?Q?50xBanCs2au+8PXiuuAkNSqzBsmFvS7Rjlrm92/jETR5FuvcjrFxpda74aaH?=
 =?us-ascii?Q?LLaM2GsELZlulinghpapOtE83QB5guHJERwntKsU96LC5id4bEwb/PF4wigc?=
 =?us-ascii?Q?pV8a73h/a9MX7wSLlmdsMw+WUS+kLym986/y8fSpAPdkNu3aHuOjZsQWArvv?=
 =?us-ascii?Q?suQUJxix+Q6OdNl4X0NdADzBknw2W+VNmdv0E6ONw4m+dLrxdioYCQ6RgYtR?=
 =?us-ascii?Q?EXSv2aCM4wsqhDWv1cKVx2Ga9F/Rw25YwcJJkbS76ZdM9TCJNpQsn/ppVCeu?=
 =?us-ascii?Q?qshbNthjLZ2wK0vL4Yjf4Mv0kBFz9GIjv4vo/NTpkI9vHkBsO/XILNicm8On?=
 =?us-ascii?Q?lbrusFGdkiYU1s1kiM6mpmvzFhrE9Kxhu9Zebwn9lWDc+QttFY/VEs9f+u4H?=
 =?us-ascii?Q?ppSIMz9/gGvbYDiKsHYu9zPd2HXOQhbLG0HW1rYo/Z36+TjOgGwF739sj4Om?=
 =?us-ascii?Q?Zn9yoUHP2gIf+BxhDzETDyZgvFCXSB6LJsvhgMcspOdoBVKQJDIYqR1j/K70?=
 =?us-ascii?Q?QstqKAa5yy32xLrJVGJCF//YXHrMnh5T/v1GMpzVsHSQgP7Y6dS0y3tZGS0S?=
 =?us-ascii?Q?9l+4PPFMzYjCTi4NOFSjNr0HkG6g/ho47lL3svcCaWYLOvVXfE31m14b8fj0?=
 =?us-ascii?Q?KQzqTvA6OOfjLHez/Z/hqgDG34bHTCCUVbCqoFOdStubXlj2peM+dhIkHnoG?=
 =?us-ascii?Q?cq2JxDUIjsLScZYx1sVlbWcH4su2/Ah4ok8qcCKdh9Gqzwe9v8DJYYTAQMqm?=
 =?us-ascii?Q?zew8w9MJWeQuQY+Prsykxg2DpTfWgQVRKDLMUEbHr5kNl/kuZg8H7EOfgzFU?=
 =?us-ascii?Q?hYvpxWrpg+O7kxPPeo6utAm0Po0QpBQc6u/UX4ln/Y0a9Ko0upLnoID7Lef7?=
 =?us-ascii?Q?Ny7r/aagMN/uzuCfKJmk4QCa0FRtZrHZ+VQJekzFwOETfhiBJemrIXqn/I+H?=
 =?us-ascii?Q?EX24u/8vtQS789J+u6P9Eufr/wsuaZjh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7Mi++ihzB862+H9MAItGvA0Jn9r8hYU7aYcSg3qqqpL+dsdyVXChEBzMOCrg?=
 =?us-ascii?Q?rx2WIpHWaWzBKL0rcpJiKg3nM12kvlg4QgwtDjKCAbCwPt8lBVpoTnMGr9Nk?=
 =?us-ascii?Q?CPMXltExxkIz3AvwQS//xxImQKZ6X52oTdkAxmMv9r43EAESvBFtOLXarJ1j?=
 =?us-ascii?Q?AWa91HY7cZVYG24LloptUSI3aB57qPKVT4ELkr7I2UF2Do8lZL22mHlQCiP8?=
 =?us-ascii?Q?cjpREOH78UzMHcRBjHWN4b1+bRl4Ymwja74KSCJ17WzVkeerIYKY+I41IZCI?=
 =?us-ascii?Q?0tw9nNkRBj1LZnUoNQeVeAV1Y+cMv7LrNtSRnvm0HmY6q5uYsRpA+5K5ITi9?=
 =?us-ascii?Q?kG1Gk5SONOmp0jNTadXuML4NHqqEOHE+dnsfM+ZHIn2CI75nnVFdgfWf91mI?=
 =?us-ascii?Q?rYumZQ5r8PFpzUU05vLk/3Ui2zqJ8O0fOa8uUgYDowXbxVARQIKczVMZCRBI?=
 =?us-ascii?Q?PSZEHERxy4vcF8vrHpaMfHpW5WaGM3bn0QuBn/Nl0pXgOS0vZ5QAoUyNCYEs?=
 =?us-ascii?Q?8xz2zTM+q4CgAJw/IO6sjFusfs9B0ldU+6h5+PCy0yWMpIdxpR9MoJhZ2yT5?=
 =?us-ascii?Q?t48ZItyK1zn3BOjlKkjCznW4kFMn2BDXJdQeZYQesk7Xq7no1+r/wVtyWHSK?=
 =?us-ascii?Q?wPEYkFDVlFYfIgRSMRx/rCs2NwlBZL6tYmbKjMYfxnSUxbPOVEbXlf9d0z+m?=
 =?us-ascii?Q?iCdkuqD4xwzWGOGpGOgeu8x2C0VttkbYhUdVHWpVhxmckU9duEbqCcwl7FXc?=
 =?us-ascii?Q?AU/2+MSdyCW9UsvFqCAcBYeSmVRLQ9x/9PAbFVhzR7usRyil25lr9ZX+T691?=
 =?us-ascii?Q?RyfO+XY3PqsJmMIN1j9OBn4iddQllcv+Jh5e+wZOnDT2IKdUp1OZbEvgz+ag?=
 =?us-ascii?Q?JnSTr5HBkAUiQybWy2bnXqwu/dfh/8pXjXPHCguJ/VDK2FAh6MKnNMlrsliS?=
 =?us-ascii?Q?Sko+kqUUJ5syB+5Hf3x2ffRn3bU1rzAb7Y8ApOZ5R+oCqsn7ZZVxV3EXqsWA?=
 =?us-ascii?Q?3zUeGVURTn3Hrz9QFtdLxrtAY6cXiq4/7GI5GXtcqdm4c9VEQWCVQu8xascG?=
 =?us-ascii?Q?CdiYc5lqpgBe9ksu5A39YnJ+0Ht+O27DMNXrSORCjC1RVs4jpKQQ/eNrfnzb?=
 =?us-ascii?Q?dU14KwtHY6eM8jzap/0xT64n8B/jz2cElqFYjxoOFiVpTPid6Be5kNBaYcxn?=
 =?us-ascii?Q?uXJEfgbDmNx2s98AwpBKaW/Bjh2NhNWoE42RZd0JGgnV20ch7rTKh0kCsPzB?=
 =?us-ascii?Q?EZoUilhak1p7xSpiqpZ7CTNeZifD2ix0Lf+A9xBo36FHYOLcr06+ESCZ1Aa6?=
 =?us-ascii?Q?N0XCVRPjIRBqzgaQGL9ZuVt/Wf5fqlbnyxu/EtO0H9xHfe0gVuGGxhSJZhVB?=
 =?us-ascii?Q?RSFm/uCqic8JZ3+w5rZrrBF9om4Bep78zpDvXdf4gZMjz+OaqPNpqL0a7cWN?=
 =?us-ascii?Q?t3UZpG+w5jCywzM83hDrTYHSQ/p03WAJPOFpRJ4nZyZPIRZZUCBEloTubDni?=
 =?us-ascii?Q?M6uclq78ehL/ll8NsgkvhNDhN6W9Ik+fldEDtLoPypKUKhv0Jnz4KqDayo5G?=
 =?us-ascii?Q?OA5FgZmMz6ZdGjKSh5ZDaTfS//pDbew6ahpQexqMK4v8UBAtisFSVthjwbrQ?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a803b0-80c8-4ca3-f585-08de294590f2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 21:33:09.5923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pEa4fwbiFBTzZzmttslDLyQgiT1/Xaf3U4vucyvdOys+5D4I+qlfOAXZurmzzTnlCVBYRJDYhnOs0dQhKCLI2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF183C9380E
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

On Thu, Nov 20, 2025 at 12:33:12PM -0800, Umesh Nerlige Ramappa wrote:
> On Wed, Nov 19, 2025 at 02:41:06PM -0800, Matthew Brost wrote:
> > We now have proper infrastructure to accurately check the LRC timestamp
> > without toggling the scheduling state for non-VFs. For VFs, it is still
> > possible to get an inaccurate view if the context is on hardware. We
> > guard against free-running contexts on VFs by banning jobs whose
> > timestamps are not moving. In addition, VFs have a timeslice quantum
> > that naturally triggers context switches when more than one VF is
> > running, thus updating the LRC timestamp.
> > 
> > For multi-queue, it is desirable to avoid scheduling toggling in the TDR
> > because this scheduling state is shared among many queues. Furthermore,
> > this change simplifies the GuC state machine. The trade-off for VF cases
> > seems worthwhile.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_guc_submit.c      | 100 ++++++------------------
> > drivers/gpu/drm/xe/xe_sched_job.c       |   1 +
> > drivers/gpu/drm/xe/xe_sched_job_types.h |   2 +
> > 3 files changed, 28 insertions(+), 75 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 1f2afad1766e..7404716e979f 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -68,9 +68,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
> > #define EXEC_QUEUE_STATE_KILLED			(1 << 7)
> > #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
> > #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
> > -#define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
> > -#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 11)
> > -#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 12)
> > +#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 10)
> > 
> 
> ... snip ...
> 
> > static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue
> > *q)
> > {
> > 	return (atomic_read(&q->guc->state) &
> > @@ -996,7 +964,7 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> > 	u32 ctx_timestamp, ctx_job_timestamp;
> > 	u32 timeout_ms = q->sched_props.job_timeout_ms;
> > 	u32 diff;
> > -	u64 running_time_ms;
> > +	u64 running_time_ms, old_timestamp;
> > 
> > 	if (!xe_sched_job_started(job)) {
> > 		xe_gt_warn(gt, "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, not started",
> > @@ -1006,7 +974,17 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> > 		return xe_sched_invalidate_job(job, 2);
> > 	}
> > 
> > -	ctx_timestamp = lower_32_bits(xe_lrc_ctx_timestamp(q->lrc[0]));
> > +	ctx_timestamp = lower_32_bits(xe_lrc_update_timestamp(q->lrc[0],
> > +							      &old_timestamp));
> 
> Reg: xe_lrc_update_timestamp()
> 
> The way context utilization is using this helper is to accumulate the 'new -
> old' values each time this function is called. In the below example, context
> utilization will loose some ticks.
> 
> Example:
> 
> 1. This code calls xe_lrc_update_timestamp() to sample the timestamp for TDR
> purposes. Say context/job is running, then the lrc->ctx_timestamp is updated
> (moved forward).
> 
> 2. The context utilization code calls xe_lrc_update_timestamp(). Within this
> helper
> - old_ts is sampled as lrc->ctx_timestamp
> - new_ts is calculated based on whether the job/context is active
> - lrc->ctx_timestamp is updated to the new value.
> 
> The result is that we lost one chunk of utilization because of the previous
> call from the TDR path. I think some refactor would be needed to fix that.
> 
> The other comment you already mentioned offline is locking, which I think we
> should add to protect lrc->ctx_timestamp. I don't know if a refactor will
> avoid the lock though.
> 

I agree with you analysis here - thanks for the help.

How about - we extract the following code from
xe_exec_queue_update_run_ticks into helper that also returns the current
timestamp and is also protected by an queue spin lock:

         new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
         q->xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
 
It harmless if the TDR also updates run_ticks when it samples the LRC
timestamp, right? Also the helper just skips run_ticks if q->xef is
NULL.

Matt

> Thanks,
> Umesh
> 
> > +	if (ctx_timestamp == job->sample_timestamp) {
> > +		xe_gt_warn(gt, "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, timestamp stuck",
> > +			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > +			   q->guc->id);
> > +
> > +		return xe_sched_invalidate_job(job, 2);
> > +	}
> > +
> > +	job->sample_timestamp = ctx_timestamp;
> > 	ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
> > 
> > 	/*
> > @@ -1135,16 +1113,17 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 	}
> > 
> 
> 
> ... snip ...
> 
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h
> > b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > index d26612abb4ca..ad5eee8a8cdb 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > @@ -59,6 +59,8 @@ struct xe_sched_job {
> > 	u32 lrc_seqno;
> > 	/** @migrate_flush_flags: Additional flush flags for migration jobs */
> > 	u32 migrate_flush_flags;
 > >+	/** @sample_timestamp: Sampling of job timestamp in TDR */
> > +	u64 sample_timestamp;
> > 	/** @ring_ops_flush_tlb: The ring ops need to flush TLB before payload. */
> > 	bool ring_ops_flush_tlb;
> > 	/** @ggtt: mapped in ggtt. */
> > -- 
> > 2.34.1
> > 
