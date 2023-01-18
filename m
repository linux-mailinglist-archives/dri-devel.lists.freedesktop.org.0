Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7646717AB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 10:28:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5994F10E1E9;
	Wed, 18 Jan 2023 09:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DAEC10E1E9;
 Wed, 18 Jan 2023 09:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674034081; x=1705570081;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/tJLohkfTxad/0inkmMrzqsu0HgHsDmnx/e8YDAonMg=;
 b=Cmab90JevRTv/pTC2+kAb0G+sagA7Lsr66UCFheRCBRgeJutvFY0ro8Y
 308agcskufsn7pfbC6iQxPRSGebnRglcL8GUjyt7VbqHIIEmf41VMckTc
 uhSbI3ZnS6wH/6D94vo5w/D94Y8ZCWOZXb1WHL+Iu2Hk3+ucJdAxVV+Ja
 fA8U5jJxna9unDouOckyC3xNft1qu8c4AYtCFz/KVtyxreaToUjt10Ax0
 TVo03lvVKLCkrjfe9Vo9eSbt6gJIJrxYCsZvFeFu8IR2f2vLZXHcwkJby
 5sK5F6r9pIcBOnnyvb2gdjYzj4doF3YPhgoiJatZIVXxVjikq/SnIy12R w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="312820991"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="312820991"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 01:28:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="659721897"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="659721897"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 18 Jan 2023 01:28:00 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 01:27:59 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 01:27:59 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 01:27:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WYXEz66ekM8HcuWG3ea0g6k1Vvoa1XzfVEAPf8pgAHr8jSbolOEJK34S4c1w69j887SSeBmVYkiFY0bdFj2jQunjQKDu3P87kiRZpIuYa7rWaQXsNdrIAcDJyiz9IzilCwK89S4O2F/f4fv3HMrOGTZkp9HtFVO+RAoL7WpoeP3QS7ADyiSoI08UzRzSVM5jPkqj+IVj2jBnidj9+XFSQ8Sal/SZ9qr86KbjmlWG13Yki3q1VlxyguXcnTxida2l4uSPQH2O7h+nwkvqqGX/eVLrmYsJdUFsqYn0lScXx/4lCQrUOtlqMjwNk691PuWYE/gb4VC1jI464FmImpMQqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8Hq1LcEoBZiMb/J/wOuMAq92HiCVr73DwxWVb/i3l8=;
 b=kiPOqw6xNSCASOb8pO9k+TqBeb5pgNyJ5NJ9QaCn6leAT151UxWdREvZ6f/Gjfj/rrMSFaOjoflIsC3L0BHjPRDf8M504ohPEw/5GjA3yJYfNSe6pyvE3f2gaaCd8PTlYDYW6wlIVwssDWvacqGJDgks9InIIefU7OJUICnmOG19MF23craxG0XleF+NjJdhWTZlPuPP22Ryfsxl6eMkco0v95gnRD4yUoQtfXREMGS6C3fDqVNrjR5K2mpgCRawvoWfiB+FaOkyVarEeicDcxF2mFTui9H3fvLuiW3q+zcbbohrp09bw3U7GtcUklrHmXvLAI6wWu5NzqpqC0ub5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Wed, 18 Jan
 2023 09:27:57 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::755:cc4:8c46:509f]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::755:cc4:8c46:509f%6]) with mapi id 15.20.6002.013; Wed, 18 Jan 2023
 09:27:57 +0000
Message-ID: <1d7f115c-087f-82a8-949d-9fa10341d5e3@intel.com>
Date: Wed, 18 Jan 2023 10:27:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] drm/i915: Fix a memory leak with reused mmap_offset
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230117175236.22317-1-nirmoy.das@intel.com>
 <20230117175236.22317-2-nirmoy.das@intel.com>
 <8e517b87-b626-b488-0daa-88897c9ed90a@linux.intel.com>
From: "Das, Nirmoy" <nirmoy.das@intel.com>
In-Reply-To: <8e517b87-b626-b488-0daa-88897c9ed90a@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::18) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|PH0PR11MB7424:EE_
X-MS-Office365-Filtering-Correlation-Id: e7d1c07c-1def-4835-0df4-08daf9364889
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rzLae0/kyoSCu6eOi6XkqJnkEM5RP0X/xe6TZId2TTh38F8XayqR67NKlU8Rl+SEMGr54gekxcHdNZuI6xVMxZaDC8kdChvDv010OLPCUgFusFoeT+kyQCL0d5vwqIpeBJTR3L5/k3YsabwPeDGBEvvvvu7UeIeon2PqvHW104WZKrxVmCIXxwJ9LMdNExUN/ZbYlY+f1JPyEsxVj9lh4+8GtXaOHEBijV+gQpCzJhnQbIjLA5mRxdFxgRLwnIidtJIow+lPkf3cDlMbcOj1wwPY26p969Jw54BDBKSytX32sWdBJUL1JNlF5qSe4C0Gto1LJfcNDVpspS+rq2g6JMR5TxBIoGhoJvBmD0gMApCEBxjgQIV+/RP48uEpiRp8YaCmLcnzbDi5WwP0AQM+doS3PIVlT54X+mFxW2cBQfMCFRBOzxuKTXIe1N9Og9Ep6bjyOCoRqf1LkKYnXSYCP2ldXjcN1fe8xecdAYoLPPkO/wQkLiFpmnoxNIs9Gv9RAfOer2PizAsL/fWSuuxzK2S9b/baE3ewwILp9eNG1VtwyGGcHm0nK2u4hVmeVVIIvvUXzKPoMokQhiS1730f4S/vmIhyqWrOdGI2Yr0Cbxrtd+QL82V766PjDpcMv/IgeVkAeVX0iwlUz+M9EFBYyFFR5bsFCzETdxdVkHufdrruPzWSkH6S7Uxios4dlQ9o
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(376002)(39860400002)(346002)(136003)(396003)(451199015)(83380400001)(8936002)(5660300002)(41300700001)(4326008)(8676002)(66556008)(66476007)(86362001)(31696002)(2906002)(36756003)(82960400001)(66946007)(38100700002)(6486002)(966005)(2616005)(6666004)(6506007)(53546011)(186003)(478600001)(26005)(6512007)(31686004)(316002)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWpSU042NDNxWnJsL3Rod2tybDV1dXo1VGpKRS9ReUUyTktPSXNEVjVXQnAx?=
 =?utf-8?B?UUFBSE9YTG1CQUJFaloyWnBtVDVZSHIwSUVEdGZGYmRLajd3NFlTNThEek0v?=
 =?utf-8?B?VUZDVFBrWFhDMmtsRjFDVWd6MXlpRlQrY2dFOEVsZk5TbGEwUnJHaU91MERq?=
 =?utf-8?B?UXE3RWUxV1IvTFpoR1hMTkJ1N1RubFBya1M3QVhhNHpPWGFWWXM3K3lsTDlZ?=
 =?utf-8?B?MWx2L2RFNDkyMC90SmtsVTYwODBRK2VzVkRvdkMrSmRDbmZJZ3ZjZ2NLMXZU?=
 =?utf-8?B?V3hzdWx2dG5VUnZwblN4VEtzYkY5WEpXMFZQcG5hRUpkMGpBemhpYU1KUTVK?=
 =?utf-8?B?NWdkMnVTSVNCb2o5SWx4b3hmamo4c3N3ZUZzUkFYY2tPZDN4cW45M0JKdW9y?=
 =?utf-8?B?cFhwQTh4eGxJMVd1Y0NiV0w0RWRWWFNMelV1S1ZadjYremFuMExPVDF2YkYy?=
 =?utf-8?B?QWxMRzEwRm5vR0d2UnA2YnZvaFNOZld6eVh6RmNtQWFLZTZMNHc5TE1YZ01K?=
 =?utf-8?B?ZmZGeVRYYTA5ZjR1VkowclVKWWVRZm8xQWpjcEZVYVE1bGdDenM4M3JGMmpw?=
 =?utf-8?B?bzJVY1B1bFk2bjB1dHE1c0pLTndaVzgxcCsrY3BPMVZoMFZyWFlJakFUMnpM?=
 =?utf-8?B?WlppcDd5RGtwS0ZmUE9WQkZmdVlCQnBHd1ZhKzFnbkRJelQvaU90dDFCVWU3?=
 =?utf-8?B?OVJ1ZHNXODB4NzhSc3gxRjRKc1Zxdjc3M2NmbDhGMG8zSEVqQ0hlOWJRWXhq?=
 =?utf-8?B?WDI1VnpIN29VWjc2eVFYQjlHWGZkTElSTXBKU0N1V1hYeTZMK2x1aEdXN0pa?=
 =?utf-8?B?N3JvSTUrQkdXQlBidDVXWGhIOERxeDlkQXh6dmlYMlozUTFhT0dRaGhET0h0?=
 =?utf-8?B?aTdET29lVkZaZW5pN2RibnVQVXRLd3lqWmNZYnB6UWx4a0RYYXp2NkhRL2Uy?=
 =?utf-8?B?QzVmV2lJOWx0ODNxNnNlSnppL2tJS1JzL1dQS1pjQ0l3UVNwbzdHclFDT29P?=
 =?utf-8?B?Q0M2RG10aTN0SUNnc0VTQUQ3ZmVLZjZucHhINEgwWWFmM0pEQnpKcHhtUFph?=
 =?utf-8?B?MzFFaERyNENXcmVNQmRyNXRvZng2UkkxTmlzaVRocHo3d2pxSDhwZlUzOExW?=
 =?utf-8?B?aW1IZjlybXFrUmRlSDVaUnJ6MzZ4MjNveHVQQjJvTG92V2JKZEhoeFN1bGFU?=
 =?utf-8?B?b040WmZ2VUJWbU5UUkk0clE1cDhFRmo4N0pEcWdNNG15S043WEtNWDRxNEJl?=
 =?utf-8?B?ZkMyNlV2ZFFEQ2VFelptelVpR2w4cFNWR0JYelh0SU5pbGNKZnJVckZITXpy?=
 =?utf-8?B?NEo2dWdtSlY2ZkN2L2U1eFFzSTdmZjBWU3QweDlyaVQwT0FGMnRRRWlyNW1Y?=
 =?utf-8?B?L2JGRHhHQnZiTFJsdkRwWFRySjBSS0F6bFUxK1RmRzAvQ1JMRnFsN2REM2Qw?=
 =?utf-8?B?SkNpYlZZVndybzA2aWthTCtydHgvQXV3MXdDb3NuMWUvOWhyQ1BlVTNqdGRv?=
 =?utf-8?B?ZndUc0ZxYndJRkg1UmdlQ2twc2dtTXVTZzhDRzNQVXJUUFgyTUNxeitteis2?=
 =?utf-8?B?bit3eGV2NU9mcnpRd1BzSWg5T3F4d2Zwb0pzMndlckk5eU5wZm54anBXMUM3?=
 =?utf-8?B?TDl0SmZFc2d4ejN1Ni8xZHZnQ21KUXArZ1phL2hmSndPYWk5YTJFRmR2eUcy?=
 =?utf-8?B?NWJPTit4T25GcEpsalhZMDVKVmJSTW9YL3ZLWEZXbVlIZ05NUFRjRXcxL2sr?=
 =?utf-8?B?K3FPMDRLb2NJTlgxWUtBWjZaYUc4YjVTSjFOL1VJUW1hOHp6ejQrSlo0U0N6?=
 =?utf-8?B?RVlmQkdUaURpVnhOTUhZYkRFMUVUR2RReEpNblQ3TjVVb1V4ZWtWcmR3eGZ6?=
 =?utf-8?B?aVBBMEYrYVlZM0ZTd2ljdmdpanJENkd4SFlGaEZ1Z0Y4N1RiUDlYSzRtSFNG?=
 =?utf-8?B?aE96TWxsMFI3S2Y0SmNPK2NkOFZUSk1DbkxvbTlDWGhTMm5WWWdLbUNBWENW?=
 =?utf-8?B?QWR3RzJQTDd0QmQydHpYVHFtSUVLVjNMeEhVMlJaelJiMkUyak1NbUczN1RO?=
 =?utf-8?B?SnZlOENXYUE1WGRwdFVhZFhjV0ZpdUx0THZseWd5M2NCZVFacWpUb3NWREEz?=
 =?utf-8?Q?HY/+/s76JfYmKSZqq3iFc9ePg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d1c07c-1def-4835-0df4-08daf9364889
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 09:27:57.1056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8d1DVIjpSfFsDwxLieKm8rFYm92Moy576qujbLNj43D/UaB21SNFae37nfnYWthtSTC4xlD/hT78OZn7ddxQtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7424
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

On 1/18/2023 10:19 AM, Tvrtko Ursulin wrote:
>
>
> Hi,
>
> Thanks for working on this, it looks good to me and it aligns with how 
> i915 uses the facility.
>
> Copying Mirsad who reported the issue in case he is still happy to 
> give it a quick test. Mirsad, I don't know if you are subscribed to 
> one of the two mailing lists where series was posted. In case not, you 
> can grab both patches from 
> https://patchwork.freedesktop.org/series/112952/.
>
> Nirmoy - we also have an IGT written by Chuansheng - 
> https://patchwork.freedesktop.org/patch/515720/?series=101035&rev=4. A 
> more generic one could be placed in gem_mmap_offset test but this one 
> works too in my testing and is IMO better than nothing.


This looks good to me. let's get this merge and I can look into 
improving it at later point.

>
> Finally, let me add some tags below:
>
> On 17/01/2023 17:52, Nirmoy Das wrote:
>> drm_vma_node_allow() and drm_vma_node_revoke() should be called in
>> balanced pairs. We call drm_vma_node_allow() once per-file everytime a
>> user calls mmap_offset, but only call drm_vma_node_revoke once per-file
>> on each mmap_offset. As the mmap_offset is reused by the client, the
>> per-file vm_count may remain non-zero and the rbtree leaked.
>>
>> Call drm_vma_node_allow_once() instead to prevent that memory leak.
>>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>
> Fixes: 786555987207 ("drm/i915/gem: Store mmap_offsets in an rbtree 
> rather than a plain list")
> Reported-by: Chuansheng Liu <chuansheng.liu@intel.com>
> Reported-by: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
> Cc: <stable@vger.kernel.org> # v5.7+
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>


Thanks for your review and those extra tags.


Nirmoy

>
> Regards,
>
> Tvrtko
>
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_mman.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> index 4f69bff63068..2aac6bf78740 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> @@ -697,7 +697,7 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
>>       GEM_BUG_ON(lookup_mmo(obj, mmap_type) != mmo);
>>   out:
>>       if (file)
>> -        drm_vma_node_allow(&mmo->vma_node, file);
>> +        drm_vma_node_allow_once(&mmo->vma_node, file);
>>       return mmo;
>>     err:
