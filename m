Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 228D14931FE
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 01:48:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1412510E458;
	Wed, 19 Jan 2022 00:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68A810E403;
 Wed, 19 Jan 2022 00:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642553315; x=1674089315;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1dBDmsrAW7t7br9BfPsaL1uMHujnrFhQPhQVHlJ9Onk=;
 b=i8iqdUrF1MGEXxo9S2xi3K+Klal/LImynouMO7QwoKbxxuBQeV6DJ0C8
 hO4HAhapi4PYXwez6KCgBbHlozW0hZGh9qMO11/uhrLAwqe8GYnehrPk+
 Qi4DvWveLDDSSEeNlyx3DH1V4Y8/LPatlN8VQksjI21CN8Puh9Mc2XGga
 BNXDvIun7DdxdVv1aOqD/5aA/59zCNWUswolgZnb7UBxVje1AUTbulRus
 2ySfyGwtphLDqhiYNd40G2m/GAhm4Kvp0AaU/aT23KDpDocLmhIWsyOT2
 Ss9RfUqeoi6HI19glyAiyTFxA4xYchvfLPxNoLyUDSKMf491KqkOjHgI/ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="244908030"
X-IronPort-AV: E=Sophos;i="5.88,298,1635231600"; d="scan'208";a="244908030"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 16:48:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,298,1635231600"; d="scan'208";a="578628015"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 18 Jan 2022 16:48:34 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 18 Jan 2022 16:48:33 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 18 Jan 2022 16:48:33 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 18 Jan 2022 16:48:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVTIvBXmuDGPiyQj/m+QXD4vP5q0LXR75E0aNmqvrICwrPmoKJkccVhQVTvSi0oyteFmSK69WLJ728sVEVyUfp/mJXk3RVtZGMmshMGIkl6/jxgyWDRltcEWdf7HaRLYsQUeS4Ww9YrCaOl4cma1omJu9juv0ZSrPMuPmU40NanSNKhTvHx6ZePOa50Jmh49a/L7b1REm77o3+uhQcSps4woDpDxqLiwve3GRiYX2eX0N1yaQtm0NIO9HWsxo2ZI+u+ATHdPmhvGvNCm0cqt4Gk6fM1TFEoSQebTGimtDHuK8tKvVr3KsIraYuuc5iviS0b6cGAe32cc1/UsS1PCiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZ2t9jwZNRUnb0RKnNbizvZXPjKi1UJorTLC1/we5e8=;
 b=fKDrBN1WpVLJkTmdCX7kvdnmBVrjdCZu3ighjs+SzLgs1TAQXAeW23b39xulJTHL01yasf2fvKtTgH7Gz3vQ+ec9++zJSBBMCgIPlduiKLMpaaCzF7q/OEC1Ul6kwNQ1hAlua5B5RyUaw/hMg39iW1u5v6N1nFWf+e6Rm0T2N303ZAAqdZhxZv1mrHz4sZOwM77j/vamMUrngThe4ksajfx/6A9gJY14gfweRubBAFU5w6axJVQEKN8viwcybO2bpuVI2GFd2nL5BBb8rQ+9qVjxLLfJNMZ1mYkTAf+v9UjCymNDqmQyTdN58c24+kWvcTr+YQV/X40NuvZOPbsa2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM4PR11MB5486.namprd11.prod.outlook.com (2603:10b6:5:39e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Wed, 19 Jan
 2022 00:48:31 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5%5]) with mapi id 15.20.4909.008; Wed, 19 Jan 2022
 00:48:31 +0000
Message-ID: <bec0e46e-b0ef-2724-1a15-a058c8a926dd@intel.com>
Date: Tue, 18 Jan 2022 16:48:28 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/i915/guc: Ensure multi-lrc fini breadcrumb math is
 correct
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20220113055903.7607-1-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220113055903.7607-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR12CA0043.namprd12.prod.outlook.com
 (2603:10b6:301:2::29) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8887f072-f8ce-4931-52d5-08d9dae569e6
X-MS-TrafficTypeDiagnostic: DM4PR11MB5486:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM4PR11MB5486C42FB116B4E13E93F17EBD599@DM4PR11MB5486.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GhJpCvxtVI2ZmswtWZAWZOTxWNgFRSFa7V+WAGAEv9EOsPRAdhg/wIlYLnYJ9arnBX9ImjIB/UkY/1nfGb6uxamHDsSbP0oOO2ZkPRht3FvnE+bhhai3GKc71Wrak1R+DnoeFdmJMfMQCLqhYBPU3UYQ8rIm44T/YZbRE3DMUyDkZ7xAvxH25UNnxYx3PvJAF1/T2V1vPkgKnHlK3OFoXbj1VzVm8r6DP2lCUUpjjHyoC21gFOcS5VAHCnneEz0dP3Exe6MBM/KhYp1/fKm0hwdx3a6C86V1IZuEw6VkL4W7gV1vWQKqeXtz8rU3ibQKZyL+gTs+y4ue5kJ9hWiMBZGgZ5VVcfBhjUnmD92rpgNOMcVZBKp/repn236YImdwoqkRJNIlQk6bHah+9EkgjRgbTuX6DnwWldChdmSObYuXA5lEDB/HkwhshgMdbAgkvOGF3pVRLR5bVE9cWCODyuT5m3w0m1GJTtGvdEnZBEQfrlvIZIlK5qhLEa5Dgvt9N9BmK1vM3Ija+s+AlVi1tQE6ITrwUekGrBw/+LNLT9XZRVZDAfSif8yu1bULseqiguhm30eNsUdG/AcKM3+7HFxJEWfXxx6wohTwxFEz+jvJwpbUtYux4MQ2bM8oHeMXeTvLAWs64PMVoWLdecn0BZPXfjnCrnacW3uzlkXckjwwvSTQcdpL1VZDcSznmpbsC+3N6AMrdPW6mYDuJ4owbAAybViRImbseNdGWYOIFVE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(5660300002)(8676002)(2906002)(53546011)(107886003)(31696002)(86362001)(6506007)(8936002)(316002)(38100700002)(26005)(36756003)(6666004)(66946007)(6512007)(66476007)(31686004)(2616005)(450100002)(4326008)(508600001)(82960400001)(66556008)(83380400001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0hUQnhzYmZDVERoY3lTZXNOYW9GcWQyT3p6dXpyYjE5Vm9UM3pTbSswOXhS?=
 =?utf-8?B?dXJWdVdUajd4QVlVWUt4NHhzaHVMOVRobzdkdmV5SENTU1M4bnl5WmhCZUx5?=
 =?utf-8?B?amt6dnc2RytZUmlnckpSWENHbjU4dlpyTHFXc0ovSGZXbFhTTlNleEtLVmNI?=
 =?utf-8?B?by9Ma01FR2ZkUVNwTjNoT0dpUmlZUHRvYWJ3QTBjN3doNkJ2U1BIdlJkYWpw?=
 =?utf-8?B?UmRJd1BPd1l5NUxjUlZGZnIzM2s0TXZLUndnZ21XZE1vQnV2TmZuSk1xUm5W?=
 =?utf-8?B?T2NIQ2FiRTVNQmJqUmc5RWgzL2MyM1prd05tTlZTay9SSnR0M3pXY0F4dTNZ?=
 =?utf-8?B?aWp5b2hSY051TXdISml0Rko1bU80TlJkL2grSndaa3VHZHE1VVE5TWsvMmd0?=
 =?utf-8?B?Q2JMNkR5bGlTa2p1T1ZzY08wZmM4Qk5SWjcySjdUQlI3azdzblRQNmt4cTNR?=
 =?utf-8?B?bGVFUktDUm9wb2VGK29WNmRjVHNzWU44UHY2d2dOOUNMVjVPVCtOUEpGSGxr?=
 =?utf-8?B?TjlicEdFckh6Y2o0VEpPdlR3aXM5UUYwc3pPNHQ1eEt6VnBwalNKRndHMVQw?=
 =?utf-8?B?UEFSUTNCNndka1FRbkxJdmxQZytpRUlJNE1TVHl2cS9xU2NiYWFxdmc3Q2lG?=
 =?utf-8?B?OFBadVhCaXFuZmlzbXIwTFV5cGExSjlpbG9xcGZtc2N4dTA3T3FJWFlDM1lt?=
 =?utf-8?B?VGhDcm80RWxtNUo3ME84Y2dhYVo2ZEJvSmlzUFoxZi9MUytPUTArRHJibWVX?=
 =?utf-8?B?dDBmcW01MnBiK2NYWStVUUJWK0cyWU11SXFPanE4eTdXU0xERjZuTWp2WDlr?=
 =?utf-8?B?MzkrL1g3QnpGbUNXOGxSTFNMWUlmYndxSXFMV2g0c3dRbUUrT1ZFTEVncmRT?=
 =?utf-8?B?bCtYK0poZ1BDOUhDMHhvME5aZUZDTisvSUlCbFhwbjAwR1ZCcHdMVER4cjRZ?=
 =?utf-8?B?ODNsNGZaZWNiTk1BU215NklWSkF6SXRDRG9Hbm42RzdtQ2ZjQ0l3WHdnYlR0?=
 =?utf-8?B?eXpLOEVTQm81Rzh1YjVOazJKYXkxUXIxbTdHWXNhWlgwZEtuUEoxK29ZVWc4?=
 =?utf-8?B?L1lOc1FRZGcvWHFvbmlzWVBpN2xrZjVEV1QyQk1jL0RXdWl0TDdTWmZoSmQ1?=
 =?utf-8?B?WTJEQVVvM1IrUW5mVy8yZyswd2NDN0pEVUJ4RTJjRXg2bnpPUTlxaWdYM0tX?=
 =?utf-8?B?WTVja0x6RncrTlhwWXVucllzR25oclVxNEVvbGhTWERCT0F3RU1OWnZNd2dC?=
 =?utf-8?B?Z1MvU3p4eExwSVh6Yzhka0cxUk5meTBzMTRSRnZ0c3MrVEJsczdjNERMYzh1?=
 =?utf-8?B?VUJhWmFVd1RhSWZpblFpaDBQV3liS2NvM1FNYjN2bkF0T29FMkhLM3hGS2o2?=
 =?utf-8?B?bWJFLzFqbEFldFVWNFlHdzRBN01aZkJybERZUnBiODVXWWNCQnJtaTJSb3Ew?=
 =?utf-8?B?MUgwaERmeWc2cWJjUUJ3QWlLZ2JTbG9wZGkxemhreUgrMzdaTE50YXYwTDgy?=
 =?utf-8?B?K0tOeFI4L00vM2RmRlIzai9JK3FIZy9LdUpBY05zaXMwNkw0TjN6YlNPcWww?=
 =?utf-8?B?NVJBTTRSRWwzN25MektCUzR4NjdCQmJibWRIYlRzeUJ3eGlJSkxYKy8xN25o?=
 =?utf-8?B?UTc1YTExUHluUmQ1UVpiSjhTeDZEQlg2TXAyUTBCZWNGQUduSFRPdUFsaXly?=
 =?utf-8?B?MExYUG8vNVhzQk5NTm03ZkxGWWdDbW5kZFpzR0JpMkZ4c3Z5M0R6Um9kMmRr?=
 =?utf-8?B?MW04amQyWVZxTFpnZFRZRlhhYnBIWmR0R29xSkh5Z0YvU09OZXpWUjRaeVFN?=
 =?utf-8?B?bFhvQ2Y4U0tiQ2l6cVVXeFdGSkt2WWtRNVNJUnZhMGY3SlhNdUhqY3JRaU9C?=
 =?utf-8?B?VXlNT3l6NXp5MjdmRG5kak54c3QrWGx3cGNmVnJGSHcwZlFHOWhub1BlTTBD?=
 =?utf-8?B?aFJONmxGR01xVmJSY0JLMjRkTlFjc0lXTXhvUEpKVEcra2IvMEtqQjdHZlZq?=
 =?utf-8?B?cjZKcUJvcytJaXc2Z1ZwY0lQSHJ3dmZ4d0NLdmROcWpNeU4waXJNdTBIdjZG?=
 =?utf-8?B?S2tlZjNoZEQ0MVFmYXZwOFZ1S0ZzaG9QNzE1b1M5amVoTDVkTUVNeFBROWMw?=
 =?utf-8?B?M0twUHppK3oxVGp3ZThBc0tTSy9SaHc1cVM3N1RqSGF3a3lwWWRhelFhQUpT?=
 =?utf-8?B?aGg1eHdGWDVHYUUrei96dDJRcUFnN284Nk4yY3JTMWIrTDZFa1o2Nm5oSTAw?=
 =?utf-8?Q?cssznAwcVG8z+EMebQVITOMCI4MnfP74TXTJ8wR/RE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8887f072-f8ce-4931-52d5-08d9dae569e6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 00:48:31.0891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G9F1BVxJGqV3rGU/d4OMZ3QgYsUnwWnlrtRCPmJCt0AAoVV7HHmP4OMeV4zVJYDldlom8RT9lqNcpL4GZBcEp+WmSM3m1LB6+Wq1Bj82ys0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5486
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

On 1/12/2022 21:59, Matthew Brost wrote:
> Realized that the GuC multi-lrc fini breadcrumb emit code is very
> delicate as the math this code does relies on functions it calls to emit
> a certain number of DWs. Add a few GEM_BUG_ONs to assert the math is
> correct.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Looks good. There was a checkpatch warning about blank lines. With that 
fixed:
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 32 +++++++++++++++----
>   1 file changed, 26 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 3ae92260f8224..d562d85f96871 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -4493,27 +4493,31 @@ static inline bool skip_handshake(struct i915_request *rq)
>   	return test_bit(I915_FENCE_FLAG_SKIP_PARALLEL, &rq->fence.flags);
>   }
>   
> +#define NON_SKIP_LEN	6
>   static u32 *
>   emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
>   						 u32 *cs)
>   {
>   	struct intel_context *ce = rq->context;
> +	__maybe_unused u32 *before_fini_breadcrumb_user_interrupt_cs;
> +	__maybe_unused u32 *start_fini_breadcrumb_cs = cs;
>   
>   	GEM_BUG_ON(!intel_context_is_parent(ce));
>   
>   	if (unlikely(skip_handshake(rq))) {
>   		/*
>   		 * NOP everything in __emit_fini_breadcrumb_parent_no_preempt_mid_batch,
> -		 * the -6 comes from the length of the emits below.
> +		 * the NON_SKIP_LEN comes from the length of the emits below.
>   		 */
>   		memset(cs, 0, sizeof(u32) *
> -		       (ce->engine->emit_fini_breadcrumb_dw - 6));
> -		cs += ce->engine->emit_fini_breadcrumb_dw - 6;
> +		       (ce->engine->emit_fini_breadcrumb_dw - NON_SKIP_LEN));
> +		cs += ce->engine->emit_fini_breadcrumb_dw - NON_SKIP_LEN;
>   	} else {
>   		cs = __emit_fini_breadcrumb_parent_no_preempt_mid_batch(rq, cs);
>   	}
>   
>   	/* Emit fini breadcrumb */
> +	before_fini_breadcrumb_user_interrupt_cs = cs;
>   	cs = gen8_emit_ggtt_write(cs,
>   				  rq->fence.seqno,
>   				  i915_request_active_timeline(rq)->hwsp_offset,
> @@ -4523,6 +4527,12 @@ emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
>   	*cs++ = MI_USER_INTERRUPT;
>   	*cs++ = MI_NOOP;
>   
> +	/* Ensure our math for skip + emit is correct */
> +	GEM_BUG_ON(before_fini_breadcrumb_user_interrupt_cs + NON_SKIP_LEN !=
> +		   cs);
> +	GEM_BUG_ON(start_fini_breadcrumb_cs +
> +		   ce->engine->emit_fini_breadcrumb_dw != cs);
> +
>   	rq->tail = intel_ring_offset(rq, cs);
>   
>   	return cs;
> @@ -4565,22 +4575,25 @@ emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq,
>   						u32 *cs)
>   {
>   	struct intel_context *ce = rq->context;
> +	__maybe_unused u32 *before_fini_breadcrumb_user_interrupt_cs;
> +	__maybe_unused u32 *start_fini_breadcrumb_cs = cs;
>   
>   	GEM_BUG_ON(!intel_context_is_child(ce));
>   
>   	if (unlikely(skip_handshake(rq))) {
>   		/*
>   		 * NOP everything in __emit_fini_breadcrumb_child_no_preempt_mid_batch,
> -		 * the -6 comes from the length of the emits below.
> +		 * the NON_SKIP_LEN comes from the length of the emits below.
>   		 */
>   		memset(cs, 0, sizeof(u32) *
> -		       (ce->engine->emit_fini_breadcrumb_dw - 6));
> -		cs += ce->engine->emit_fini_breadcrumb_dw - 6;
> +		       (ce->engine->emit_fini_breadcrumb_dw - NON_SKIP_LEN));
> +		cs += ce->engine->emit_fini_breadcrumb_dw - NON_SKIP_LEN;
>   	} else {
>   		cs = __emit_fini_breadcrumb_child_no_preempt_mid_batch(rq, cs);
>   	}
>   
>   	/* Emit fini breadcrumb */
> +	before_fini_breadcrumb_user_interrupt_cs = cs;
>   	cs = gen8_emit_ggtt_write(cs,
>   				  rq->fence.seqno,
>   				  i915_request_active_timeline(rq)->hwsp_offset,
> @@ -4590,10 +4603,17 @@ emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq,
>   	*cs++ = MI_USER_INTERRUPT;
>   	*cs++ = MI_NOOP;
>   
> +	/* Ensure our math for skip + emit is correct */
> +	GEM_BUG_ON(before_fini_breadcrumb_user_interrupt_cs + NON_SKIP_LEN !=
> +		   cs);
> +	GEM_BUG_ON(start_fini_breadcrumb_cs +
> +		   ce->engine->emit_fini_breadcrumb_dw != cs);
> +
>   	rq->tail = intel_ring_offset(rq, cs);
>   
>   	return cs;
>   }
> +#undef NON_SKIP_LEN
>   
>   static struct intel_context *
>   guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,

