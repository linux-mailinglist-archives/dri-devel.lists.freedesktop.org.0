Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1385A6519C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 14:47:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206B410E16B;
	Mon, 17 Mar 2025 13:47:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="mMUN14ej";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K3gzDXN3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hFCqzy/f";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JENJ1i2L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A0C10E16B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 13:47:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 97CD31FD5B;
 Mon, 17 Mar 2025 13:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742219272; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dRhR/SEEgxNhRjVTZg4DS7awgzsZvYLlZzIR8C0XFUQ=;
 b=mMUN14ejY0k4b9nn1/c81fA6s/Yq2z13TV3hD1dCuXpwFJQqjV0cWaLIqG9IDnAvmWrQE/
 INyinAYAs9TRBtnrae0WwPMI6rZmejysGq98HkIyx3gvE9nF4twRB/ZYtS9wYYC9UU6Wfv
 uLy5+FzqIakN2JrCqhu0PFzjf+2JABg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742219272;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dRhR/SEEgxNhRjVTZg4DS7awgzsZvYLlZzIR8C0XFUQ=;
 b=K3gzDXN3GtyrHN00I0NCML9g7s7iCpLFEfbd9akDAQ4jy2dXNGbfBGuc27xuZ4TcrLzPoF
 v1qkPNcWKTAbtADw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="hFCqzy/f";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JENJ1i2L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742219271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dRhR/SEEgxNhRjVTZg4DS7awgzsZvYLlZzIR8C0XFUQ=;
 b=hFCqzy/fPiJ6AN1kkEDZlZbUMjn9qtHibNrXA5mfiFaFF1znNoAl4wkgUi5Efu8dJYjmNc
 9eu5OB9Q0E/r5TyjyuddGPbs0MA1kbxNlcaGwGm98hwjMHr7/FirtvV9RN87t2DMdXfDKc
 otSIWZ8KClUkpPtggXRNZSgbO4RvQsY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742219271;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dRhR/SEEgxNhRjVTZg4DS7awgzsZvYLlZzIR8C0XFUQ=;
 b=JENJ1i2LvWgVknCdJdHX0cfNlSnU+EVI6ZRqFkG5tZJax7vYVd7OB7A9YIL0LtqfAjrWMr
 /3dLc92NqbVuSPCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5661D132CF;
 Mon, 17 Mar 2025 13:47:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MY0kEwco2GeXYQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Mar 2025 13:47:51 +0000
Message-ID: <463d7a7e-00ac-451d-8841-df51dcca32e9@suse.de>
Date: Mon, 17 Mar 2025 14:47:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: Add support to scanout buffer as array of pages
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ryosuke Yasuoka <ryasuoka@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org
References: <20250313094257.1705916-1-jfalempe@redhat.com>
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
In-Reply-To: <20250313094257.1705916-1-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 97CD31FD5B
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 URIBL_BLOCKED(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; DKIM_TRACE(0.00)[suse.de:+];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_TLS_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[8]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]
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

Am 13.03.25 um 10:42 schrieb Jocelyn Falempe:
> Some drivers like virtio-gpu, don't map the scanout buffer in the
> kernel. Calling vmap() in a panic handler is not safe, and writing an
> atomic_vmap() API is more complex than expected [1].
> So instead, pass the array of pages of the scanout buffer to the
> panic handler, and map only one page at a time to draw the pixels.
> This is obviously slow, but acceptable for a panic handler.

It seems this could still be optimized by writing multiple pixels at 
once if they are located on the same pages. Although it's not really 
necessary.

>
> [1] https://lore.kernel.org/dri-devel/20250305152555.318159-1-ryasuoka@redhat.com/
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

> ---
>   drivers/gpu/drm/drm_panic.c | 139 ++++++++++++++++++++++++++++++++++--
>   include/drm/drm_panic.h     |  10 ++-
>   2 files changed, 142 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index ab42a2b1567d..e10ab8fe847c 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -7,6 +7,7 @@
>    */
>   
>   #include <linux/font.h>
> +#include <linux/highmem.h>
>   #include <linux/init.h>
>   #include <linux/iosys-map.h>
>   #include <linux/kdebug.h>
> @@ -154,6 +155,87 @@ static void drm_panic_blit_pixel(struct drm_scanout_buffer *sb, struct drm_rect
>   				sb->set_pixel(sb, clip->x1 + x, clip->y1 + y, fg_color);
>   }
>   
> +static void drm_panic_write_pixel16(void *vaddr, unsigned int offset, u16 color)
> +{
> +	u16 *p = vaddr + offset;
> +
> +	*p = color;
> +}
> +
> +static void drm_panic_write_pixel24(void *vaddr, unsigned int offset, u32 color)
> +{
> +	u8 *p = vaddr + offset;
> +
> +	*p++ = color & 0xff;
> +	color >>= 8;
> +	*p++ = color & 0xff;
> +	color >>= 8;
> +	*p = color & 0xff;
> +}
> +
> +static void drm_panic_write_pixel32(void *vaddr, unsigned int offset, u32 color)
> +{
> +	u32 *p = vaddr + offset;
> +
> +	*p = color;
> +}
> +
> +static void drm_panic_write_pixel(void *vaddr, unsigned int offset, u32 color, unsigned int cpp)
> +{
> +	switch (cpp) {
> +	case 2:
> +		drm_panic_write_pixel16(vaddr, offset, color);
> +		break;
> +	case 3:
> +		drm_panic_write_pixel24(vaddr, offset, color);
> +		break;
> +	case 4:
> +		drm_panic_write_pixel32(vaddr, offset, color);
> +		break;
> +	default:
> +		DRM_WARN_ONCE("Can't blit with pixel width %d\n", cpp);
> +	}
> +}
> +
> +/*
> + * The scanout buffer pages are not mapped, so for each pixel,
> + * use kmap_local_page() to map the page, and write the pixel.
> + * Tries to keep the map from the previous pixel, to avoid too much map/unmap.
> + */
> +static void drm_panic_blit_page(struct page **pages, unsigned int dpitch,
> +				unsigned int cpp, const u8 *sbuf8,
> +				unsigned int spitch, struct drm_rect *clip,
> +				unsigned int scale, u32 fg32)
> +{
> +	unsigned int y, x;
> +	unsigned int page = ~0;
> +	unsigned int height = drm_rect_height(clip);
> +	unsigned int width = drm_rect_width(clip);
> +	void *vaddr = NULL;
> +
> +	for (y = 0; y < height; y++) {
> +		for (x = 0; x < width; x++) {
> +			if (drm_draw_is_pixel_fg(sbuf8, spitch, x / scale, y / scale)) {
> +				unsigned int new_page;
> +				unsigned int offset;
> +
> +				offset = (y + clip->y1) * dpitch + (x + clip->x1) * cpp;
> +				new_page = offset >> PAGE_SHIFT;
> +				offset = offset % PAGE_SIZE;
> +				if (new_page != page) {
> +					if (vaddr)
> +						kunmap_local(vaddr);
> +					page = new_page;
> +					vaddr = kmap_local_page(pages[page]);
> +				}
> +				drm_panic_write_pixel(vaddr, offset, fg32, cpp);
> +			}
> +		}
> +	}
> +	if (vaddr)
> +		kunmap_local(vaddr);
> +}
> +
>   /*
>    * drm_panic_blit - convert a monochrome image to a linear framebuffer
>    * @sb: destination scanout buffer
> @@ -177,6 +259,10 @@ static void drm_panic_blit(struct drm_scanout_buffer *sb, struct drm_rect *clip,
>   	if (sb->set_pixel)
>   		return drm_panic_blit_pixel(sb, clip, sbuf8, spitch, scale, fg_color);
>   
> +	if (sb->pages)
> +		return drm_panic_blit_page(sb->pages, sb->pitch[0], sb->format->cpp[0],
> +					   sbuf8, spitch, clip, scale, fg_color);
> +
>   	map = sb->map[0];
>   	iosys_map_incr(&map, clip->y1 * sb->pitch[0] + clip->x1 * sb->format->cpp[0]);
>   
> @@ -209,6 +295,35 @@ static void drm_panic_fill_pixel(struct drm_scanout_buffer *sb,
>   			sb->set_pixel(sb, clip->x1 + x, clip->y1 + y, color);
>   }
>   
> +static void drm_panic_fill_page(struct page **pages, unsigned int dpitch,
> +				unsigned int cpp, struct drm_rect *clip,
> +				u32 color)
> +{
> +	unsigned int y, x;
> +	unsigned int page = ~0;
> +	void *vaddr = NULL;
> +
> +	for (y = clip->y1; y < clip->y2; y++) {
> +		for (x = clip->x1; x < clip->x2; x++) {
> +			unsigned int new_page;
> +			unsigned int offset;
> +
> +			offset = y * dpitch + x * cpp;
> +			new_page = offset >> PAGE_SHIFT;
> +			offset = offset % PAGE_SIZE;
> +			if (new_page != page) {
> +				if (vaddr)
> +					kunmap_local(vaddr);
> +				page = new_page;
> +				vaddr = kmap_local_page(pages[page]);
> +			}
> +			drm_panic_write_pixel(vaddr, offset, color, cpp);
> +		}
> +	}
> +	if (vaddr)
> +		kunmap_local(vaddr);
> +}
> +
>   /*
>    * drm_panic_fill - Fill a rectangle with a color
>    * @sb: destination scanout buffer
> @@ -225,6 +340,10 @@ static void drm_panic_fill(struct drm_scanout_buffer *sb, struct drm_rect *clip,
>   	if (sb->set_pixel)
>   		return drm_panic_fill_pixel(sb, clip, color);
>   
> +	if (sb->pages)
> +		return drm_panic_fill_page(sb->pages, sb->pitch[0], sb->format->cpp[0],
> +					   clip, color);
> +
>   	map = sb->map[0];
>   	iosys_map_incr(&map, clip->y1 * sb->pitch[0] + clip->x1 * sb->format->cpp[0]);
>   
> @@ -714,16 +833,24 @@ static void draw_panic_plane(struct drm_plane *plane, const char *description)
>   	if (!drm_panic_trylock(plane->dev, flags))
>   		return;
>   
> +	ret = plane->helper_private->get_scanout_buffer(plane, &sb);
> +
> +	if (ret || !drm_panic_is_format_supported(sb.format))
> +		goto unlock;
> +
> +	/* One of these should be set, or it can't draw pixels */
> +	if (!sb.set_pixel && !sb.pages && iosys_map_is_null(&sb.map[0]))
> +		goto unlock;
> +
>   	drm_panic_set_description(description);
>   
> -	ret = plane->helper_private->get_scanout_buffer(plane, &sb);
> +	draw_panic_dispatch(&sb);
> +	if (plane->helper_private->panic_flush)
> +		plane->helper_private->panic_flush(plane);
>   
> -	if (!ret && drm_panic_is_format_supported(sb.format)) {
> -		draw_panic_dispatch(&sb);
> -		if (plane->helper_private->panic_flush)
> -			plane->helper_private->panic_flush(plane);
> -	}
>   	drm_panic_clear_description();
> +
> +unlock:
>   	drm_panic_unlock(plane->dev, flags);
>   }
>   
> diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
> index f4e1fa9ae607..8b91a13347b9 100644
> --- a/include/drm/drm_panic.h
> +++ b/include/drm/drm_panic.h
> @@ -39,6 +39,14 @@ struct drm_scanout_buffer {
>   	 */
>   	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
>   
> +	/**
> +	 * @pages: Optional, if the scanout buffer is not mapped, set this field
> +	 * to the array of pages of the scanout buffer. The panic code will use
> +	 * kmap_local_page() to map one page at a time to write all the pixels.
> +	 * The scanout buffer should be in linear format.
> +	 */
> +	struct page **pages;
> +
>   	/**
>   	 * @width: Width of the scanout buffer, in pixels.
>   	 */
> @@ -57,7 +65,7 @@ struct drm_scanout_buffer {
>   	/**
>   	 * @set_pixel: Optional function, to set a pixel color on the
>   	 * framebuffer. It allows to handle special tiling format inside the
> -	 * driver.
> +	 * driver. It takes precedence over the @map and @pages fields.
>   	 */
>   	void (*set_pixel)(struct drm_scanout_buffer *sb, unsigned int x,
>   			  unsigned int y, u32 color);
>
> base-commit: 9e75b6ef407fee5d4ed8021cd7ddd9d6a8f7b0e8

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

