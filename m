Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C6F6C34C5
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 15:52:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F6510E1EB;
	Tue, 21 Mar 2023 14:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E363710E1EB
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 14:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=70/OM02lQCra3OnSiPxk9Khoao4iKy6odWQlLyOQNu4=; b=ZpcL6QEIcMhbm4WXXOwK+09043
 /v0WK/Bc4OVkq767sNF5M+jK/nT8vJVVZ1KXgQJywvRkOtHfMxZHbT+Ilm4+8wF64xTQqWZEhnrIq
 i6rkrHnHHZgRwR0VorFZjI614OOtDl/TS+ljL58uEc9Wbl+6owK9ytEgjAVcRKfmdBrRO7oC4JwtF
 KXy1I6W8jeplmj/XnTDulCnT1JZQu0NMdOaH9v/NqXjyKk/bQGohnHYuXJz3t42gYGiD4uf4ZJt1T
 rYj6cAJxS5GuzyX3JGM2ruYmOBrjZUuuFtxtoXx3/YbLF9iGtdv5SZNIVHYzlO+K0xa2/Bac+VvkZ
 BhtH+9jg==;
Received: from [2601:1c2:980:9ec0::21b4]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pedL9-00CoOf-2L; Tue, 21 Mar 2023 14:51:55 +0000
Message-ID: <6515b323-59ed-5524-846e-90782654259f@infradead.org>
Date: Tue, 21 Mar 2023 07:51:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 06/37] drm/vkms/vkms_composer: Fix a few different
 kerneldoc formatting
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-7-lee@kernel.org>
 <20230320234639.va6an7gton3u6eke@mail.igalia.com>
 <23fe0765-fb3b-9bf4-ecb4-507e6f3edefe@infradead.org>
 <20230321094940.ndf5nhvfr2y67d3x@mail.igalia.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230321094940.ndf5nhvfr2y67d3x@mail.igalia.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Melissa Wen <melissa.srw@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/21/23 02:49, Melissa Wen wrote:
> O 03/20, Randy Dunlap wrote:
>>
>>
>> On 3/20/23 16:46, Melissa Wen wrote:
>>> On 03/17, Lee Jones wrote:
>>>> Fixes the following W=1 kernel build warning(s):
>>>>
>>>>  drivers/gpu/drm/vkms/vkms_composer.c:41: warning: Function parameter or member 'frame_info' not described in 'pre_mul_alpha_blend'
>>>>  drivers/gpu/drm/vkms/vkms_composer.c:41: warning: Excess function parameter 'src_frame_info' description in 'pre_mul_alpha_blend'
>>>>  drivers/gpu/drm/vkms/vkms_composer.c:72: warning: Cannot understand  * @wb_frame_info: The writeback frame buffer metadata
>>>>
>>>> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
>>>> Cc: Melissa Wen <melissa.srw@gmail.com>
>>>> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>> Cc: David Airlie <airlied@gmail.com>
>>>> Cc: dri-devel@lists.freedesktop.org
>>>> Signed-off-by: Lee Jones <lee@kernel.org>
>>>> ---
>>>>  drivers/gpu/drm/vkms/vkms_composer.c | 6 ++++--
>>>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
>>>> index 8e53fa80742b2..41668eedf4272 100644
>>>> --- a/drivers/gpu/drm/vkms/vkms_composer.c
>>>> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
>>>> @@ -22,7 +22,7 @@ static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
>>>>  
>>>>  /**
>>>>   * pre_mul_alpha_blend - alpha blending equation
>>>> - * @src_frame_info: source framebuffer's metadata
>>>> + * @frame_info: source framebuffer's metadata
>>>>   * @stage_buffer: The line with the pixels from src_plane
>>>>   * @output_buffer: A line buffer that receives all the blends output
>>>>   *
>>>> @@ -69,11 +69,13 @@ static void fill_background(const struct pixel_argb_u16 *background_color,
>>>>  }
>>>>  
>>>>  /**
>>>> - * @wb_frame_info: The writeback frame buffer metadata
>>>> + * blend
>>> As we are already here:
>>> * blend - blend pixels from a given row and calculate crc
>>
>>  * blend: blend pixels from a given row and calculate CRC
>>
>> preferably.
> 
> Hmm.. I didn't get the colon suggestion. This first line is a brief
> description of the function blend(), so I understand that a more
> accurate doc standard is:
> 
> blend() - Blend pixels from a given row and calculate crc
> 

You are correct. My bad. Sorry for the noise.

> 
>>
>>> Reviewed-by: Melissa Wen <mwen@igalia.com>
>>>
>>>> + * @wb: The writeback frame buffer metadata
>>>>   * @crtc_state: The crtc state
>>>>   * @crc32: The crc output of the final frame
>>>>   * @output_buffer: A buffer of a row that will receive the result of the blend(s)
>>>>   * @stage_buffer: The line with the pixels from plane being blend to the output
>>>> + * @row_size: Size of memory taken up by row data (line_width * pixel_size)
>>>>   *
>>>>   * This function blends the pixels (Using the `pre_mul_alpha_blend`)
>>>>   * from all planes, calculates the crc32 of the output from the former step,
>>>> -- 
>>>> 2.40.0.rc1.284.g88254d51c5-goog
>>>>
>>
>> -- 
>> ~Randy

-- 
~Randy
