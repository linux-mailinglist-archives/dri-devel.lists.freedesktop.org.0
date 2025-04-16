Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF940A8B492
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 10:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1859D10E89D;
	Wed, 16 Apr 2025 08:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vatXZo60";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DCC210E89D
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 08:59:54 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 870DA965;
 Wed, 16 Apr 2025 10:57:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1744793865;
 bh=IK9UyR16MCakiskdgLYvgLg+KiigxiyDPwyZXHoB2FA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=vatXZo60UrHedGeP6O9FWVxOQTiJDS6lAZMxI+nX/m/FwwmBdX30c4RD18ZKfL9eq
 qFK9BB8+D9D0x5If8AOC2EzAQQAKtp4vuA6cxsIbJBgZ5bDNfcUtqw1Q9AwgYNHqcj
 881aElHAa32eokWKJPUOX5p3ybFQ5tuBnK3S8I0U=
Message-ID: <73bd6628-374d-417f-a30f-88a4b1d157bb@ideasonboard.com>
Date: Wed, 16 Apr 2025 11:59:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/11] drm/fourcc: Add DRM_FORMAT_Y8
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Vishal Sagar <vishal.sagar@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
 <20250326-xilinx-formats-v4-3-322a300c6d72@ideasonboard.com>
 <CAMuHMdXM1B1c=62EpcuUdpdpaBRZSJLXb1GBB0egzp7Fyeo5-w@mail.gmail.com>
 <b195971c-52e6-463e-a440-83dde4346e65@ideasonboard.com>
 <20250327112009.6b4dc430@eldfell>
 <b5cf15a4-7c65-4718-9c39-a4c86179ba4c@ideasonboard.com>
 <20250327175842.130c0386@eldfell>
 <CAMuHMdVEpTVWmwrYt+G-QSWucT91goUcFor9qbo5rZ+X2jnRog@mail.gmail.com>
 <20250331105446.098f0fbe@eldfell>
 <20250331082135.GB13690@pendragon.ideasonboard.com>
 <20250331135337.61934003@eldfell> <20250401162732.731ef774@eldfell>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20250401162732.731ef774@eldfell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

On 01/04/2025 16:27, Pekka Paalanen wrote:
> On Mon, 31 Mar 2025 13:53:37 +0300
> Pekka Paalanen <pekka.paalanen@haloniitty.fi> wrote:
> 
>> On Mon, 31 Mar 2025 11:21:35 +0300
>> Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
>>
>>> On Mon, Mar 31, 2025 at 10:54:46AM +0300, Pekka Paalanen wrote:
>>>> On Thu, 27 Mar 2025 17:35:39 +0100
>>>> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>>>      
>>>>> Hi Pekka,
>>>>>
>>>>> On Thu, 27 Mar 2025 at 16:59, Pekka Paalanen
>>>>> <pekka.paalanen@haloniitty.fi> wrote:
>>>>>> On Thu, 27 Mar 2025 16:21:16 +0200
>>>>>> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:
>>>>>>> On 27/03/2025 11:20, Pekka Paalanen wrote:
>>>>>>>> On Wed, 26 Mar 2025 15:55:18 +0200
>>>>>>>> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:
>>>>>>>>> On 26/03/2025 15:52, Geert Uytterhoeven wrote:
>>>>>>>>>> On Wed, 26 Mar 2025 at 14:23, Tomi Valkeinen
>>>>>>>>>> <tomi.valkeinen@ideasonboard.com> wrote:
>>>>>>>>>>> Add greyscale Y8 format.
>>>>>>>>>>>
>>>>>>>>>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>>>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>>>>>>>>
>>>>>>>>>> Thanks for your patch!
>>>>>>>>>>       
>>>>>>>>>>> --- a/include/uapi/drm/drm_fourcc.h
>>>>>>>>>>> +++ b/include/uapi/drm/drm_fourcc.h
>>>>>>>>>>> @@ -405,6 +405,9 @@ extern "C" {
>>>>>>>>>>>     #define DRM_FORMAT_YUV444      fourcc_code('Y', 'U', '2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
>>>>>>>>>>>     #define DRM_FORMAT_YVU444      fourcc_code('Y', 'V', '2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
>>>>>>>>>>>
>>>>>>>>>>> +/* Greyscale formats */
>>>>>>>>>>> +
>>>>>>>>>>> +#define DRM_FORMAT_Y8          fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
>>>>>>>>>>
>>>>>>>>>> This format differs from e.g. DRM_FORMAT_R8, which encodes
>>>>>>>>>> the number of bits in the FOURCC format. What do you envision
>>>>>>>>>> for e.g. DRM_FORMAT_Y16? fourcc_code('G', 'R', '1', '6')?
>>>>>>>>>
>>>>>>>>> I wanted to use the same fourcc as on V4L2 side. Strictly speaking it's
>>>>>>>>> not required, but different fourccs for the same formats do confuse.
>>>>>>>>>
>>>>>>>>> So, generally speaking, I'd pick an existing fourcc from v4l2 side if
>>>>>>>>> possible, and if not, invent a new one.
>>>>>>>>
>>>>>>>> what's the actual difference between DRM_FORMAT_R8 and DRM_FORMAT_Y8?
>>>>>>>>
>>>>>>>> Is the difference that when R8 gets expanded to RGB, it becomes (R, 0,
>>>>>>>> 0), but Y8 gets expanded to (c1 * Y, c2 * Y, c3 * Y) where c1..c3 are
>>>>>>>> defined by MatrixCoefficients (H.273 terminology)?
>>>>>>>>
>>>>>>>> That would be my intuitive assumption following how YCbCr is handled.
>>>>>>>> Is it obvious enough, or should there be a comment to that effect?
>>>>>>>
>>>>>>> You raise an interesting point. Is it defined how a display driver, that
>>>>>>> supports R8 as a format, shows R8 on screen? I came into this in the
>>>>>>> context of grayscale formats, so I thought R8 would be handled as (R, R,
>>>>>>> R) in RGB. But you say (R, 0, 0), which... also makes sense.
>>>>>>
>>>>>> That is a good question too. I based my assumption on OpenGL behavior
>>>>>> of R8.
>>>>>>
>>>>>> Single channel displays do exist I believe, but being single-channel,
>>>>>> expansion on the other channels is likely meaningless. Hm, but for the
>>>>>> KMS color pipeline, it would be meaningful, like with a CTM.
>>>>>> Interesting.
>>>>>>
>>>>>> I don't know. Maybe Geert does?
>>>>>
>>>>> I did some digging, and was a bit surprised that it was you who told
>>>>> me to use R8 instead of Y8?
>>>>> https://lore.kernel.org/all/20220202111954.6ee9a10c@eldfell
>>>>
>>>> Hi Geert,
>>>>
>>>> indeed I did. I never thought of the question of expansion to R,G,B
>>>> before. Maybe that expansion is what spells R8 and Y8 apart?
>>>>
>>>> I do think that expansion needs to be specified, so that the KMS color
>>>> pipeline computations are defined. There is a big difference between
>>>> multiplying these with an arbitrary 3x3 matrix (e.g. CTM):
>>>>
>>>> - (R, 0, 0)
>>>> - (R, R, R)
>>>> - (c1 * Y, c2 * Y, c3 * Y)
>>>
>>> I'd be very surprised by an YUV to RGB conversion matrix where the first
>>> column would contain different values. What we need to take into account
>>> though is quantization (full vs. limited range).
> 
> Quantization range is indeed good to note. R8 would be always full
> range, but Y8 would follow COLOR_RANGE property.
> 
>> That makes Y8 produce (Y, Y, Y), and we have our answer: R8 should be
>> (R, 0, 0), so we have both variants.
>>
>> Can we specify Y, R, G and B be nominal values in the range 0.0 - 1.0
>> in the KMS color processing?
> 
> I think this 0.0 - 1.0 nominal range definition for the abstract KMS
> color processing is necessary.
> 
> It also means that limited range Y8 data, when containing values 0-15
> or 240-255, would produce negative and greater than 1.0 values,
> respectively. They might get immediately clamped to 0.0 - 1.0 with the
> first color operation they face, though, but the concept seems
> important and carrying over to the new color pipelines UAPI which might
> choose not to clamp.

Is the behavior of values outside the limited range something that needs 
to be defined? We can't know how each piece of HW behaves with 
"undefined" input, so should we not just define the behavior as platform 
specific?

In any case: I can't say I fully understood all the discussions wrt. 
color spaces. But my immediate interest is, of course, this series =). 
So is there something that you think should be improved here?

My understanding is that the Y-only pixel formats behave in a well 
defined way (or, as well defined as the YUV formats), and there's 
nothing more to add here. Is that right?

  Tomi

