Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5194B38025
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 12:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B790110E7B3;
	Wed, 27 Aug 2025 10:45:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="nldB+EoF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LfQIUzoO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nldB+EoF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LfQIUzoO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785D010E7AA
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 10:45:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2AEC4201BB;
 Wed, 27 Aug 2025 10:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756291530; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LADyVS0IBCn/UWZDRFZWgxXb5urQnxMmE+NiXZ01XYE=;
 b=nldB+EoFXloFZm1hpBz4VV2oGxvKnRO4dRb6uEOYulMOTKKkWYoPlt8G0zV/iJLRck5p3P
 cJZ2u9rGIxx0BDpZWfflljQL9icQGOEx3NmlBfeOFMxlJEbGxc04MSRcTAQ41mEEhP0qYM
 XGZkjzRbvn3r50AFwhFFeYtcDEmWU/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756291530;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LADyVS0IBCn/UWZDRFZWgxXb5urQnxMmE+NiXZ01XYE=;
 b=LfQIUzoOQbOBijWKJxAP2gm7W11lsc5XLz9O1lYXVtRM4M+K+9qVeekSTrorCj2nezNHoE
 nMpsCPunqqvjD0BA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756291530; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LADyVS0IBCn/UWZDRFZWgxXb5urQnxMmE+NiXZ01XYE=;
 b=nldB+EoFXloFZm1hpBz4VV2oGxvKnRO4dRb6uEOYulMOTKKkWYoPlt8G0zV/iJLRck5p3P
 cJZ2u9rGIxx0BDpZWfflljQL9icQGOEx3NmlBfeOFMxlJEbGxc04MSRcTAQ41mEEhP0qYM
 XGZkjzRbvn3r50AFwhFFeYtcDEmWU/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756291530;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LADyVS0IBCn/UWZDRFZWgxXb5urQnxMmE+NiXZ01XYE=;
 b=LfQIUzoOQbOBijWKJxAP2gm7W11lsc5XLz9O1lYXVtRM4M+K+9qVeekSTrorCj2nezNHoE
 nMpsCPunqqvjD0BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DC81913310;
 Wed, 27 Aug 2025 10:45:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id VSOkNMnhrmhmMAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Aug 2025 10:45:29 +0000
Message-ID: <923276d2-9240-48bd-95df-13b4e9e23dcd@suse.de>
Date: Wed, 27 Aug 2025 12:45:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/panic: Add a kconfig option to dump kunits
 results to png
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250821095228.648156-1-jfalempe@redhat.com>
 <20250821095228.648156-4-jfalempe@redhat.com>
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
In-Reply-To: <20250821095228.648156-4-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_SEVEN(0.00)[8]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -4.30
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

Am 21.08.25 um 11:49 schrieb Jocelyn Falempe:
> This is a bit hacky, but very handy if you want to customize the
> panic screen.
> It allows to dump the generated images to the logs, and then a python
> script can convert it to .png files. It makes it easy to check how
> the panic screen will look on different resolutions, without having
> to crash a VM.
> To not pollute the logs, it uses a monochrome framebuffer, compress
> it with zlib, and base64 encode it.

May I suggest to export the raw image via debugfs? Debugfs can also 
export additional information in additional files, such as 
width/height/stride/format. This could provide the real/last image on 
the fly, simply by reading the files. No workarounds or encodings needed.

Best regards
Thomas

>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>   drivers/gpu/drm/Kconfig.debug          |  14 ++++
>   drivers/gpu/drm/tests/drm_panic_test.c | 111 +++++++++++++++++++++++++
>   scripts/kunitpanic2png.py              |  53 ++++++++++++
>   3 files changed, 178 insertions(+)
>   create mode 100755 scripts/kunitpanic2png.py
>
> diff --git a/drivers/gpu/drm/Kconfig.debug b/drivers/gpu/drm/Kconfig.debug
> index 05dc43c0b8c5..d8ae85132d32 100644
> --- a/drivers/gpu/drm/Kconfig.debug
> +++ b/drivers/gpu/drm/Kconfig.debug
> @@ -84,6 +84,20 @@ config DRM_KUNIT_TEST
>   
>   	  If in doubt, say "N".
>   
> +config DRM_PANIC_KUNIT_TEST_DUMP
> +	bool "Enable screen dump to logs in KUnit tests for drm_panic"
> +	default n
> +	depends on DRM && DRM_PANIC && DRM_KUNIT_TEST
> +	select ZLIB_DEFLATE
> +	help
> +	  This allows to dump the panic screen to the KUnit tests logs.
> +	  It's possible with a small python script to write pngs from the logs.
> +
> +	  This is only to help developers customizing the drm_panic screen,
> +	  checking the result for different resolutions.
> +
> +	  If in doubt, say "N"
> +
>   config DRM_TTM_KUNIT_TEST
>   	tristate "KUnit tests for TTM" if !KUNIT_ALL_TESTS
>   	default n
> diff --git a/drivers/gpu/drm/tests/drm_panic_test.c b/drivers/gpu/drm/tests/drm_panic_test.c
> index 46ff3e5e0e5d..8cddb845aea9 100644
> --- a/drivers/gpu/drm/tests/drm_panic_test.c
> +++ b/drivers/gpu/drm/tests/drm_panic_test.c
> @@ -115,24 +115,135 @@ static void drm_test_panic_screen_user_page(struct kunit *test)
>   	kfree(pages);
>   }
>   
> +#ifdef CONFIG_DRM_PANIC_KUNIT_TEST_DUMP
> +#include <linux/base64.h>
> +#include <linux/delay.h>
> +#include <linux/zlib.h>
> +
> +#define LINE_LEN 128
> +
> +#define COMPR_LEVEL 6
> +#define WINDOW_BITS 12
> +#define MEM_LEVEL 4
> +
> +static int compress_image(u8 *src, int size, u8 *dst)
> +{
> +	struct z_stream_s stream;
> +
> +	stream.workspace = kmalloc(zlib_deflate_workspacesize(WINDOW_BITS, MEM_LEVEL),
> +				   GFP_KERNEL);
> +
> +	if (zlib_deflateInit2(&stream, COMPR_LEVEL, Z_DEFLATED, WINDOW_BITS,
> +			      MEM_LEVEL, Z_DEFAULT_STRATEGY) != Z_OK)
> +		return -EINVAL;
> +
> +	stream.next_in = src;
> +	stream.avail_in = size;
> +	stream.total_in = 0;
> +	stream.next_out = dst;
> +	stream.avail_out = size;
> +	stream.total_out = 0;
> +
> +	if (zlib_deflate(&stream, Z_FINISH) != Z_STREAM_END)
> +		return -EINVAL;
> +
> +	if (zlib_deflateEnd(&stream) != Z_OK)
> +		return -EINVAL;
> +
> +	kfree(stream.workspace);
> +
> +	return stream.total_out;
> +}
> +
> +static void dump_image(u8 *fb, unsigned int width, unsigned int height)
> +{
> +	int len = 0;
> +	char *dst;
> +	char *compressed;
> +	int sent = 0;
> +	int stride = DIV_ROUND_UP(width, 8);
> +	int size = stride * height;
> +
> +	compressed = vzalloc(size);
> +	if (!compressed)
> +		return;
> +	len = compress_image(fb, size, compressed);
> +	if (len < 0) {
> +		pr_err("Compression failed %d", len);
> +		return;
> +	}
> +
> +	dst = vzalloc(4 * DIV_ROUND_UP(len, 3) + 1);
> +	if (!dst)
> +		return;
> +
> +	len = base64_encode(compressed, len, dst);
> +
> +	pr_info("KUNIT PANIC IMAGE DUMP START %dx%d", width, height);
> +	while (len > 0) {
> +		char save = dst[sent + LINE_LEN];
> +
> +		dst[sent + LINE_LEN] = 0;
> +		pr_info("%s", dst + sent);
> +		dst[sent + LINE_LEN] = save;
> +		sent += LINE_LEN;
> +		len -= LINE_LEN;
> +	}
> +	pr_info("KUNIT PANIC IMAGE DUMP END");
> +	vfree(compressed);
> +	vfree(dst);
> +
> +}
> +
> +// Ignore pixel format, use 1bit per pixel in monochrome.
>   static void drm_test_panic_set_pixel(struct drm_scanout_buffer *sb,
>   				     unsigned int x,
>   				     unsigned int y,
>   				     u32 color)
>   {
> +	int stride = DIV_ROUND_UP(sb->width, 8);
> +	size_t off = x / 8 + y * stride;
> +	u8 shift = 7 - (x % 8);
> +	u8 *fb = (u8 *) sb->private;
> +
> +	if (color)
> +		fb[off] |= 1 << shift;
> +	else
> +		fb[off] &= ~(1 << shift);
>   }
>   
> +#else
> +static void dump_image(u8 *fb, unsigned int width, unsigned int height) {}
> +static void drm_test_panic_set_pixel(struct drm_scanout_buffer *sb,
> +				     unsigned int x,
> +				     unsigned int y,
> +				     u32 color)
> +{
> +}
> +#endif
> +
>   static void drm_test_panic_screen_user_set_pixel(struct kunit *test)
>   {
>   	struct drm_scanout_buffer *sb = test->priv;
>   	const struct drm_test_mode *params = test->param_value;
> +	int fb_size;
> +	u8 *fb;
>   
>   	sb->format = drm_format_info(params->format);
> +	fb_size = DIV_ROUND_UP(params->width, 8) * params->height;
> +
> +	fb = vzalloc(fb_size);
> +	KUNIT_ASSERT_NOT_NULL(test, fb);
> +	sb->private = fb;
>   	sb->set_pixel = drm_test_panic_set_pixel;
>   	sb->width = params->width;
>   	sb->height = params->height;
>   
>   	params->draw_screen(sb);
> +	if (params->format == DRM_FORMAT_XRGB8888)
> +		dump_image(fb, sb->width, sb->height);
> +
> +	vfree(fb);
>   }
>   
>   static void drm_test_panic_desc(const struct drm_test_mode *t, char *desc)
> diff --git a/scripts/kunitpanic2png.py b/scripts/kunitpanic2png.py
> new file mode 100755
> index 000000000000..e292afd7422c
> --- /dev/null
> +++ b/scripts/kunitpanic2png.py
> @@ -0,0 +1,53 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: MIT
> +#
> +# Copyright (c) 2025 Red Hat.
> +# Author: Jocelyn Falempe <jfalempe@redhat.com>
> +
> +from argparse import ArgumentParser
> +from PIL import Image
> +import base64
> +import zlib
> +
> +def get_dim(s):
> +    (w, h) = s.split('x')
> +    return (int(w), int(h))
> +
> +def draw_image(img_data, width, height, n_img):
> +
> +    decoded = base64.b64decode(img_data)
> +    unzipped = zlib.decompress(decoded)
> +
> +    img = Image.frombytes("1", (width, height), unzipped)
> +    fname = f"panic_screen_{n_img}.png"
> +    img.save(fname)
> +    print(f"Image {width}x{height} saved to {fname}")
> +
> +def main():
> +    parser = ArgumentParser(
> +        prog="kunitpanic2png",
> +        description="Read drm_panic kunit logs and translate that to png files")
> +
> +    parser.add_argument("filename", help="log file from kunit, usually test.log")
> +
> +    parsing_img = False
> +    img_data = ""
> +    n_img = 0
> +
> +    args = parser.parse_args()
> +    with open(args.filename, "r") as f:
> +        for line in f.readlines():
> +            if line.startswith("KUNIT PANIC IMAGE DUMP START"):
> +                parsing_img = True
> +                width, height = get_dim(line.split()[-1])
> +                continue
> +            if line.startswith("KUNIT PANIC IMAGE DUMP END"):
> +                draw_image(img_data, width, height, n_img)
> +                parsing_img = False
> +                img_data = ""
> +                n_img += 1
> +                continue
> +            if parsing_img:
> +                img_data += line.strip()
> +
> +main()

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


