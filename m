Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 841E46C2634
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 01:09:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836B610E683;
	Tue, 21 Mar 2023 00:09:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAB910E094
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 00:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=buOs6OTUuEh7yaWqQoZ4zABNIq5hoZjF+8q53WL+W5E=; b=FdeHr1QXM0GCrTnqSVS4Rny0dO
 OkQgHiLV/nkkb95GONnrCn8ixzwAR2rpeN/wWbAu8FqFR+WHGACkf1XVmVt1G1WDVryZV0msmgz0b
 o+J24oMCaWQXxkZpCPaf1vUGTSH7o4IXvM5/tiJX2lE9BhxWthQmnrwFDdsRS41jWA03GXfH/ui4t
 QOYtZ3Pvq4A30dSzJg9SZnQML2t2fKRgAF6T7duBipKdkBCI6D4QLLsmdif3/FiR2Y8i+kLx8k73P
 Yk924E3+cSvgB7MqtFwF4nJqlIzSSRvBzlHFaeMHIEDW4izcZC10KRVOtEo2yn7SA+Ob0j0Wq96um
 IHzT3Chg==;
Received: from [2601:1c2:980:9ec0::21b4]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pePYq-00ArLi-2m; Tue, 21 Mar 2023 00:09:08 +0000
Message-ID: <23fe0765-fb3b-9bf4-ecb4-507e6f3edefe@infradead.org>
Date: Mon, 20 Mar 2023 17:09:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 06/37] drm/vkms/vkms_composer: Fix a few different
 kerneldoc formatting
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, Lee Jones <lee@kernel.org>
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-7-lee@kernel.org>
 <20230320234639.va6an7gton3u6eke@mail.igalia.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230320234639.va6an7gton3u6eke@mail.igalia.com>
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
Cc: Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/20/23 16:46, Melissa Wen wrote:
> On 03/17, Lee Jones wrote:
>> Fixes the following W=1 kernel build warning(s):
>>
>>  drivers/gpu/drm/vkms/vkms_composer.c:41: warning: Function parameter or member 'frame_info' not described in 'pre_mul_alpha_blend'
>>  drivers/gpu/drm/vkms/vkms_composer.c:41: warning: Excess function parameter 'src_frame_info' description in 'pre_mul_alpha_blend'
>>  drivers/gpu/drm/vkms/vkms_composer.c:72: warning: Cannot understand  * @wb_frame_info: The writeback frame buffer metadata
>>
>> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
>> Cc: Melissa Wen <melissa.srw@gmail.com>
>> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Signed-off-by: Lee Jones <lee@kernel.org>
>> ---
>>  drivers/gpu/drm/vkms/vkms_composer.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
>> index 8e53fa80742b2..41668eedf4272 100644
>> --- a/drivers/gpu/drm/vkms/vkms_composer.c
>> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
>> @@ -22,7 +22,7 @@ static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
>>  
>>  /**
>>   * pre_mul_alpha_blend - alpha blending equation
>> - * @src_frame_info: source framebuffer's metadata
>> + * @frame_info: source framebuffer's metadata
>>   * @stage_buffer: The line with the pixels from src_plane
>>   * @output_buffer: A line buffer that receives all the blends output
>>   *
>> @@ -69,11 +69,13 @@ static void fill_background(const struct pixel_argb_u16 *background_color,
>>  }
>>  
>>  /**
>> - * @wb_frame_info: The writeback frame buffer metadata
>> + * blend
> As we are already here:
> * blend - blend pixels from a given row and calculate crc

 * blend: blend pixels from a given row and calculate CRC

preferably.

> Reviewed-by: Melissa Wen <mwen@igalia.com>
> 
>> + * @wb: The writeback frame buffer metadata
>>   * @crtc_state: The crtc state
>>   * @crc32: The crc output of the final frame
>>   * @output_buffer: A buffer of a row that will receive the result of the blend(s)
>>   * @stage_buffer: The line with the pixels from plane being blend to the output
>> + * @row_size: Size of memory taken up by row data (line_width * pixel_size)
>>   *
>>   * This function blends the pixels (Using the `pre_mul_alpha_blend`)
>>   * from all planes, calculates the crc32 of the output from the former step,
>> -- 
>> 2.40.0.rc1.284.g88254d51c5-goog
>>

-- 
~Randy
