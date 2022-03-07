Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1994D0497
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 17:53:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8372D10E095;
	Mon,  7 Mar 2022 16:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D520810E095;
 Mon,  7 Mar 2022 16:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646671983; x=1678207983;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qgVqko2/ZNfYdAzToBBZv64KouLbtCU2NETzvTtYXA0=;
 b=HC7h8XQjOdmfulF9kT5n9VY5T82QLond9QL32vObBngb8ftTqFvGI9Jq
 zu9iYRKkdZ2E0ogM2RBag4MfY1NJUBjXIumaxoBfgATeLos/g2QGlGH/B
 rNGtEc5ueZyVazNabRBBn4QdkqKxxBBVWSsBnyk4jv0LGP0EaiSWZZtps
 27hUoG4yyK7/qEfYSupyr7qQ97L1Ia8G3gm7YmiLAyF5lck6t0/o6IfoN
 XGYEmgJa0fmFKoVTSbxv90RNDgI55+jK/vKTHxq4DTuHo8B527egWJ9PI
 dcm/ucUBEn82+Da86PBurZTYbpAWHSr3aIgPqYrZQHL+Qoe3kYJPSwYZl A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="317673424"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="317673424"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 08:52:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="546951264"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 07 Mar 2022 08:52:13 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 7 Mar 2022 08:52:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 7 Mar 2022 08:52:12 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 7 Mar 2022 08:52:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7ZZR16ZGJOdWTEUUCoeoHSk/PsHlA7V44J1TE/++YUbKnKDAUl6z1sUAtc1+bAAtkIDg1F/UJpSWp8e8EGi47Pi7w0OEoCj3msD5DSjT7gqU2NCgQ5K2KWfVTVmLUQdvtOhafg6+zFx2I4IqaGVmXuXN3WRfMRik5Hstru11cIQyS7r2oZBpQs6tf3204UgmgH0SzVm/aOXGKnvZglsIOSDhC8/tmlHRjpmO+/MpyAI8b/J2ex+ixnkyI53hWIK1rKYXzk1coQDRE1KBoip/UfiAX81/mlhdoNH8/Tl+VtFBKQGNVa8q79eqJFaCAH/pMVuAYHfQDWvbRlQs/uxzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sWobJ0qvxrNZ6IvYVQxJxhX16FcG6wVxnTl9QjRXDcg=;
 b=d4I0q1y8kRw7/fEnp+5KqO1LMyhEoysFADbsDuMta8b7UKhcKRJ+kYYXoDUV5eMrXwtJ9zBYO2tbwlJ7cHdMF+la99mRIQIux+S4ssO8VurYMwZbGs6Vb31kyDrUlBVfapViGolM7gMDwSqZfk4gXGLD5RV4JL4Ou6zzJenzTIWGzVNZlC77lJGsSewYO2pnL4vYaFdywof4fjrtA+9NOld1hSn/QSPSYAa+ZZMKR+AHk14WKSiWTZXfE6Vhv2mmzfFYl8JJd4b71JxHCQbvmifIhdU6CMADT5utlY+nkjVjYxXW95kAi6o60UfaYHTidaVLU8Y/+EeB1yAh+6UtLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by SN6PR11MB2798.namprd11.prod.outlook.com (2603:10b6:805:58::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Mon, 7 Mar
 2022 16:52:09 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::3db4:813a:16:ba0]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::3db4:813a:16:ba0%7]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 16:52:09 +0000
Message-ID: <9e3f9e41-1086-3636-b8a5-4dd2ca9f38ac@intel.com>
Date: Mon, 7 Mar 2022 08:52:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v12 1/6] drm: Add arch arm64 for drm_clflush_virt_range
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>, <intel-gfx@lists.freedesktop.org>
References: <20220225032436.904942-1-michael.cheng@intel.com>
 <20220225032436.904942-2-michael.cheng@intel.com>
 <5c254623-98d2-75f3-52cb-209b8de304b6@arm.com>
 <3750c398-e8fb-c4e1-ba31-e6ac5fbc01d0@intel.com>
 <2f82d150-47c4-d7c3-50da-eaf4aa4a24af@arm.com>
 <49e4a740-c127-0d5d-e2e8-3ff482fdce3c@intel.com>
 <9d09be2d-34f2-212c-70c0-c698a1d8145a@arm.com>
From: Michael Cheng <michael.cheng@intel.com>
In-Reply-To: <9d09be2d-34f2-212c-70c0-c698a1d8145a@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR21CA0014.namprd21.prod.outlook.com
 (2603:10b6:a03:114::24) To MWHPR11MB1645.namprd11.prod.outlook.com
 (2603:10b6:301:b::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4de1a14c-3094-409b-4d59-08da005ad1c3
X-MS-TrafficTypeDiagnostic: SN6PR11MB2798:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <SN6PR11MB2798BF944AF3B04BF9809441E1089@SN6PR11MB2798.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: frh9ybAsze5P8oDBkp2uOIgmrqwc5CwHZrSZ0cXi4lu24BO939iJwgJHXV2KlSLEKgCz4NRHFRztRFvsXxvyZqVRbEPN05NtdhvqTFLdRD9Jf0AVkhD/Q0os3VoMK/k1vyOlQqAE41qcdk/stsxc8vMkDrxLkwK01diHzlpi6kcLu0kKItoi7Cqox4cRtahWH5tDaHSxCRNAvKM9tCBYGtYaNGTa8c1+3k+48u0oouMUP7eWgl/3YGuLjNHPsCUzEJvb5Oiz20xPFcFZWixGw+4uU0QMrnLfjBI0M00HEaTIBZeQXzZx7YeDHBulWxKhPNktCkexnuctnh36OZtV2cv68+GpQ1CP2j5d9fBJ32GPWOD1bAMoDB9E2rNg++S09X+naqiLepqSmRvjchghzCnN4XvvA5SB8YPc3Ku3pX3+65gLKFLWaSwxR8iWmwwzgyhsZXzJYaHotwsE0CYyaAok6a8HNojpVWnPstZWF30TKVjL/6Lx07tFnKveq5LSS5TpNMhyDw+1HkdyvMVAUXVROmVyuGsfey0dJXvJog8RnO0XrqFUMBqu34uZEOz5MbsrcKfQwEPHX2YO3IH7lv9SVAe/a9zfy/9XyZW+/BaNqXczzOQLZ8k5DibN4bK8oje+8IvXGoEwYA7r4JW31IADxg50EzQn5tnLPGTra0CC0zJNgTnyUJ1kUiIcXvEWC5QUdNzUx91Y3FRU1hqhIEqUjYpJlcLJhljVQZ+mT3k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66556008)(6666004)(8676002)(53546011)(6512007)(6486002)(86362001)(66946007)(31696002)(66476007)(82960400001)(83380400001)(36756003)(31686004)(186003)(5660300002)(44832011)(8936002)(316002)(38100700002)(508600001)(6506007)(26005)(54906003)(2616005)(2906002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXhVMmM3QnVtL1F3Z2RVUEFlUGVTQUQ0N2x2UlVKYkpkVTVOUlplZkVvQUR4?=
 =?utf-8?B?TkJZU1dlUTIvQTd5ZktvWDdKUDNoK1Y2M3hvU2tkK2tJMTl0Y3NiMTV5ZkV5?=
 =?utf-8?B?cHF0UUQyU0lzMkYxanIxN1Q1NlBDeUgwSWZwMk5ZcjNweWJJWmsvcFlyNG1B?=
 =?utf-8?B?NXc2Skw4M1dPclplUTZSczdGeCtsVlpnemlHTUZNdW54alJ3dXM3djF3cXBy?=
 =?utf-8?B?bk9UQ3ZnZnNFZXJMS0F1Rmd1YloxOWRDRFQzek5WZTFGWXdrRmhxcDFpNkFi?=
 =?utf-8?B?L3B3NTFOMVphOC9reUdOdnFNUmE2OHZzT1dDbXRWQXQwZkFjLzBtakZJU1Jk?=
 =?utf-8?B?c3RWckI4R0hvWk93YWw3VngweDRHSWNFakQ0LzR2S255anFOTkdLaXlwaHVx?=
 =?utf-8?B?bHplVU1BQlZicTN1a3NpN0Q0QUV0eGN0RXllOFExV2tNSzJFSmtnY2l5U2d1?=
 =?utf-8?B?RHhSbkxmUWorbVk1OXdlSkR5SlJyZTRvUmZ5QUVUMTY4Q3IyZXRaNWxqKzg1?=
 =?utf-8?B?RTBqOHRzT2o0SEdvY3I0Q3I1djgzTFFQNTRMSkRkYmN6VG1zWlFWRmpIUk15?=
 =?utf-8?B?NGlUU1ZiK3pjQUpUL0t6TFo0eFFaMk5scXFISzlSdHgxVDdvcXRqV1B4RGV2?=
 =?utf-8?B?d1A0b2l2cktRaStScExCZmJET24rcmhvTEd2T0gvRVpsZjFISVEvcE5TczZT?=
 =?utf-8?B?dDlTek92cUdTU2YvMitTTzdxUGpvdGRkVnJ2eHEzeDZ0OHlXTDRkbCtsWWdk?=
 =?utf-8?B?MlBBTFZVbHZodVRNQjdKZUY4anExbDRkS1NXUytlZ0srZ1dMTStNbFc2S0Vm?=
 =?utf-8?B?K29IY042UktVajNXMUNsSFJ3akQ0K0lXTDA0VzFCZC9sVVdTT1ZwT2JrMExt?=
 =?utf-8?B?b2xNa2tVRlFxRWxubVNaTzRwcEtSLzMyN0ZMRkFrck5kQ0QrcTJoMUZ1L2hJ?=
 =?utf-8?B?ZTFyR29pa3FsTWU0VXMwZUpnU0hTS2ZuSVM5WFlzUk1FRGswa1pGUGtRZ3Vo?=
 =?utf-8?B?Z2w3YkdnQWFLUnlLbnFWaUJMZ0FsRFJlM2lzR0dWeDlaRjZSdDBkdmJ4U28w?=
 =?utf-8?B?akpmc0RpeG9lRTVKK09XTm9RbG1jNUU3U1czTnYwNExjOThyNkt6VXVwa0Uw?=
 =?utf-8?B?a2doSGo0K1NYbC82QXhwTmZCbEtQN3hJTjQ2R1JXem1MRkVTMjZxQlVyVTFs?=
 =?utf-8?B?YnVOeENYMklYSFp1cW5yTFRMbG40Y2E1dU8rMXZoTEplYlF1d1hzQzY0SkV6?=
 =?utf-8?B?TG05QVB6bFhTY0VVMkQ0MnFZNjFORFJraFlzMWg2YVRnMHAyWFdISEdJcnlV?=
 =?utf-8?B?c0xLbWQ4bVJOVFpCaUVmZFZxQXlGZ1FINWxMMmFrQis0UnhhOEpyd0RyWFo0?=
 =?utf-8?B?MzRPM2NUTGpWK25VTXQ4WTF5L2cvaWFnNERIdktmK2hReE83U2xBcVpGSlRx?=
 =?utf-8?B?QXowY1NtaFhDS1ZqYytuZGlLSE9jZXZXRVp5OUI0WElhcWJqT01qdEZmaThJ?=
 =?utf-8?B?K0VCMWpQMHFlSDUzbHhSc04vbW1jQ3cxbWJNdzh3M1VjeFNUbEpBRHZYamV5?=
 =?utf-8?B?TW12aHFLUmJhMFlZdnFxQ0QvU0Q4cHl1ckROWWNMMFhtRmZIejBWLzBTZGVZ?=
 =?utf-8?B?ODluTGlKcXBrYWFzUjJQWDlFbTdhbCtnSkJGVEZwazlPeXY4U0tkU29mMERO?=
 =?utf-8?B?b2c5K3l5NkMzS09Za1VremRJZkNmSHRpZFRLcXQ1d3h6b3drb0xyWEV2VzN5?=
 =?utf-8?B?aUozUUJDODJTdmpLY2xrM29TU01iQmIvQ0RXc2FxZ01sYUZCY0VQVUZwZVUz?=
 =?utf-8?B?OWovZkd0NUcvREEzRVpzb08vSUt5K29xZkpVSG04ZXJaaGd3ZGpwc0hvYXF0?=
 =?utf-8?B?ZXBtSXVOdXRBQlNLR0xnZk5RbE96eTVUU043eUU3emhsd1hZSXM4ZFJyV01Q?=
 =?utf-8?B?Y1FVcEhNbnU3ZHMraVBUWWxiMkdwNXFyT0ttTlJKbTlLbUV6cnlJWnpWVndr?=
 =?utf-8?B?K25rNVErN1NuQ3pJMlZRd0Jkc0pheENEQWdxS0JaYWVjcnUrZEJMYWcwZXB6?=
 =?utf-8?B?eStGc0gwbkVLYXg0NG9QVXJZd3FIZjFxMlMzVnU4M1V0RUo0cnE2TC9GOGZP?=
 =?utf-8?B?OEZjSDNiaEFrdllEeEN6SzZXRlQ0eGxWMlpjNitYRk5lNW1iS1JiSG5lQmtr?=
 =?utf-8?Q?DgDZZW4fSfcPk04PqTbmTD8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de1a14c-3094-409b-4d59-08da005ad1c3
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 16:52:09.5140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IQbCiviLl5S/zfY8ngNXsM888nKQweFsSsb/adgxHfH7Smf72GKC2Z6xuoNCzfyOSf2Maia9ncA15ziloAquLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2798
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
Cc: tvrtko.ursulin@linux.intel.com, balasubramani.vivekanandan@intel.com,
 wayne.boyer@intel.com, Catalin Marinas <catalin.marinas@arm.com>,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org, james.ausmus@intel.com,
 Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ah Thanks for the great feedback!

@Lucas or @Matt, could you please chime in?

Michael Cheng

On 2022-03-02 11:10 a.m., Robin Murphy wrote:
> On 2022-03-02 15:55, Michael Cheng wrote:
>> Thanks for the feedback Robin!
>>
>> Sorry my choices of word weren't that great, but what I meant is to 
>> understand how ARM flushes a range of dcache for device drivers, and 
>> not an equal to x86 clflush.
>>
>> I believe the concern is if the CPU writes an update, that update 
>> might only be sitting in the CPU cache and never make it to device 
>> memory where the device can see it; there are specific places that we 
>> are supposed to flush the CPU caches to make sure our updates are 
>> visible to the hardware.
>
> Ah, OK, if it's more about ordering, and it's actually write buffers 
> rather than caches that you care about flushing, then we might be a 
> lot safer, phew!
>
> For a very simple overview, in a case where the device itself needs to 
> observe memory writes in the correct order, e.g.:
>
>     data_descriptor.valid = 1;
>
>     clflush(&data_descriptor);
>
>     command_descriptor.data = &data_descriptor
>
>     writel(/* control register to read command to then read data */)
>
> then dma_wmb() between the first two writes should be the right tool 
> to ensure that the command does not observe the command update while 
> the data update is still sat somewhere in a CPU write buffer.
>
> If you want a slightly stronger notion that, at a given point, all 
> prior writes have actually been issued and should now be visible 
> (rather than just that they won't become visible in the wrong order 
> whenever they do), then wmb() should suffice on arm64.
>
> Note that wioth arm64 memory types, a Non-Cacheable mapping of DRAM 
> for a non-coherent DMA mapping, or of VRAM in a prefetchable BAR, can 
> still be write-buffered, so barriers still matter even when actual 
> cache maintenance ops don't (and as before if you're trying to perform 
> cache maintenance outside the DMA API then you've already lost 
> anyway). MMIO registers should be mapped as Device memory via 
> ioremap(), which is not bufferable, hence the barrier implicit in 
> writel() effectively pushes out any prior buffered writes ahead of a 
> register write, which is why we don't need to worry about this most of 
> the time.
>
> This is only a very rough overview, though, and I'm not familiar 
> enough with x86 semantics, your hardware, or the exact use-case to be 
> able to say whether barriers alone are anywhere near the right answer 
> or not.
>
> Robin.
>
>>
>> +Matt Roper
>>
>> Matt, Lucas, any feed back here?
>>
>> On 2022-03-02 4:49 a.m., Robin Murphy wrote:
>>> On 2022-02-25 19:27, Michael Cheng wrote:
>>>> Hi Robin,
>>>>
>>>> [ +arm64 maintainers for their awareness, which would have been a 
>>>> good thing to do from the start ]
>>>>
>>>>   * Thanks for adding the arm64 maintainer and sorry I didn't rope 
>>>> them
>>>>     in sooner.
>>>>
>>>> Why does i915 need to ensure the CPU's instruction cache is 
>>>> coherent with its data cache? Is it a self-modifying driver?
>>>>
>>>>   * Also thanks for pointing this out. Initially I was using
>>>>     dcache_clean_inval_poc, which seem to be the equivalently to what
>>>>     x86 is doing for dcache flushing, but it was giving me build 
>>>> errors
>>>>     since its not on the global list of kernel symbols. And after
>>>>     revisiting the documentation for caches_clean_inval_pou, it won't
>>>>     fly for what we are trying to do. Moving forward, what would 
>>>> you (or
>>>>     someone in the ARM community) suggest we do? Could it be 
>>>> possible to
>>>>     export dcache_clean_inval_poc as a global symbol?
>>>
>>> Unlikely, unless something with a legitimate need for CPU-centric 
>>> cache maintenance like kexec or CPU hotplug ever becomes modular.
>>>
>>> In the case of a device driver, it's not even the basic issues of 
>>> assuming to find direct equivalents to x86 semantics in other CPU 
>>> architectures, or effectively reinventing parts of the DMA API, it's 
>>> even bigger than that. Once you move from being integrated in a 
>>> single vendor's system architecture to being on a discrete card, you 
>>> fundamentally *no longer have any control over cache coherency*. 
>>> Whether the host CPU architecture happens to be AArch64, RISC-V, or 
>>> whatever doesn't really matter, you're at the mercy of 3rd-party 
>>> PCIe and interconnect IP vendors, and SoC integrators. You'll find 
>>> yourself in systems where PCIe simply cannot snoop any caches, where 
>>> you'd better have the correct DMA API calls in place to have any 
>>> hope of even the most basic functionality working properly; you'll 
>>> find yourself in systems where even if the PCIe root complex claims 
>>> to support No Snoop, your uncached traffic will still end up 
>>> snooping stale data that got prefetched back into caches you thought 
>>> you'd invalidated; you'll find yourself in systems where your memory 
>>> attributes may or may not get forcibly rewritten by an IOMMU 
>>> depending on the kernel config and/or command line.
>>>
>>> It's not about simply finding a substitute for clflush, it's that 
>>> the reasons you have for using clflush in the first place can no 
>>> longer be assumed to be valid.
>>>
>>> Robin.
>>>
>>>> On 2022-02-25 10:24 a.m., Robin Murphy wrote:
>>>>> [ +arm64 maintainers for their awareness, which would have been a 
>>>>> good thing to do from the start ]
>>>>>
>>>>> On 2022-02-25 03:24, Michael Cheng wrote:
>>>>>> Add arm64 support for drm_clflush_virt_range. caches_clean_inval_pou
>>>>>> performs a flush by first performing a clean, follow by an 
>>>>>> invalidation
>>>>>> operation.
>>>>>>
>>>>>> v2 (Michael Cheng): Use correct macro for cleaning and 
>>>>>> invalidation the
>>>>>>             dcache. Thanks Tvrtko for the suggestion.
>>>>>>
>>>>>> v3 (Michael Cheng): Replace asm/cacheflush.h with linux/cacheflush.h
>>>>>>
>>>>>> v4 (Michael Cheng): Arm64 does not export dcache_clean_inval_poc 
>>>>>> as a
>>>>>>             symbol that could be use by other modules, thus use
>>>>>>             caches_clean_inval_pou instead. Also this version
>>>>>>                 removes include for cacheflush, since its already
>>>>>>             included base on architecture type.
>>>>>>
>>>>>> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
>>>>>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/drm_cache.c | 5 +++++
>>>>>>   1 file changed, 5 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/drm_cache.c 
>>>>>> b/drivers/gpu/drm/drm_cache.c
>>>>>> index c3e6e615bf09..81c28714f930 100644
>>>>>> --- a/drivers/gpu/drm/drm_cache.c
>>>>>> +++ b/drivers/gpu/drm/drm_cache.c
>>>>>> @@ -174,6 +174,11 @@ drm_clflush_virt_range(void *addr, unsigned 
>>>>>> long length)
>>>>>>         if (wbinvd_on_all_cpus())
>>>>>>           pr_err("Timed out waiting for cache flush\n");
>>>>>> +
>>>>>> +#elif defined(CONFIG_ARM64)
>>>>>> +    void *end = addr + length;
>>>>>> +    caches_clean_inval_pou((unsigned long)addr, (unsigned 
>>>>>> long)end);
>>>>>
>>>>> Why does i915 need to ensure the CPU's instruction cache is 
>>>>> coherent with its data cache? Is it a self-modifying driver?
>>>>>
>>>>> Robin.
>>>>>
>>>>> (Note that the above is somewhat of a loaded question, and I do 
>>>>> actually have half an idea of what you're trying to do here and 
>>>>> why it won't fly, but I'd like to at least assume you've read the 
>>>>> documentation of the function you decided was OK to use)
>>>>>
>>>>>> +
>>>>>>   #else
>>>>>>       WARN_ONCE(1, "Architecture has no drm_cache.c support\n");
>>>>>>   #endif
