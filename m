Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E48BC59917F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 01:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7DCF10E75E;
	Thu, 18 Aug 2022 23:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762E910E5F1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 23:51:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZZyYkEd9RS9DMuogdsXNXiHWbxNl/osP37KGRhDNob1WptUlpnCgFZ/VsqHojyEjSHhFN7YBlVZtvVgTtjyLT0KzwYbbUJanmO+X1/ZA4WqXpfk7EneXzLDjMGzVmxxTMaQNdoGyxhLFk/1O/QEIJ1M+gs+VD8mztuV6LbKi1/DyhDOzujmElvdfZlT//pBqVr1wJGEy6AE1+69MH5rG4BdqZ5lb5LT/4q/vNY/PHjPXw9NnKFBNx+xllycuBdvR4InDQUShjnm5XXDDOgk7TyUP6G0FRlRD0YpWT3xxD9IxQ8czQm++HuvkTaiB9YygCNlwBg6SgusmMPQmaJWgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppoabToR5LM01Dhd1mrdXujKFY/CqXcf3jeq9eSB2Fw=;
 b=NKNp30migI2Vo0NeBMzDMAwnJm76h4Np6yGFCvLW/kC2Qy5dCDM9GbyyWGjOHoSwprUCQ+M6lhKuc/D7oQ2xLSXWKTnjwMWWzK0n7Uk7OwjkzfEk4vUmVdLWLe/UdckZ6sNdTmXTnYpHyES0/2Lk4U7n7WRDjk/HJnw42OpNlibZJVgLC2MfFTwkP7oJvkSapJkAaVfU/jsZH/FGeLYvDg6tuxhKzc3ZzFjJ5ccj5L2S82Mr4XSUvggqKrjKykbSGmhipOCrUT8sOZnE5e64Km6o6vBmo6qVM9Lz7yRbWHInbzQgOo/hWig3OH2kqgLsRTJ/KS3KP4aOAP6CcNxcFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppoabToR5LM01Dhd1mrdXujKFY/CqXcf3jeq9eSB2Fw=;
 b=Be3s54ierORr4hmz2h3I+w+QV0xQHV6F35KWxmxhgNl3K2K7dQv2beWq+adz4f7bnHfwn1vU4ETjCwmR5Ygq5dEl87MRJxPMGyZdmAHEq4vzpnHbAERtalEw+3LRggTPDb2Y5YeKhxLwjI6WSGQGe0kqsHCtVEh+UBO5F9GQoxM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by SJ0PR03MB5744.namprd03.prod.outlook.com (2603:10b6:a03:2df::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 18 Aug
 2022 23:51:14 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::c832:eea0:1883:a19c]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::c832:eea0:1883:a19c%3]) with mapi id 15.20.5546.016; Thu, 18 Aug 2022
 23:51:14 +0000
Message-ID: <871126cc-a3ca-2009-8f1d-a8eb5852e033@synaptics.com>
Date: Fri, 19 Aug 2022 07:51:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] [WIP]: media: Add Synaptics compressed tiled format
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220808162750.828001-1-randy.li@synaptics.com>
 <20220808162750.828001-3-randy.li@synaptics.com>
 <CAAFQd5AKjpJ+fPAeCqdNnJbS4R7SdaHkfyW4qG1xXr-sE801pQ@mail.gmail.com>
 <13d37c15-79f3-4e16-8cf4-fc37846f4a04@synaptics.com>
 <Yv7HnHE7bLmgq5D0@pendragon.ideasonboard.com>
From: Hsia-Jun Li <Randy.Li@synaptics.com>
In-Reply-To: <Yv7HnHE7bLmgq5D0@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0184.namprd05.prod.outlook.com
 (2603:10b6:a03:330::9) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05d5ea7d-a164-498b-cbd6-08da81748953
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5744:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V6juqjWWXS37BqDtGTaQgsUFk3jhW2Tl6p17CMWnSxp/oSXRt5sTmoBq2SRrnhFxYu7jlKsarlMoQb/wY633FPvFE2zAyXyBvd3tOsCwmdVtGQJc8KSGRia5XVSZbRLmtuQp5CKnYbkXpabJGPOr3GgWaCpvxndBgH2h0Qmr9kcfJa86c/KsLFv5KXgJlqrwZ+hrUmIRekXic10Q+o7gR3PK99Hku9sf/iQ53p2glI6PLMKbwu11jrqlQNRbyHcHllWuWNwbwrmFfBCZpS/QH5ZcKO79x2fW7Uc4y/NxFA6d78cDnD/GAq3bykNPx3AgSCVk7C3HvjmJr2VYr0cLk+6cJidDVUBk9ehul1qfSkS03N69wMZXLo4iCT3Kp8iGFbns8N+6bQrESaW9Pauo1Y+dfWPSI1NGedhanGS22f1FGoO005+Bsb5AcEWFjml88DLkpY334cy/xK0YMZ2nPMfIe6mTHH7T09NNE1S9/knK8pj4pjrWUaiuGQtkztBknMqrvbVYenFWuSMZo3+nnLwOg19YtmauSvxXJQMvetPFGFz6Xgh4PX9ZqwcOK9ZNQkdq1cz/b2YfIWOyP7Hsn2XKf7K+9+mn+t4Pc+RDwpEwkcYe+0nXZtslNQ3HoyyoE9ttqJsZnbKPCnZhwBzWHPD9ePE3L/b3XvN9tGSSv5I4FgrhIhllm9KEu/VUdBSHZnOCP8SYusSQGg1svniNPUshsqox5LBV9n5SIMRTbXhmrhbyGgyCk+2VpMSprtAz9grR17gh0UQF6rixBVx+HAc7sTfXySLnLLN9hweNK4ejC4bqIOhF41i6TjtwKnWKG9U7IZtOc2CHREFFc1z2R/YmA+cAy+B65nkKzdIa/Ik=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(366004)(376002)(136003)(39860400002)(396003)(186003)(36756003)(7416002)(31686004)(31696002)(86362001)(316002)(2906002)(5660300002)(2616005)(83380400001)(8936002)(8676002)(4326008)(26005)(38350700002)(66556008)(966005)(6486002)(66476007)(6512007)(38100700002)(53546011)(66946007)(6506007)(52116002)(41300700001)(6666004)(6916009)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R21tSnYrM3FsekpIMzFmV1l6VmxST2NKU0Jwc2s0RDFkS1lvTzIvc2w4dWp0?=
 =?utf-8?B?a2xOSWY1YXllcEQ5N0VMWWNzM3BuSDB1NmF4NFl3WjJ1SWdQS3d2TU10M0FH?=
 =?utf-8?B?dWkxaXFrN3hiZWh0bWZFSzh1UUdMLzZoWTUvMHFNT1VjRC9YYU02M1Ywd1Vz?=
 =?utf-8?B?ZWRscFR3YmVSUVAxVlR2ZCtVbzVYZnRrYXlUNXhveUZNT3RsWTluZjFHcFB0?=
 =?utf-8?B?MTk1QmllSGg0UUJ5TktZNHFzVWF6djdaL2lkMkRQVUViOE5Bb3J0bmx5dzhJ?=
 =?utf-8?B?a3F2UDFNWUZYNzlOQVNrd0N4blJOajI2UlRMdEdaR1ZRanh2ZWxjVWpUQ3FZ?=
 =?utf-8?B?SFNWMGNncFNld2d5dlJqNmdRTU0wRlR5OXZLR3E1REVmeWRoaDdMMFowUk9h?=
 =?utf-8?B?dFd5SzNyaytuMHRpRzcvcTZlRFFrWmV3dGtrT21EYndLbmdqaG16dW9CWmtB?=
 =?utf-8?B?bHMyMldONzdOK0lJOGFQd3ZYR01PWGdFZmtXL3FDbnZTdFEwSXhOUzVmZUds?=
 =?utf-8?B?Z1ppNHp4SEd5WFFLUWMzeGEwRnA5aVJydy95ZGRNK2hLYWdGTHl4cXZWSUgx?=
 =?utf-8?B?ZlJtOXViLytEY1lQazlDd0ZvUm9tYmtUOG9hS0RFM1VSRkg4bGFsK0wxbWhk?=
 =?utf-8?B?YkZVK2dHM1pBcVZndHovWFpyaC9vaFVmS2Q4VHdPZk1PRjhRNG5ReHVYaWNh?=
 =?utf-8?B?K01lbGdhL2xYT1NVUDBuY0pydFJXL1dHd0RYZTRXMjRZTkZsdTh3OUlDd0U3?=
 =?utf-8?B?cXY1UGJkSlY2cm13L3NtMFdvQ0U3ZUQ0cXArcXA2dXB4SmhUU1FRTFRnQzZi?=
 =?utf-8?B?TEJpelM1NHZHR3NUb3dGSnRhRW9rZUNIb0hlQStKNE52M2l5OGU0VzdaL0dO?=
 =?utf-8?B?dGFSUW5nL0xFUnZ3VlZUaFBLTk5ZMEM1OXphNkV6c3RYWi9YMUVLbkFBeWd6?=
 =?utf-8?B?NDZkY1BrNzlQYWEwek8wRHZvazhEVGo3T2N5OTg2MUpORHY5UVBtS0VrMHRU?=
 =?utf-8?B?Rm5KdC94RCtaaTBVWTcwdG5oQXZ5dDIvbVNFdzIzdFE0YW03WndoUklsa0oy?=
 =?utf-8?B?ZE1ndGVlZlhWYkUvVHFVNnhlak1CcFd0V29Zcmk0cmhjUnNSOVl0VTN5eFcy?=
 =?utf-8?B?SWt5S2NtMFhVSFZndkIydlVQc2JobXpTRnROSFpPOVoxN2t4bVE3cURpVnZr?=
 =?utf-8?B?VEljL0VmOEU4dkV4TEVMYWdxK3JNVmtwVHhRTEw1dzd0Q1gyQlZ3dzFkRWo0?=
 =?utf-8?B?YThmYjdUNUtoMWJRcmV4M1paR2lTWDIwMEd4enVWRlc2RWpzMCtpdC9rWnFh?=
 =?utf-8?B?MVhrWDBROTM3VmZ0MTR0QmlhQmkvNHVObU9aNklMTHhZL21mNWtyeEdtYXM1?=
 =?utf-8?B?SitZWHJyekt4QVY2cGpLL05sUlp1b21mWXBKSU5WdlpLaHBVZmlNNlFZaTR1?=
 =?utf-8?B?VjZkN2cvZlJqUFZ3dDVSY05tQWpwSG1IcjB3S1pwNDFDa0dLaVR3cTI1TFg3?=
 =?utf-8?B?dCtFVmtUc2gvb3kwbklBNzVDMHJjbWJHMjFubUhkRG9EZFl0N0xFa2RGM0U3?=
 =?utf-8?B?bnZTdzRTY3Mvcm5MYkZiU3FQdHkxb1R5dXV5NTV5TkkyRmxKWWQ3U2tOWm9a?=
 =?utf-8?B?a1cvUmlCT0ErUmU5SjVMUzViSzAzNGVjMWlxakZwcnl2MUtWRFphVUhpWDlE?=
 =?utf-8?B?WnFZM2dqaEFGY21jS0FENGhqQ05naVJmdGhLOFNDdmFNZUtQU09PekZpTU1Y?=
 =?utf-8?B?NGcrY3dDN3ZmQ01MTStJaHk5ZVF6QWRLSE9LcnV0aHFXdTFJM0h2dWVKbEdS?=
 =?utf-8?B?bE42amprMEM2cGxQMEhvcDFIbDJYeFpveC9BWmRYaHJvL3hEUVRRdFhyczZi?=
 =?utf-8?B?RGtZNDVxR1h6djZ2QmRXVHdTdVdFRjdBSG1FMi94L1QzU1FJTHlxa0E3aWVM?=
 =?utf-8?B?ODdJSHBGUFc4RXZnQk82OUlDdXppZXZzVEwvQjhITFFrekl4YUxWWUQ3WStI?=
 =?utf-8?B?MUhOVjlaWXA1UWdhb3FpSTBHSVkvRkFBUlRlYi9GU2RsV2NDU0lkcEdSYUpL?=
 =?utf-8?B?N3g3VC9rcFlPUTZUcnYrcDYrZGRVbmdIRTl5VWFkaDZxcDBRV1NZdUJQK09t?=
 =?utf-8?Q?5F8ONErWuhNS5O35ni/dwSlqy?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d5ea7d-a164-498b-cbd6-08da81748953
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 23:51:14.7443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: evDWh7Z9KAAANG6NbOXOggInHAqQBkR0jr7jWoGa3cibmle6QN5ieFm38nMyPCbcPPP4ORJT6Ewk5f6h/XT4pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5744
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
Cc: linux-arm-kernel@lists.infradead.org, sebastian.hesselbarth@gmail.com,
 airlied@linux.ie, linux-kernel@vger.kernel.org, ribalda@chromium.org,
 linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
 jszhang@kernel.org, ezequiel@vanguardiasur.com.ar
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/19/22 07:13, Laurent Pinchart wrote:
> CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> On Thu, Aug 18, 2022 at 02:33:42PM +0800, Hsia-Jun Li wrote:
>> On 8/18/22 14:06, Tomasz Figa wrote:
>>> On Tue, Aug 9, 2022 at 1:28 AM Hsia-Jun Li <randy.li@synaptics.com> wrote:
>>>>
>>>> From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
>>>>
>>>> The most of detail has been written in the drm.
> 
> This patch still needs a description of the format, which should go to
> Documentation/userspace-api/media/v4l/.

I just want t tell people we need an extra plane for MVTP and I don't 
have enough space here to place all the pixel formats.

Besides, I was thinking a modifer in v4l2_ext_pix_format is not enough.
Let's take a compression NV12 tile format as an example, we need
1. luma planes
2. chroma planes
3. compression meta data for luma
4. compression meta data for chroma
5. mvtp
and a single data planer version would be
1. luma and chroma data
2. compression meta data
3. mvtp

You see, we actually have 3 kind of data here(not including the 
compression options that I am thinking of storing them somewhere else).
> 
>>>> Please notice that the tiled formats here request
>>>> one more plane for storing the motion vector metadata.
>>>> This buffer won't be compressed, so you can't append
>>>> it to luma or chroma plane.
>>>
>>> Does the motion vector buffer need to be exposed to userspace? Is the
>>> decoder stateless (requires userspace to specify the reference frames)
>>> or stateful (manages the entire decoding process internally)?
>>
>> No, users don't need to access them at all. Just they need a different
>> dma-heap.
>>
>> You would only get the stateful version of both encoder and decoder.
> 
> Shouldn't the motion vectors be stored in a separate V4L2 buffer,
> submitted through a different queue then ?
Yes, I like that.
Proposal: A third buffer type for the reconstruction buffers in V4L2 M2M 
encoder
https://www.spinics.net/lists/linux-media/msg214565.html

Although the major usage for the decoder here is producing the non-tile 
buffers, the decoder of us could product the NV12 or the pixel formats 
that GPU likes, but it must happen at the same time a frame is decoded.
Still the reference buffer or we call them the real decoded frame would 
stay in a tiled format. More than one queue would be need here.
> 
>>>> Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
>>>> ---
>>>>    drivers/media/v4l2-core/v4l2-common.c | 1 +
>>>>    drivers/media/v4l2-core/v4l2-ioctl.c  | 2 ++
>>>>    include/uapi/linux/videodev2.h        | 2 ++
>>>>    3 files changed, 5 insertions(+)
>>>>
>>>> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
>>>> index e0fbe6ba4b6c..f645278b3055 100644
>>>> --- a/drivers/media/v4l2-core/v4l2-common.c
>>>> +++ b/drivers/media/v4l2-core/v4l2-common.c
>>>> @@ -314,6 +314,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
>>>>                   { .format = V4L2_PIX_FMT_SGBRG12,       .pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
>>>>                   { .format = V4L2_PIX_FMT_SGRBG12,       .pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
>>>>                   { .format = V4L2_PIX_FMT_SRGGB12,       .pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
>>>> +               { .format = V4L2_PIX_FMT_NV12M_V4H1C, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 5, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2, .block_w = { 128, 128 }, .block_h = { 128, 128 } },
>>>>           };
>>>>           unsigned int i;
>>>>
>>>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>>>> index e6fd355a2e92..8f65964aff08 100644
>>>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>>>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>>>> @@ -1497,6 +1497,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>>>                   case V4L2_PIX_FMT_MT21C:        descr = "Mediatek Compressed Format"; break;
>>>>                   case V4L2_PIX_FMT_QC08C:        descr = "QCOM Compressed 8-bit Format"; break;
>>>>                   case V4L2_PIX_FMT_QC10C:        descr = "QCOM Compressed 10-bit Format"; break;
>>>> +               case V4L2_PIX_FMT_NV12M_V4H1C:  descr = "Synaptics Compressed 8-bit tiled Format";break;
>>>> +               case V4L2_PIX_FMT_NV12M_10_V4H3P8C:     descr = "Synaptics Compressed 10-bit tiled Format";break;
>>>>                   default:
>>>>                           if (fmt->description[0])
>>>>                                   return;
>>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>>>> index 01e630f2ec78..7e928cb69e7c 100644
>>>> --- a/include/uapi/linux/videodev2.h
>>>> +++ b/include/uapi/linux/videodev2.h
>>>> @@ -661,6 +661,8 @@ struct v4l2_pix_format {
>>>>    #define V4L2_PIX_FMT_NV12MT_16X16 v4l2_fourcc('V', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 16x16 tiles */
>>>>    #define V4L2_PIX_FMT_NV12M_8L128      v4l2_fourcc('N', 'A', '1', '2') /* Y/CbCr 4:2:0 8x128 tiles */
>>>>    #define V4L2_PIX_FMT_NV12M_10BE_8L128 v4l2_fourcc_be('N', 'T', '1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
>>>> +#define V4L2_PIX_FMT_NV12M_V4H1C v4l2_fourcc('S', 'Y', '1', '2')   /* 12  Y/CbCr 4:2:0 tiles */
>>>> +#define V4L2_PIX_FMT_NV12M_10_V4H3P8C v4l2_fourcc('S', 'Y', '1', '0')   /* 12  Y/CbCr 4:2:0 10-bits tiles */
>>>>
>>>>    /* Bayer formats - see https://urldefense.proofpoint.com/v2/url?u=http-3A__www.siliconimaging.com_RGB-2520Bayer.htm&d=DwIBaQ&c=7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=P4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=87M5Aa5fG3kdTTjlJrLIgv0E7O10QAj_4RqDlVsCAFdbfJzJ_P0s8wkBqaR0VBUO&s=8AsoiLPt9hQnn4ta51tT-RUXRLoKKYrePdAwtdvxuDo&e=   */
>>>>    #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8  BGBG.. GRGR.. */
> 
> --
> Regards,
> 
> Laurent Pinchart

-- 
Hsia-Jun(Randy) Li
