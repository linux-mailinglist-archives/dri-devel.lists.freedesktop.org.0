Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C89FA091CA
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 14:23:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C0A710F0A9;
	Fri, 10 Jan 2025 13:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="m+6oSc3X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ASsviGnm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="m+6oSc3X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ASsviGnm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E27D10E04B;
 Fri, 10 Jan 2025 13:23:50 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 087B921172;
 Fri, 10 Jan 2025 13:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1736515429; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PrilCMX5C09JO84DVBY8YiEapsTpHUYRcsRbRBep3cA=;
 b=m+6oSc3XjiJxQ7r2O4TIutB8rfN4Sn51k9uRZDknztaHK9SUvXjiQ6+F5InXDkhWZQjx2e
 bEKydpyg4D+gW9I2rZHGRVGFVmNINT6YqOEDsK35alPpZC67b21Ag5WeKkLepzWE0+aED1
 S9lfcFIhJOEC+GNPF38po+TNTa8tJCY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1736515429;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PrilCMX5C09JO84DVBY8YiEapsTpHUYRcsRbRBep3cA=;
 b=ASsviGnmX5mBcPbnd2R2scx+AS/t4X+QqjIZ1BzhB4fbdnEbKRUxbOVJHsRs2T+pwqFspq
 Yu0sZOw7CnwQ/GCA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=m+6oSc3X;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ASsviGnm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1736515429; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PrilCMX5C09JO84DVBY8YiEapsTpHUYRcsRbRBep3cA=;
 b=m+6oSc3XjiJxQ7r2O4TIutB8rfN4Sn51k9uRZDknztaHK9SUvXjiQ6+F5InXDkhWZQjx2e
 bEKydpyg4D+gW9I2rZHGRVGFVmNINT6YqOEDsK35alPpZC67b21Ag5WeKkLepzWE0+aED1
 S9lfcFIhJOEC+GNPF38po+TNTa8tJCY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1736515429;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PrilCMX5C09JO84DVBY8YiEapsTpHUYRcsRbRBep3cA=;
 b=ASsviGnmX5mBcPbnd2R2scx+AS/t4X+QqjIZ1BzhB4fbdnEbKRUxbOVJHsRs2T+pwqFspq
 Yu0sZOw7CnwQ/GCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7CB5D13763;
 Fri, 10 Jan 2025 13:23:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id zEwkHWQfgWcIXgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 10 Jan 2025 13:23:48 +0000
Content-Type: multipart/mixed; boundary="------------Ak8c05R8qA0Bhl3CK6SC6vGZ"
Message-ID: <e800ebc2-39b5-46d5-89ec-883ed1c7626b@suse.de>
Date: Fri, 10 Jan 2025 14:23:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/25] drm/dumb-buffers: Provide helper to set pitch
 and size
To: Andy Yan <andyshrk@163.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org,
 xen-devel@lists.xenproject.org
References: <20250109150310.219442-1-tzimmermann@suse.de>
 <20250109150310.219442-3-tzimmermann@suse.de>
 <94f78e1.19bf.1944de709b0.Coremail.andyshrk@163.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <94f78e1.19bf.1944de709b0.Coremail.andyshrk@163.com>
X-Rspamd-Queue-Id: 087B921172
X-Spam-Level: 
X-Spamd-Result: default: False [-1.91 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MIME_BASE64_TEXT_BOGUS(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
 MIME_BASE64_TEXT(0.10)[]; MX_GOOD(-0.01)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCPT_COUNT_TWELVE(0.00)[19];
 ARC_NA(0.00)[]; FREEMAIL_TO(0.00)[163.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 MID_RHS_MATCH_FROM(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org];
 HAS_ATTACHMENT(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:dkim, suse.de:mid,
 infradead.org:email, infradead.org:url]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -1.91
X-Spam-Flag: NO
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

This is a multi-part message in MIME format.
--------------Ak8c05R8qA0Bhl3CK6SC6vGZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi


Am 10.01.25 um 02:49 schrieb Andy Yan:
> Hi Thomas,
>
> At 2025-01-09 22:56:56, "Thomas Zimmermann" <tzimmermann@suse.de> wrote:
>> Add drm_modes_size_dumb(), a helper to calculate the dumb-buffer
>> scanline pitch and allocation size. Implementations of struct
>> drm_driver.dumb_create can call the new helper for their size
>> computations. There's currently quite a bit of code duplication
>> among DRM's memory managers. Each calculates scanline pitch and
>> buffer size from the given arguments, but the implementations are
>> inconsistent in how they treat alignment and format support. Later
>> patches will unify this code on top of drm_mode_size_dumb() as
>> much as possible.
>>
>> drm_mode_size_dumb() uses existing 4CC format helpers to interpret the
>> given color mode. This makes the dumb-buffer interface behave similar
>> the kernel's video= parameter. Again, current per-driver implementations
>> likely have subtle differences or bugs in how they support color modes.
>>
>> Future directions: one bug is present in the current input validation
>> in drm_mode_create_dumb(). The dumb-buffer overflow tests round up any
>> given bits-per-pixel value to a multiple of 8. So even one-bit formats,
>> such as DRM_FORMAT_C1, require 8 bits per pixel. While not common,
>> low-end displays use such formats; with a possible overcommitment of
>> memory. At some point, the validation logic in drm_mode_size_dumb() is
>> supposed to replace the erronous code.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>> drivers/gpu/drm/drm_dumb_buffers.c | 93 ++++++++++++++++++++++++++++++
>> include/drm/drm_dumb_buffers.h     | 14 +++++
>> 2 files changed, 107 insertions(+)
>> create mode 100644 include/drm/drm_dumb_buffers.h
>>
>> diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
>> index 9916aaf5b3f2..fd39720bd617 100644
>> --- a/drivers/gpu/drm/drm_dumb_buffers.c
>> +++ b/drivers/gpu/drm/drm_dumb_buffers.c
>> @@ -25,6 +25,8 @@
>>
>> #include <drm/drm_device.h>
>> #include <drm/drm_drv.h>
>> +#include <drm/drm_dumb_buffers.h>
>> +#include <drm/drm_fourcc.h>
>> #include <drm/drm_gem.h>
>> #include <drm/drm_mode.h>
>>
>> @@ -57,6 +59,97 @@
>>   * a hardware-specific ioctl to allocate suitable buffer objects.
>>   */
>>
>> +static int drm_mode_align_dumb(struct drm_mode_create_dumb *args,
>> +			       unsigned long pitch_align,
>> +			       unsigned long size_align)
>> +{
>> +	u32 pitch = args->pitch;
>> +	u32 size;
>> +
>> +	if (!pitch)
>> +		return -EINVAL;
>> +
>> +	if (pitch_align)
>> +		pitch = roundup(pitch, pitch_align);
>> +
>> +	/* overflow checks for 32bit size calculations */
>> +	if (args->height > U32_MAX / pitch)
>> +		return -EINVAL;
>> +
>> +	if (!size_align)
>> +		size_align = PAGE_SIZE;
>> +	else if (!IS_ALIGNED(size_align, PAGE_SIZE))
>> +		return -EINVAL;
>> +
>> +	size = ALIGN(args->height * pitch, size_align);
>> +	if (!size)
>> +		return -EINVAL;
>> +
>> +	args->pitch = pitch;
>> +	args->size = size;
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * drm_mode_size_dumb - Calculates the scanline and buffer sizes for dumb buffers
>> + * @dev: DRM device
>> + * @args: Parameters for the dumb buffer
>> + * @pitch_align: Scanline alignment in bytes
>> + * @size_align: Buffer-size alignment in bytes
>> + *
>> + * The helper drm_mode_size_dumb() calculates the size of the buffer
>> + * allocation and the scanline size for a dumb buffer. Callers have to
>> + * set the buffers width, height and color mode in the argument @arg.
>> + * The helper validates the correctness of the input and tests for
>> + * possible overflows. If successful, it returns the dumb buffer's
>> + * required scanline pitch and size in &args.
>> + *
>> + * The parameter @pitch_align allows the driver to specifies an
>> + * alignment for the scanline pitch, if the hardware requires any. The
>> + * calculated pitch will be a multiple of the alignment. The parameter
>> + * @size_align allows to specify an alignment for buffer sizes. The
>> + * returned size is always a multiple of PAGE_SIZE.
>> + *
>> + * Returns:
>> + * Zero on success, or a negative error code otherwise.
>> + */
>> +int drm_mode_size_dumb(struct drm_device *dev,
>> +		       struct drm_mode_create_dumb *args,
>> +		       unsigned long pitch_align,
>> +		       unsigned long size_align)
>> +{
>> +	u32 fourcc;
>> +	const struct drm_format_info *info;
>> +	u64 pitch;
>> +
>> +	/*
>> +	 * The scanline pitch depends on the buffer width and the color
>> +	 * format. The latter is specified as a color-mode constant for
>> +	 * which we first have to find the corresponding color format.
>> +	 *
>> +	 * Different color formats can have the same color-mode constant.
>> +	 * For example XRGB8888 and BGRX8888 both have a color mode of 32.
>> +	 * It is possible to use different formats for dumb-buffer allocation
>> +	 * and rendering as long as all involved formats share the same
>> +	 * color-mode constant.
>> +	 */
>> +	fourcc = drm_driver_color_mode_format(dev, args->bpp);
> This will return -EINVAL with bpp drm_mode_legacy_fb_format doesn't support,
> such as(NV15, NV20, NV30, bpp is 10)[0]

Thanks for taking a look. That NV-related code at [0] is a 'somewhat 
non-idiomatic use' of the UAPI. The dumb-buffer interface really just 
supports a single plane. The fix would be a new ioctl that takes a DRM 
4cc constant and returns a buffer handle/pitch/size for each plane. But 
that's separate series throughout the various components.

There's also code XRGB16161616F. This is a viable format for the UAPI, 
but seems not very useful in practice.

>
> And there are also some AFBC based format with bpp can't be handled here, see:
> static __u32 drm_gem_afbc_get_bpp(struct drm_device *dev,
>                                    const struct drm_mode_fb_cmd2 *mode_cmd)
> {
>          const struct drm_format_info *info;
>                  
>          info = drm_get_format_info(dev, mode_cmd);
>                  
>          switch (info->format) {
>          case DRM_FORMAT_YUV420_8BIT:
>                  return 12;
>          case DRM_FORMAT_YUV420_10BIT:
>                  return 15;
>          case DRM_FORMAT_VUY101010:
>                  return 30;
>          default:
>                  return drm_format_info_bpp(info, 0);
>          }
> }

Same problem here. These YUV formats are multi-planar and there should 
be no dumb buffers for them.

As we still have to support these all use cases, I've modified the new 
helper to fallback to computing the pitch from the given bpp value. 
That's what drivers currently do. Could you please apply the attached 
patch on top of the series and report back the result of the test? You 
should see a kernel warning about the unknown color mode, but allocation 
should succeed.

Best regards
Thomas

>
>
> [0]https://gitlab.freedesktop.org/mesa/drm/-/blob/main/tests/modetest/buffers.c?ref_type=heads#L159
>
> This introduce a modetest failure on rockchip platform:
> # modetest -M rockchip -s 70@68:1920x1080 -P 32@68:1920x1080@NV30
> setting mode 1920x1080-60.00Hz on connectors 70, crtc 68
> testing 1920x1080@NV30 overlay plane 32
> failed to create dumb buffer: Invalid argument
>
> I think other platform with bpp can't handler by  drm_mode_legacy_fb_format will
> also see this kind of failure:
>
>
>
>> +	if (fourcc == DRM_FORMAT_INVALID)
>> +		return -EINVAL;
>> +	info = drm_format_info(fourcc);
>> +	if (!info)
>> +		return -EINVAL;
>> +	pitch = drm_format_info_min_pitch(info, 0, args->width);
>> +	if (!pitch || pitch > U32_MAX)
>> +		return -EINVAL;
>> +
>> +	args->pitch = pitch;
>> +
>> +	return drm_mode_align_dumb(args, pitch_align, size_align);
>> +}
>> +EXPORT_SYMBOL(drm_mode_size_dumb);
>> +
>> int drm_mode_create_dumb(struct drm_device *dev,
>> 			 struct drm_mode_create_dumb *args,
>> 			 struct drm_file *file_priv)
>> diff --git a/include/drm/drm_dumb_buffers.h b/include/drm/drm_dumb_buffers.h
>> new file mode 100644
>> index 000000000000..6fe36004b19d
>> --- /dev/null
>> +++ b/include/drm/drm_dumb_buffers.h
>> @@ -0,0 +1,14 @@
>> +/* SPDX-License-Identifier: MIT */
>> +
>> +#ifndef __DRM_DUMB_BUFFERS_H__
>> +#define __DRM_DUMB_BUFFERS_H__
>> +
>> +struct drm_device;
>> +struct drm_mode_create_dumb;
>> +
>> +int drm_mode_size_dumb(struct drm_device *dev,
>> +		       struct drm_mode_create_dumb *args,
>> +		       unsigned long pitch_align,
>> +		       unsigned long size_align);
>> +
>> +#endif
>> -- 
>> 2.47.1
>>
>>
>> _______________________________________________
>> Linux-rockchip mailing list
>> Linux-rockchip@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-rockchip

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

--------------Ak8c05R8qA0Bhl3CK6SC6vGZ
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-add-fallback-for-unknown-bpp.patch"
Content-Disposition: attachment;
 filename="0001-add-fallback-for-unknown-bpp.patch"
Content-Transfer-Encoding: base64

RnJvbSAyZTcwMDU2NTRkNzZiNzFmNzhmZTA3ZmNmOThhMzU3MDAyMmY1MDM0IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KRGF0ZTogRnJpLCAxMCBKYW4gMjAyNSAwOTozNToxMiArMDEwMApTdWJqZWN0
OiBbUEFUQ0hdIGFkZCBmYWxsYmFjayBmb3IgdW5rbm93biBicHAKCi0tLQogZHJpdmVycy9n
cHUvZHJtL2RybV9kdW1iX2J1ZmZlcnMuYyB8IDI4ICsrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHVtYl9idWZmZXJzLmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2R1bWJfYnVmZmVycy5jCmluZGV4IGZkMzk3MjBiZDYxNy4u
NWYyZDAyNmM3NjRjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2R1bWJfYnVm
ZmVycy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHVtYl9idWZmZXJzLmMKQEAgLTEx
OSw5ICsxMTksOCBAQCBpbnQgZHJtX21vZGVfc2l6ZV9kdW1iKHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYsCiAJCSAgICAgICB1bnNpZ25lZCBsb25nIHBpdGNoX2FsaWduLAogCQkgICAgICAg
dW5zaWduZWQgbG9uZyBzaXplX2FsaWduKQogeworCXU2NCBwaXRjaCA9IDA7CiAJdTMyIGZv
dXJjYzsKLQljb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICppbmZvOwotCXU2NCBwaXRj
aDsKIAogCS8qCiAJICogVGhlIHNjYW5saW5lIHBpdGNoIGRlcGVuZHMgb24gdGhlIGJ1ZmZl
ciB3aWR0aCBhbmQgdGhlIGNvbG9yCkBAIC0xMzUsMTIgKzEzNCwyNSBAQCBpbnQgZHJtX21v
ZGVfc2l6ZV9kdW1iKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJICogY29sb3ItbW9kZSBj
b25zdGFudC4KIAkgKi8KIAlmb3VyY2MgPSBkcm1fZHJpdmVyX2NvbG9yX21vZGVfZm9ybWF0
KGRldiwgYXJncy0+YnBwKTsKLQlpZiAoZm91cmNjID09IERSTV9GT1JNQVRfSU5WQUxJRCkK
LQkJcmV0dXJuIC1FSU5WQUw7Ci0JaW5mbyA9IGRybV9mb3JtYXRfaW5mbyhmb3VyY2MpOwot
CWlmICghaW5mbykKLQkJcmV0dXJuIC1FSU5WQUw7Ci0JcGl0Y2ggPSBkcm1fZm9ybWF0X2lu
Zm9fbWluX3BpdGNoKGluZm8sIDAsIGFyZ3MtPndpZHRoKTsKKwlpZiAoZm91cmNjICE9IERS
TV9GT1JNQVRfSU5WQUxJRCkgeworCQljb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICpp
bmZvID0gZHJtX2Zvcm1hdF9pbmZvKGZvdXJjYyk7CisKKwkJaWYgKCFpbmZvKQorCQkJcmV0
dXJuIC1FSU5WQUw7CisJCXBpdGNoID0gZHJtX2Zvcm1hdF9pbmZvX21pbl9waXRjaChpbmZv
LCAwLCBhcmdzLT53aWR0aCk7CisJfSBlbHNlIGlmIChhcmdzLT5icHApIHsKKwkJLyoKKwkJ
ICogU29tZSB1c2Vyc3BhY2UgdGhyb3dzIGluIGFyYml0cmFyeSB2YWx1ZXMgZm9yIGJwcCBh
bmQKKwkJICogcmVsaWVzIG9uIHRoZSBrZXJuZWwgdG8gZmlndXJlIGl0IG91dC4gSW4gdGhp
cyBjYXNlIHdlCisJCSAqIGZhbGwgYmFjayB0byB0aGUgb2xkIG1ldGhvZCBvZiB1c2luZyBi
cHAgZGlyZWN0bHkuCisJCSAqLworCQlkcm1fd2FybihkZXYsICJVbmtub3duIGNvbG9yIG1v
ZGUgJWQ7IGd1ZXNzaW5nIGJ1ZmZlciBzaXplLlxuIiwgYXJncy0+YnBwKTsKKwkJaWYgKGFy
Z3MtPmJwcCA8IDgpCisJCQlwaXRjaCA9IERJVl9ST1VORF9VUChhcmdzLT53aWR0aCAqIGFy
Z3MtPmJwcCwgU1pfOCk7CisJCWVsc2UKKwkJCXBpdGNoID0gYXJncy0+d2lkdGggKiBESVZf
Uk9VTkRfVVAoYXJncy0+YnBwLCBTWl84KTsKKwl9CisKIAlpZiAoIXBpdGNoIHx8IHBpdGNo
ID4gVTMyX01BWCkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKLS0gCjIuNDcuMQoK

--------------Ak8c05R8qA0Bhl3CK6SC6vGZ--
