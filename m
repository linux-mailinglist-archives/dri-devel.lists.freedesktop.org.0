Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 849144E2F42
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 18:42:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC92B10E314;
	Mon, 21 Mar 2022 17:42:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497E110E2D7;
 Mon, 21 Mar 2022 17:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647884530; x=1679420530;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SxcGbjvz31C1Tg5Z29bVBk5HcniYhYWpJEBEX+HLSVQ=;
 b=Jn+gxOC15HoqiQXk5CBxsPRoLH3Y8HOWPeFB5Ol3hjRwW3KXWByZNX8A
 FNw93BsToz6aobZgm7Y796R5K7UoYi3TQXdHR73OjQzvVH5aEnXGp8NI6
 1ZoNX3wEzdAzcAlQDFTceE0nXP0h0OHRFH/UdyB2VzyqX2zU+O4EqFxAS
 ZKkUKv7Tvqp2mdHvSAjUJbr0JOHoQEciqUhBCKBuozGH24maRwwSkh+fp
 kwLTrxGjxC4ZSKn7tcbjEPa4BnT60CPhDwOVk8tk2s6CGtkjTd20ywc3L
 itg7F8vRIT94stna95zDJm1V/QfuRyiFAnbYV7gpbmAL2uBRAgeBA1/FJ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="318323457"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="318323457"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 10:42:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="582944160"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 21 Mar 2022 10:42:09 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 21 Mar 2022 10:42:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 21 Mar 2022 10:42:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 21 Mar 2022 10:42:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kiv4/LyPhOX65Dz6TIRQR6cFJpj+TZh4+Zbd3Z+TAjc8PhWA741PN+uZxMxPgYVVo/QAyy8tKz0uyQMx3/dFVUuwbAATdLTjcV8F6JCqspDv4buJV+84/+R0KEF9HGmqPG/ySp2iQzM1JOeMpXNBbCGrjVZMsftTtpQyLOdG31Pq6G0PJDFq/LddKZE8cl22KCirua5geb1OmU7I0ecuVGJYBtVeOaByZWKStqmbq+UwItMTDOA2Abg2r3qKTQe9+qbOgmHk/SxUaoaAroAw6IJ4NXSKD15zMyrnEw62PEB9SPgqKVWENYdOGRvSJz3v1EKU6HnX22HbIskS3XsagQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPwQqlSb6ZpxxNKgL3HtVXqLqji+s9T4bVuYOBfcS6E=;
 b=NvUoQHaMlwzSmjKTvEt9yAkMiOm4fuDzn1J2V2sCDqG4RHiw6FLPmTzudmsq8z9Igpx3hrnaPiDjwxYcHb8GsLfggQI0cLUjfw32g1Vvh+ITi5fZygx0FSWgzFr8u7SiMHYj6qWAL3Yu4UReDuv36RgfYvNAxtxOHTW1qjOLEDkmGlcgHsxgp4jEhdfkCvDVTfDc0nGuxP4oi2bdiHLfU2IcKCjrpMWvqJ9Pt1jh3nIni3WLZNWxriX4r8+LhoQo/xYhCjspVRz2+WJVVgp4+87Ka5EaVLYyWo70eAB1mXzY63xL/NVX+OvJYe1eJpZrIQ+WhlTHuRDIbR6nPxqyuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Mon, 21 Mar
 2022 17:42:06 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::3db4:813a:16:ba0]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::3db4:813a:16:ba0%7]) with mapi id 15.20.5081.023; Mon, 21 Mar 2022
 17:42:06 +0000
Message-ID: <6748e0f6-c628-d5cc-41f1-3dbfe5916660@intel.com>
Date: Mon, 21 Mar 2022 10:42:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 1/4] i915/gem: drop wbinvd_on_all_cpus usage
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220319194227.297639-1-michael.cheng@intel.com>
 <20220319194227.297639-2-michael.cheng@intel.com>
 <fc7c729b-5c87-f046-04dd-7ca8296487dd@linux.intel.com>
 <05e56e59-81ed-0b99-6c3d-7f9f413ecd4a@intel.com>
 <9ee954d2-4a5e-ff11-0061-b518e00e952a@linux.intel.com>
From: Michael Cheng <michael.cheng@intel.com>
In-Reply-To: <9ee954d2-4a5e-ff11-0061-b518e00e952a@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW3PR06CA0024.namprd06.prod.outlook.com
 (2603:10b6:303:2a::29) To MWHPR11MB1645.namprd11.prod.outlook.com
 (2603:10b6:301:b::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44fcddc9-3e03-4980-f51c-08da0b621dc4
X-MS-TrafficTypeDiagnostic: CH0PR11MB5427:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CH0PR11MB54274DE47FBF78E7C8AD0289E1169@CH0PR11MB5427.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W8JI5vHPKBe++lt8BrxjDVUd/2e+XXKXIr+t3vIT3Vvqof4JyJ0tyKYZPNkyqupPD1oxPy0au7YJh7A5zC4OkxocHteX2nd4aL3znqgO44yLeBSSRVTw5MfxTp0HKMJmxAQvuCy2+tae2YhsAnd1UaOZpJVgyC16+mmDXSaTwtzefqqvYpDIbuYZtJWaFIYRLQniMZp63i/X4nyU0Flf3xi6Z7+p5HDzL+QQS8YhhZoz1XjB1UrXzLT4AaCxJtZD6ouxyWMjL6YF6VssxiP8zxNzfh00/wXXGjlnZE8D6jLu62vmtkV3pVyLJh+IzjxcoZEZFXk9aoQCsWyTN7+HnmpUZzqojV7bjgiReo/L6ZINbgqsCQcBa8KDT8/gOx7bVF6xdYGA0JwwR+NeJiBn9C8q1RyTzKzX72CfqAqJ3QRGdj6WXo7Id3unMz5m4p0xrJx1ququbSyilOdRjvR5Vz3FkihBMiKVXO28KNb69qAhl5Jnai26Mxywsgns9zAoVYlavqr+SxLm4hDHMZf4zjfyFSn2B6LWEqn0mA6qtJDTiuBp4Jlq29XCHWAtDVa8FAiqa+pVx1TGyOHyL9xipNCBEHK1VClSwP1nYrHQAYG7EqVCGu9y8CO2EyjCIA6SLelItDnmHAABo5mR2OmVt3Jw8bRnKMSMMJFJwOdNT3fFvsOF99Kn2JZXVIMLD3DpghgQEOB/nWgJST9XGp8EVXaVh6sj9gGH3w6SPpKye+0F0x9oxy2K9/+wZzJ4N6vxnGxKKCa8EMVtrBg+hxJqtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31696002)(86362001)(38100700002)(66476007)(66556008)(82960400001)(4326008)(66946007)(8676002)(316002)(2906002)(5660300002)(44832011)(2616005)(186003)(83380400001)(6486002)(508600001)(31686004)(6506007)(53546011)(36756003)(6512007)(6666004)(8936002)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXMwa1p4ZEIySU1ZbWdxQjgrbDd6cDRLWFZucklhemRrRzVjYjRPNDZvTFhV?=
 =?utf-8?B?cG1QbXhucmVCdC9HbzBielYrWGU2aGF2VTdnSWJyUGdtWExaWDBmRk1yNzVE?=
 =?utf-8?B?MG0zZFZhMWlFMkgwZC8vblVQemhJQUVadmsxSzRBYmhLcFdCdFRuTDVCaklu?=
 =?utf-8?B?NTZYUzBsRnlOdnZud0RCM0xtL2RHLzdUZEFxWWd5MEtvdDhwL09Bb2ZxVW93?=
 =?utf-8?B?cTBBelpwMWoxUXlNeTQwMXU0MkVKZ0JybHRhWXFMN0tvK25RRHJnWisvTU5i?=
 =?utf-8?B?RHRHUkNocjNEeS9lR1NhTUNOc004a1JnZktCdUwvbEd0YUR6TGMvWHU5N3l2?=
 =?utf-8?B?Z3ZSM3lmYjNVUUJJYVRHeVdNOFZPU3UrS01BUGNkc0JoZ242dWs3ZmQ1cW9D?=
 =?utf-8?B?bmJ2bmtWaTE5ZUsvNW1scFE4L1JIQXFOQS9qS3NYMHhhQXcwQUtubGtpekVj?=
 =?utf-8?B?dDdJS3ZjMk9RNCtFK0RKWXBhdU5CTnQ4elZnVXRpZlpES0k2NmpKb25ZUTF4?=
 =?utf-8?B?czdxQmloRnFSWDhKdWIxMkxGckxKNC95eWRUVWp5N2tBc3RMbWkzWVlnczhR?=
 =?utf-8?B?bzAwcWs5MXpnZHlyQmY4S3I4Q29jK3RjMTBCWXpyYmlGV05LQ25mWmllcVBC?=
 =?utf-8?B?R3FpdVBJRlQzWGIzWGNuL0dRVVoxelhqQktEMUtTVEJQUUpSVlI2eUJHbm5J?=
 =?utf-8?B?ZTlSSlRKMXlGeDZZV1I0V1pMeVlkRThjemg2TmZROHNaR1FQM2xYbjNuR1hM?=
 =?utf-8?B?RVRjcGhzSTFwNjU5VU0yVmEwamdUOWgxb0pxMGZLNkxTVldJMSswOUNuUFV6?=
 =?utf-8?B?ZUpVWnpWOFhBZnIrMThESW9WKzN5UngvVERucXFMM29TTlNkbmZUajRmdlB3?=
 =?utf-8?B?ajFMSGJzbktacWpzQnRySitiZkdaSEFXRlR1SG9WWmJ4TVlOYWtTMUlYK1Zt?=
 =?utf-8?B?R2Z2Kzd6UTVYdzkzV0s4WWpqaFJoS1VtYm4xNkxlVEVKRDRRSEVMUlliU25W?=
 =?utf-8?B?U01DOFVIaSt1MEU2ZEVMU3Y1S0NZZUlweU1YMDdIdkFrVnlUMFJlcHQ0T3VB?=
 =?utf-8?B?a2hkdU1mRElzQXJ1SnQycTdzS3VUSk94Sm9IUEVaaHZtVjFVU1d3VlNXUnhV?=
 =?utf-8?B?STFwT3NMdVdRWUFBUVNUKzYydUd1OTVwdXgxN0xHcG5GYTdseG4xSkNzYzlj?=
 =?utf-8?B?UElUY3kzK2NwaGloY015Si9EQlRsaGVKckk4UEtmb21RUFNlTG5qak43eXRp?=
 =?utf-8?B?MFk4aEdzRUQ3ZjZsMjVHemtibFRTai90eHRyMVFjVTdiOTh0aktMbGIyWG55?=
 =?utf-8?B?SFN4cjlRcnV0NXdNRGJjdWVnQ1hqTXQ3U2wxRndWQkR3OVhkT0RYWU1USXUr?=
 =?utf-8?B?OE0vY3J6bjh3UXMxZG1uZHFNV3hmalRUNnk3OEZDbXFMZmd0UnkrcjRTZm1N?=
 =?utf-8?B?RDh6dnZQRHpjd1p3Smo5UWR6WTZMcGdEQlJYWFZPRzA3OFVlTXJEMFczL3lH?=
 =?utf-8?B?Y0FkQjlUYmhFdnc1QnNZa0xoY0Z3ZGRmeHQva2tGTmU0aW9PYmFZbURBSk0z?=
 =?utf-8?B?ci9KUUlqazY4aWNwaUsxUVM5TkhIYzhuSjZ3OWlBWTVXQ0FWYUl5cUgzK2Jx?=
 =?utf-8?B?OEpmREpxbzRNbFVPRHpkWit5a3FTNzNuUG5lRnJJUUh1UzF0akFKdkJzS3pX?=
 =?utf-8?B?K0FHQllIa1VVUXZSZXVBQ2dhZ0Y1UzhrNXl1cTZwc0FxdDNTTmJCdjB3M0lE?=
 =?utf-8?B?NWljeDJjanFkcHBhMnExM2VIVVNHZHFlV0Zmb2Q0enFxanBqWmdjdUtETHBD?=
 =?utf-8?B?Z2xYYWdKV2J4K2lPTGl3Nlhwc0U0dG9xSDVyYzcxWUdWOXV2MW1xWS9KaVhL?=
 =?utf-8?B?cEFzb1RFeUxNbGdsWE0vVGJZUm5SR2hWYk5KWUROckMzeHNVd1ZCZEJoTGFF?=
 =?utf-8?B?N09UckhsTGkyRFo1ZXBTNUNYZzFEcG55UmY2ZXVPcFRMZVBNRkVpbkNXVnl2?=
 =?utf-8?B?WCtYamg2Wk9RTVdwSWFqNnBuai9jL3I5bmVZTUlQTDliRkx4TTMvZVFMN3dp?=
 =?utf-8?B?YUNoSGlNRkJRNVBibitzcnY0NWR6TXVWeDl1dz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44fcddc9-3e03-4980-f51c-08da0b621dc4
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 17:42:06.2525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u0Fdh9yqbl4PLWf0aoT7kZScNHMFwR5NwW5Jkv8aqp2gPGGK1amV5jyp63ic10N8RWVF7ykfOET69iAy21BnOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5427
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
Cc: thomas.hellstrom@linux.intel.com, wayne.boyer@intel.com,
 daniel.vetter@ffwll.ch, casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-03-21 10:28 a.m., Tvrtko Ursulin wrote:
>
> On 21/03/2022 16:31, Michael Cheng wrote:
>> On 2022-03-21 3:30 a.m., Tvrtko Ursulin wrote:
>>
>>>
>>> On 19/03/2022 19:42, Michael Cheng wrote:
>>>> Previous concern with using drm_clflush_sg was that we don't know 
>>>> what the
>>>> sg_table is pointing to, thus the usage of wbinvd_on_all_cpus to flush
>>>> everything at once to avoid paranoia.
>>>
>>> And now we know, or we know it is not a concern?
>>>
>>>> To make i915 more architecture-neutral and be less paranoid, lets 
>>>> attempt to
>>>
>>> "Lets attempt" as we don't know if this will work and/or what 
>>> can/will break?
>>
>> Yes, but it seems like there's no regression with IGT .
>>
>> If there's a big hit in performance, or if this solution gets 
>> accepted and the bug reports come flying in, we can explore other 
>> solutions. But speaking to Dan Vetter, ideal solution would be to 
>> avoid any calls directly to wbinvd, and use drm helpers in place.
>>
>> +Daniel for any extra input.
>>
>>>> use drm_clflush_sg to flush the pages for when the GPU wants to read
>>>> from main memory.
>>>>
>>>> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 9 ++-------
>>>>   1 file changed, 2 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c 
>>>> b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>>> index f5062d0c6333..b0a5baaebc43 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>>> @@ -8,6 +8,7 @@
>>>>   #include <linux/highmem.h>
>>>>   #include <linux/dma-resv.h>
>>>>   #include <linux/module.h>
>>>> +#include <drm/drm_cache.h>
>>>>     #include <asm/smp.h>
>>>>   @@ -250,16 +251,10 @@ static int 
>>>> i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
>>>>        * DG1 is special here since it still snoops transactions 
>>>> even with
>>>>        * CACHE_NONE. This is not the case with other HAS_SNOOP 
>>>> platforms. We
>>>>        * might need to revisit this as we add new discrete platforms.
>>>> -     *
>>>> -     * XXX: Consider doing a vmap flush or something, where possible.
>>>> -     * Currently we just do a heavy handed wbinvd_on_all_cpus() 
>>>> here since
>>>> -     * the underlying sg_table might not even point to struct 
>>>> pages, so we
>>>> -     * can't just call drm_clflush_sg or similar, like we do 
>>>> elsewhere in
>>>> -     * the driver.
>>>>        */
>>>>       if (i915_gem_object_can_bypass_llc(obj) ||
>>>>           (!HAS_LLC(i915) && !IS_DG1(i915)))
>>>> -        wbinvd_on_all_cpus();
>>>> +        drm_clflush_sg(pages);
>>>
>>> And as noticed before, drm_clfush_sg still can call 
>>> wbinvd_on_all_cpus so are you just punting the issue somewhere else? 
>>> How will it be solved there?
>>>
>> Instead of calling an x86 asm directly, we are using what's available 
>> to use to make the driver more architecture neutral. Agreeing with 
>> Thomas, this solution falls within the "prefer range-aware clflush 
>> apis", and since some other generation platform doesn't support 
>> clflushopt, it will fall back to using wbinvd.
>
> Right, I was trying to get the information on what will drm_clflush_sg 
> do on Arm. Is it range based or global there, or if the latter exists.
>
I am not too sure about the ARM side. We are currently working that out 
with the ARM folks in a different thread.
> Regards,
>
> Tvrtko
