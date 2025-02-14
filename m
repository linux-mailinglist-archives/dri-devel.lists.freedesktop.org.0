Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A18A35A76
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 10:37:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C4510E48C;
	Fri, 14 Feb 2025 09:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="yBtHZag+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BfgJ5tt6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rW0P7jlv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="x6hxB4tp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CAD010E48C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 09:37:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 702A21F392;
 Fri, 14 Feb 2025 09:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739525819; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lRmX1OPbPXFwOOPiOA96HXIJ/A7S1AMVv19EVqTNOII=;
 b=yBtHZag++F9uVbqxuqrPn7U2WcaaY2f8ZNMjFBk7WtMEGsS1dCYZuheuwJqQBMGjQTwr3o
 MdBH62ViRKrHhT3tqJkWkGzdnmofpOZrqfC68r0Pif1/9Ffu9KFtp/2gERPrKzyqpcqoJS
 hLjAxYqDA/EAM6B7GGw6A57iqK4m2U4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739525819;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lRmX1OPbPXFwOOPiOA96HXIJ/A7S1AMVv19EVqTNOII=;
 b=BfgJ5tt6dWjCURDzxNmESHL24PMAhge/1CewhdFpQWdyH8qwG3FH7vdJhSR1F9EfYoMUws
 w/kULahx5wup4MAg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rW0P7jlv;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=x6hxB4tp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739525818; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lRmX1OPbPXFwOOPiOA96HXIJ/A7S1AMVv19EVqTNOII=;
 b=rW0P7jlvFT8a/u/cxedYmSueElYgCvJg3O0buJxIu/Vio6dAazCkZY7a0JqKhth6OiOW0e
 dv2w188sH1hXXrk+ZBWEfyxeySnuOu7dED1GupbLpesc7p7q+b8IgKJXD7ixZwWTB/fD7F
 BcE7tpKRu89yopCjZFy+hUx6XD2ueaU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739525818;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lRmX1OPbPXFwOOPiOA96HXIJ/A7S1AMVv19EVqTNOII=;
 b=x6hxB4tp8dJs7pS77KfvliuS4FiLu6QE7GUg9QVuOWTx/OoIQC37Bo3IzMAawRZpvEWe3Y
 A1Py4GjYgqhPV8Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 53D5513285;
 Fri, 14 Feb 2025 09:36:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id bJ8RE7oOr2faPQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 14 Feb 2025 09:36:58 +0000
Message-ID: <8acd601f-1d79-4750-9a42-04a4d2202280@suse.de>
Date: Fri, 14 Feb 2025 10:36:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/ast: cursor: Move format conversion to shared
 helper
To: airlied@redhat.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250213163845.118207-1-tzimmermann@suse.de>
 <20250213163845.118207-3-tzimmermann@suse.de>
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
In-Reply-To: <20250213163845.118207-3-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 702A21F392
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCPT_COUNT_THREE(0.00)[3];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TO_DN_NONE(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
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

Hi,

here's some additional information this patch.

Am 13.02.25 um 17:25 schrieb Thomas Zimmermann:
[...]
> +
> +		drm_fb_argb8888_to_argb4444(argb4444_dst, argb4444_dst_pitch,
> +					    shadow_plane_state->data, fb, &damage,
> +					    &shadow_plane_state->fmtcnv_state);
[...]
>   
> +static void drm_fb_argb8888_to_argb4444_line(void *dbuf, const void *sbuf, unsigned int pixels)
> +{
> +	unsigned int pixels2 = pixels & ~GENMASK_ULL(0, 0);
> +	__le32 *dbuf32 = dbuf;
> +	__le16 *dbuf16 = dbuf + pixels2 * sizeof(*dbuf16);
> +	const __le32 *sbuf32 = sbuf;
> +	unsigned int x;
> +	u32 val32;
> +	u16 val16;
> +	u32 pix[2];
> +
> +	for (x = 0; x < pixels2; x += 2, ++dbuf32) {
> +		pix[0] = le32_to_cpu(sbuf32[x]);
> +		pix[1] = le32_to_cpu(sbuf32[x + 1]);
> +		val32 = ((pix[0] & 0xf0000000) >> 16) |
> +			((pix[0] & 0x00f00000) >> 12) |
> +			((pix[0] & 0x0000f000) >> 8) |
> +			((pix[0] & 0x000000f0) >> 4) |
> +			((pix[1] & 0xf0000000) >> 0) |
> +			((pix[1] & 0x00f00000) << 4) |
> +			((pix[1] & 0x0000f000) << 8) |
> +			((pix[1] & 0x000000f0) << 12);
> +		*dbuf32 = cpu_to_le32(val32);
> +	}

This loop is an optimization. It converts two source pixels at a time 
and writes them with a 32-bit store. When I measured the impact, I was 
quite delighted by the results. I measured the time it takes to convert 
a full cursor image of 64x64 pixels with drm_fb_argb8888_to_argb4444(), 
and then looked at the average.

Without this loop in place, the average runtime stabilizes around 97K 
nsecs. Here are the final results

[  406.420664] ast 0000:02:00.0: [drm] count=8448 average=97239 nsec
[  414.869034] ast 0000:02:00.0: [drm] count=8704 average=97005 nsec
[  425.665928] ast 0000:02:00.0: [drm] count=8960 average=97096 nsec
[  435.185207] ast 0000:02:00.0: [drm] count=9216 average=96711 nsec
[  442.244948] ast 0000:02:00.0: [drm] count=9472 average=96432 nsec

Count is the number of probes. The time has been taken with ktime_get_ns().

With the additional loop, the values stabilize around 52K nsecs.

[  348.797840] ast 0000:02:00.0: [drm] count=8448 average=51729
[  356.503387] ast 0000:02:00.0: [drm] count=8704 average=51680
[  364.151804] ast 0000:02:00.0: [drm] count=8960 average=51574
[  372.412221] ast 0000:02:00.0: [drm] count=9216 average=51563
[  425.158072] ast 0000:02:00.0: [drm] count=9472 average=51674

That's only ~53% of the unoptimized case.

Given these results, I'll try to add similar optimizations to other 
format-conversion helpers. Most of the format conversion happens for 
drivers with only a single output format, such as simpledrm. For 
full-screen pageflips on such drivers, it might even make a visible 
difference.

Best regards
Thomas


> +	for (; x < pixels; x++) {
> +		pix[0] = le32_to_cpu(sbuf32[x]);
> +		val16 = ((pix[0] & 0xf0000000) >> 16) |
> +			((pix[0] & 0x00f00000) >> 12) |
> +			((pix[0] & 0x0000f000) >> 8) |
> +			((pix[0] & 0x000000f0) >> 4);
> +		dbuf16[x] = cpu_to_le16(val16);
> +	}
> +}
> +
> +/**
> + * drm_fb_argb8888_to_argb4444 - Convert ARGB8888 to ARGB4444 clip buffer
> + * @dst: Array of ARGB4444 destination buffers
> + * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
> + *             within @dst; can be NULL if scanlines are stored next to each other.
> + * @src: Array of ARGB8888 source buffer
> + * @fb: DRM framebuffer
> + * @clip: Clip rectangle area to copy
> + * @state: Transform and conversion state
> + *
> + * This function copies parts of a framebuffer to display memory and converts
> + * the color format during the process. The parameters @dst, @dst_pitch and
> + * @src refer to arrays. Each array must have at least as many entries as
> + * there are planes in @fb's format. Each entry stores the value for the
> + * format's respective color plane at the same index.
> + *
> + * This function does not apply clipping on @dst (i.e. the destination is at the
> + * top-left corner).
> + *
> + * Drivers can use this function for ARGB4444 devices that don't support
> + * ARGB8888 natively.
> + */
> +void drm_fb_argb8888_to_argb4444(struct iosys_map *dst, const unsigned int *dst_pitch,
> +				 const struct iosys_map *src, const struct drm_framebuffer *fb,
> +				 const struct drm_rect *clip, struct drm_format_conv_state *state)
> +{
> +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> +		2,
> +	};
> +
> +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
> +		    drm_fb_argb8888_to_argb4444_line);
> +}
> +EXPORT_SYMBOL(drm_fb_argb8888_to_argb4444);
> +
>   /**
>    * drm_fb_blit - Copy parts of a framebuffer to display memory
>    * @dst:	Array of display-memory addresses to copy to
> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
> index 428d81afe215..a1347e47e9d5 100644
> --- a/include/drm/drm_format_helper.h
> +++ b/include/drm/drm_format_helper.h
> @@ -110,6 +110,9 @@ void drm_fb_xrgb8888_to_argb2101010(struct iosys_map *dst, const unsigned int *d
>   void drm_fb_xrgb8888_to_gray8(struct iosys_map *dst, const unsigned int *dst_pitch,
>   			      const struct iosys_map *src, const struct drm_framebuffer *fb,
>   			      const struct drm_rect *clip, struct drm_format_conv_state *state);
> +void drm_fb_argb8888_to_argb4444(struct iosys_map *dst, const unsigned int *dst_pitch,
> +				 const struct iosys_map *src, const struct drm_framebuffer *fb,
> +				 const struct drm_rect *clip, struct drm_format_conv_state *state);
>   
>   int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t dst_format,
>   		const struct iosys_map *src, const struct drm_framebuffer *fb,

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

