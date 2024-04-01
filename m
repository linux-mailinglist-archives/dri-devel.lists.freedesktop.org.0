Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E7B89411D
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 18:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943AE10F0F7;
	Mon,  1 Apr 2024 16:37:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="I4H2ACEX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2098.outbound.protection.outlook.com [40.107.93.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D00C910E619;
 Mon,  1 Apr 2024 16:37:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dNpKatxkKvO382+XW2joWjekJajvsQ7p0l2QHByODXTe3V2e41ihv9eEl9gDpkPQiP+NIwNJRMIX+Nt5F2lHAS7pgy7kRVsv+PKKQum6OY+EeiP6CYnEVCdqD8kt265WZ2hK/oA6SkDTqrw7Nuhzlt4siOkpWJQUfoKhqaXSgHtPYKzPGWaZXrARtVPRvRH6V7Kblbh/Wsj5TMkcLKkA9myW/xiKi+kOm5PhavW1z62tcrFwSn5uag7auZrF5khiCPkNu4VWS2OqheaVANiTYDlTQh4wunaPB97IGmjv4lElr92Fl58uyq8AO7mNtk8dhDD6Bdznc+WB+3ymufYylg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7kGZoSyXZZ/wdf+5r05KceK5nK8C5QJIu8SW3ZeCRNs=;
 b=fsSPxijJlJubUUJ9c7ZadqmGXnlwPQ6Rktj3I8jQSfwQXtgIkbGUTCXbUa7VGKvm7DEK9laB/7VvzgsIXA84SbOmzHKHfPfueFaRmaCchpezKD77jS0SxM3x9RB/+1YufSNv+tCrgR0NLQM0ppQhIQAaZ7zBldyFmVq571AHtnYu7TDglJtZxQloZyVJBVwGnHYNlg9MrzN+WDDRZODU4T3eSwJpEQx/eKgT/lxqkQUAdAP/aGFoO/Ywr4hVQzj01M2/1B+6XKF6Dq0WEikvkLnnH3UYrkm8Kx67wOFtVMPB76KP7T69Zh9V/YIcu6JEwit6gWNuwAKQOYze+dmfMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7kGZoSyXZZ/wdf+5r05KceK5nK8C5QJIu8SW3ZeCRNs=;
 b=I4H2ACEXsYNzzmQkoRZGvlBznQqHLDEbpyzDZFKHIdf6yPT1DIyYG7dySkitxdLgagmSAanVx9xiXWGJqAYHrRKaxvF0h5qel0vFPCx1A/GgTK2d3pXTQ/vXxC8kQlDTeoEgd5ei9n2sNwcOFqsWjQsY2XhyJYd2KWVdrCWEir4=
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CY8PR12MB7220.namprd12.prod.outlook.com (2603:10b6:930:58::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 16:37:45 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::8099:8c89:7b48:beed]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::8099:8c89:7b48:beed%7]) with mapi id 15.20.7409.042; Mon, 1 Apr 2024
 16:37:45 +0000
Message-ID: <c2caebaa-7735-4c42-9ec1-1426f5896016@amd.com>
Date: Mon, 1 Apr 2024 12:37:42 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: Proposal to add CRIU support to DRM render nodes
To: Tvrtko Ursulin <tursulin@ursulin.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 criu@openvz.org
Cc: "Errabolu, Ramesh" <Ramesh.Errabolu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <03a9977c-2044-40c7-9688-9ab326abb81c@amd.com>
 <81c7b2c3-564a-4946-832b-5394cd19a7b7@ursulin.net>
 <b5134b40-6e84-47c9-a4f2-2a2c0faa9481@ursulin.net>
 <330606ad-4236-4b2c-9606-b51ec6567a25@amd.com>
 <a9b7e59f-7269-414b-a9f9-68107dc81c8b@ursulin.net>
 <2e2a49bc-1698-4b61-88ad-0ee53ad4d774@ursulin.net>
 <13062848-6538-443f-b204-e61ac4f1d4ec@amd.com>
 <f1ad96c0-2c35-4b5b-bf82-75884e3ac960@ursulin.net>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <f1ad96c0-2c35-4b5b-bf82-75884e3ac960@ursulin.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0237.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::32) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|CY8PR12MB7220:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XWhYJKre8fJU8oOYzkBTMDEWCUL1JHOgOhxk1BuSQ75TypneCpXYejAfeS/ceP6Ro4W5lUy77igyCC7z3wB+qNkQkFhNT3X2vRfZO/cYLwpwzbzzahDmU90gPFWO6yI0hthSL+7njJD78lls5g5J81A/Sizx32gnB2VK3Oodp7j/tUzeBCt+At1jTC2XBlLdu1CoLHwld4S7BmCQfsacijERhj+fyivqBhr4vDEskJzJVMxojmJLHDGFD60ctxXX342lGSOzuKQeMKAsyf93d5G656L8qIXhBKdDjBpyY1HlmcjCZJkDw6AvAO8dfI9+e4WrP4G9j9gI7YzmiaYUowJu//thUOX02q6HVmTe4iEMMc07JBM9bp2Ph9LYtXQxzFy0h1iS0/rNT8GXraaZ4v6tJCbq07cx8EmVzX/qKAzmcW/4Zpq/zkoE5i7JDGiGjlTg73yZgkhaemjeZ2D4Gq10sNQBoq/CxnwStMXt4thg+mhg5NGmPchqhrjdbd758gEOd4AViS+qtkuNEOQaaZCt0E8gtXevG47XVPzkqpoIGGYMGW7H8MVA5GLli0lClfq+tpVY5hdZJy5hx1i4x5flrczvF4g4Nt2azGzyq4+2nqEAEW9aKbIsEcXGQsssphAXqDX662AXgZ12HqC1DBO+aDC2aBkbbKA8bwmJVsg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(3613699003); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlAwMGVBQUI5WGVTU3ZOMEhyNHpzU1NkY1kybU1sNFRISmlab2ZOcXI4MXI2?=
 =?utf-8?B?N3ozcmRrd0pKTVNkSnVPaC9uZTIyb3pQZGVIMEpmUUI4b0oxTjd0WnBxc1ha?=
 =?utf-8?B?RXpZTWZPSjJDTG1OUlFCWVduY3JvVXVVZkJhMzdUSzh3Wktpd0NnRWcyUFFn?=
 =?utf-8?B?MElpMVRJTkdSZ2ZnUTBnZGhiMlBHN2tyQU9lancvcU1FTUlrQjd6ZVV6aE9a?=
 =?utf-8?B?djRKRWQwd0gzcS9GcWdwcGFEb0c0YnJXTjA1VXRhOFR3SG9Uc09rOHVpYUJw?=
 =?utf-8?B?aU5NRzJOZnV3OGpJMnJDeHRieGIzSGRRR05YeE85cTVlTEM2WGp0NXROLytk?=
 =?utf-8?B?OXgyT1VGUXJiSGtKZnlpRjhTYVZIRHovcGZwWVZXM0s1L3U5clppbTNwSXg3?=
 =?utf-8?B?dzMyOTZzVDkvWkpTWGY4S29vbFRBak9DTjJ3bjMxb1pBMlRIcFV6YVg1R1hD?=
 =?utf-8?B?QWZrMW1Id09iUVRMQkVBRHd6NTM3a0FFOHZsNXMxRFh4VElzVEY4RWhqalQz?=
 =?utf-8?B?UkdGSFZ0MnlJUTFpQUJSZy9mOU1KMUU2VkJMRmtTUWFHd1N3Vkh0eVZlR2xM?=
 =?utf-8?B?QzRkMEF5d2k4TmpYd3VHWjdUMU45aDNyanRxNmcrWU51NVFXZUVsa1ZPdHRl?=
 =?utf-8?B?cU0ySlBJK05SWFcrK3lxaGtEc0RlZDNvTkc2Y3d4WWg2YjA1NkhkYjBKUVhE?=
 =?utf-8?B?V1dYaXZRUHZJUVRwNFllcmRZekcyZzVjMU5wQk1nQmNFbUpsZGR6ZGZraTcw?=
 =?utf-8?B?L2prTUU2WkRQaEdNczE1VlNidi9yL0dyQkQ1ZE1hVnBxTTM4QTNqN1l1a1VG?=
 =?utf-8?B?b2RBZHhGWHFhZm5TM0dkaTQyN0FlL2V2UmY0WEFwMzJOSkVrUzZUY2duRXJ4?=
 =?utf-8?B?N3EzdU9aRkJDNE1aZlk4c1dGZlc2V1RNQlJaMHdTS0RzV2J2U1I4amQ2WVBG?=
 =?utf-8?B?cFNsdjZYWHR1UHp2YW9VM25jbFRpd0J3MWRyVnIxM2t5LzRCb2dTUmlGV3ZE?=
 =?utf-8?B?Z2VwMldDYkM0NE5iUmh0bTIxUUNrdVZyUWRKRE9WZk04eUJnODZGY0grYVE2?=
 =?utf-8?B?cklod2NNcFEzalUyMmpGb2lxbmVCNTZQeFN5cEJtRXZjdUdNb2tKVDk4R0pm?=
 =?utf-8?B?cUE0b2I3SjVOdWdPYmg3dUYxS2c4RVdxNFJkamwybHplRFhaNzE2TmxJc1V6?=
 =?utf-8?B?SXcxU3lveGlQVnljck95RWgyRGZOb0YvdE9qZEhTNTk5bU1vY20zalI4QlNj?=
 =?utf-8?B?Zkt1dmNiQ0pKc1hLR2xjcmhWekxReHpLanFYNXg2a1hlNnVCMUZTQlgrbkFn?=
 =?utf-8?B?MERIRWNZNkd2Rm52c3VpOW1RM2ZEZXAzZzFydEpvWmpGRHFEbVIxa2hCNGZn?=
 =?utf-8?B?dWJSQUlQWXNuYWVXdUo4Qm9wV21GVUYvanpYRzR2QWtkbEU4YTl5UVFBVlVK?=
 =?utf-8?B?OERyYnBmMzB2TTE5dmxqT0lBQW9xRjRieFROZVJDQ044MUFRdk9mU3g5eUtO?=
 =?utf-8?B?b3NEbG5uU2Y3QkZZL1loZlFPQUV6Y1czYXljWFB0MHJmVjM4cDlRWUxMMlJU?=
 =?utf-8?B?ZUJEZmR2NUxlWjRtbm4vdFFDaE9QSFI4QVFtM3RxYkEzeVhZZFgrMTYvMXJm?=
 =?utf-8?B?UnQ0SThkZGNIN0pkRG8zZytBdjY4S1lKdlprT2d1WlUweFdiakFqaFJZWWFL?=
 =?utf-8?B?OFBhT0VjdjNoenhwZXQvaG0xWkdkVkljTVpYVXpJR2wybmVIYUo5NnZEYVk0?=
 =?utf-8?B?SnNaWUlwTnA2ZHRsWlNNT2Rpbm5pR2RSWVF6a09rRmpEeTRqclhMNFBJbnNV?=
 =?utf-8?B?Snk1SHJvZnlBQzBvTGpQUWdMaDhpTm5BWVJvQlJsQnpvU0V3K2NCekZYTFBS?=
 =?utf-8?B?c2IramhNcm9hWU9LelY5R3A5OVBqSXdKck1rTEtsWlA4Qkh2Y3Z4NDRveHBq?=
 =?utf-8?B?c2krTVZ0QTVSZTEvTVczaEFRaEgzYzMvOWgwMmZ6SmR5dzNEbFRnYWdWRFdC?=
 =?utf-8?B?UUVhYVZJT3FlV3BqRWEzbndNa3RpSDg0QnM0aFhTTXhPTmZxUVJ3ekpPNEl2?=
 =?utf-8?B?ampwNk94aEJNM2dnYWtOK1RGckpESDdFZU1GcVZvUzVGTE1RMVd0d005SDBH?=
 =?utf-8?Q?gqqP9SvU1T9gW97bkvj6YSpfb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a60f4c-74d4-4f69-5e60-08dc526a0ec4
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 16:37:44.9277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XoB1F5VVaocMB9oYIF6zijnMauw1rhY/iaue/jFlO9PB8JgJqLFW4/HQHbabT8NMuhM97/ouMhexP7qkQnQBZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7220
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

On 2024-04-01 11:09, Tvrtko Ursulin wrote:
>
> On 28/03/2024 20:42, Felix Kuehling wrote:
>>
>> On 2024-03-28 12:03, Tvrtko Ursulin wrote:
>>>
>>> Hi Felix,
>>>
>>> I had one more thought while browsing around the amdgpu CRIU plugin. 
>>> It appears it relies on the KFD support being compiled in and 
>>> /dev/kfd present, correct? AFAICT at least, it relies on that to 
>>> figure out the amdgpu DRM node.
>>>
>>> In would be probably good to consider designing things without that 
>>> dependency. So that checkpointing an application which does not use 
>>> /dev/kfd is possible. Or if the kernel does not even have the KFD 
>>> support compiled in.
>>
>> Yeah, if we want to support graphics apps that don't use KFD, we 
>> should definitely do that. Currently we get a lot of topology 
>> information from KFD, not even from the /dev/kfd device but from the 
>> sysfs nodes exposed by KFD. We'd need to get GPU device info from the 
>> render nodes instead. And if KFD is available, we may need to 
>> integrate both sources of information.
>>
>>
>>>
>>> It could perhaps mean no more than adding some GPU discovery code 
>>> into CRIU. Which shuold be flexible enough to account for things 
>>> like re-assigned minor numbers due driver reload.
>>
>> Do you mean adding GPU discovery to the core CRIU, or to the plugin. 
>> I was thinking this is still part of the plugin.
>
> Yes I agree. I was only thinking about adding some DRM device 
> discovery code in a more decoupled fashion from the current plugin, 
> for both the reason discussed above (decoupling a bit from reliance on 
> kfd sysfs), and then also if/when a new DRM driver might want to 
> implement this the code could be move to some common plugin area.
>
> I am not sure how feasible that would be though. The "gpu id" concept 
> and it's matching in the current kernel code and CRIU plugin - is that 
> value tied to the physical GPU instance or how it works?

The concept of the GPU ID is that it's stable while the system is up, 
even when devices get added and removed dynamically. It was baked into 
the API early on, but I don't think we ever fully validated device hot 
plug. I think the closest we're getting is with our latest MI GPUs and 
dynamic partition mode change.

This also highlights another aspect on those spatially partitioned GPUs. 
GPU IDs identify device partitions, not devices. Similarly, each 
partition has its own render node, and the KFD topology info in sysfs 
points to the render-minor number corresponding to each GPU ID.

Regards,
   Felix


>
>>> Otherwise I am eagerly awaiting to hear more about the design 
>>> specifics around dma-buf handling. And also seeing how to extend to 
>>> other DRM related anonymous fds.
>>
>> I've been pretty far under-water lately. I hope I'll find time to 
>> work on this more, but it's probably going to be at least a few weeks.
>
> Got it.
>
> Regards,
>
> Tvrtko
>
>>
>> Regards,
>>    Felix
>>
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>> On 15/03/2024 18:36, Tvrtko Ursulin wrote:
>>>>
>>>> On 15/03/2024 02:33, Felix Kuehling wrote:
>>>>>
>>>>> On 2024-03-12 5:45, Tvrtko Ursulin wrote:
>>>>>>
>>>>>> On 11/03/2024 14:48, Tvrtko Ursulin wrote:
>>>>>>>
>>>>>>> Hi Felix,
>>>>>>>
>>>>>>> On 06/12/2023 21:23, Felix Kuehling wrote:
>>>>>>>> Executive Summary: We need to add CRIU support to DRM render 
>>>>>>>> nodes in order to maintain CRIU support for ROCm application 
>>>>>>>> once they start relying on render nodes for more GPU memory 
>>>>>>>> management. In this email I'm providing some background why we 
>>>>>>>> are doing this, and outlining some of the problems we need to 
>>>>>>>> solve to checkpoint and restore render node state and shared 
>>>>>>>> memory (DMABuf) state. I have some thoughts on the API design, 
>>>>>>>> leaning on what we did for KFD, but would like to get feedback 
>>>>>>>> from the DRI community regarding that API and to what extent 
>>>>>>>> there is interest in making that generic.
>>>>>>>>
>>>>>>>> We are working on using DRM render nodes for virtual address 
>>>>>>>> mappings in ROCm applications to implement the CUDA11-style VM 
>>>>>>>> API and improve interoperability between graphics and compute. 
>>>>>>>> This uses DMABufs for sharing buffer objects between KFD and 
>>>>>>>> multiple render node devices, as well as between processes. In 
>>>>>>>> the long run this also provides a path to moving all or most 
>>>>>>>> memory management from the KFD ioctl API to libdrm.
>>>>>>>>
>>>>>>>> Once ROCm user mode starts using render nodes for virtual 
>>>>>>>> address management, that creates a problem for checkpointing 
>>>>>>>> and restoring ROCm applications with CRIU. Currently there is 
>>>>>>>> no support for checkpointing and restoring render node state, 
>>>>>>>> other than CPU virtual address mappings. Support will be needed 
>>>>>>>> for checkpointing GEM buffer objects and handles, their GPU 
>>>>>>>> virtual address mappings and memory sharing relationships 
>>>>>>>> between devices and processes.
>>>>>>>>
>>>>>>>> Eventually, if full CRIU support for graphics applications is 
>>>>>>>> desired, more state would need to be captured, including 
>>>>>>>> scheduler contexts and BO lists. Most of this state is 
>>>>>>>> driver-specific.
>>>>>>>>
>>>>>>>> After some internal discussions we decided to take our design 
>>>>>>>> process public as this potentially touches DRM GEM and DMABuf 
>>>>>>>> APIs and may have implications for other drivers in the future.
>>>>>>>>
>>>>>>>> One basic question before going into any API details: Is there 
>>>>>>>> a desire to have CRIU support for other DRM drivers?
>>>>>>>
>>>>>>> This sounds like a very interesting feature on the overall, 
>>>>>>> although I cannot answer on the last question here.
>>>>>>
>>>>>> I forgot to finish this thought. I cannot answer / don't know of 
>>>>>> any concrete plans, but I think feature is pretty cool and if 
>>>>>> amdgpu gets it working I wouldn't be surprised if other drivers 
>>>>>> would get interested.
>>>>>
>>>>> Thanks, that's good to hear!
>>>>>
>>>>>
>>>>>>
>>>>>>> Funnily enough, it has a tiny relation to an i915 feature I 
>>>>>>> recently implemented on Mesa's request, which is to be able to 
>>>>>>> "upload" the GPU context from the GPU hang error state and 
>>>>>>> replay the hanging request. It is kind of (at a stretch) a very 
>>>>>>> special tiny subset of checkout and restore so I am not 
>>>>>>> mentioning it as a curiosity.
>>>>>>>
>>>>>>> And there is also another partical conceptual intersect with the 
>>>>>>> (at the moment not yet upstream) i915 online debugger. This part 
>>>>>>> being in the area of discovering and enumerating GPU resources 
>>>>>>> beloning to the client.
>>>>>>>
>>>>>>> I don't see an immediate design or code sharing opportunities 
>>>>>>> though but just mentioning.
>>>>>>>
>>>>>>> I did spend some time reading your plugin and kernel 
>>>>>>> implementation out of curiousity and have some comments and 
>>>>>>> questions.
>>>>>>>
>>>>>>>> With that out of the way, some considerations for a possible 
>>>>>>>> DRM CRIU API (either generic of AMDGPU driver specific): The 
>>>>>>>> API goes through several phases during checkpoint and restore:
>>>>>>>>
>>>>>>>> Checkpoint:
>>>>>>>>
>>>>>>>>  1. Process-info (enumerates objects and sizes so user mode can 
>>>>>>>> allocate
>>>>>>>>     memory for the checkpoint, stops execution on the GPU)
>>>>>>>>  2. Checkpoint (store object metadata for BOs, queues, etc.)
>>>>>>>>  3. Unpause (resumes execution after the checkpoint is complete)
>>>>>>>>
>>>>>>>> Restore:
>>>>>>>>
>>>>>>>>  1. Restore (restore objects, VMAs are not in the right place 
>>>>>>>> at this time)
>>>>>>>>  2. Resume (final fixups after the VMAs are sorted out, resume 
>>>>>>>> execution)
>>>>>>>
>>>>>>> Btw is check-pointing guaranteeing all relevant activity is 
>>>>>>> idled? For instance dma_resv objects are free of fences which 
>>>>>>> would need to restored for things to continue executing 
>>>>>>> sensibly? Or how is that handled?
>>>>>
>>>>> In our compute use cases, we suspend user mode queues. This can 
>>>>> include CWSR (compute-wave-save-restore) where the state of 
>>>>> in-flight waves is stored in memory and can be reloaded and 
>>>>> resumed from memory later. We don't use any fences other than 
>>>>> "eviction fences", that are signaled after the queues are 
>>>>> suspended. And those fences are never handed to user mode. So we 
>>>>> don't need to worry about any fence state in the checkpoint.
>>>>>
>>>>> If we extended this to support the kernel mode command submission 
>>>>> APIs, I would expect that we'd wait for all current submissions to 
>>>>> complete, and stop new ones from being sent to the HW before 
>>>>> taking the checkpoint. When we take the checkpoint in the CRIU 
>>>>> plugin, the CPU threads are already frozen and cannot submit any 
>>>>> more work. If we wait for all currently pending submissions to 
>>>>> drain, I think we don't need to save any fence state because all 
>>>>> the fences will have signaled. (I may be missing some intricacies 
>>>>> and I'm afraid it may not be that simple in reality, but that's my 
>>>>> opening bid. ;)
>>>>
>>>> It feels feasible to me too, for the normally behaving clients at 
>>>> least.
>>>>
>>>> Presumably, given that the whole checkpointing is not instant, it 
>>>> would be okay to wait a second or two longer for the in-progress 
>>>> submissions complete. After which kernel would need to prune all 
>>>> signalled fences from the respective container objects before 
>>>> checkpointing.
>>>>
>>>> For the "misbehaving" clients who have perhaps queued up too much 
>>>> work, either still in the scheduler with unsatisfied dependencies, 
>>>> or already submitted to the hardware and/or driver backend, is 
>>>> there a timeout concept in CRIU so it would be possible to say 
>>>> something like "try to checkpoint but if the kernel says no time 
>>>> period t then give up"?
>>>>
>>>>>>>> For some more background about our implementation in KFD, you 
>>>>>>>> can refer to this whitepaper: 
>>>>>>>> https://github.com/checkpoint-restore/criu/blob/criu-dev/plugins/amdgpu/README.md
>>>>>>>>
>>>>>>>> Potential objections to a KFD-style CRIU API in DRM render 
>>>>>>>> nodes, I'll address each of them in more detail below:
>>>>>>>>
>>>>>>>>   * Opaque information in the checkpoint data that user mode can't
>>>>>>>>     interpret or do anything with
>>>>>>>>   * A second API for creating objects (e.g. BOs) that is 
>>>>>>>> separate from
>>>>>>>>     the regular BO creation API
>>>>>>>>   * Kernel mode would need to be involved in restoring BO sharing
>>>>>>>>     relationships rather than replaying BO creation, export and 
>>>>>>>> import
>>>>>>>>     from user mode
>>>>>>>>
>>>>>>>> # Opaque information in the checkpoint
>>>>>>>>
>>>>>>>> This comes out of ABI compatibility considerations. Adding any 
>>>>>>>> new objects or attributes to the driver/HW state that needs to 
>>>>>>>> be checkpointed could potentially break the ABI of the CRIU 
>>>>>>>> checkpoint/restore ioctl if the plugin needs to parse that 
>>>>>>>> information. Therefore, much of the information in our KFD CRIU 
>>>>>>>> ioctl API is opaque. It is written by kernel mode in the 
>>>>>>>> checkpoint, it is consumed by kernel mode when restoring the 
>>>>>>>> checkpoint, but user mode doesn't care about the contents or 
>>>>>>>> binary layout, so there is no user mode ABI to break. This is 
>>>>>>>> how we were able to maintain CRIU support when we added the SVM 
>>>>>>>> API to KFD without changing the CRIU plugin and without 
>>>>>>>> breaking our ABI.
>>>>>>>>
>>>>>>>> Opaque information may also lend itself to API abstraction, if 
>>>>>>>> this becomes a generic DRM API with driver-specific callbacks 
>>>>>>>> that fill in HW-specific opaque data.
>>>>>>>
>>>>>>> This feels sound in principle to me. Fundamentally the state is 
>>>>>>> very hardware specfic, and/or driver version specific, so I 
>>>>>>> don't see anything could be gained in practice by making it much 
>>>>>>> less opaque. (Apart from making things more complicated.)
>>>>>>>
>>>>>>> I was however unsure of the current split of how you dump buffer 
>>>>>>> objects with some data in the defined bo structure, and some in 
>>>>>>> completely opaque private data. Is there a benefit to that 
>>>>>>> split, or maybe in other words, is there a benefit on having 
>>>>>>> part transparent and part opaque for buffer objects?
>>>>>
>>>>> Some of the buffer object state is needed by the plugin. E.g. the 
>>>>> size and mmap offset are needed to match VMAs with BOs. I'd have 
>>>>> to review the plugin in detail to prove that all the fields are, 
>>>>> in fact, needed by the plugin, but that was the intent. Anything 
>>>>> that the plugin doesn't need to know should be in the opaque data 
>>>>> structures.
>>>>
>>>> Right, got it.
>>>>
>>>> Would it make sense to make the opaque data in the same block as 
>>>> the defined one? I mean instead of separating the two in the binary 
>>>> image for instance have struct kfd_criu_bo_bucket have a trailing 
>>>> priv_data blob? Maybe it is too late now if the image format is not 
>>>> versioned or something.
>>>>
>>>>>>> To slightly touch upon the question of whether this could become 
>>>>>>> a generic DRM API. It feels it would be hard to do it from the 
>>>>>>> start. What sounds more feasible is if/when generic looking 
>>>>>>> helpers can be spotted while developing the RFC then potentially 
>>>>>>> structure the code they can easily be promoted to shared/common 
>>>>>>> at some future moment.
>>>>>
>>>>> Yes, that's how this usually goes, in my experience. Thanks for 
>>>>> confirming.
>>>>>
>>>>>
>>>>>>>
>>>>>>>> # Second API for creating objects
>>>>>>>>
>>>>>>>> Creating BOs and other objects when restoring a checkpoint 
>>>>>>>> needs more information than the usual BO alloc and similar APIs 
>>>>>>>> provide. For example, we need to restore BOs with the same GEM 
>>>>>>>> handles so that user mode can continue using those handles 
>>>>>>>> after resuming execution. If BOs are shared through DMABufs 
>>>>>>>> without dynamic attachment, we need to restore pinned BOs as 
>>>>>>>> pinned. Validation of virtual addresses and handling MMU 
>>>>>>>> notifiers must be suspended until the virtual address space is 
>>>>>>>> restored. For user mode queues we need to save and restore a 
>>>>>>>> lot of queue execution state so that execution can resume cleanly.
>>>>>>>
>>>>>>> This also sounds justified to me. Restore creating all internal 
>>>>>>> objects is definitely special and sounds better to add uapi to 
>>>>>>> create them directly with the correct properties, than to add 
>>>>>>> uapi to adjust internal properties after creation. And in case 
>>>>>>> you would always need some new uapi - so at least to adjust 
>>>>>>> after creation. At which point you may have both in one. 
>>>>>>> Internally implementation can be split or common, whatever makes 
>>>>>>> sense for a given object type, but new uapi definitely sounds is 
>>>>>>> required.
>>>>>>>> # Restoring buffer sharing relationships
>>>>>>>>
>>>>>>>> Different GEM handles in different render nodes and processes 
>>>>>>>> can refer to the same underlying shared memory, either by 
>>>>>>>> directly pointing to the same GEM object, or by creating an 
>>>>>>>> import attachment that may get its SG tables invalidated and 
>>>>>>>> updated dynamically through dynamic attachment callbacks. In 
>>>>>>>> the latter case it's obvious, who is the exporter and who is 
>>>>>>>> the importer. In the first case, either one could be the 
>>>>>>>> exporter, and it's not clear who would need to create the BO 
>>>>>>>> and who would need to 
>>>>>>>
>>>>>>> To see if I follow the former case correctly.
>>>>>>>
>>>>>>> This could be two clients A and B, where B has imported a 
>>>>>>> dma-buf shared BO from A and has since closed the dma-buf fd? 
>>>>>>> Which results in a single BO with reference count of 2 and 
>>>>>>> obj->import_attach unset. History of who created the object is 
>>>>>>> lost.
>>>>>
>>>>> Yes. In the amdgpu driver this happens when the exporter and 
>>>>> import device are the same.
>>>>>
>>>>>
>>>>>>>
>>>>>>> In fact it could even be that two imported objects remain 
>>>>>>> (clients A, B and C) and A, who originally created the BO, has 
>>>>>>> since fully released it. So any kind of "creator" tracking if 
>>>>>>> added wouldn't be fully reliable either.
>>>>>
>>>>> That's a good point.
>>>>>
>>>>>
>>>>>>>
>>>>>>>> import it when restoring the checkpoint. To further complicate 
>>>>>>>> things, multiple processes in a checkpoint get restored 
>>>>>>>> concurrently. So there is no guarantee that an exporter has 
>>>>>>>> restored a shared BO at the time an importer is trying to 
>>>>>>>> restore its import.
>>>>>>>>
>>>>>>>> A proposal to deal with these problems would be to treat 
>>>>>>>> importers and exporters the same. Whoever restores first, ends 
>>>>>>>> up creating the BO and potentially attaching to it. The other 
>>>>>>>> process(es) can find BOs that were already restored by another 
>>>>>>>> process by looking it up with a unique ID that could be based 
>>>>>>>> on the DMABuf inode number. An alternative would be a two-pass 
>>>>>>>> approach that needs to restore BOs on two passes:
>>>>>>>>
>>>>>>>>  1. Restore exported BOs
>>>>>>>>  2. Restore imports
>>>>>>>>
>>>>>>>> With some inter-process synchronization in CRIU itself between 
>>>>>>>> these two passes. This may require changes in the core CRIU, 
>>>>>>>> outside our plugin. Both approaches depend on identifying BOs 
>>>>>>>> with some unique ID that could be based on the DMABuf inode 
>>>>>>>> number in the checkpoint. However, we would need to identify 
>>>>>>>> the processes in the same restore session, possibly based on 
>>>>>>>> parent/child process relationships, to create a scope where 
>>>>>>>> those IDs are valid during restore.
>>>>>>>
>>>>>>> If my understanding above is on the right track, then I think 
>>>>>>> this is the only thing which can be done (for all scenarios).
>>>>>
>>>>> I presented two alternatives. I think you're in favor of the first 
>>>>> one, where it doesn't matter who is the importer and exporter. I 
>>>>> think the two-pass approach requires that you can identify an 
>>>>> exporter. And as you pointed out, the exporter may already have 
>>>>> dropped their reference to the BO.
>>>>
>>>> Yep.
>>>>
>>>>>>> I also *think* it would be safe. At least at the moment I cannot 
>>>>>>> think what could go wrong. Semantics are that it doesn't really 
>>>>>>> matter who created the object.
>>>>>
>>>>> I would agree. What matters is that the object is recreated on the 
>>>>> correct device, and that all the direct references and import 
>>>>> attachments pointing to it are restored.
>>>>>
>>>>>
>>>>>>>
>>>>>>>> Finally, we would also need to checkpoint and restore DMABuf 
>>>>>>>> file descriptors themselves. These are anonymous file 
>>>>>>>> descriptors. The CRIU plugin could probably be taught to 
>>>>>>>> recreate them from the original exported BO based on the inode 
>>>>>>>> number that could be queried with fstat in the checkpoint. It 
>>>>>>>> would need help from the render node CRIU API to find the right 
>>>>>>>> BO from the inode, which may be from a different process in the 
>>>>>>>> same restore session.
>>>>>>>
>>>>>>> This part feels like it is breaking the component separation a 
>>>>>>> bit because even for buffers fully owned by amdgpu, strictly 
>>>>>>> speaking the dma-buf fd is not. At least my understanding from 
>>>>>>> the above is that you propose to attempt to import the fd, from 
>>>>>>> the kernel side, during the checkpoint process? Like:
>>>>>>>
>>>>>>> Checkpoint:
>>>>>>>
>>>>>>> CRIU for each anon fd:
>>>>>>>    amdgpu_plugin(fd)
>>>>>>>      -> attempt in kernel dma buf import (passes fd to kernel 
>>>>>>> via ioctl?)
>>>>>>>          -> is it ours? (no -> error)
>>>>>>>              -> create a record mapping fd number to amdgpu BO
>>>>>>>
>>>>>>> Restore:
>>>>>>>
>>>>>>> for each dma-buf fd record:
>>>>>>>     create BO if does not exists
>>>>>>>     export BO to same fd
>>>>>>>     close BO handle if not in regular BO handle records
>>>>>>>
>>>>>>> Or since you mention lookup by inode, that would need to be 
>>>>>>> dmabuf_plugin so it can lookup inodes in the private mount 
>>>>>>> space. However how would it co-operate with amdgpu_plugin is not 
>>>>>>> clear to me.
>>>>>
>>>>> The way I think about the ownership is, whichever driver created 
>>>>> the underlying BO owns the checkpointing of the dmabuf. You need 
>>>>> driver-specific information to link the dmabuf with the driver's 
>>>>> BO and you need the right driver to recreate the BO and the dmabuf 
>>>>> fd when restoring the checkpoint.
>>>>>
>>>>> It gets really interesting if you have an amdgpu plugin and an 
>>>>> i915 plugin, and they checkpoint an application that shares BOs 
>>>>> between the two devices through DMABufs. E.g. if i915 created a BO 
>>>>> and amdgpu imported it, then during restore, i915 needs to restore 
>>>>> the dmabuf before the amdgpu import of it can be restored. I think 
>>>>> that brings us back to a two-phase approach to restoring the 
>>>>> memory sharing relationships. Uff.
>>>>
>>>> I think this part of the discussion somewhat depends on the 
>>>> previous part about idling. If it is feasible to completely idle 
>>>> and prune, and fail if that is not happening quickly enough, then 
>>>> maybe there wouldn't be too much hierarchical state to save.
>>>>
>>>> Otherwise my idea was that there is a top-level drm_plugin.so which 
>>>> understands amdgpu fds, i915, syncobj, sync_file, and uses some new 
>>>> uapi to uniquely identify each, associate with the correct driver, 
>>>> and then internally dispatches to amdgpu|i915|dmabuf|..._plugin.so. 
>>>> Building the in memory representation of their relationships. As 
>>>> long as all objects and their relationships have been recorded I 
>>>> think everything could then be correctly restored.
>>>>
>>>> It is possible there is flaw in my thinking and that something in 
>>>> CRIU design would make this impossible? I think it would require 
>>>> the top-level drm_plugin.so to hold all state in memory until the 
>>>> whole checkpointing is done, and then verify something is not 
>>>> incomplete, failing it all if it was. (For instance one plugin 
>>>> discovered an reference to an object which was not discoverd by any 
>>>> other plugin or things like that.) May need some further tweaks to 
>>>> CRIU common code.
>>>>
>>>> Maybe I need to better understand how exactly you mean to query the 
>>>> DRM driver about random anonymous fds. I see it as a problem in the 
>>>> design, possibly even implementation, but maybe I am missing 
>>>> something which makes it not so. I mean even with my general idea I 
>>>> don't know how would one determine which driver to query about a 
>>>> particular anonymous inode.
>>>>
>>>>>> I later also realised that I was maybe increasing the scope for 
>>>>>> you here. :) You did state focus is ROCm applications which 
>>>>>> possibly doesn't care about dma-resv, fences, syncobjs etc?
>>>>>
>>>>> That's my focus for now. But I don't want to engineer a solution 
>>>>> that would preclude your use cases in the future.
>>>>>
>>>>>
>>>>>>
>>>>>> But I think the "how to handle dma-bufs" design question is still 
>>>>>> relevant and interesting. For example I had this thought that 
>>>>>> perhaps what would be needed is a CRIU plugin hierarchy.
>>>>>>
>>>>>> Because fundamentally we would be snapshoting a hierarcy of 
>>>>>> kernel objects belonging to different drivers (kfd, amdgpu, 
>>>>>> dma-buf, ...). And if one day someone would to try to handle dma 
>>>>>> fences and drm syncobjs, the argument for a hierarchial design 
>>>>>> would be even stronger I think.
>>>>>>
>>>>>> Something like a drm_plugin.so could call sub-plugins (amdgpu, 
>>>>>> dma-buf, sync file, ...) and internally build the representation 
>>>>>> of the whole state and how the relationship between the objects.
>>>>>
>>>>> Maybe. I guess a structure similar to libdrm makes sense. I'm not 
>>>>> sure it's strictly a hierarchy. Maybe more like some common code 
>>>>> shared by multiple GPU driver plugins. I think the common 
>>>>> checkpoint state is quite limited and restoring it requires the 
>>>>> GPU-specific drivers anyway.
>>>>>
>>>>> Also the idea of building a representation of the whole state 
>>>>> doesn't work well with the CRIU design, because "the whole state" 
>>>>> can include multiple processes that restore themselves 
>>>>> concurrently and only synchronize with each other in a few places 
>>>>> in the restore process. I feel, if we can work out how to 
>>>>> checkpoint and restore shared objects between processes, we can do 
>>>>> the same for shared objects between drivers without imposing a 
>>>>> strict hierarchy and some omniscient entity that needs to know 
>>>>> "the whole state".
>>>>
>>>> Okay, this continues on the same problem space as above. And you 
>>>> obviously know how CRIU works much better than me.
>>>>
>>>>>> With that kind of design there probably would be a need to define 
>>>>>> some common kernel side api and uapi, so all involved objects can 
>>>>>> be enumerated with some unique ids etc.
>>>>>>
>>>>>> Now.. the counter argument.. the more state from different 
>>>>>> drivers would one want to handle the bigger this project would 
>>>>>> get. Would it even be feasible is the question, to the point that 
>>>>>> it may be simpler to just run the workload in a VM via SR-IOV and 
>>>>>> simply hibernate the whole thin guest. :)
>>>>>
>>>>> Well, CRIU kind of tries to do that, but with containers instead 
>>>>> of VMs. ;)
>>>>
>>>> It would definitely be useful for hardware and drivers without 
>>>> SR-IOV support so lets hope it is doable. :)
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
