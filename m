Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFA83ED418
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 14:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0516789DB5;
	Mon, 16 Aug 2021 12:40:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F306E89DB5;
 Mon, 16 Aug 2021 12:40:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MpMbQaI2LJC6X/8F5jsFCVhn7wN5Gd+iqlxHuSJ9wpoTbRH3w1kY2f1kGrcuvyxIDK5nwtkSYGEJCbYAEGg0J79e6ne9SmR6fdcehI1RCPVbs6rznir1pYqRlfOB8cxOcghKKHP0cFwbFxgnzGes/LXpP4zukADLYGkOWj8mWDOLoRkb9XCVD/S+9ruTSBNa2OBn/nAnZ/Ju8x6MD9ErEQwEvYUBgefer3GaL73aZF9ifABNswdiV66i5+q1n7t56c4tELzlyY4Y6JcOBfLHXVPlSbMUdR6cSUmb/Jro674V0QD45WbnDj7r8FTIIOReLU1/PDaqdA0Qs0iKodSKaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dzyK7EYTW49Hpth2P/UgssFUsQgiN4V7MhptQH7waw=;
 b=hCkTkhN+DsF5Y7EMRI0/3Ny5/6455V5Y0xr4En7V1ad51y+GC4y4O+zy+XqR4XyIZj2wWaukj3ImiYk8s4+s9+14Z7LazbVmyJTgRKRLX8cC35KsM/bTWQTkPLU1aRQ+Y75LhOfi3Nr+xN5NnsCa3bbQZku+qVn+RO5vPKRhpBQ5IdfYWr5jPGVbSgFPSw5qU+QX/aj1qivVuAbRlw6rOwUuMClTrKFAgHGSrd1KUZveRcd4/KPStpgZ0JAPRlQQVwxd5Rq+KJjaF2sny86WsvRfwl4vgwTwkMEViHEmrJL2LvjJhAOGBdQkGbqOJg1wGa1MF8Amka/n4K3aC5ss/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dzyK7EYTW49Hpth2P/UgssFUsQgiN4V7MhptQH7waw=;
 b=CzUWS6yzGLaHijDV089gMS53QXuPrRFIBBFQVsHiNjPJhTvrgPzAlto1nwYv7GdtrhUYqQqJY173AHdcEjFpMEJefKgh0j6UlN/DIzNXWZsFlFQc1xA+G6BTFap5q/mwSDjDVwe004K3CUlry0lS8inXxAIYeOU07PGZI9Zniu0=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5393.namprd12.prod.outlook.com (2603:10b6:5:356::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Mon, 16 Aug
 2021 12:40:20 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::e99e:c0a1:4e9d:322f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::e99e:c0a1:4e9d:322f%7]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 12:40:20 +0000
Subject: Re: [RFC PATCH v3 1/6] drm/doc: Color Management and HDR10 RFC
To: Brian Starkey <brian.starkey@arm.com>,
 "Sharma, Shashank" <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ppaalanen@gmail.com, sebastian@sebastianwick.net, mcasas@google.com,
 jshargo@google.com, Deepak.Sharma@amd.com, Shirish.S@amd.com,
 Vitaly.Prosyak@amd.com, aric.cyr@amd.com, Bhawanpreet.Lakha@amd.com,
 Krunoslav.Kovac@amd.com, hersenxs.wu@amd.com, Nicholas.Kazlauskas@amd.com,
 laurentiu.palcu@oss.nxp.com, ville.syrjala@linux.intel.com, nd@arm.com,
 uma.shankar@intel.com
References: <20210730204134.21769-1-harry.wentland@amd.com>
 <20210730204134.21769-2-harry.wentland@amd.com>
 <20210802163042.2phdkytybie236x4@000377403353>
 <4e13504d-20ec-ae9c-7cb0-f79376d0f98b@amd.com>
 <20210816111029.74cisnhblllindcv@000377403353>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <ace8dcf8-fe01-ad1e-8cfb-92e559f01d2f@amd.com>
Date: Mon, 16 Aug 2021 08:40:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210816111029.74cisnhblllindcv@000377403353>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::29) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.50.3] (209.195.106.179) by
 YQBPR01CA0057.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:2::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.13 via Frontend Transport; Mon, 16 Aug 2021 12:40:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60372ef8-794f-4c70-20b1-08d960b30247
X-MS-TrafficTypeDiagnostic: CO6PR12MB5393:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR12MB5393A31FA834A4D9430540EC8CFD9@CO6PR12MB5393.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G20rhr2pcSLuMH/k5uZrmPNjI9X3GrggghoEyF61wYnlQton5zYu04N108DEDRzWr9DlTbTcm5o3JL6/WFMsNZ57h8xqQ0OOAA4YEQ/6av3qTtV7kbPbwtVdFeRZ7v6w/1nq0kQahXfmx83LV/25eyYoDC6Xh501k7LdputYb8da5a64/0npltNrWuv9fNrHA2uJ2/qokVOFnfdXEoh3PQHk4UAC8M2ISYvJg8dz08L5t62KPN3sSlf4puWUq9OcBjcS4GgZiQRv248PPxxp4KLpgmwoz/SZ05kK2AfMKKyCqINCcOvwm3o8rmkCCBF8U1kaSSH72OVuWWR5b4ISOOzC8GpurjAJA1J5l8PUtaW/r3L3UgVYJmEv4yo4JIeFUEvIJtXwirEv2ZX3e6TXP//O/hmiriTG/MH0rrsyGe+BOVaU6akiB6aRYgYjFDOhi7IGbYmrAqTuVAewFBgeaY6NrW1bruwbYH+gL5dMX2792sC4ZssWe8LeANuf0STQoVgSFB7JzVOCNXhbe8IxyHf7S48ELJ05lB9P7c+Em4wAzJc1I4T3b5PlOlYKu5XwhbInVbNlAmygYoMdlDqj4NYeCiEH/tdL3auyvkmNiEB4jKUztsb0eMPdXqcnHZuPeYfejhObCkvggkD9VxMWLsoKOAZJKQMxEshOhTFh/qwoNiIdOZSuWtKBZv6boXCvJTTRpQAhg+iuXn4DCKdHPZroCF2PCa9Lh2KmO3nLF3jqBqT99FrIltF8+ZaZPKwy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(16576012)(6636002)(2616005)(5660300002)(44832011)(36756003)(53546011)(110136005)(956004)(83380400001)(8936002)(316002)(26005)(86362001)(66476007)(186003)(7416002)(2906002)(66946007)(66556008)(4326008)(38100700002)(31686004)(31696002)(6486002)(8676002)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SStmK3RDbkJqelIxbWExQVA1RGNUUlVBUVJpZm5qSHkrVWRKOWVlZXpEVHA0?=
 =?utf-8?B?TFNvME1YU3l3MTN4a2xocTIrU3lRSXJ3dVFiVEVhdkJ2S3pTN3pKeGh1bmZt?=
 =?utf-8?B?aUlUaiswdmlySEdSOEVTL3UzV1VXZGJnOGR0aEhVYmZ5Kzd5OXBXZk1HSDBn?=
 =?utf-8?B?SVdrODAza3VnSm5UVk9NRmx2bGJibCtpUmZWUUNjcVRKbFRlc2E1T2kwY2hY?=
 =?utf-8?B?YUhhQmtTdGV5R3NIdTAxTXRybmlvQmFsVFpUVllRZEpQWHNNVnJXbWFiVGVQ?=
 =?utf-8?B?OHlDRzYxeTlxSWhtdmtDbWxVbjhJcE9UUThZOW1GSDRCUmd1eVpzdkVNc3Zp?=
 =?utf-8?B?clRJZjRlMlgxU2Vub0EybWxpcEZvZFR6WWxUNUU1aURaakttdDFLK0t6OFBs?=
 =?utf-8?B?cktBeXRDbk5EOGpIOEJheEcvMVVqYUNtdytkSHBHeU9qeWRsSmhWM3JjRHZv?=
 =?utf-8?B?VHp3a0F5OWN5R2YrajVpRHRMUDdSenpEYWExb2hpTndodHJPMnoza0tmV28y?=
 =?utf-8?B?NWlndFVJNlIwS3EyUEYzS2Z6bGF4VXl5SUVGcFlrWUJTcU0zWnU5S2dJUFRX?=
 =?utf-8?B?SndkMGgxR3dHSVRmOTNyOG1LMEJTN0JwbTVsZlUxUXB1MHVIMmJOR1JUd3dL?=
 =?utf-8?B?VnFDWXJocEVjQ2xlUG9lQ2FGYWJFT0VrSFJOdWd5K3VXTDVQMElqbkNnYWlR?=
 =?utf-8?B?YzZoMTB0RmxIam9pVHgxR3NnWVhjc0RHSU8wUk5IKzBRZWFUdUlsREE3TnUz?=
 =?utf-8?B?YjkwWGpLOTlEaWxhcmNvUW1mQkNjT0R3aGVSeC90dmUyU1hHR0E2NE9oNldO?=
 =?utf-8?B?bFZ6QlE1ZFNDYnZlbzNUVmpTWmYrOW5Sa005V1M0SjJUOTNMaCtBd2R3Yk9V?=
 =?utf-8?B?L3NQNGl2RTdld2MvcSs0VGRISVhqTWRLY3M5ZVRiZUlNckIzWE9qeFY2OStU?=
 =?utf-8?B?NktkeHozUU5SNzhuMmk3Y21VOEYyZ3lnMWV4eFpFMG54NlBSV2IxM2NnM0R1?=
 =?utf-8?B?SktPQzBXU0hIay9JRGJQVzBjMUQvWUNiM0JFM1FGTjFYMHJzSmJKRFNaZ1Rr?=
 =?utf-8?B?U0ZMWnRjQnN2UTdUUklpSjhUWEhYelZ1NTU0emRLbW8vZk9UNHJQeEFyak80?=
 =?utf-8?B?R1dZVnBWU0NsbjRidC9xQTROVFRsYThxTTNwNzhCazZCa3NiTmNIYW4vd3M1?=
 =?utf-8?B?cDVINVlFMnNONVB1dnlwMVA2NCt4TzZWU3VJT0VpakRxV3dLSWtQT0MrUmNQ?=
 =?utf-8?B?M3JnSGd5azhPbU1DTnJkb1E0QWpycXJ5eWV4bnZuY3hWeEc5cmpTMk9iTE5W?=
 =?utf-8?B?a05Td1ZKUWFER1JtOWt3dk4ydUJIM2lUSThlM043OFliZlRMZUptNndVY1JX?=
 =?utf-8?B?UVdubDBobUx0cmc0UE1LMzNPUlVtZGJsS2JUbmNTM0MzalRkQTNxeVJzTWc3?=
 =?utf-8?B?YUhGY2ZlYlNncWVINjErcjAyd2hzdDIwZGt6N2xRWGdUSXNERmZMSUFSbDcr?=
 =?utf-8?B?SEtUL3QzeUJRcSs5RkRWbU85TEZYSkhrcWRtZzJmS1pybWpsbWFCclJuMzcw?=
 =?utf-8?B?cnJyZlppMkFXa0ZIV1VTaEtmRkx2V28rVldWRVR4czU4ZXRQQTlyUmxMaUY4?=
 =?utf-8?B?c0pyczBFa210KzFWUkloa0t6QnoxOGJRN1VZMXBLaHBZNnNUSWZDVkNsTXM5?=
 =?utf-8?B?cVRLZ3pPRG1OeFJYbVdYeHZKcnZ2a2o3REwrK1FLazZOLzR3QTBxczBUMzVV?=
 =?utf-8?Q?2MEjfVf8ahKkgZIawUP7IccgIVSx+yYNH6JWO4I?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60372ef8-794f-4c70-20b1-08d960b30247
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 12:40:20.6330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pvYYirUKkHHZZmgHRGW+fqSavwd9H1izOB46RxauYUyiHNqe1a5zApnnYNPBLEqeuI+vftILO0JWmm8Z7kNtOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5393
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



On 2021-08-16 7:10 a.m., Brian Starkey wrote:
> On Fri, Aug 13, 2021 at 10:42:12AM +0530, Sharma, Shashank wrote:
>> Hello Brian,
>> (+Uma in cc)
>>
>> Thanks for your comments, Let me try to fill-in for Harry to keep the design
>> discussion going. Please find my comments inline.
>>

Thanks, Shashank. I'm back at work now. Had to cut my trip short
due to rising Covid cases and concern for my kids.

>> On 8/2/2021 10:00 PM, Brian Starkey wrote:
>>>
> 
> -- snip --
> 
>>>
>>> Android doesn't blend in linear space, so any API shouldn't be built
>>> around an assumption of linear blending.
>>>

This seems incorrect but I guess ultimately the OS is in control of
this. If we want to allow blending in non-linear space with the new
API we would either need to describe the blending space or the
pre/post-blending gamma/de-gamma.

Any idea if this blending behavior in Android might get changed in
the future?

>>
>> If I am not wrong, we still need linear buffers for accurate Gamut
>> transformation (SRGB -> BT2020 or other way around) isn't it ?
> 
> Yeah, you need to transform the buffer to linear for color gamut
> conversions, but then back to non-linear (probably sRGB or gamma 2.2)
> for actual blending.
> 
> This is why I'd like to have the per-plane "OETF/GAMMA" separate
> from tone-mapping, so that the composition transfer function is
> independent.
> 
>>
> 
> ...
> 
>>>> +
>>>> +Tonemapping in this case could be a simple nits value or `EDR`_ to describe
>>>> +how to scale the :ref:`SDR luminance`.
>>>> +
>>>> +Tonemapping could also include the ability to use a 3D LUT which might be
>>>> +accompanied by a 1D shaper LUT. The shaper LUT is required in order to
>>>> +ensure a 3D LUT with limited entries (e.g. 9x9x9, or 17x17x17) operates
>>>> +in perceptual (non-linear) space, so as to evenly spread the limited
>>>> +entries evenly across the perceived space.
>>>
>>> Some terminology care may be needed here - up until this point, I
>>> think you've been talking about "tonemapping" being luminance
>>> adjustment, whereas I'd expect 3D LUTs to be used for gamut
>>> adjustment.
>>>
>>
>> IMO, what harry wants to say here is that, which HW block gets picked and
>> how tone mapping is achieved can be a very driver/HW specific thing, where
>> one driver can use a 1D/Fixed function block, whereas another one can choose
>> more complex HW like a 3D LUT for the same.
>>
>> DRM layer needs to define only the property to hook the API with core
>> driver, and the driver can decide which HW to pick and configure for the
>> activity. So when we have a tonemapping property, we might not have a
>> separate 3D-LUT property, or the driver may fail the atomic_check() if both
>> of them are programmed for different usages.
> 
> I still think that directly exposing the HW blocks and their
> capabilities is the right approach, rather than a "magic" tonemapping
> property.
> 
> Yes, userspace would need to have a good understanding of how to use
> that hardware, but if the pipeline model is standardised that's the
> kind of thing a cross-vendor library could handle.
> 

One problem with cross-vendor libraries is that they might struggle
to really be cross-vendor when it comes to unique HW behavior. Or
they might pick sub-optimal configurations as they're not aware of
the power impact of a configuration. What's an optimal configuration
might differ greatly between different HW.

We're seeing this problem with "universal" planes as well.

> It would definitely be good to get some compositor opinions here.
> 

For this we'll probably have to wait for Pekka's input when he's
back from his vacation.

> Cheers,
> -Brian
> 

