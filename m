Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF293D03FA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 23:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD21D6E17B;
	Tue, 20 Jul 2021 21:41:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B5F89F99;
 Tue, 20 Jul 2021 21:41:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="296893151"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="296893151"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 14:41:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="657704884"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga006.fm.intel.com with ESMTP; 20 Jul 2021 14:41:48 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 20 Jul 2021 14:41:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 20 Jul 2021 14:41:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 20 Jul 2021 14:41:45 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 20 Jul 2021 14:41:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIHQi/ovKMGbQqeXHS/PUuvikvtzZClmWNJZ4HOUrU9z/g8IUo0H/Xd+7/qRMqleJDxdGe/ScNi4/CPGMPX4DAnUt2L6qN2AVc6jSMgFlsDsLltlCVdzwf/si47lR6Ic4DRYbojkWWtHKuA5fuhrEyOFRxc2ADZTHDRyCTBOA47pCN/r8vAtTJ/iptoxs8TIuPcOEctETdVcmABpPqTDoPc3WA+00SVQbRZa26cJ3GAz1nSnf7OqcByXAkmLB0n7K9mjnieNa66EWlau5c/fV4klizV1mhHrNAkEDrlnp4mwExCyIPpPiPrDxixEsuWx6G5yLkuzHAkG4xa6Cb07Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtI9TjX4MXjCBCY0QIQ+yuFITE1KyTrYmQtUbrj6N14=;
 b=hHKXaRKrd8KJJqZ4fqF2qm6QtQcMLnRwMUVPJZWKg4+G4h/fS65lrTMUOUO5iQguxHVIjKTEsVF0JmN6gKyO6MaOCdzfif0Cj2ygJM90wdgM3bC3rriIvc9VUrjdtaHj8zWNz4x40jpXGvhJbrOuxGt5yf9NysyHGfh2O4pQyytGNA0kLsY6fCrh64ZRccHFZOJSphM7AZPORINUtMLrVc/UMerj2eYZ1ht+P1ugS43rRwgZUxuNDaZAnDZntGsB64zxaQo9Xtwbkwm4trQ5nn6yc4ze41pyTR+d61xduknl+/ytPIgjrEgHK01UVvDrGCsklHky8O8HtSTxhdsYDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtI9TjX4MXjCBCY0QIQ+yuFITE1KyTrYmQtUbrj6N14=;
 b=r+ulqKdCwi1RzMo+lbk99bkYz4M9px0NCgoCH0Ff6ikt9TVAu0M/iRo9m6cwzeHmq/GOb/oUBvr7u6rvK2mctCdpOlffKF0OCK0KrKUZ0bTmEw0MOFWHRzxnNPg1jdKOBARTL/Eqn16kOuwNDRPdXgCckFR6kpttRx92snxH51g=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5627.namprd11.prod.outlook.com (2603:10b6:510:e4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Tue, 20 Jul
 2021 21:41:25 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4%8]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 21:41:25 +0000
Subject: Re: [PATCH 42/51] drm/i915/guc: Implement banned contexts for GuC
 submission
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210716201724.54804-1-matthew.brost@intel.com>
 <20210716201724.54804-43-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <33d96446-e654-7ce0-eccd-94142998c505@intel.com>
Date: Tue, 20 Jul 2021 14:41:23 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210716201724.54804-43-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: SJ0PR03CA0044.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::19) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 SJ0PR03CA0044.namprd03.prod.outlook.com (2603:10b6:a03:33e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Tue, 20 Jul 2021 21:41:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98b1f3e5-9ec3-443d-ad27-08d94bc71fe3
X-MS-TrafficTypeDiagnostic: PH0PR11MB5627:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB56273FEA131E757A283FD7CBBDE29@PH0PR11MB5627.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:113;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JfjwjhHRAo/tXHufQEV27RnWIgu47695emmmAVPQnLfJ9UGQ0gGrhAC8kchDKNgC3k0Ct2VEQYex2pOH23+cT3nmv9QIYqcuM6qbfDlYTR3Q4vWWy6Ue6vrfT8l6OQjVnZEmAncm1C6O9pZ6QPyYB9G5iAOfcBW5x6xTB8C2CI7g+fbPtm2NNMG+OsUL+GY4FAQKQ6em7kMj2EsD4Vwrv8BMxl8Wppv2E5sskbmyPwYfXXvt6ZmVynxJzOL7zom66ZrTOcJxosDBVCJGLvn/lC//n1u2zILYH1usQbX7wmAXxkLf6oEsNoi7ccgrQvXEns5/wawij+Jo8lvEyykQBomxS97kE5DYajHAewYJLwTijRZMmCciUs2GRCY46ivI7S7qhmiJkFXnxxv/9dBTLQito3spivxEJrkuOY0y5xiqDBCv7Z6soccYZYq1Sxa/YaBtqMhsnFTY7bqefKUI2ZPmMflOF6i1DomUqd45aiKSb5qzykJYcrFE3EyWd3kIaoCZhHHyvlBII740my/SxcrRtnGNBrUvGQzNFbumuHmv2gcAWnKZlS7USLxGJSh2Ez1ESon85V/ejZXRq/noRBkYY9L/lu4hL6IUTISsP7+xJJIJohHQ8AekAtq3Qgfb3PeT7YL9vkhn97nMaEEu3EpDaXIuaUqfqb5E6/Qj0lLJYEaZ2bLJoNfO2BIcU99NUmGkVrT3SnlTDqe6dWhfrGc8evELRsH7wrlP8t74vbnqZM9vEkZPeYuouF5C6TnK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(396003)(366004)(39860400002)(2616005)(8936002)(107886003)(53546011)(83380400001)(26005)(66946007)(86362001)(5660300002)(66556008)(2906002)(31696002)(4326008)(36756003)(956004)(66476007)(30864003)(16576012)(38100700002)(8676002)(316002)(31686004)(6486002)(186003)(478600001)(450100002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RThsckRsSUoxdm5ldVV5dTg1eEFRWlQwdkRzQ3JVOVNPVFdUM1NzR2IzWHNm?=
 =?utf-8?B?NmtlcDhueURVNzFPOG9SdGpEZG1KZHRpekhzZ2k4VVFiZWhrMDM1bTdyUkJF?=
 =?utf-8?B?ZUo5NThUbitGV2svakV5UXRCUnF6NEo4ZDZERTROWXhBckY4K2VzSmdLdmpC?=
 =?utf-8?B?Z1hzdjFIZkpEQ2pteGdIbHk2akczOUcxZjFVcTlpYlFPMDVlQWZ1Z3VURWpD?=
 =?utf-8?B?RmNjWnhvL3l2bzMyQ2pudjV4N0VBYUtFcWV3UUFsVlRWek5NZkhJbmpnRVAx?=
 =?utf-8?B?cjFzdkh2SllaMEFmQ0VPTGdIMm0wcGpzbUF3NjIxY29oWGxORWQxcklSZ3lY?=
 =?utf-8?B?YTZCU1M2aUdjb2FocDBmUlNXdlZENkgxMG4yejFjWWRhVUpLK2JPMThRdGdX?=
 =?utf-8?B?NktBTktVZFh4bEh4UStIK1NoWFAybG95NFFOUEVMempxSG54S1JmVDZRdzFZ?=
 =?utf-8?B?SFpZNUlKM08za0FuWkQ4U0FWTkhEckZPV0pLMWxva0JPWmpLTDBydzdCc0pU?=
 =?utf-8?B?TzNCa1ZrTDJleDExVGNYTEhTQUs5MXVTNU1UWERrVHZwTkFRUGlQbTNidVVC?=
 =?utf-8?B?cU9vVzVwTVNRYkJ2aFc0V2JkR243MnIxc0pKQWExSVVCVU9aaUhnaDJmMXpC?=
 =?utf-8?B?OHNXSnROakt3Y3haa3lqRjBrd2hMeVk0MWdraSsvS3ZQcjYxMVV1c3BldUw3?=
 =?utf-8?B?Yy9kOTB1RVZCS0owS042ZkdsTXZGOStDZ1grV24xdVAxUmhmVkdBMDg4SmN3?=
 =?utf-8?B?anZNanViTnJjMUtDUlBsVXJEV2MyT3RoMngvb0lvYkdtbmZMQmtHZlVza2JM?=
 =?utf-8?B?ak5kM3JhWU1ZUGhLWFFMYVBmdVN4eWgwSWNzUTBDcExTU1NIWlJrUytJZHZ1?=
 =?utf-8?B?b1dGV0hIM2pqazNkNVQwNHkvMzFkTHFaUEdlSzhsNURIZmdhbFB4YVhIKzV4?=
 =?utf-8?B?cmloMk0venRkYm5yaEdkV25aa1F3NTRSMWtsRDhYNEZWUmxNd0w4aXkyTmcv?=
 =?utf-8?B?Rm5uYmxPWFJzT0p5Ti9SOUd4RDIyNnE2dE1qRStPS3dVS01GRFVzN1pDVHA1?=
 =?utf-8?B?RER0OXU0bVNqZkxwdC85TG4vRGFNYWVzQWRjdllBY2JWMUkyd3N3VFFyOUdY?=
 =?utf-8?B?c2xhWHFwNUNscFJ5NFk2NlNpVXBJZjNXaytrQUpEV3NDbit6OGNyZHdCTVVx?=
 =?utf-8?B?S1BjaWZZQTBDQ0ZvWEtyQWIzN2VkTGJ4Zlo2V0FwNVNCT3VNdVJBLy9BR0R1?=
 =?utf-8?B?a1IrVmJOU0haVVE5emVRbVhkaG9NK2U3ZUVTbHpqMWN4Vyt1bW1uRGZvRlFX?=
 =?utf-8?B?YmJtZTRRNFRGUzZkWmYrekZhMm1vMDRJWDJJZFJvVmR5eXY1Mno5TlV2aFpN?=
 =?utf-8?B?Y1JBSHloTmJpUWVZSHNOYjZ1UzNIVExDcDR3dFd4djVFYmNSaWo0UjZ3L1lE?=
 =?utf-8?B?azAyQllGcEdBVHRHZCtLTEE3WXdYWnNwL1VDUmhubVpDUmxudVhVNGFzSUNs?=
 =?utf-8?B?ZWN1VStpYm9hRkxkRVM3S1NuNXhjTkNaS3dTSmVtWGZ0L0hGNTYwY3R0dWhK?=
 =?utf-8?B?ZUJ5RWJ5Z0o5RTVVd0NlVUlhSnJaeDZCNGR3QldDMDAyK2JvTFF0MmJ3SE9n?=
 =?utf-8?B?aGROVHkwNXhwT1pyaTFLSFhxODlmVWxnS3lCZGI3aGU3eGlWZkFPR0MyUHBv?=
 =?utf-8?B?QStwc3N0OEpMZGdXQnFTeUNBVDFSVDY4YmFpM1JXNGRlcXVpZDV6OEhvUzMw?=
 =?utf-8?Q?1Q+TqlEvE7Pzqw8HIQUh9kx+TXnCXiObsnXru7x?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b1f3e5-9ec3-443d-ad27-08d94bc71fe3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 21:41:25.6400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nfR8g7CupjOszs/zhTVOYUi2f6AOKnNdo6z3ABioNPngluFwa3SJOgVFYDuJi+seSPS+YsVOaPLz692KZQtwNscifYIIA7oBH3/1CKC2Ycg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5627
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
Cc: daniele.ceraolospurio@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/16/2021 13:17, Matthew Brost wrote:
> When using GuC submission, if a context gets banned disable scheduling
> and mark all inflight requests as complete.
>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c   |   2 +-
>   drivers/gpu/drm/i915/gt/intel_context.h       |  13 ++
>   drivers/gpu/drm/i915/gt/intel_context_types.h |   2 +
>   drivers/gpu/drm/i915/gt/intel_reset.c         |  32 +---
>   .../gpu/drm/i915/gt/intel_ring_submission.c   |  20 +++
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   2 +
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 151 ++++++++++++++++--
>   drivers/gpu/drm/i915/i915_trace.h             |  10 ++
>   8 files changed, 195 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 28c62f7ccfc7..d87a4c6da5bc 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -1084,7 +1084,7 @@ static void kill_engines(struct i915_gem_engines *engines, bool ban)
>   	for_each_gem_engine(ce, engines, it) {
>   		struct intel_engine_cs *engine;
>   
> -		if (ban && intel_context_set_banned(ce))
> +		if (ban && intel_context_ban(ce, NULL))
>   			continue;
>   
>   		/*
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> index 2ed9bf5f91a5..814d9277096a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> @@ -16,6 +16,7 @@
>   #include "intel_engine_types.h"
>   #include "intel_ring_types.h"
>   #include "intel_timeline_types.h"
> +#include "i915_trace.h"
>   
>   #define CE_TRACE(ce, fmt, ...) do {					\
>   	const struct intel_context *ce__ = (ce);			\
> @@ -243,6 +244,18 @@ static inline bool intel_context_set_banned(struct intel_context *ce)
>   	return test_and_set_bit(CONTEXT_BANNED, &ce->flags);
>   }
>   
> +static inline bool intel_context_ban(struct intel_context *ce,
> +				     struct i915_request *rq)
> +{
> +	bool ret = intel_context_set_banned(ce);
> +
> +	trace_intel_context_ban(ce);
> +	if (ce->ops->ban)
> +		ce->ops->ban(ce, rq);
> +
> +	return ret;
> +}
> +
>   static inline bool
>   intel_context_force_single_submission(const struct intel_context *ce)
>   {
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 035108c10b2c..57c19ee3e313 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -35,6 +35,8 @@ struct intel_context_ops {
>   
>   	int (*alloc)(struct intel_context *ce);
>   
> +	void (*ban)(struct intel_context *ce, struct i915_request *rq);
> +
>   	int (*pre_pin)(struct intel_context *ce, struct i915_gem_ww_ctx *ww, void **vaddr);
>   	int (*pin)(struct intel_context *ce, void *vaddr);
>   	void (*unpin)(struct intel_context *ce);
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index f3cdbf4ba5c8..3ed694cab5af 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -22,7 +22,6 @@
>   #include "intel_reset.h"
>   
>   #include "uc/intel_guc.h"
> -#include "uc/intel_guc_submission.h"
>   
>   #define RESET_MAX_RETRIES 3
>   
> @@ -39,21 +38,6 @@ static void rmw_clear_fw(struct intel_uncore *uncore, i915_reg_t reg, u32 clr)
>   	intel_uncore_rmw_fw(uncore, reg, clr, 0);
>   }
>   
> -static void skip_context(struct i915_request *rq)
> -{
> -	struct intel_context *hung_ctx = rq->context;
> -
> -	list_for_each_entry_from_rcu(rq, &hung_ctx->timeline->requests, link) {
> -		if (!i915_request_is_active(rq))
> -			return;
> -
> -		if (rq->context == hung_ctx) {
> -			i915_request_set_error_once(rq, -EIO);
> -			__i915_request_skip(rq);
> -		}
> -	}
> -}
> -
>   static void client_mark_guilty(struct i915_gem_context *ctx, bool banned)
>   {
>   	struct drm_i915_file_private *file_priv = ctx->file_priv;
> @@ -88,10 +72,8 @@ static bool mark_guilty(struct i915_request *rq)
>   	bool banned;
>   	int i;
>   
> -	if (intel_context_is_closed(rq->context)) {
> -		intel_context_set_banned(rq->context);
> +	if (intel_context_is_closed(rq->context))
>   		return true;
> -	}
>   
>   	rcu_read_lock();
>   	ctx = rcu_dereference(rq->context->gem_context);
> @@ -123,11 +105,9 @@ static bool mark_guilty(struct i915_request *rq)
>   	banned = !i915_gem_context_is_recoverable(ctx);
>   	if (time_before(jiffies, prev_hang + CONTEXT_FAST_HANG_JIFFIES))
>   		banned = true;
> -	if (banned) {
> +	if (banned)
>   		drm_dbg(&ctx->i915->drm, "context %s: guilty %d, banned\n",
>   			ctx->name, atomic_read(&ctx->guilty_count));
> -		intel_context_set_banned(rq->context);
> -	}
>   
>   	client_mark_guilty(ctx, banned);
>   
> @@ -149,6 +129,8 @@ static void mark_innocent(struct i915_request *rq)
>   
>   void __i915_request_reset(struct i915_request *rq, bool guilty)
>   {
> +	bool banned = false;
> +
>   	RQ_TRACE(rq, "guilty? %s\n", yesno(guilty));
>   	GEM_BUG_ON(__i915_request_is_complete(rq));
>   
> @@ -156,13 +138,15 @@ void __i915_request_reset(struct i915_request *rq, bool guilty)
>   	if (guilty) {
>   		i915_request_set_error_once(rq, -EIO);
>   		__i915_request_skip(rq);
> -		if (mark_guilty(rq) && !intel_engine_uses_guc(rq->engine))
> -			skip_context(rq);
> +		banned = mark_guilty(rq);
>   	} else {
>   		i915_request_set_error_once(rq, -EAGAIN);
>   		mark_innocent(rq);
>   	}
>   	rcu_read_unlock();
> +
> +	if (banned)
> +		intel_context_ban(rq->context, rq);
>   }
>   
>   static bool i915_in_reset(struct pci_dev *pdev)
> diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> index 3b1471c50d40..03939be4297e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> @@ -586,9 +586,29 @@ static void ring_context_reset(struct intel_context *ce)
>   	clear_bit(CONTEXT_VALID_BIT, &ce->flags);
>   }
>   
> +static void ring_context_ban(struct intel_context *ce,
> +			     struct i915_request *rq)
> +{
> +	struct intel_engine_cs *engine;
> +
> +	if (!rq || !i915_request_is_active(rq))
> +		return;
> +
> +	engine = rq->engine;
> +	lockdep_assert_held(&engine->sched_engine->lock);
> +	list_for_each_entry_continue(rq, &engine->sched_engine->requests,
> +				     sched.link)
> +		if (rq->context == ce) {
> +			i915_request_set_error_once(rq, -EIO);
> +			__i915_request_skip(rq);
> +		}
> +}
> +
>   static const struct intel_context_ops ring_context_ops = {
>   	.alloc = ring_context_alloc,
>   
> +	.ban = ring_context_ban,
> +
>   	.pre_pin = ring_context_pre_pin,
>   	.pin = ring_context_pin,
>   	.unpin = ring_context_unpin,
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index dc18ac510ac8..eb6062f95d3b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -274,6 +274,8 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine);
>   
>   int intel_guc_global_policies_update(struct intel_guc *guc);
>   
> +void intel_guc_context_ban(struct intel_context *ce, struct i915_request *rq);
> +
>   void intel_guc_submission_reset_prepare(struct intel_guc *guc);
>   void intel_guc_submission_reset(struct intel_guc *guc, bool stalled);
>   void intel_guc_submission_reset_finish(struct intel_guc *guc);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 6536bd6807a0..149990196e3a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -125,6 +125,7 @@ static inline void clr_context_pending_enable(struct intel_context *ce)
>   #define SCHED_STATE_WAIT_FOR_DEREGISTER_TO_REGISTER	BIT(0)
>   #define SCHED_STATE_DESTROYED				BIT(1)
>   #define SCHED_STATE_PENDING_DISABLE			BIT(2)
> +#define SCHED_STATE_BANNED				BIT(3)
>   static inline void init_sched_state(struct intel_context *ce)
>   {
>   	/* Only should be called from guc_lrc_desc_pin() */
> @@ -187,6 +188,23 @@ static inline void clr_context_pending_disable(struct intel_context *ce)
>   		(ce->guc_state.sched_state & ~SCHED_STATE_PENDING_DISABLE);
>   }
>   
> +static inline bool context_banned(struct intel_context *ce)
> +{
> +	return (ce->guc_state.sched_state & SCHED_STATE_BANNED);
> +}
> +
> +static inline void set_context_banned(struct intel_context *ce)
> +{
> +	lockdep_assert_held(&ce->guc_state.lock);
> +	ce->guc_state.sched_state |= SCHED_STATE_BANNED;
> +}
> +
> +static inline void clr_context_banned(struct intel_context *ce)
> +{
> +	lockdep_assert_held(&ce->guc_state.lock);
> +	ce->guc_state.sched_state &= ~SCHED_STATE_BANNED;
> +}
> +
>   static inline bool context_guc_id_invalid(struct intel_context *ce)
>   {
>   	return (ce->guc_id == GUC_INVALID_LRC_ID);
> @@ -356,13 +374,23 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop);
>   
>   static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   {
> -	int err;
> +	int err = 0;
>   	struct intel_context *ce = rq->context;
>   	u32 action[3];
>   	int len = 0;
>   	u32 g2h_len_dw = 0;
>   	bool enabled;
>   
> +	/*
> +	 * Corner case where requests were sitting in the priority list or a
> +	 * request resubmitted after the context was banned.
> +	 */
> +	if (unlikely(intel_context_is_banned(ce))) {
> +		i915_request_put(i915_request_mark_eio(rq));
> +		intel_engine_signal_breadcrumbs(ce->engine);
> +		goto out;
> +	}
> +
>   	GEM_BUG_ON(!atomic_read(&ce->guc_id_ref));
>   	GEM_BUG_ON(context_guc_id_invalid(ce));
>   
> @@ -398,6 +426,8 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   		clr_context_pending_enable(ce);
>   		intel_context_put(ce);
>   	}
> +	if (likely(!err))
> +		trace_i915_request_guc_submit(rq);
>   
>   out:
>   	return err;
> @@ -462,7 +492,6 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
>   			guc->stalled_request = last;
>   			return false;
>   		}
> -		trace_i915_request_guc_submit(last);
>   	}
>   
>   	guc->stalled_request = NULL;
> @@ -501,12 +530,13 @@ static void cs_irq_handler(struct intel_engine_cs *engine, u16 iir)
>   static void __guc_context_destroy(struct intel_context *ce);
>   static void release_guc_id(struct intel_guc *guc, struct intel_context *ce);
>   static void guc_signal_context_fence(struct intel_context *ce);
> +static void guc_cancel_context_requests(struct intel_context *ce);
>   
>   static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
>   {
>   	struct intel_context *ce;
>   	unsigned long index, flags;
> -	bool pending_disable, pending_enable, deregister, destroyed;
> +	bool pending_disable, pending_enable, deregister, destroyed, banned;
>   
>   	xa_for_each(&guc->context_lookup, index, ce) {
>   		/* Flush context */
> @@ -524,6 +554,7 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
>   		pending_enable = context_pending_enable(ce);
>   		pending_disable = context_pending_disable(ce);
>   		deregister = context_wait_for_deregister_to_register(ce);
> +		banned = context_banned(ce);
>   		init_sched_state(ce);
>   
>   		if (pending_enable || destroyed || deregister) {
> @@ -541,6 +572,10 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
>   		/* Not mutualy exclusive with above if statement. */
>   		if (pending_disable) {
>   			guc_signal_context_fence(ce);
> +			if (banned) {
> +				guc_cancel_context_requests(ce);
> +				intel_engine_signal_breadcrumbs(ce->engine);
> +			}
>   			intel_context_sched_disable_unpin(ce);
>   			atomic_dec(&guc->outstanding_submission_g2h);
>   			intel_context_put(ce);
> @@ -659,6 +694,9 @@ static void guc_reset_state(struct intel_context *ce, u32 head, bool scrub)
>   {
>   	struct intel_engine_cs *engine = __context_to_physical_engine(ce);
>   
> +	if (intel_context_is_banned(ce))
> +		return;
> +
>   	GEM_BUG_ON(!intel_context_is_pinned(ce));
>   
>   	/*
> @@ -729,6 +767,8 @@ static void __guc_reset_context(struct intel_context *ce, bool stalled)
>   	struct i915_request *rq;
>   	u32 head;
>   
> +	intel_context_get(ce);
> +
>   	/*
>   	 * GuC will implicitly mark the context as non-schedulable
>   	 * when it sends the reset notification. Make sure our state
> @@ -754,6 +794,7 @@ static void __guc_reset_context(struct intel_context *ce, bool stalled)
>   out_replay:
>   	guc_reset_state(ce, head, stalled);
>   	__unwind_incomplete_requests(ce);
> +	intel_context_put(ce);
>   }
>   
>   void intel_guc_submission_reset(struct intel_guc *guc, bool stalled)
> @@ -936,8 +977,6 @@ static int guc_bypass_tasklet_submit(struct intel_guc *guc,
>   	ret = guc_add_request(guc, rq);
>   	if (ret == -EBUSY)
>   		guc->stalled_request = rq;
> -	else
> -		trace_i915_request_guc_submit(rq);
>   
>   	if (unlikely(ret == -EPIPE))
>   		disable_submission(guc);
> @@ -1329,13 +1368,77 @@ static u16 prep_context_pending_disable(struct intel_context *ce)
>   	return ce->guc_id;
>   }
>   
> +static void __guc_context_set_preemption_timeout(struct intel_guc *guc,
> +						 u16 guc_id,
> +						 u32 preemption_timeout)
> +{
> +	u32 action [] = {
> +		INTEL_GUC_ACTION_SET_CONTEXT_PREEMPTION_TIMEOUT,
> +		guc_id,
> +		preemption_timeout
> +	};
> +
> +	intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
> +}
> +
> +static void guc_context_ban(struct intel_context *ce, struct i915_request *rq)
> +{
> +	struct intel_guc *guc = ce_to_guc(ce);
> +	struct intel_runtime_pm *runtime_pm =
> +		&ce->engine->gt->i915->runtime_pm;
> +	intel_wakeref_t wakeref;
> +	unsigned long flags;
> +
> +	guc_flush_submissions(guc);
> +
> +	spin_lock_irqsave(&ce->guc_state.lock, flags);
> +	set_context_banned(ce);
> +
> +	if (submission_disabled(guc) || (!context_enabled(ce) &&
> +	    !context_pending_disable(ce))) {
> +		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +
> +		guc_cancel_context_requests(ce);
> +		intel_engine_signal_breadcrumbs(ce->engine);
> +	} else if (!context_pending_disable(ce)) {
> +		u16 guc_id;
> +
> +		/*
> +		 * We add +2 here as the schedule disable complete CTB handler
> +		 * calls intel_context_sched_disable_unpin (-2 to pin_count).
> +		 */
> +		atomic_add(2, &ce->pin_count);
> +
> +		guc_id = prep_context_pending_disable(ce);
> +		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +
> +		/*
> +		 * In addition to disabling scheduling, set the preemption
> +		 * timeout to the minimum value (1 us) so the banned context
> +		 * gets kicked off the HW ASAP.
> +		 */
> +		with_intel_runtime_pm(runtime_pm, wakeref) {
> +			__guc_context_set_preemption_timeout(guc, guc_id, 1);
> +			__guc_context_sched_disable(guc, ce, guc_id);
> +		}
> +	} else {
> +		if (!context_guc_id_invalid(ce))
> +			with_intel_runtime_pm(runtime_pm, wakeref)
> +				__guc_context_set_preemption_timeout(guc,
> +								     ce->guc_id,
> +								     1);
> +		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +	}
> +}
> +
>   static void guc_context_sched_disable(struct intel_context *ce)
>   {
>   	struct intel_guc *guc = ce_to_guc(ce);
> -	struct intel_runtime_pm *runtime_pm = &ce->engine->gt->i915->runtime_pm;
>   	unsigned long flags;
> -	u16 guc_id;
> +	struct intel_runtime_pm *runtime_pm = &ce->engine->gt->i915->runtime_pm;
>   	intel_wakeref_t wakeref;
> +	u16 guc_id;
> +	bool enabled;
>   
>   	if (submission_disabled(guc) || context_guc_id_invalid(ce) ||
>   	    !lrc_desc_registered(guc, ce->guc_id)) {
> @@ -1349,14 +1452,22 @@ static void guc_context_sched_disable(struct intel_context *ce)
>   	spin_lock_irqsave(&ce->guc_state.lock, flags);
>   
>   	/*
> -	 * We have to check if the context has been pinned again as another pin
> -	 * operation is allowed to pass this function. Checking the pin count,
> -	 * within ce->guc_state.lock, synchronizes this function with
> +	 * We have to check if the context has been disabled by another thread.
> +	 * We also have to check if the context has been pinned again as another
> +	 * pin operation is allowed to pass this function. Checking the pin
> +	 * count, within ce->guc_state.lock, synchronizes this function with
>   	 * guc_request_alloc ensuring a request doesn't slip through the
>   	 * 'context_pending_disable' fence. Checking within the spin lock (can't
>   	 * sleep) ensures another process doesn't pin this context and generate
>   	 * a request before we set the 'context_pending_disable' flag here.
>   	 */
> +	enabled = context_enabled(ce);
> +	if (unlikely(!enabled || submission_disabled(guc))) {
> +		if (enabled)
> +			clr_context_enabled(ce);
> +		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +		goto unpin;
> +	}
>   	if (unlikely(atomic_add_unless(&ce->pin_count, -2, 2))) {
>   		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   		return;
> @@ -1513,6 +1624,8 @@ static const struct intel_context_ops guc_context_ops = {
>   	.unpin = guc_context_unpin,
>   	.post_unpin = guc_context_post_unpin,
>   
> +	.ban = guc_context_ban,
> +
>   	.enter = intel_context_enter_engine,
>   	.exit = intel_context_exit_engine,
>   
> @@ -1706,6 +1819,8 @@ static const struct intel_context_ops virtual_guc_context_ops = {
>   	.unpin = guc_context_unpin,
>   	.post_unpin = guc_context_post_unpin,
>   
> +	.ban = guc_context_ban,
> +
>   	.enter = guc_virtual_context_enter,
>   	.exit = guc_virtual_context_exit,
>   
> @@ -2159,6 +2274,8 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
>   	if (context_pending_enable(ce)) {
>   		clr_context_pending_enable(ce);
>   	} else if (context_pending_disable(ce)) {
> +		bool banned;
> +
>   		/*
>   		 * Unpin must be done before __guc_signal_context_fence,
>   		 * otherwise a race exists between the requests getting
> @@ -2169,9 +2286,16 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
>   		intel_context_sched_disable_unpin(ce);
>   
>   		spin_lock_irqsave(&ce->guc_state.lock, flags);
> +		banned = context_banned(ce);
> +		clr_context_banned(ce);
>   		clr_context_pending_disable(ce);
>   		__guc_signal_context_fence(ce);
>   		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +
> +		if (banned) {
> +			guc_cancel_context_requests(ce);
> +			intel_engine_signal_breadcrumbs(ce->engine);
> +		}
>   	}
>   
>   	decr_outstanding_submission_g2h(guc);
> @@ -2206,8 +2330,11 @@ static void guc_handle_context_reset(struct intel_guc *guc,
>   				     struct intel_context *ce)
>   {
>   	trace_intel_context_reset(ce);
> -	capture_error_state(guc, ce);
> -	guc_context_replay(ce);
> +
> +	if (likely(!intel_context_is_banned(ce))) {
> +		capture_error_state(guc, ce);
> +		guc_context_replay(ce);
> +	}
>   }
>   
>   int intel_guc_context_reset_process_msg(struct intel_guc *guc,
> diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
> index c095c4d39456..937d3706af9b 100644
> --- a/drivers/gpu/drm/i915/i915_trace.h
> +++ b/drivers/gpu/drm/i915/i915_trace.h
> @@ -934,6 +934,11 @@ DEFINE_EVENT(intel_context, intel_context_reset,
>   	     TP_ARGS(ce)
>   );
>   
> +DEFINE_EVENT(intel_context, intel_context_ban,
> +	     TP_PROTO(struct intel_context *ce),
> +	     TP_ARGS(ce)
> +);
> +
>   DEFINE_EVENT(intel_context, intel_context_register,
>   	     TP_PROTO(struct intel_context *ce),
>   	     TP_ARGS(ce)
> @@ -1036,6 +1041,11 @@ trace_intel_context_reset(struct intel_context *ce)
>   {
>   }
>   
> +static inline void
> +trace_intel_context_ban(struct intel_context *ce)
> +{
> +}
> +
>   static inline void
>   trace_intel_context_register(struct intel_context *ce)
>   {

