Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F23069317C1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 17:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7BEC10E428;
	Mon, 15 Jul 2024 15:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Hw2w9myB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z0aptu9H";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Hw2w9myB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z0aptu9H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9ADF10E41F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 15:38:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B1FFA1F82C;
 Mon, 15 Jul 2024 15:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1721057883; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=x+/eXO5Vbhq2SkyYs+SHHA+EOO2LjtVuExOgwHIdVAI=;
 b=Hw2w9myBuDjhrxmN1idro7Cf233KXB+MrTWSy2N76Pew2nF6Gsyybyh0v3UB5ioEOCFlKV
 icvRHgmby1YL9xkSJt8kkZ1hkmwTJI71AcwLEmmIygBHv0BelHJvRKs45Wfr5bxhgyfaB7
 WyIXGSEZg4QknMu22Mivr7Uh+9ymvfk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1721057883;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=x+/eXO5Vbhq2SkyYs+SHHA+EOO2LjtVuExOgwHIdVAI=;
 b=z0aptu9Hemsv6L8XIUj1kwZYXloxjtvYSZN7MJayvSxBbV47ByhELwpkMgmxekkUqg4FyS
 Unj1HYPTHDfoZ2BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1721057883; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=x+/eXO5Vbhq2SkyYs+SHHA+EOO2LjtVuExOgwHIdVAI=;
 b=Hw2w9myBuDjhrxmN1idro7Cf233KXB+MrTWSy2N76Pew2nF6Gsyybyh0v3UB5ioEOCFlKV
 icvRHgmby1YL9xkSJt8kkZ1hkmwTJI71AcwLEmmIygBHv0BelHJvRKs45Wfr5bxhgyfaB7
 WyIXGSEZg4QknMu22Mivr7Uh+9ymvfk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1721057883;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=x+/eXO5Vbhq2SkyYs+SHHA+EOO2LjtVuExOgwHIdVAI=;
 b=z0aptu9Hemsv6L8XIUj1kwZYXloxjtvYSZN7MJayvSxBbV47ByhELwpkMgmxekkUqg4FyS
 Unj1HYPTHDfoZ2BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 652DF134AB;
 Mon, 15 Jul 2024 15:38:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id jhh7F1tClWZmBAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 15 Jul 2024 15:38:03 +0000
Message-ID: <aa140df8-efc0-49f0-9c65-64bee7cc437e@suse.de>
Date: Mon, 15 Jul 2024 17:38:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/vkms: Fix cpu_to_le16()/le16_to_cpu() warnings
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 rodrigosiqueiramelo@gmail.com
Cc: melissa.srw@gmail.com, mairacanal@riseup.net, hamohammed.sa@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, louis.chauvet@bootlin.com
References: <20240715151625.6968-2-jose.exposito89@gmail.com>
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
In-Reply-To: <20240715151625.6968-2-jose.exposito89@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.79 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; RCVD_TLS_ALL(0.00)[]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 TAGGED_RCPT(0.00)[]; RCPT_COUNT_TWELVE(0.00)[12];
 FREEMAIL_TO(0.00)[gmail.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[gmail.com,riseup.net,ffwll.ch,linux.intel.com,kernel.org,lists.freedesktop.org,vger.kernel.org,bootlin.com];
 MID_RHS_MATCH_FROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_COUNT_TWO(0.00)[2];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -2.79
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

Am 15.07.24 um 17:16 schrieb José Expósito:
> Building with Sparse enabled prints this warning for cpu_to_le16()
> calls:
>
>      warning: incorrect type in assignment (different base types)
>          expected unsigned short [usertype]
>          got restricted __le16 [usertype]
>
> And this warning for le16_to_cpu() calls:
>
>      warning: cast to restricted __le16
>
> Declare the target buffer as __le16 to fix both warnings.
>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
>
> ---
>
> v1 -> v2: https://lore.kernel.org/dri-devel/20240712161656.7480-1-jose.exposito89@gmail.com/T/
>
>   - Thomas Zimmermann: Declare "pixels" cariable as __le16 instead of
>     multiple casting.
> ---
>   drivers/gpu/drm/vkms/vkms_formats.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 36046b12f296..1ff535222bd4 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -75,7 +75,7 @@ static void XRGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixe
>   
>   static void ARGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
>   {
> -	u16 *pixels = (u16 *)src_pixels;
> +	__le16 *pixels = (__force __le16 *)src_pixels;
>   
>   	out_pixel->a = le16_to_cpu(pixels[3]);
>   	out_pixel->r = le16_to_cpu(pixels[2]);
> @@ -85,7 +85,7 @@ static void ARGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_
>   
>   static void XRGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
>   {
> -	u16 *pixels = (u16 *)src_pixels;
> +	__le16 *pixels = (__force __le16 *)src_pixels;
>   
>   	out_pixel->a = (u16)0xffff;
>   	out_pixel->r = le16_to_cpu(pixels[2]);
> @@ -95,7 +95,7 @@ static void XRGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_
>   
>   static void RGB565_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
>   {
> -	u16 *pixels = (u16 *)src_pixels;
> +	__le16 *pixels = (__force __le16 *)src_pixels;
>   
>   	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
>   	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
> @@ -178,7 +178,7 @@ static void argb_u16_to_XRGB8888(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel
>   
>   static void argb_u16_to_ARGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
>   {
> -	u16 *pixels = (u16 *)dst_pixels;
> +	__le16 *pixels = (__force __le16 *)dst_pixels;
>   
>   	pixels[3] = cpu_to_le16(in_pixel->a);
>   	pixels[2] = cpu_to_le16(in_pixel->r);
> @@ -188,9 +188,9 @@ static void argb_u16_to_ARGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_p
>   
>   static void argb_u16_to_XRGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
>   {
> -	u16 *pixels = (u16 *)dst_pixels;
> +	__le16 *pixels = (__force __le16 *)dst_pixels;
>   
> -	pixels[3] = 0xffff;
> +	pixels[3] = (__force __le16)0xffff;

I'd use cpu_to_le16() even on the constant. It makes it clear what is 
happening, makes __le16 opaque, and avoids the ugly cast.

In any case

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

>   	pixels[2] = cpu_to_le16(in_pixel->r);
>   	pixels[1] = cpu_to_le16(in_pixel->g);
>   	pixels[0] = cpu_to_le16(in_pixel->b);
> @@ -198,7 +198,7 @@ static void argb_u16_to_XRGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_p
>   
>   static void argb_u16_to_RGB565(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
>   {
> -	u16 *pixels = (u16 *)dst_pixels;
> +	__le16 *pixels = (__force __le16 *)dst_pixels;
>   
>   	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
>   	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

