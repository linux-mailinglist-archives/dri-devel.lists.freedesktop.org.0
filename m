Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4BC679247
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 08:49:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10C310E617;
	Tue, 24 Jan 2023 07:49:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8490C10E617
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 07:49:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJmixFTXQqBSRZBr36rufphz021e3V+z6ASSG2U7tFoqXdpkzdUgNAF4r6wuSAPBAwYabWqxY7Xhn/6EFffcMsjr9fzE05SnIleO+SP2XzFR3bRB2J5Cx0kGPKA3RALlm+dQ8bOaq88mmSDVlnl5woNCZYopwCtThNa6WlZaP3YKG0TDGgGPwFb0gEBKkKeeDBAFiGtjXX3mMLF6R2RKkV81rLa5dNS6JQN7zvcdi4MSW+CJE7xJG2clg6DXIvAcX1VwjWdIEIX9/1pCsuoM+3AxUD3G3YBCcGN3RQAv2hsiNikL4TOfy1yb16IF41ztXO4qDvCgWst+P6kmf2lqSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KN2zkg1Yxe6BaOPjCh1yOt5EMY5DFMrDDaP1qWYglz0=;
 b=Irg9yzQtOAEDMiMYUt7Zq6AaoQqIU7RQeuvgSJh8Ul/BjyLXQMzDRItkWxNM+UZjZPsVIDCoEFpgYLW87or5EiVJnt6frwqSK07owOQwGWjZfRCoVFXZjsXZdAC9dcb+oVuLhYnXrsf2zzm256nLiHmTdWehV+V3D6cFaReNFIoDmiwW2u8HxaQvzNptL2Se64mjlBxcMxkm2283yM4m/K/a0paGJ/zXOSBq2YPPMWQCpuslFxEJPvlZrXmvUtF3qqWt3G7iVBlBiSV6y9rjl/QD2PuJLE10E4fBoF11xwdp3R0xWvhrUStcVsom/j92mnqGpv5qc8uNFpRnc9yseQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KN2zkg1Yxe6BaOPjCh1yOt5EMY5DFMrDDaP1qWYglz0=;
 b=hmzGyHO6kYPIVk9Si2rjLK+V/UazDNdRdjM6j/xOE/TO13oHQKSHPgN03vgo4Wv4Z3k4TfGSBDIwSRKVL3SDKggFUVYubfBbygR8Yza/WSmjLchy2PgbGr1/DxvBPd9LFUqMHx03grqV48CjckwkSJdZEoYGUSlM5LF6dYISg1g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH8PR12MB7135.namprd12.prod.outlook.com (2603:10b6:510:22c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 07:49:05 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 07:49:05 +0000
Message-ID: <ece8638d-01a3-6e25-c68c-c9e225200b08@amd.com>
Date: Tue, 24 Jan 2023 08:48:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: DMA-heap driver hints
Content-Language: en-US
To: James Jones <jajones@nvidia.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230123123756.401692-1-christian.koenig@amd.com>
 <Y86R3vQX+vW0+oxw@pendragon.ideasonboard.com>
 <1f4a1a5c-e0d5-7f0e-353c-daa89f1369ea@amd.com>
 <Y868mG7Oa5bI1wB7@pendragon.ideasonboard.com>
 <349797d3-2406-cb78-4d3d-61a4628f762b@nvidia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <349797d3-2406-cb78-4d3d-61a4628f762b@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH8PR12MB7135:EE_
X-MS-Office365-Filtering-Correlation-Id: 01c6f513-00f9-42cb-07c3-08dafddf7795
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jNPPAIIS6DthPWIG6xhZp5hZFKVrj7Pi6M9YVZqGs6c8Fg5N3TtLK1+OGnJSAD1A2DmKIhwH8MaS1/GvhEIC5GlDeHnVJDXSjav8JkKzGrMldEl7gVknlzEIVG/uvFRkyMWcIxik1xh8LjCdfK7O7nVzGwRjd9Df0LMk+qqOyIoMIP4I1fudgNVw72v71ZzZBzockr6EvNfmvsxJwRw+wTYKPDcJzb+Oifd7SZofBtgOJah1Hfc8Xt+waBq39tbZ6+0m4uKrpp0yiELecoqGg1zJQxe0BnP7mPHhDGYwaYNZxxQYP18eGm8Y7o9aJvkHV0YVkeijfWn9+XBYjBfOnmvU0X0zjf4h6Aj9l3XcOUINkENuhJ/FZwjQ5uJkaXC7FRJJ4vHqArJXzM3BI2jFw/KgJ/IaiKI0g/e9Kl20S6/nNeOHSvVdfjpm+JC0udq0XcdXqcVvUqW0ykTOBF4U/Mm7NuycoClupRbtsCAPvu8CGyM62N9pD6I/N8JLZ+Qb2UDPu387OmxuAWHNtgHL77aGjU3Va4sVhi9n9j9R+7wQQRTr9IMI9HifpAAbb83TKZp44l4jGPy2wO/PMtF6kIK3Zbe8KRDmprpBazhCuA3B+RwX5B/Z77Gl868qDOhoRbCJw33lJTIosU6ah4YkTwA1Gy3E0JeHSz7+vxB493F0FWmi6tT+iLgYwjMh+beXAQDF1z88ES5DOrn0asPYhVHr9XO0fopcIzTaSj9VH776rQjLH+fWxj5PVNt+kK6uBRVEUmzwia4K3vUKax3zXgpTWI+HafBEfsHJiI0rkN0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199015)(66899015)(36756003)(86362001)(2906002)(7416002)(4326008)(5660300002)(30864003)(8936002)(41300700001)(83380400001)(31696002)(38100700002)(3480700007)(966005)(478600001)(6486002)(110136005)(31686004)(8676002)(26005)(6506007)(6512007)(186003)(53546011)(66556008)(66946007)(2616005)(66476007)(316002)(66574015)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1duTjRQbllCaVNQaDdBWlZQaGp4ejZ0dEs5Q096SUZreHFTVXlOcWIwSm1O?=
 =?utf-8?B?cnpDYmR6WjdCUjRLSmh5L3h0NERHKzc4N2IrYzQrcGZqaFhFUE5PV3VhYkVT?=
 =?utf-8?B?UTh4YTVnakNmZU1LYVVVRGllNXZIeFNLWDdRSHBvV0dScWx6TVBUMVFhdUYr?=
 =?utf-8?B?d3dNbU9pS1RpUzZwbklOcGdvMTdSSTRDQlR1b0tjY3BLaVIrS2grNVFES210?=
 =?utf-8?B?anl6UnZpOU03U2RZQzkwcWpxZDJiNlhDUXpIODQxMXMvMVpIdXNyZjArTmJY?=
 =?utf-8?B?TEE3Y3ljRmxSdy81UUxnS21XUTd0Sng1a2pUQUJLRUhHUVRpdXdIbGNCeUNo?=
 =?utf-8?B?YXNvWmN2bnVPblg4VDhHL3VYYjZsZVJIalpZVmFDb1ZvNXlIeitEeUZVM1Jl?=
 =?utf-8?B?MGVhUWJnam0yVmNaS0d4NEJaVFBiOGRTWCtaUjZucGZHMGdmRk56OHE0bWpW?=
 =?utf-8?B?cnE5U3NHN3hmTHhjenZjTzNjdTc0K05BUzFWeGNUb1BzSHEzUlhNbWlEbm9l?=
 =?utf-8?B?SmdoMHc5OUtXcG5UVkYzdGIvUmJUNkdxZXArM05mTVJhSDhHVDFyd0hMc1Fh?=
 =?utf-8?B?aDVSRkRzaUZic2FDMmwwbEdOZ2d4aXkzY05UNytNRmtjbVV4R2lWditJYXlu?=
 =?utf-8?B?c1Q1QWN3L2hSMGpLMENXNmpDdm83enRpWFlZTytmUEYwQzlWYVBDU0V6QjdR?=
 =?utf-8?B?ZDNlSEZvckxnZzBuQmJhUVZuNHN4dTZuTUVBMmhQTXZ3TGdqbEJjZndLK1h4?=
 =?utf-8?B?VlFlZHNqbEpZSzRYL1ZNSXcvdDhUYURuVGMyb1ZrTThMUklZU1VoMWUzT05o?=
 =?utf-8?B?ZmVGSE8zRzNpOUhONnVINmJacVpTdEYrYUQ0M082R2VEMTZiUnBhbGorZzk5?=
 =?utf-8?B?Z2trS0VFbW1SKzZkMGMzMGNjeEVVeEZQRlUyb0hrQmZscXVYdk1EbGhLZ3U5?=
 =?utf-8?B?ZEtzazMzU0lTU3BNWUsvZVM0OHVveXZncjMvL3dEQ2RIem5QdHpXZEV6dS8z?=
 =?utf-8?B?VUVqTlNJU0REb2o2RStOMFB1ODE4eXBWczZ4cnNSUno2NXgrdlN0T0ZQdzBi?=
 =?utf-8?B?ZGpxMFBhSXJEYnU3RDJseWVqNE11ZTVDb0dKaUtyVmJGSUpHNlRFODNpR0Vy?=
 =?utf-8?B?RWtTWnIxMzIvcCtWWFN5Y0p1ZDY4QmpnUGI1YUdsa2dNRyt0b3hyWjIyUWhB?=
 =?utf-8?B?bGY4Z1NDblFVa21qa0Z3dHdjMkFpMFZNN3k4OXVQcG91TzdRV1I3aWhNa21X?=
 =?utf-8?B?bWh5TnB5M2thbll0bW1wT3oxTUIxQjYzeWFFOGd2RS9wNTNnclhSZStZdDcv?=
 =?utf-8?B?WWJmb3BmK01MbWNJZkRFaVVubzJGbHJybG9KZk9JSmp1RU9NT0lZcDhKWG1D?=
 =?utf-8?B?c2FXanQ3YWdUQjFKaW5EcHBLcWs1WC9Nb1VyMW5YK3pvMzQxV0VvMUJYZkYr?=
 =?utf-8?B?M2psTlZjKzBWcVJsRUtaM0luK1VpSDJROGZkd1AxTHhzZDJXR0NGYStZdlNY?=
 =?utf-8?B?cUVhcEZBOHp3WlRzc2g1WElKLzlKWVRlRHdKS1pPNDVFbmdIQW82N3hsb0FD?=
 =?utf-8?B?MzlpMFhBbnhQUmFqTExwSS9PU3B2VWU0NE5EN1RLTmtaQjZucHZPVUlvU0Vr?=
 =?utf-8?B?Wk80Y0FxaVZQQk93ZDlUQTJjOEZhSHRmcUQvVTdBSHlBOFhlNWxXSmtsZWtW?=
 =?utf-8?B?cjdxOFpjai82WEpkakdIK1Zla0syajNEcVo5M2RrK0hJUEU3Z2dGc2xvcDFp?=
 =?utf-8?B?S0g5MnppeStrNFBxME8zZStlK202RHJkQkYrSHF6SXBsNHhPZ3lubDFiODRq?=
 =?utf-8?B?STR6VlNXMmdLeEVMc05QbXY4VEo2NnRMWXBiOVJvZUpWdXJ3cFN6bzVUK3dt?=
 =?utf-8?B?ZCtFR1MwREs5VTJYcERTbnlyNkF0SG9uYzdlK3hjWWFHczF4Q2ZyM2FaV09l?=
 =?utf-8?B?dGVuVzh0QzBwR3NYdFJWMVJLL3B1T0VHL0Jrd3dxaWJLZGFybmhTSENTMGt4?=
 =?utf-8?B?ZG15ekljQWpBMDRjS3dWWHJ0NTc4M2pZdHV6VDNiUWIyNGdoZWIrYSsramlp?=
 =?utf-8?B?dGVhYmQvKzZ0ZE5ENUxuWUdRZFF1RUZRTGVWL2RlUlp2TE9DVkRpUm0rMGUv?=
 =?utf-8?Q?6sA2UGrieS4zI8ogf7rvW2lhz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01c6f513-00f9-42cb-07c3-08dafddf7795
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 07:49:05.3386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BzuSkY75+E6BGfUZ/+28xHZhNiAseXDD3dVuBNLahPlBqGzFcDNP3tO/wCOeRGtq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7135
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
Cc: linaro-mm-sig@lists.linaro.org, sebastian.wick@redhat.com,
 labbott@redhat.com, benjamin.gaignard@collabora.com,
 linux-media@vger.kernel.org, mchehab@kernel.org, ppaalanen@gmail.com,
 dri-devel@lists.freedesktop.org, nicolas@ndufresne.ca, hverkuil@xs4all.nl,
 jstultz@google.com, lmark@codeaurora.org, tfiga@chromium.org,
 sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.01.23 um 04:56 schrieb James Jones:
> On 1/23/23 08:58, Laurent Pinchart wrote:
>> Hi Christian,
>>
>> On Mon, Jan 23, 2023 at 05:29:18PM +0100, Christian König wrote:
>>> Am 23.01.23 um 14:55 schrieb Laurent Pinchart:
>>>> Hi Christian,
>>>>
>>>> CC'ing James as I think this is related to his work on the unix device
>>>> memory allocator ([1]).
>
> Thank you for including me.

Sorry for not having you in initially. I wasn't aware of your previous 
work in this area.

>
>>>> [1] 
>>>> https://lore.kernel.org/dri-devel/8b555674-1c5b-c791-4547-2ea7c16aee6c@nvidia.com/
>>>>
>>>> On Mon, Jan 23, 2023 at 01:37:54PM +0100, Christian König wrote:
>>>>> Hi guys,
>>>>>
>>>>> this is just an RFC! The last time we discussed the DMA-buf coherency
>>>>> problem [1] we concluded that DMA-heap first needs a better way to
>>>>> communicate to userspace which heap to use for a certain device.
>>>>>
>>>>> As far as I know userspace currently just hard codes that information
>>>>> which is certainly not desirable considering that we should have this
>>>>> inside the kernel as well.
>>>>>
>>>>> So what those two patches here do is to first add some
>>>>> dma_heap_create_device_link() and dma_heap_remove_device_link()
>>>>> function and then demonstrating the functionality with uvcvideo
>>>>> driver.
>>>>>
>>>>> The preferred DMA-heap is represented with a symlink in sysfs between
>>>>> the device and the virtual DMA-heap device node.
>>>>
>>>> I'll start with a few high-level comments/questions:
>>>>
>>>> - Instead of tying drivers to heaps, have you considered a system 
>>>> where
>>>>     a driver would expose constraints, and a heap would then be 
>>>> selected
>>>>     based on those constraints ? A tight coupling between heaps and
>>>>     drivers means downstream patches to drivers in order to use
>>>>     vendor-specific heaps, that sounds painful.
>>>
>>> I was wondering the same thing as well, but came to the conclusion that
>>> just the other way around is the less painful approach.
>>
>>  From a kernel point of view, sure, it's simpler and thus less painful.
>>  From the point of view of solving the whole issue, I'm not sure :-)
>>
>>> The problem is that there are so many driver specific constrains that I
>>> don't even know where to start from.
>>
>> That's where I was hoping James would have some feedback for us, based
>> on the work he did on the Unix device memory allocator. If that's not
>> the case, we can brainstorm this from scratch.
>
> Simon Ser's and my presentation from XDC 2020 focused entirely on 
> this. The idea was not to try to enumerate every constraint up front, 
> but rather to develop an extensible mechanism that would be flexible 
> enough to encapsulate many disparate types of constraints and perform 
> set operations on them (merging sets was the only operation we tried 
> to solve). Simon implemented a prototype header-only library to 
> implement the mechanism:
>
> https://gitlab.freedesktop.org/emersion/drm-constraints
>
> The links to the presentation and talk are below, along with notes 
> from the follow-up workshop.
>
> https://lpc.events/event/9/contributions/615/attachments/704/1301/XDC_2020__Allocation_Constraints.pdf 
>
> https://www.youtube.com/watch?v=HZEClOP5TIk
> https://paste.sr.ht/~emersion/c43b30be08bab1882f1b107402074462bba3b64a
>
> Note one of the hard parts of this was figuring out how to express a 
> device or heap within the constraint structs. One of the better ideas 
> proposed back then was something like heap IDs, where dma heaps would 
> each have one,

We already have that. Each dma_heap has it's own unique name.

> and devices could register their own heaps (or even just themselves?) 
> with the heap subsystem and be assigned a locally-unique ID that 
> userspace could pass around.

I was more considering that we expose some kind of flag noting that a 
certain device needs its buffer allocated from that device to utilize 
all use cases.

> This sounds similar to what you're proposing. Perhaps a reasonable 
> identifier is a device (major, minor) pair. Such a constraint could be 
> expressed as a symlink for easy visualization/discoverability from 
> userspace, but might be easier to serialize over the wire as the 
> (major, minor) pair. I'm not clear which direction is better to 
> express this either: As a link from heap->device, or device->heap.
>
>>>>     A constraint-based system would also, I think, be easier to extend
>>>>     with additional constraints in the future.
>>>>
>>>> - I assume some drivers will be able to support multiple heaps. How do
>>>>     you envision this being implemented ?
>>>
>>> I don't really see an use case for this.
>
> One use case I know of here is same-vendor GPU local memory on 
> different GPUs. NVIDIA GPUs have certain things they can only do on 
> local memory, certain things they can do on all memory, and certain 
> things they can only do on memory local to another NVIDIA GPU, 
> especially when there exists an NVLink interface between the two. So 
> they'd ideally express different constraints for heap representing 
> each of those.

I strongly think that exposing this complexity is overkill. We have 
pretty much the same on AMD GPUs with XGMI, but this is so vendor 
specific that I'm pretty sure we shouldn't have that in a common framework.

We should concentrate on solving the problem at hand and not trying to 
come up with something to complex to be implementable by everybody. 
Extensibility is the key here not getting everything handled in the 
initial code drop.

>
> The same thing is often true of memory on remote devices that are at 
> various points in a PCIe topology. We've had situations where we could 
> only get enough bandwidth between two PCIe devices when they were less 
> than some number of hops away on the PCI tree. We hard-coded logic to 
> detect that in our userspace drivers, but we could instead expose it 
> as a constraint on heaps that would express which devices can 
> accomplish certain operations as pairs.
>
> Similarly to the last one, I would assume (But haven't yet run into in 
> my personal experience) similar limitations arise when you have a NUMA 
> memory configuration, if you had a heap representing each NUMA node or 
> something, some might have more coherency than others, or might have 
> different bandwidth limitations that you could express through 
> something like device tree, etc. This is more speculative, but seems 
> like a generalization of the above two cases.
>
>>> We do have some drivers which say: for this use case you can use
>>> whatever you want, but for that use case you need to use specific 
>>> memory
>>> (scan out on GPUs for example works like this).
>>>
>>> But those specific use cases are exactly that, very specific. And
>>> exposing all the constrains for them inside a kernel UAPI is a futile
>>> effort (at least for the GPU scan out case). In those situations it's
>>> just better to have the allocator in userspace deal with device 
>>> specific
>>> stuff.
>>
>> While the exact constraints will certainly be device-specific, is that
>> also true of the type of constraints, or the existence of constraints in
>> the first place ? To give an example, with a video decoder producing
>> frames that are then rendered by a GPU, the tiling format that would
>> produce the best result is device-specific, but the fact that the
>> decoder can produce a tiled format that would work better for the GPU,
>> or a non-tiled format for other consumers, is a very common constraint.
>> I don't think we'll be able to do away completely with the
>> device-specific code in userspace, but I think we should be able to
>> expose constraints in a generic-enough way that many simple use cases
>> will be covered by generic code.
>
> Yes, agreed, the design we proposed took pains to allow 
> vendor-specific constraints via a general mechanism. We supported both 
> vendor-specific types of constraints, and vendor-specific values for 
> general constraints. Some code repository would act as the central 
> registry of constraint types, similar to the Linux kernel's 
> drm_fourcc.h for modifiers, or the Khronos github repository for 
> Vulkan vendor IDs. If the definition needs to be used by the kernel, 
> the kernel is the logical repository for that role IMHO.
>
> In our 2020 discussion, there was some debate over whether the kernel 
> should expose and/or consume constraints directly, or whether it's 
> sufficient to expose lower-level mechanisms from the kernel and keep 
> the translation of constraints to the correct mechanism in userspace. 
> There are pros/cons to both. I don't know that we bottomed out on that 
> part of the discussion, and it could be the right answer is some 
> combination of the two, as suggested below.
>
>>> What I want to do is to separate the problem. The kernel only provides
>>> the information where to allocate from, figuring out the details like
>>> how many bytes, which format, plane layout etc.. is still the job of
>>> userspace.
>>
>> Even with UVC, where to allocate memory from will depend on the use
>> case. If the consumer is a device that doesn't support non-contiguous
>> DMA, the system heap won't work.
>>
>> Actually, could you explain why UVC works better with the system heap ?
>> I'm looking at videobuf2 as an importer, and it doesn't call the dmabuf
>> as far as I can tell, so cache management provided by the exporter seems
>> to be bypassed in any case.
>>
>>> What we do have is compatibility between heaps. E.g. a CMA heap is
>>> usually compatible with the system heap or might even be a subset of
>>> another CMA heap. But I wanted to add that as next step to the heaps
>>> framework itself.
>>>
>>>> - Devices could have different constraints based on particular
>>>>     configurations. For instance, a device may require specific memory
>>>>     layout for multi-planar YUV formats only (as in allocating the 
>>>> Y and C
>>>>     planes of NV12 from different memory banks). A dynamic API may 
>>>> thus be
>>>>     needed (but may also be very painful to use from userspace).
>>>
>>> Uff, good to know. But I'm not sure how to expose stuff like that.
>>
>> Let's see if James has anything to share with us :-) With a bit of luck
>> we won't have to start from scratch.
>
> Well, this is the hard example we keep using as a measure of success 
> for whatever we come up with. I don't know that someone ever sat down 
> and tried to express this in the mechanism Simon and I proposed in 
> 2020, but allowing the expression of something that complex was 
> certainly our goal. How to resolve it down to an allocation mechanism, 
> I believe, was further than we got, but we weren't that well versed in 
> DMA heaps back then, or at least I wasn't.
>
>>>>> What's still missing is certainly matching userspace for this since I
>>>>> wanted to discuss the initial kernel approach first.
>>>>
>>>> https://git.libcamera.org/libcamera/libcamera.git/ would be a good 
>>>> place
>>>> to prototype userspace support :-)
>>>
>>> Thanks for the pointer and the review,
>>
>> By the way, side question, does anyone know what the status of dma heaps
>> support is in major distributions ? On my Gentoo box,
>> /dev/dma_heap/system is 0600 root:root. That's easy to change for a
>> developer, but not friendly to end-users. If we want to move forward
>> with dma heaps as standard multimedia allocators (and I would really
>> like to see that happening), we have to make sure they can be used.
>
> We seem to have reached a world where display (primary nodes) are 
> carefully guarded, and some mildly trusted group of folks (video) can 
> access render nodes, but then there's some separate group generally 
> for camera/video/v4l and whatnot from what I've seen (I don't survey 
> this stuff that often. I live in my developer bubble). I'm curious 
> whether the right direction is a broader group that encompasses all of 
> render nodes, multimedia, and heaps, or if a more segmented design is 
> right. The latter is probably the better design from first principles, 
> but might lead to headaches if the permissions diverge.

The main argument is that this memory is not properly accounted, but 
this also counts for things like memory file descriptors returned by 
memfd_create().

I have proposed multiple times now that we extend the OOM handling to 
take memory allocated through file descriptors into account as well, but 
I can't find the time to fully upstream this.

T.J. Mercier is working on some memcg based tracking which sounds like 
it might resolve this problem as well.

Regards,
Christian.


>
> Thanks,
> -James
>
>>>>> Please take a look and comment.
>>>>>
>>>>> Thanks,
>>>>> Christian.
>>>>>
>>>>> [1] 
>>>>> https://lore.kernel.org/all/11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com/T/
>>
>

