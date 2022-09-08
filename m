Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 525785B27ED
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 22:52:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FB210E66D;
	Thu,  8 Sep 2022 20:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C641410E5CF;
 Thu,  8 Sep 2022 20:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662670347; x=1694206347;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=otzQtYeSDebmAhC5Fxb1KyFJ3cefLmR1wemdEMktEuM=;
 b=AbTDksFEAtxPnnYT9RTgx2mXRDb/MIoQGwTQ6mWTJ58Q3kCvzur8d6Q0
 /2YbFywqP1fVDV8ueELlmofyx3EnVFqW0cOcyRmREmADjw7eJjbCnw1qo
 ODsiUT28UDYcbYdIGtDhN7Q4IAOxBRHdzJVrCkKDyCa+crVhhIjKjyUlR
 Tw8E8Qs2lw9MA3xs5wKuqh00NCiQWYklnsFD7LBrP8ksFZ3awCJx1qEos
 aesYx62lAmlJjscEPPT48J/jfMizu4tyaxu2AP8SNlBqX7Y/HCrarZZgH
 FfEJTvAjbTldnhwMiS7LKhQ3E2+1iyHvdA76xE7dm0y53JwB3bfwKmjej A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="383616363"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="383616363"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 13:52:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="645257011"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 08 Sep 2022 13:52:27 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 13:52:26 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 13:52:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 13:52:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 13:52:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gX5SrVtfs43SRZ16dxX0PMUzrkV2D2E58i+Vi74BTu43aQDjlyH+5jkK4rLhrdFGht6s4HWRfuveYOrNPq+VmeN4seLpJYWQBNS1CXjNtR0rZ4t660I8u5hhIZ7nr9RQ47Rb1bitqW289m7LwivgaK/S7sk4pXPPFFJlMJD0lH7WmcnLeORY141332knFRNYSpEiG+qK1AmbOQzum9bpCm9cbGTY5x+DH/es26Jx6eo5pUk0SN/jtKaek6PL/JsNauxY1CT9jveq0SsLUsnTmL6lKU4H6MaUYVFjuTYXOAbYEGlrmQUSEEBZcWUii8DwJGMhh+salLV5aivbI3aVZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvgltIoR4pDblbiaQVqVQMR4LDaU3aYIz5hCL3R92WI=;
 b=CSUuO/moi8Zxusn5WnqSNWz/6YXxRXHjFBHQcdYgZ2e4v62t9wEGIaaRaXRnHW05pG1Zh4KusLxRh/zNlFTBcABgP1RBKPcn7mTvMKntR1nWaZWNtVNsXuINhmmunDs11imCnjU/z5+QDL4OcsmHIGHHJ9IoOtNut0VPv27a7HCRO9D7JDHaynhh8pXEFtbYs2zrPk0gZ219XBnQRdmUrGX0ZalFao+maZPofKx/wJVTRfbe1KDWAaFyAY37Hy74Wj8P/rCECCAvAfJM960vtHnBQ0ReqwOCgAGIg2RiAauUWw8dNokyDEDDf1MG/LISvdj7rXZpRYqNietv4IA3zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 MW4PR11MB7055.namprd11.prod.outlook.com (2603:10b6:303:22b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 8 Sep
 2022 20:52:24 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1%9]) with mapi id 15.20.5588.017; Thu, 8 Sep 2022
 20:52:24 +0000
Message-ID: <d30a1777-b603-4ced-2737-b8a6208f0772@intel.com>
Date: Thu, 8 Sep 2022 13:52:22 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 08/14] drm/i915: Initialize MMIO access for each GT
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220906234934.3655440-1-matthew.d.roper@intel.com>
 <20220906234934.3655440-9-matthew.d.roper@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220906234934.3655440-9-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0067.namprd08.prod.outlook.com
 (2603:10b6:a03:117::44) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcaa0f4f-317d-497c-bc64-08da91dc085c
X-MS-TrafficTypeDiagnostic: MW4PR11MB7055:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: shMG9N35SITuui4um6Gme9Ia9jwPOCE17nf5YlhSfCXY8qL4ewCIaY3ni5HSkHyascBSsbvavUo2joURmGevAnt3OafNh/ZSSbpCv582283LKi1pf/SqOPg9paPfdBlXIcK2bCZ1DysuvJGcYA4VTXh+88Qs4d83vIZIuKjLphx7kGBuS5LsSFs0rnYm2KjIRocrlJO4MpR3cv6+0smpBagP1oieI5ck8RKuv3cyp9IgPLRLHy629XfN2YDHRXmzro87a0wOgx8mB0JhN/xkd+47z12rbUIDgXuGFrEZCjv1q65C1pTtoLZYqGX2Z+f5IR06GDfTIUalKpeZH1ppYokk1Od17stoZNXE+JTZavHyELp4x9f5E6qz3xesS81whXBGGMBJA3sNjzU7vlsUZnUFoVmoIya6kkqjv0w96TpS1nknhu+p7OEfM5LbJVxv2Xx7Y/zewbZKWghQQqi/5OXgTd5vXjbhzQRo7DDKsuWJAhhPYwlSs3FMDrh3uvHvlXjbDqUNZfDwa0QAqs1DTRMJ8Uz2ocRG5lGAf1qvLUnsCFtTiU4jxjSHeD7Dv7m5oTXjRPZRUHAf7+dcD26TLL1Dk2VvT+gd5lsLFKO2/L1CGmdFbn72LRoTnxTl+0KqdPG6GRBtQNvxXKjYwvdTaXAetj0EUJ8LlX/gWZhEnyCs1OJAd3N7SQV/YYvBG+SWsICvJhss2z4ovQft06JcbPWlziuT5wE1mzyv/RjPlXo1K/SA9/KtDmIkzOvjiB4IUUnBoksrHg7/7LiAZRlLaZw4ySRoCcxzxmqeVNHtxhQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(346002)(136003)(366004)(396003)(376002)(36756003)(53546011)(31696002)(86362001)(38100700002)(31686004)(41300700001)(2616005)(6506007)(186003)(26005)(66476007)(6512007)(4326008)(83380400001)(450100002)(316002)(66556008)(6486002)(8676002)(478600001)(8936002)(66946007)(5660300002)(2906002)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXdzZGM3SWhGT2t1SjZ2dEtJdHg5TTlkN2R5cU5hL2JYcXJ5WjN5RmZ5VndV?=
 =?utf-8?B?ZjdWLy8rYkFZWDRPODZDd0Jvb2lEZFEzdVl3VnIxTmQvNWo5V2NZdGMvME9y?=
 =?utf-8?B?RG1TTEJJVGdxbVpLL2hSR2ZtK0pkMkEzWGsrQ0wyekJMMTErMUV3a3lialBi?=
 =?utf-8?B?aitMalVWdC9iQnl4anZWWmR0cms4QnJITFp6Q2toTnhNWm84MkVvZTVZd3Z4?=
 =?utf-8?B?aW1mQnlTOG9yS2tBbUh2Z0xSVDFOS3Y2VkZkWGhCVUhBNXQrU29VWWR5dUN6?=
 =?utf-8?B?QlB5NzNZbW5FcmlVcUFoVnZaZWtxSndsR0U1cmF3YlhBOXJYdWNlQTRQVEtE?=
 =?utf-8?B?SmZmY2xZcXB6QmZ6M0hYdFZZM09mMlpGeG1PbGtvWHpCYlo4Q1VIVWQrNk04?=
 =?utf-8?B?enJnUyt3VEFJQWQrNHp5MnBEcTk0a0J0TzdObFRkSSthRDlSdkNadUh4US9i?=
 =?utf-8?B?TE1wRk8zZ2xRRkhDTlNnUGI1bGU4RmpYT0pYNzc4WWw3Z1F3QjZXMGxHRHE5?=
 =?utf-8?B?NEYycU4rUG8yMzdCZ1ZUVXYyWUNGV0JUQXZHY1gycEpjQ2xkalR3Q2xmR1pq?=
 =?utf-8?B?RXVsOW5CR2dUSjQ4dGMxcVFLLzRRYnhWNy9keVFtUHpENUtkVSt0ZHhadjIr?=
 =?utf-8?B?YWlHd21hZG1lcWxNbTc2SFlOTFNOcUhTUzVVK2ppSUxaNFNzalVMa1VLc2RF?=
 =?utf-8?B?aHFCTE1DV01EYjJNbEpnVzBmSm1EY05QN1BTME9RQjAvREZUK25jVzNVNnE2?=
 =?utf-8?B?c3VkUzVoS2VwV0I3TXlXV1FicnRXa29nYnVGUElOWHphOHRhWWFJSG5oZ0pE?=
 =?utf-8?B?OEJPUlZHK2FUcjBTcTd0WkJtcm9ta1FmMDEzSXZ6anQvWjVEWnlCZ3BXUTR0?=
 =?utf-8?B?bzZ4TEF6MHRON0dzN29mdlhXNlJTVTJIZXdvZm5pUG1TR25pUkJhdGhvS2xX?=
 =?utf-8?B?eDFqclV5MEF0OEk0TjM5SUk0d2l0ZWJMMU5wazhvMXJhVE9uWGkzMlZ3MGN3?=
 =?utf-8?B?OC91NFRORUYxb1NlUVh2Zm83L20wdVRGYXhWc0tSSU5ndU55NFRQRFNVcWdh?=
 =?utf-8?B?eUs4MFNKcUNNWWx2RG15VUtYY2lzTjBVc09zbS9GM2lMempseWk1MzE0VDBF?=
 =?utf-8?B?RG1mOXpTaU15ZHJEZCtrMzlEMllVdVFBYnZTMkI0OEcxNXFwQmRPSllxVlY1?=
 =?utf-8?B?dkZrb0xLdFBvYjAwYmpybStnWFRZdXFMVWRZb3Q1eUkya01kY2wzdnlGZW1j?=
 =?utf-8?B?VHFXeXpqNVNIK2Y2a0x4WGRmNU1HZmxna0c4QzM4bVJGMWdUUFRpb2IxRUQr?=
 =?utf-8?B?anFaMmkzR3AwOHZwbmRmQ1R1NmRSMElpVmphTkh5RUtUTGNQK284aE1KUlpT?=
 =?utf-8?B?bExOK0p4ZkY5OGNDTFIyNGhLQlltRCtYZFlsaXp3SGtXSC8rWm9hRmtBTXJu?=
 =?utf-8?B?MFNhSWtMNVZOdUVMVXN4N3pNUnljL1N5QWxiMDd5cmMzQnYzTFIweTYzSnMv?=
 =?utf-8?B?UXJUSmxMUGFJSjRoQ0g4VXhKRHVZU1ZkV1cwY3ZxbS9yM1V0WVdDeXVUdjI4?=
 =?utf-8?B?Qk1pSnJRUm9CQzdOVmdRYU00ei9NNm9FcHNCTllrOUFsN2czWjhQaU14cVhI?=
 =?utf-8?B?ZHZFZmZlWWFvWXFBQzdlaFUzOHhUc1E1R0dpQmhhTEg5T3VKUVNMSHlZN3NU?=
 =?utf-8?B?V0FSRHE0MkxkUStyVnRybEw5cm9WQW9IM3JSbXpWVXBJbXBxZWkzZGh5c0tn?=
 =?utf-8?B?ZVpiWDVkYVViSWF3MHRkTWlORXVVTitJaWlCY3FSSkpSd25sbHhDbzNiMyt5?=
 =?utf-8?B?Y2l3Y3NDOFYxOXpuUE1zc2N1Q3V1VnJ6c2l4c25XTnc2bmdXTjMreVYycUJV?=
 =?utf-8?B?RjlWY3hHVDNSM2F5NlBBaEhNOWtFVTl4M0JnY2FxbVlhbnhabXdDRms1bHBP?=
 =?utf-8?B?VFl3QmNacEtLZTdmTXh4KyszOWhvRklMbTlRZ2E5U1pYV1JzSHlibHVNbGVp?=
 =?utf-8?B?cWlkQ1FvbVdIQWJ0eGFlYlpnU252RHRMNEN6eXlySTAzRHpjQTI2UXMvdUsv?=
 =?utf-8?B?Q3ErTittL01XdkJBanNpUXNvRjFyOGtJbVZOai9jY3FZUk5HUjJkMFFzNEVO?=
 =?utf-8?B?T1dYMnBNNHdQN2IxUDVtdTRWN2tQWGxTdHBZTGF5NldpUWJJUFNwY09nTFNV?=
 =?utf-8?Q?/OWWzz6T0YVWFIWy44zOX3Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcaa0f4f-317d-497c-bc64-08da91dc085c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 20:52:24.6724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UOn/ZFyBYWVSm8MbufarMOLtC6h2qA6lhM66cdJAuQiqKt7LJ2fv5jinE41Ctk1CMFlp6ttVzkAeLqF/IMHZuopf9aT5XqZUe+ymmpopD+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7055
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/6/2022 4:49 PM, Matt Roper wrote:
> In a multi-GT system we need to initialize MMIO access for each GT, not
> just the primary GT.
>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_driver.c  | 27 ++++++++++++++++++---------
>   drivers/gpu/drm/i915/intel_uncore.c |  5 ++++-
>   drivers/gpu/drm/i915/intel_uncore.h |  3 ++-
>   3 files changed, 24 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index 1f46dd1ffaf7..bb9ba1aed1bb 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -431,7 +431,8 @@ static void i915_driver_late_release(struct drm_i915_private *dev_priv)
>    */
>   static int i915_driver_mmio_probe(struct drm_i915_private *dev_priv)
>   {
> -	int ret;
> +	struct intel_gt *gt;
> +	int ret, i;
>   
>   	if (i915_inject_probe_failure(dev_priv))
>   		return -ENODEV;
> @@ -440,17 +441,27 @@ static int i915_driver_mmio_probe(struct drm_i915_private *dev_priv)
>   	if (ret < 0)
>   		return ret;
>   
> -	ret = intel_uncore_init_mmio(&dev_priv->uncore);
> -	if (ret)
> -		return ret;
> +	for_each_gt(gt, dev_priv, i) {
> +		ret = intel_uncore_init_mmio(gt->uncore);
> +		if (ret)
> +			return ret;
> +
> +		ret = drmm_add_action_or_reset(&dev_priv->drm,
> +					       intel_uncore_fini_mmio,
> +					       gt->uncore);
> +		if (ret)
> +			return ret;
> +	}
>   
>   	/* Try to make sure MCHBAR is enabled before poking at it */
>   	intel_setup_mchbar(dev_priv);
>   	intel_device_info_runtime_init(dev_priv);
>   
> -	ret = intel_gt_init_mmio(to_gt(dev_priv));
> -	if (ret)
> -		goto err_uncore;
> +	for_each_gt(gt, dev_priv, i) {
> +		ret = intel_gt_init_mmio(gt);
> +		if (ret)
> +			goto err_uncore;
> +	}
>   
>   	/* As early as possible, scrub existing GPU state before clobbering */
>   	sanitize_gpu(dev_priv);
> @@ -459,7 +470,6 @@ static int i915_driver_mmio_probe(struct drm_i915_private *dev_priv)
>   
>   err_uncore:
>   	intel_teardown_mchbar(dev_priv);
> -	intel_uncore_fini_mmio(&dev_priv->uncore);
>   
>   	return ret;
>   }
> @@ -471,7 +481,6 @@ static int i915_driver_mmio_probe(struct drm_i915_private *dev_priv)
>   static void i915_driver_mmio_release(struct drm_i915_private *dev_priv)
>   {
>   	intel_teardown_mchbar(dev_priv);
> -	intel_uncore_fini_mmio(&dev_priv->uncore);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index 2a32f8a65f34..452b3a31e965 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -2455,8 +2455,11 @@ void intel_uncore_prune_engine_fw_domains(struct intel_uncore *uncore,
>   	}
>   }
>   
> -void intel_uncore_fini_mmio(struct intel_uncore *uncore)
> +/* Called via drm-managed action */
> +void intel_uncore_fini_mmio(struct drm_device *dev, void *data)
>   {
> +	struct intel_uncore *uncore = data;
> +
>   	if (intel_uncore_has_forcewake(uncore)) {
>   		iosf_mbi_punit_acquire();
>   		iosf_mbi_unregister_pmic_bus_access_notifier_unlocked(
> diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
> index 6100d0f4498a..4acb78a03233 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.h
> +++ b/drivers/gpu/drm/i915/intel_uncore.h
> @@ -33,6 +33,7 @@
>   
>   #include "i915_reg_defs.h"
>   
> +struct drm_device;
>   struct drm_i915_private;
>   struct intel_runtime_pm;
>   struct intel_uncore;
> @@ -220,7 +221,7 @@ void intel_uncore_prune_engine_fw_domains(struct intel_uncore *uncore,
>   bool intel_uncore_unclaimed_mmio(struct intel_uncore *uncore);
>   bool intel_uncore_arm_unclaimed_mmio_detection(struct intel_uncore *uncore);
>   void intel_uncore_cleanup_mmio(struct intel_uncore *uncore);
> -void intel_uncore_fini_mmio(struct intel_uncore *uncore);
> +void intel_uncore_fini_mmio(struct drm_device *dev, void *data);
>   void intel_uncore_suspend(struct intel_uncore *uncore);
>   void intel_uncore_resume_early(struct intel_uncore *uncore);
>   void intel_uncore_runtime_resume(struct intel_uncore *uncore);

