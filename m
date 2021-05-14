Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C64DC381288
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 23:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84AE26E406;
	Fri, 14 May 2021 21:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50516E3D8;
 Fri, 14 May 2021 21:04:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kneMUcdE+X6FIii7jAkmTzvFOnjmia5beWn5XG0Y9Amv1Fk1cJB0JGSbPfU5pyyhYuHQ/+FnBZBiPkG5EdB4XGxAqu4U48RcTaihOqNrvl+QSiTvmIePQsryVEBuKZi71qFXdKuYLy8NM0ma3sWNi1FYFZ/cDszw7u1Z1Y3009LD2/BMGrG6gWUhtZuaH8l/owLR0SJDdL5IenjCvlORoLc6FzA98w/3WSW5VR62lki/kSGZosLzUVyq6e3T5haVd1iI/esCZZ5ERBXr1ZCgA3yR/SoTrr1Swi6P/sX1jcTbZFohO5tRkJBr6kmeICV4KSElLd+g4bdv13puOIhtxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFun7dYPzbuGjULGPvjXbBcqCHIO5gB9lvOiVQEe04M=;
 b=jg/6NvFu7McSx7p/gSgs0AVZKX++jzj8Htasw6/mhSkRzr4lBuALrVVxPeEbo47/921vSShrVQtJvexfTIFjc6RFo49U4bAZJIOMb4VPKL+xBr30d+H1Ja8iYT7O3skOFIjc0qiCuhst0BN9EfEXkZw4AX0pD/MA1Tb+P5KB4ZnluqGeAwrMqHAO5k1OMH9SXAXfrezhruoyswveLhpGtMX4zugj0J2usD58r+6RUy/IxxWxZQzrR+xpo9JzOuYkxv55oJtg8UKc1lcPF87CV8v2Gk6hXA5vMbyz2RqXq7B1IY/ach0bGTSxM5bGRBV0HMCSWUlJfEw4BZGv/XVQ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFun7dYPzbuGjULGPvjXbBcqCHIO5gB9lvOiVQEe04M=;
 b=HgsDxDvR4rcCk8ovSfc4kAH7yWFQggRVj9fL6M5HhG9WaCkTTWoiB91nszscrD+Fvv+VXHsX+iS626WZPqVovI3SFuAPqjfqH2qdDGu/onXSItzvtOQP/0ORKTQq1189KZxtBeQHu38DxqiaY3BkUWMS4z5QixiGodVF+5U1nYA=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MWHPR1201MB0254.namprd12.prod.outlook.com (2603:10b6:301:57::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Fri, 14 May
 2021 21:04:56 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::c476:9fdf:664e:4f25]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::c476:9fdf:664e:4f25%4]) with mapi id 15.20.4129.026; Fri, 14 May 2021
 21:04:56 +0000
Subject: Re: [RFC PATCH 1/3] drm/color: Add RGB Color encodings
To: Sebastian Wick <sebastian@sebastianwick.net>
References: <20210426173852.484368-1-harry.wentland@amd.com>
 <20210426173852.484368-2-harry.wentland@amd.com> <YIcBUl+94sHJsT8B@intel.com>
 <0090ce07-6102-59e7-bc8c-3528297aa5ae@amd.com>
 <a49e967a0082727757143828770bd671@sebastianwick.net>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <cac44e69-85cb-661b-4a5e-33fafee8ea3d@amd.com>
Date: Fri, 14 May 2021 17:04:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <a49e967a0082727757143828770bd671@sebastianwick.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [198.200.67.155]
X-ClientProxiedBy: YQBPR01CA0098.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::34) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.193] (198.200.67.155) by
 YQBPR01CA0098.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:3::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.30 via Frontend Transport; Fri, 14 May 2021 21:04:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0be6a9eb-8898-4897-f205-08d9171becf9
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0254:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0254E3C9267A660DF44FA1908C509@MWHPR1201MB0254.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DwPVuFKN7uhBV9pMQBGM6siTs2AiUYeaItrdux6x3UIVSRQU+7oMIxIBCEQPDHZauYg9EZY2r9x3YL/IS8dyHnGJiL5WXfT1leoP6qyPLNOc6L1PpzbLXmTsFAJHHgP6SPrwbZmKVuVyEJQsddSy6+7AD7446t5lj+HLwf0EtxzzpBlf+7zV2rBWCxeRy+yZGa3my27oT9vyyCoSufh24X6wUVUH25sK3KyVz/07YDsi21ykSsc4mrPuhMP5h+67nkAH/Yr8W02T3fskjxe4FiF8pPPOtCO55keOozdi2oGjd5/YToxTT633lkSUoDzPeiuFy8rqkcDKv6xHTplq8PrpFLNKyP/toWExqVP/g4LqTAws0cvcUtc6KzrZSY/XE8d7iRSa53etobtanN/8BmT7zhCyqAYCzuGx51glxR037iPS7IXBVLKAoGdkNMSHZrrXX/U4QA3mUaP1xrLwKZhJ/vxMHbBtc5FLi0ydmZWR4u58flnOqQDB1QUkGMRg7wM+EHFyrI727Fr+FYggnGvNPZ162C1YeHxML0eokfMI1Hf967IwIwxD2dBig4lSa3Elfz5wKQXlfufcvMeuvXlxbHawzF0D9oyF20Z7IJ8Sx2l3Wk84XE5sbhMwhP60XGYQirJkq+lvvw5JaEKVTIEzJ3fEH0Oig1bHJPAX17RDV77yNUCVutkmsGrERjFas+J3BMo9Hy+lo6qmbKvgR3dbU/nY4arcdNmCUtgKrjs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(44832011)(186003)(66946007)(16526019)(66476007)(6486002)(66556008)(66574015)(2906002)(5660300002)(31696002)(8936002)(31686004)(26005)(316002)(8676002)(966005)(478600001)(54906003)(956004)(2616005)(83380400001)(86362001)(53546011)(16576012)(36756003)(4326008)(38100700002)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Sk01bmEyS3FFUXNtZld1VjFpaUErN3VCcHRtQ2VaT2xtWHFqQmEyeDVVMGN5?=
 =?utf-8?B?eWtrd1VmbU9OYUwvR2FjYnZXSjhneGdQRmFDNGQ3UWdTYXJmMS9jUCtSeGZP?=
 =?utf-8?B?UENRcGdFTHZyL3RmRHFWQjd5MTVaOTZwS3BQeGJ6QUU1eEExQzhnNTZqUE0v?=
 =?utf-8?B?MDdiWEFmbGRLL0dZK3pEY3Q5UEFPdHpMTHBYREZFTy8wNVp2Nmo5blZUT0lV?=
 =?utf-8?B?ZFpvS3ArTlRSa2tqcjZ4NXdtMFhsRW5BYml2cXVySHlBQmpKdVozSkk2MjQ2?=
 =?utf-8?B?eDhGVGZjVUFyYldpak5Ic0VLNUpGS2l2NHJVWi9uNzd5ZnFxN1YyRVo3RFo3?=
 =?utf-8?B?RTZTR0JtakpnTjEycmpmNGRsdE1EQWdRcXVjVGJCR3hQeUZBOVN3QTJGU2FI?=
 =?utf-8?B?WUNwMFVERW84b1NEc0ZCZTlTUUsyRFoxUUF4U1VFdHBKNHRtNmZyZWFKZWs2?=
 =?utf-8?B?ZFJoa29SYW56MFhST1d1VVRXU2dLQ1IwK2JPeHQzcGdRRzVSOG52TTVuVnBk?=
 =?utf-8?B?Q291ZFVHdGlTaTkzNGxKLzJ6U1doL0E2S2ZreW9UNUJRVnY3TGdoNEVmOEpO?=
 =?utf-8?B?d1lubTlPcjRaWCtnWis0Z3AyMXBIVHRib0YvaW9IUGpYbE9kQUduc2xrcHht?=
 =?utf-8?B?TDdnL1k4MURsajN2dDhHdDRiQXJQMzVZRVVzanJEVjZNRlpYUHdZWVJzM1dB?=
 =?utf-8?B?MDJGbVBGTXN0YjJBVCtJZFhYTWd0M3JXcDhXTi9RWFQ0ZXozd21KY2huMmFu?=
 =?utf-8?B?blg2c1F3am5nTWkxMnN4N1U2KzZHRnBHRk41ZjNmbFN4dHhZWERBRzRvL0J0?=
 =?utf-8?B?Q3BnUjhEM0VJYU1tcFVMNHRIeXNXSWN2TDlmVmY1MkpyNjZvME9RbVdQek5h?=
 =?utf-8?B?K0JrdDBNRkYzZmlJcmNFN2ZNd3E4NzZrb3BqTTJ2cUZ1ZG5EUG9Ma2VvVnkz?=
 =?utf-8?B?c3BUYzZSaVVYK3hoRDlIbjVkdFpYNDhjZkIxN296N2llejZldzQyMUlxQVR2?=
 =?utf-8?B?VmxJakZ2N3d2UmQ0bzFZb2RQU3Y1cjV2ZFlockRQSnQ3SWc2d1Rrd3B3RWlF?=
 =?utf-8?B?V1ByK2QxdVpuVUtIcnJIcVpuRnVXdFI0VWtpb3pYRk5ZZE5tRU13MVRQazRl?=
 =?utf-8?B?L2orSDlVdGhDM01VZklLU0NSQzhLcnF1eWFaYWtxZCtUUjFOa2piTEhwcHhy?=
 =?utf-8?B?b0VieEJIRlhjNWRtR2tsSmdTN01ZUVlFTURuQ2FOMEcxSERWbS9WM2I2RVlP?=
 =?utf-8?B?TjZmM2o2YWs1Q2ZEaHpQcUZjNzRzbnFyOXFwYnFwWCtnM296VmRhZUFDQUhM?=
 =?utf-8?B?K3AydVIxaFFvODZJd2htdjNBcFBjMVpHMFZ1dUU4U21BWURiYmhTbFh3L2NM?=
 =?utf-8?B?RDZpWjVZOCtiZ3phNlNKS3lZeTVKb3dQSGJReUN0VWpMbmdnb2Yzc0xHZlpK?=
 =?utf-8?B?YVRPTzRscXNyM1Mrbmw0N1o5UW5TUGp3SG1IMDN0S0NVVzcyRWl2MGxWOW1x?=
 =?utf-8?B?OGJVbnhHaGxpVVdnUkpTb3h3UytNSzdrY25LQlBZMlFPNTl3S0JGWmpQT2Jj?=
 =?utf-8?B?ZmNBc2VjdnRlUVljRmhmTXk2bmxxc2dzMFM4R3lSVEVMRFpHODBIV1hQZVlk?=
 =?utf-8?B?YlJ3UXI0UzlrenNxR2I4MXdmM3YyOTVhNXpwWVJ0QkNxWWl2OTZvUzNNbXNj?=
 =?utf-8?B?Qi81UlMxRXBaYzM2ZGx4ekhrQ0wvT3UzVUpEajZRbU1RUUNDM2Z1ZFJsWlBE?=
 =?utf-8?Q?ZSKZ+wRqO1KYQ8NqL/el0houo4Pq9x/ppwTWDQt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be6a9eb-8898-4897-f205-08d9171becf9
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 21:04:55.9942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8PVBQic9Nz5CpO2UVlniuw19mPTrYUh2HExhZoOCtqQzXyUPy6khfynKmC6+H9BXiFbEVxVkHvX3P0d4/5sLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0254
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
Cc: Deepak.Sharma@amd.com, Krunoslav.Kovac@amd.com, mcasas@google.com,
 Shashank.Sharma@amd.com, dri-devel@lists.freedesktop.org, Shirish.S@amd.com,
 Uma Shankar <uma.shankar@intel.com>, hersenxs.wu@amd.com,
 amd-gfx@lists.freedesktop.org, laurentiu.palcu@oss.nxp.com,
 Bhawanpreet.Lakha@amd.com, Nicholas.Kazlauskas@amd.com, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-04-30 8:53 p.m., Sebastian Wick wrote:
> On 2021-04-26 20:56, Harry Wentland wrote:
>> On 2021-04-26 2:07 p.m., Ville Syrjälä wrote:
>>> On Mon, Apr 26, 2021 at 01:38:50PM -0400, Harry Wentland wrote:
>>>> From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
>>>>
>>>> Add the following color encodings
>>>> - RGB versions for BT601, BT709, BT2020
>>>> - DCI-P3: Used for digital movies
>>>>
>>>> Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
>>>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/drm_color_mgmt.c | 4 ++++
>>>>   include/drm/drm_color_mgmt.h     | 4 ++++
>>>>   2 files changed, 8 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
>>>> index bb14f488c8f6..a183ebae2941 100644
>>>> --- a/drivers/gpu/drm/drm_color_mgmt.c
>>>> +++ b/drivers/gpu/drm/drm_color_mgmt.c
>>>> @@ -469,6 +469,10 @@ static const char * const color_encoding_name[] = {
>>>>       [DRM_COLOR_YCBCR_BT601] = "ITU-R BT.601 YCbCr",
>>>>       [DRM_COLOR_YCBCR_BT709] = "ITU-R BT.709 YCbCr",
>>>>       [DRM_COLOR_YCBCR_BT2020] = "ITU-R BT.2020 YCbCr",
>>>> +    [DRM_COLOR_RGB_BT601] = "ITU-R BT.601 RGB",
>>>> +    [DRM_COLOR_RGB_BT709] = "ITU-R BT.709 RGB",
>>>> +    [DRM_COLOR_RGB_BT2020] = "ITU-R BT.2020 RGB",
>>>> +    [DRM_COLOR_P3] = "DCI-P3",
>>>
>>> These are a totally different thing than the YCbCr stuff.
>>> The YCbCr stuff just specifies the YCbCr<->RGB converison matrix,
>>> whereas these are I guess supposed to specify the primaries/whitepoint?
>>> But without specifying what we're converting *to* these mean absolutely
>>> nothing. Ie. I don't think they belong in this property.
>>>
>>
>> If this is the intention I don't see it documented.
>>
>> I might have overlooked something but do we have a way to explicitly
>> specify today what *to* format the YCbCr color encodings convert into?
>> Would that be a combination of the output color encoding specified via
>> colorspace_property and the color space encoded in the primaries and
>> whitepoint of the hdr_output_metadata?
>>
>> Fundamentally I don't see how the use of this property differs,
>> whether you translate from YCbCr or from RGB. In either case you're
>> converting from the defined input color space and pixel format to an
>> output color space and pixel format.
>>
>>> The previous proposals around this topic have suggested a new
>>> property to specify a conversion matrix either explicitly, or
>>> via a separate enum (which would specify both the src and dst
>>> colorspaces). I've always argued the enum approach is needed
>>> anyway since not all hardware has a programmable matrix for
>>> this. But a fully programmable matrix could be nice for tone
>>> mapping purposes/etc, so we may want to make sure both are
>>> possible.
>>>
>>> As for the transfer func, the proposals so far have mostly just
>>> been to expose a programmable degamma/gamma LUTs for each plane.
>>> But considering how poor the current gamma uapi is we've thrown
>>> around some ideas how to allow the kernel to properly expose the
>>> hw capabilities. This is one of those ideas:
>>> https://lists.freedesktop.org/archives/dri-devel/2019-April/212886.html I think that basic idea could be also be extended to allow fixed
>>> curves in case the hw doesn't have a fully programmable LUT. But
>>> dunno if that's relevant for your hw.
>>>
>>
>> The problem with exposing gamma, whether per-plane or per-crtc, is
>> that it is hard to define an API that works for all the HW out there.
>> The capabilities for different HW differ a lot, not just between
>> vendors but also between generations of a vendor's HW.
> 
> Introducing another API if hardware is sufficiently different doesn't
> seem like the worst idea. At least it sounds a lot more tractable than
> teaching the kernel about all the different use cases, opinions and
> nuances that arise from color management.
> 
> In the end generic user space must always be able to fall back to
> software so the worst case is that it won't be able to offload an
> operation if it doesn't know about a new API.
> 
>> Another reason I'm proposing to define the color space (and gamma) of
>> a plane is to make this explicit. Up until the color space and gamma
>> of a plane or framebuffer are not well defined, which leads to drivers
>> assuming the color space and gamma of a buffer (for blending and other
>> purposes) and might lead to sub-optimal outcomes.
> 
> Blending only is "correct" with linear light so that property of the
> color space is important. However, why does the kernel have to be
> involved here? As long as user space knows that for correct blending the
> data must represent linear light and knows when in the pipeline blending
> happens it can make sure that the data at that point in the pipeline
> contains linear light.
> 

The only reason the kernel needs to be involved is to take full advantage
of the available HW without requiring KMS clients to be aware of
the difference in display HW.

Harry

> What other purposes are there?
> 
> In general I agree with the others that user space only wants a pipeline
> of transformations where the mechanism, the order and ideally the
> precision is defined.
> 
>> Harry
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx>
