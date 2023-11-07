Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F557E465E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 17:52:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE4310E159;
	Tue,  7 Nov 2023 16:52:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4228310E0CB;
 Tue,  7 Nov 2023 16:52:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGl2ZV6m+51UMDQLdtuPguig9lpggFj41RXPEMORgFpdOCqqHWN0JINDTyHlQ2xQWSxLk1L1lKGkuRJYXp0mVvwMVpDhEkdQLoXHNyqfV4IhLmRkkVwyL0iyDpRnR/yeKmIKOXpuHiZpd1vn5oYD3aMv40R/nJQO/rI5KHKUHtlwssxABOsdnAADHpSXOBcpxiXgiYHt/BpQouiiZHvHWrUZZ7DgTXsFdbGDzJL8ICNUz/Rxkzusu+oEZUXqXQa5P5QVqpElIQZvvrp0FYYToYspcP3FSrpXfZm1zZPXbqVj4Og8fdBEE24KUMYCcF8jPE4MGlygKwVLf6AlncyHVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYzluzbL0DJtQc0eQ0O8uk8SlQjTAhoxVf1ZU4dKxJc=;
 b=O36ib+tFoVfzf2tit3xTc5gvq1gHQu3AWVNTKnbXLmNRsPmDQ+fBOzv3pWXBkC98+m05m5QytkF0yuqllzgl5gyyksxhKc8dj5Iq5v3JcZNjWTDtDbWjd2/WqImg0MNF8VYZTfujNcWVAylkfvJkj/cXM6H/yM6QihEOCU4VWc2z2LQrSCbnyCIw0C//+yCP4tGXmxVyk5R1Gg44nULA21E0xgaqEUgcyaLA4Hf4VyFEPktDinQamQT5vAYq/bMyoXiJHtLIcXmUj5O/KX0Rw0yy7iI9IxjiyB7HE+gGIdOGG9fj3eLdPatq1ECO8RdIaCrwxiXt9yeVblQBTWSQbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYzluzbL0DJtQc0eQ0O8uk8SlQjTAhoxVf1ZU4dKxJc=;
 b=HCrUoDFJHxjhoVIlkL6ItQThN+qu56x2gCz8vKyKsDbDCayruSagpN4sarLfImi1Zn5IfZRoxZv6XMzG7nvaDMFeeeTeBIlTMkSjAsThOslEjC+1qmHA7zBF7wM9MJVWEw5gjVRapwAZghPTZhVozKYBgIKQiDJtSOq+jZmc304=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DS0PR12MB9057.namprd12.prod.outlook.com (2603:10b6:8:c7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 7 Nov
 2023 16:52:06 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a%4]) with mapi id 15.20.6954.029; Tue, 7 Nov 2023
 16:52:05 +0000
Message-ID: <dcecce56-8f85-4b94-8a3d-f60b24cb8880@amd.com>
Date: Tue, 7 Nov 2023 11:52:02 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 06/17] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
Content-Language: en-US
To: Alex Goins <agoins@nvidia.com>, Pekka Paalanen <ppaalanen@gmail.com>
References: <20231019212133.245155-1-harry.wentland@amd.com>
 <20231019212133.245155-7-harry.wentland@amd.com>
 <20231020142256.GA859375@toolbox> <20231020175703.09cd2578@eldfell>
 <20f33898-4c40-4854-a1e8-afaef52f6524@amd.com>
 <20231023111219.6e287958@eldfell>
 <bf69b740-dce7-94f1-293d-a4b274b52f55@nvidia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <bf69b740-dce7-94f1-293d-a4b274b52f55@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0304.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::20) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DS0PR12MB9057:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f08fc13-4e37-46fa-5830-08dbdfb1dfa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gN0ThviWinHWSBaxyT27S6AJmIGAdDIuYh7sym0ZoIQP+uREMmAxfnHkAOIcNOLhlGiTTkvqiHUK7H5wz3D2EzrLLzs/qaNHTN+7JKwrHfuXBxfwWEhNWIYaYF3Kpz2Xr3+9T9eF3G5v0CmdLeIvmFszn4JNfNRUL9CSec8OKjP50N8YZ5Tjo00pqwlp8nk1rtgl/MCbQZaxaFtPzxgpqLAFwamy88v0gMBBPRozZy6t7nApvFkEtCCdyZkcBsEatlx7cF982aG9QgK/YXCPSqXTbxLxRqhI/svStQv51yGcejWhTdySCf5QtrjPHnXlNQQnJa63/NGYFy/MeDrSmdH/AnDVCGuKsaeP0u5EE2xHP88X0NozFO73lz1Ir98A0p73RkV4UXxcBy8GknvHr49rUwjjTHBwtY+Rfrhy2JPBQoVa6BhW6raUSzzpQBunIDJ3Y1ff7z6xNsyzWzD7x22zBVCyzLS4bOuls+yH6HrJAABvaujYHTZ/hMfrKeWu3ycm87fsYEHvCLQ3aj1QziAokja+fOCgzqj5CAX/MemCvNu0eWAua544N8S7vvNKu0ho05WtDf5yOA2p1Iyzb2PqH5fGPXF/xIk1Tt5ZBYwg2/7PtXdbQKfKJHO5VTYuokoMq6AVfyqq/tYSZw5SqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(396003)(376002)(136003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(66899024)(31686004)(478600001)(6486002)(86362001)(31696002)(83380400001)(36756003)(38100700002)(6506007)(53546011)(2616005)(316002)(110136005)(6512007)(66476007)(66556008)(54906003)(6666004)(26005)(7416002)(44832011)(2906002)(30864003)(5660300002)(66946007)(8936002)(41300700001)(4001150100001)(8676002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFBOSWpXdThIUEkvSlNRanV2UmZ1QS9DcFFLVTJCYURUL3NoOGlLTEhEZkNy?=
 =?utf-8?B?cXJRN1ZBVnVLNFZ1eFZ1MHhJVEdSOG5BTlkzTVpJTGU1ZFZOQ0RwdVV2VnVi?=
 =?utf-8?B?NVR5MWg2dVUwZzZEcUN4LzJIRDRuZGxlQ3I2MlMxMGZhZ3NYTzJQUUl4SXZ0?=
 =?utf-8?B?LzZvNElJQTN4L0IybVc3YnRDbmx1djNHVUpMcEprdEVReU9RNEpId1BlMzdj?=
 =?utf-8?B?ME9hcExpM1czZ0xCZ1JDYXVnb3RPdVQ4Q1B4TGF6S3BDZG5IcGs5RkJLZE8v?=
 =?utf-8?B?VlRFNVlReUY4VzJEQkw4Ny85SEpTNzFWZ214YzBJUmtIbEczcUtpWkZITmFH?=
 =?utf-8?B?TjdNbGFQTldKZTgyWFFtbWl1VkNXV3Q2eVQ0Nm9pZ2taSmZGeEs5bjl5SlJv?=
 =?utf-8?B?VW9GMExidmxubGM5b2dpSTR4d21YVTQ2cUJxa1hwR3JMbTRBa3ZPZGM0cmZO?=
 =?utf-8?B?cmFWWjdWU04rL0F2Y2JkUDU1Q2tGNnBBaFRjUEtZNWJpekZEdXVBc0JmclRk?=
 =?utf-8?B?ZHdwOXFBTktpWWVKUEg4SGZxSmZTYmlDZytvRUdmVzFFYTBmZUhKY0Y4MXZK?=
 =?utf-8?B?d2RaNnkyRVFSa2NQOTdmWVdaQXpkYTYyeW5HdTh6SDlZSThTUnhQSXl6WmdZ?=
 =?utf-8?B?U2lQd2lEd0J6cm1PS2pPWnBHUFpBUkxPaE5ZNTZmL0RTcEJvOWloVGlWdmEr?=
 =?utf-8?B?TjhibkYzL1JucDZLYkJvSjdGeGd1MzZSYjhHM1M0QTdKNUIwYU5GeXZXKy9E?=
 =?utf-8?B?WkVBTmk3VE1RQ0wrZjV4VWR2MDZicjVVMTk3dzVoVmM1QmI0R2xrNk8vOHdk?=
 =?utf-8?B?N0FpU1ovYnF6NGNVRUs1dC8ya1pXTGdMZEg5M1VaMnZ6OXZuY2k0N2RFYWlG?=
 =?utf-8?B?akV1VE52a245dDU0M3VpTHhXRm54UjY1ZVpZaHhvZjV3MVJraFpjWm12a0Rs?=
 =?utf-8?B?NFJaS20zemR3YVNZbnVJNkxlSUZRUXU3b2ZYb0I0WFNHZVNPYmovNFUzWkZi?=
 =?utf-8?B?T2liUUl2OU1YS09TczEva1RzcTRNajErSk5aSlVQRmwyL1hNZ1FjVzkvbVVT?=
 =?utf-8?B?Z0h4OVlNNW11V1pzcGd3NVYzNXRvTDVqVDcwb1BmUHRWa1QwU0pMV0NGNFVD?=
 =?utf-8?B?VGpnSDVDcE05R2pEUU5XQnVJNFpkaGdRMGh5VW9WRTVHcHR4cENPMktOSzNi?=
 =?utf-8?B?OTVTU1dORHhhK1dvOFdvMGdhVGFXNlEwRXc5VFpqSTlDbGFrQ3VLcitXZDhl?=
 =?utf-8?B?Rnlnek5KSUhFdnBlWmMrS0pFa2U5Slk2RlZsQUo4V0tPTDIwQ29ZdStIZWNH?=
 =?utf-8?B?MmFZUW53WHRGZk13U0FEcVljM3dPYTdubGk3Zk9MYkxiOFc0MUxPaEVzbFJk?=
 =?utf-8?B?M0FSSk1UbWpiWENTc3UvMndRdmpTRUw4enJHbHhTWCtWYkU2SEpUaEhIblB4?=
 =?utf-8?B?Rmk3WFhUN3ZUVjdwcHozUkhyWk1rN3Rvbldva2Q3QVkya2FpTkVLYUZkalJl?=
 =?utf-8?B?dyt0ZlIrUTF0MHhTNm0rcUlDR1ltR3pmWEtUQ1RJQnhjdUxnNFVlTmVwdUpP?=
 =?utf-8?B?bitDMXNzK0U1amlyVzY2cFVGRWRKb3NVQWtIMDVyaXl6UlB6cmVsbW1DQUZn?=
 =?utf-8?B?TjFFTWlDNVQxeWlWL3hqdEh0aTNrV0NkRzBhS0d3dGZBMmRGQjRxZEZZbmFV?=
 =?utf-8?B?dDhSMG5mRm5VZmh1YUgxNTJyQWZZREl3YUVLS1d1bFozb2hBZDZmdnFyV2Yx?=
 =?utf-8?B?Und3MzZkZWl6TmkrNWVXdnh5SW5JcHIrUDRvZFd1N2V3MmZmTGhCZjRoMlJP?=
 =?utf-8?B?NDRweG9pc1JWdkRRbTFHejRBWFlid1dmRHBlQ0ZnOEdBM0xWT3Znc3dyeHNj?=
 =?utf-8?B?NmZCZDZaeUxVZ1AzbUU5WXZGY2dzcjc5YmZmOXdlRnhzTkdLSjJlNE5rcHVO?=
 =?utf-8?B?N3RpRXFZOFduN0FjcmViM3QzUDEwbmptTnQrdC8xbXREQmMyZ25Ga3d5UUZk?=
 =?utf-8?B?dmJlTGxyc3pySm9VREV4dWJMTWlQMXMvQVB5eTIwSnJodUNoWHlyNHpIQzBi?=
 =?utf-8?B?VlpBcEdmbWFPdkZpNnd2S3dFYUlJeXFuUmtqV0R1NWQ3blRNaWQyV3VlSHVS?=
 =?utf-8?Q?r/d/mJwCVcVTIHYJELCyje7Qq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f08fc13-4e37-46fa-5830-08dbdfb1dfa4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 16:52:05.8416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E0kgeTOHai1ImzaNGf3CBj2IZNd52nbl+hg+cfyi+3Jw46257X3M+IuikOLg7XkFd5ZxZ3qfi68JFe993SZWoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9057
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Sasha McIntosh <sashamcintosh@google.com>,
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



On 2023-10-25 16:16, Alex Goins wrote:
> Thank you Harry and all other contributors for your work on this. Responses
> inline -
> 

Thanks for your comments on this. Apologies for the late response.
I was focussing on the simpler responses to my patch set first and
left your last as it's the most interesting.

> On Mon, 23 Oct 2023, Pekka Paalanen wrote:
> 
>> On Fri, 20 Oct 2023 11:23:28 -0400
>> Harry Wentland <harry.wentland@amd.com> wrote:
>>
>>> On 2023-10-20 10:57, Pekka Paalanen wrote:
>>>> On Fri, 20 Oct 2023 16:22:56 +0200
>>>> Sebastian Wick <sebastian.wick@redhat.com> wrote:
>>>>   
>>>>> Thanks for continuing to work on this!
>>>>>
>>>>> On Thu, Oct 19, 2023 at 05:21:22PM -0400, Harry Wentland wrote:  
>>>>>> v2:
>>>>>>  - Update colorop visualizations to match reality (Sebastian, Alex Hung)
>>>>>>  - Updated wording (Pekka)
>>>>>>  - Change BYPASS wording to make it non-mandatory (Sebastian)
>>>>>>  - Drop cover-letter-like paragraph from COLOR_PIPELINE Plane Property
>>>>>>    section (Pekka)
>>>>>>  - Use PQ EOTF instead of its inverse in Pipeline Programming example (Melissa)
>>>>>>  - Add "Driver Implementer's Guide" section (Pekka)
>>>>>>  - Add "Driver Forward/Backward Compatibility" section (Sebastian, Pekka)
>>>>
>>>> ...
>>>>
>>>>>> +An example of a drm_colorop object might look like one of these::
>>>>>> +
>>>>>> +    /* 1D enumerated curve */
>>>>>> +    Color operation 42
>>>>>> +    ├─ "TYPE": immutable enum {1D enumerated curve, 1D LUT, 3x3 matrix, 3x4 matrix, 3D LUT, etc.} = 1D enumerated curve
>>>>>> +    ├─ "BYPASS": bool {true, false}
>>>>>> +    ├─ "CURVE_1D_TYPE": enum {sRGB EOTF, sRGB inverse EOTF, PQ EOTF, PQ inverse EOTF, …}
>>>>>> +    └─ "NEXT": immutable color operation ID = 43
> 
> I know these are just examples, but I would also like to suggest the possibility
> of an "identity" CURVE_1D_TYPE. BYPASS = true might get different results
> compared to setting an identity in some cases depending on the hardware. See
> below for more on this, RE: implicit format conversions.
> 
> Although NVIDIA hardware doesn't use a ROM for enumerated curves, it came up in
> offline discussions that it would nonetheless be helpful to expose enumerated
> curves in order to hide the vendor-specific complexities of programming
> segmented LUTs from clients. In that case, we would simply refer to the
> enumerated curve when calculating/choosing segmented LUT entries.
> 
> Another thing that came up in offline discussions is that we could use multiple
> color operations to program a single operation in hardware. As I understand it,
> AMD has a ROM-defined LUT, followed by a custom 4K entry LUT, followed by an
> "HDR Multiplier". On NVIDIA we don't have these as separate hardware stages, but
> we could combine them into a singular LUT in software, such that you can combine
> e.g. segmented PQ EOTF with night light. One caveat is that you will lose
> precision from the custom LUT where it overlaps with the linear section of the
> enumerated curve, but that is unavoidable and shouldn't be an issue in most
> use-cases.
> 

FWIW, for the most part we don't have ROMs followed by custom LUTs. We have
either a ROM-based HW block or a segmented programmable LUT. In the case of the
former we will only expose named transfer functions. In the case of the latter
we expose a named TF, followed by custom LUT and merge them into one segmented
LUT.

> Actually, the current examples in the proposal don't include a multiplier color
> op, which might be useful. For AMD as above, but also for NVIDIA as the
> following issue arises:
> 

The current examples are only examples. A multiplier coloro opwould make a lot
of sense.

> As discussed further below, the NVIDIA "degamma" LUT performs an implicit fixed
> point to FP16 conversion. In that conversion, what fixed point 0xFFFFFFFF maps
> to in floating point varies depending on the source content. If it's SDR
> content, we want the max value in FP16 to be 1.0 (80 nits), subject to a
> potential boost multiplier if we want SDR content to be brighter. If it's HDR PQ
> content, we want the max value in FP16 to be 125.0 (10,000 nits). My assumption
> is that this is also what AMD's "HDR Multiplier" stage is used for, is that
> correct?
> 

Our PQ transfer function will also map to [0.0, 125.0] without use of the HDR
multiplier. The HDR multiplier is intended to be used to scale SDR brightness
when the user moves the SDR brightness slider in the OS.

> From the given enumerated curves, it's not clear how they would map to the
> above. Should sRGB EOTF have a max FP16 value of 1.0, and the PQ EOTF a max FP16
> value of 125.0? That may work, but it tends towards the "descriptive" notion of

Yes, I think we need to be clear about the output range of a named transfer
function. While AMD and NVidia map PQ to [0.0, 125.0] I could see others map
it to [0.0, 1.0] (and maybe scale sRGB down to 1/125.0 or some other value).

> assuming the source content, which may not be accurate in all cases. This is
> also an issue for the custom 1D LUT, as the blob will need to be converted to
> FP16 in order to populate our "degamma" LUT. What should the resulting max FP16
> value be, given that we no longer have any hint as to the source content?
> 

I consider input data to be in UNORM and convert that to [0.0, 1.0]. Transfer
functions (such as PQ) might then scale that beyond the [0.0, 1.0] range.

> I think a multiplier color op solves all of these issues. Named curves and
> custom 1D LUTs would by default assume a max FP16 value of 1.0, which would then
> be adjusted by the multiplier. For 80 nit SDR content, set it to 1, for 400
> nit SDR content, set it to 5, for HDR PQ content, set it to 125, etc. 
> 

The custom ROMs won't allow adjustment on AMD HW, so it would then need to be a
fixed multiplier. I would be in favor of defining the named PQ curve as

DRM_COLOROP_1D_CURVE_PQ_125_EOTF

for the [0.0, 125.0] TF, or as

DRM_COLOROP_1D_CURVE_PQ_1_EOTF

for HW that maps it to [0.0, 1.0]

>>>>>> +
>>>>>> +    /* custom 4k entry 1D LUT */
>>>>>> +    Color operation 52
>>>>>> +    ├─ "TYPE": immutable enum {1D enumerated curve, 1D LUT, 3x3 matrix, 3x4 matrix, 3D LUT, etc.} = 1D LUT
>>>>>> +    ├─ "BYPASS": bool {true, false}
>>>>>> +    ├─ "LUT_1D_SIZE": immutable range = 4096
>>>>>> +    ├─ "LUT_1D": blob
>>>>>> +    └─ "NEXT": immutable color operation ID = 0
>>>>
>>>> ...
>>>>   
>>>>>> +Driver Forward/Backward Compatibility
>>>>>> +=====================================
>>>>>> +
>>>>>> +As this is uAPI drivers can't regress color pipelines that have been
>>>>>> +introduced for a given HW generation. New HW generations are free to
>>>>>> +abandon color pipelines advertised for previous generations.
>>>>>> +Nevertheless, it can be beneficial to carry support for existing color
>>>>>> +pipelines forward as those will likely already have support in DRM
>>>>>> +clients.
>>>>>> +
>>>>>> +Introducing new colorops to a pipeline is fine, as long as they can be
>>>>>> +disabled or are purely informational. DRM clients implementing support
>>>>>> +for the pipeline can always skip unknown properties as long as they can
>>>>>> +be confident that doing so will not cause unexpected results.
>>>>>> +
>>>>>> +If a new colorop doesn't fall into one of the above categories
>>>>>> +(bypassable or informational) the modified pipeline would be unusable
>>>>>> +for user space. In this case a new pipeline should be defined.    
>>>>>
>>>>> How can user space detect an informational element? Should we just add a
>>>>> BYPASS property to informational elements, make it read only and set to
>>>>> true maybe? Or something more descriptive?  
>>>>
>>>> Read-only BYPASS set to true would be fine by me, I guess.
>>>>   
>>>
>>> Don't you mean set to false? An informational element will always do
>>> something, so it can't be bypassed.
>>
>> Yeah, this is why we need a definition. I understand "informational" to
>> not change pixel values in any way. Previously I had some weird idea
>> that scaling doesn't alter color, but of course it may.
> 
> On recent hardware, the NVIDIA pre-blending pipeline includes LUTs that do
> implicit fixed-point to FP16 conversions, and vice versa.
> 
> For example, the "degamma" LUT towards the beginning of the pipeline implicitly
> converts from fixed point to FP16, and some of the following operations expect
> to operate in FP16. As such, if you have a fixed point input and don't bypass
> those following operations, you *must not* bypass the LUT, even if you are
> otherwise just programming it with the identity. Conversely, if you have a
> floating point input, you *must* bypass the LUT.
> 
> Could informational elements and allowing the exclusion of the BYPASS property
> be used to convey this information to the client?  For example, we could expose
> one pipeline with the LUT exposed with read-only BYPASS set to false, and
> sandwich it with informational "Fixed Point" and "FP16" elements to accommodate
> fixed point input. Then, expose another pipeline with the LUT missing, and an
> informational "FP16" element in its place to accommodate floating point input.
> 

I wonder if an informational element at the beginning of the pipeline can
advertise the FOURCC formats this pipeline can operate on. For AMD HW we also
have certain things we can only do on RGB and not on NV12, for example.

> That's just an example; we also have other operations in the pipeline that do
> similar implicit conversions. In these cases we don't want the operations to be
> bypassed individually, so instead we would expose them as mandatory in some
> pipelines and missing in others, with informational elements to help inform the
> client of which to choose. Is that acceptable under the current proposal?
> 
> Note that in this case, the information just has to do with what format the
> pixels should be in, it doesn't correspond to any specific operation. So, I'm
> not sure that BYPASS has any meaning for informational elements in this context.
> 
>>>> I think we also need a definition of "informational".
>>>>
>>>> Counter-example 1: a colorop that represents a non-configurable  
>>>
>>> Not sure what's "counter" for these examples?
>>>
>>>> YUV<->RGB conversion. Maybe it determines its operation from FB pixel
>>>> format. It cannot be set to bypass, it cannot be configured, and it
>>>> will alter color values.
> 
> Would it be reasonable to expose this is a 3x4 matrix with a read-only blob and
> no BYPASS property? I already brought up a similar idea at the XDC HDR Workshop
> based on the principle that read-only blobs could be used to express some static
> pipeline elements without the need to define a new type, but got mixed opinions.
> I think this demonstrates the principle further, as clients could detect this
> programmatically instead of having to special-case the informational element.
> 

That's an option. But I think a "named matrix" type might make more sense so you
don't need to create a pipeline for each read-only matrix and so userspace
doesn't need to parse the read-only matrix to find out which conversion it does.

>>>>
>>>> Counter-example 2: image size scaling colorop. It might not be
>>>> configurable, it is controlled by the plane CRTC_* and SRC_*
>>>> properties. You still need to understand what it does, so you can
>>>> arrange the scaling to work correctly. (Do not want to scale an image
>>>> with PQ-encoded values as Josh demonstrated in XDC.)
>>>>   
>>>
>>> IMO the position of the scaling operation is the thing that's important
>>> here as the color pipeline won't define scaling properties.
> 
> I agree that blending should ideally be done in linear space, and I remember
> that from Josh's presentation at XDC, but I don't recall the same being said for
> scaling. In fact, the NVIDIA pre-blending scaler exists in a stage of the
> pipeline that is meant to be in PQ space (more on this below), and that was
> found to achieve better results at HDR/SDR boundaries. Of course, this only
> bolsters the argument that it would be helpful to have an informational "scaler"
> element to understand at which stage scaling takes place.
> 

I think an informational scaler makes sense. It's interesting how different HW
vendors made different design decisions here as no OS ever really defined which
space they want scaling to be performed in.

>>>> Counter-example 3: image sampling colorop. Averages FB originated color
>>>> values to produce a color sample. Again do not want to do this with
>>>> PQ-encoded values.
>>>>   
>>>
>>> Wouldn't this only happen during a scaling op?
>>
>> There is certainly some overlap between examples 2 and 3. IIRC SRC_X/Y
>> coordinates can be fractional, which makes nearest vs. bilinear
>> sampling have a difference even if there is no scaling.
>>
>> There is also the question of chroma siting with sub-sampled YUV. I
>> don't know how that actually works, or how it theoretically should work.
> 
> We have some operations in our pipeline that are intended to be static, i.e. a
> static matrix that converts from RGB to LMS, and later another that converts
> from LMS to ICtCp. There are even LUTs that are intended to be static,
> converting from linear to PQ and vice versa. All of this is because the
> pre-blending scaler and tone mapping operator are intended to operate in ICtCp
> PQ space. Although the stated LUTs and matrices are intended to be static, they
> are actually programmable. In offline discussions, it was indicated that it
> would be helpful to actually expose the programmability, as opposed to exposing
> them as non-bypassable blocks, as some compositors may have novel uses for them.
> 
> Despite being programmable, the LUTs are updated in a manner that is less
> efficient as compared to e.g. the non-static "degamma" LUT. Would it be helpful
> if there was some way to tag operations according to their performance,
> for example so that clients can prefer a high performance one when they
> intend to do an animated transition? I recall from the XDC HDR workshop
> that this is also an issue with AMD's 3DLUT, where updates can be too
> slow to animate.
> 

That's an interesting idea.

Harry

> Thanks,
> Alex Goins
> NVIDIA Linux Driver Team
> 
>> Thanks,
>> pq

