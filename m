Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E197D1289
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 17:23:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B2010E0F2;
	Fri, 20 Oct 2023 15:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2045.outbound.protection.outlook.com [40.107.100.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7183110E0F2;
 Fri, 20 Oct 2023 15:23:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5B0vvT54j618mkv4qdwjWYd+eX70EZLWQVz632z6VF5UHGpziWFktFjduFW0Ne8fptYNK1yid2+lQBldWWO83mv04eC//tkru48xUvdiYL060zwmXRMP0pRt9dgFMcjKretPXojdcL+b0KivDw76oC6+ZmaH1orTNcuoieC+lSVJrqhsRrK8zXMUHP9RXVwo1L1c7bCjU0dmoHGfSqA4QShcu3CVioPdRuCFs8JDNECVmMOHbEOX8F8g1+DRULUDbJozaQAco465E3nibLuKMKoMeeB1/8uC0OPqSJPQbTUiHKfYYnay992zry8G41gWox16kjJjFQ5MVHpzqSP0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/nRMO4zYI+spyaWJC4OB82prX7li3epK7WHIXjY6YA=;
 b=UghXz1kCgYVFaLpYU2L/sjRqLotQCnYc6tpQQxfif5L/TWbllbNeOcGEp9YwVRcE0Bh2E43cD7NuT6eY8TAUQVl/0sU5sDuAXf89rlkFObdtErQf3plEyYOkIOxN1u8qwEKwaK1YZwFbDk8yyqZY1jfZq2aJz2IIkYdcHnyG8UUreuTULKxMuPtlfxQsJNJ/WfhJSMg4n6U/3/o4rN0M9TgXu5GdAO4LHOl19TjF5+5rEQwI6YFTrpbSzvWXDoOUD4UF0pa7+piOPunp3R8y8Ld87h5KAzKl6i+A7U2vJ48rjRYxg90uaVUv8d31+i1tBZrqlzDm8OVtw63VGBCkvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/nRMO4zYI+spyaWJC4OB82prX7li3epK7WHIXjY6YA=;
 b=M8J6nLx4lTJi7WpuMM3p5a/9Bi2l5FSEsB7iKEN3Y+pVFa77Nt7seY7X0vQqg+9IFDvnYuKu+jxQCJuC5+tAPa2Sffe7kN9GD6C+s77475ei109LIzLV9mp5rsZ6hPR067UfrUM/PJKpMOJ3Aq0WLr1JlhHZoXb6Bp3HB8v8zYA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SA1PR12MB7319.namprd12.prod.outlook.com (2603:10b6:806:2b5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 15:23:33 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6907.025; Fri, 20 Oct 2023
 15:23:33 +0000
Message-ID: <20f33898-4c40-4854-a1e8-afaef52f6524@amd.com>
Date: Fri, 20 Oct 2023 11:23:28 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 06/17] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
To: Pekka Paalanen <ppaalanen@gmail.com>,
 Sebastian Wick <sebastian.wick@redhat.com>
References: <20231019212133.245155-1-harry.wentland@amd.com>
 <20231019212133.245155-7-harry.wentland@amd.com>
 <20231020142256.GA859375@toolbox> <20231020175703.09cd2578@eldfell>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20231020175703.09cd2578@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0449.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10d::21) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SA1PR12MB7319:EE_
X-MS-Office365-Filtering-Correlation-Id: f349027b-6078-48c5-0315-08dbd18085bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IyXCPf3Ug8Ss9A6oMW4klkgU1ODS3+Ge7dyAQuI+tt2HuqNKArj/X9MUD6QreT924HoEagG9wUN+8bNmeULgUFBfE9a7zORfE8uQrriEk5UIjgtmfJZBuhadfzKVQtkB9z4kEKISfECvGYaVsJyZ6ENYe2qlP9sVB3/pzHCX63aHug4r2LoHS3PQKZ4vp1GNtfivrnWkYLxHpraiGZhrKPDShOI/p2tkwM2kV4WXn/4cEaMBpwr2LyQc8MLEiRad2qaMokDr12fan0g1BG7WnLCe7mJ9h/h+FwQyL0q04GcD0W1L5uI3kFnRRn3xWnfRJyULwBRidaC8MxBGMiRWFxQ6ctmsXmbPmQ4s4SWHdCjNhbFPabeyYgrjMkkwpS9bE9yvgu4Rozpsl/Aki5IS1Pot+Q/B5ZinGuXkloDg3rD4fBWXCEzqk6aKnY8czGPSdfceqN3YmlOopnXoLhZZ2HG3El9N80N0Kf2R0LHjSbBcmjEe0zujn43cmRsr9lOCKrNVagfhnh25U/UPuCzCVURne90GpqPPnKfWCbwUsaYT8ivVwbAppBI/6Sczl+27TC8QZ6ZtYrA/Tk8g8iUdc+iYSPUB5wmNVayXBBZ4yyr8Xmp+cSJpMRVLfYfyyz/nn7YHobyBpx4NtF/KO5H20A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(366004)(396003)(136003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(38100700002)(4326008)(7416002)(2906002)(4001150100001)(36756003)(8676002)(6512007)(6506007)(6666004)(41300700001)(53546011)(478600001)(316002)(26005)(2616005)(54906003)(5660300002)(66476007)(83380400001)(8936002)(6486002)(110136005)(66946007)(66556008)(31696002)(86362001)(44832011)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0xqaVY2TXd0QzdEbEVTelFGNTlRcjBSby9VcVYvVGtqSnVXYjc4RDRHMWRh?=
 =?utf-8?B?bmhnbUo5dm1ZdVV6aFVYa1o5RGRIcVhTWExkNytkY05iSWs3TW13MzdYUVpa?=
 =?utf-8?B?bjNsOWwyNXVSenBncitORXRvdnBLQ3p2UHBic1U2ZDM2b3BBRHd5Q2szNEdZ?=
 =?utf-8?B?NFY5NEM3VnAwUlJLbmhLUldoQks1Rk90YVVMZjVjWnBuRjV4Snh5K01pcE9H?=
 =?utf-8?B?QmlYV0gydEovRldkNDFCMVFWYkpDMFpsd2w0VFQzeFh6WGV6QmlXYzVxMkhi?=
 =?utf-8?B?Nm4vemhGRFdmL1FNOUNwOHZxMkVGclJoa0QwMC9lOGg4Z1dzczVweUxKQ1pC?=
 =?utf-8?B?R1I1WC9lQXIzTS9vYTFRKzRqWnRBZ0laRjVndXNEaGo3anV2aTkvZTFiSDB0?=
 =?utf-8?B?UkRvbjB4VVNJL0I4cDFLUVBXczJSTVQ1OXVjbU8wRmZNaHpONDJnRXphUm5Z?=
 =?utf-8?B?NEw5emVKc1dyTk9xVGNNeDFEalZia0NhNUYwSXZ5MGY5WVhkajZ6dUNiOTZB?=
 =?utf-8?B?cVhsNVRzVENGMUJyL1hzNnJyTFdlTFh1aUIwK0p0YXd6dGo4UkJFTFVkZHBa?=
 =?utf-8?B?ZzVVSFJWd0ZoWDJ1eTdDT3IyQkh5N21yMWZscjczM0tCeG1vMnRVbnNQSFZt?=
 =?utf-8?B?WXZPT0RhSWIyQkNCeENmZVQ0a3JZNTJHaWI0d3JsS0wxeE5YbnZqMVJ0Vlpl?=
 =?utf-8?B?dUM3YytmT1hXaDIyY25RTGhaOXVBeVFoZ0M3RHVuUnUrYWp6QlVYK1E5WFJa?=
 =?utf-8?B?aENya0dOMkZ5cVRWeGtUQTdSVDMyRGEvdWpYVmJuM0huaGVmWitHMGc2NTU2?=
 =?utf-8?B?Z2VVRlJoS3lGcEIwWWgrT0kwQzRic3pUZXJ1K0cxMWNTemx0VThZZnZmdGdp?=
 =?utf-8?B?S2NJcjQ4TEQxeTZCamJya3FiM0VQSlVHUmJhczVqYUpSN00yZkNoSGNQcDVM?=
 =?utf-8?B?N3E4dzRMMUxVZWd5NFV2cTRuQWZqekFoUWdNYTQ2SkZ6c1ZMeVpwSVpkSnNt?=
 =?utf-8?B?QTJHQ1YrMGtmRVlLSWo1UWJkUXFkMWpWcUhVVUFHNm1qaHlQdEpaRURQT0dq?=
 =?utf-8?B?MzVER0ozUnlTNVhEQ1ZHblhGM2dadmNaSzBZSkpqcms4YXhySmhRc3M5cXZE?=
 =?utf-8?B?a082OTJpcTFjc0pYdlpNOHdWZ01FRjVncVJLeDh4VDhYajR1U1U2Rkc2TmNs?=
 =?utf-8?B?TWV5U3lsYURvOUlWM0U0c05sb2FKd2pycDBBTjlnNDFqS3d1NkdEeWJXa3Zn?=
 =?utf-8?B?Yk43d0RDaElIZnFvYk9Xak1BaU5WQmo4cTFWWTM4THdnSlhtMW9Nd1FvczMw?=
 =?utf-8?B?d00zNUs0N1FlSFNITlYvdmtkUXhoUHl1cC81RmxtMlRVM2lSSE5ESkxITmgx?=
 =?utf-8?B?a0RWWlFXL0VhSGF3RXB6SUlMa21yU3NGK01YbGNOdkFycEFKd3l4ZSsvMkVR?=
 =?utf-8?B?RzQ3WjVUdzk4TVFkWDJqV3pqSEFDLzEyOHFyYm5qWUplaWw0NHlISTB6UDFv?=
 =?utf-8?B?aHRRZEM2eWZ0WTZ0YUFCWWlFenJJTXlyYzQyaEQ4eFI0VmQreUxHRGdnSVhS?=
 =?utf-8?B?WGQ3KzBoSUgzbE56eG1obCtXK09sSUNMY2VOamVqNlRtdlZudWpldnRwNGdZ?=
 =?utf-8?B?Z0RVeHA2TFlBS1E5RHE2eEVaeTJITk5hVzNDYWpJa0N4SEg0YXBqcWN3VCtM?=
 =?utf-8?B?S3R2VFBDaHNSQWZjNmwrWWF6M2FVaEh1Q05lOGlQZkltVXdLWlMyWjYxc2xH?=
 =?utf-8?B?NXRMK1pXSTQ5UU5aN1JtMnpIRUQ3T3hzU2s0UFpTT2ZKVXkwSDFwMCtxVndj?=
 =?utf-8?B?cjh3eDFRcS9lTzM5ZURrZFBoUkRmWkFhMmxsM1RxYll5bE1pdGJjN1FZMDJx?=
 =?utf-8?B?a0dwVk9VR3g4ZkVEV09WaGs1RHZCN3R3WmhmbjY2VHYyY1l4L2I5c0xVYVhw?=
 =?utf-8?B?bDJhaW9ZZkhBdmkrQlNoZ1l1SDFsZXlSbzFGYStBWkg3eEU0OTJBY0NyWDVy?=
 =?utf-8?B?VkR3dit0bFVYaHBXR05EZnJxbGV3blpLV2pZOCs1M3JoWTBzK0lIYXRWamRL?=
 =?utf-8?B?YVhuNG1nL1NMV2VaRU1FUE1aQVVOMGVHaWJGVEpKL2NZdXpGcEM4WFhKRUc0?=
 =?utf-8?Q?uMu1niDWbJPCuOFtPZm2Fp8VL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f349027b-6078-48c5-0315-08dbd18085bb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 15:23:33.4732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pP/uTvsj6o0NMJ6jkwc69rohiC7qQhVBNnJHdvdUjG+Hsu3gs4KRsZI3c1+ZR5xWz7tiu1q/jQN4wq/0vz6HTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7319
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
Cc: Aleix Pol <aleixpol@kde.org>, Sasha McIntosh <sashamcintosh@google.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 Hector Martin <marcan@marcan.st>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Victoria Brekenfeld <victoria@system76.com>, dri-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Joshua Ashton <joshua@froggi.es>, Naseer Ahmed <quic_naseer@quicinc.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Christopher Braga <quic_cbraga@quicinc.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-10-20 10:57, Pekka Paalanen wrote:
> On Fri, 20 Oct 2023 16:22:56 +0200
> Sebastian Wick <sebastian.wick@redhat.com> wrote:
> 
>> Thanks for continuing to work on this!
>>
>> On Thu, Oct 19, 2023 at 05:21:22PM -0400, Harry Wentland wrote:
>>> v2:
>>>  - Update colorop visualizations to match reality (Sebastian, Alex Hung)
>>>  - Updated wording (Pekka)
>>>  - Change BYPASS wording to make it non-mandatory (Sebastian)
>>>  - Drop cover-letter-like paragraph from COLOR_PIPELINE Plane Property
>>>    section (Pekka)
>>>  - Use PQ EOTF instead of its inverse in Pipeline Programming example (Melissa)
>>>  - Add "Driver Implementer's Guide" section (Pekka)
>>>  - Add "Driver Forward/Backward Compatibility" section (Sebastian, Pekka)
>>>
> 
> ...
> 
>>> +Driver Forward/Backward Compatibility
>>> +=====================================
>>> +
>>> +As this is uAPI drivers can't regress color pipelines that have been
>>> +introduced for a given HW generation. New HW generations are free to
>>> +abandon color pipelines advertised for previous generations.
>>> +Nevertheless, it can be beneficial to carry support for existing color
>>> +pipelines forward as those will likely already have support in DRM
>>> +clients.
>>> +
>>> +Introducing new colorops to a pipeline is fine, as long as they can be
>>> +disabled or are purely informational. DRM clients implementing support
>>> +for the pipeline can always skip unknown properties as long as they can
>>> +be confident that doing so will not cause unexpected results.
>>> +
>>> +If a new colorop doesn't fall into one of the above categories
>>> +(bypassable or informational) the modified pipeline would be unusable
>>> +for user space. In this case a new pipeline should be defined.  
>>
>> How can user space detect an informational element? Should we just add a
>> BYPASS property to informational elements, make it read only and set to
>> true maybe? Or something more descriptive?
> 
> Read-only BYPASS set to true would be fine by me, I guess.
> 

Don't you mean set to false? An informational element will always do
something, so it can't be bypassed.

> I think we also need a definition of "informational".
> 
> Counter-example 1: a colorop that represents a non-configurable

Not sure what's "counter" for these examples?

> YUV<->RGB conversion. Maybe it determines its operation from FB pixel
> format. It cannot be set to bypass, it cannot be configured, and it
> will alter color values.
> 
> Counter-example 2: image size scaling colorop. It might not be
> configurable, it is controlled by the plane CRTC_* and SRC_*
> properties. You still need to understand what it does, so you can
> arrange the scaling to work correctly. (Do not want to scale an image
> with PQ-encoded values as Josh demonstrated in XDC.)
> 

IMO the position of the scaling operation is the thing that's important
here as the color pipeline won't define scaling properties.

> Counter-example 3: image sampling colorop. Averages FB originated color
> values to produce a color sample. Again do not want to do this with
> PQ-encoded values.
> 

Wouldn't this only happen during a scaling op?

Harry

> 
> Thanks,
> pq

