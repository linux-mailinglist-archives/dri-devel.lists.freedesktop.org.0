Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D3BAD8393
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 09:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F184F10E8BC;
	Fri, 13 Jun 2025 07:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="yANbI/sc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LFmJUxkV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yANbI/sc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LFmJUxkV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C406110E8B6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 07:03:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 48E721F78E;
 Fri, 13 Jun 2025 07:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749798179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YtCuR1eybAp77fE00OpWM3TU/ImLKJeSuAAVFoht3gg=;
 b=yANbI/scmaho1TDuTul7Jwdm2lX9vb7YLSpNiSYBTKvif1zkY8B4cf12JIf2YQZzOpfYxr
 EsGrNmeUYbNeQFA8cl/zOqnMR0XoV4vsqC9vKOB0sPXwMaI+5/rnvrhgj9B2RDmic80+SO
 je7SR+bzaMOmymtG+cKUhYDaWHxRaBY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749798179;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YtCuR1eybAp77fE00OpWM3TU/ImLKJeSuAAVFoht3gg=;
 b=LFmJUxkV0s1fCzMOrcLSqpFr1hiEI9fFcomxo1Y/3WXnNwE5ZEB1uAC+HcKtI8tEmvAl3Y
 r2naVlz0EVAbVxAw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="yANbI/sc";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LFmJUxkV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749798179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YtCuR1eybAp77fE00OpWM3TU/ImLKJeSuAAVFoht3gg=;
 b=yANbI/scmaho1TDuTul7Jwdm2lX9vb7YLSpNiSYBTKvif1zkY8B4cf12JIf2YQZzOpfYxr
 EsGrNmeUYbNeQFA8cl/zOqnMR0XoV4vsqC9vKOB0sPXwMaI+5/rnvrhgj9B2RDmic80+SO
 je7SR+bzaMOmymtG+cKUhYDaWHxRaBY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749798179;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YtCuR1eybAp77fE00OpWM3TU/ImLKJeSuAAVFoht3gg=;
 b=LFmJUxkV0s1fCzMOrcLSqpFr1hiEI9fFcomxo1Y/3WXnNwE5ZEB1uAC+HcKtI8tEmvAl3Y
 r2naVlz0EVAbVxAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BED8013782;
 Fri, 13 Jun 2025 07:02:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id NqoyLSLNS2jOEgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 13 Jun 2025 07:02:58 +0000
Message-ID: <cd27235b-02ac-4d96-99b9-16fb1bff6c4c@suse.de>
Date: Fri, 13 Jun 2025 09:02:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/25] drm/dumb-buffers: Provide helper to set pitch
 and size
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, geert@linux-m68k.org
References: <20250311155120.442633-1-tzimmermann@suse.de>
 <20250311155120.442633-3-tzimmermann@suse.de>
 <f174e1f4-e4af-49fa-b62f-dddcfbf42d73@ideasonboard.com>
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
In-Reply-To: <f174e1f4-e4af-49fa-b62f-dddcfbf42d73@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 48E721F78E
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; ARC_NA(0.00)[];
 URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,ideasonboard.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,chromium.org:email];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCPT_COUNT_TWELVE(0.00)[20];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email]
X-Spam-Score: -3.01
X-Spam-Level: 
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

Hi

Am 12.06.25 um 10:36 schrieb Tomi Valkeinen:
> Hi,
>
> On 11/03/2025 17:47, Thomas Zimmermann wrote:
>> Add drm_modes_size_dumb(), a helper to calculate the dumb-buffer
>> scanline pitch and allocation size. Implementations of struct
>> drm_driver.dumb_create can call the new helper for their size
>> computations.
>>
>> There is currently quite a bit of code duplication among DRM's
>> memory managers. Each calculates scanline pitch and buffer size
>> from the given arguments, but the implementations are inconsistent
>> in how they treat alignment and format support. Later patches will
>> unify this code on top of drm_mode_size_dumb() as much as possible.
>>
>> drm_mode_size_dumb() uses existing 4CC format helpers to interpret
>> the given color mode. This makes the dumb-buffer interface behave
>> similar the kernel's video= parameter. Current per-driver implementations
>> again likely have subtle differences or bugs in how they support color
>> modes.
>>
>> The dumb-buffer UAPI is only specified for known color modes. These
>> values describe linear, single-plane RGB color formats or legacy index
>> formats. Other values should not be specified. But some user space
>> still does. So for unknown color modes, there are a number of known
>> exceptions for which drm_mode_size_dumb() calculates the pitch from
>> the bpp value, as before. All other values work the same but print
>> an error.
>>
>> v4:
>> - use %u conversion specifier (Geert)
>> - list DRM_FORMAT_Dn in UAPI docs (Geert)
>> - avoid dmesg spamming with drm_warn_once() (Sima)
>> - add more information about bpp special case (Sima)
>> - clarify parameters for hardware alignment
>> - add a TODO item for DUMB_CREATE2
>> v3:
>> - document the UAPI semantics
>> - compute scanline pitch from for unknown color modes (Andy, Tomi)
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   Documentation/gpu/todo.rst         |  28 ++++++
>>   drivers/gpu/drm/drm_dumb_buffers.c | 132 +++++++++++++++++++++++++++++
>>   include/drm/drm_dumb_buffers.h     |  14 +++
>>   include/uapi/drm/drm_mode.h        |  50 ++++++++++-
>>   4 files changed, 223 insertions(+), 1 deletion(-)
>>   create mode 100644 include/drm/drm_dumb_buffers.h
>>
>> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
>> index c57777a24e03..f1bd741b06dc 100644
>> --- a/Documentation/gpu/todo.rst
>> +++ b/Documentation/gpu/todo.rst
>> @@ -515,6 +515,34 @@ Contact: Douglas Anderson <dianders@chromium.org>
>>   
>>   Level: Starter
>>   
>> +Implement a new DUMB_CREATE2 ioctl
>> +----------------------------------
>> +
>> +The current DUMB_CREATE ioctl is not well defined. Instead of a pixel and
>> +framebuffer format, it only accepts a color mode of vague semantics. Assuming
>> +a linear framebuffer, the color mode gives and idea of the supported pixel
>> +format. But userspace effectively has to guess the correct values. It really
>> +only works reliable with framebuffers in XRGB8888. Userspace has begun to
>> +workaround these limitations by computing arbitrary format's buffer sizes and
>> +calculating their sizes in terms of XRGB8888 pixels.
>> +
>> +One possible solution is a new ioctl DUMB_CREATE2. It should accept a DRM
>> +format and a format modifier to resolve the color mode's ambiguity. As
>> +framebuffers can be multi-planar, the new ioctl has to return the buffer size,
>> +pitch and GEM handle for each individual color plane.
>> +
>> +In the first step, the new ioctl can be limited to the current features of
>> +the existing DUMB_CREATE. Individual drivers can then be extended to support
>> +multi-planar formats. Rockchip might require this and would be a good candidate.
>> +
>> +In addition to the kernel implementation, there must be user-space support
>> +for the new ioctl. There's code in Mesa that might be able to use the new
>> +call.
>> +
>> +Contact: Thomas Zimmermann <tzimmermann@suse.de>
>> +
>> +Level: Advanced
>> +
>>   
>>   Core refactorings
>>   =================
>> diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
>> index 9916aaf5b3f2..97cd3dcb79f1 100644
>> --- a/drivers/gpu/drm/drm_dumb_buffers.c
>> +++ b/drivers/gpu/drm/drm_dumb_buffers.c
>> @@ -25,6 +25,8 @@
>>   
>>   #include <drm/drm_device.h>
>>   #include <drm/drm_drv.h>
>> +#include <drm/drm_dumb_buffers.h>
>> +#include <drm/drm_fourcc.h>
>>   #include <drm/drm_gem.h>
>>   #include <drm/drm_mode.h>
>>   
>> @@ -57,6 +59,136 @@
>>    * a hardware-specific ioctl to allocate suitable buffer objects.
>>    */
>>   
>> +static int drm_mode_align_dumb(struct drm_mode_create_dumb *args,
>> +			       unsigned long hw_pitch_align,
>> +			       unsigned long hw_size_align)
>> +{
>> +	u32 pitch = args->pitch;
>> +	u32 size;
>> +
>> +	if (!pitch)
>> +		return -EINVAL;
>> +
>> +	if (hw_pitch_align)
>> +		pitch = roundup(pitch, hw_pitch_align);
>> +
>> +	/* overflow checks for 32bit size calculations */
>> +	if (args->height > U32_MAX / pitch)
>> +		return -EINVAL;
>> +
> check_mul_overflow(args->height, pitch, &size)?

I wasn't aware of that. Requires some re-arrangement of the code, but 
probably makes sense.

>
>> +	if (!hw_size_align)
>> +		hw_size_align = PAGE_SIZE;
>> +	else if (!IS_ALIGNED(hw_size_align, PAGE_SIZE))
>> +		return -EINVAL; /* TODO: handle this if necessary */
>> +
>> +	size = ALIGN(args->height * pitch, hw_size_align);
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
>> + * @hw_pitch_align: Hardware scanline alignment in bytes
>> + * @hw_size_align: Hardware buffer-size alignment in bytes
>> + *
>> + * The helper drm_mode_size_dumb() calculates the size of the buffer
>> + * allocation and the scanline size for a dumb buffer. Callers have to
>> + * set the buffers width, height and color mode in the argument @arg.
>> + * The helper validates the correctness of the input and tests for
>> + * possible overflows. If successful, it returns the dumb buffer's
>> + * required scanline pitch and size in &args.
>> + *
>> + * The parameter @hw_pitch_align allows the driver to specifies an
>> + * alignment for the scanline pitch, if the hardware requires any. The
>> + * calculated pitch will be a multiple of the alignment. The parameter
>> + * @hw_size_align allows to specify an alignment for buffer sizes. The
>> + * provided alignment should represent requirements of the graphics
>> + * hardware. drm_mode_size_dumb() handles GEM-related constraints
>> + * automatically across all drivers and hardware. For example, the
>> + * returned buffer size is always a multiple of PAGE_SIZE, which is
>> + * required by mmap().
>> + *
>> + * Returns:
>> + * Zero on success, or a negative error code otherwise.
>> + */
>> +int drm_mode_size_dumb(struct drm_device *dev,
>> +		       struct drm_mode_create_dumb *args,
>> +		       unsigned long hw_pitch_align,
>> +		       unsigned long hw_size_align)
>> +{
>> +	u64 pitch = 0;
>> +	u32 fourcc;
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
>> +	if (fourcc != DRM_FORMAT_INVALID) {
>> +		const struct drm_format_info *info = drm_format_info(fourcc);
>> +
>> +		if (!info)
>> +			return -EINVAL;
>> +		pitch = drm_format_info_min_pitch(info, 0, args->width);
>> +	} else if (args->bpp) {
>> +		/*
>> +		 * Some userspace throws in arbitrary values for bpp and
>> +		 * relies on the kernel to figure it out. In this case we
>> +		 * fall back to the old method of using bpp directly. The
>> +		 * over-commitment of memory from the rounding is acceptable
>> +		 * for compatibility with legacy userspace. We have a number
>> +		 * of deprecated legacy values that are explicitly supported.
>> +		 */
>> +		switch (args->bpp) {
>> +		default:
>> +			drm_warn_once(dev,
>> +				      "Unknown color mode %u; guessing buffer size.\n",
>> +				      args->bpp);
>> +			fallthrough;
>> +		/*
>> +		 * These constants represent various YUV formats supported by
>> +		 * drm_gem_afbc_get_bpp().
>> +		 */
>> +		case 12: // DRM_FORMAT_YUV420_8BIT
>> +		case 15: // DRM_FORMAT_YUV420_10BIT
>> +		case 30: // DRM_FORMAT_VUY101010
>> +			fallthrough;
>> +		/*
>> +		 * Used by Mesa and Gstreamer to allocate NV formats and others
>> +		 * as RGB buffers. Technically, XRGB16161616F formats are RGB,
>> +		 * but the dumb buffers are not supposed to be used for anything
>> +		 * beyond 32 bits per pixels.
>> +		 */
>> +		case 10: // DRM_FORMAT_NV{15,20,30}, DRM_FORMAT_P010
>> +		case 64: // DRM_FORMAT_{XRGB,XBGR,ARGB,ABGR}16161616F
>> +			pitch = args->width * DIV_ROUND_UP(args->bpp, SZ_8);
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (!pitch || pitch > U32_MAX)
>> +		return -EINVAL;
>> +
>> +	args->pitch = pitch;
>> +
>> +	return drm_mode_align_dumb(args, hw_pitch_align, hw_size_align);
>> +}
>> +EXPORT_SYMBOL(drm_mode_size_dumb);
>> +
>>   int drm_mode_create_dumb(struct drm_device *dev,
>>   			 struct drm_mode_create_dumb *args,
>>   			 struct drm_file *file_priv)
>> diff --git a/include/drm/drm_dumb_buffers.h b/include/drm/drm_dumb_buffers.h
>> new file mode 100644
>> index 000000000000..1f3a8236fb3d
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
>> +		       unsigned long hw_pitch_align,
>> +		       unsigned long hw_size_align);
>> +
>> +#endif
>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
>> index c082810c08a8..efe8f5ad35ee 100644
>> --- a/include/uapi/drm/drm_mode.h
>> +++ b/include/uapi/drm/drm_mode.h
>> @@ -1058,7 +1058,7 @@ struct drm_mode_crtc_page_flip_target {
>>    * struct drm_mode_create_dumb - Create a KMS dumb buffer for scanout.
>>    * @height: buffer height in pixels
>>    * @width: buffer width in pixels
>> - * @bpp: bits per pixel
>> + * @bpp: color mode
>>    * @flags: must be zero
>>    * @handle: buffer object handle
>>    * @pitch: number of bytes between two consecutive lines
>> @@ -1066,6 +1066,54 @@ struct drm_mode_crtc_page_flip_target {
>>    *
>>    * User-space fills @height, @width, @bpp and @flags. If the IOCTL succeeds,
>>    * the kernel fills @handle, @pitch and @size.
>> + *
>> + * The value of @bpp is a color-mode number describing a specific format
>> + * or a variant thereof. The value often corresponds to the number of bits
>> + * per pixel for most modes, although there are exceptions. Each color mode
>> + * maps to a DRM format plus a number of modes with similar pixel layout.
>> + * Framebuffer layout is always linear.
>> + *
>> + * Support for all modes and formats is optional. Even if dumb-buffer
>> + * creation with a certain color mode succeeds, it is not guaranteed that
>> + * the DRM driver supports any of the related formats. Most drivers support
>> + * a color mode of 32 with a format of DRM_FORMAT_XRGB8888 on their primary
>> + * plane.
>> + *
>> + * +------------+------------------------+------------------------+
>> + * | Color mode | Framebuffer format     | Compatible formats     |
>> + * +============+========================+========================+
>> + * |     32     |  * DRM_FORMAT_XRGB8888 |  * DRM_FORMAT_BGRX8888 |
>> + * |            |                        |  * DRM_FORMAT_RGBX8888 |
>> + * |            |                        |  * DRM_FORMAT_XBGR8888 |
>> + * +------------+------------------------+------------------------+
>> + * |     24     |  * DRM_FORMAT_RGB888   |  * DRM_FORMAT_BGR888   |
>> + * +------------+------------------------+------------------------+
>> + * |     16     |  * DRM_FORMAT_RGB565   |  * DRM_FORMAT_BGR565   |
>> + * +------------+------------------------+------------------------+
>> + * |     15     |  * DRM_FORMAT_XRGB1555 |  * DRM_FORMAT_BGRX1555 |
>> + * |            |                        |  * DRM_FORMAT_RGBX1555 |
>> + * |            |                        |  * DRM_FORMAT_XBGR1555 |
>> + * +------------+------------------------+------------------------+
>> + * |      8     |  * DRM_FORMAT_C8       |  * DRM_FORMAT_D8       |
>> + * |            |                        |  * DRM_FORMAT_R8       |
>> + * +------------+------------------------+------------------------+
>> + * |      4     |  * DRM_FORMAT_C4       |  * DRM_FORMAT_D4       |
>> + * |            |                        |  * DRM_FORMAT_R4       |
>> + * +------------+------------------------+------------------------+
>> + * |      2     |  * DRM_FORMAT_C2       |  * DRM_FORMAT_D2       |
>> + * |            |                        |  * DRM_FORMAT_R2       |
>> + * +------------+------------------------+------------------------+
>> + * |      1     |  * DRM_FORMAT_C1       |  * DRM_FORMAT_D1       |
>> + * |            |                        |  * DRM_FORMAT_R1       |
>> + * +------------+------------------------+------------------------+
>> + *
>> + * Color modes of 10, 12, 15, 30 and 64 are only supported for use by
>> + * legacy user space. Please don't use them in new code. Other modes
>> + * are not support.
>> + *
>> + * Do not attempt to allocate anything but linear framebuffer memory
>> + * with single-plane RGB data. Allocation of other framebuffer
>> + * layouts requires dedicated ioctls in the respective DRM driver.
>>    */
>>   struct drm_mode_create_dumb {
>>   	__u32 height;
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Thanks for reviewing.

Best regards
Thomas

>
>   Tomi
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

