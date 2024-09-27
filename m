Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CBD987FCB
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 09:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B4210EC3E;
	Fri, 27 Sep 2024 07:52:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="pNx6G9kU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v8lVgU2c";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pNx6G9kU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v8lVgU2c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF3910EC3E
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 07:52:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2BCCA21B89;
 Fri, 27 Sep 2024 07:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727423550; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=t4FFCkQ+LnIbGDUYOEMzMCvYmBqmhXsfnOzw2844FjA=;
 b=pNx6G9kU6FxzKAcaubWOz10dN0PE6nPw9k6M2R00JO34twiP73t9tb8ii4A6MzuNlsfgB5
 ThJ/Yflj7GfvY2EgkyJrhqswzx/qD7NFYC3cvDqVQ5Tsds38mIuqF3Vb14JgNWun7HfOgt
 Lpew6GmWiDeoowW1xl1arLwNN+5Qa44=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727423550;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=t4FFCkQ+LnIbGDUYOEMzMCvYmBqmhXsfnOzw2844FjA=;
 b=v8lVgU2cHjzLwe8BW/p+AOkkiokPY05X0uwNqK6nYTA3QGUCZJdJ7o+ZrwVvWhZY3760zQ
 yStCZHWgLUWigmBQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pNx6G9kU;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=v8lVgU2c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727423550; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=t4FFCkQ+LnIbGDUYOEMzMCvYmBqmhXsfnOzw2844FjA=;
 b=pNx6G9kU6FxzKAcaubWOz10dN0PE6nPw9k6M2R00JO34twiP73t9tb8ii4A6MzuNlsfgB5
 ThJ/Yflj7GfvY2EgkyJrhqswzx/qD7NFYC3cvDqVQ5Tsds38mIuqF3Vb14JgNWun7HfOgt
 Lpew6GmWiDeoowW1xl1arLwNN+5Qa44=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727423550;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=t4FFCkQ+LnIbGDUYOEMzMCvYmBqmhXsfnOzw2844FjA=;
 b=v8lVgU2cHjzLwe8BW/p+AOkkiokPY05X0uwNqK6nYTA3QGUCZJdJ7o+ZrwVvWhZY3760zQ
 yStCZHWgLUWigmBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C57BC13A73;
 Fri, 27 Sep 2024 07:52:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id /lAHLz1k9mYfKQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 27 Sep 2024 07:52:29 +0000
Message-ID: <32f5a048-47cb-45f7-9140-25b089c81628@suse.de>
Date: Fri, 27 Sep 2024 09:52:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 9/10] drm/format-helper: Add conversion from XRGB8888
 to BGR888
To: Aditya Garg <gargaditya08@live.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, Jiri Kosina <jikos@kernel.org>,
 "bentiss@kernel.org" <bentiss@kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <thomas@t-8ch.de>
Cc: Orlando Chamberlain <orlandoch.dev@gmail.com>,
 Kerem Karabay <kekrby@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
 <ECFD946D-2DCD-46DE-A86C-616496D1ACE7@live.com>
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
In-Reply-To: <ECFD946D-2DCD-46DE-A86C-616496D1ACE7@live.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 2BCCA21B89
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[live.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,t-8ch.de];
 MIME_TRACE(0.00)[0:+]; TO_DN_EQ_ADDR_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,live.com];
 FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.freedesktop.org];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[13]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; TO_DN_SOME(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
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

Am 17.08.24 um 13:51 schrieb Aditya Garg:
> From: Kerem Karabay <kekrby@gmail.com>
>
> Add XRGB8888 emulation helper for devices that only support BGR888.
>
> Signed-off-by: Kerem Karabay <kekrby@gmail.com>
> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> ---
>   drivers/gpu/drm/drm_format_helper.c           | 54 +++++++++++++
>   .../gpu/drm/tests/drm_format_helper_test.c    | 81 +++++++++++++++++++
>   include/drm/drm_format_helper.h               |  3 +
>   3 files changed, 138 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index b1be458ed..28c0e76a1 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -702,6 +702,57 @@ void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *dst_pi
>   }
>   EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888);
>   
> +static void drm_fb_xrgb8888_to_bgr888_line(void *dbuf, const void *sbuf, unsigned int pixels)
> +{
> +	u8 *dbuf8 = dbuf;
> +	const __le32 *sbuf32 = sbuf;
> +	unsigned int x;
> +	u32 pix;
> +
> +	for (x = 0; x < pixels; x++) {
> +		pix = le32_to_cpu(sbuf32[x]);
> +		/* write red-green-blue to output in little endianness */
> +		*dbuf8++ = (pix & 0x00FF0000) >> 16;
> +		*dbuf8++ = (pix & 0x0000FF00) >> 8;
> +		*dbuf8++ = (pix & 0x000000FF) >> 0;

I know the file is inconsistent, but I'd prefer lower-case numbers 
(0xff) here. Apart from that

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

> +	}
> +}
> +
> +/**
> + * drm_fb_xrgb8888_to_bgr888 - Convert XRGB8888 to BGR888 clip buffer
> + * @dst: Array of BGR888 destination buffers
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
> + * This function does not apply clipping on @dst (i.e. the destination is at the
> + * top-left corner).
> + *
> + * Drivers can use this function for BGR888 devices that don't natively
> + * support XRGB8888.
> + */
> +void drm_fb_xrgb8888_to_bgr888(struct iosys_map *dst, const unsigned int *dst_pitch,
> +			       const struct iosys_map *src, const struct drm_framebuffer *fb,
> +			       const struct drm_rect *clip, struct drm_format_conv_state *state)
> +{
> +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> +		3,
> +	};
> +
> +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
> +		    drm_fb_xrgb8888_to_bgr888_line);
> +}
> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_bgr888);
> +
>   static void drm_fb_xrgb8888_to_argb8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
>   {
>   	__le32 *dbuf32 = dbuf;
> @@ -1035,6 +1086,9 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
>   		} else if (dst_format == DRM_FORMAT_RGB888) {
>   			drm_fb_xrgb8888_to_rgb888(dst, dst_pitch, src, fb, clip, state);
>   			return 0;
> +		} else if (dst_format == DRM_FORMAT_BGR888) {
> +			drm_fb_xrgb8888_to_bgr888(dst, dst_pitch, src, fb, clip, state);
> +			return 0;
>   		} else if (dst_format == DRM_FORMAT_ARGB8888) {
>   			drm_fb_xrgb8888_to_argb8888(dst, dst_pitch, src, fb, clip, state);
>   			return 0;
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> index 08992636e..35cd3405d 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -60,6 +60,11 @@ struct convert_to_rgb888_result {
>   	const u8 expected[TEST_BUF_SIZE];
>   };
>   
> +struct convert_to_bgr888_result {
> +	unsigned int dst_pitch;
> +	const u8 expected[TEST_BUF_SIZE];
> +};
> +
>   struct convert_to_argb8888_result {
>   	unsigned int dst_pitch;
>   	const u32 expected[TEST_BUF_SIZE];
> @@ -107,6 +112,7 @@ struct convert_xrgb8888_case {
>   	struct convert_to_argb1555_result argb1555_result;
>   	struct convert_to_rgba5551_result rgba5551_result;
>   	struct convert_to_rgb888_result rgb888_result;
> +	struct convert_to_bgr888_result bgr888_result;
>   	struct convert_to_argb8888_result argb8888_result;
>   	struct convert_to_xrgb2101010_result xrgb2101010_result;
>   	struct convert_to_argb2101010_result argb2101010_result;
> @@ -151,6 +157,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
>   			.dst_pitch = TEST_USE_DEFAULT_PITCH,
>   			.expected = { 0x00, 0x00, 0xFF },
>   		},
> +		.bgr888_result = {
> +			.dst_pitch = TEST_USE_DEFAULT_PITCH,
> +			.expected = { 0xFF, 0x00, 0x00 },
> +		},
>   		.argb8888_result = {
>   			.dst_pitch = TEST_USE_DEFAULT_PITCH,
>   			.expected = { 0xFFFF0000 },
> @@ -217,6 +227,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
>   			.dst_pitch = TEST_USE_DEFAULT_PITCH,
>   			.expected = { 0x00, 0x00, 0xFF },
>   		},
> +		.bgr888_result = {
> +			.dst_pitch = TEST_USE_DEFAULT_PITCH,
> +			.expected = { 0xFF, 0x00, 0x00 },
> +		},
>   		.argb8888_result = {
>   			.dst_pitch = TEST_USE_DEFAULT_PITCH,
>   			.expected = { 0xFFFF0000 },
> @@ -330,6 +344,15 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
>   				0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x00,
>   			},
>   		},
> +		.bgr888_result = {
> +			.dst_pitch = TEST_USE_DEFAULT_PITCH,
> +			.expected = {
> +				0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00,
> +				0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00,
> +				0x00, 0x00, 0xFF, 0xFF, 0x00, 0xFF,
> +				0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF,
> +			},
> +		},
>   		.argb8888_result = {
>   			.dst_pitch = TEST_USE_DEFAULT_PITCH,
>   			.expected = {
> @@ -468,6 +491,17 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
>   				0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>   			},
>   		},
> +		.bgr888_result = {
> +			.dst_pitch = 15,
> +			.expected = {
> +				0x0E, 0x44, 0x9C, 0x11, 0x4D, 0x05, 0xA8, 0xF3, 0x03,
> +				0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +				0x6C, 0xF0, 0x73, 0x0E, 0x44, 0x9C, 0x11, 0x4D, 0x05,
> +				0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +				0xA8, 0x03, 0x03, 0x6C, 0xF0, 0x73, 0x0E, 0x44, 0x9C,
> +				0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +			},
> +		},
>   		.argb8888_result = {
>   			.dst_pitch = 20,
>   			.expected = {
> @@ -914,6 +948,52 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
>   	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>   }
>   
> +static void drm_test_fb_xrgb8888_to_bgr888(struct kunit *test)
> +{
> +	const struct convert_xrgb8888_case *params = test->param_value;
> +	const struct convert_to_bgr888_result *result = &params->bgr888_result;
> +	size_t dst_size;
> +	u8 *buf = NULL;
> +	__le32 *xrgb8888 = NULL;
> +	struct iosys_map dst, src;
> +
> +	struct drm_framebuffer fb = {
> +		.format = drm_format_info(DRM_FORMAT_XRGB8888),
> +		.pitches = { params->pitch, 0, 0 },
> +	};
> +
> +	dst_size = conversion_buf_size(DRM_FORMAT_BGR888, result->dst_pitch,
> +				       &params->clip, 0);
> +	KUNIT_ASSERT_GT(test, dst_size, 0);
> +
> +	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
> +	iosys_map_set_vaddr(&dst, buf);
> +
> +	xrgb8888 = cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
> +	iosys_map_set_vaddr(&src, xrgb8888);
> +
> +	/*
> +	 * BGR888 expected results are already in little-endian
> +	 * order, so there's no need to convert the test output.
> +	 */
> +	drm_fb_xrgb8888_to_bgr888(&dst, &result->dst_pitch, &src, &fb, &params->clip,
> +				  &fmtcnv_state);
> +	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
> +
> +	buf = dst.vaddr; /* restore original value of buf */
> +	memset(buf, 0, dst_size);
> +
> +	int blit_result = 0;
> +
> +	blit_result = drm_fb_blit(&dst, &result->dst_pitch, DRM_FORMAT_BGR888, &src, &fb, &params->clip,
> +				  &fmtcnv_state);
> +
> +	KUNIT_EXPECT_FALSE(test, blit_result);
> +	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
> +}
> +
>   static void drm_test_fb_xrgb8888_to_argb8888(struct kunit *test)
>   {
>   	const struct convert_xrgb8888_case *params = test->param_value;
> @@ -1851,6 +1931,7 @@ static struct kunit_case drm_format_helper_test_cases[] = {
>   	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb1555, convert_xrgb8888_gen_params),
>   	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgba5551, convert_xrgb8888_gen_params),
>   	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb888, convert_xrgb8888_gen_params),
> +	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_bgr888, convert_xrgb8888_gen_params),
>   	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb8888, convert_xrgb8888_gen_params),
>   	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_xrgb2101010, convert_xrgb8888_gen_params),
>   	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb2101010, convert_xrgb8888_gen_params),
> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
> index 428d81afe..aa1604d92 100644
> --- a/include/drm/drm_format_helper.h
> +++ b/include/drm/drm_format_helper.h
> @@ -96,6 +96,9 @@ void drm_fb_xrgb8888_to_rgba5551(struct iosys_map *dst, const unsigned int *dst_
>   void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *dst_pitch,
>   			       const struct iosys_map *src, const struct drm_framebuffer *fb,
>   			       const struct drm_rect *clip, struct drm_format_conv_state *state);
> +void drm_fb_xrgb8888_to_bgr888(struct iosys_map *dst, const unsigned int *dst_pitch,
> +			       const struct iosys_map *src, const struct drm_framebuffer *fb,
> +			       const struct drm_rect *clip, struct drm_format_conv_state *state);
>   void drm_fb_xrgb8888_to_argb8888(struct iosys_map *dst, const unsigned int *dst_pitch,
>   				 const struct iosys_map *src, const struct drm_framebuffer *fb,
>   				 const struct drm_rect *clip, struct drm_format_conv_state *state);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

