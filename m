Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F88786B8B2
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 20:58:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA90410E187;
	Wed, 28 Feb 2024 19:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WQJyxCMS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2859110E11C;
 Wed, 28 Feb 2024 19:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709150298; x=1740686298;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vj1yYxeCLNUJduKAmyLg/rACkKypr61ZPt30Cc6pp6I=;
 b=WQJyxCMSXAzxoZmPM4a849ChBmJr6aTd1tepMoQkHq5NCGofqfCJjCdt
 dDsQItDSbK3e6ppwuwij0X638HkF3Xl0pmPYu/Z6qGY2jPW6gmQUcAxtI
 ysedRF9vaDymIzeFxl5IKdHc6dG5UMSEqa83SigvGDuZZkMkzXIRtTBn5
 cCO+GZmLNfCka9OOrpD7e0WKbjD5KcDmMNAerMafnfqKvMJD5cE5m1kgz
 xxDwh4E5cR3lrhRPjZ3BrANIUyQQq8gv89p6VoQ/rAf8VhuXNi1otJIue
 K2f3lAg5l8uTyryIWqeD2wKX/i1DyhBQMPUSyEqgJs1YPzSr13f67cZY6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3698095"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="3698095"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 11:58:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; d="scan'208";a="12209070"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2024 11:58:15 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 11:58:14 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 11:58:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 28 Feb 2024 11:58:13 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 28 Feb 2024 11:58:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1DRITM3/wslEVbQWnhaZuxqfmYl2i3IiHaPMziCfcNLLVtC4mwG3zzOG6p17Z0h69OkqgoQsIXhr+BhARjELP3v6lCKC1S1LsN9Sm/xsJRAm4i0KKs8l9c0ONxHFGGSxDt3MK2HcPHMeQUkVStsiAtq+n/GcsHRvY07GBVVBJk0jTc5AtcKVFq+rf3UNXP3JgNiYY2G0LRsXtykI/YYnkHaLMyqhXlyUiSIaDiw9DBkS405yThEpbhvstKNhWwp+AkznEKvQZqwdAL8C6du5DYF+tvdHQ0Ht2HjaNchLq0KaCNU65H6nCnxDcwLgmiAfrEdp2G6E+sj3olt9qLuxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7a2bcaBbELSRWwSOCFLZ1KcaZ6eovoVQsiPJugeDbE=;
 b=PBTSw+FXfzizGiDcpnWQY7vqAIRXxGGK7CG8C+FSQ2x+2sLNZ6fWyH0Bz5K4qosrzCa6dg4WH4HMoyJcriuFXmNWlOowM3lD6lbADQTAtXdVGn5aVnXfDA6HItw9dbQMjuaZWdatmGZnr7ZEfGbOHs780l0eTz4Y+dUTBXfYoD+GyBD7wHD/ikqD/3TWGUcWcS2dk/ugvmq3quEo8DAIyPK9B/pRmFkr2CXjJdIWztAtQU13CS4AG7ft1gwPSYGjHU7ah9u/FaA0rmLPXT52dp5ko1yYHTK2Hscuk5B4EwaVu67Sl1FeXuunf/BuM6X6rhc98/qKXanw1QTTJnn+Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SA3PR11MB7556.namprd11.prod.outlook.com (2603:10b6:806:31f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Wed, 28 Feb
 2024 19:58:11 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::6fc1:232e:5d99:43a3]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::6fc1:232e:5d99:43a3%4]) with mapi id 15.20.7339.026; Wed, 28 Feb 2024
 19:58:11 +0000
Message-ID: <1e21207b-66d8-4346-be4d-0a67c9a30eaf@intel.com>
Date: Wed, 28 Feb 2024 11:58:06 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915/guc: Use context hints for GT freq
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Sushma Venkatesh Reddy
 <sushma.venkatesh.reddy@intel.com>
References: <20240227235131.2308656-1-vinay.belgaumkar@intel.com>
 <a3d36d95-ea7e-4796-99a0-2ad2730624f6@linux.intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <a3d36d95-ea7e-4796-99a0-2ad2730624f6@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:217::31) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SA3PR11MB7556:EE_
X-MS-Office365-Filtering-Correlation-Id: a409add6-bf01-4567-1f7e-08dc3897973f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tBgeONZm06pS3FMOtW2jdG+nmgINzKVG7f+m80USfXedr/G3PEnTfbQqzb8ld17/IAgJBMOTSSpWwsZSklExCUtbae6jBDNGfeG7e63vaXJELIv/zzHUbO7MIgeMDflxe3d9UNXvpDr3dF+Ao0uiPVDnLoVwYxUEFphH/78JSlwN/TB3UFu6mrdP3wcKKj1ZAtvxXUHcawMPitdQKhVdXayfmkwWaJte18NSnjXdd+7hM77lUyyqj68LMsW9DphjglG/hMdKde+hzaB3mXHKfa9E8MPIjfOr+3YaAxnIiY0HxlaHwAeQ8FICq7Psl+7YgV5e9nxxP1kQDqgIH6zX1E+GiW4aOvq3FLZXS57VyT2DahLVbm7/22emMvhYJi3spkc09F42S5U291o6/uc+HHUcf6hjdl2FkE2UiXltg+JACPz7PJqO4pabnrN8Rk3KMY7H9aI3PiaavBn44M6RTJXVIIJAKLXPtT6pP560OQwmoi2thYvuZpt8PjWaQzVVzITLNvAl5PdYsrIaPpIKovIeHtuMibuAhPCAHdTEBuxhMiAlJ0cACeeZnk5Yy964kEOVop3gDeEhgtput1dKSGHZsgrpruRgfP8Urss9Mib360mrb7fY9u0kkOG3X8Xh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDRSME5jR3pmajZCVklCVk9pUXhhenI4YUdJd3d5VjQxamtKOFVxQUtyUVk1?=
 =?utf-8?B?a21iRzJjOENmWmxnRWtnUmpVWVovMnZ5TWw0NUprNW8wbXlmWldhY1Z2VHdw?=
 =?utf-8?B?SDJJZWhDTXJhRjJabXNWOVMzRTRCMDN6YnRxV2ZEeDNLS1BEUEhucXc1ZGU4?=
 =?utf-8?B?ZjhJSlRBNE5EM2kzb0RPbmNFWHNMcndkSGFxTWMwSUxITEsrNXFmdm5FcU1X?=
 =?utf-8?B?Z1htMm1rRDJjWVp1bnBaSWNsSlBrQkdtSkRKZk9BSjYzSnBHWEo4SjBFQ2M4?=
 =?utf-8?B?THEyNnRFODRuazE1SXJST0RSaUNsWllXWFBPTGtBOWF6VmxOQVVBZjJMYTk4?=
 =?utf-8?B?cS90cENBVzY1UEFaaG5WZjRVbzZDVURCanVrL1pmU1hmN3VNUHR4bTZHY29U?=
 =?utf-8?B?ZXR3T3Vrd0lhSmxxcHE4SUNUNTdZcWNZbXZjdmZEK2l0VDBOTlFGdllhRkd2?=
 =?utf-8?B?aUltNGlLMG1UK2t1akYwV2QzdzBjeklzZ2RwUTRBZmZsanFQbWNlV3BTUlJa?=
 =?utf-8?B?K2hKRFIyeHpHeDF2R0dKOUJxSFRLR21tTVZyZDhDME8vQ1F1Mld1ek5tSHRn?=
 =?utf-8?B?bnFETzNxd1B1RitjelVZWnVuTjgyUktOK0lYcE1MYnVCaTd4NWhPZ0R1N1cw?=
 =?utf-8?B?dG1MRW15ZnduR1lwUkprUGhTRjlkcXFEUnZqZEJxVFNOL1JjNjFTQmlGeFVO?=
 =?utf-8?B?TXpGNE8wZ1Y1THVLVi9oOEs5NWc3YUh2N2pETHVoSDFsQS9PVTdkckdlZ0F0?=
 =?utf-8?B?aEYwWDlneEttL0REcEdZVzkrc014SEl3SURpc3JzZjBtbzNKNjdMQndScFVN?=
 =?utf-8?B?QnJOeWFpZVJlb2xLOFpKcEVQUkJvNkp2R0JyQ2p0UG1FNmJpRHhDYWN0cWVT?=
 =?utf-8?B?QlpycjBBWm1EclNPRzg5ZGdhMUZKcEx6MVduR05rM1BucGU1bHVicG8wNlFU?=
 =?utf-8?B?S0RkVUNmT0pURld5b0o5ME1TM1RIM0tDb080dHh6eU82NkQvQjhWb1BLWWty?=
 =?utf-8?B?TFhxcThtOFRlbWljQis1eHpXU3VHV2xPaitVNlFJMHhIY2pXZUVEV3ZROTQv?=
 =?utf-8?B?RTZaNlN1Z290MTBlemlaMnZ6L1pvbnVaS1l6aHh2YmY2VGxucTNEb3V2Titq?=
 =?utf-8?B?ZjZaNVNLTm4xVmV2cUxlUFFjdlUrMGNwR0FEWjhaV001UnQ5Y1BINlZWU0hG?=
 =?utf-8?B?NkZXeGhDZ3EwMitUREc4TC9FMmNTcEptcG11dnR6eHA3RHdxeTdKY0FlKzc2?=
 =?utf-8?B?MzBsek1hT2VFdG1kN2l1RGFHMmdnWDM0R3NPbjVSVU9qb1V5aFd2MytabmtV?=
 =?utf-8?B?bWNwNHVyenFQblVHYVNBZzNLdUtKZGNnQlpkbW0vRUFBR2ZwMTVSR3Y5OTRu?=
 =?utf-8?B?NEp4L3BTQ1ltVWFXTGVMQmppV01vMXJGblRhUGhkUVVpNnVUcGxpOUMyQzhm?=
 =?utf-8?B?TTM1QzZ2SGhweXZNTjYwWXZLbU5iZWVMN0h2ekI4ZDJTNlZ2OU4wRFBDYitv?=
 =?utf-8?B?bzhJSmZiejJsZXpQdjBibzdtTFJhQ016eXIzZ2l4R2Y5RG4yNzR3ZDBqQjVp?=
 =?utf-8?B?MFEvTWE1dzZxbjBjM01aUm96aFR3Q2FsVnhlZTZkZ2JRVkJnN0xPdVg3V0Rq?=
 =?utf-8?B?UnlIbWJGM3BQcFc4ais5WmU2ZmRTZmVJUTJycEIrdjBBbnd5bGxBVmZPYlBl?=
 =?utf-8?B?SyszR2Zac3cweEcwTFh3OUhPS09hSStGaDZYWEMzajRaRVhqSk1iUTlReHEy?=
 =?utf-8?B?cEhkMXovWjcyQUVjdGFOMDF6T09tVzVZVzQ3Z1JsQVp1M1V4akRZK0NXMnYv?=
 =?utf-8?B?MzZVVzZmbjBNam9sNVF2VW9vV0lWTDlRbVhQa3hlTUIwRm5wckJVZFY5UXdi?=
 =?utf-8?B?YTZsaVhVT0tSTzlVZWtlc016UkdzOXhkSUd4eEkwNzlDTTh6S1ZXSjRmQXpn?=
 =?utf-8?B?MXE0QmtIRHBMdU5JcCs0ZHlUelNZLzdOZ1RhbDRhZm1idG00eFBjR3RnTXJj?=
 =?utf-8?B?ZDJkeXV2cXFBRGMwZzRhK1Z0RW9LaGxCY3FHYXA4MnczQXhJamNaSHBHNits?=
 =?utf-8?B?cThWVU1TRUNKT011RzJxS21sVC9FQnVMckZaTTdTaEZuQVlXMmlnT0RHVGdO?=
 =?utf-8?B?dFlFYUg0ajdTRUdwdGtGYzFrSnJUL09WOWpLNDVUcjlrUTZqNFRIT2xxTjFl?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a409add6-bf01-4567-1f7e-08dc3897973f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 19:58:11.0317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PkbS2rFbMQ6DLw6x6+dMOdzmqLzkdJjpvgcabX1BIEo14/b8VV6KIBm2TUOWNSY+segI7+DTiEH2IkASYHDXja98N+rod5/X180eYw9u3yI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7556
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


On 2/28/2024 4:54 AM, Tvrtko Ursulin wrote:
>
> On 27/02/2024 23:51, Vinay Belgaumkar wrote:
>> Allow user to provide a low latency context hint. When set, KMD
>> sends a hint to GuC which results in special handling for this
>> context. SLPC will ramp the GT frequency aggressively every time
>> it switches to this context. The down freq threshold will also be
>> lower so GuC will ramp down the GT freq for this context more slowly.
>> We also disable waitboost for this context as that will interfere with
>> the strategy.
>>
>> We need to enable the use of SLPC Compute strategy during init, but
>> it will apply only to contexts that set this bit during context
>> creation.
>>
>> Userland can check whether this feature is supported using a new param-
>> I915_PARAM_HAS_CONTEXT_FREQ_HINTS. This flag is true for all guc 
>> submission
>> enabled platforms as they use SLPC for frequency management.
>>
>> The Mesa usage model for this flag is here -
>> https://gitlab.freedesktop.org/sushmave/mesa/-/commits/compute_hint
>>
>> v2: Rename flags as per review suggestions (Rodrigo, Tvrtko).
>> Also, use flag bits in intel_context as it allows finer control for
>> toggling per engine if needed (Tvrtko).
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_context.c   | 15 +++++++++++--
>>   .../gpu/drm/i915/gem/i915_gem_context_types.h |  1 +
>>   drivers/gpu/drm/i915/gt/intel_context_types.h |  1 +
>>   drivers/gpu/drm/i915/gt/intel_rps.c           |  5 +++++
>>   .../drm/i915/gt/uc/abi/guc_actions_slpc_abi.h | 21 +++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 17 +++++++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |  1 +
>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  6 ++++++
>>   drivers/gpu/drm/i915/i915_getparam.c          | 12 +++++++++++
>>   include/uapi/drm/i915_drm.h                   | 15 +++++++++++++
>>   10 files changed, 92 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>> index dcbfe32fd30c..0799cb0b2803 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>> @@ -879,6 +879,7 @@ static int set_proto_ctx_param(struct 
>> drm_i915_file_private *fpriv,
>>                      struct i915_gem_proto_context *pc,
>>                      struct drm_i915_gem_context_param *args)
>>   {
>> +    struct drm_i915_private *i915 = fpriv->i915;
>>       int ret = 0;
>>         switch (args->param) {
>> @@ -904,6 +905,13 @@ static int set_proto_ctx_param(struct 
>> drm_i915_file_private *fpriv,
>>               pc->user_flags &= ~BIT(UCONTEXT_BANNABLE);
>>           break;
>>   +    case I915_CONTEXT_PARAM_LOW_LATENCY:
>> +        if (intel_uc_uses_guc_submission(&to_gt(i915)->uc))
>> +            pc->user_flags |= BIT(UCONTEXT_LOW_LATENCY);
>> +        else
>> +            ret = -EINVAL;
>> +        break;
>> +
>>       case I915_CONTEXT_PARAM_RECOVERABLE:
>>           if (args->size)
>>               ret = -EINVAL;
>> @@ -992,6 +1000,9 @@ static int intel_context_set_gem(struct 
>> intel_context *ce,
>>       if (sseu.slice_mask && !WARN_ON(ce->engine->class != 
>> RENDER_CLASS))
>>           ret = intel_context_reconfigure_sseu(ce, sseu);
>>   +    if (test_bit(UCONTEXT_LOW_LATENCY, &ctx->user_flags))
>> +        set_bit(CONTEXT_LOW_LATENCY, &ce->flags);
>
> Does not need to be atomic so can use __set_bit as higher up in the 
> function.
ok.
>
>> +
>>       return ret;
>>   }
>>   @@ -1630,6 +1641,8 @@ i915_gem_create_context(struct 
>> drm_i915_private *i915,
>>       if (vm)
>>           ctx->vm = vm;
>>   +    ctx->user_flags = pc->user_flags;
>> +
>
> Given how most ctx->something assignments are at the bottom of the 
> function I would stick a comment here saying along the lines of 
> "assign early for intel_context_set_gem called when creating engines".
ok.
>
>> mutex_init(&ctx->engines_mutex);
>>       if (pc->num_user_engines >= 0) {
>>           i915_gem_context_set_user_engines(ctx);
>> @@ -1652,8 +1665,6 @@ i915_gem_create_context(struct drm_i915_private 
>> *i915,
>>        * is no remap info, it will be a NOP. */
>>       ctx->remap_slice = ALL_L3_SLICES(i915);
>>   -    ctx->user_flags = pc->user_flags;
>> -
>>       for (i = 0; i < ARRAY_SIZE(ctx->hang_timestamp); i++)
>>           ctx->hang_timestamp[i] = jiffies - CONTEXT_FAST_HANG_JIFFIES;
>>   diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h 
>> b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
>> index 03bc7f9d191b..b6d97da63d1f 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
>> @@ -338,6 +338,7 @@ struct i915_gem_context {
>>   #define UCONTEXT_BANNABLE        2
>>   #define UCONTEXT_RECOVERABLE        3
>>   #define UCONTEXT_PERSISTENCE        4
>> +#define UCONTEXT_LOW_LATENCY        5
>>         /**
>>        * @flags: small set of booleans
>> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h 
>> b/drivers/gpu/drm/i915/gt/intel_context_types.h
>> index 7eccbd70d89f..ed95a7b57cbb 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
>> @@ -130,6 +130,7 @@ struct intel_context {
>>   #define CONTEXT_PERMA_PIN        11
>>   #define CONTEXT_IS_PARKING        12
>>   #define CONTEXT_EXITING            13
>> +#define CONTEXT_LOW_LATENCY        14
>>         struct {
>>           u64 timeout_us;
>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c 
>> b/drivers/gpu/drm/i915/gt/intel_rps.c
>> index 4feef874e6d6..3accfd8db287 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
>> @@ -24,6 +24,7 @@
>>   #include "intel_pcode.h"
>>   #include "intel_rps.h"
>>   #include "vlv_sideband.h"
>> +#include "../gem/i915_gem_context.h"
>
> I wouldn't think this needs the directory backtrack. Please 
> double-check and remove if not needed.
>
> Also please group the GEM include on it's own before the gt block.
Don't think this is needed. Removing.
>
>
>>   #include "../../../platform/x86/intel_ips.h"
>>     #define BUSY_MAX_EI    20u /* ms */
>> @@ -1013,6 +1014,10 @@ void intel_rps_boost(struct i915_request *rq)
>>       if (i915_request_signaled(rq) || i915_request_has_waitboost(rq))
>>           return;
>>   +    /* Waitboost is not needed for contexts marked with a Freq 
>> hint */
>> +    if (test_bit(CONTEXT_LOW_LATENCY, &rq->context->flags))
>> +        return;
>
> I understood the plan was to add a separate "no waitboost" flag which 
> Rodrigo would need for later? Could be done later too.
This flag is as good, I guess. If we plan to add more flags, we could 
add a no_waitboost assuming they will be a mix of some that warrant 
waitboost and some that don't.
>
>> +
>>       /* Serializes with i915_request_retire() */
>>       if (!test_and_set_bit(I915_FENCE_FLAG_BOOST, &rq->fence.flags)) {
>>           struct intel_rps *rps = &READ_ONCE(rq->engine)->gt->rps;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h 
>> b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
>> index 811add10c30d..c34674e797c6 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
>> @@ -207,6 +207,27 @@ struct slpc_shared_data {
>>       u8 reserved_mode_definition[4096];
>>   } __packed;
>>   +struct slpc_context_frequency_request {
>> +    u32 frequency_request:16;
>> +    u32 reserved:12;
>> +    u32 is_compute:1;
>> +    u32 ignore_busyness:1;
>> +    u32 is_minimum:1;
>> +    u32 is_predefined:1;
>> +} __packed;
>> +
>> +#define SLPC_CTX_FREQ_REQ_IS_COMPUTE        REG_BIT(28)
>> +
>> +struct slpc_optimized_strategies {
>> +    u32 compute:1;
>> +    u32 async_flip:1;
>> +    u32 media:1;
>> +    u32 vsync_flip:1;
>> +    u32 reserved:28;
>> +} __packed;
>> +
>> +#define SLPC_OPTIMIZED_STRATEGY_COMPUTE        REG_BIT(0)
>> +
>>   /**
>>    * DOC: SLPC H2G MESSAGE FORMAT
>>    *
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index 3e681ab6fbf9..706fffca698b 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -537,6 +537,20 @@ int intel_guc_slpc_get_min_freq(struct 
>> intel_guc_slpc *slpc, u32 *val)
>>       return ret;
>>   }
>>   +int intel_guc_slpc_set_strategy(struct intel_guc_slpc *slpc, u32 val)
>> +{
>> +    struct drm_i915_private *i915 = slpc_to_i915(slpc);
>> +    intel_wakeref_t wakeref;
>> +    int ret = 0;
>> +
>> +    with_intel_runtime_pm(&i915->runtime_pm, wakeref)
>> +        ret = slpc_set_param(slpc,
>> +                     SLPC_PARAM_STRATEGIES,
>> +                     val);
>> +
>> +    return ret;
>> +}
>> +
>>   int intel_guc_slpc_set_media_ratio_mode(struct intel_guc_slpc 
>> *slpc, u32 val)
>>   {
>>       struct drm_i915_private *i915 = slpc_to_i915(slpc);
>> @@ -711,6 +725,9 @@ int intel_guc_slpc_enable(struct intel_guc_slpc 
>> *slpc)
>>       /* Set cached media freq ratio mode */
>>       intel_guc_slpc_set_media_ratio_mode(slpc, slpc->media_ratio_mode);
>>   +    /* Enable SLPC Optimized Strategy for compute */
>> +    intel_guc_slpc_set_strategy(slpc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>> +
>>       return 0;
>>   }
>>   diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> index 6ac6503c39d4..1cb5fd44f05c 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> @@ -45,5 +45,6 @@ void intel_guc_pm_intrmsk_enable(struct intel_gt *gt);
>>   void intel_guc_slpc_boost(struct intel_guc_slpc *slpc);
>>   void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc);
>>   int intel_guc_slpc_set_ignore_eff_freq(struct intel_guc_slpc *slpc, 
>> bool val);
>> +int intel_guc_slpc_set_strategy(struct intel_guc_slpc *slpc, u32 val);
>>     #endif
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index f3dcae4b9d45..d6ea4898ac39 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -2645,6 +2645,7 @@ MAKE_CONTEXT_POLICY_ADD(execution_quantum, 
>> EXECUTION_QUANTUM)
>>   MAKE_CONTEXT_POLICY_ADD(preemption_timeout, PREEMPTION_TIMEOUT)
>>   MAKE_CONTEXT_POLICY_ADD(priority, SCHEDULING_PRIORITY)
>>   MAKE_CONTEXT_POLICY_ADD(preempt_to_idle, 
>> PREEMPT_TO_IDLE_ON_QUANTUM_EXPIRY)
>> +MAKE_CONTEXT_POLICY_ADD(slpc_ctx_freq_req, SLPM_GT_FREQUENCY)
>>     #undef MAKE_CONTEXT_POLICY_ADD
>>   @@ -2664,6 +2665,7 @@ static int guc_context_policy_init_v70(struct 
>> intel_context *ce, bool loop)
>>       struct context_policy policy;
>>       u32 execution_quantum;
>>       u32 preemption_timeout;
>> +    u32 slpc_ctx_freq_req = 0;
>>       unsigned long flags;
>>       int ret;
>>   @@ -2675,11 +2677,15 @@ static int 
>> guc_context_policy_init_v70(struct intel_context *ce, bool loop)
>>       execution_quantum = engine->props.timeslice_duration_ms * 1000;
>>       preemption_timeout = engine->props.preempt_timeout_ms * 1000;
>>   +    if (ce && (ce->flags & BIT(CONTEXT_LOW_LATENCY)))
>> +        slpc_ctx_freq_req |= SLPC_CTX_FREQ_REQ_IS_COMPUTE;
>> +
>>       __guc_context_policy_start_klv(&policy, ce->guc_id.id);
>>         __guc_context_policy_add_priority(&policy, ce->guc_state.prio);
>>       __guc_context_policy_add_execution_quantum(&policy, 
>> execution_quantum);
>>       __guc_context_policy_add_preemption_timeout(&policy, 
>> preemption_timeout);
>> +    __guc_context_policy_add_slpc_ctx_freq_req(&policy, 
>> slpc_ctx_freq_req);
>>         if (engine->flags & I915_ENGINE_WANT_FORCED_PREEMPTION)
>>           __guc_context_policy_add_preempt_to_idle(&policy, 1);
>> diff --git a/drivers/gpu/drm/i915/i915_getparam.c 
>> b/drivers/gpu/drm/i915/i915_getparam.c
>> index 5c3fec63cb4c..4fc182fdb2e8 100644
>> --- a/drivers/gpu/drm/i915/i915_getparam.c
>> +++ b/drivers/gpu/drm/i915/i915_getparam.c
>> @@ -155,6 +155,18 @@ int i915_getparam_ioctl(struct drm_device *dev, 
>> void *data,
>>            */
>>           value = 1;
>>           break;
>> +    case I915_PARAM_HAS_CONTEXT_FREQ_HINT:
>> +        /*
>> +         * This feature has been available in GuC for a while but
>> +         * a use case now required the use of this feature. We
>> +         * return true now since this is now being supported from
>> +         * the kernel side as well.
>> +         */
>
> TBH I don't see why the comment text is useful? The condition below 
> already makes it clear the thing is always supported when GuC is on.
ok, will remove.
>
>> +        if (intel_uc_uses_guc_submission(&to_gt(i915)->uc))
>> +            value = 1;
>> +        else
>> +            value = -EINVAL;
>> +        break;
>>       case I915_PARAM_HAS_CONTEXT_ISOLATION:
>>           value = intel_engines_has_context_isolation(i915);
>>           break;
>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>> index 2ee338860b7e..4f69f4e117ac 100644
>> --- a/include/uapi/drm/i915_drm.h
>> +++ b/include/uapi/drm/i915_drm.h
>> @@ -806,6 +806,12 @@ typedef struct drm_i915_irq_wait {
>>    */
>>   #define I915_PARAM_PXP_STATUS         58
>>   +/*
>> + * Query if kernel allows marking a context to send a Freq hint to 
>> SLPC. This
>> + * will enable use of the strategies allowed by the SLPC algorithm.
>> + */
>> +#define I915_PARAM_HAS_CONTEXT_FREQ_HINT    59
>> +
>>   /* Must be kept compact -- no holes and well documented */
>>     /**
>> @@ -2148,6 +2154,15 @@ struct drm_i915_gem_context_param {
>>    * -EIO: The firmware did not succeed in creating the protected 
>> context.
>>    */
>>   #define I915_CONTEXT_PARAM_PROTECTED_CONTENT    0xd
>> +
>> +/*
>> + * I915_CONTEXT_PARAM_IS_COMPUTE:
>> + *
>> + * Mark this context as a Compute related workload which requires 
>> aggressive GT
>> + * frequency scaling. Query I915_PARAM_HAS_CONTEXT_COMPUTE to check 
>> if the kernel
>> + * supports this functionality.
>> + */
>> +#define I915_CONTEXT_PARAM_LOW_LATENCY        0xe
>>   /* Must be kept compact -- no holes and well documented */
>>         /** @value: Context parameter value to be set or queried */
>
> Modulo the comments I left and the SLPC/GuC parts I haven't looked at, 
> the implementation on the overall looks fine to me.
>
> For the uapi angle I am not really happy that it is steamrolled to be 
> a GEM context level concept, apparently without much motivation to 
> discuss and document the pros and cons. But I guess finer grained 
> control could be added later if need is confirmed so it is not a huge 
> problem.

Thanks for the review,

Vinay.

>
>
> Regards,
>
> Tvrtko
