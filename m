Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8B74BC193
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 22:13:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4EA10E4D4;
	Fri, 18 Feb 2022 21:13:31 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1300F10E1B1;
 Fri, 18 Feb 2022 21:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645218810; x=1676754810;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OjMvLcXM/t+91nQ9gmB/rcgxVOPni+XgqwfbAH5CLAk=;
 b=jcTGCJ1EhQZdAx+P/z4ZvBI21DL7vw884dyzOufUjh9CE6Pia5cLNBUg
 V3fXYVMIVv7b3FP8bB3oIbslinzNzGVr8Ob1CvXmmBgb3cpm/D8fGgBqy
 L291ulPTx1tMvAjKC4iIirG1vwaHvI/brPX5zTnAhVPD6uPSfYjzcelwU
 awaWircqPEmhwiXb7TNv1k0khUdkqWRikolQl1hP0E+XKlfD+ea3WjKdl
 Vw0PrzvF0Ee92UmmnlOjSHpW72uWMVnLWjim3ueTxjA/pAQD/KPUgs7n6
 Dh2o7CptYcNfMHwjq3GACNpYeseSKZ6tBdeVxkIzi8qbwkNxu5WouPrQ6 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="275809059"
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="275809059"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 13:13:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="506892683"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga006.jf.intel.com with ESMTP; 18 Feb 2022 13:13:19 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 18 Feb 2022 13:13:19 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 18 Feb 2022 13:13:19 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 18 Feb 2022 13:13:19 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 18 Feb 2022 13:13:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C0ZVNKlbIYLb8nJuRnKWvtYO7VF2oLeLQOYRIuizxiSCj3M2fcl89g6lkVBqCaJJtqz1WIvJiOYk18oTUb5bG8YoRhjq2zORnzHtruM3r1lX41cMKTQtdaoK0+mDt3WROnJz5ler2liObupIdUH/d9Ku1X/lHcyw4U2DBP1gJSCWzfUEhqna+e3iGqmZucSjH7XXJNF+mtsCnzBTpgIX1hoVmi8rRMQ0dbM+1Xnj0S702Ky9awdkEjZ5Ojm+XuYjjD8kYmiLPTSK1r11twsxCg9abVemAzsEGnjgiQl67jIzLINMBht+0KXffczr0dxd0ajSgSng8ISzR1DWHWxC9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7oA1ft4A+xGpdnGX1fpEoQMPI9yaL/RQvap9SniqM4=;
 b=jqUJDIW5LdwJI3k3O3BHCEwGkbk9xS3JdTa3PofebGXtw34iJM55zh+X2Xx5Ly8H2BT4UDelCP1xbX0cGhzMxSLdUffMay4ueh5sNIQFlZ0MlUocDx0RJMQ4BxNGKzFTux/AbCiihsBqK6Kbbe3UjDQhOM1/I5tmuHD1LuK2KdZ38vYGAFOnP9eP7b6DMqtE8id+aSIH7C2lQ1V3JLrjWASp1Rfm+bzGykm2LR+c5rg6aXEw6VM/gnghPNAGF2CUxGGu7EEDVmh66v1RsTybjkbC7QOk1/BwWoV8y2e3mPFdErkqEO4cQ9hDWabkGxLjUDADwG5LiVYKxzSGdhU8fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 by CO1PR11MB4834.namprd11.prod.outlook.com (2603:10b6:303:90::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Fri, 18 Feb
 2022 21:13:17 +0000
Received: from CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::e041:f94a:d733:9573]) by CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::e041:f94a:d733:9573%2]) with mapi id 15.20.4995.024; Fri, 18 Feb 2022
 21:13:17 +0000
Message-ID: <13fcfdba-e823-3800-4288-5b31bfc328fb@intel.com>
Date: Fri, 18 Feb 2022 13:13:14 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/8] drm/i915/guc: Do not conflate lrc_desc with GuC id
 for registration
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220217235207.930153-1-John.C.Harrison@Intel.com>
 <20220217235207.930153-2-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220217235207.930153-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR04CA0064.namprd04.prod.outlook.com
 (2603:10b6:300:6c::26) To CH0PR11MB5475.namprd11.prod.outlook.com
 (2603:10b6:610:d6::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3e7d6c1-1518-4380-e1c9-08d9f3237b74
X-MS-TrafficTypeDiagnostic: CO1PR11MB4834:EE_
X-Microsoft-Antispam-PRVS: <CO1PR11MB48342D3BBF9E14AC84B71FBAF4379@CO1PR11MB4834.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:499;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: op759rh/AORDN7iGtwoEzCkbIBBNRPPtvKFn6Q7sS83Mr3v/ljr0WQGrVeQDRZKP5guNqgkcYFyjMBvFZ7EH+bxnGJmN9M6hJF5IIjisLg9l1LNyIPGuDcbjwAJQ+VXUC/Z+B0E2Hre7RB+pG0+ab7qLFeYmscI+eerjj6FLizS8Y/Djqd8HZHBbxV8tNJBes/ERVUAog92YdKrsR7dZQIHdocfKSuyTEpipDRAS3OAyBb1ie4rE38VoPWRijeX/4OMI3TM29zd22e2+u4Sq3ldYp6d6i2/ZMFPG9yJLQxl12zUlqRTnWUasG2/QXTECNFjq7ldDY0Bs8IkGv/DdGUVM3uVBg9V5Qq2UGbSrj0UdltZr/grNOzbzsBGmV9cPcT88Z/gFcdAIIJUdo3TkPeCYy+ewU0zYSDIRIlcBVcPM5uoelxq4EVdZofWMr+x6KHrdDr1QPEEZ9/W7IhNUwX9xOEuK0PcN8NQ8HDZjY7qcl6FINam46t6QvZSRbbiTIUtH+HZMs6xp7T9+IDLd3TdgCnd5xcOZukEyxvDRqMJiHv5apS/w8srNsGTclY/nEva8MQOB7Ioh3tTMNIWPfQRFGH4Y+VLuLsABahC761BE5d3B4hEPovaWlfDzZ+K5Wx8smqmLYCYCi7r1qXsv1zahXEWC4LN2/MM0HuwE+BjBbXSxbuqawnXcHZ7tnluZvmqfyQtT82Q3dMR5eHFKc1HUX5zkJLF08aVhMZy6oXfdEi4IvC2vzRDWvd/HhKZV6y52zMkBzuMcoLyfQf6dfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5475.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(82960400001)(83380400001)(450100002)(31696002)(36756003)(38100700002)(66946007)(66556008)(66476007)(508600001)(316002)(5660300002)(8936002)(86362001)(8676002)(31686004)(4326008)(2906002)(6666004)(53546011)(6512007)(26005)(6506007)(186003)(6486002)(2616005)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0svVXgyd3F6aXd1REpReWt4TldCTXBDTWtnWEx3Vkk3ZWl3eEdxMmgva2Zl?=
 =?utf-8?B?L2FiT3JNbVpJR0NQTjFIbHNlMVhNcWFmN29WOTFzTHIwYzUzUktGcDlsR01P?=
 =?utf-8?B?R3V2L05XaVFPcGRmVkZackF0VXJpbG9NT1NiVmVlZkt3U1FSMVJ4L3c2dHdx?=
 =?utf-8?B?ejlHZlh6T1VaWU4xR2VZQzN5WUNiVTdMbWluQThNb29zczRHaGMvMjgxNjVN?=
 =?utf-8?B?VjcxMzZ5WWx0dy9aRUs4Qmc3dFZrTXM4MVFwVlhON3I2d0RtRk5Kalo5M2xM?=
 =?utf-8?B?WG4xNklYYlg1TGtTZFdzY3BSQ2ZBTkV6SkRhQWx1dGJGRnBQaU0rSFBtTmsv?=
 =?utf-8?B?RmFnbWNZd2tCY2RURUhBRyswTXdtM1lyd1ZaRG8rTUpPVWc0VStWUDJodlhL?=
 =?utf-8?B?U0w0azM3SWhjOVVXekk2R0g0WVVXQUZSUyswalAxSGVJbi9aMUhLVUU0eVIy?=
 =?utf-8?B?bmthdmcxTmROSVV0NExXaUd5UFlxRFA2V240dFY2VU1MMEVLd0dMVW1ZcVE4?=
 =?utf-8?B?djZRLzJVVDVUVi9INFp5QjVodEg1RjNqNjdnd0IxQmlHMFlvN3AzZ1ZFbFht?=
 =?utf-8?B?YjliK1hVZkRJTkdlU1RlZTdQYlNrMTQzM2tOd2tBYkljUnlKZjV1bWpOVVl6?=
 =?utf-8?B?UUtVUDhaaThpekpnOVNDZDRnUlltSUY1TVBvc05wV1NCV3FEc0VHVHJkRmVw?=
 =?utf-8?B?TnFqZnlET3pZVDRTOHk5alAvTjFjMURDeUtzNHFyVWJRNnZ3TTFOTVBmWG42?=
 =?utf-8?B?NTJzNHF6dGFmcEJiU2NIYVJQZXZWaFZSaEpUR3EyNWtIRUY5dzY5ZHJDVmZz?=
 =?utf-8?B?QzlkSk0xZmlOdXhTSjNoOVl5UU9TaEliVzNMb2VEaVdsM2NqWSt3OTMvTm5T?=
 =?utf-8?B?QkVKa3NseFcyNVVGN3NhL0ZXclNPSk1rdVpKNW5CVVA5QVlqZVZmclVFMmMy?=
 =?utf-8?B?a1J6WFk2cnAvbnNVTXpBQ25VZUx3MmVvcUxEZzJJbXE2R1B3dkxlUVk2NkNW?=
 =?utf-8?B?UGp1N2l4UDkyL0FJMnp6KzlPM0FoRHJzWm1hTndTMHgwMVlBbFJCcTZ4bHoz?=
 =?utf-8?B?Z2xBTHV3ZkVIWWc1OG8yZ0ZJOXlzb1pjNDNnMEtkOHRCa3lCSGFHa3lVSk5G?=
 =?utf-8?B?clBFM0dvQm5YZXNEWElxK0o0bFBLU3JoMGcvMS9LQk5vOFd3N2dhaWE3NlpV?=
 =?utf-8?B?bXZyQjZZU2RUMy9HZHFOeUYyZ2ltWjhUb25iaTZJZWZZR1VFTERVbm42amh0?=
 =?utf-8?B?V3JGS1VUcjhnTHpWamw5aFNnQThmb3M4a1B6TndiSEwrL0pibGF6dnFZSUVs?=
 =?utf-8?B?YU1xMUpmN0VNMnF1UTVLMVl4WVMvYnVuUmYxdTFoeXV2eWs5ajE5SVJvYXox?=
 =?utf-8?B?ZXNxdUxpYUE2RDZOKzMrbHZVNkhKYytCUm5uTmV4Z3RaK3haaytiTURSTUl0?=
 =?utf-8?B?TkZsOFp0bUxyOStsc1ZoVzVEUlBJN0lVTDFQb3J6RUN0eCt6OFBuSnNMZ1Uz?=
 =?utf-8?B?azZPQS9OMzAwcHlTcS9mQ1lvOWRPZ043UC91TVBNd2J6U3lPOGdYYVVhMktJ?=
 =?utf-8?B?ZmMrUzdyQkZEWEt2cm1ETkEzbnMzQkJjbjR0cGNaTjJMalBCTFVNTmhDSnJI?=
 =?utf-8?B?djg1U09GazlUcldpaHhqTXdrSnJYTkNrcDBMQzNpcnZvWWpxZ2p4TWNKNjEv?=
 =?utf-8?B?QnZ0NWZhUFFvbFBJc1VjTHhDUjhuNW54SWg4VVV5S3VNNTAvZXlqUzBOSHZp?=
 =?utf-8?B?a0VHNER4VDlaeEZKY2dra2R2YlJBbWNuTWhnYWk0Y21KV3Q1UHRtNG1NNmdq?=
 =?utf-8?B?UjB2T2tyV1dna3pwNzNXZm5HSVQwY3Bubzk2dGlnc2RjNm9EZzNqMnZFVTBS?=
 =?utf-8?B?WE04SXZNeHEyMjdPZk5FUExXbmhLVnM0c0Nxek1MYlIrR0tDek1HZ3lCTlNC?=
 =?utf-8?B?MVpIblRkQ0NqN3JNcW40NjlhZ25OeDdaSVVwd3phalVRUXU5NUI0SHI3c0Jt?=
 =?utf-8?B?eGgzUHVmeWowU2tkMEVJZkVxUUFGenVnU2k0MndaTktMVE1ReUVmbmRWQXlj?=
 =?utf-8?B?SzF0K0l3SzZGTVZBN3VCcUpsVEVJdFhzdzVaZkxISjRXYTRMdmtnUWQyYjJx?=
 =?utf-8?B?VjMzUjFTazJXVzJ0Mk02R2FWdGNRMndsUUYza3BQbG0yTzNXWDdZd2xYL1R2?=
 =?utf-8?B?bXBRQVFvSWM5R3JRZzZvdVg1TFhYdFl2ZFFueGNvNHNUamM1YncwN1lRckZo?=
 =?utf-8?B?WSsvYTk2OEUxR29DNE10SnF1TmlBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e7d6c1-1518-4380-e1c9-08d9f3237b74
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5475.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 21:13:17.2484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x1aQhqSfpJzs4Q6mvTS2i5jY9QdYpIxf8Yb6HWnFy6JKNzTqG7pT9CaWhzae+6J74rrPmFJyjC7r9HXIUm6DwQsahA87+LZWcB5xL4QFJUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4834
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/17/2022 3:52 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The LRC descriptor pool is going away. So, stop using it as a check for
> context registration, use the GuC id instead (being the thing that
> actually gets registered with the GuC).
>
> Also, rename the set/clear/query helper functions for context id
> mappings to better reflect their purpose and to differentiate from
> other registration related helper functions.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 69 ++++++++++---------
>   1 file changed, 38 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index b3a429a92c0d..7fb889e14995 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -514,31 +514,20 @@ static inline bool guc_submission_initialized(struct intel_guc *guc)
>   	return !!guc->lrc_desc_pool_vaddr;
>   }
>   
> -static inline void reset_lrc_desc(struct intel_guc *guc, u32 id)
> +static inline void _reset_lrc_desc(struct intel_guc *guc, u32 id)
>   {
> -	if (likely(guc_submission_initialized(guc))) {
> -		struct guc_lrc_desc *desc = __get_lrc_desc(guc, id);
> -		unsigned long flags;
> -
> -		memset(desc, 0, sizeof(*desc));
> +	struct guc_lrc_desc *desc = __get_lrc_desc(guc, id);
>   
> -		/*
> -		 * xarray API doesn't have xa_erase_irqsave wrapper, so calling
> -		 * the lower level functions directly.
> -		 */
> -		xa_lock_irqsave(&guc->context_lookup, flags);
> -		__xa_erase(&guc->context_lookup, id);
> -		xa_unlock_irqrestore(&guc->context_lookup, flags);
> -	}
> +	memset(desc, 0, sizeof(*desc));
>   }
>   
> -static inline bool lrc_desc_registered(struct intel_guc *guc, u32 id)
> +static inline bool ctx_id_mapped(struct intel_guc *guc, u32 id)
>   {
>   	return __get_context(guc, id);
>   }
>   
> -static inline void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
> -					   struct intel_context *ce)
> +static inline void set_ctx_id_mapping(struct intel_guc *guc, u32 id,
> +				      struct intel_context *ce)
>   {
>   	unsigned long flags;
>   
> @@ -551,6 +540,24 @@ static inline void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
>   	xa_unlock_irqrestore(&guc->context_lookup, flags);
>   }
>   
> +static inline void clr_ctx_id_mapping(struct intel_guc *guc, u32 id)
> +{
> +	unsigned long flags;
> +
> +	if (unlikely(!guc_submission_initialized(guc)))
> +		return;
> +
> +	_reset_lrc_desc(guc, id);
> +
> +	/*
> +	 * xarray API doesn't have xa_erase_irqsave wrapper, so calling
> +	 * the lower level functions directly.
> +	 */
> +	xa_lock_irqsave(&guc->context_lookup, flags);
> +	__xa_erase(&guc->context_lookup, id);
> +	xa_unlock_irqrestore(&guc->context_lookup, flags);
> +}
> +
>   static void decr_outstanding_submission_g2h(struct intel_guc *guc)
>   {
>   	if (atomic_dec_and_test(&guc->outstanding_submission_g2h))
> @@ -795,7 +802,7 @@ static int __guc_wq_item_append(struct i915_request *rq)
>   	GEM_BUG_ON(!atomic_read(&ce->guc_id.ref));
>   	GEM_BUG_ON(context_guc_id_invalid(ce));
>   	GEM_BUG_ON(context_wait_for_deregister_to_register(ce));
> -	GEM_BUG_ON(!lrc_desc_registered(ce_to_guc(ce), ce->guc_id.id));
> +	GEM_BUG_ON(!ctx_id_mapped(ce_to_guc(ce), ce->guc_id.id));
>   
>   	/* Insert NOOP if this work queue item will wrap the tail pointer. */
>   	if (wqi_size > wq_space_until_wrap(ce)) {
> @@ -923,7 +930,7 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
>   	if (submit) {
>   		struct intel_context *ce = request_to_scheduling_context(last);
>   
> -		if (unlikely(!lrc_desc_registered(guc, ce->guc_id.id) &&
> +		if (unlikely(!ctx_id_mapped(guc, ce->guc_id.id) &&
>   			     !intel_context_is_banned(ce))) {
>   			ret = guc_lrc_desc_pin(ce, false);
>   			if (unlikely(ret == -EPIPE)) {
> @@ -1897,7 +1904,7 @@ static bool need_tasklet(struct intel_guc *guc, struct i915_request *rq)
>   
>   	return submission_disabled(guc) || guc->stalled_request ||
>   		!i915_sched_engine_is_empty(sched_engine) ||
> -		!lrc_desc_registered(guc, ce->guc_id.id);
> +		!ctx_id_mapped(guc, ce->guc_id.id);
>   }
>   
>   static void guc_submit_request(struct i915_request *rq)
> @@ -1954,7 +1961,7 @@ static void __release_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   		else
>   			ida_simple_remove(&guc->submission_state.guc_ids,
>   					  ce->guc_id.id);
> -		reset_lrc_desc(guc, ce->guc_id.id);
> +		clr_ctx_id_mapping(guc, ce->guc_id.id);
>   		set_context_guc_id_invalid(ce);
>   	}
>   	if (!list_empty(&ce->guc_id.link))
> @@ -2250,10 +2257,10 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   	GEM_BUG_ON(i915_gem_object_is_lmem(guc->ct.vma->obj) !=
>   		   i915_gem_object_is_lmem(ce->ring->vma->obj));
>   
> -	context_registered = lrc_desc_registered(guc, desc_idx);
> +	context_registered = ctx_id_mapped(guc, desc_idx);
>   
> -	reset_lrc_desc(guc, desc_idx);
> -	set_lrc_desc_registered(guc, desc_idx, ce);
> +	clr_ctx_id_mapping(guc, desc_idx);
> +	set_ctx_id_mapping(guc, desc_idx, ce);
>   
>   	desc = __get_lrc_desc(guc, desc_idx);
>   	desc->engine_class = engine_class_to_guc_class(engine->class);
> @@ -2324,7 +2331,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   		}
>   		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   		if (unlikely(disabled)) {
> -			reset_lrc_desc(guc, desc_idx);
> +			clr_ctx_id_mapping(guc, desc_idx);
>   			return 0;	/* Will get registered later */
>   		}
>   
> @@ -2340,9 +2347,9 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   		with_intel_runtime_pm(runtime_pm, wakeref)
>   			ret = register_context(ce, loop);
>   		if (unlikely(ret == -EBUSY)) {
> -			reset_lrc_desc(guc, desc_idx);
> +			clr_ctx_id_mapping(guc, desc_idx);
>   		} else if (unlikely(ret == -ENODEV)) {
> -			reset_lrc_desc(guc, desc_idx);
> +			clr_ctx_id_mapping(guc, desc_idx);
>   			ret = 0;	/* Will get registered later */
>   		}
>   	}
> @@ -2529,7 +2536,7 @@ static bool context_cant_unblock(struct intel_context *ce)
>   
>   	return (ce->guc_state.sched_state & SCHED_STATE_NO_UNBLOCK) ||
>   		context_guc_id_invalid(ce) ||
> -		!lrc_desc_registered(ce_to_guc(ce), ce->guc_id.id) ||
> +		!ctx_id_mapped(ce_to_guc(ce), ce->guc_id.id) ||
>   		!intel_context_is_pinned(ce);
>   }
>   
> @@ -2699,7 +2706,7 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
>   	bool disabled;
>   
>   	GEM_BUG_ON(!intel_gt_pm_is_awake(gt));
> -	GEM_BUG_ON(!lrc_desc_registered(guc, ce->guc_id.id));
> +	GEM_BUG_ON(!ctx_id_mapped(guc, ce->guc_id.id));
>   	GEM_BUG_ON(ce != __get_context(guc, ce->guc_id.id));
>   	GEM_BUG_ON(context_enabled(ce));
>   
> @@ -2816,7 +2823,7 @@ static void guc_context_destroy(struct kref *kref)
>   	 */
>   	spin_lock_irqsave(&guc->submission_state.lock, flags);
>   	destroy = submission_disabled(guc) || context_guc_id_invalid(ce) ||
> -		!lrc_desc_registered(guc, ce->guc_id.id);
> +		!ctx_id_mapped(guc, ce->guc_id.id);
>   	if (likely(!destroy)) {
>   		if (!list_empty(&ce->guc_id.link))
>   			list_del_init(&ce->guc_id.link);
> @@ -3059,7 +3066,7 @@ static void guc_signal_context_fence(struct intel_context *ce)
>   static bool context_needs_register(struct intel_context *ce, bool new_guc_id)
>   {
>   	return (new_guc_id || test_bit(CONTEXT_LRCA_DIRTY, &ce->flags) ||
> -		!lrc_desc_registered(ce_to_guc(ce), ce->guc_id.id)) &&
> +		!ctx_id_mapped(ce_to_guc(ce), ce->guc_id.id)) &&
>   		!submission_disabled(ce_to_guc(ce));
>   }
>   

