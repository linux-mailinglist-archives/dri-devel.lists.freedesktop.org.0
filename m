Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C821E65F6
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 17:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D4E6E056;
	Thu, 28 May 2020 15:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from o1.b.az.sendgrid.net (o1.b.az.sendgrid.net [208.117.55.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512C06E056
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 15:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=subject:references:from:mime-version:in-reply-to:to:cc:content-type:
 content-transfer-encoding;
 s=001; bh=92AGQN5/bRtzZfPe8oh1eJF6xFdOuqjV2jK6QKPj6pE=;
 b=phURtwYpdSawMPQzAn+ZLaSPcCM/mydiJxO+dsAW7Ki419mjxE005EoU1M6Cbp5R9BY9
 1UnKfx/s1jDtf6NrQQIO55lDefNaroisAxXivmbotzNqa58kXt+xMEXF6Uew3JVe3NXD8b
 Ug7zRoGG1OYoGWpx1zJyQfEt5y1//0XnA=
Received: by filter0135p3las1.sendgrid.net with SMTP id
 filter0135p3las1-26609-5ECFD806-B5
 2020-05-28 15:25:58.572244465 +0000 UTC m=+1101791.271200318
Received: from [192.168.1.14] (unknown)
 by ismtpd0008p1lon1.sendgrid.net (SG) with ESMTP
 id jI7-hHPzSBizNIWHMMZAWw Thu, 28 May 2020 15:25:58.181 +0000 (UTC)
Subject: Re: [PATCH] drm: drm_fourcc: add NV15, Q410, Q401 YUV formats
References: <20200422111349.1632-1-ben.davis@arm.com>
 <20200506144126.GB13535@arm.com>
 <20200515133712.l5vaxnye3qypkah2@DESKTOP-E1NTVVP.localdomain>
 <504d071a-50c8-2bb9-c9e1-2cbe65ba6380@kwiboo.se>
 <20200526135219.eu32pqvxfocmoovk@DESKTOP-E1NTVVP.localdomain>
From: Jonas Karlman <jonas@kwiboo.se>
Message-ID: <ded31868-dfcf-ed2f-54fe-add72aabf9e6@kwiboo.se>
Date: Thu, 28 May 2020 15:25:58 +0000 (UTC)
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200526135219.eu32pqvxfocmoovk@DESKTOP-E1NTVVP.localdomain>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h3PBXL47aMM5jE3rP?=
 =?us-ascii?Q?o5eXuLNrMazPxW9OPurwaXejyc9S1vuwrxP=2FH=2Fd?=
 =?us-ascii?Q?bN8Iz1HoZO1xC4F2IK7vQ5wwA9rillFEW01c7Rv?=
 =?us-ascii?Q?xUd1piR1BKQPnar4+DNkFV5Kkag=2FVEiPnYUV1Na?=
 =?us-ascii?Q?+AZDA7=2F09z9z3AxPsp4Sd8UI6Kpm4i4yKIjCcO?=
To: Brian Starkey <brian.starkey@arm.com>
Content-Language: sv
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
Cc: airlied@linux.ie, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, nd@arm.com, matteo.franchin@arm.com,
 Ben Davis <ben.davis@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Brian,

On 2020-05-26 15:52, Brian Starkey wrote:
> Hi Jonas,
> 
> On Mon, May 25, 2020 at 11:08:11AM +0000, Jonas Karlman wrote:
>> Hi,
>>
>> On 2020-05-15 15:37, Brian Starkey wrote:
>>> Hi Ben,
>>>
>>> On Wed, May 06, 2020 at 03:41:26PM +0100, Ben Davis wrote:
>>>> Hi all, any feedback on this patch?
>>>> Thanks, Ben
>>>> On Wed, Apr 22, 2020 at 12:13:49PM +0100, Ben Davis wrote:
>>>>> DRM_FORMAT_NV15 is a 2 plane format suitable for linear and 16x16
>>>>> block-linear memory layouts. The format is similar to P010 with 4:2:0
>>>>> sub-sampling but has no padding between components. Instead, luminance
>>>>> and chrominance samples are grouped into 4s so that each group is packed
>>>>> into an integer number of bytes:
>>>>>
>>>>> YYYY = UVUV = 4 * 10 bits = 40 bits = 5 bytes
>>>>>
>>>>> The '15' suffix refers to the optimum effective bits per pixel which is
>>>>> achieved when the total number of luminance samples is a multiple of 8.
>>>>>
>>>>> Q410 and Q401 are both 3 plane non-subsampled formats with 16 bits per
>>>>> component, but only 10 bits are used and 6 are padded. 'Q' is chosen
>>>>> as the first letter to denote 3 plane YUV444, (and is the next letter
>>>>> along from P which is usually 2 plane).
>>>>>
>>>>> Signed-off-by: Ben Davis <ben.davis@arm.com>
>>>
>>> The descriptions match my understanding of the formats and the
>>> format_info struct, so feel free to add my r-b:
>>>
>>> Reviewed-by: Brian Starkey <brian.starkey@arm.com>
>>>
>>> Can anyone else pass comment on the approach and/or naming? I feel
>>> like we should have some non-Arm eyes on this before we merge it.
>>
>> This pixel format seem to match the memory layout used for 10-bit 4:2:0 by the
>> Rockchip Video Decoder, for the rkvdec a 4:2:2 format is also needed (maybe NV20?).
>>
>> From what I can tell the rockchip specific pixel format has previously been submitted in [1]
>> and GStreamer use NV12_10LE40 (fourcc RK20) for this pixel format.
>>
>> [1] https://patchwork.freedesktop.org/patch/276029/
>>
> 
> Yeah you're right, this is the same as the Rockchip version. I see
> Randy's submission has `block_w = { 4, 2, 0 }`... more on that below.
> 
> The comment on block_w says "in pixels" - but what's a pixel in a
> subsampled chroma plane? For a 2-plane 4:2:0 format, is one pair of
> chroma samples a single pixel, or one pair of chroma samples is two
> pixels?
> 
> Looks like Randy assumed the former and us the latter.
> 
>>>
>>> Thanks,
>>> -Brian
>>>
>>>>> ---
>>>>>  drivers/gpu/drm/drm_fourcc.c  | 12 ++++++++++++
>>>>>  include/uapi/drm/drm_fourcc.h | 24 ++++++++++++++++++++++++
>>>>>  2 files changed, 36 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
>>>>> index b234bfaeda06..0c0a65481afd 100644
>>>>> --- a/drivers/gpu/drm/drm_fourcc.c
>>>>> +++ b/drivers/gpu/drm/drm_fourcc.c
>>>>> @@ -274,6 +274,18 @@ const struct drm_format_info *__drm_format_info(u32 format)
>>>>>  		{ .format = DRM_FORMAT_YUV420_10BIT,    .depth = 0,
>>>>>  		  .num_planes = 1, .cpp = { 0, 0, 0 }, .hsub = 2, .vsub = 2,
>>>>>  		  .is_yuv = true },
>>>>> +		{ .format = DRM_FORMAT_NV15,		.depth = 0,
>>>>> +		  .num_planes = 2, .char_per_block = { 5, 5, 0 },
>>>>> +		  .block_w = { 4, 4, 0 }, .block_h = { 1, 1, 0 }, .hsub = 2,
>>>>> +		  .vsub = 2, .is_yuv = true },
>>
>> For a 4:2:0 format I wonder if the char_per_block value is correct for the second plane,
>> using the following formula to calculate the pitch seem to result in only half expected width.
>> Maybe .char_per_block { 5, 10, 0 } could be correct?
>>
>> pitch = (width * char_per_block[1]) / block_w[1] / hsub
>>
>> for 16x16 this would be
>>
>> pitch[1] = (16 * 5) / 4 / 2 = 10 bytes
>> vs
>> pitch[1] = (16 * 10) / 4 / 2 = 20 bytes
>>
>> height[1] = 16 / 2 = 8
>>
> 
> I've talked myself round in circles, I don't know what to think any
> more.
> 
> drm_format_info_min_pitch() does:
> 
> pitch[1] = width * char_per_block[1] / (block_w[1] * block_h[1])
> 
> so:
> 
> pitch[1] = 16 * 5 / (4 * 1) = 20 bytes
> 
> which implies that it expects the subsampling to be baked in to the
> block size, or that it just doesn't consider subsampling and so is
> broken, or that it expects `width` to be pre-divided.
> 
> 
> Looking at DRM_FORMAT_NV12, it has cpp = {1, 2, 0}, which means it
> considers a single pair of chromas to be a single pixel - which is
> in-line with Randy.
> 
> So, I think our definition is inconsistent here. We should have
> either:
> 
> block_w = { 4, 4, 0 }, char_per_block = { 5, 10, 0 }
> 
> or: 
> 
> block_w = { 4, 2, 0 }, char_per_block = { 5, 5, 0 }
> 
> Probably leaning more towards the { 4, 2, 0 } option, and with a big
> question-mark over whether drm_format_info_min_pitch() is doing the
> right thing.

After reading your comments I can agree that block_w = { 4, 2, 0 }
do sound like the better option.

I also made a successful runtime test using block_w = { 4, 2, 0 } in my
development branch for Rockchip Video Decoder at [1],
10-bit video is decoded using NV15 format and renders without problems,
see below for partial /sys/kernel/debug/dri/0/state output of NV15/NV12.

So for NV15 parts with the change to block_w = { 4, 2, 0 },

Tested-by: Jonas Karlman <jonas@kwiboo.se>

---
plane[36]: plane-2
        crtc=crtc-1
        fb=52
                allocated by = kodi.bin
                refcount=2
                format=NV15 little-endian (0x3531564e)
                modifier=0x0
                size=1920x1080
                layers:
                        size[0]=1920x1080
                        pitch[0]=2400
                        offset[0]=0
                        obj[0]:
                                name=0
                                refcount=3
                                start=00000000
                                size=4964352
                                imported=yes
                        size[1]=960x540
                        pitch[1]=2400
                        offset[1]=2611200
                        obj[1]:
                                name=0
                                refcount=3
                                start=00000000
                                size=4964352
                                imported=yes
        crtc-pos=1920x1080+0+0
        src-pos=1920.000000x1080.000000+0.000000+0.000000
---
plane[36]: plane-2
        crtc=crtc-1
        fb=52
                allocated by = kodi.bin
                refcount=2
                format=NV12 little-endian (0x3231564e)
                modifier=0x0
                size=1920x1080
                layers:
                        size[0]=1920x1080
                        pitch[0]=1920
                        offset[0]=0
                        obj[0]:
                                name=0
                                refcount=3
                                start=00000000
                                size=4177920
                                imported=yes
                        size[1]=960x540
                        pitch[1]=1920
                        offset[1]=2088960
                        obj[1]:
                                name=0
                                refcount=3
                                start=00000000
                                size=4177920
                                imported=yes
        crtc-pos=1920x1080+0+0
        src-pos=1920.000000x1080.000000+0.000000+0.000000
---

[1] https://github.com/Kwiboo/linux-rockchip/commits/linuxtv-rkvdec-work-in-progress

Regards,
Jonas

> 
> Thanks,
> -Brian
> 
>>
>> Regards,
>> Jonas
>>
>>>>> +		{ .format = DRM_FORMAT_Q410,		.depth = 0,
>>>>> +		  .num_planes = 3, .char_per_block = { 2, 2, 2 },
>>>>> +		  .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 }, .hsub = 0,
>>>>> +		  .vsub = 0, .is_yuv = true },
>>>>> +		{ .format = DRM_FORMAT_Q401,		.depth = 0,
>>>>> +		  .num_planes = 3, .char_per_block = { 2, 2, 2 },
>>>>> +		  .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 }, .hsub = 0,
>>>>> +		  .vsub = 0, .is_yuv = true },
>>>>>  	};
>>>>>  
>>>>>  	unsigned int i;
>>>>> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
>>>>> index 8bc0b31597d8..232b9ad3534d 100644
>>>>> --- a/include/uapi/drm/drm_fourcc.h
>>>>> +++ b/include/uapi/drm/drm_fourcc.h
>>>>> @@ -236,6 +236,12 @@ extern "C" {
>>>>>  #define DRM_FORMAT_NV61		fourcc_code('N', 'V', '6', '1') /* 2x1 subsampled Cb:Cr plane */
>>>>>  #define DRM_FORMAT_NV24		fourcc_code('N', 'V', '2', '4') /* non-subsampled Cr:Cb plane */
>>>>>  #define DRM_FORMAT_NV42		fourcc_code('N', 'V', '4', '2') /* non-subsampled Cb:Cr plane */
>>>>> +/*
>>>>> + * 2 plane YCbCr
>>>>> + * index 0 = Y plane, [39:0] Y3:Y2:Y1:Y0 little endian
>>>>> + * index 1 = Cr:Cb plane, [39:0] Cr1:Cb1:Cr0:Cb0 little endian
>>>>> + */
>>>>> +#define DRM_FORMAT_NV15		fourcc_code('N', 'V', '1', '5') /* 2x2 subsampled Cr:Cb plane */
>>>>>  
>>>>>  /*
>>>>>   * 2 plane YCbCr MSB aligned
>>>>> @@ -265,6 +271,24 @@ extern "C" {
>>>>>   */
>>>>>  #define DRM_FORMAT_P016		fourcc_code('P', '0', '1', '6') /* 2x2 subsampled Cr:Cb plane 16 bits per channel */
>>>>>  
>>>>> +
>>>>> +/* 3 plane non-subsampled (444) YCbCr
>>>>> + * 16 bits per component, but only 10 bits are used and 6 bits are padded
>>>>> + * index 0: Y plane, [15:0] Y:x [10:6] little endian
>>>>> + * index 1: Cb plane, [15:0] Cb:x [10:6] little endian
>>>>> + * index 2: Cr plane, [15:0] Cr:x [10:6] little endian
>>>>> + */
>>>>> +#define DRM_FORMAT_Q410		fourcc_code('Q', '4', '1', '0')
>>>>> +
>>>>> +/* 3 plane non-subsampled (444) YCrCb
>>>>> + * 16 bits per component, but only 10 bits are used and 6 bits are padded
>>>>> + * index 0: Y plane, [15:0] Y:x [10:6] little endian
>>>>> + * index 1: Cr plane, [15:0] Cr:x [10:6] little endian
>>>>> + * index 2: Cb plane, [15:0] Cb:x [10:6] little endian
>>>>> + */
>>>>> +#define DRM_FORMAT_Q401		fourcc_code('Q', '4', '0', '1')
>>>>> +
>>>>> +
>>>>>  /*
>>>>>   * 3 plane YCbCr
>>>>>   * index 0: Y plane, [7:0] Y
>>>>> -- 
>>>>> 2.24.0
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
