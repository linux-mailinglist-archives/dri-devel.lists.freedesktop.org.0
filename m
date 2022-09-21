Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2925BF929
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 10:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FB710E8E6;
	Wed, 21 Sep 2022 08:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B310510E8E6;
 Wed, 21 Sep 2022 08:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663748843; x=1695284843;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SxYD9krt6UNAwWPtfgWmT0qmlII2bdDwoOn7UxwIdBw=;
 b=N8gm62xYww/PFkW+yxBuZ8tek4JwvvyKKwh1DqPFz7JMH56NWYfnNSoP
 2eJyXNqVvCg0doR0tRPzwEjnmzoDyZuuTCdiNSsMyncQeNX+LxPkHwshg
 v70g7cWstHiN185dM67XH9PQq3IBOzoWtwskfGRaeZ2qGHxNj6rCLM3hD
 fti1GLlOv6bwxjtNWaAK1h7KarhrYaM78TXmE673RSfEvRfQqMO/wGNiS
 TxSCjEvU9vxGjOETblX9GUzNA9kMDI83TTIhKKovuD1uo/m/l/vKYxh5Y
 IvZpepGBLp2Lt9/1RxyfUrKmHp8qmG3flZiXB1lV898n7s6di2rt5M3px Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="300775831"
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; d="scan'208";a="300775831"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 01:27:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; d="scan'208";a="614718186"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 21 Sep 2022 01:27:21 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 01:27:20 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 01:27:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 21 Sep 2022 01:27:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 21 Sep 2022 01:27:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sfnu1YWgKtZkiQrAFcICspFV2IaYw83LLpxlnif9OAcwHnse7iscFLttlUbqYgdJQtLoCQEqJjdOU/JHppu8OA93I2iISGvSPJTGei91aUOnbG3b5v9OxFNEdw/EjlHokfUcKLfaXzByBCV7b7ls81wRn2/bitnif4mjDQY+mkPfCLC4DKZg9uUBsV8QBiUEYGElAHpartffYnZOn/7ViFo75hssTsezPBVD9KvYe+VtfDX0kZtY7IocnXshAtasIN8kIA7TGlCiOhziboMmYs6Sddm4A8AjHE4jwS257iyR1xWNqYukMG1csSpltBK2UAZ++tmJt3luRffDiUl46g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kw7SUpVu7+1zeueq45sFNbNtnrtw3pxmcbLXWh/Lx7Q=;
 b=L/OfTWhqbEfa1Om3Tyn4Zxq0gpGgS3ojA3I2z4IY0adC2KqRz8dv9MhlbHgZR8KYN7idM5GnLoUmTsBxu2wX4taRERQtNSQ5gjS2wFwmsgO8MvNA6K46WPz+FlHYdKYqZjGUcLZk4mgwkoT7Y0sb1H6Nscq2OqV4iKxEe8JM1QE22kNmWTHgQXlTz7tMG4av/6yCuVAroW72oSWC1qPTf0GQShTecbYsgDCsntV8J7jcofNNJeecelCZ4RYUmLQ8hCh6D6qCGybqpP6s1zP8qc6YJZYowkrKtnuyaGeS44XQZmkl9XI9LPGiiJJvL8Xv+D3e0RqpM8qjbBdaJS37nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by MW4PR11MB6618.namprd11.prod.outlook.com (2603:10b6:303:1ec::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Wed, 21 Sep
 2022 08:27:13 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1f8:fd76:9d4d:71bc]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1f8:fd76:9d4d:71bc%4]) with mapi id 15.20.5654.014; Wed, 21 Sep 2022
 08:27:12 +0000
Message-ID: <02c3f43a-4077-3f0a-526c-cd485a8a8711@intel.com>
Date: Wed, 21 Sep 2022 10:27:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Do not cleanup obj with NULL
 bo->resource
Content-Language: en-US
From: "Das, Nirmoy" <nirmoy.das@intel.com>
To: <intel-gfx@lists.freedesktop.org>
References: <20220920170628.3391-1-nirmoy.das@intel.com>
In-Reply-To: <20220920170628.3391-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0084.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::17) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|MW4PR11MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: f794641b-e43d-4b62-0e5e-08da9bab153f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CosPa/WCZvp8XJ//YEzJ0XSyCLbmQunV7LTxmKYEVAntdf5kn220cwIcmpGpuHEUSnZEnHM3zupKw0y7L0C4rff8oeUjZpPqiZYtib+s/zN+qjWrLx0nCoB/lkba41otHKnM/bVIqVjhfb3RdWYnsbo/UAMBqWclgTIw+wa40aKWIbSxxvwCeZdAWFw0Wqhosx6aJ8ewQBK5As2gO1SBcZhchZX3DiF/vSYn66yTPL/kDZhgCh0tw20kOmyrB5bSO1r2lkTCrdSIZjmETc2EWw2iJGamyop2MyCudCfnGTVJ62BJvwaqapVyJCwdW7Swb0+o8GflUPBHx7LWv/Z2Ao8aF6smYTgbu0lmFxTxt+AdnOlK+9C3gcvAzy3jW9qazI8k+7BGGqmFaLlJG6/Uv0kVMiW6EsZiMLlu+pHfmA9/7jj7FB5GnqNE2gaptzFyRzRz0kqJa58TUjOCeykJJhontBLKMJxiuVTAdQkQ53u/5Dc1112nkfDS126sZ1kLfEEFUvubbj9iv5scUjp5wHqnUfheYol4iW1ohMBtDzf3LqRYu8oOMaavFRkplsjn6e35dssBeVpsxTgL7Sxn5X/go5JITlzGuT0qMwaZ6t4WNVKI2TbyZJbUmX1RgTLbLJnGivC/mbyDkJ8ezyIjvX5yFNBibzgliKWemZ1eK2W8a0yXSZwZoTfHVPIpjUtTdxqXJy5AV0N1K0b50l+puYgUlkMiLt63ZkRGYkhaglw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199015)(6506007)(36756003)(6666004)(6512007)(53546011)(26005)(31686004)(66476007)(66556008)(31696002)(6916009)(4326008)(66946007)(450100002)(8676002)(41300700001)(82960400001)(86362001)(38100700002)(83380400001)(2616005)(186003)(966005)(6486002)(478600001)(2906002)(5660300002)(316002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzNtZmhSVkpZMFhHeHlnSzRPWndVTmNhT3QyblNxdFFUbVAvOVNBM1B1V0M4?=
 =?utf-8?B?THZWUGNCK3MyOXNkSENUUTdneWE4VzJiazNjKzlHTVJxVzY2blFrM0lMOWxN?=
 =?utf-8?B?Z3F4UUpTM25IQ2VVY3FhSFBuYnVvKzNmVmpwdWhqQTUvR1J3cHA5NnRNZUgv?=
 =?utf-8?B?VTQ4VTZGRlhYcUMxdmhyT1BYampqekwxQytLYkZDNE94cmY3T2dUVkdJSm9i?=
 =?utf-8?B?bzYyM3VGY3ordE1XaFFLZUFWRGtVSmdUZGVCWWZhYUdvUFgrOVYwRC9Ua3Bm?=
 =?utf-8?B?RlFHM0dzNUFaU200YnRsUGdBVld2QVYybWFIWHJNMVpLNlNTM3lDY284NC8x?=
 =?utf-8?B?WW8rVWlaNWlGNmUvZHM1UUhtTUpPamxSRlBHR2lwOVZnUTA4WDkvcG1ERGUw?=
 =?utf-8?B?YVBkTGUyRmxzaUw1MlpZRU12cFRxODlTdDZ1K1AwT0dXbWZ6Zjk1ZWVQUlp3?=
 =?utf-8?B?VkhOTkdvSTV2VEVzbWFid1BkcnJxNEpBQjJDMTU0b08vUWJIUjcyM1dISzdS?=
 =?utf-8?B?TTBCaDh3aHRRYzlUOENEd0lpT1JORVl6dStTdHpLSkxZMXZGUWN0Tkl3a0pP?=
 =?utf-8?B?TE1uNjFRSENIbFVkdlRUbjRNdks1cmFscGJqTXlyenZYMFBhWi94d0RLRStE?=
 =?utf-8?B?NXRwMWQrdVZTZ3NVU0VCSXp2cHloUmIxZWttcTFZY3VHb0ZCakJNM2ZqYlpR?=
 =?utf-8?B?NklmOXA2em5pY2RmdzZLb29tbDhUY2h3bThsbE1pcGhyWkc5R2p4U1dmcHIv?=
 =?utf-8?B?UzgwVDVudTB0c3gxVHVCczB5Y2htSEV5T05tS2tubzdNSWNIOHNMcmFlVzdr?=
 =?utf-8?B?MWl2TlpHRVlSUGNDc3htSzBMaTZMUlk3Tlg3QjdTL2hDTDB4VzZJS3BFd3Bz?=
 =?utf-8?B?N0l4c216K3ArdUZPNUZQcmt1ckdNdUxIU3NoNkUyTHZGVERiUWNIV3p2aUxk?=
 =?utf-8?B?R0NhUzRHcjBBUXhhSGhjcTdjb3lpUDJHY3ZOcUhKVkhZR1BBZjdmTTB4enM3?=
 =?utf-8?B?aW1kVGhmQTVwVHNPRW04Q1I5QUN6VzBDNFg4bkFBUlRlU2FOaFNBYldDUzB2?=
 =?utf-8?B?RFl4R0YwUmoyU2d6cEJrbTJjcGF2bUhweVhGd3ltOGVKZ204Zm9kOWFBMDZh?=
 =?utf-8?B?cm9GSzZtUHFCcEFqVk1QT01Vb3ErdXhIdVR5VEhRSXRseHc2MEhrcnpEVEll?=
 =?utf-8?B?eTNNdWcvOUJSWHJsUGp3aXNxaTY2RlRCMkZEZ3JJclVJcEtyWjkyOTVJN2Rh?=
 =?utf-8?B?bkVORUZlMkdLV1Z0bFZXc2tQcTRFMkdpR05VcnI4TCt5YWRZNmtmVlFKN0hj?=
 =?utf-8?B?UkxTTDZqN2FPU0R2aUU2eXU0SUNYNXZhTXgvYW5CaVRzTHV1N1BuUVNFditk?=
 =?utf-8?B?SGIyY0NObGxlb24vcmtmeEFrOEFibmJ5Z0VFSXJHSTlPQVpreTN6SXQwb0dR?=
 =?utf-8?B?Njg4dHkrWXZnbDVGZjh5TCtpZHUrY2NCVW5nbGtOUCtWUE4wVDZVaHFYQWxE?=
 =?utf-8?B?Zk9IMVJoZXlicGtxcGlWS1pkWmVOVzdGV2lwQ1FLVGtiaEs4VUJJT0ZSRUps?=
 =?utf-8?B?dklsZ01IdTQvKzZkd0Y4NDY0WjE4UkZKZnhuaC9aa1hoL1BJckRtSGh5a2tq?=
 =?utf-8?B?a3ltckxoQkRxY291SVlVZmkvU1FEUEgyVkQ4V0MrM3JzdE1CQXdubldUc2J5?=
 =?utf-8?B?b2t0RjRGVGpqY2kzd0l4bmVTbnNXL1BDdUZPZENJWVRHMW5mQTI4c0pva2ow?=
 =?utf-8?B?dXg4ajNiS3RqSmY0a3RQZlQ1L0dSdWZaTXp1NithaC9obDFORTROYzhaSEpT?=
 =?utf-8?B?ZlZ5VnI1OHhQMFMyNFZkVGtYOEhqSTVQUEJ1Zk1TSk92Q05oMWpnbjgwOHBS?=
 =?utf-8?B?eVFQcFRkaTFyZUdSaTFSRU1LY2FVYVprblVVV1YyZU1CNi9yclRER245ZFJH?=
 =?utf-8?B?WExtcGZHMUhoWDhHeFdOdFVTL0NCaFNxaDE0ampGU2dLUm9JRXUxeDVsRTI4?=
 =?utf-8?B?d21qbWRBb1JVaTNGbnRSRUh6Y3dFUHo2T29jZHBpK3FjM2xoTkQzdXcvRDAr?=
 =?utf-8?B?ajZhbHVLb3RvczNXTzR1MkxZbFpGb2oyeFdrZnpxZmJoQTFIWEd3MkdwVUdB?=
 =?utf-8?Q?uP7JPIheSrtM8KcRA1vJQQVU6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f794641b-e43d-4b62-0e5e-08da9bab153f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 08:27:12.7325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DoExhEGfV6rN3UZLdaK5AR/cCygyZ2ulpi9pXIzGHPaSOB5luLu+Q9CXqGH6BYaTuVfBOerCdMING6G2Xicd1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6618
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
Cc: matthew.auld@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matt

On 9/20/2022 7:06 PM, Nirmoy Das wrote:
> For delayed BO release i915_ttm_delete_mem_notify()
> gets called twice, once with proper bo->resource and
> another time with NULL. We shouldn't do anything for
> the 2nd time as we already cleanedup the obj once.
>
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/6850


Please add the below Fixes before merging, I missed that.

Fixes: ad74457a6b5a96 ("drm/i915/dgfx: Release mmap on rpm suspend")

Thanks,
Nirmoy

> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 0544b0a4a43a..e3fc38dd5db0 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -511,7 +511,7 @@ static void i915_ttm_delete_mem_notify(struct ttm_buffer_object *bo)
>   	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>   	intel_wakeref_t wakeref = 0;
>   
> -	if (likely(obj)) {
> +	if (bo->resource && likely(obj)) {
>   		/* ttm_bo_release() already has dma_resv_lock */
>   		if (i915_ttm_cpu_maps_iomem(bo->resource))
>   			wakeref = intel_runtime_pm_get(&to_i915(obj->base.dev)->runtime_pm);
