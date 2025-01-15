Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE689A12612
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 15:34:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D4F10E6F6;
	Wed, 15 Jan 2025 14:34:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QnVZ92kt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA9210E6F6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 14:34:15 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0EDDC526;
 Wed, 15 Jan 2025 15:33:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1736951595;
 bh=+BwkqpgMdP4nryge8XAwlr3ocnpSp93kPfK5dvvQhJ0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QnVZ92ktu9XV19uGghR+pXIGNZHKmpNfERPTx2PF0SFcdW2V4R70TgSYAhSJVQzgk
 ilP1mAtlbiYM18tY7IHgyLvryoIIAW2bhlY+EQurqMEtd/FPj/iEHsI2HATgodbh3a
 76PagALDfywQFrskQsb5P96lsmEx5hyKdm8Uh7BM=
Message-ID: <0004c685-b8c6-4df1-acb4-7c80a9d3255e@ideasonboard.com>
Date: Wed, 15 Jan 2025 16:34:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/10] drm/fourcc: Add DRM_FORMAT_Y10_LE32
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vishal Sagar <vishal.sagar@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
 <20250115-xilinx-formats-v2-4-160327ca652a@ideasonboard.com>
 <CAMuHMdXwsdP3_3b_OWFZ8J=kuNCga0h5Vo+wR0fdquQjZNuzEw@mail.gmail.com>
 <b7b8cdde-c189-4b9f-8423-c8ab4797b2f0@ideasonboard.com>
 <CAMuHMdVnDBt9QbR2bPdKHWgQ7i-OYYJ14ndc270z-hejY=bUdA@mail.gmail.com>
 <6b084e2c-100f-4563-8797-9fd6c862ed0c@ideasonboard.com>
 <CAMuHMdX8EeKnV8et81i3UdOexhO3Ry5TTKqp18OvCpJpWT2CtQ@mail.gmail.com>
 <0b0decd1-6f19-424a-84e5-fc71dceb983c@ideasonboard.com>
 <CAMuHMdXrdV4YRo1nMCVMTga=M+16GT8GkWe+Rk1DkgDZ=abGag@mail.gmail.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <CAMuHMdXrdV4YRo1nMCVMTga=M+16GT8GkWe+Rk1DkgDZ=abGag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 15/01/2025 16:08, Geert Uytterhoeven wrote:
> Hi Tomi,
> 
> On Wed, Jan 15, 2025 at 2:46 PM Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
>> On 15/01/2025 14:52, Geert Uytterhoeven wrote:
>>> On Wed, Jan 15, 2025 at 1:42 PM Tomi Valkeinen
>>> <tomi.valkeinen@ideasonboard.com> wrote:
>>>> On 15/01/2025 14:33, Geert Uytterhoeven wrote:
>>>>> On Wed, Jan 15, 2025 at 12:11 PM Tomi Valkeinen
>>>>> <tomi.valkeinen@ideasonboard.com> wrote:
>>>>>> On 15/01/2025 12:33, Geert Uytterhoeven wrote:
>>>>>>> On Wed, Jan 15, 2025 at 10:04 AM Tomi Valkeinen
>>>>>>> <tomi.valkeinen@ideasonboard.com> wrote:
>>>>>>>> Add Y10_LE32, a 10 bit greyscale format, with 3 pixels packed into
>>>>>>>> 32-bit container.
>>>>>>>>
>>>>>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>>>>>
>>>>>>> Thanks for your patch!
>>>>>>>
>>>>>>>> --- a/include/uapi/drm/drm_fourcc.h
>>>>>>>> +++ b/include/uapi/drm/drm_fourcc.h
>>>>>>>> @@ -408,6 +408,7 @@ extern "C" {
>>>>>>>>      /* Greyscale formats */
>>>>>>>>
>>>>>>>>      #define DRM_FORMAT_Y8          fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
>>>>>>>> +#define DRM_FORMAT_Y10_LE32    fourcc_code('Y', 'P', 'A', '4')  /* [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian */
>>>>>>>
>>>>>>> R10_LE32? Or R10_PA4?
>>>>>>
>>>>>> Can we discuss the "R" vs "Y" question under the cover letter? There's
>>>>>> some more context about it in there.
>>>>>
>>>>> Sorry, hadn't read the cover letter. I got attracted by "Y8" and "Y10".
>>>>>
>>>>>> I took the "LE32" from Gstreamer's format. Maybe it's a bit pointless.
>>>>>>
>>>>>> I don't know if it makes sense to add the fourcc to the DRM format name.
>>>>>> The fourcc is very limited. Rather, we could, say, have
>>>>>> DRM_FORMAT_Y10_PACKED_32 (or "R", if you insist =).
>>>>>>
>>>>>>> Does LE32 have a meaning?  My first guess just reading the subject
>>>>>>> was wrong ("little endian  32-bit" ;-)
>>>>>>
>>>>>> I'm not sure I follow. It's little-endian. The pixel group/unit is a
>>>>>> 32-bit number, where the leftmost pixel on the screen is in bits 9-0,
>>>>>> and the padding is in bits 31-30, and stored in memory as little-endian.
>>>>>
>>>>> Ah, the "LE" applies to the pixels inside each word.
>>>>
>>>> No, to the 32-bit container.
>>>>
>>>>> DRM formats stored in memory are always little-endian, unless the
>>>>> DRM_FORMAT_BIG_ENDIAN bit is set, which is what I was hinting
>>>>> at...
>>>>
>>>> Indeed you're right. The "LE" is pointless. So back to the bike-shedding
>>>> about the name =).
>>>
>>> As the order inside the container is Y2:Y1:Y0, it _is_ little endian.
>>> Cfr.
>>>
>>> #define DRM_FORMAT_YUYV  fourcc_code('Y', 'U', 'Y', 'V') /* [31:0]
>>> Cr0:Y1:Cb0:Y0 8:8:8:8 little endian */
>>
>> Hmm, I see. I hadn't thought LE in that context, but I think it makes
>> sense when there are multiple pixels in one container. So the "little
>> endian" above would refer to the order of Y1 and Y0. So is Y1 the
>> least-significant-pixel? =)
> 
> No, Y0 is the least-significant member of the container, which
> corresponds to the first pixel ("little end first").

In the number 0x1234, 0x34 is the least-significant byte, and stored 
first in memory in little endian.

So, similarly, with Y0:Y1, Y1 is stored first in little-endian order, so 
it's the least-significant-pixel =).

>> But, say, in
>>
>> #define DRM_FORMAT_RG88         fourcc_code('R', 'G', '8', '8') /* [15:0] R:G
>> 8:8 little endian */
>>
>> the "little endian" refers to the 16-bit value itself? Which is not
>> necessary, as the default assumption is little endian.
> 
> I think so.
> 
>> In any case, when considering your latest point... "LE" in the name
>> makes sense? But with a quick look I didn't find any formats that would
>> have "big endian pixel order", so maybe we can just assume little endian
>> pixel order too.
> 
> [CDR][124] have. See the descriptions of the commits that introduced
> them for the rationale behind this:
> 
> b92db7e4fe740daa drm/fourcc: Add DRM_FORMAT_D[1248]
> d093100b425df6fe drm/fourcc: Add DRM_FORMAT_R[124]
> e5bd7e3e4a68f0be drm/fourcc: Add DRM_FORMAT_C[124]

Ah, I see. But they don't call the pixel ordering "big endian".

Well, this is all somewhat beside the point. So is "_Y10_32" (or 
"_R10_32" if we use R) fine?

  Tomi

