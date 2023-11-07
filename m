Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 027547E4660
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 17:52:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B5B10E62C;
	Tue,  7 Nov 2023 16:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::604])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF4810E62A;
 Tue,  7 Nov 2023 16:52:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JLyKTH4XLdFKTKmyH2/UYszxDRg8EToJ5gLcGXJr14yyRsTNs0Bls73BIFni3kXa7u8h3YIccE4bYyBSIqNoGLfDp3iZ4ycDg5BIp/2+EK7Y5yS4SfDaR85VGJlIJbQUAJCOHGyUEZBoSevwHfF//jmIO8rHl1pzXu0pPB9sbInj+LrOJBujYjkBi8ofs96SvQR4Da90xmlF/y2ZZPa03Lr2NPMcmPYsByeN0wlPECiBdnhS8Z+8wrhlJxLrTkHNKaKlKHxajHMCPEHcLBDLEz+pW4+ZJbbKyaRMrcCCg5cbI6TeRsgRNRG+jB9KJ85qOYq5pOJe83b1Xx8D1aE+Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=usWGuoz3fRJHKAitCgT32GA3oqjXya3h8wl2dJRh/rs=;
 b=mK4/EHjKRyYk78hgWN03CU8B/6WBJ3rwMcXyWgDaGK+NyNYADKSvk4OtEW8RRyKydN879/NC2lCOX94k8Twk2kIy9we5u3ShHGEBQVFBXet1TqdjQma+Ie1EtnRoRfQWZjGkI0F84Owe8kGuEOF6pPae00vgkLWYe7uUBo9WMU4HOiU4EIpT+bEbX2odR9H8WPI5QboEyhvNpoySx2oYE91tAWx/vDKfPsQ9P3+Hyk5UkramZlfNz9ApmkfwB1nvuqKRro0ep6u4xMQ0IprXstLPklmDG/7RMQhwcaCxVUc2jfMy4kgWCIqOdVqqKIUbC//mE7kilpfoMLbuxD3L9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usWGuoz3fRJHKAitCgT32GA3oqjXya3h8wl2dJRh/rs=;
 b=GAzHTeuJ7OKB/d37fsZmlhq5G2tpLk9gWjgXG101Mp8AgHoNLPdKzfcJA7XgqiOhyUqm3epy2Ceat+zJh/Ez5CD/ZAZ8jf9kcBh97WVS6F344XMC/qi6L1CaHuqdhINf0oxeXoEzW15n1N1lmUb504vBnD+k7FFv4pyb1SOVY9U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH0PR12MB5418.namprd12.prod.outlook.com (2603:10b6:510:e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 16:52:14 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a%4]) with mapi id 15.20.6954.029; Tue, 7 Nov 2023
 16:52:14 +0000
Message-ID: <947016a2-8df2-4f76-86dc-a375c26d5f22@amd.com>
Date: Tue, 7 Nov 2023 11:52:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 06/17] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
Content-Language: en-US
To: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
References: <20231019212133.245155-1-harry.wentland@amd.com>
 <20231019212133.245155-7-harry.wentland@amd.com>
 <20231020142256.GA859375@toolbox> <20231020175703.09cd2578@eldfell>
 <20f33898-4c40-4854-a1e8-afaef52f6524@amd.com>
 <20231023111219.6e287958@eldfell>
 <bf69b740-dce7-94f1-293d-a4b274b52f55@nvidia.com>
 <20231026115747.44cbddad@eldfell> <20231026173003.GA319477@toolbox>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20231026173003.GA319477@toolbox>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0304.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::20) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH0PR12MB5418:EE_
X-MS-Office365-Filtering-Correlation-Id: 7197502b-8f91-4430-ad3b-08dbdfb1e485
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fYmfKscsEIC1TA+/lx0K2982yI67nqS3Q5FwGsWXmlRZk2gGazbCmYe1WZiIm5o8shWLPaMoNRRf99S/12tFjBhP9r8DLS5lX9myYb23sdnKWm8YgD5Z9W7Phcs2EfjIE2R6rjtyYuy8IjTyxz2zL7gOJpBmLMrWVPanI2DowoQkcHqfbVaBJ91bx8aJvRJvoe9Jm2cVjaiua4zTNKMsUEtMk1WG3XctEGLiaSr7h9Z4FPCfJmXEOPOhDCnNvPwhanSyunYmsrz2ogHzGCbCMZX1faOqpSbIsKCcT19rjjhWPpxakdQQacuN9SKLy0Nu7l5+VeKHYXzG9oq9ssIHmSfL0S4zGILuyOnUv+nSsfwLiE/BOrKB3eVVPcGF7SkrlZz9Y21Ekhqjxn06xksnvXYWUrVU9Flqg73xrA+4QXyVYQNO+pT0QXdMUJ2RRSGhaEunujh/1lm4wfECnN3IGX+cgXGDZWhMcXee5qsyCNtRr+eyhkS/tUizN2AVyu3vMqU/C53g2fso9Il6Y9LHBo8jzfEnaeUehK2hHRemsCUTXK81eUhRAaEnPqT5mVxvtswYN7z/GEXrEzC+Anic6Os7B/b9mW4uiKAd/7exo5mttetCiKjjcRWYBjDtoih4dUJRA0UZL7Eb44jQOF5QsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(346002)(366004)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(31686004)(478600001)(6506007)(6666004)(6512007)(2616005)(53546011)(6486002)(36756003)(31696002)(38100700002)(86362001)(5660300002)(110136005)(4001150100001)(44832011)(7416002)(316002)(66556008)(41300700001)(66476007)(83380400001)(54906003)(2906002)(26005)(66946007)(4326008)(8936002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmRLbFRXUTJocytFZmxhZjhTZ2UvYTAvdFpERWJTRTdKWlRmdFZyZTBwL2tp?=
 =?utf-8?B?VVBKYTl6SGNKZ2ZtelRIL2NsRk9OQ2dRekRqaW9WVHF2clZ5L3RmaS9aYWJr?=
 =?utf-8?B?dmd6ZHUzQXdLVVhodUZVQUlnTjFOeStUWmYxQVpTZnNralhvay85NVVHY2Zm?=
 =?utf-8?B?NFZFcEZiaUhDUlBJODhRZGZVVHl5bnBCTTBFUHJzVmNES0huL1Q1b0wvclFx?=
 =?utf-8?B?WVVoaHE5TEJXZWlLMWY1OENzSjMzbUwwNVQvaVVtanNsYkVseHpWK0RXcjVp?=
 =?utf-8?B?ZFpBOWFuM3RSUzIyVUFEZ2pjNzNYdHowYVN6ejhhYUlBK1FzelhKOTU5OVBz?=
 =?utf-8?B?Mk9qcU04YzJERFdLWXpISkpsci9EbUplRjl2bElzeVFlTllyTC9ET04vTFNz?=
 =?utf-8?B?TElqWm50QSt3emhrVmUzaXJGaG9uVjBSTmQ5K2VlMy90bFJDQkMrOWxVSVEv?=
 =?utf-8?B?WnhwWWJWdit6TnRVckJSdzc1V3JrbkNNUUltS1JWSG13cS8wN05jQTR6Tm9x?=
 =?utf-8?B?LzNaRDBWNzdGT3A4VmlUd2tpOUpLUFdmK3lrU0p6UGszYmZsMThjeUR0RVhx?=
 =?utf-8?B?b1lCN0RuRWw0a1VWRmlaYUVEbVFidnZrb0pndmdIQUxHVTc2elQ0SS8xVXVn?=
 =?utf-8?B?TDEzRENIbTJHMHo0TytOMW1pdktWNTAvdnJuS3hOTE90N1NiVmErVUVldFpt?=
 =?utf-8?B?REdVcG9sSmxVZ3BwVWozQ1pJRFJlNnBKSGZYL2N6QlkyRktRMGlWOEZNZm5Y?=
 =?utf-8?B?eEhqSGt1MTJlemdyc3R1SDlVUkpsWVpWOVlJYUFTRnVRL3Fac1czUFFqbGZZ?=
 =?utf-8?B?SzBDcEpkUmpPalFmSURJVEg5ZGpmRk1vSDl4N052dU9tWXExemx2T1NudHND?=
 =?utf-8?B?Nkd3QmZOT1FGRDhMOVF1c2NUY1JLOXZkQmhrMXpWMFNiRG5nRU5qb2RxcFZ1?=
 =?utf-8?B?V3N2VmprbUhsbWpZU2JJNFpReXkyaTJFN1cxaDZ5NFVhdmora25MNWk1Z0hp?=
 =?utf-8?B?c250aXV6Qm1lbzJwc1oxZUJjS3BqaHprRnpITGxyYm5qdU0vRDBrV3ArQ0Ux?=
 =?utf-8?B?NUFSZ04wMFhjK3NUUUU4a1ppVk1jYnp0WGhBU0pCcjlDc01CblFlQUxTLyto?=
 =?utf-8?B?bk04a1RKUUMyK0l0OEJ3cU1FK3E0b2o0OEZVNlBlZE9heFlDZHU0VlZYZU1v?=
 =?utf-8?B?SDhQOXlFczRtN1diOFkvelZCWTlFNkZRK2hUNmFMU2dTMGNyMjYyUmtUc3Az?=
 =?utf-8?B?VGxIcjBsVGw0N3U0a2Nhd2hMaFVzK0lMLzBDSkt5eXpkWmhKZG96dXlnSXpo?=
 =?utf-8?B?QmYxTjIvdklyWXBGMW41WXRLWnF2ODFVUnRYN2FPUkVtTTNRaldTT3RqRzY5?=
 =?utf-8?B?Y0szWUUrNFo5ZFBTS0U4Y1NFcHc1L2NnNlJzVHJINy9ZaHBPVGdtY3pYQzhS?=
 =?utf-8?B?bWtQNng2d1RnTWdOYXdiWWhoUThTQ0xxa3Voc09xb2dCc0lzV2R4UWdtKzhR?=
 =?utf-8?B?ZmJTbGpRTzhPdG5GQ0F2azZnZHN0NkEwZko1RVRsVDZrWEIyQjZFc1JNQk5K?=
 =?utf-8?B?NmphR3V2MDNXS09scnIyeXFVM2o5OGRYWE5id1gxS0Z2MDVVdUM4TXV6WWt2?=
 =?utf-8?B?R0ZYdm9IWnBubXdnOHpNdm1hdno5ZFo2VGxPOHE5b2hKeWxlWnV0WklHVEhZ?=
 =?utf-8?B?YjlNZTlaRVFwd21OVDJraisxZ2pSZDBOdk9PcytYMTZxNExJQ0JoeFhucXJP?=
 =?utf-8?B?SkxaNEZWdVI0c2hlVFlYOTJWcVRCdW8vZVRXUzQ2Y2R3b1M3bk1EakJhNEdo?=
 =?utf-8?B?ekZUT0FaMmlDdWlNRzJzRzFta1QxY2ZENHliNCtTOGo2MVovazJkK1dmd2ZE?=
 =?utf-8?B?eW9UNnhJRGRvVzNVUW50OWtXMGFkeEFqMGtydmdXU2syaUZSZ2pzcTRQZUhM?=
 =?utf-8?B?TnVTZUs2UXA0SGtTU01QVVpIV25GdU5vNEVZYUFoblRCaURSVm5WcytnNXE1?=
 =?utf-8?B?ZXhIYUI3UGFjSThYYk9DTjNJdzVxR29WWGo5MzRJZC9RWStWVTZFNk9YWkNW?=
 =?utf-8?B?d0RibHpQZlhlWG4xSllNTnUrTEdVMFNxb1ZILzYwd0J2MmE2N2NWamhGOW9n?=
 =?utf-8?Q?5imzpnVIlBTMn/Vi2aEEeAf4u?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7197502b-8f91-4430-ad3b-08dbdfb1e485
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 16:52:14.0861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WPt5P+d7U7U6/KAS3uXIJ8ek46vLxOseCd7iE2ari0mDs1eIesZ9v3V2SwD8QBzR5DzS7CDGUTXlDZLX77ZFMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5418
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
Cc: Sasha McIntosh <sashamcintosh@google.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 Hector Martin <marcan@marcan.st>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Victoria Brekenfeld <victoria@system76.com>, dri-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Joshua Ashton <joshua@froggi.es>, Aleix Pol <aleixpol@kde.org>,
 Naseer Ahmed <quic_naseer@quicinc.com>, Uma Shankar <uma.shankar@intel.com>,
 Christopher Braga <quic_cbraga@quicinc.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-10-26 13:30, Sebastian Wick wrote:
> On Thu, Oct 26, 2023 at 11:57:47AM +0300, Pekka Paalanen wrote:
>> On Wed, 25 Oct 2023 15:16:08 -0500 (CDT)
>> Alex Goins <agoins@nvidia.com> wrote:
>>
>>> Thank you Harry and all other contributors for your work on this. Responses
>>> inline -
>>>
>>> On Mon, 23 Oct 2023, Pekka Paalanen wrote:
>>>
>>>> On Fri, 20 Oct 2023 11:23:28 -0400
>>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>>   
>>>>> On 2023-10-20 10:57, Pekka Paalanen wrote:  
>>>>>> On Fri, 20 Oct 2023 16:22:56 +0200
>>>>>> Sebastian Wick <sebastian.wick@redhat.com> wrote:
>>>>>>     
>>>>>>> Thanks for continuing to work on this!
>>>>>>>
>>>>>>> On Thu, Oct 19, 2023 at 05:21:22PM -0400, Harry Wentland wrote:    

snip

>>
>>>>>> I think we also need a definition of "informational".
>>>>>>
>>>>>> Counter-example 1: a colorop that represents a non-configurable    
>>>>>
>>>>> Not sure what's "counter" for these examples?
>>>>>   
>>>>>> YUV<->RGB conversion. Maybe it determines its operation from FB pixel
>>>>>> format. It cannot be set to bypass, it cannot be configured, and it
>>>>>> will alter color values.  
>>>
>>> Would it be reasonable to expose this is a 3x4 matrix with a read-only blob and
>>> no BYPASS property? I already brought up a similar idea at the XDC HDR Workshop
>>> based on the principle that read-only blobs could be used to express some static
>>> pipeline elements without the need to define a new type, but got mixed opinions.
>>> I think this demonstrates the principle further, as clients could detect this
>>> programmatically instead of having to special-case the informational element.
>>
> 
> I'm all for exposing fixed color ops but I suspect that most of those
> follow some standard and in those cases instead of exposing the matrix
> values one should prefer to expose a named matrix (e.g. BT.601, BT.709,
> BT.2020).
> 

Agreed.

> As a general rule: always expose the highest level description. Going
> from a name to exact values is trivial, going from values to a name is
> much harder.
> 
>> If the blob depends on the pixel format (i.e. the driver automatically
>> chooses a different blob per pixel format), then I think we would need
>> to expose all the blobs and how they correspond to pixel formats.
>> Otherwise ok, I guess.
>>
>> However, do we want or need to make a color pipeline or colorop
>> conditional on pixel formats? For example, if you use a YUV 4:2:0 type
>> of pixel format, then you must use this pipeline and not any other. Or
>> floating-point type of pixel format. I did not anticipate this before,
>> I assumed that all color pipelines and colorops are independent of the
>> framebuffer pixel format. A specific colorop might have a property that
>> needs to agree with the framebuffer pixel format, but I didn't expect
>> further limitations.
> 
> We could simply fail commits when the pipeline and pixel format don't
> work together. We'll probably need some kind of ingress no-op node
> anyway and maybe could list pixel formats there if required to make it
> easier to find a working configuration.
> 

The problem with failing commits is that user-space has no idea why it
failed. If this means that userspace falls back to SW composition for
NV12 and P010 it would avoid HW offloading in one of the most important
use-cases on AMD HW for power-saving purposes.

snip

>>> Despite being programmable, the LUTs are updated in a manner that is less
>>> efficient as compared to e.g. the non-static "degamma" LUT. Would it be helpful
>>> if there was some way to tag operations according to their performance,
>>> for example so that clients can prefer a high performance one when they
>>> intend to do an animated transition? I recall from the XDC HDR workshop
>>> that this is also an issue with AMD's 3DLUT, where updates can be too
>>> slow to animate.
>>
>> I can certainly see such information being useful, but then we need to
>> somehow quantize the performance.
>>
>> What I was left puzzled about after the XDC workshop is that is it
>> possible to pre-load configurations in the background (slow), and then
>> quickly switch between them? Hardware-wise I mean.
> 
> We could define that pipelines with a lower ID are to be preferred over
> higher IDs.
> 
> The issue is that if programming a pipeline becomes too slow to be
> useful it probably should just not be made available to user space.
> 
> The prepare-commit idea for blob properties would help to make the
> pipelines usable again, but until then it's probably a good idea to just
> not expose those pipelines.
> 

It's a bit of a judgment call what's too slow, though. The value of having
a HW colorop might outweigh the cost of the programming time for some
compositors but not for others.

Harry

>>
>>
>> Thanks,
>> pq
> 
> 

