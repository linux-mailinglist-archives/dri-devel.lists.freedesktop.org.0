Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C90DF7A115F
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 01:01:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2B910E2A4;
	Thu, 14 Sep 2023 23:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5364B10E14D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 23:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694732505; x=1726268505;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ntYH4P5mmYUexOkXm8wBD0Z5zihzGVquGo/ylLpxho0=;
 b=HKdR8sV4oJTy/HC0tTH/y4L4pEHIBBVLJtduK6wLcDVbPX6NAYdqIZJq
 8j+me0BdMU7svmfP1qwsel5JdFLZsZd+z+cJgn24MpHiS9bw9l4am0cOc
 +tbSj3M7ZzmP0EH/Q+SDKLGP4o9Nu0oJsuCqBafWfgkKK77VUTqqh5TKL
 Wrynyy/gbW+QEWTpAo8phF4rnDusLm1/J+koOrU1WyK5WtuwAdhMc2exv
 T2bqOD774fH9QipE1g1bYSA4VH2D5t+KRkH3W55l8xQaQtO+KW4ElD9FU
 /MoLeMo50adMrudGYnk4URzGkw/zVQazS/Ftx9yg6o+bh3dbe5wi7xlfP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="445553138"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; d="scan'208";a="445553138"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 15:51:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="744725624"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; d="scan'208";a="744725624"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Sep 2023 15:51:15 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 15:51:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 15:51:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 14 Sep 2023 15:51:14 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 14 Sep 2023 15:51:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pcl8h942/uRnusMavLOXsXG/U8tKSZFdgAlqcJpTrw36HLO2UI+25CYuxPsVBcItK0QGy92pr1MDbv6etzFx17Y610dhNolvUK+eLvVjdGYZDHFXuLmS9LubGlHnIoh9PPPms24I/Oex7mpfi0jal19NFhXh6oYqjIsu0AEcxmG84ZOq9I0fvRg0IHR8/woIwG5ygkVAVpM0BQWss3RlNaDoYL978J8IZ9uO5gi/3PlCtyQxEPkz+na2l3GOnLj+psjdl/4jAHHdxSzda0Zu7/bd0tALkXSbmO2gi83bPXQFAiWuD1InYiOUZscDYJH3UoXmt52VYQS999pXMZ1jPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B40Ovc0QkO6f5gmp8uIT3q/A3KO9imTnaO+KHsTNLc8=;
 b=BjpscqpTqsbDWVWdpQihMxvLJq89vluAqJk893YNCp/KUYLR2Ho+tfxTbHqvLo12rPxc9lJsnEyIXsOX42Y6tpnrv1D6U0URcn8rbdJMrMacwie5Y2i+jyXZvLgVfklPoEZwWwB6c84U/D0ZdThK18s+QLOCKpBFDmmDjiUzCGzxFyg8uVIPC2qKFbPv4GB0a7NzXmErwXZKsT2ommz33iNOzlTXCrJzXQgVB4b+IKHXtLouV62yTFP+f/rUKMHzv0WglD9cysCHJivRgEK60jT01dJXqi3Jw0N9TkYqQ+OBLwGOYbH1n5ZD/B7RATsFMDvSLtnFDXZzOL/IiFtQ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3398.namprd11.prod.outlook.com (2603:10b6:a03:19::19)
 by MW3PR11MB4682.namprd11.prod.outlook.com (2603:10b6:303:2e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 22:51:10 +0000
Received: from BYAPR11MB3398.namprd11.prod.outlook.com
 ([fe80::110f:4bac:8cd9:c359]) by BYAPR11MB3398.namprd11.prod.outlook.com
 ([fe80::110f:4bac:8cd9:c359%4]) with mapi id 15.20.6792.021; Thu, 14 Sep 2023
 22:51:10 +0000
Message-ID: <d5094217-2bf8-fa9f-6096-ee6d1da5e877@intel.com>
Date: Thu, 14 Sep 2023 15:51:09 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 3/3] drm/i915/lrc: User PXP contexts requires runalone
 bit in lrc
Content-Language: en-US
To: <dri-devel@lists.freedesktop.org>
References: <20230909223848.427849-1-alan.previn.teres.alexis@intel.com>
 <20230909223848.427849-4-alan.previn.teres.alexis@intel.com>
From: "Balasubrawmanian, Vivaik" <vivaik.balasubrawmanian@intel.com>
In-Reply-To: <20230909223848.427849-4-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0062.namprd08.prod.outlook.com
 (2603:10b6:a03:117::39) To BYAPR11MB3398.namprd11.prod.outlook.com
 (2603:10b6:a03:19::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3398:EE_|MW3PR11MB4682:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ce66b51-2393-43a7-681a-08dbb5751728
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R+4TUC4cExyZOc5T3/L+vFh0UEU64hlZ0X1tZJg8Ymcs0yreKHZkxOqeHJDjezAN5zu9d69NyPPP8NdRMU2qckU70aTCCVubQF4US0IkMr91h6gZRxFmgfzlaIvVUVij5zJscyrCWRgSZtgtDNFyksJ06PRVqIpSp775GNdSCzwQO3RM/UXjjcLORDMJTNaACACB4ECV03uwCKj4r6MS9/ajcqGlvq3ghXhC+a51oUW3fLhtpwiaNh2Nk8KeXnpH2+FQmvXEs6mdA+ZUGWgRVPUdls85jVBTSMeqUXW/dIFrgbBQz6w1d/1Bx5LbBf1tvLzRAQzP51Va/ZTmls5wZmCXK7HAnqEXv/s/0g8tHsl4QDLbqcSruYfyaie3jtiUX9RCt+/5Apuc8aFsxumDzDRAJ3j/86dy2nWfPDJF2na6+O5AxD4maFB0LK1i6lixNo3wDeuq8yAZV8f9H0Ra4flBHyqnxGuAHcjGTERD7l3q9J/U/zD85BarDzpdweFzOF97qDu+sXNqXriH0WfFc9lmnmcdWLkUOZyBe6Z5ciTUGUji+X4BnN/LRotAw/pQn90UBB5rCzpOhxFvI4hJDVrEZCqHhKp1kYw3H49HjVBnM0MOAOxgk3CeRJszH8aubNJlbkjhixgqZe4vmisEFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3398.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(376002)(39860400002)(366004)(136003)(451199024)(1800799009)(186009)(31686004)(6506007)(53546011)(6486002)(31696002)(36756003)(86362001)(82960400001)(38100700002)(26005)(2616005)(2906002)(6512007)(83380400001)(478600001)(316002)(5660300002)(41300700001)(8936002)(8676002)(66946007)(6916009)(66476007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGxROWlKejFGcm85dEIyOGhLakRHclRQbDd1c25EenZyZlZwVjhZUEFCVTE4?=
 =?utf-8?B?bHJRbWx4Qmg1MmV0Z0pXWnpIcjJjVjcyVWthd2N4VUgxY3g3WVRxcTlqamh1?=
 =?utf-8?B?V2FoMmtJYXpkYTRUbXVGUkVPUktjTlYzS3dMek5tbjZ3MHVWYzFiWnM2eVRo?=
 =?utf-8?B?UjNvMUkxd0tnT200QUVDVFA4ZE43TmdLMEx6QnVVczl2VlR3TzN2SThuOTQx?=
 =?utf-8?B?ZmJoZXF2RXRHM3FBM2MrZTc0VzcyNWk2QlpLWjI2MXdyVkRTbjl6QklXSTVV?=
 =?utf-8?B?ZkhDT29WRGNmaTdNNGVlM1BMQmhjblFoeEtWeXd4bGg1UUNqWkhHditHdlpF?=
 =?utf-8?B?LzQ1QXpqeUo2VmlNT2lOT3BrSTRBU2NiUG44ZUN0QXhiYWIweFU2YmVFbE5I?=
 =?utf-8?B?eHY1QWRuV1NwTTBZOVplcjVNYis5eEl2V1g4MFBEay9SLzBHR3dLQ21qcWRu?=
 =?utf-8?B?ZzVQRTdSZlF0WUgrQ0lvQXgvVjNpMkxCaGF6b3hPdmsrbnVTcVhyblJPdUJI?=
 =?utf-8?B?V092SHVVVzFXOFBtS2ZpQW5sNWFKLzQyalNweit2YTVKQ213ZkJhM1RxZk1X?=
 =?utf-8?B?SG1aU0ZLZUZHcHZZbCtXeXJxZElKMkFhSG1tTmczUUVkMERIWWlxMk96Z1Nu?=
 =?utf-8?B?KytIVSt2WU1lWWVwWXJ3eVBaRVV4a3llSi9OTGVFY09lVU5WWDNvN0JXVFRw?=
 =?utf-8?B?S0hlVVNNUitITTNwa2pRVnlGdVlveGREWFFxM01Wdm85RkJ5dWc0NnM1ZXFW?=
 =?utf-8?B?VWlINXltSnh4MEhwTENUcU1DYVZXK3dsYmI1NHh2VTdtbTYwbjZBTUJ4YmtF?=
 =?utf-8?B?eFFOMmhRaExoYmtJOWtvUi9oMlhicmo5NExRU0FkVTJ2Rm1SOHNsbGVLRzFT?=
 =?utf-8?B?ZFZMNXJwbHBVWWpzcVJEczhQV2VwTFVnZVdaa3JvdlF3MjlTdjRlVks2VzIw?=
 =?utf-8?B?MCtSL0ZXMlhxN25xSDVZdjRwSmpNd2VOckpRVDE3eUNCejdjcitEREthd0RM?=
 =?utf-8?B?UHc5VTMyLzRPOHlQRkdNWG1qWWlieGp1bzRGR3JuZjhOTm9lRG10NTlOMFZ6?=
 =?utf-8?B?QmY1OGlBa3VkbG5HMWRLbStQdmxta0lVT1N1dlZkd1ZBSXh5VmRrK2t0dnNa?=
 =?utf-8?B?OGorUVlHS2pka2hFV1o1a1B2OW40V2ZXQzZiNXVMRDNXL2UvNWc3UlNkb3lX?=
 =?utf-8?B?N3FrL1hmN2dHMWtOVGxpbGN0V0d4R1hMSUN2QWhsenVFMVU2bDAxcVpzcXV5?=
 =?utf-8?B?SE02YjJZUnJLZmJrYVJsR2xPcUJaeGtHM3ZuQkpGSWc4NnJJYXV5Qk4rL1Vx?=
 =?utf-8?B?UkxQOGszYXVDR1hFangzSHlNeGQwUzJINExoaVpOaGZvQ1VtS291YTB2WjNN?=
 =?utf-8?B?V24yYzgrWTd5MWk4cDBhUUllUnZDQ3pSOStZamcwcEU4WEk2Z1Q5elJDUXRE?=
 =?utf-8?B?NUtlN1JMNnRaQ1Q2ZzVPWGt4dVhiMkRMTkhERm11K1djMnhQMGxsM1hWZG9Q?=
 =?utf-8?B?NnNLREVzS2hRSEYvZjhHeVRaVWhOdVd6bWsrUndKT293YUs0ckFHZGxDOWxG?=
 =?utf-8?B?ZE83RHlqL3ZYV0FGcTNubmZIQ1pySm42VDFrNlYrR2tzaTk0MHJlcjk3WGhD?=
 =?utf-8?B?eFVYdXV6OEJFWEkzalcwS0JyUHduWUFqYm5XUWl4YUFIbFl3Y0RPYjRwK3lI?=
 =?utf-8?B?N3dhWmEwQkUyckZKbXlvZU4zK3o2a1BidVJ2TVFPSHVrdVF2RnpSSjFUdTMr?=
 =?utf-8?B?ZnR2cTJGOW9FWlh4WmJENk5GREdLVzBIK21GTW1SaHVCNmNZdHRjMjhIQ1gz?=
 =?utf-8?B?Ritlb0hNSWpwN3dZOXpJN0pZQTVldFc4VnpVejArM0I5cVJ5czhBQTZjaTNH?=
 =?utf-8?B?NHhZQ1BiNlVwdW5MbW9Da0VGZWN5dVhyRVNmUFJsZ00wMmd2TnM1QjNyYm5N?=
 =?utf-8?B?YzFaVlVTSXg4a3EyYXQ3UmRzODE4UUZsaE56NjlhZjhibi9hQUlqYlFiaGcy?=
 =?utf-8?B?NEJlMjlkUjNlaVVubXN6bjk2enFPaTZLcVN1ZURTLzc4Ulo4SGl4bE9FRHV5?=
 =?utf-8?B?aS9xN25qdmhjKzhkVnZpVW5wRmtIbkYyRDUwbWowQVZ4UVo1Vm9OVUR1S2lN?=
 =?utf-8?B?Vy9rUzJ2bndJNmVPZWtvMWFmMDZsMDQ2MnRHRmp6ZCtSd3RqTVlOZGN6MkJZ?=
 =?utf-8?Q?w1nVNh1vrz7HkfZEHn2Jf00=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce66b51-2393-43a7-681a-08dbb5751728
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3398.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 22:51:10.8655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s4vGEQUSbRU8eZUEksiiyhzzdlmAouCOo5cNAclfZL9MtcwqXMYhwV3mCptof6pU1ifdam6tXA5ewg3MaCvke0NNzKH+VcPzEF5rvIQIXUUbWoh8jsJwuPbC3HqdKdro
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4682
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

On 9/9/2023 3:38 PM, Alan Previn wrote:
> On Meteorlake onwards, HW specs require that all user contexts that
> run on render or compute engines and require PXP must enforce
> run-alone bit in lrc. Add this enforcement for protected contexts.
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_lrc.c | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 967fe4d77a87..3df32177e49e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -845,6 +845,27 @@ lrc_setup_indirect_ctx(u32 *regs,
>   		lrc_ring_indirect_offset_default(engine) << 6;
>   }
>   
> +static bool ctx_needs_runalone(const struct intel_context *ce)
> +{
> +	struct i915_gem_context *gem_ctx;
> +	bool ctx_is_protected = false;
> +
> +	/*
> +	 * On MTL and newer platforms, protected contexts require setting
> +	 * the LRC run-alone bit or else the encryption will not happen.
> +	 */
> +	if (GRAPHICS_VER_FULL(ce->engine->i915) >= IP_VER(12, 70) &&
> +	    (ce->engine->class == COMPUTE_CLASS || ce->engine->class == RENDER_CLASS)) {
> +		rcu_read_lock();
> +		gem_ctx = rcu_dereference(ce->gem_context);
> +		if (gem_ctx)
> +			ctx_is_protected = gem_ctx->uses_protected_content;
> +		rcu_read_unlock();
> +	}
> +
> +	return ctx_is_protected;
> +}
> +
>   static void init_common_regs(u32 * const regs,
>   			     const struct intel_context *ce,
>   			     const struct intel_engine_cs *engine,
> @@ -860,6 +881,8 @@ static void init_common_regs(u32 * const regs,
>   	if (GRAPHICS_VER(engine->i915) < 11)
>   		ctl |= _MASKED_BIT_DISABLE(CTX_CTRL_ENGINE_CTX_SAVE_INHIBIT |
>   					   CTX_CTRL_RS_CTX_ENABLE);
> +	if (ctx_needs_runalone(ce))
> +		ctl |= _MASKED_BIT_ENABLE(BIT(7));
>   	regs[CTX_CONTEXT_CONTROL] = ctl;
>   
>   	regs[CTX_TIMESTAMP] = ce->stats.runtime.last;

Can we please get the bit defined in intel_engine_regs.h with a define 
instead of a number identification?

Review completed conditional to the above fix.

Reviewed-by: Balasubrawmanian, Vivaik 
<vivaik.balasubrawmanian@intel.com> 
<mailto:vivaik.balasubrawmanian@intel.com>

