Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4697E66A2A6
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 20:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C40910EA8C;
	Fri, 13 Jan 2023 19:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020C210EA8C;
 Fri, 13 Jan 2023 19:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673636777; x=1705172777;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DdQ5zokSAwL8W4i1A99tHqqLMzi7f2jW8ikEE196vTA=;
 b=fcM//dRbgUkAN0BUrt5XgmIQT6dNMi7AjXhVYMIuxDikw/7fzwMWulIW
 7rs77iC7Fxv5I1zrFO5Mm6gz8Fb+lnHpmgxnAB9fLnEGg9juQ0EuchSEY
 JK3yHhWOxSLzE6sC+RgBmt4msqUcUD+IQjTIGSYEqoA3A0/uQHea0VTzR
 9wyNPEVxjD+ygYSzjQpzLhGL5+DkrurQxXEtY/nUaky6ro7wQptxaLDRc
 kc7qdPK227adkiovTi0CVT7nsYO9A+N/6EdHppcHkD8v08rLNgeOzgY8c
 j6PI2AWj4dPC5kCvht+vD9dDorXLkxvD8A/AxVQ5bduBRSE+ZqwnT63Ws A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="325332666"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="325332666"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 11:06:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="635873566"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="635873566"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 13 Jan 2023 11:06:11 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 13 Jan 2023 11:06:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 13 Jan 2023 11:06:10 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 13 Jan 2023 11:06:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rl7sbi2bKVTOI1C+x55L09cp/GG2RLW93cEiSwTXbXMdv3zvk6E+Y9wiZk2HTulTVm0wWHsJyVr6Avp0rXZ+58CNEgZJze07OH4DJwfkmjR5krCmfplppbIemJIJVp7DR6BagJ4UsWHVlEhWWqDTInxn0mtH41U/7uBfEvMQO7qZyQ3uVWcDRIEFLqyYEJ1mTBnL8jPboGwoTDH03hAIvOqGvrI+EBxFo6uc48yYfXKmbJhcv7zSz6k2Ov/06ANyRB74pBLBo3ocoyJPgsTydfDObV3W4RMNsTqCOqf4y+QBE41jxtEi1xF+DP5IxMuBxxBvd47DSuPF/xJz8O5Lcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LU0gbKENw8lX+X1hUowffIKjrJXB+TCMJGJWvA1Dc4=;
 b=e/d9Rn8IMcmrSC2Yrk8Q9Epi9VLzV+47wcXq1ZcsXS0Mt5Cm8A7XNMmS9eHVhtx7+0li5ZuvhKEAtC+Cdi/3phylDwH0wUMf3wj0BfKEMU4ONkRY0PJ6BtDgKRbQXoKA2noYZEHsmvAxInjAsNbTyyiVM53Iq5c8aeWP/aRimT4VzTUddjZZ981wkvhWoVMJiEjoM/n1xgfpj3W9Zf4Em1/ANNPKFZXTuSLVvrCgiPKG+Du5IvCqf9VL9EijJEWhJnI5l2bxIyqWBnoGZi+NssTjNMCgJjJoAIKxfJO29rL00oN35YklMrlJuYeprlyJwfwazNe7MN2LhtPqw6lgFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB6474.namprd11.prod.outlook.com (2603:10b6:510:1f2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 13 Jan
 2023 19:06:08 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 19:06:07 +0000
Date: Fri, 13 Jan 2023 14:05:58 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Deepak R Varma <drv@mailo.com>
Subject: Re: [PATCH v3 0/2] drm/i915: Avoid full proxy f_ops debug attributes
Message-ID: <Y8Grli/Ie01RvDBR@intel.com>
References: <cover.1673451705.git.drv@mailo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1673451705.git.drv@mailo.com>
X-ClientProxiedBy: BY5PR17CA0031.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::44) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB6474:EE_
X-MS-Office365-Filtering-Correlation-Id: 805b76c2-9443-4961-0926-08daf59937ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +qqMsRfru7HHE6v6PvcQCEahX059RQ4gCqcEJ/YeiFzxC8zyIR9CmxZ/I8bgbyyzi/gj4mEo1gakKUpQvFkDS88llOKkbs6jKYUBdCQagzdzM3F2g4Nii3GVkSnYhynXWnRKoV60QiKG62bFfAGbjPAVfSiFsFpTfLJ2M4aNFEk1TVv8q0dBcXO/jubQ1gFmH1pH6/vp5g7rShacI7Y2VRTRGTFZbdID77n5lGi4LaI3fTLMC27Hwwf0bg4SYvlT/DeHfMTSMlRRdHFoOkqLkkmIS0pIeaUEFgLLeGxt6OrE0CVSeV239rImUkyjf346AbfR+qmwxh0M1aYSXgYMKKHqypfqj66n/CJCOBwc31EPqC6y//0S+zEuwLPMrKeVt56nIe9TCA6YOd9s2nCqrg/iJmQ7xjfwHEQoUp2sagB39JKCcsMK/sCZ9AE3D71QI5NKDY9KVg6yed5007ZeqLfvfRbSB0K+YQJGfUD4B2QQo9NsslpD+zsk3w/Jr3Mt5ewaYrFnuk5UKDM9/s0evAtYNL9GZ+KLZ6ZvPNhMje8gV4WYrhZM291EJC1QBPD0chkjxfMnX4oytJUJ7KhgEYpJpiXgFhctqTRFr+6kRlHdqk7xCIoMWyhB7IugjTBHTcM7/nAEdS2fyshHoB7OBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199015)(6666004)(6506007)(66946007)(6916009)(66556008)(66476007)(6486002)(8676002)(186003)(26005)(6512007)(478600001)(41300700001)(2906002)(44832011)(4326008)(83380400001)(7416002)(5660300002)(8936002)(38100700002)(36756003)(82960400001)(86362001)(54906003)(316002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pBCfhI+p55xPy6Q+eaRbSOa+eSNn0I1IsMfNuW7BcFPa8k3AoLfRujUNiCv8?=
 =?us-ascii?Q?ndw3ot1yFtTWjMhpBA2u1nYDjgQnSEGU3x+431BxABM0qkBdTXOrO4x1+4mp?=
 =?us-ascii?Q?XpnsOT9/rDVldj0csngU71XbHUxnqYSr2XVKRcvr3af0pWEq9QR+lJaBiEqZ?=
 =?us-ascii?Q?M9NCZRlVLHnslgPKJJ9NjQai1ZnvlZB4SGVg8bU82wsQrRtddNgJkddDv5oq?=
 =?us-ascii?Q?PdIUqeuXFBpxbk2VoDhPw7KsTXg2m3JP1j1e8MOijn/1T4f622ir6NAc5yTF?=
 =?us-ascii?Q?ac+ej0aSPRWI/4vzMLjs54nieVwb7E69vsbOD0Ea90On121cr6fAwJXULmUo?=
 =?us-ascii?Q?cusKGentJuoi087LCNN3ZirKsrujQme+E0Kn487lOL16D+XRsixY1pKoUBJL?=
 =?us-ascii?Q?A5SY0uT2eE6lXvF0QCND1HwISymTiPkzwTO835JHnzaba/HXS7i+Tit/Iiqm?=
 =?us-ascii?Q?b7iBnpix5wdcLh0TS6WldAdlcomiR3gpsHVLV+ivyf1BY5pj6MbB0JDbh4xN?=
 =?us-ascii?Q?mjbHW1sEt/4WY3hff1p4PICm+24g4GYTN53QWa4sNBKCvTk5l5aIeUCI4FoS?=
 =?us-ascii?Q?n6GQ8YO8ld+smHLmVu50JPxZnTUoSIGexuEY6NGdQbGePIZaJpAL7LHfMMAh?=
 =?us-ascii?Q?WZXLLLg5mgwBLSczfrCDKfiAxUmBd3tUSWlCG4uJ8n1whdS4jd5nFSksJOEw?=
 =?us-ascii?Q?uSKjRghB1uQsqPob1yuNfmiKm+2AEKtr3SPeGa+yyLk529Osg6QgvnxNpw/M?=
 =?us-ascii?Q?VbJ4OpiMkBPcuxv2xYRSpjgf3cmYzmFcCu+Fo4e0F6sI27blkGA9enC1bc3l?=
 =?us-ascii?Q?7eI+ugw68uzFW+u1C+/e3yFdZ3Z15BfHIny1fdOJ6lcK0LmqWG9hhPY3MeHS?=
 =?us-ascii?Q?VvpVg99ZABQKwvmwUnMA3dEZ1oFoCqVwu/xpiayhcJC9F9jm0NlDb59WSg67?=
 =?us-ascii?Q?Le6RdIr372bxxMFm8xX2HzMfoTQqEtvNP4fneosWbUzgH7Vjm1cuAZRtimuk?=
 =?us-ascii?Q?plZplso+iLtJtLWuGGsA6Jd1x9PJgJ9VvObCCmGg5Vmv5NBK/3fpfp2u1zVz?=
 =?us-ascii?Q?Kdo737NOEbj7+c1GrbWQsanOFIl176IFWzVOrtnseB6NVDPjKIq+IRtrHH/E?=
 =?us-ascii?Q?gFOBEAHG85i8pQaCRazSIBnMYzOwe32VcKbaL5UFBlROozczWSIJeW60sFIo?=
 =?us-ascii?Q?aMZn2yLMw2KZxO4yyTitta0u/jURnRy8RCbmaiGNWWQSWwPdJJSGeNUaglPe?=
 =?us-ascii?Q?13GYLuPkq0Dpcmd1aQJWRfJcnALMZlVmKjEWbJc0b2BDM8mER//0MLbxurSd?=
 =?us-ascii?Q?3cuYMp5VARdQryFpT/n99j6RCA6raoFOOxRQgBbiz+ETbCGhYtH6nA+imwd5?=
 =?us-ascii?Q?V2pC1JN9cJ/Y+Gp+WgPiKndUBAXTaVAERNLF9cHTm9+54q7JMV8EmaMJp5kU?=
 =?us-ascii?Q?emh5b0tf15TKsNonFl7bblym0DZZZmztCXCBA0Lpz/HiX74UUIRkTRtbv//1?=
 =?us-ascii?Q?tqJagkEQXdQ/lBnTNmak2aSzAB4D6OI0/r03F/Rydixo4vOs3SkIU5Wv+Kq/?=
 =?us-ascii?Q?sCESy0tUiCohVOkteFESGbZoKfI5cGSZs6dglMgxKcVE4URVM1fqQG7/YowV?=
 =?us-ascii?Q?Gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 805b76c2-9443-4961-0926-08daf59937ac
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 19:06:07.8699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RPcgEKY+hefyqvjxWmCqdZdLN6Wfosi/lFS+azl+ds5k6znF5DYxXa1/pZrvpA0Dfb2+tYD/Ncr2wh4+1v9XWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6474
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Saurabh
 Singh Sengar <ssengar@microsoft.com>,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 09:20:40PM +0530, Deepak R Varma wrote:
> This patch series proposes to replace a combination of DEFINE_SIMPLE_ATTRIBUTE() +
> debugfs_create_file() by a combination of DEFINE_DEBUGFS_ATTRIBUTE() +
> debugfs_create_file_unsafe(). The change reduced overhead in terms of managing
> the full proxy f_ops at runtime. The patches 1 & 2 covers for the DRRS and FBC
> f_ops debugfs attributes respectively.
> 
> Following coccicheck make command helped identify this change:
> 
> make coccicheck M=drivers/gpu/drm/i915/ MODE=patch COCCI=./scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci

pushed both patches to drm-intel-next. Thanks for the patches.

> 
> Changes in v3:
>    Patch 1/2: fix checkpatch function parameter alignment complaint
>    Patch 2/2: None
> 
> Changes in v2:
>    - Individual patches clubbed in patch set
>    - Update patch log message to include coccicheck make command
> 
> 
> Deepak R Varma (2):
>   drm/i915/display: Avoid full proxy f_ops for DRRS debug attributes
>   drm/i915/fbc: Avoid full proxy f_ops for FBC debug attributes
> 
>  drivers/gpu/drm/i915/display/intel_drrs.c |  8 ++++----
>  drivers/gpu/drm/i915/display/intel_fbc.c  | 12 ++++++------
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> -- 
> 2.34.1
> 
> 
> 
