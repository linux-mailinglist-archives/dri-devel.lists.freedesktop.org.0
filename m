Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFF46D5594
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 02:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5722C10E0E2;
	Tue,  4 Apr 2023 00:34:38 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EEBA10E0E2;
 Tue,  4 Apr 2023 00:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680568476; x=1712104476;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Qy0dZP4zPZR5cd/sF4WOp3Pg03W4jUSTDpV8xOkvJ8I=;
 b=HEGUHsyhUVjIqQdTQ3yqfmI6tXq3tx8oXqFv3RDvdJyCr3SYmbtBuFZT
 /hVgwgzOr18AsmfUPgyQ/NEbu43nBtU1rACtVCiT9/1pLub4BkBzAqFt6
 TBY5+rvQkJKEv/1MgDCjKzGnc3cRW0uFE9FmHka9qBUqILMF5t8OMxPGD
 S5+QOIZW9acJL52dz8GC4sTgNjNb1u5Kus2tEX/SSdQAnvs00+5Lh0igc
 DCO4HBUmDDYE46jP047Sp0TctghnutvMp8ibeg8sC2IdZwwnF/k3la2mG
 tG/KjKn5N4l/QbNNDpSI8uDOyvERAgo5g/7urOOaovEnX0kBkuF7jwpEx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="326069304"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="326069304"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 17:34:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="636315969"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="636315969"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 03 Apr 2023 17:34:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 17:34:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 3 Apr 2023 17:34:22 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 3 Apr 2023 17:34:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dpNQCskWEUuCIs3PxiGiS1eweGiKbPVFwBS2SxNCK40woI/t7X7fRWBYUrxlIHwxTB1OfZcWzX5CzLAgp8fTsezrErhpnG7lZlolV0sZuk5VlMLlCQsi+yrYxnjP6P33TwUW1WAtA2kdb1cyAphALkPVE80e8no11Ws3yrui+5vDAGBS1f7HDdeMaffeP3TMW1u14mQjFZuYg7Tn0Bq+HAlnbpBpZSBZ8bPCwwUOFRdii++0tEmMQvwzNPn9cklVopvLFvLIFEjqL02NvN1M77fipmeMV3XePD1Q4yqHO0TAEXQnbHnDdZlZ4pDgCUWAlbBlRLh2WD6SiA8NSoYvqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEUFOhAjGCwbAS3EH5NTvEQ1Gt6LejOvqwL1WF7rpgU=;
 b=HocWnWyyB4CF2nUU+C15sY6RCsxVP+6n9JXUu4rRxUIwKDvi+4SYTPZLPRUWfWJUtmJBca4d44hljHRJR/h88cEL+z+8HtiWVt8IEMgAT8qMVaBO2mXyI/MHcqVoAC5K/LOxFoiwwHIbm80OxR6Gk6KXTNap3j+lQ/YA1FTcy8XUPkAdsaUMqQLDVFPGE+ZDji5ARndqkUhwLgSPNoTQ+OlFD6xFNYXRzk4tWIBRYKeusjHIEXk67MGaxxA9JLBDiRlYrxCkR/S3FmWE3obLbX+81E+6R1E7klc7KwkEuEj3i52+7EvIysudxLItrpMPZy4kSKen2E6hrPrv+pm3IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CO1PR11MB4769.namprd11.prod.outlook.com (2603:10b6:303:95::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.28; Tue, 4 Apr 2023 00:34:19 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 00:34:19 +0000
Date: Mon, 3 Apr 2023 17:34:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <John.C.Harrison@intel.com>
Subject: Re: [PATCH] drm/i915/guc: Don't capture Gen8 regs on Gen12 devices
Message-ID: <20230404003415.GE4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230403213334.1655239-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230403213334.1655239-1-John.C.Harrison@Intel.com>
X-ClientProxiedBy: SJ0PR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::22) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CO1PR11MB4769:EE_
X-MS-Office365-Filtering-Correlation-Id: f41f8e74-b78f-426a-be85-08db34a45396
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9CvlJIC8u9rUiRXs9DPQJdCfgpotP8r+n1Qyis9oMwEv6kd5DB6xMgJ8S3bGpgL6z+5Rodc1209ARvzPaY+mzV/wmd1EXOx7xX4nnUbrbBlTWgvqVThejOnyaYjzBBdKJwNOr7Qx5kG5BoId1QHtXdEWdc6g4XeZnq9KJFYEeOBNZGSHAeWtVCASkHki8oC0Uh0jsGq2iJExzQnOnz38dqdX0l404+EHUH2nj5MEFFj2SbfpZvXDUlUmZn0PW8yKHbIy6DgcpTdbDBbum1knkU7U3LvwHKQ+TmnIZGjqLszDJP6RGkQXgNWHN0NtG7iv2Mt3DfCv+gPLaIqKSCaFk7WCgo5A1003MlXUOrSSoneUd1a1Bse0P7HZMi6ZGoRbl5KgF4G16ZqEh1y9tOC1UcMCFbnehN0ubSGK+bKPWXjE8HIVZeOCCXNC5R6tYWeZvsGl/SJajnxo/YvnmpCv/HXnPxNVHEJuXRVfpYFKOb/u34ZBndERU+K2ObewuFjTUYBHb3GqKQarQE+bNzqA1FWQQdbja3ErCeCscDKaW76ZSX160dsVcWVHwROgrmt/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(346002)(39860400002)(366004)(396003)(451199021)(38100700002)(2906002)(83380400001)(6512007)(34206002)(186003)(66476007)(66556008)(54906003)(107886003)(478600001)(4326008)(66946007)(8676002)(6506007)(316002)(6636002)(26005)(1076003)(33656002)(6666004)(86362001)(41300700001)(6486002)(82960400001)(5660300002)(450100002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PHvuJFXtjSBqZWJH4Q4GA9LN2oS68vOATheorJA8grBh24oJrwaMtASTt5rO?=
 =?us-ascii?Q?Pq0Nhtod49mrCpdLKZuvgazu9nTnimVaZIIo6PDhZD3IK8u35lC28coPFKbP?=
 =?us-ascii?Q?JLF2hX0jrJsTjbb8ELJGKqZIijV+0QgBMTNOxHNHlNgz87ZoclXS+lkecq+b?=
 =?us-ascii?Q?Gdr7YOc8TjnuGEfc7/2WUBhtxP6DQfq8k58J3wXS3nEuJed3I+ZHa9J+Demu?=
 =?us-ascii?Q?G5A48rbK1jVmYlazkyCS4BCr5tcmnBSTo4R5VT1NIR2Vm64sa3ilZJi1NOcy?=
 =?us-ascii?Q?IYraI8YhjpCfP7a57B3yVmqrm5VGyw6kJIxa5Q0aa4iSwgCcnkVLDVcYEkYs?=
 =?us-ascii?Q?XymrKVjOG3VS3ORJ9yaGfvDm65gPDQPg49vzz7tKGw1PGn0CQ65gWjB9euIP?=
 =?us-ascii?Q?TNObP/Am78fphqGmhs/HAKDTgCkQBidQlcwyl4u5sD+vtFeQcDAmRVXtYmfu?=
 =?us-ascii?Q?B3jvIiMMRrTkLjxuTW+XYp4yNC3FlV3/J4SkWM18s4T7L2/HFcAgVZQs9s7A?=
 =?us-ascii?Q?hSi82pl2Rt41VrJ7e0m0uX0t/noDlIP2rLBGsJWjzuaSAIOOrJMl1DD8Ie3E?=
 =?us-ascii?Q?Van3+q02665t/4t8VAYiRmK48ikOQ7B1vREITsYPeVWkAxbYKV7yq//w4q/b?=
 =?us-ascii?Q?uX6rheN/Y++j61gIkj8WWwATYTq7gyEK4Zjy7ofi6wtBpvgBfHfotLaYtBBY?=
 =?us-ascii?Q?603edrlmzfg/rmxyUoXM5ez+jd/SNpE4IzIy+oRJyz4KmWcPiYvwXeqkwIj/?=
 =?us-ascii?Q?aZh90p4KlX/UlydO97nb7Mnh7IU3oygrMGaupNlk7iIArwQK3HxTqd5HHN1d?=
 =?us-ascii?Q?8A/Z9koEgsDAAVOqlTsN1gehJmc0kY+f2IM/I5Q7UtUCrpW93D94cPdD9AUw?=
 =?us-ascii?Q?K7Qvb+NgRoKbgOYEolN74vgTvJIwS9W/Dyja4ujTCAUSHTlv1wkROMeeuoiY?=
 =?us-ascii?Q?wfs9kluHcymHEOcP1NIPyCcmGcLMLfgMwbf3j++LQD0tyfxK0eF9pD+ZTCaS?=
 =?us-ascii?Q?4Tzi3PWhQwq6cMEUy1iTxQTcuc6ynJaJeY+evQP42UMy2CRQDoZURRvefl4z?=
 =?us-ascii?Q?vhV/BtYAd6NSsbWJWlrxesmzcxyZeTEwa8tEEB6ewsk1rM/Hh49SfWeF61bL?=
 =?us-ascii?Q?hOkOYst6i9SeTO8+RMjKLVjZxSi4qSGXse6lPT/qsG2ckpI+ZVLu+dZRrQ10?=
 =?us-ascii?Q?+vFVQxurK8XyCrwOz6cz4E7X73sUqq8Go8HtnDhLvm3l8UvhAe0tVx6Z1dsU?=
 =?us-ascii?Q?pnhFehug9iyJcZHWhwtsT5ITmjueXDe71MBAgyw7VzdKbggzOoJ2HMKQ57tl?=
 =?us-ascii?Q?qrToOd641i7pCIYhcMpA8R9fcSsO4zRP0nJdefsjX2OdRnOeUQlANErGE0WH?=
 =?us-ascii?Q?V9jYlAc3HeltDtl+DME2MR/A5f/d2TMo1VZ7YCFc8UHGDGz4X2t7re/7CxUE?=
 =?us-ascii?Q?G6jIs/tqekg4lrUtd01Bud34V/38/8n29LTdA3FdL/O2yrTS7DIDuLZd8mXU?=
 =?us-ascii?Q?Ez9xyLrKFK9k8LGKEZZno8f2x8jdyy2KHQWZ15AzLq9Nle3GO7hmilTkCnBA?=
 =?us-ascii?Q?6FAfXpZNfNqp48e7RtBmatwy2/Rw79WMF3oW7XdwgGfS/lufytZD/jtKrLUY?=
 =?us-ascii?Q?SA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f41f8e74-b78f-426a-be85-08db34a45396
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 00:34:18.7649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5hO4giD8+kGR7vD8zZVw0YT55BULl5tDhae9XSpRq6UuEQ9KgGBxWqhQ4O8K/B1I1W59pQjew6RlX6uTTFatYZkSlCs1J+5FV8pKQcyn9jg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4769
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
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Intel-GFX@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, DRI-Devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 03, 2023 at 02:33:34PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> A pair of pre-Gen12 registers were being included in the Gen12 capture
> list. GuC was rejecting those as being invalid and logging errors
> about them. So, stop doing it.

Looks like these registers existed from gen8-gen11.  With this change,
it looks like they also won't be included in the GuC error capture for
gen11 (ICL and EHL/JSL) since those platforms return xe_lpd_lists [1]
rather than default_lists; do we care about that?  I assume not (since
those platforms don't use GuC submission unless you force it with the
enable_guc modparam and taint your kernel), but I figured I should point
it out.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


[1] Why is the main list we use called xe_lpd (i.e., the name of ADL-P's
    display IP)?  It doesn't seem like we're doing anything with display
    registers here so using display IP naming seems really confusing.


Matt

> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Fixes: dce2bd542337 ("drm/i915/guc: Add Gen9 registers for GuC error state capture.")
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
> index cf49188db6a6e..e0e793167d61b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
> @@ -31,12 +31,14 @@
>  	{ FORCEWAKE_MT,             0,      0, "FORCEWAKE" }
>  
>  #define COMMON_GEN9BASE_GLOBAL \
> -	{ GEN8_FAULT_TLB_DATA0,     0,      0, "GEN8_FAULT_TLB_DATA0" }, \
> -	{ GEN8_FAULT_TLB_DATA1,     0,      0, "GEN8_FAULT_TLB_DATA1" }, \
>  	{ ERROR_GEN6,               0,      0, "ERROR_GEN6" }, \
>  	{ DONE_REG,                 0,      0, "DONE_REG" }, \
>  	{ HSW_GTT_CACHE_EN,         0,      0, "HSW_GTT_CACHE_EN" }
>  
> +#define GEN9_GLOBAL \
> +	{ GEN8_FAULT_TLB_DATA0,     0,      0, "GEN8_FAULT_TLB_DATA0" }, \
> +	{ GEN8_FAULT_TLB_DATA1,     0,      0, "GEN8_FAULT_TLB_DATA1" }
> +
>  #define COMMON_GEN12BASE_GLOBAL \
>  	{ GEN12_FAULT_TLB_DATA0,    0,      0, "GEN12_FAULT_TLB_DATA0" }, \
>  	{ GEN12_FAULT_TLB_DATA1,    0,      0, "GEN12_FAULT_TLB_DATA1" }, \
> @@ -142,6 +144,7 @@ static const struct __guc_mmio_reg_descr xe_lpd_gsc_inst_regs[] = {
>  static const struct __guc_mmio_reg_descr default_global_regs[] = {
>  	COMMON_BASE_GLOBAL,
>  	COMMON_GEN9BASE_GLOBAL,
> +	GEN9_GLOBAL,
>  };
>  
>  static const struct __guc_mmio_reg_descr default_rc_class_regs[] = {
> -- 
> 2.39.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
