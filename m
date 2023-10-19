Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 689DE7CFD64
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 16:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A4610E0D1;
	Thu, 19 Oct 2023 14:56:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDFCA10E0B9;
 Thu, 19 Oct 2023 14:56:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kG7uwp9Ol1GmsRp5093ZCZUF+TRB1IPI29h4vQBETlabqeD85/9YlrBXuKOddL5kFzVn1n5Xm1N7r7uiq84GZISXazbGx1Sf9e8fVwFU5irilJzgUidYe/O/6pnYAS0Fvl/MASuOLWHpyOQS63IRtl62+/FlPKYTlK2JUBDVyXDD/Z4ombEZ8If2IaLYLhjPU0jNTRRyC5d5+OKhDryUVkguzOMCMO4soN9h8oLaD+byc256MMj614ujhHKkQBaMhUrKJcBwDy0O/L4GNQ3TGZMcNpj1kQiSdwR/JxAdwHPw1x0F6mm3TcxxPIovd3ANetWFHMnayg1OkbQ0Q6lI6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tynosloGJdS7pkStW9xXO24tTBbjLUFqGguX7RfeJcU=;
 b=T9BbzFaN+ZnVW9pfOC0Kdk2jbVsy8GfDdbVG3o0s1yrC/ZAgTLRgKP2H3GEKfApdnG+nYc+UkJWvOSVjEXuSkZgTBPV8TJtlIBdV8EezRpVrfTbcThyONb0JOux8wQvUw+XaM7xxyl9IUzHJMXteb7tR5dpv4h/tE+Tp0ICEB5HnvI17zQ88vHmFzt6lI0xXlXRGgZ5yX8v3tPYxQcyLKGIIlfcZgoqGCNKHmAdcqtpDgzPxmWXgO+vEFouOUwiAdEKHw7hwIiP5Lk7TMxImEMsZKWZkZIffqScZV4F2iCG8Tjv/HsRcLEzcBHXSRtZfRkDFXDbRZIFIrmiJ0lvuKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tynosloGJdS7pkStW9xXO24tTBbjLUFqGguX7RfeJcU=;
 b=IkekBqfJKfihA0ROfr4hXBJauQc8xoDx1pbiedjP7h1BLO95BOeA6HI3X949+XUAv/vZ4inbN34yN09v9TUyswWkDcmEu5w6vDr1FTJo7z5oAu10XO28GtsRKg1gVIH3rLj9AuqfJAgeSrVErZg5jlrAo07mY9OHR5dGjn5Zpm0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SJ2PR12MB7991.namprd12.prod.outlook.com (2603:10b6:a03:4d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Thu, 19 Oct
 2023 14:56:33 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 14:56:33 +0000
Message-ID: <04754060-8f1c-4bf1-91bb-2e0305339b1c@amd.com>
Date: Thu, 19 Oct 2023 10:56:29 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/10] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20230908150235.75918-1-harry.wentland@amd.com>
 <20230908150235.75918-2-harry.wentland@amd.com>
 <20230913142902.31a51b46@eldfell>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230913142902.31a51b46@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0124.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::33) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SJ2PR12MB7991:EE_
X-MS-Office365-Filtering-Correlation-Id: dd8962ee-dc4d-4cfa-1337-08dbd0b395b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rUYfje4DmNgqNmoWQmQGVPj2ho0bgHBiFzMSPD9L0wsxWPDzWa0CKIaosUM1ujY80AExOcHXddhCIMOawDyQTmgNaRxbLqofbGs1GfCVGMihwXrfJNrh2TAJE/ej0DTRSFMieMDdSokI7NyJFu3Ao70P11jh04XZKg/ImYVY6+Pip8lmtpLxEvGaZx455zRuzp+rGAWJXpVVpEpxjTOs/vaA+JL3elzZKwgqXLrPlJK1S+01tHGWK4EUjsvVxZfGJYb/xoL7B0fXfSJp7qcDcv8HfiWkz2eGvM8g45phL9hgIAx0dpNNp7D+zZFSpmjQE/PC5YKiAhiz904QefnyMtix35k3QH6ZtyNVYsdCVexPZ/4QRiMfCBJOuSmiEh3w6Y17fuDnD5EX/fNxfuTwOgZEk8uGuC0wevn+AS4CLxwSPg+KGSew6AGTYDqguk6Mm3gSpBY96yfCLeshSrakmXGn+W+pVHALLX0g1gdQcJ2xDBYhI8OYlBZ1Iny/IsCbdEGArCvxwGe9Qxm3cBdDD5h2WdV+iRpusTGKjkPUHSXVqsxcgtJocvVjbPHJ65qPA0twWUq8MWhw8FNl4oaPUme/xHJP24dTQuafD6FGVReotuKPF5WUKnlUKI8jJEg6RJSbonDR33hFxtOZ0LHT2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(396003)(136003)(346002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(83380400001)(54906003)(38100700002)(31696002)(2616005)(41300700001)(6512007)(36756003)(316002)(2906002)(86362001)(6916009)(66556008)(44832011)(66476007)(7416002)(66946007)(5660300002)(8936002)(4326008)(8676002)(6666004)(478600001)(6506007)(6486002)(966005)(53546011)(66574015)(26005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUY0Q1hBV1IrUGhZMVp3Mi9wZGFrVXhtM3B4cTNoMWRmT3AvalNiSk4wVlhp?=
 =?utf-8?B?cWJkRjYyMFF2bHNkc1hYMUlmcnhFTjh6MEY0RlJsVjlVSWlVUVZEbnJSRG1a?=
 =?utf-8?B?R2RHWVlOdkhlOHhxbEY3ZzFxdklXck0zeGFNaS9EMEtBWjFCcWFFMjhSRHRn?=
 =?utf-8?B?UFNWenNmOW1PQ25CcWhoMGlpNEl1bmJiV1hINDVIazJxNUNGV3JqOGc3NElC?=
 =?utf-8?B?bGZEejBrdHZyWk1iSmFMM2xkYTRzNCsrYjVWbVRHZ0xnVjVDQXZacHE0dk5n?=
 =?utf-8?B?aEppZ25BMjE5V3VqdjVZRHBGRUV6cVZuaVV4Y0lGMlpGb2NpTVBhR2xqcUQ2?=
 =?utf-8?B?dVRuNWR4SWRaaGFnRHY0OXBiQmpJa0ZWOXQzUkcrM1FLOWF4UzE0c0NKRkdO?=
 =?utf-8?B?eUNENUlMbEppTXRIWUdYbVcwY25OcHB4NGxhb3dCRmlYMjBCMWk4cXJYdEZC?=
 =?utf-8?B?NitVOVlLUG94cTU3dUxjT3BwNTZmM3Z4YS92TWZKRzVGdjZjQkNuN2FQNmZR?=
 =?utf-8?B?dW1nNmk5MWFIOEl4OXIzaUdiTXlmVksxRWQvbjdQYUJkaHZ3ZGFuOTFyeGx1?=
 =?utf-8?B?dngxcTBsVzRYWmJQVHlYalNsVzM5V0lES29JdEZwai9KcEs0RXhWWkFxcjcw?=
 =?utf-8?B?SHdqc1NMaS9ta0p0a3FLc05mMHRTOUNncHRPY3dMcGNnZTBoK0FnUzU0VmlB?=
 =?utf-8?B?cTVVK2wvdXA0VW5wM0xKV2tiRWhnaFZwaGIrMzNwbDBEQ1FQUzBZQUlKb0s2?=
 =?utf-8?B?eGc2cG41QWtOVXdxbURjNmF5N2VvanY3VU5vRnB6Z0cxSVV0Z3BMbmxIUjRK?=
 =?utf-8?B?em1QVVVHRkZyYVJvMWVPdHp2S2Qzdzh0Vk11NnloNXVvMklKTFdjcjR3MTNz?=
 =?utf-8?B?L3ZGdDZuLzQyTzNmRk1aTVJEMVp5NHZoaWY1NCtUc1h0NlBUeHo0ZytxbHdW?=
 =?utf-8?B?SXl5ZnltVmc5YWZTb1dJMjE4T0VMbmxLSW9QQ3Bqbk1qbGllTVB2UnUrKzhs?=
 =?utf-8?B?bnFTWWNZUFNHYnlpUFhsMjJtNkZLRkZEeEtUNU05bWljc0s0U25LMWRjV2dp?=
 =?utf-8?B?R2ZKaElDZWc4c3p6MXgxZWFNellaMjgxTWwxVTZoTkZwanJYS0xvNlM3aUdH?=
 =?utf-8?B?MFc2WUJlL0x4VWxUbE50MUVib1lLZFpqTWErSE1FRnVML2c4dkZ0TzU2eFJD?=
 =?utf-8?B?cUhRc0x0Tld1THl3TjIweUpRL1hIUmxmejczY01VZ3ExZlNFaC9QRVBKZ20y?=
 =?utf-8?B?MWNLMjFyVDExeTdhd3RaQU1jcFd0ZmFYUnlTVjJrdnpCMEpLQmhpejFSY2Vw?=
 =?utf-8?B?aEhYNFRwRVp3TjRrRVRqTks1OXR3Q0dKd0wvamYrMlhWSjIxNlVOUS9PWHNY?=
 =?utf-8?B?SnhRZTV2ZTRKVHMyR2lheHlWQlVZS3poQlJMbDhXTVNGa25YY1MxdmZnZVJL?=
 =?utf-8?B?bVVOVWNqUlBJL0NiSHREOE5zR0VhbTVBekdad3VYdlFQVFF5NWYzejBNVzFm?=
 =?utf-8?B?ZkJRejB2bzZqVHdNOXhDMEsxUG5PUmd6L2F3dFdIemt1bXFTK0NiNHZFWWxP?=
 =?utf-8?B?UjRKM1F0QmpKVXJDQVRLQTIzSFRmNjZlR0ZHL3o1M2hUNG5kRlVTczJhZm1R?=
 =?utf-8?B?SmFOcUJSUlozU2ZqZ1FoVGI3MHFUdDZiVDhPd0F4aEFDRXBHbUkwa1N5SWwy?=
 =?utf-8?B?WFczaElhN0JkbUNCVnNMSG15YkJjVy9VNzBGQTVjaUxtbVNZVVprWTdrdUNW?=
 =?utf-8?B?MHl6aWlLdUVIMjFyQUlyN25URWRqQmFQaTVNQVBvWTI2djBSekUvYUJOOHNh?=
 =?utf-8?B?dlFINXFzdHJrRmlncE5yS1NCSThGV3R6SG81aVowVVpjbHY5NTJRWFFEV3JD?=
 =?utf-8?B?QTNxdzhkZFlYTE03QlVOQTc4RkdtdVY2SThEbWlSVDlKb2xwVEd6ODBIWmpJ?=
 =?utf-8?B?QlJjUzhPMUF0Ui8xUGcvYlNiUldVV1RLNVVGSXBXVG9oSC9yRDAvYVYwVWNV?=
 =?utf-8?B?MnhMY1pVZUh4Y0xBOGVDbmhvaC9WUytxR1VvMDhrK3JaY0xvWWpJSGpzS0Zi?=
 =?utf-8?B?WTZXKzUxck4zdXFhMG1HQjhvblVNQ0JWK0MrU0lLTC80SGQ3N0duNk9BYitM?=
 =?utf-8?Q?A9H+nuIR+/5v8wcUmorjgo1zV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd8962ee-dc4d-4cfa-1337-08dbd0b395b6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 14:56:33.4352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o4wq4dy8zsJgytvTrdiXRYdtrboo8+k5ukORDcDOKPApKoa5GQouklrDrcfuc7q3AVZPCbn9XHTYOLvJhPX/RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7991
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
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



On 2023-09-13 07:29, Pekka Paalanen wrote:
> On Fri, 8 Sep 2023 11:02:26 -0400
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
>> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
>> Cc: Simon Ser <contact@emersion.fr>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Melissa Wen <mwen@igalia.com>
>> Cc: Jonas Ådahl <jadahl@redhat.com>
>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>> Cc: Alexander Goins <agoins@nvidia.com>
>> Cc: Joshua Ashton <joshua@froggi.es>
>> Cc: Michel Dänzer <mdaenzer@redhat.com>
>> Cc: Aleix Pol <aleixpol@kde.org>
>> Cc: Xaver Hugl <xaver.hugl@gmail.com>
>> Cc: Victoria Brekenfeld <victoria@system76.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Uma Shankar <uma.shankar@intel.com>
>> Cc: Naseer Ahmed <quic_naseer@quicinc.com>
>> Cc: Christopher Braga <quic_cbraga@quicinc.com>
>> ---
>>  Documentation/gpu/rfc/color_pipeline.rst | 278 +++++++++++++++++++++++
>>  1 file changed, 278 insertions(+)
>>  create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
> 
> Hi Harry,
> 
> it's really nice to see this!
> 

Thanks for the feedback. I'm just putting a v2 together with comments
(partially) addressed.

> Sebastian started on the backward/forward compatibility, so I'll
> comment on everything else here, and leave the compatibility for that
> thread.
> 
>> diff --git a/Documentation/gpu/rfc/color_pipeline.rst b/Documentation/gpu/rfc/color_pipeline.rst
>> new file mode 100644
>> index 000000000000..bfa4a8f12087
>> --- /dev/null
>> +++ b/Documentation/gpu/rfc/color_pipeline.rst
...
>> +COLOR_PIPELINE Plane Property
>> +=============================
>> +
>> +Because we don't have existing KMS color properties in the pre-blending
>> +portion of display pipelines (i.e. on drm_planes) we are introducing
>> +color pipelines here first. Eventually we'll want to use the same
>> +concept for the post-blending portion, i.e. drm_crtcs.
> 
> This paragraph might fit better in a cover letter.
> 
>> +
>> +Color Pipelines are created by a driver and advertised via a new
>> +COLOR_PIPELINE enum property on each plane. Values of the property
>> +always include '0', which is the default and means all color processing
>> +is disabled. Additional values will be the object IDs of the first
>> +drm_colorop in a pipeline. A driver can create and advertise none, one,
>> +or more possible color pipelines. A DRM client will select a color
>> +pipeline by setting the COLOR PIPELINE to the respective value.
>> +
>> +In the case where drivers have custom support for pre-blending color
>> +processing those drivers shall reject atomic commits that are trying to
>> +set both the custom color properties, as well as the COLOR_PIPELINE
> 
> s/set/use/ because one of them could be carried-over state from
> previous commits while not literally set in this one.
> 
>> +property.
>> +
>> +An example of a COLOR_PIPELINE property on a plane might look like this::
>> +
>> +    Plane 10
>> +    ├─ "type": immutable enum {Overlay, Primary, Cursor} = Primary
>> +    ├─ …
>> +    └─ "color_pipeline": enum {0, 42, 52} = 0
> 
> Enum values are string names. I presume the intention here is that the
> strings will never need to be parsed, and the uint64_t is always equal
> to the string representation, right?
> 
> That needs a statement here. It differs from all previous uses of
> enums, and e.g. requires a little bit of new API in libweston's
> DRM-backend to handle since it has its own enums referring to the
> string names that get mapped to the uint64_t per owning KMS object.
> 

I'm currently putting the DRM object ID in the "value" and use the
"name" as a descriptive name.

> struct drm_mode_property_enum {
> 	__u64 value;
> 	char name[DRM_PROP_NAME_LEN];
> };

This works well in IGT and gives us a nice descriptive name for
debugging, but I could consider changing this if it'd simplify
people's lives.

>> +
>> +
>> +Color Pipeline Discovery
>> +========================
>> +
>> +A DRM client wanting color management on a drm_plane will:
>> +
>> +1. Read all drm_colorop objects
> 
> What does this do?

We probably don't need this, and with it we probably don't need
the new IOCTLs. I added this to align with IGT's current init
procedure where it reads all DRM core objects, like planes, etc.,
before using them. But realistically we can just look at the
colorop ID from the COLOR_PIPELINE property and then retrieve
the other colorops through the NEXT pointer.

> 
>> +2. Get the COLOR_PIPELINE property of the plane
>> +3. iterate all COLOR_PIPELINE enum values
>> +4. for each enum value walk the color pipeline (via the NEXT pointers)
>> +   and see if the available color operations are suitable for the
>> +   desired color management operations
>> +
>> +An example of chained properties to define an AMD pre-blending color
>> +pipeline might look like this::
>> +
>> +    Plane 10
>> +    ├─ "type": immutable enum {Overlay, Primary, Cursor} = Primary
>> +    └─ "color_pipeline": enum {0, 42} = 0
>> +    Color operation 42 (input CSC)
> 
> I presume the string "(input CSC)" does not come from KMS, and is
> actually just a comment added here by hand?
> 

Exactly. It only exists as a comment here. I'll remove it.

Harry

> 
> Thanks,
> pq
> 
>> +    ├─ "type": enum {Bypass, Matrix} = Matrix
>> +    ├─ "matrix_data": blob
>> +    └─ "next": immutable color operation ID = 43
>> +    Color operation 43
>> +    ├─ "type": enum {Scaling} = Scaling
>> +    └─ "next": immutable color operation ID = 44
>> +    Color operation 44 (DeGamma)
>> +    ├─ "type": enum {Bypass, 1D curve} = 1D curve
>> +    ├─ "1d_curve_type": enum {sRGB, PQ, …} = sRGB
>> +    └─ "next": immutable color operation ID = 45
>> +    Color operation 45 (gamut remap)
>> +    ├─ "type": enum {Bypass, Matrix} = Matrix
>> +    ├─ "matrix_data": blob
>> +    └─ "next": immutable color operation ID = 46
>> +    Color operation 46 (shaper LUT RAM)
>> +    ├─ "type": enum {Bypass, 1D curve} = 1D curve
>> +    ├─ "1d_curve_type": enum {LUT} = LUT
>> +    ├─ "lut_size": immutable range = 4096
>> +    ├─ "lut_data": blob
>> +    └─ "next": immutable color operation ID = 47
>> +    Color operation 47 (3D LUT RAM)
>> +    ├─ "type": enum {Bypass, 3D LUT} = 3D LUT
>> +    ├─ "lut_size": immutable range = 17
>> +    ├─ "lut_data": blob
>> +    └─ "next": immutable color operation ID = 48
>> +    Color operation 48 (blend gamma)
>> +    ├─ "type": enum {Bypass, 1D curve} = 1D curve
>> +    ├─ "1d_curve_type": enum {LUT, sRGB, PQ, …} = LUT
>> +    ├─ "lut_size": immutable range = 4096
>> +    ├─ "lut_data": blob
>> +    └─ "next": immutable color operation ID = 0
>> +
>> +
>> +Color Pipeline Programming
>> +==========================
>> +
>> +Once a DRM client has found a suitable pipeline it will:
>> +
>> +1. Set the COLOR_PIPELINE enum value to the one pointing at the first
>> +   drm_colorop object of the desired pipeline
>> +2. Set the properties for all drm_colorop objects in the pipeline to the
>> +   desired values, setting BYPASS to true for unused drm_colorop blocks,
>> +   and false for enabled drm_colorop blocks
>> +3. Perform atomic_check/commit as desired
>> +
>> +To configure the pipeline for an HDR10 PQ plane and blending in linear
>> +space, a compositor might perform an atomic commit with the following
>> +property values::
>> +
>> +    Plane 10
>> +    └─ "color_pipeline" = 42
>> +    Color operation 42 (input CSC)
>> +    └─ "bypass" = true
>> +    Color operation 44 (DeGamma)
>> +    └─ "bypass" = true
>> +    Color operation 45 (gamut remap)
>> +    └─ "bypasse" = true
>> +    Color operation 46 (shaper LUT RAM)
>> +    └─ "bypass" = true
>> +    Color operation 47 (3D LUT RAM)
>> +    └─ "lut_data" = Gamut mapping + tone mapping + night mode
>> +    Color operation 48 (blend gamma)
>> +    └─ "1d_curve_type" = PQ inverse EOTF
>> +
>> +
>> +References
>> +==========
>> +
>> +1. https://lore.kernel.org/dri-devel/QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr/
>> \ No newline at end of file
> 

