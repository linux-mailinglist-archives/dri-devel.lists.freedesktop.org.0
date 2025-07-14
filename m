Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D15B03A7F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 11:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2876910E435;
	Mon, 14 Jul 2025 09:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="V0t4nVYn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v1UKc23C";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V0t4nVYn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v1UKc23C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E32110E435
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 09:13:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 279BB1F7BE;
 Mon, 14 Jul 2025 09:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752484385; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dOg9BN4p73V+kihZrR17uxX116DsNSkssr7SD2cMz4A=;
 b=V0t4nVYnvr6LY0AC8rDvZdYO5WgLg0Mwd4owDepbmtiBTI4tEY4UChdhhC+3n9XlFLAz2d
 c24Zgx68JYVb0A3SGyKVk4ZY/raQDy6XGlIPV7v5y61momVtWpZbfFuHyt7N3Gh0f9dWda
 Ed1ZHSVuYpmFPWSpeRLt7QBmwuR3rfQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752484385;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dOg9BN4p73V+kihZrR17uxX116DsNSkssr7SD2cMz4A=;
 b=v1UKc23CqoZv0MCxMp0eSK8y76qZ97u+vMUCTq394wxdfevGmjiHpFAHG5kqH3O7YulKPS
 fTmXdDPNjWAIjyCw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=V0t4nVYn;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=v1UKc23C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752484385; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dOg9BN4p73V+kihZrR17uxX116DsNSkssr7SD2cMz4A=;
 b=V0t4nVYnvr6LY0AC8rDvZdYO5WgLg0Mwd4owDepbmtiBTI4tEY4UChdhhC+3n9XlFLAz2d
 c24Zgx68JYVb0A3SGyKVk4ZY/raQDy6XGlIPV7v5y61momVtWpZbfFuHyt7N3Gh0f9dWda
 Ed1ZHSVuYpmFPWSpeRLt7QBmwuR3rfQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752484385;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dOg9BN4p73V+kihZrR17uxX116DsNSkssr7SD2cMz4A=;
 b=v1UKc23CqoZv0MCxMp0eSK8y76qZ97u+vMUCTq394wxdfevGmjiHpFAHG5kqH3O7YulKPS
 fTmXdDPNjWAIjyCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BD912138A1;
 Mon, 14 Jul 2025 09:13:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +W3gLCDKdGh2PAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 14 Jul 2025 09:13:04 +0000
Message-ID: <bc37c3e9-0e58-4d63-b271-d2b026adf3a0@suse.de>
Date: Mon, 14 Jul 2025 11:13:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/format-helper: introduce
 drm_fb_xrgb8888_to_gray2()
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250714-st7571-format-v1-0-a27e5112baff@gmail.com>
 <20250714-st7571-format-v1-4-a27e5112baff@gmail.com>
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
In-Reply-To: <20250714-st7571-format-v1-4-a27e5112baff@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,ffwll.ch,redhat.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCPT_COUNT_TWELVE(0.00)[12];
 ARC_NA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 TAGGED_RCPT(0.00)[dt]; MID_RHS_MATCH_FROM(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, suse.de:dkim,
 imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 279BB1F7BE
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

Am 14.07.25 um 10:04 schrieb Marcus Folkesson:
> drm_fb_xrgb8888_to_gray2() works like and share much code with
> drm_fb_xrgb8888_to_mono(), but converts XRGB8888 to
> 2bit grayscale instead.
>
> It uses drm_fb_xrgb8888_to_gray8() to convert the pixels to gray8 as an
> intermediate step before converting to gray2.

Please don't share code here.  This needs a serious rework anyway. The 
best thing for now is to add a new, separate function for _gray2().

Best regards
Thomas


>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>   drivers/gpu/drm/drm_format_helper.c | 148 ++++++++++++++++++++++++++----------
>   include/drm/drm_format_helper.h     |   4 +
>   2 files changed, 110 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index 8f3daf38ca639d3d39742c2c9fa0c54a3a9297a5..2f2171b3df609263cc9ce6809bf6144028c25380 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -1253,6 +1253,25 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
>   }
>   EXPORT_SYMBOL(drm_fb_blit);
>   
> +static void drm_fb_gray8_to_gray2_line(void *dbuf, const void *sbuf, unsigned int pixels)
> +{
> +	u8 *dbuf8 = dbuf;
> +	const u8 *sbuf8 = sbuf;
> +	u8 px;
> +
> +	while (pixels) {
> +		unsigned int i, bits = min(pixels, 4U);
> +		u8 byte = 0;
> +
> +		for (i = 0; i < bits; i++, pixels--) {
> +			byte >>= 2;
> +			px = (*sbuf8++ * 3 + 127) / 255;
> +			byte |= (px &= 0x03) << 6;
> +		}
> +		*dbuf8++ = byte;
> +	}
> +}
> +
>   static void drm_fb_gray8_to_mono_line(void *dbuf, const void *sbuf, unsigned int pixels)
>   {
>   	u8 *dbuf8 = dbuf;
> @@ -1270,40 +1289,11 @@ static void drm_fb_gray8_to_mono_line(void *dbuf, const void *sbuf, unsigned int
>   	}
>   }
>   
> -/**
> - * drm_fb_xrgb8888_to_mono - Convert XRGB8888 to monochrome
> - * @dst: Array of monochrome destination buffers (0=black, 1=white)
> - * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
> - *             within @dst; can be NULL if scanlines are stored next to each other.
> - * @src: Array of XRGB8888 source buffers
> - * @fb: DRM framebuffer
> - * @clip: Clip rectangle area to copy
> - * @state: Transform and conversion state
> - *
> - * This function copies parts of a framebuffer to display memory and converts the
> - * color format during the process. Destination and framebuffer formats must match. The
> - * parameters @dst, @dst_pitch and @src refer to arrays. Each array must have at
> - * least as many entries as there are planes in @fb's format. Each entry stores the
> - * value for the format's respective color plane at the same index.
> - *
> - * This function does not apply clipping on @dst (i.e. the destination is at the
> - * top-left corner). The first pixel (upper left corner of the clip rectangle) will
> - * be converted and copied to the first bit (LSB) in the first byte of the monochrome
> - * destination buffer. If the caller requires that the first pixel in a byte must
> - * be located at an x-coordinate that is a multiple of 8, then the caller must take
> - * care itself of supplying a suitable clip rectangle.
> - *
> - * DRM doesn't have native monochrome support. Drivers can use this function for
> - * monochrome devices that don't support XRGB8888 natively. Such drivers can
> - * announce the commonly supported XR24 format to userspace and use this function
> - * to convert to the native format.
> - *
> - * This function uses drm_fb_xrgb8888_to_gray8() to convert to grayscale and
> - * then the result is converted from grayscale to monochrome.
> - */
> -void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitch,
> -			     const struct iosys_map *src, const struct drm_framebuffer *fb,
> -			     const struct drm_rect *clip, struct drm_format_conv_state *state)
> +static void drm_fb_xrgb8888_to_gray(u8 *dst, const unsigned int *dst_pitch,
> +			     u8 *src, const struct drm_framebuffer *fb,
> +			     const struct drm_rect *clip, struct drm_format_conv_state *state,
> +			     u8 bpp,
> +			     void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
>   {
>   	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
>   		0, 0, 0, 0
> @@ -1313,11 +1303,10 @@ void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitc
>   	unsigned int cpp = fb->format->cpp[0];
>   	unsigned int len_src32 = linepixels * cpp;
>   	struct drm_device *dev = fb->dev;
> -	void *vaddr = src[0].vaddr;
>   	unsigned int dst_pitch_0;
>   	unsigned int y;
> -	u8 *mono = dst[0].vaddr, *gray8;
>   	u32 *src32;
> +	u8 *gray8;
>   
>   	if (drm_WARN_ON(dev, fb->format->format != DRM_FORMAT_XRGB8888))
>   		return;
> @@ -1330,7 +1319,7 @@ void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitc
>   	 * The mono destination buffer contains 1 bit per pixel
>   	 */
>   	if (!dst_pitch_0)
> -		dst_pitch_0 = DIV_ROUND_UP(linepixels, 8);
> +		dst_pitch_0 = DIV_ROUND_UP(linepixels, 8 / bpp);
>   
>   	/*
>   	 * The dma memory is write-combined so reads are uncached.
> @@ -1349,13 +1338,88 @@ void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitc
>   
>   	gray8 = (u8 *)src32 + len_src32;
>   
> -	vaddr += clip_offset(clip, fb->pitches[0], cpp);
> +	src += clip_offset(clip, fb->pitches[0], cpp);
>   	for (y = 0; y < lines; y++) {
> -		src32 = memcpy(src32, vaddr, len_src32);
> +		src32 = memcpy(src32, src, len_src32);
>   		drm_fb_xrgb8888_to_gray8_line(gray8, src32, linepixels);
> -		drm_fb_gray8_to_mono_line(mono, gray8, linepixels);
> -		vaddr += fb->pitches[0];
> -		mono += dst_pitch_0;
> +		xfrm_line(dst, gray8, linepixels);
> +		src += fb->pitches[0];
> +		dst += dst_pitch_0;
>   	}
>   }
> +
> +/**
> + * drm_fb_xrgb8888_to_mono - Convert XRGB8888 to monochrome
> + * @dst: Array of monochrome destination buffers (0=black, 1=white)
> + * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
> + *             within @dst; can be NULL if scanlines are stored next to each other.
> + * @src: Array of XRGB8888 source buffers
> + * @fb: DRM framebuffer
> + * @clip: Clip rectangle area to copy
> + * @state: Transform and conversion state
> + *
> + * DRM doesn't have native monochrome support. Drivers can use this function for
> + * monochrome devices that don't support XRGB8888 natively. Such drivers can
> + * announce the commonly supported XR24 format to userspace and use this function
> + * to convert to the native format.
> + *
> + * This function copies parts of a framebuffer to display memory and converts the
> + * color format during the process. Destination and framebuffer formats must match. The
> + * parameters @dst, @dst_pitch and @src refer to arrays. Each array must have at
> + * least as many entries as there are planes in @fb's format. Each entry stores the
> + * value for the format's respective color plane at the same index.
> + *
> + * This function does not apply clipping on @dst (i.e. the destination is at the
> + * top-left corner). The first pixel (upper left corner of the clip rectangle) will
> + * be converted and copied to the first bit (LSB) in the first byte of the monochrome
> + * destination buffer. If the caller requires that the first pixel in a byte must
> + * be located at an x-coordinate that is a multiple of 8, then the caller must take
> + * care itself of supplying a suitable clip rectangle.
> + *
> + *
> + * This function uses drm_fb_xrgb8888_to_gray8() to convert to grayscale and
> + * then the result is converted from grayscale to monochrome.
> + */
> +
> +
> +void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitch,
> +			     const struct iosys_map *src, const struct drm_framebuffer *fb,
> +			     const struct drm_rect *clip, struct drm_format_conv_state *state)
> +{
> +	drm_fb_xrgb8888_to_gray(dst[0].vaddr, dst_pitch, src[0].vaddr, fb, clip, state,
> +				1, drm_fb_gray8_to_mono_line);
> +}
>   EXPORT_SYMBOL(drm_fb_xrgb8888_to_mono);
> +
> +/**
> + * drm_fb_xrgb8888_to_gray2 - Convert XRGB8888 to gray2
> + * @dst: Array of gray2 destination buffers
> + * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
> + *             within @dst; can be NULL if scanlines are stored next to each other.
> + * @src: Array of XRGB8888 source buffers
> + * @fb: DRM framebuffer
> + * @clip: Clip rectangle area to copy
> + * @state: Transform and conversion state
> + *
> + * This function copies parts of a framebuffer to display memory and converts the
> + * color format during the process. Destination and framebuffer formats must match. The
> + * parameters @dst, @dst_pitch and @src refer to arrays. Each array must have at
> + * least as many entries as there are planes in @fb's format. Each entry stores the
> + * value for the format's respective color plane at the same index.
> + *
> + * DRM doesn't have native gray2 support. Drivers can use this function for
> + * gray2 devices that don't support XRGB8888 natively. Such drivers can
> + * announce the commonly supported XR24 format to userspace and use this function
> + * to convert to the native format.
> + *
> + * This function uses drm_fb_xrgb8888_to_gray8() to convert to grayscale and
> + * then the result is converted from grayscale to gray2.
> + */
> +void drm_fb_xrgb8888_to_gray2(struct iosys_map *dst, const unsigned int *dst_pitch,
> +			      const struct iosys_map *src, const struct drm_framebuffer *fb,
> +			      const struct drm_rect *clip, struct drm_format_conv_state *state)
> +{
> +	drm_fb_xrgb8888_to_gray(dst[0].vaddr, dst_pitch, src[0].vaddr, fb, clip, state,
> +				2, drm_fb_gray8_to_gray2_line);
> +}
> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray2);
> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
> index 562bc383ece4e90d96aa92b47b4f69609f825a6e..8488befafb7e0e0311f87bd2fef5011bab45065b 100644
> --- a/include/drm/drm_format_helper.h
> +++ b/include/drm/drm_format_helper.h
> @@ -136,4 +136,8 @@ void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitc
>   			     const struct iosys_map *src, const struct drm_framebuffer *fb,
>   			     const struct drm_rect *clip, struct drm_format_conv_state *state);
>   
> +void drm_fb_xrgb8888_to_gray2(struct iosys_map *dst, const unsigned int *dst_pitch,
> +			     const struct iosys_map *src, const struct drm_framebuffer *fb,
> +			     const struct drm_rect *clip, struct drm_format_conv_state *state);
> +
>   #endif /* __LINUX_DRM_FORMAT_HELPER_H */
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

