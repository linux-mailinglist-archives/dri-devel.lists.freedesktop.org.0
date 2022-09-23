Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C92F35E74D9
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 09:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FF910E464;
	Fri, 23 Sep 2022 07:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3BA10E45F;
 Fri, 23 Sep 2022 07:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663918084; x=1695454084;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bnEWS61HFYuSIorndvpclgXCTTBMLavaDD6lAfovueE=;
 b=eQt0wavjmGiH7mMOG4ZfFQ5fHGiN2+cnaZPnTMQn8B/SD0K3fNonQGNW
 vJP6a4zEvXmsRgzruoPz2Tmeykcp0c5iN6oL1cWXbZ5Zf97kuOW9h+blx
 7ukD6yTBMZhNGWShjEFCmgvUizpRzPfZimO0xslXnnECX9ui5RHNVyqUV
 W+znoVXpf0dg5OB4SvVmBOCq4XJpX8gqZ2byEQqMemgtOnxqtlFxNdKlu
 AjyIx7hN2jYUG7vnNhT3c0p8iDiLCq1tYLR+zpHfc3ZYdTSyL172x/Vvf
 +fl0QatMAq4l2sTC32ecERKmPQJjzZ7oygRw4pgy638hkL54fgXv+Wg5j Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="280899687"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="280899687"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 00:28:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="724029533"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 23 Sep 2022 00:28:01 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 00:28:01 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 00:28:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 23 Sep 2022 00:28:00 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 23 Sep 2022 00:28:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PhAayoVufNv9xyKJfLgYR0S5V9YyiG63N2NFghyNYCS//NrYusxkG0PI4Y2HKLAtzItBtz6feK5Qibj1kIbm3STjRE+bOxugmLiKjATxdhj3QGkmHyaHXbLLyrcDhoYJH+vYYW61VfecfDuAePHc6o/cmW1K7EvcK+BSNmZSIeX8p5t7aeTWbxFIOlyL778tPGtn6Au47XzSVnohmzlcKYR++az9raM5gnuYvyw2xU1UFmq30/lAPLBZTDgKvNLYPNeTkWX92IsKQ2NpC/DP4XjU/6rX7sEMeB8MuV6HJRYZIM3ZSI+qnAFD0dgirfTC0CzPG7MUlgNpreRvv4oU3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtjTn4PSA/+lbMRHqF/1tKU/4iZuh1HwIkkHis8Hb2A=;
 b=mmmramBT0o30LLmF1nh3gwum2+Q+Gg9V4r1QuTQ020BNxYEjCncM/WysoAzqZbt7y9mWt2VJzeES1UPnZdxf0nI4eCyVNaoY4RSfC6R0Bcjut0Rq2DdDmJ+anPwfHMko0/v1H3/vPbtrpnEPgeGY6/9TntOnwvEhd0N0TaG6cmzhJNdNeTTPvar2SBPctBdOsv3ec6TvcTUOjqfzULul7mvt/NJF7U/Pj3lLHx1QbVyWlzOoSIRz+MiGxZ94vY7MFlBCcGySG93XwW0LkFteaxzYs8I0Qfp6x9ReCac+M11TMXf+1+9+i8tXQdLwEEsP5zckpfugpM4yXSujptv2bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by MN2PR11MB4552.namprd11.prod.outlook.com (2603:10b6:208:263::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Fri, 23 Sep
 2022 07:27:59 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1f8:fd76:9d4d:71bc]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1f8:fd76:9d4d:71bc%4]) with mapi id 15.20.5654.019; Fri, 23 Sep 2022
 07:27:59 +0000
Message-ID: <1b51233c-6050-5417-0349-fa37a07731d2@intel.com>
Date: Fri, 23 Sep 2022 09:27:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] drm/i915: Improve debug print in vm_fault_ttm
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220922120908.10352-1-nirmoy.das@intel.com>
 <c9e90c5a-eb2d-0414-5b88-9691ba0c02eb@intel.com>
From: "Das, Nirmoy" <nirmoy.das@intel.com>
In-Reply-To: <c9e90c5a-eb2d-0414-5b88-9691ba0c02eb@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0069.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::20) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|MN2PR11MB4552:EE_
X-MS-Office365-Filtering-Correlation-Id: 10a61d44-516d-4792-72a6-08da9d3523f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uuz4IQrrXB0Pt7bDnQniQJrltKua13paqwa+4lQT8pVXHVm9wbhl1/TwvtAS5Ot+qGJAgrZwTbiecXT26CqmiSaRN34OSoeQ9VBvTO0asH7LdtorKFNytnJqGs/9AVYop7I+uhkrDIagaQ4UfYzhXAhRJAHRVowr1vxlpMN+8gIZyr9whQFvJ2v3bCLXTrL9UMvFCvdQi7AhXiD9pJIMmhZ+qOHz5k6xDjkj87c51MKtxFD0mm9ki9zhRRhU31HSRXKqHnfZ4em2cNt4JQTRkhy9jF2/8SJh2ieK1IZs2P4hV/VvHoXLD7s9TyU6JgPyATHR2ggfNx3zb7jsd+gBB9wRgdlX/HU3jTdtai42brUjuUcXjtTfZ12HDR94K8jpKdFrKdG3x1afzhMr8oPzGIXISdmy+TexIxSrxIybvXx5nKfxlbodF1CCPpLeUN5Q/U0bBs1mycn18tz51IXQ5hNA1lY4UFr5ZT1p0a7E1yeOlx2YNSFv6imYhbHHO32LG8p7hT7CnnGKV77/r3n/oLIZ5W0dv4MfeaMGin/92mTfZxM8h7bryyM3bCK0QovURBHyFkr62Y9qt+N9lBBDbeRZXIs1OhlTHe1HZ3CwBZvMYy/U/k9ZovodaVWVf/YDA8DJd2U7xPSKt4QH5KeGroob52I9yJw3BLlg+ie6SBQ+e87UR8jgijFDrlY9Dt9KWzQF4t+r469OssO6N76DO6BDkPO2dR/gF0PyFiOQH7A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(396003)(346002)(39860400002)(376002)(451199015)(66476007)(66556008)(8676002)(6512007)(86362001)(66946007)(4326008)(31696002)(2906002)(8936002)(5660300002)(6666004)(6506007)(53546011)(41300700001)(186003)(2616005)(83380400001)(26005)(316002)(82960400001)(966005)(478600001)(38100700002)(6486002)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3dPL1lYOUlqd1dFdUQ5S2UybStyRVBhMmZrU3YybXYzdXJiWmRqdDF0c2F1?=
 =?utf-8?B?VkNjYmVTbUc1KzhqN1FjUEtPcGtxdXNIWDJ0anBETWJDR2srQVNNdXdZSjZG?=
 =?utf-8?B?RXRyL0RBRGVJaVZ3T05waWJ3cXJmVTFwVDAwZ0Nxa3BQOUs2Nm9jaVcyRFZF?=
 =?utf-8?B?bXV6L1NjaUhGVk1oOXk1bHNSV0UwZ3c3eitiV09mTGNVK0orVUFqT3U1ZXFq?=
 =?utf-8?B?dWEyc0p3MDZMNVFORVpqV3lYcHFvVWFBbi9QODA4YnlOYmg0Y3lZbzJ4Wk1Z?=
 =?utf-8?B?T0dJNjA5S2xlU21GK2VnZ3JyQlFOcnRNeFU4Y3ZWTXZ4anUyVUkxSmw0OER3?=
 =?utf-8?B?TjRHeXFEQTZaaHhjTldibUp6WlBmNGl5ekZZeWRoNk1EVWxUTldZYVJFeWs4?=
 =?utf-8?B?QVZjMk1lSDQvS0E4bnhOOXhnbk1TRGFxMWVUMzNDZjl2WGNZYjFPZ1FGK0h0?=
 =?utf-8?B?R0Y3eFcyUldWdEE0QW5EVnM3dkI0R3ZlYlkrME5VZHZzZVBsVHlpNTNlRWhh?=
 =?utf-8?B?TFBGcEhhd3ROR1FoUnU1T2l1SGhjenJtY2RnV3d5M25sU3lzaUU3b2M2UE1j?=
 =?utf-8?B?YjQ5UVJCd2gwaUgzUit3ay9HNWFuaC9yeHlZcVNXV1hNVVF0TlNzMTNqdW1k?=
 =?utf-8?B?TDRuOXIzRlBXeTdTRU5meG1QOHRNYnZ6aENKUk91VzBRdEEvcHFndUNtTGw2?=
 =?utf-8?B?bm1ZRlNJV3YwODcrekg0SDl4ZWJrN1o4LzA5VExMMnEzRjJYMGRUQ0J0TlVn?=
 =?utf-8?B?dThHcnI2SE12RE5FQ3M4ZkRjUCttblByR21HVlBaZmlBUWdXUjREZkNNVlBs?=
 =?utf-8?B?SWdrWFBOY3dzMnBPaldCVDE1RXh4MWxvOXgwQ0JsMXphYUlSSUp1TWs2SmV3?=
 =?utf-8?B?dEFGS2FiL1hQSWJDZWlWV0JzRThZQU5sTVJRWkcvY0ZRQ2VUSjQvQ2xBSFlK?=
 =?utf-8?B?ZURDSk1mKzBYaXRjYTFEWlRFVUFKL3p1UTZ6a0g3OURhMTU3R1JUR1FBYlVZ?=
 =?utf-8?B?V1ZzUFluSlVIaVMrQUtjVklwQm9UbXVjdG1uRUp4TVdDRU0yTXFkbkc2QS93?=
 =?utf-8?B?amxJbFdiUmV1UHZrRFMyWk9UNks5cGFEelhwMDlCR29mL05lUW1NU3FFY0Fj?=
 =?utf-8?B?b0h4TEVUV3BaOWlVZjgrOExoUkpWVkpNM2k1TnhtRURmMTdGUy90Q0JnbDhS?=
 =?utf-8?B?ZjN2dGYvVWYydGltR3lzZlYwU2dhNkhqRzZTM3AxMUhqRVNKeHluYWFVOHpl?=
 =?utf-8?B?SWNJaGRZL0Q5M1pxSnBMZ29ZVWhPc21XUENqd2w1S1pBMlN1aFBCT1RGaGM5?=
 =?utf-8?B?Q3pIcDk2YkZDTE1yaHJpSEtPNUlBWC9vUzdqWEc2TE4vcklxK2VDeHhDWW9t?=
 =?utf-8?B?TWNYbWMzektjMlVIaklhVE1yenVkdmtjSE1kYXZnamxGczBEY1k3MXRHTGt1?=
 =?utf-8?B?WGRzQ1VsWkJyNEJaRkcxV0Z6djFVVnROTm1VdE1DQkR5UFprVWUrNlYyUlph?=
 =?utf-8?B?K1FicS9iYlZwN3lpcy9QWmxvK0szNDIwVk4rcjkzd3diSzMrZDZhRUsvc1Bl?=
 =?utf-8?B?dWU1QjdqUmZ0cmlkUEFlWUxEYkNHKzhLYnBRZDd5TG9YbVdqcWRZN3hZeWJH?=
 =?utf-8?B?N3MyNUlvUnZXYWtRL09RWkY5UEdPQU1FSW1jZHNwQkM2V29HM3orREdEYUp2?=
 =?utf-8?B?SXY5YXBEUmJsMllLUTBCNlI3YmltR1FkUzhkemtGenJkVmRWU1ZJUWdkRGpQ?=
 =?utf-8?B?a242U3ZjTy9FTFRVTkVnaUZob3dKbGlRalBsMFVidko1U0M1NEFIcW44Vm8z?=
 =?utf-8?B?UE9LR0doaHFkTTJBTHY4bTlMaEpUR1p0MFBiQlpoc3ZlRnorU1hPNlNwUmU1?=
 =?utf-8?B?VlJXWW8zbzNtR0tidlNoaGtJckJoZTBsTzZjOFFKSCtQa2pEUHBEM1RoRnBo?=
 =?utf-8?B?VndBV0xObUNoUG9QQ3dUb2huQUxNalZSejJHOW9QL3FwWWNTOEZ1aWgwU05t?=
 =?utf-8?B?ZDNYaG1FMENPTktmV3BiNHdhT2FVRnB6Mmg2a2xkajJGY0R3UDQ5SnNSb2M5?=
 =?utf-8?B?TisxSnh5WloxZmNUQ3hUZWVqcUZTZkZIc2g0YlJTRjdIcG05TXBicnBBK1lm?=
 =?utf-8?Q?tyd4CzdAYpScYYMiT/vyNb3vR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a61d44-516d-4792-72a6-08da9d3523f7
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 07:27:59.0780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LEtOsyxiOiHS7Y/GYZqXvAshwNBEvIFtXYyBqKHn9/ivyl5bYU9XxJeMELYMeFbDEvL1LqiSQsXZFGNtPpWPgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4552
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/22/2022 6:38 PM, Matthew Auld wrote:
> On 22/09/2022 13:09, Nirmoy Das wrote:
>> Print the error code returned by __i915_ttm_migrate()
>> for better debuggability.
>>
>> References: https://gitlab.freedesktop.org/drm/intel/-/issues/6889
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> index e3fc38dd5db0..9619c0fe1025 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> @@ -1034,7 +1034,7 @@ static vm_fault_t vm_fault_ttm(struct vm_fault 
>> *vmf)
>>           }
>>             if (err) {
>> -            drm_dbg(dev, "Unable to make resource CPU accessible\n");
>> +            drm_dbg(dev, "Unable to make resource CPU accessible(err 
>> = %pe)\n", err);
>
> Yeah, looks useful. I think for that bug the object is just too large 
> for the mappable part of lmem, so this just gives -2big or similar on 
> small-bar systems. I presume that the test needs to be updated to 
> account for the cpu_size or so.


Yeah, can't think of any other case. The test need to be updated, going 
to send out igt fixes for this.

>
> With the kernel test robot warning fixed:
> Acked-by: Matthew Auld <matthew.auld@intel.com>


Thanks, I will resend a updated one.

>
> I looked at the GEM_BUG_ON(rq->reserved_space > ring->space), and I 
> think the issue is maybe with emit_pte() using the ring->space to 
> manually figure out the number of dwords it can emit (instead of the 
> usual ring_begin()), which I guess works, but if we are unlucky and 
> get interrupted (like with a very well timed sigbus here), while 
> waiting for more ring space and end up bailing early, we might have 
> trampled over the reserved_space when submitting the request. I guess 
> normally the next ring_begin() would take care of the reserved_space, 
> like when constructing the actual copy packet.


I am not so familiar with the code but sounds logical.


Nirmoy

>
>> dma_resv_unlock(bo->base.resv);
>>               ret = VM_FAULT_SIGBUS;
>>               goto out_rpm;
