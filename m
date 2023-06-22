Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F7373A4FF
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 17:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518E210E076;
	Thu, 22 Jun 2023 15:30:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5BD10E076;
 Thu, 22 Jun 2023 15:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687447806; x=1718983806;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=guOtHImgXPHNBfqVRpp5dqmEf3IYz1DbQszoBboJI48=;
 b=MZSHbhCuB8TNkuBbR7tfwa+w8wsEslJTVAzjOcOzjdHQH1vbIOAQdSPh
 nFHta3/LlQnSFeuClWVkFcBxJ3o8raqJ/0poK/ktLfMGp4i+p0C9Nqfqs
 m6zxuOKIRdd0q/4raQvuZt1pEQF0g9eBW3LHGmxFeIPcGE9BOdH/vrebW
 B0MVA+Zbc2Q7dKEg7zBa7GYd0gG253nn+MguapSeFrv5qjJIFMsH+jarF
 DSn6xwYtqKY/q3DZ0yQNWhg9mlfIykd3Tyu4DHfjiWY0k2NrVl2UfvEhG
 TilLQi025YO3gp7A25tzqLp89JxmDi1czdOikGInfsWpyiD+j/iLow8+8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="390286116"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; d="scan'208";a="390286116"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 08:30:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="889087526"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; d="scan'208";a="889087526"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 22 Jun 2023 08:30:02 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 22 Jun 2023 08:30:01 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 22 Jun 2023 08:30:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 22 Jun 2023 08:30:00 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 22 Jun 2023 08:29:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQljcZiqHm49MqJnYhFzyqOUwjSGrMjBbrQCNIrGN8JvJsmUwFj/ZT0ja9ISW0pTxn8qTJQaJRWe0zhpTTjFGqEHvKFQAyyjexJdgqIDDlhJgduMcInO5Nz2OEFvldQm+LzTNV9GwQov56rgICiXmLTd38dgFPMjdu+HhEZA3Jh+hVVbMhxG1ZXAgY4AGroIKIOFDv2xGkTijZ5aeRIHaz6y+wwkkwwDRIfHtw0mV4enBGekNcuTS11NO8rM8oykIAX4wPX7vwgHsSf/2SnluSftJYzFlStWcYXOqmKRO1NbKG8Uo5WYOIy8LztHenw/6tLL3L2YDSTZRSXPOS81cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rEpZgwl5FkQ6/aa9YCqxH8Wm1gHY0nqxu+jVpOCWfbU=;
 b=B/4er4nv3/wliV+GM2QNe1iPx9TxE+Lei9Vwg6SfMKOqVWFWM5aOaNVMR67cwc5XYKD4/Lskpr3QbiQKn4Ed4J1zvFTVB5OzA4HQhG6ygAR3YS6biW/aFTDNlmUQq3mRqaU3pI4kTDdk1cGoHVgxTMRmXFU/qIw3ucgH4yEvqQk7LhmXgvC7SAK/o4Z+iEjb9nVt4yVM/hZoWhq7AIbvWOQlgCgCJkL7KWVJ+1s4LHIjtPh6O5huNS45DzGufwMNdskKO0OfixjxXO2HhOHiq44PSXhlOcWDEu1xNLq5gW1kA086BAsfXZ5W0Fdqkk3N9SUlfCKbeVQjBJ76DOQYbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2622.namprd11.prod.outlook.com (2603:10b6:805:57::31)
 by MN2PR11MB4614.namprd11.prod.outlook.com (2603:10b6:208:268::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 15:29:56 +0000
Received: from SN6PR11MB2622.namprd11.prod.outlook.com
 ([fe80::91eb:a6da:c4ea:2571]) by SN6PR11MB2622.namprd11.prod.outlook.com
 ([fe80::91eb:a6da:c4ea:2571%4]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 15:29:56 +0000
Message-ID: <ff5de822-d6c3-8337-6920-7e0e1536f349@intel.com>
Date: Thu, 22 Jun 2023 11:29:50 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/i915/gt: Remove incorrect hard coded cache coherrency
 setting
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20230622152644.169400-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20230622152644.169400-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0089.namprd04.prod.outlook.com
 (2603:10b6:303:6b::34) To SN6PR11MB2622.namprd11.prod.outlook.com
 (2603:10b6:805:57::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2622:EE_|MN2PR11MB4614:EE_
X-MS-Office365-Filtering-Correlation-Id: 75acaefa-49bb-4566-324d-08db733587fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2lrmSxTp8ku3a9rTPUuZEvVnHlSZHSvxefhTfIMl8wGCUeZmrsni0DLbXpjsehMB+cbyTb5H4TAvWrEE0fVcLQR2+xkqmfTDEpHt4UikWBFWXSBJWE5ALtJO2e6r2UMapK3hrHYHW/rfZ2eo4ZeobBI/4e7wVTk7CUJgkF6g3vv5F/naYeBUPp+EgtTNPJMNF374OHfYDyzkl7bjKYo/VQHFOuWgFCQbHzSZq8iAVLP31vv3Yfm4v8xbkLrXZ4WBjF7bLHPNHWWyr008mCXxDmeS8Rgirjpfuu9jTG2fJc6o+DfeApg8JvKlGk/YdRjUNiq/5evNvfhjkOoaGCn7mi+f7Byr6D2h1K/9du8E+5aAe2dFn5L/mf5FSz/GgOYesISZe50X2gYV+LYG8rfZSjQaf9ZT54uy1hp1lT28P62xis9e6zCQnyaBOnMTex9X9FXYZpTXLNIu8W4cB02lzTjLAOWvhv4D248jjWy/4mYSJWwrV0tJYzKEW20yekSCE/HQGRtvE5bkT7hbJJMJYdrM7ZLm/56TAcQZ+srxmTaQHY+/WsoyxMdLO5BJLanZFf+wZ58jFlE/MigEz5lZJKuMj2aEBbt5l2MClST63FA2+AVZu8Mw0YL75kD5i7rY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2622.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199021)(6512007)(4326008)(6666004)(966005)(82960400001)(26005)(186003)(36756003)(2906002)(31686004)(31696002)(86362001)(2616005)(316002)(8936002)(66946007)(66476007)(66556008)(41300700001)(5660300002)(478600001)(53546011)(6486002)(6506007)(83380400001)(8676002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjNPVGM0T0NLVkZwMHpwRTNUZEV2MloyOWUxRFd4bHBCQXpTbDhCZHZtWm9B?=
 =?utf-8?B?VmVJR3RFUTNZUHVzaTlobXA1dkJCbzc1SFE5SWQwSVdsOUhFQUtpVk9BTnJI?=
 =?utf-8?B?TUwxdTdtOEw1KzhjS2c4cFlWZFpKR1ZURjlxTUhyRkNsdzVJbjNJZ0N4ZDkx?=
 =?utf-8?B?bitEY1B2WDZwUzNJcWtleXhNZ0U5Zy9pNXNhd3ZaUHE3cVlTZjFQUUpjeHpp?=
 =?utf-8?B?M0JBN1BIdW9KRjVYd3VLcWRWQkN2TVg3UzRXYnRoT2xVcDdoaUNpbEYrT2hP?=
 =?utf-8?B?V2g5MGQwWndCWEU5cmN2ODZuL05IWDhpUFk5NXZKSkE5WWZvUkdhOVBiNXVk?=
 =?utf-8?B?bnpQYUpBOGVTajJUNzE4cDE3Z3hoaFQyZGpPK0RrSXR6UEY5aTVBeXo5MkV4?=
 =?utf-8?B?YUUyc1pqRWM3NWVIZlN2M2NZMVV3dTdRb0l5eWtSNXc2bzV4UGhndlYyOUti?=
 =?utf-8?B?M1plUlVJclUvVWtZa3pCK1BPOWdobWY3QmdpWWxpVGRmMldQVmptY3ozUlBU?=
 =?utf-8?B?MnJvOXZIOXowL3RuMldUMWJhTGpiM2hFRG4zdHVKeTl0V3UvZXRQOXVWQVlK?=
 =?utf-8?B?VVVhajh2c0tPbWp1RmpZQTJVZlBrazJudXVGRUg2TVorb0VjNVM4M0VWZTh5?=
 =?utf-8?B?TndjSVF5OWUzZFgvSFhvNHZ4WHNsZ1AvV292cHl2N0lzYVZYK0cvU3p0VFpJ?=
 =?utf-8?B?QkVLanF2Nm5YbnBtQlJWYkZWQmVjYU1ta0NLaHRJeS9lbGxBdXVhdjI1TG1C?=
 =?utf-8?B?emc5TitURGYxK1Fvd3J5cDY4VHZsNVlBYllaNHc0UGpJV3dUd2NVUkRMS2ZY?=
 =?utf-8?B?UmNCVWpTVkd0VGRuMWJQVllMNFAzcTF2bHVvVmF2TFcwelVoTzZkNnc1REI5?=
 =?utf-8?B?L3lyZDJ1L0lOckZ5TmNzTU81dDFjZzVubGwxbkdKS3dyc3lPZFNDbUtKZk5w?=
 =?utf-8?B?WEFMU1c3TFZjcm9sVzlTRXdSM1ZqbnRyS3BjQ2R6VHNocWRwM0JsRVlvbktI?=
 =?utf-8?B?YXhaKzNyZWsrUU03VjUzRm5MR1hROVJTa3ExbDNxVXZxS3JQd3NvSWQ0YjUv?=
 =?utf-8?B?TllGK0RrK2dNckpweVg2SkxyUmlodEpGMUJ0QURwbVV4dFJLN0V1UUF0QXh6?=
 =?utf-8?B?QXJWMkMxMEdBNkJsVEpEdllYaDF3SEFmQlQ0Z0p1czl4QU13WHUxUGEra0xx?=
 =?utf-8?B?WjdBakhSSnVvM29XenJmSGRpaDlmWTU0OHV6RVlyaG13RkhmcUJWUTFnQ3JF?=
 =?utf-8?B?TDQ5YnlIM1YwNDlBenlhVTBXeWNRS25Pb00vbXdKaFFoZzkyWUptRHpwNlZ4?=
 =?utf-8?B?R2sxVktmTUtRUE9YQVRIL0RYbWl2YnFFb042T2wrSTNpUmQxRUpGUE00aVVI?=
 =?utf-8?B?c3VyL0tPYVYzNnlIR1NjRzJkN0dpY2JHdFI2b1VMU29HWDRsZjI0elplMTVi?=
 =?utf-8?B?Q3FCd3BzWFEvTWFFT2szU043RmhQNG1PTzNScFhCeVRXdzFzZ3pvampSUS9x?=
 =?utf-8?B?Z0cvSnZuZDVHYVhSdXRhSE54TzdsN0Zjb2FXT3BVYldRRmMwTVB4V21YdU9D?=
 =?utf-8?B?WTlRV0xTRkJRUVB5MC9oSXNpRmdFZEtaYmxicHg3bG9XdHNqaXJueEJZK2Rl?=
 =?utf-8?B?emxpWUtFTUEvWHNJY2hOdEEwVWVWTzlBWDNkbnVoT20wQjhzUC90d3VPUjJp?=
 =?utf-8?B?cWhIdjdSYjlXMk9jTi9CSm9qRkIzNFdqbnlOdFQvWDZmYUg2N0d4WEM4NVpP?=
 =?utf-8?B?c2IxRUpjTzRBbmlhWTZselNTWlNlNnNIdVkzMGdoRXBtT3U4TWxqZnBoQ001?=
 =?utf-8?B?NlFQcWhhQVRWcDhDd1kxazBhdFV6WFZxMmtKQXBNQThvaURCOG9aNzdQbFQ4?=
 =?utf-8?B?cXhMNlBGNTE0TjFQRWhMczBUOU4yZjgwR2RXTjVyVVJXSTdVbkZrWXpGWmho?=
 =?utf-8?B?YVU2dlZ4S3pTbURCTkZkWkp2T1ZEd2xkSDJIQ0J0OXFZaGF1MHB5LzJEcjlM?=
 =?utf-8?B?cXM3UEpwZ3RvaHNaNndrM3VYaFRVdUJTc2xNZDl4UjNwS1hEdlZrWURzVmZJ?=
 =?utf-8?B?SSt4L08wSE9TWWJqMVhLcFpOSEIvUGFmSVV6UHBZTVIrM3Z0T2tCSUg3R1VV?=
 =?utf-8?Q?LuaqXMSDrKhJ/dZk+CReVjUx5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75acaefa-49bb-4566-324d-08db733587fe
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2622.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 15:29:55.7540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: by112mKUeO5APHlxVXz5ZC38/5Yk8TeR33ontQMgtmyF69Dxt/NdoOEZzJcnP/BL05QwNU/R6c/q/TSYZmuPHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4614
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
Cc: Nirmoy Das <nirmoy.das@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Resend to restart the CI,

https://patchwork.freedesktop.org/series/119485/

Was stuck.


Regards,

Zhanjun

On 2023-06-22 11:26 a.m., Zhanjun Dong wrote:
> The previouse i915_gem_object_create_internal already set it with proper
> value before function return. This hard coded setting is incorrect for
> platforms like MTL, thus need to be removed.
>
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_timeline.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c b/drivers/gpu/drm/i915/gt/intel_timeline.c
> index b9640212d659..693d18e14b00 100644
> --- a/drivers/gpu/drm/i915/gt/intel_timeline.c
> +++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
> @@ -26,8 +26,6 @@ static struct i915_vma *hwsp_alloc(struct intel_gt *gt)
>   	if (IS_ERR(obj))
>   		return ERR_CAST(obj);
>   
> -	i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
> -
>   	vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL);
>   	if (IS_ERR(vma))
>   		i915_gem_object_put(obj);
