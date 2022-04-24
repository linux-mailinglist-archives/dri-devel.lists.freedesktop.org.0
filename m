Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5E650CE28
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 02:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BFD10E057;
	Sun, 24 Apr 2022 00:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7764410E057
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 00:41:32 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id r85so13266923oie.7
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 17:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rAfwfJkl5XIIcjTF5/Tdaj3yr5sYl9vDcpgq2WRz8fg=;
 b=EnPi/La40XVrhTuOhyJlG2fbw7UaoQpiPV+lrc+7TvnYH0pGXN/W7FDt07JTfMBzNN
 +QE0eRrtjHuc/m03gcbd+vSv5fRW+yfXwFd25JVXIwRvCQ23M/YATRVSglFhEH6AmxLD
 dqqv4+Ehxq2N4I+hLgoBut06JjZNpM1ymIDMRB5A9HF9VSDAsyJtQGrvD9LRAyuWhi/a
 0VwLEnF9PTY+XpY2QRe+0Ozgn8W2uqo5Hd81GWXyBIZ4wuKhS/+gusLwvRzGyz3UfUL9
 Ymu9lpmKr1iB+zeLLIIsZTlT7xs/5vr/E7MKT7J7qDWSAIETLcHMVSv2SwhbO6MjlHum
 cpdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rAfwfJkl5XIIcjTF5/Tdaj3yr5sYl9vDcpgq2WRz8fg=;
 b=uohGdMXZQARHfnXQMwDpSNaGrScZQ/v4ihHYPWM0kvBaBkYgT9lTRmltpcchkcgUoR
 OQ1OCzLl6GNytC5FRLkEb7QzsjjmmhKcbAGZQZUa7nkgKLgMhYaAJsP9e9Q3uVkrc7nf
 iop1FxvUgYFRPsP0UTwroFyFqA0ipsa5OQkcuvXJseUYBLR69Zoa3LAn0m4dVqbrbIdH
 hzm3jiQRubDNmo42YPpj+n47IZn6Gsvb+BFsGEJS8kP115x+T0ryvRx2j48Lu3xNxkW1
 lyY8Z0v6hnzdeYo7v9VRBGta1otdsJHO0ArEdUIKfh9PgzEXdW/ikGI0pogOZ4HP1w3M
 zg6g==
X-Gm-Message-State: AOAM532sHvBLrsDt5ANj8G9/+AWITv1sum/MhUSjYVKnzncj9lAFJZhD
 si1TpKKW83Dr8PdeHGwSqNZl/ywjdUk=
X-Google-Smtp-Source: ABdhPJzm2SYBrKspt1Xj0bjryDimHcUdKCc6wZNHd9M25koTaEgLl4TbhWPkVo5rzL3dAcos74IVRg==
X-Received: by 2002:a05:6808:1805:b0:323:a81:bdff with SMTP id
 bh5-20020a056808180500b003230a81bdffmr5321641oib.7.1650760891636; 
 Sat, 23 Apr 2022 17:41:31 -0700 (PDT)
Received: from ?IPV6:2804:431:c7f5:7532:da7c:53df:9a5f:fa64?
 ([2804:431:c7f5:7532:da7c:53df:9a5f:fa64])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a4ad1d5000000b0033a2d95915asm2603423oos.14.2022.04.23.17.41.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 17:41:31 -0700 (PDT)
Message-ID: <800bd737-b5ac-d3c3-5871-b8311dce529a@gmail.com>
Date: Sat, 23 Apr 2022 21:41:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 7/9] drm: vkms: Supports to the case where primary
 plane doesn't match the CRTC
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
 <20220404204515.42144-8-igormtorrente@gmail.com>
 <20220420161305.5802a678@eldfell>
From: Igor Torrente <igormtorrente@gmail.com>
In-Reply-To: <20220420161305.5802a678@eldfell>
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
Cc: hamohammed.sa@gmail.com, tzimmermann@suse.de, rodrigosiqueiramelo@gmail.com,
 airlied@linux.ie, leandro.ribeiro@collabora.com, melissa.srw@gmail.com,
 dri-devel@lists.freedesktop.org, tales.aparecida@gmail.com,
 ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pekka,

On 4/20/22 10:13, Pekka Paalanen wrote:
> On Mon,  4 Apr 2022 17:45:13 -0300
> Igor Torrente <igormtorrente@gmail.com> wrote:
> 
>> We will break the current assumption that the primary plane has the
> 
> Hi,
> 
> I'd say "remove" rather than "break". Breaking sounds bad but this is
> good. :-)

Yeah, sure. :)

> 
>> same size and position as CRTC.
> 
> ...and that the primary plane is the bottom-most in zpos order, or is
> even enabled. At least as far as the blending machinery is concerned.
> 
>>
>> For that we will add CRTC dimension information to `vkms_crtc_state`
>> and add a opaque black backgound color.
>>
>> Because now we need to fill the background, we had a loss in
>> performance with this change. Results running the IGT[1] test
>> `igt@kms_cursor_crc@pipe-a-cursor-512x512-onscreen` ten times:
>>
>> |                  Frametime                   |
>> |:--------------------------------------------:|
>> |  Implementation |  Previous |   This commit  |
>> |:---------------:|:---------:|:--------------:|
>> | frametime range |  5~18 ms  |     10~22 ms   |
>> |     Average     |  8.47 ms  |     12.32 ms   |
>>
>> [1] IGT commit id: bc3f6833a12221a46659535dac06ebb312490eb4
>>
>> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
>> ---
>>   Documentation/gpu/vkms.rst           |  3 +--
>>   drivers/gpu/drm/vkms/vkms_composer.c | 32 +++++++++++++++++++---------
>>   drivers/gpu/drm/vkms/vkms_crtc.c     |  4 ++++
>>   drivers/gpu/drm/vkms/vkms_drv.h      |  2 ++
>>   4 files changed, 29 insertions(+), 12 deletions(-)
>>
>> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
>> index a49e4ae92653..49db221c0f52 100644
>> --- a/Documentation/gpu/vkms.rst
>> +++ b/Documentation/gpu/vkms.rst
>> @@ -121,8 +121,7 @@ There's lots of plane features we could add support for:
>>   - ARGB format on primary plane: blend the primary plane into background with
>>     translucent alpha.
>>   
>> -- Support when the primary plane isn't exactly matching the output size: blend
>> -  the primary plane into the black background.
>> +- Add background color KMS property[Good to get started].
>>   
>>   - Full alpha blending on all planes.
>>   
>> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
>> index cf24015bf90f..f80842227669 100644
>> --- a/drivers/gpu/drm/vkms/vkms_composer.c
>> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
>> @@ -61,6 +61,15 @@ static bool check_y_limit(struct vkms_frame_info *frame_info, int y)
>>   	return false;
>>   }
>>   
>> +static void fill_background(struct pixel_argb_u16 *backgroud_color,
> 
> Hi,
> 
> this could be const struct pixel_argb_u16 *. Also a typo: missing n in
> backgroud_color.

Oops.

> 
>> +			    struct line_buffer *output_buffer)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < output_buffer->n_pixels; i++)
>> +		output_buffer->pixels[i] = *backgroud_color;
>> +}
>> +
>>   /**
>>    * @wb_frame_info: The writeback frame buffer metadata
>>    * @crtc_state: The crtc state
>> @@ -78,22 +87,23 @@ static void blend(struct vkms_writeback_job *wb,
>>   		  struct line_buffer *output_buffer, s64 row_size)
>>   {
>>   	struct vkms_plane_state **plane = crtc_state->active_planes;
>> -	struct vkms_frame_info *primary_plane_info = plane[0]->frame_info;
>>   	u32 n_active_planes = crtc_state->num_active_planes;
>>   
>> -	int y_dst = primary_plane_info->dst.y1;
>> -	int h_dst = drm_rect_height(&primary_plane_info->dst);
>> -	int y_limit = y_dst + h_dst;
>> +	struct pixel_argb_u16 background_color = (struct pixel_argb_u16) {
>> +		.a = 0xffff
>> +	};
> 
> Could be const and shorter, if that fits the kernel style:
> 
> 	const struct pixel_arb_u16 background_color = { .a = 0xffff };

It fits.

> 
>> +
>> +	int crtc_y_limit = crtc_state->crtc_height;
>>   	int y, i;
>>   
>> -	for (y = y_dst; y < y_limit; y++) {
>> -		plane[0]->format_func(output_buffer, primary_plane_info, y);
>> +	for (y = 0; y < crtc_y_limit; y++) {
>> +		fill_background(&background_color, output_buffer);
>>   
>>   		/* If there are other planes besides primary, we consider the active
>>   		 * planes should be in z-order and compose them associatively:
> 
> Is "associatively" the right word here?
> 
>>   		 * ((primary <- overlay) <- cursor)
> 
> The example (primary <- overlay) is not generally true with real hardware.
> 
> Maybe what you are trying to say is: The active planes are composed in
> z-order.

I always forgot to update these comments. Thanks!

> 
>>   		 */
>> -		for (i = 1; i < n_active_planes; i++) {
>> +		for (i = 0; i < n_active_planes; i++) {
>>   			if (!check_y_limit(plane[i]->frame_info, y))
>>   				continue;
>>   
>> @@ -154,7 +164,7 @@ static int compose_active_planes(struct vkms_writeback_job *active_wb,
> 
> As I mentioned on the previous patch, I think the finding of primary
> plane (which was generally incorrect) should be removed here.

I will remove this.

> 
>>   	if (WARN_ON(check_format_funcs(crtc_state, active_wb)))
>>   		return -EINVAL;
>>   
>> -	line_width = drm_rect_width(&primary_plane_info->dst);
>> +	line_width = crtc_state->crtc_width;
>>   	stage_buffer.n_pixels = line_width;
>>   	output_buffer.n_pixels = line_width;
>>   
>> @@ -175,8 +185,10 @@ static int compose_active_planes(struct vkms_writeback_job *active_wb,
>>   		struct vkms_frame_info *wb_frame_info = &active_wb->frame_info;
>>   
>>   		wb_format = wb_frame_info->fb->format->format;
>> -		wb_frame_info->src = primary_plane_info->src;
>> -		wb_frame_info->dst = primary_plane_info->dst;
>> +		drm_rect_init(&wb_frame_info->src, 0, 0, crtc_state->crtc_width,
>> +			      crtc_state->crtc_height);
>> +		drm_rect_init(&wb_frame_info->dst, 0, 0, crtc_state->crtc_width,
>> +			      crtc_state->crtc_height);
> 
> Why are these not set when the active_wb->frame_info is created? 

I thought that I hadn't access to the crtc at the wb creation.

After looking more carefully at the structs, I found this is not the case.

So I will improve this.

> Can the CRTC (video mode) be smaller than the wb buffer?

AFAIK this is not possible.

> 
> Somewhere you must have a check that wb buffer size can fit the crtc
> size, or maybe they must be exactly the same size. At least setting
> destination rectangle bigger than the buffer dimensions must be
> impossible.
> 
>>   	}
>>   
>>   	blend(active_wb, crtc_state, crc32, &stage_buffer,
>> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
>> index 57bbd32e9beb..4a37e243c2d7 100644
>> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
>> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
>> @@ -248,7 +248,9 @@ static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
>>   static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
>>   				   struct drm_atomic_state *state)
>>   {
>> +	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
>>   	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
>> +	struct drm_display_mode *mode = &crtc_state->mode;
>>   
>>   	if (crtc->state->event) {
>>   		spin_lock(&crtc->dev->event_lock);
>> @@ -264,6 +266,8 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
>>   	}
>>   
>>   	vkms_output->composer_state = to_vkms_crtc_state(crtc->state);
>> +	vkms_output->composer_state->crtc_width = mode->hdisplay;
>> +	vkms_output->composer_state->crtc_height = mode->vdisplay;
> 
> Is the crtc not keeping track of the current mode, do you really need
> your own crtc_width and crtc_height?
> 

I don't really need it. I was just putting more easily accessible to the 
composer functions.

But np, I can change this.

> 
> Thanks,
> pq
> 
>>   
>>   	spin_unlock_irq(&vkms_output->lock);
>>   }
>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
>> index 2704cfb6904b..ab92d9f7b701 100644
>> --- a/drivers/gpu/drm/vkms/vkms_drv.h
>> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
>> @@ -90,6 +90,8 @@ struct vkms_crtc_state {
>>   	bool wb_pending;
>>   	u64 frame_start;
>>   	u64 frame_end;
>> +	u16 crtc_width;
>> +	u16 crtc_height;
>>   };
>>   
>>   struct vkms_output {
> 
