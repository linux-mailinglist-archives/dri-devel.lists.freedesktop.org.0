Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5357E43A0
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 16:40:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1506710E0ED;
	Tue,  7 Nov 2023 15:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0580C10E0ED;
 Tue,  7 Nov 2023 15:39:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrwqYzGCzhAWqoM8oY0F7Tkai1wMZaXtQOqOd0S35RbAF2OMzKKNBf2gA82VkRV+x8P23X95OnuaxrN0/W++bxfy0iLol/DgfzOW2xU4+L6GTNVwgEKgA8jrkZMOMCqkXpvebI+HeNgqfcqfLAgjQ9fU665HhUj0z1cgbMz3wcw1RDAMI9MeY2eN1+k+iDFhvecgw9cHgtQwT81T4DLbWzAFaJADqBTAsXeTUDCmSrp79cbe5vtkA3KSVcIN8E23eRDLgwPz7VI+oTangi66iXaI/BJgmQQaiSE3sZojOVNHHRcJBM7yUPcl+8vBtLS/lbzRkeRBds1ksyAzkRJ5UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBrQ9axh/kewSCR+teTEvP/E1Blu7fUdQmj4uwM80b0=;
 b=DRRdeHQix32AQz7fiiW6JBEKn2yZguB+IIORfL2osHULaU+B9HLDVjZPzG0n2Um/oSb/4st+QTMjfgPLHaD2F4zecWZffgocHeqkw3x/0Kj5P0E/GIaskjxuH7I3tzjX6hcBeUBO4BHHpA7CENtwTXvx4GWamuvTijEO9BozmHOAnbwcTQzb6Db1Xd38bj5HBe1t0MDwIw2I4Cu/NUrEGkjR0G0hv6nRQUf3yysV2OxI138vxL0RqShMZ/gLcssMvUDR4llgUIdv6IZJRZ3siEJZMySrFdco1xuZjPT27Z6FetoUfIy+MQVikYCiNKLCQbJ7tYAeIFHshd7OHxv5QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBrQ9axh/kewSCR+teTEvP/E1Blu7fUdQmj4uwM80b0=;
 b=XGX1/DmIXcxg7hj1PRcIPv/p2XGxD27k7iD8ekLVc7PBCJ23zCFtytJtS3v8Av4CgeoFgmJyFrRxelxvZTj0fsY8u0/lth2mH/HYDWDwco9pllVmLXC2DXs0gZFF5tYvvpuf//Rs/4VgBi7L8ai9Qg0nWX6WGpah8gnmQLcutTs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH0PR12MB7887.namprd12.prod.outlook.com (2603:10b6:510:26d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 15:39:52 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a%4]) with mapi id 15.20.6954.029; Tue, 7 Nov 2023
 15:39:52 +0000
Message-ID: <a65a3cbf-9ded-4e35-89a3-7890f5a73fc9@amd.com>
Date: Tue, 7 Nov 2023 10:39:48 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/10] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20230908150235.75918-1-harry.wentland@amd.com>
 <20230908150235.75918-2-harry.wentland@amd.com>
 <20230913142902.31a51b46@eldfell>
 <04754060-8f1c-4bf1-91bb-2e0305339b1c@amd.com>
 <20231020131752.488932a0@eldfell>
 <62d31e98-39e6-4c57-9495-d2cf169a6ab4@amd.com>
 <20231107113832.79f38104@eldfell>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20231107113832.79f38104@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0372.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fd::21) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH0PR12MB7887:EE_
X-MS-Office365-Filtering-Correlation-Id: 135d79c6-7ec5-4787-2a55-08dbdfa7c8aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Dh6HA6N7QVZNjAC3owb1IKibOyNE4lx0SQnnr52ifyzJA7vwJBnaX943mKlwgkdd3SZwzD90fcYoEfD6WNBWy+2j14rng9/v3/0BxC6e61+Iku2ams4TCF0T5OrHAHVCKJOyOMDTt436AnRZsMGIwMtlNQjFmQxzMr0rqa125+8sUO9Mx9vzxrn48Kszbjy6w0MO7KrBhasihYoDaEPaaQ3HToc4//CZnG8KCjmgrpD9WXiTKSq9DcETsrMeSPCJ4ut0KUVVb7IffPCPAkIgd1IKtgG7AaBVZOONGt7m8W7nh54YeMUUNtZ/2Rx3YpedP78g+KT3kI4Wlv9RqBptst4YuysWhri/kUTtcxYeasoFbgMy2/+vyk1tzmpMhDcYPa2C+leUJFyq1TbGOVPLLNj/Tvp47Yt/2x+opzvkqvHCbYp61zOG9sfOFD1GBvrkZ1z5+XCS9DHJ+M86WsEVFVrdeMkZhMQ63aKONiJpHYSvjQwBzajqWPR9LX9j7ckwMfUTYfiLgaP/bhT6Z/eK8aCMJpU6zS8B6LoAiu4L28NZJRfMRtpdbgL+3VFfHRfO9h2e67IKFgEMn2qjis6EImF4sr5ytpRT70s5iyT5xF27K7yFu3DiZqqLTtujSbTyCqWi8+X2dCnjENtf4CgCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(366004)(396003)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(31686004)(83380400001)(31696002)(41300700001)(4326008)(8936002)(8676002)(36756003)(2906002)(86362001)(44832011)(4001150100001)(966005)(6666004)(478600001)(6486002)(53546011)(6506007)(38100700002)(54906003)(6916009)(316002)(7416002)(5660300002)(66556008)(66476007)(66946007)(26005)(6512007)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFM5OFVoL3pIKzFjRW8wTzdlbEpPZE4waTRXMC9lSVRHa09aeTlyYWhKYzRr?=
 =?utf-8?B?LzNWbis3d3ZHR0pxcC95Y1RSYWl3QW9kQkhnQmk4K0I3WDRMMlJGVUVxbUZX?=
 =?utf-8?B?dXFtUWh3QTNlVENLUDlXUHdqYUw5TmlaQnhOOE9iZUpLd2NDTlNFRTNCSERy?=
 =?utf-8?B?aVhqZXViVHZoMEZkM3ZQYWRHNVdES1dFdStLdUJQeGx0S2N3dXdRU04wblZM?=
 =?utf-8?B?THlRTlV5NFpXeis2TEVXaTVHM0NGV0JLdm1Ma3h1eEM2NHBaUzdKUXdWd3lC?=
 =?utf-8?B?OVA1dzd4R2MxZFlsTXJXVG9TcVF5YzBuMzdMajJ1azBQYXRlZ0d3NGdHT1BU?=
 =?utf-8?B?SlNYY2ZKdFJTdGVqS2w4ZkNLYlpCWWxEeG10ZmpSSkpaK2kyVUdxMEQzQjYy?=
 =?utf-8?B?Umd2ZTRwWE1FS2VCVm9iQUtwZWl5S3k0dG85aE5JZXJrYm9JRUpWYmJqa043?=
 =?utf-8?B?ZlpwZk03YkNtWmVlQVBnKzhIc2x0anNzTitOemdrZWhOdkJvTlMvY3QyakRH?=
 =?utf-8?B?Q3dKUElTM05vd1UwOUI4MmMySmxCTFpKMCtNa1RocEdHUkQzczBreVBHZ2ov?=
 =?utf-8?B?Sm11Q1VOaVNPSjVudjcwaHJFdHI1bE5NRVdRT1NjZ1ovR0FOSmJEZWxlWEJr?=
 =?utf-8?B?ZXNtTE5OREJIZWNMczlMQkptMHo0VmVsYUN0TDdaMFlXRloraDhYNnFoTWJG?=
 =?utf-8?B?ZExKZkdNSU9JOHRTNGxya0R1TWF2a1Nvc0NaaFdiY3NyempXZ1o1VzVKU3Mz?=
 =?utf-8?B?YlV3d0dWYmdJUTZBMFl1NTYvelZJeWUvVEQ0NjJYeWgxTldHVkNQbWlyRGxl?=
 =?utf-8?B?dDhrRktZV2Y2a1ZKaFlZNHpMRWV6RHRGUGVjdlNWT0F4U1NSaHJwczdNTVJN?=
 =?utf-8?B?d0J2eS82eDBzSks2eTlETktZZ041VW9vZndPOUZpU0lQTDdDRld3YlFyL2g3?=
 =?utf-8?B?bXhQTkFSUHgxQTF2QXRNLy9LaFFWWjl3c0hBd2t1cEU5RXpHZEVIM2FqZjFH?=
 =?utf-8?B?TlRua2hZdzdPc2J4cTVmWXhHYTl4VzRPZjlZRzBKdHpEM1NoK1loVmZ3RnNJ?=
 =?utf-8?B?cmRLNnJ1ek9Jc2Y2YVdIYytWUTlTcHVTdjY0R3l6YW9jOTFCQUdETlVoWGI5?=
 =?utf-8?B?M2pCdm1yOTBIcjZ5UkNQeG9PNFg3V3h2eVQrNDNNVnAzZUgxNEREU3A1NVFt?=
 =?utf-8?B?Q3VqelIwU01WeWhNWThRcDQrbTlMY0Q1UWpyNXVlSnRlK3ViVjR0TGdkd0hy?=
 =?utf-8?B?NEFXeWR3TXlMVy9jWFlIcGxXVjJuNGFiaEp0dUpnVFpSMDNRSGFIdExnY0NN?=
 =?utf-8?B?Vyt0UVdUblIvais1TVNkTEVHckMzS0dCMkpsbFJRWlM2dkd4Zk5XcVJocW9s?=
 =?utf-8?B?UmIxakR4WjBpdERJSHlLOVIwVzhONlZUd2dLUllWLzQxTU9RUW1yMGFhWU1E?=
 =?utf-8?B?VHZtV2hvUitoQUhWY1hBMUJKejMreitzL040MTJXMWI1cEYvSVM0OXZCR3hW?=
 =?utf-8?B?dTBwaS9kWmtGV0xrUHpJZEhpUWpVdkhDcUtldGF1dEdZcVcyT2orMDYxYzBa?=
 =?utf-8?B?a25TWHhjSGk4UmE0aytoQ1J6T3VXajd6dTkxV0lOeXA5eVN0R2RUV2pqcHpz?=
 =?utf-8?B?bnZjeXdINDhNbm5jRFVHVjBkdldydkZEWmFxQ0dyNnV2MWZIT0l4RmpjbWxC?=
 =?utf-8?B?dm1mRWhFKzJkYjZDd05iYjdmanpFNmNld3RCSk9EYmk5VksyVk02bklhekZa?=
 =?utf-8?B?QnVlSktIODNuaWExZ2ovRno2dnZBZGRzeEZsUzNTS1czTmVWTjVHNmQrUm02?=
 =?utf-8?B?SGRTYitQU1dEYS9NdXhkOTM5U3liKytnUDhlSUIrMWJzZ3AyQzFiZVlhaTdW?=
 =?utf-8?B?WVFVSUYvZlRnYWxMclFkbE5WWWZCRm90TGhFMk1UTnhYcnh6b1VtMGdPY093?=
 =?utf-8?B?YmRRN1o4R1V2N3IzVXpHTzlqN25nOWZjcWtCeUo0TmRuUlhuUVZMaUxkRzBq?=
 =?utf-8?B?QzV1dGFuRk8vOEcyMTBNU1hnTmdFQ1UvdUVFdm5PN2REQmNpTko0SHlrQnhh?=
 =?utf-8?B?ZEhvazRURXF1Zm03TmhxUjVQdlVvdzB6aGtnOW83TmM5NlN4QkxDTUhNT0Vw?=
 =?utf-8?Q?X4JB/tRIScRbV1A6IFtU8eqf7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 135d79c6-7ec5-4787-2a55-08dbdfa7c8aa
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 15:39:52.4207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53tDdzfEZQLChuvyOzVrbmCo1ud33X8sJ8wdYCtyaHPX2hwUcM6KcCgGLq7hcPxPrtTsjS/1xG6FN5mCxfnKyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7887
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
Cc: Shashank Sharma <shashank.sharma@amd.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 Xaver Hugl <xaver.hugl@gmail.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Naseer Ahmed <quic_naseer@quicinc.com>, wayland-devel@lists.freedesktop.org,
 Christopher Braga <quic_cbraga@quicinc.com>,
 Uma Shankar <uma.shankar@intel.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-11-07 04:38, Pekka Paalanen wrote:
> On Mon, 6 Nov 2023 11:24:50 -0500
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> On 2023-10-20 06:17, Pekka Paalanen wrote:
>>> On Thu, 19 Oct 2023 10:56:29 -0400
>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>   
>>>> On 2023-09-13 07:29, Pekka Paalanen wrote:  
>>>>> On Fri, 8 Sep 2023 11:02:26 -0400
>>>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>>>     
>>>>>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>  
>>>
>>> ...
>>>   
>>>>>> +COLOR_PIPELINE Plane Property
>>>>>> +=============================
>>>>>> +
>>>>>> +Because we don't have existing KMS color properties in the pre-blending
>>>>>> +portion of display pipelines (i.e. on drm_planes) we are introducing
>>>>>> +color pipelines here first. Eventually we'll want to use the same
>>>>>> +concept for the post-blending portion, i.e. drm_crtcs.    
>>>>>
>>>>> This paragraph might fit better in a cover letter.
>>>>>     
>>>>>> +
>>>>>> +Color Pipelines are created by a driver and advertised via a new
>>>>>> +COLOR_PIPELINE enum property on each plane. Values of the property
>>>>>> +always include '0', which is the default and means all color processing
>>>>>> +is disabled. Additional values will be the object IDs of the first
>>>>>> +drm_colorop in a pipeline. A driver can create and advertise none, one,
>>>>>> +or more possible color pipelines. A DRM client will select a color
>>>>>> +pipeline by setting the COLOR PIPELINE to the respective value.
>>>>>> +
>>>>>> +In the case where drivers have custom support for pre-blending color
>>>>>> +processing those drivers shall reject atomic commits that are trying to
>>>>>> +set both the custom color properties, as well as the COLOR_PIPELINE    
>>>>>
>>>>> s/set/use/ because one of them could be carried-over state from
>>>>> previous commits while not literally set in this one.
>>>>>     
>>>>>> +property.
>>>>>> +
>>>>>> +An example of a COLOR_PIPELINE property on a plane might look like this::
>>>>>> +
>>>>>> +    Plane 10
>>>>>> +    ├─ "type": immutable enum {Overlay, Primary, Cursor} = Primary
>>>>>> +    ├─ …
>>>>>> +    └─ "color_pipeline": enum {0, 42, 52} = 0    
>>>>>
>>>>> Enum values are string names. I presume the intention here is that the
>>>>> strings will never need to be parsed, and the uint64_t is always equal
>>>>> to the string representation, right?
>>>>>
>>>>> That needs a statement here. It differs from all previous uses of
>>>>> enums, and e.g. requires a little bit of new API in libweston's
>>>>> DRM-backend to handle since it has its own enums referring to the
>>>>> string names that get mapped to the uint64_t per owning KMS object.
>>>>>     
>>>>
>>>> I'm currently putting the DRM object ID in the "value" and use the
>>>> "name" as a descriptive name.  
>>>
>>> Would that string name be UAPI? I mean, if userspace hardcodes and
>>> looks for that name, will that keep working? If it's descriptive then I
>>> would assume not, but for every enum existing so far the string name is
>>> UAPI.
>>>   
>>
>> Yes, it's UAPI, as that's how userspace will set the property. The value
>> is still important to be able to find out which is the first colorop in
>> the pipeline.
> 
> Userspace will hardcode string names, look up the KMS uint64_t
> corresponding to it, and then use the uint64_t to program KMS.
> 
> But for color pipeline objects, the initial idea was that we expect
> userspace to look through all available pipelines and see if any of
> them can express what userspace wants. This does not need the string
> name to be UAPI per se.
> 
> Of course, it is easier if userspace can be hardcoded for a specific
> color pipeline, so all that matching and searching is avoided, but as a
> driver developer, do you want that?
> 
> Or maybe the practical end result is the same regardless, because if a
> driver removes a pipeline on specific hardware and userspace cannot
> find another, that would be a kernel regression anyway.
> 
> Then again, if userspace doesn't do the matching and searching, it'll
> likely struggle to work on different hardware. Driver developers would
> get requests to expose this and that specific pipeline. Is that an ok
> prospect?
> 

IMO in Linux land there will always be two types of DRM clients.

Ones that aim to work on all systems (within reasons) and use as
much of the DRM functionality in a driver-agnostic fashion. These
are things like Weston, Gnome, KDE, sway, etc., aka your "canonical
upstream project[s]" as mentioned in the "Userland Interfaces"
section of the "GPU Driver Developer's Guide".

Then there are people that build custom solutions for custom systems
with no desire or incentive to have them work in a driver-agnostic
fashion. These are often built on top of existing projects, such as
Weston, with customizations that are never designed to go upstream.

In the latter case I think it's entirely fair to hard-code the desired
color pipelines. In the former case I think that would be extremely
short-sighted and go against the driver-agnostic design philosophies
of these compositors.

As a driver developer I would like canonical upstream projects to have
an implementation that does not break with each new HW generation,
meaning these projects should parse the color pipelines.

Harry

> 
> Thanks,
> pq
> 
> 
>>>>> struct drm_mode_property_enum {
>>>>> 	__u64 value;
>>>>> 	char name[DRM_PROP_NAME_LEN];
>>>>> };    
>>>>
>>>> This works well in IGT and gives us a nice descriptive name for
>>>> debugging, but I could consider changing this if it'd simplify
>>>> people's lives.  
>>>
>>> It's nice if we can have a description string for each pipeline, but
>>> according to KMS UAPI conventions so far, userspace would look for the
>>> string name. I'm worried that could backfire to the kernel.
>>>
>>> Or, maybe we do want to make the string UAPI and accept that some
>>> userspace might look for it rather than an arrangement of colorops?
>>>
>>> Matching colorop sequences is "hard". A developer looking at pipelines,
>>> picking one, and hardcoding its name as a preferred choice would be too
>>> easy. "Works for my cards." IOW, if there is a useful looking string
>>> name, we can be sure that someone will depend on it.
>>>
>>>
>>> Thanks,
>>> pq
>>>   
>>>>>> +References
>>>>>> +==========
>>>>>> +
>>>>>> +1. https://lore.kernel.org/dri-devel/QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr/
>>>>>> \ No newline at end of file    
>>>>>     
>>>>  
>>>   
>>
> 

