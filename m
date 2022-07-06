Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77449568C2D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 17:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4B010E28A;
	Wed,  6 Jul 2022 15:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A0610E442;
 Wed,  6 Jul 2022 15:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657119871; x=1688655871;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1MQtHrN4FaYIDst2OchnN8gLEaEoJrfjnSI8/Rud2h4=;
 b=UXtGEcWNLIxC7shswbOQgZ3+FyU+50f97+13oyFEVPUN3iPxEHZ5SY7w
 I1qTE/ZmDmpZH5hq1GYv081Gkv6/powGOH0Tfe4NuzPJ7ugDWUFfpQxJ3
 3jhkSvtF5znKQpASIW0m9VQge6pfm/Xa3tiTLkqH9jVe/zXvtc2XQOq+i
 jdyZlUH2MkndaYgSgu7Ivd0BsAc9XGv55LMIlkqTG0tKcTFvOOhWs3bSs
 NbiS/TaagZHVcsSSVlQ/mnrQLqbAzyMib+UrtYSSwAq0aHn2VRoa2A6v8
 j7qDrrXseTsJ5FiBJI99qb6wDocsLyw54bgrPsKSmvI1NIsWe07zGqXg8 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="282521006"
X-IronPort-AV: E=Sophos;i="5.92,250,1650956400"; d="scan'208";a="282521006"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 08:04:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,250,1650956400"; d="scan'208";a="593364465"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 06 Jul 2022 08:04:30 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 6 Jul 2022 08:04:29 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 6 Jul 2022 08:04:29 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 6 Jul 2022 08:04:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTswQoWf4QNcXZVam8C9Mikh7qsCxpuuO5I5oJUJOuYQAmLTNEA/jwMHBEKjTG8bUYRJUGPh5bPXof6YaOmW/Z6vMCu/4WmXFe5U8KuFf3kNTbTBDR+1RzXIdboxfhWivJchT+z3mTZBAyjw3Ddmnju2+h9GicC/cOYsGTZJGpBdyjB4fTdaCKYzhNZiHKU5smwOD/dWCHFx28TRmHC1zbLYj50psD9c6051S5NV156BOglkV6eO9qTCbmSWJaGOdTCQgBtSF47dxb1YQ8Pa5LX1xkbzvVNfjeJ2Otchi7YEyVhKJCChshl5+7oAFAVO2V1ZVJjgbrQcp8FBDC7cAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJSsdwSpCUVMLH1IX86c9L437UJmPHrDmnG9ppiHYWc=;
 b=hRWHCj+MvuZ8nBNn6dekehBUjy+VGDDKGMwOO5YAszEEc+q2uGlZnD49tpIYkhpaObcT0fx6G3G8rhCvsnfDBcZhpskSykg/hCyQzVY2abszAq79Ix7HltVdAVmLqjNW2/rrTVQwtem+kclItVYd+QQhWNQqRAU6BM4swhuZ9z5Sz2SOx3qSQnNZfe7p3gXxqz5cAR79ciY+rnYYhopPXQmjSOY8NK2ZDJs/WdV4v/wv10PGyHUaYeQaiUGApPruGdxbnuANTVZdOG0GGbLyZ8n5H0Ptc8MCUkJYd4wMbi9Qu2RtaVTmQCaWQGzsR23QrS7DFvM8BQ6rb2GHrg+HZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by MN2PR11MB4158.namprd11.prod.outlook.com (2603:10b6:208:155::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 6 Jul
 2022 15:04:27 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::49da:18ae:2975:c398]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::49da:18ae:2975:c398%9]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 15:04:27 +0000
Message-ID: <2da2f40a-cf5e-ed3d-fee7-877910f377bb@intel.com>
Date: Wed, 6 Jul 2022 18:04:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 1/7] drm: Move and add a few utility macros into drm
 util header
Content-Language: en-US
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
References: <20220705122455.3866745-1-gwan-gyeong.mun@intel.com>
 <20220705122455.3866745-2-gwan-gyeong.mun@intel.com>
 <20220705162320.3f64e203@maurocar-mobl2>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20220705162320.3f64e203@maurocar-mobl2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0185.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::6) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b15d0c7c-e59a-4405-19e9-08da5f60d1b7
X-MS-TrafficTypeDiagnostic: MN2PR11MB4158:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E6wx61DfnR8pGDpsoNi4jjmz1xpaMEBDW9aTYPennKgrAHbtIYmDwD/6vAQnVy1ewIqfF3INZQjOGPWnORji4Zsyu2VkIW9MmmhOokM/YE4YTSTFgPmFdiH48fLtKL0FSG4BLaN1Q88GSVVYLYl+Ff6d7HpVjnswaaFdHAu+VN34DwiXro1FbXcjxn3WY/FWS7JRE5XaXn2BzGPWz14XIgmIUKHwNxoXNMzE+Kc+HA8ZaZgjIfro038689MO/m8GBmazHzsK37iCgCE19NSpAMmTUuFwwy9R6k9Da7B0OwAOsL95sHfuLvhjNi6NoujZ6BWjlZYfccI9mKFOB8FojshahHXOBAr0We6O756GiXX3//WvMjpCAeDDfRzQFvG0o546/5aVdrEjvuIZ/0sIOVHH0hEOf0Id2g+3lAbR2EdwAT6pucA6er794L97S4g/0AcU0o0pR6nHdlVwj+k14LIBfQ1I9LS5LvyMMhMVhvbWBHTmKD9JY4PlGoIx3oRQ0FxOub2zfMQdm19POHrvySVhTaBby2AqOelaOApHmUPG7DhU9lfwmMuJaRZ0G6FWRi53v9qja9UJ5F6OqguHoRVtdmU9f5tc21nTBlMKwfsD1+CHUUAS/5B7KjzI+W08tK42X/oMY0syFaRgOyTK98G/hWIbwXzbbS8n5yEXsbhD0XhI/ZXJZFRP8VBO7IftrKrOAtBE7OcQ8G9dx1vRVT3V7LFp/PAFg/13snQta7LiQs7bWk1M2FBvaWlrv/36UXZJT+C4ocPDtzllgB1JdQO8BVgd8KCIhtZzH15SnOweRUBJluMhOesmj0JSOm07jcVr0doJ/mtSXGNz0qrjJl/gzKPkg/KV51ciLrFT5uk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(346002)(376002)(39860400002)(396003)(366004)(86362001)(31696002)(38100700002)(82960400001)(5660300002)(478600001)(6486002)(2906002)(41300700001)(6666004)(316002)(8936002)(66476007)(66556008)(4326008)(66946007)(8676002)(186003)(6916009)(31686004)(26005)(6506007)(53546011)(83380400001)(36756003)(6512007)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEROUXR6THFaOWowTHBRSUJxbHpyT2lRT1cyd05QUVcySStFTUNlR0ljZXRo?=
 =?utf-8?B?REVraDdiNCtJdFJ3QW9KclIxYmpKM2lqYnNqQ21NVkpacU9palFtQUcxZUUv?=
 =?utf-8?B?Mm1YK3FpdUw3MDhkTmx3VitJMmhDQzQ5M1VvTWJ3dXU3QTBhR1pNZ25KMmE1?=
 =?utf-8?B?c1kySHYrZndRYlllSHRYK25UWmQzTFhlN1pVaGcyZDJBdVdVSkNJUzJvdTFm?=
 =?utf-8?B?S21hMWxRUFlhaXlUbHR2aE1MSFNJTHk2RXIzVXdkd2tOVEx0UFBwWTZIZE9O?=
 =?utf-8?B?YTVpdDRXeW43aGc5cU0zNkU3WWIwZkhSUUpjYTNkSjU2bFE1SUY4Y1NLVGVX?=
 =?utf-8?B?RlRiTGJWQXhrV0ZmeEwydWEvdW9IdmtLVk12L3FMUFgrZnFEQmZ1OHBFazA5?=
 =?utf-8?B?alJpUW9BUjNVUXg0M1ExeFFaWk40K1NnM2wrNU9nK25DRXkzUi96allYZGQ1?=
 =?utf-8?B?VjRpeStKYktJU1FCMThYdEtqT3VoNHNKd09KS3BJakdhb0RkR04zc2Fud2Zk?=
 =?utf-8?B?T1RCVERMQkVRTGJqdnV3MEw3V0NaMW1Ud0ZySWxqbmh0bTllaXZ6V1NRNXEx?=
 =?utf-8?B?VW5tWlBFWDRBNXVKR3dNelRJSzFxMzBGNHBRQmtRY25TUVlwblpEYitPN3dq?=
 =?utf-8?B?SDBWYWt2eUN6cEZISFV5cDFPRWczOUN0dVgrdUVwZHFqcC9ha3Z6dnMyaTVy?=
 =?utf-8?B?U1JuK2NFRmhweXFjL3lMR2pqaldHbWZmN1N2bEZCa3BqWldKTDdjMlN0UDBI?=
 =?utf-8?B?R1k2VktjUXRyZC9JNldnVllRSmlmYVFaU01JVjJhUDhNYXd4S2RNcmNra2Mz?=
 =?utf-8?B?VVVYcWdaYng1QzdQeTFVQTFDM3ZwRHBKQ1FxaFlqUzZVK1Y1eWw1RElnZmhN?=
 =?utf-8?B?aHBvb1lsdkp4aXNxbE9LWnkxVlprV1VMeDJIN29pWExsNzlEWFJadkIyWVYv?=
 =?utf-8?B?UmVGamowMmFmS3JZR0pvWUw0dkM5NDRNU3dDbmF5ZFdqZU5zQmR1eC9PY0ZM?=
 =?utf-8?B?YkFZTEFkeVFZckZsQmtsVUl5V0gvOVJKWnVmTG9RQnc4V0gxZk5ZQkgvOUEy?=
 =?utf-8?B?VXRZNldoaEwxUVFobXVGVDdFQ0RTUzVwU0RydWZNRXdMMVNZWWIrRVRoVGZ4?=
 =?utf-8?B?VjArK3N4NFRSZUhZcEcvL2hiZEdOOG0yVnJpdS8zUjQyaitvdlE0RHhRZWNq?=
 =?utf-8?B?MVZnbk04WVR2MEppdGQrc0pjUStUNWluM3JKQlg4ZnJOMThIYWFabE5rM0cv?=
 =?utf-8?B?d3NRWDllKzY0NlhhK2hPUXJ5Uk1FdnlKTzAvTE1kMFFGYWlGNHNqdWVaZXpO?=
 =?utf-8?B?S1VQTDd3VXdPUDk3UXdvWGRvM1VtcjdsdmVSUlgyZWt3Z0o0ejd3Vkh1VURU?=
 =?utf-8?B?aGlxdnBUalMvUlBvOFlKdmI3eGs1ZHRFRUdzekZvMmJLVUdneUlVRkxzSUd0?=
 =?utf-8?B?VEVxZFZCSW1rNU8wOEpvSUNWVVR2Z0M3OUZLd3ozZTd3YUV0SExxWWRhYzRa?=
 =?utf-8?B?QjZITWlCNXB5dFZHSHpaam1SRE5lb1pPZG80SDZDcEFqZCtxYWlEeHJFR3dP?=
 =?utf-8?B?UERUalJmL1NFV21Ra0hjeU9tU29sMDdIOFhPZkUzdkdwV2pNVTdyaVoxaWdi?=
 =?utf-8?B?d0JDeXBoK1lwUWhaQnFYbDA1YlcrS3lHWXpQRnczcDg2VkVxd2ZRayt1TVNO?=
 =?utf-8?B?NGJyQy9ab21mSDRwYkUybWRKclZPUTFEZm5nWUVFck9hSUxENWEyQi9PVTVm?=
 =?utf-8?B?aVNZMHJuSURPYTJkZVVsSDhMMHk5QU9QNWxva2dlTSs0anYxY1l1QmZRdk53?=
 =?utf-8?B?K2Z2ZDNOUWJXVTVEcmZmWFRFb3NXdzljb3NzMCtqQ0cwdjJCR0dhai9aT0Yw?=
 =?utf-8?B?UDZqem1BRFFjSUJEQlFBbzRXZDRxdmpCV1pYcnppa3Y5S2F0eUxVYlZ0dlRo?=
 =?utf-8?B?Q2pkKy9UOGcvcHRyYTBiVjBLeWRMRE9TL0pTMGNRd0J1empwUVFBc1IxTHls?=
 =?utf-8?B?b3lKMUFZd29qQnNlSGd0VHpHazRGSGFrNTlLcytZaHJHWS9ySmFjWElwMTFP?=
 =?utf-8?B?amJ1V2lLZXQvUEhkSG9UaFEyeEZKMThNa3VQZW95NXhRQzVVZ2dmZ3hHVUtk?=
 =?utf-8?B?dkhQcUVieVFPVjQ0Q0RxY1lMMnJlSHA2WkFyUng3WTUwakFmY2YzcFZVdkhV?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b15d0c7c-e59a-4405-19e9-08da5f60d1b7
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 15:04:27.2233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DyDQsGuICtspUMs/sTvn/cbMwMH2R+PVlJ7H/kt14n90z7gv4XVx4N7jycC1MjnITd54hJKvGfjVG45PD5mPRXKq9KdsJgJBa3lS8X6OgxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4158
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
Cc: thomas.hellstrom@linux.intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, airlied@linux.ie, matthew.auld@intel.com,
 nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/5/22 5:23 PM, Mauro Carvalho Chehab wrote:
> On Tue,  5 Jul 2022 15:24:49 +0300
> Gwan-gyeong Mun <gwan-gyeong.mun@intel.com> wrote:
> 
>> It moves overflows_type utility macro into drm util header from i915_utils
>> header. The overflows_type can be used to catch the truncation between data
>> types. And it adds safe_conversion() macro which performs a type conversion
>> (cast) of an source value into a new variable, checking that the
>> destination is large enough to hold the source value.
>> And it adds exact_type and exactly_pgoff_t macro to catch type mis-match
>> while compiling.
>>
>> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> ---
>>   drivers/gpu/drm/i915/i915_utils.h |  5 +--
>>   include/drm/drm_util.h            | 54 +++++++++++++++++++++++++++++++
>>   2 files changed, 55 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
>> index c10d68cdc3ca..345e5b2dc1cd 100644
>> --- a/drivers/gpu/drm/i915/i915_utils.h
>> +++ b/drivers/gpu/drm/i915/i915_utils.h
>> @@ -32,6 +32,7 @@
>>   #include <linux/types.h>
>>   #include <linux/workqueue.h>
>>   #include <linux/sched/clock.h>
>> +#include <drm/drm_util.h>
>>   
>>   #ifdef CONFIG_X86
>>   #include <asm/hypervisor.h>
>> @@ -111,10 +112,6 @@ bool i915_error_injected(void);
>>   #define range_overflows_end_t(type, start, size, max) \
>>   	range_overflows_end((type)(start), (type)(size), (type)(max))
>>   
>> -/* Note we don't consider signbits :| */
>> -#define overflows_type(x, T) \
>> -	(sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T))
>> -
>>   #define ptr_mask_bits(ptr, n) ({					\
>>   	unsigned long __v = (unsigned long)(ptr);			\
>>   	(typeof(ptr))(__v & -BIT(n));					\
>> diff --git a/include/drm/drm_util.h b/include/drm/drm_util.h
>> index 79952d8c4bba..c56230e39e37 100644
>> --- a/include/drm/drm_util.h
>> +++ b/include/drm/drm_util.h
>> @@ -62,6 +62,60 @@
>>    */
>>   #define for_each_if(condition) if (!(condition)) {} else
>>   
>> +/**
>> + * overflows_type - helper for checking the truncation between data types
>> + * @x: Source for overflow type comparison
>> + * @T: Destination for overflow type comparison
>> + *
>> + * It compares the values and size of each data type between the first and
>> + * second argument to check whether truncation can occur when assigning the
>> + * first argument to the variable of the second argument.
>> + * It does't consider signbits.
>> + *
>> + * Returns:
>> + * True if truncation can occur, false otherwise.
>> + */
>> +#define overflows_type(x, T) \
>> +	(sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T))
> 
> As pointed on its description, this macro only works if both types
> are either signed or unsigned. However, the macro itself doesn't check
> it.
> 
> It probably worth adding something there to ensure that both types are
> either signed or unsigned. I would add this ancillary macro probably on
> on a generic kernel header - as this can be useful outside drm:
> 
> 	#define sign_matches(x, y) \
> 	        (!((typeof(x))-1 >= 0) ^ ((typeof(y))-1 >= 0))
> 
> And then include use it at overflows_type:
> 
> 	BUILD_BUG_ON(!sign_matches(x, T))
> 
Hi Mauro, thanks for checking it.

What you commented here (sign_matches macro) is to check whether the 
sign bits of two types are the same,  but the purpose of the 
overflows_type() macro checks overflows while assigning a variable with 
a large data size (BITS_PER_TYPE is large) to a variable with a small 
data size (BITS_PER_TYPE is small).

we can check the additional sign bit by adding sign_matches() to the 
overflows_type() macro, but in the current scenario, it is used only 
when the sign bit is the same.
Should the macro be extended even for cases where the sign bit is 
different in the current state? (If yes, I'll updated it as v3)

In addition, the place where this macro is currently used is only in the 
i915 driver, so it has been moved to the header of the drm subsystem.
IMHO, moving the macro location so that it can be used by multiple 
subsystems of linux would be a good idea when there is a use case for 
this macro. What do you think?

G.G.
>> +
>> +/**
>> + * exact_type - break compile if source type and destination value's type are
>> + * not the same
>> + * @T: Source type
>> + * @n: Destination value
>> + *
>> + * It is a helper macro for a poor man's -Wconversion: only allow variables of
>> + * an exact type. It determines whether the source type and destination value's
>> + * type are the same while compiling, and it breaks compile if two types are
>> + * not the same
>> + */
>> +#define exact_type(T, n) \
>> +	BUILD_BUG_ON(!__builtin_constant_p(n) && !__builtin_types_compatible_p(T, typeof(n)))
>> +
>> +/**
>> + * exactly_pgoff_t - helper to check if the type of a value is pgoff_t
>> + * @n: value to compare pgoff_t type
>> + *
>> + * It breaks compile if the argument value's type is not pgoff_t type.
>> + */
>> +#define exactly_pgoff_t(n) exact_type(pgoff_t, n)
>> +
>> +/*
>> + * safe_conversion - perform a type conversion (cast) of an source value into
>> + * a new variable, checking that the destination is large enough to hold the
>> + * source value.
>> + * @ptr: Destination pointer address
>> + * @value: Source value
>> + *
>> + * Returns:
>> + * If the value would overflow the destination, it returns false.
>> + */
>> +#define safe_conversion(ptr, value) ({ \
>> +	typeof(value) __v = (value); \
>> +	typeof(ptr) __ptr = (ptr); \
>> +	overflows_type(__v, *__ptr) ? 0 : (*__ptr = (typeof(*__ptr))__v), 1; \
>> +})
>> +
>>   /**
>>    * drm_can_sleep - returns true if currently okay to sleep
>>    *
