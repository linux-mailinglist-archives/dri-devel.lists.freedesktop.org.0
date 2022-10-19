Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 620B1603FA2
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 11:33:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3222210F1CA;
	Wed, 19 Oct 2022 09:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F16F810F1C8;
 Wed, 19 Oct 2022 09:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666172000; x=1697708000;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=D0nngEXSJO/vZwez3cEg2JWEjlCs6J6WE1zG27+0OTg=;
 b=jR0Dc9pmtDs6hJIO3SmAPaZNVC1wT+47QBrLK7TLYSi8Tmw8m0ROCnCo
 d0ZfASuUWlv96LT/DkYqknz7+f90avnw+Zln3CUfCVx5UFKcOj03u0fL6
 zNF6DnFvoMUyt0n6BGTqbii+ayoVVEMe0jAGTN2dC9z1bIwduHYjyUZfJ
 GK1jipkAsllko15dk0I0Urn8HdRFLOB5ZffTlIZa9qcsqJqW8Fg06uD01
 /breylcZ+d3jLwHzZXmrH3p4lRG0KBE9iAXwZrqpV3wm+zuUDbuAuMwYa
 Gzq+flX+QpErOd7bNN/srCVhfbFEaB9IKkuPxGoFEnPFJzCOJBtZKgAgD A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="286751473"
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; d="scan'208";a="286751473"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 02:33:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="771691674"
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; d="scan'208";a="771691674"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 19 Oct 2022 02:33:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 02:33:18 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 02:32:22 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 19 Oct 2022 02:32:22 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 19 Oct 2022 02:31:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O2XBM/NSoHPZBmutHuidmd/bQS+ClaFMU/VHlmkz7vx/6yt9gNSKPraEN3nEueZUh0LlfWU1GEFE/ONgYqTYxLVb3oLb19o/zNyG03u00x+HUktDPSZFpBYYlfSsqCEhTt6G3G4o4Tbf3QbI5U+6URQmUIs8tigBH9XfCvQc7LGRQst+Lbuf3xngCgJ4QPLBK/vTpO/DXSNvFomKAmRMiJoILXBNOvOU34cJTOoTJrVxg9X5Lu0qnuV0jE32bLSh6SU8u/JTs5cgBQkdErZpa/9lGKdfCOonBmJ+l/4m7VCCOULcYbJfhFM7uNk+Tci7xyxBMLa8sYkYx2aqAVTRwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VGZmKrPGqWs2iwc+BoUOmUXlgDhBv/OilX0LHjSoRi8=;
 b=MjznscVwhOayN/BdnSbIP1PJAPoDmqueMJdH2UVek11OzCaUjVuaP+ir8axd3OPWuxOI0yi09F2CvPeuMoIz7EKn+gaQdm4+8jOCQ1gYUQLFXU3edJHfnRNmL9ZqA8Os3uTpbtdOtM8aW7fadrOEvYOHIQIRZrL82N1j6VJ1LUbqAgMDmEL2UgBRWR3DPH6baJekcNUaDLYTGOeHtOBlP1Ft1Zukgj2bvbw+JWgw1CDc6DWvwUQEyGFSBmB41RVlgaqJkn/yg48D72DPjeE2AoS3uwLo6OXHMOj8fTPtmS42M/TAD1I32aLdE+IkBmlVTcHetubtlG8HQEVYcQa7Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by CY8PR11MB7361.namprd11.prod.outlook.com (2603:10b6:930:84::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Wed, 19 Oct
 2022 09:31:28 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::7e63:f1cd:99ec:3e3c]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::7e63:f1cd:99ec:3e3c%4]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 09:31:28 +0000
Message-ID: <be92a7ea-78c7-e1e2-c6a1-a19c8d5a0229@intel.com>
Date: Wed, 19 Oct 2022 15:01:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.3
Subject: Re: [PATCH v2 1/7] drm/i915/huc: only load HuC on GTs that have VCS
 engines
Content-Language: en-US
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20221013000332.1738078-1-daniele.ceraolospurio@intel.com>
 <20221013000332.1738078-2-daniele.ceraolospurio@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20221013000332.1738078-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0190.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::15) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|CY8PR11MB7361:EE_
X-MS-Office365-Filtering-Correlation-Id: c4162d94-2b2d-48e8-671c-08dab1b4b2fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AuInobpsVXpYR4fwc1RgwfZRxXJYrkkyMG27/aCz2ge1huYLAqCg1PFN00VDJCQGbUmPwVeTwmUh8Jz7riMp6+kr+/a1IP1xPzc5WCVf5/MhNQImFPlmCcnzH/SP5JPkccrb1TkOyRHaP3+rVNSFm7uJdM84KDSo5MVGC7GqgVtGxSkzBsTb4QHazSgO/20fOaMtx0Oy17rZxSYuPEuisXXPLiZ0TR5xxSl/1d+fUugXZmuGRmk2/lXkGk7MRyk1FF1orzHzxNXV4IQ/AkBjfMEJTL/JJ9zrK9QTEgPu1rlKLVtB98++6yXLATLKk62gY+OurEZBLHdJWzZ1rk4lb0AKTZc1wTXt2jsFZyFhXifJpQkotuE0kOiPbjau2ndbhR7roVFRFnBxiqPKQhOHm8tUZm9Kt4DcBAxqsjTHyguFpJW38q2Y13Oc0HLU57PpfHTfh6mHENFfASg74MaXQyLV8YYefFCjYu9ULWYvjAOVpcWLGljLseyYfcniyxHtF8zlqiJ+9QBGdy7lzhmytxN0bujCzrYJnHvfnyHxcG9jvb4/yPqatp7ojDafW88eEgMAmTj0HUA/kIvqhQvJGmD0fwkqqQOkAX5xSqhw2M4V0eSzOWCM1UDozoT+Gzzvprip144uPIV7bOc3B1q/OAXNtg1N/BSa/S+y0vAQkaVedHJg33VtVeSIJeid8WmKXMWnolGN7W7BZT4IM4GypIVwEWDQsqcErjasH1bj42dMZj+DPv3GSPap9AK4HvQsrzXQlButDD1cwjC3Hq9jQQbTwL66w+GdaAIW77Frew4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199015)(86362001)(54906003)(8676002)(4326008)(66946007)(66476007)(66556008)(26005)(31696002)(83380400001)(41300700001)(6506007)(6512007)(36756003)(53546011)(5660300002)(316002)(8936002)(6666004)(38100700002)(31686004)(6486002)(82960400001)(186003)(2906002)(478600001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjczL21FWDVXTnZoOTJVZWJobFEreUh2QmlJd0FNZ2JZNnBVSFhkaFR2djl4?=
 =?utf-8?B?NDZ2bUg4UGpKVi8ySkhOYlQ3MjUwYjVZV3M1WDIzNW1mRUl4V2JudmY1RWJU?=
 =?utf-8?B?Q1NCUEhHVWZVTEpSUW9hU1R1MlFpSEVpZ0JXT0JYdFJRSGo2cVUwOTN1Z0I1?=
 =?utf-8?B?YXR3SmNBeHowVldaYUdaa3pCZ2Z3TyttS3JocXVCTlBlelFDZExXTWs2Z2NI?=
 =?utf-8?B?d05IaVlHVGZOQmpPQmtXanMwdDBENGdHVDdWbGdTZE4yOXl4eWZSUlZONXdR?=
 =?utf-8?B?YjJuN1FMNUZiL05zN0RjYlV3alcxWkVWdTlpTFdweEFjdHJYcTBBOE1hbGNO?=
 =?utf-8?B?MEhQZHJFWGlxZVdpd1ZUbkgvRzhucWpKUFovVmNWem5iejlmWUVhT2dSOGE0?=
 =?utf-8?B?RGM5L29yemJxYmtPT08zZFQ5a0ZpZTNDTllGY0hDUzVQM0J2N0ZGZnFQNnNt?=
 =?utf-8?B?enlabGZDRzRnVUhNS2RqWjdUODdCU0p3QU5oZGJGMTg1YlVnOGg5QjFOQU5X?=
 =?utf-8?B?Ri9YVmRyTDZIZ3d6WmVsbjhQTXU5c2x6dWxPUWM0R1FScXlucWlnQk9ycnBi?=
 =?utf-8?B?Vmc4d3ZDeWhmMGNMNFlpYXBrNzlSNWJ6aVpTYkNvUmpSc3ZVVzFRTlFMY3Fu?=
 =?utf-8?B?aTcvMitHMmpMSkQ1OTRqTTE5ZG4yaGNDVVRDTm9uemNJRTNKTlZBck1yT0dH?=
 =?utf-8?B?a2ZRaDRRcjVmREpTQUI5U0lXMllESnY4cG1CcDdxazBJWi9jUHlKeDg5bzQr?=
 =?utf-8?B?eE5XbVBUeXhhWThwQVpSRTJ3M3JWTWlrYlI3VHBSTGNDVkx4NkdIK3RoRG1o?=
 =?utf-8?B?UzN1RUtEVitwOFNUM2N0SG10Q284aDg5VjVYOXBZWVFVVElQK1A5d0ROMkhw?=
 =?utf-8?B?V1hYNWtPN2dRbXQ5YWZvMXQ5QkZHNWwwYys0V0g1M21DaHFoYmE4c01KMHQy?=
 =?utf-8?B?c09BNGNmVllZWGsvY2ZPODl3NGdFVG9WYllpT0dvOUNSeE9YbU16N0VNNjJr?=
 =?utf-8?B?Ull5MUpUTWh0NXBvOGY0WGl0UVc5aWVQQzR4c1pnK2VWUURvUDE3ay9MaEcr?=
 =?utf-8?B?ZTBKUUpLNlhYVThDSGt2bzhxR1JJMlJCRlFLa1VRMjl5TGtlQi9WblZPaWQz?=
 =?utf-8?B?dTNpM3ZXOGp1WmRxNGJYVm1qVXhnU1grYTJiZ0JMYnViTjFYUXZqdWcxOVZa?=
 =?utf-8?B?RjRjZjVGRlMyUWxIT3lwVGlLc1Bub3RiWnJoZFRxYVRWM2hHUXlaczhwc0Rr?=
 =?utf-8?B?N0lta1FYYnJJa3JFS3UzYk9ndm1CeXpFWmkyQ3ljaDJHRTNxZjJmSS9iczFl?=
 =?utf-8?B?bTNHM29mL0JLUWtHeFprOVdjd1dYRXBpU1d3VlFVTnZDK1V2MlJuVzRLaU1v?=
 =?utf-8?B?TzRmWWYySzRxVEV3U0l2Z3FJZzBKaHpqWFpXaXd4YjlaaVNDRXI1MGFLRmNC?=
 =?utf-8?B?NHFNeDRsUWpXTDBIalVsMStqVW9iSHc1WjA4K2h6K3N5cW9Mc3RuUTl5aml1?=
 =?utf-8?B?YS9GOGIrUnU0eCtxcWRJc2NhemVxdFduenQ1c2t2eitUNDk4NEpRYmV4aVBJ?=
 =?utf-8?B?ZklQRXFwTEc3L2pPSlJCV2hpWlRDUFBNeE1MSitWVENvRkg4Qk43UTQ2bEly?=
 =?utf-8?B?K2xycUZkWmsxdTEwZFJIZmxXUm95K3llWGUxeFE0dUtyeXg1dnpycDEzZHdv?=
 =?utf-8?B?enZkeEFTeUJCMC91TVFKNzM5WlVIZTNSYXdsQlVCSWw0U2FqN1hnUG5CeFhS?=
 =?utf-8?B?TGJ0QUZyVmtMc2FvN3IxMC9KOEQrSmZRLys3dzEyL0hoZEdJRFB1S1lIRDBN?=
 =?utf-8?B?Z2Jjei8vSmxtNXdZYVJub1hlM1pxS1A4MlB1L0JFS1RoN3JnREs5eUltaU5E?=
 =?utf-8?B?YWdTRDYxYVpoMExXcy82NTYvNTFicDk0TEVPM0o2Ty9FUWh2d0pZRlNKWW1m?=
 =?utf-8?B?OC9lK3c1UmxRYUhkaDFieWJWMzRmaFlHR1hTdG10SFNCZ2ZVOENKTUsvdnNx?=
 =?utf-8?B?ck1EMHVWbGt4L2NhVXExUlJ5ZXhqNlhISTVtOSt4bEpTRkJTRithbHJ0Tjgy?=
 =?utf-8?B?TC95Q0hHUHpqVkVNUUtDNWoxeEl0UDFjZGd1OXc4amVjZWg2RTQ2K3NJOWhZ?=
 =?utf-8?B?UldnZ2wxelI4M3BMU1hMUUhJSEg1aXhCOEdsY3BqbVZwYTQ4VHdpRS9aS0V6?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4162d94-2b2d-48e8-671c-08dab1b4b2fa
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 09:31:28.5248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XOqFD9W+ckBRWQqrxMAEkHG/R7soODMonx/gn9Zgc1xso/EQYszj9g52z/crHhbLkEcf/e9NjvWucCYTvfXa71blHzPhySVrjUoWkdifOP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7361
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 John Harrison <john.c.harrison@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 13-10-2022 05:33, Daniele Ceraolo Spurio wrote:
> On MTL the primary GT doesn't have any media capabilities, so no video
> engines and no HuC. We must therefore skip the HuC fetch and load on
> that specific case. Given that other multi-GT platforms might have HuC
> on the primary GT, we can't just check for that and it is easier to
> instead check for the lack of VCS engines.
> 
> Based on code from Aravind Iddamsetty
> 
> v2: clarify which engine_mask is used for each GT and why (Tvrtko)
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com> #v1
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_huc.c | 29 ++++++++++++++++++++++++++
>  drivers/gpu/drm/i915/i915_drv.h        |  9 +++++---
>  2 files changed, 35 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index 4d1cc383b681..ca170ea3426c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -203,12 +203,41 @@ void intel_huc_unregister_gsc_notifier(struct intel_huc *huc, struct bus_type *b
>  	huc->delayed_load.nb.notifier_call = NULL;
>  }
>  
> +static bool vcs_supported(struct intel_gt *gt)
> +{
> +	intel_engine_mask_t mask = gt->info.engine_mask;
> +
> +	/*
> +	 * We reach here from i915_driver_early_probe for the primary GT before
> +	 * its engine mask is set, so we use the device info engine mask for it;
> +	 * this means we're not taking VCS fusing into account, but if the
> +	 * primary GT supports VCS engines we expect at least one of them to
> +	 * remain unfused so we're fine.
> +	 * For other GTs we expect the GT-specific mask to be set before we
> +	 * call this function.
> +	 */
Comment sounds good to me. as the rest of the change is same as v1, You
can have my r-b for this.

Thanks,
Aravind.
> +	GEM_BUG_ON(!gt_is_root(gt) && !gt->info.engine_mask);
> +
> +	if (gt_is_root(gt))
> +		mask = RUNTIME_INFO(gt->i915)->platform_engine_mask;
> +	else
> +		mask = gt->info.engine_mask;
> +
> +	return __ENGINE_INSTANCES_MASK(mask, VCS0, I915_MAX_VCS);
> +}
> +
>  void intel_huc_init_early(struct intel_huc *huc)
>  {
>  	struct drm_i915_private *i915 = huc_to_gt(huc)->i915;
> +	struct intel_gt *gt = huc_to_gt(huc);
>  
>  	intel_uc_fw_init_early(&huc->fw, INTEL_UC_FW_TYPE_HUC);
>  
> +	if (!vcs_supported(gt)) {
> +		intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_NOT_SUPPORTED);
> +		return;
> +	}
> +
>  	if (GRAPHICS_VER(i915) >= 11) {
>  		huc->status.reg = GEN11_HUC_KERNEL_LOAD_INFO;
>  		huc->status.mask = HUC_LOAD_SUCCESSFUL;
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 90ed8e6db2fe..90a347140e90 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -776,12 +776,15 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>  #define __HAS_ENGINE(engine_mask, id) ((engine_mask) & BIT(id))
>  #define HAS_ENGINE(gt, id) __HAS_ENGINE((gt)->info.engine_mask, id)
>  
> -#define ENGINE_INSTANCES_MASK(gt, first, count) ({		\
> +#define __ENGINE_INSTANCES_MASK(mask, first, count) ({			\
>  	unsigned int first__ = (first);					\
>  	unsigned int count__ = (count);					\
> -	((gt)->info.engine_mask &						\
> -	 GENMASK(first__ + count__ - 1, first__)) >> first__;		\
> +	((mask) & GENMASK(first__ + count__ - 1, first__)) >> first__;	\
>  })
> +
> +#define ENGINE_INSTANCES_MASK(gt, first, count) \
> +	__ENGINE_INSTANCES_MASK((gt)->info.engine_mask, first, count)
> +
>  #define RCS_MASK(gt) \
>  	ENGINE_INSTANCES_MASK(gt, RCS0, I915_MAX_RCS)
>  #define BCS_MASK(gt) \
