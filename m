Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DC0C1EED3
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 09:14:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0D910E8D3;
	Thu, 30 Oct 2025 08:14:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="2GRQsYX9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nhVq0p+9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2GRQsYX9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nhVq0p+9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7303B10E8D1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 08:14:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2169F1F7E3;
 Thu, 30 Oct 2025 08:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761812090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zg/HAv0N7EVaZS2P2ybjuArg8WOPmUdYPsWhPYFHlW8=;
 b=2GRQsYX9jlqNiFilLpRjSKeiB/3Nfr+4SrJSYnwMuAUrain+ZxFTu/BSK3b0mbzBk2PRAS
 SrbPaV/mfIlj7Hmgb+u4RFJ8L2RWQfDzvO9pR0COVcv2TY8zi4DePYw17BpfygbHe4GFHM
 NF41lZh/CuQhwAwYYl30ZfSyH3zc7Us=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761812090;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zg/HAv0N7EVaZS2P2ybjuArg8WOPmUdYPsWhPYFHlW8=;
 b=nhVq0p+97IlA0klUNNJhSKiteqihA1UIETQkf6pcy6vtJvljLi1Siv1liDK8nXQobinj/2
 gfH4kVdJH8Yma8DQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761812090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zg/HAv0N7EVaZS2P2ybjuArg8WOPmUdYPsWhPYFHlW8=;
 b=2GRQsYX9jlqNiFilLpRjSKeiB/3Nfr+4SrJSYnwMuAUrain+ZxFTu/BSK3b0mbzBk2PRAS
 SrbPaV/mfIlj7Hmgb+u4RFJ8L2RWQfDzvO9pR0COVcv2TY8zi4DePYw17BpfygbHe4GFHM
 NF41lZh/CuQhwAwYYl30ZfSyH3zc7Us=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761812090;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zg/HAv0N7EVaZS2P2ybjuArg8WOPmUdYPsWhPYFHlW8=;
 b=nhVq0p+97IlA0klUNNJhSKiteqihA1UIETQkf6pcy6vtJvljLi1Siv1liDK8nXQobinj/2
 gfH4kVdJH8Yma8DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DFE3F13393;
 Thu, 30 Oct 2025 08:14:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ibvSNXkeA2lzKAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 30 Oct 2025 08:14:49 +0000
Message-ID: <86a0cf86-42e6-430b-b193-f60d6182f416@suse.de>
Date: Thu, 30 Oct 2025 09:14:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the backlight tree with the drm-misc
 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Lee Jones <lee@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: Kaustabh Chakraborty <kauschluss@disroot.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20251030151428.3c1f11ea@canb.auug.org.au>
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
In-Reply-To: <20251030151428.3c1f11ea@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; RCPT_COUNT_SEVEN(0.00)[9];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_DN_ALL(0.00)[]; FROM_HAS_DN(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.de:mid,
 suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -4.30
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

Am 30.10.25 um 05:14 schrieb Stephen Rothwell:
> Hi all,
>
> After merging the backlight tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/gpu/drm/panel/panel-synaptics-tddi.c:41:41: error: array type has incomplete element type 'struct regulator_bulk_data'
>     41 | static const struct regulator_bulk_data tddi_supplies[] = {
>        |                                         ^~~~~~~~~~~~~
> drivers/gpu/drm/panel/panel-synaptics-tddi.c: In function 'tddi_prepare':
> drivers/gpu/drm/panel/panel-synaptics-tddi.c:72:15: error: implicit declaration of function 'regulator_bulk_enable' [-Wimplicit-function-declaration]
>     72 |         ret = regulator_bulk_enable(ARRAY_SIZE(tddi_supplies), ctx->supplies);
>        |               ^~~~~~~~~~~~~~~~~~~~~
> In file included from include/linux/dev_printk.h:14,
>                   from include/linux/device.h:15,
>                   from include/linux/backlight.h:12,
>                   from drivers/gpu/drm/panel/panel-synaptics-tddi.c:8:
> include/linux/compiler.h:201:82: error: expression in static assertion is not an integer
>    201 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
>        |                                                                                  ^
> include/linux/compiler.h:206:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
>    206 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
>        |                                 ^~~~~~~~~~~~~~~~~~~~~~~
> include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
>     11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
>        |                                                           ^~~~~~~~~~~~~~~
> drivers/gpu/drm/panel/panel-synaptics-tddi.c:72:37: note: in expansion of macro 'ARRAY_SIZE'
>     72 |         ret = regulator_bulk_enable(ARRAY_SIZE(tddi_supplies), ctx->supplies);
>        |                                     ^~~~~~~~~~
> drivers/gpu/drm/panel/panel-synaptics-tddi.c: In function 'tddi_unprepare':
> drivers/gpu/drm/panel/panel-synaptics-tddi.c:101:9: error: implicit declaration of function 'regulator_bulk_disable' [-Wimplicit-function-declaration]
>    101 |         regulator_bulk_disable(ARRAY_SIZE(tddi_supplies), ctx->supplies);
>        |         ^~~~~~~~~~~~~~~~~~~~~~
> include/linux/compiler.h:201:82: error: expression in static assertion is not an integer
>    201 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
>        |                                                                                  ^
> include/linux/compiler.h:206:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
>    206 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
>        |                                 ^~~~~~~~~~~~~~~~~~~~~~~
> include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
>     11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
>        |                                                           ^~~~~~~~~~~~~~~
> drivers/gpu/drm/panel/panel-synaptics-tddi.c:101:32: note: in expansion of macro 'ARRAY_SIZE'
>    101 |         regulator_bulk_disable(ARRAY_SIZE(tddi_supplies), ctx->supplies);
>        |                                ^~~~~~~~~~
> drivers/gpu/drm/panel/panel-synaptics-tddi.c: In function 'tddi_probe':
> drivers/gpu/drm/panel/panel-synaptics-tddi.c:183:15: error: implicit declaration of function 'devm_regulator_bulk_get_const' [-Wimplicit-function-declaration]
>    183 |         ret = devm_regulator_bulk_get_const(dev, ARRAY_SIZE(tddi_supplies),
>        |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/compiler.h:201:82: error: expression in static assertion is not an integer
>    201 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
>        |                                                                                  ^
> include/linux/compiler.h:206:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
>    206 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
>        |                                 ^~~~~~~~~~~~~~~~~~~~~~~
> include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
>     11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
>        |                                                           ^~~~~~~~~~~~~~~
> drivers/gpu/drm/panel/panel-synaptics-tddi.c:183:50: note: in expansion of macro 'ARRAY_SIZE'
>    183 |         ret = devm_regulator_bulk_get_const(dev, ARRAY_SIZE(tddi_supplies),
>        |                                                  ^~~~~~~~~~
> drivers/gpu/drm/panel/panel-synaptics-tddi.c: At top level:
> drivers/gpu/drm/panel/panel-synaptics-tddi.c:41:41: error: 'tddi_supplies' defined but not used [-Werror=unused-variable]
>     41 | static const struct regulator_bulk_data tddi_supplies[] = {
>        |                                         ^~~~~~~~~~~~~
> cc1: all warnings being treated as errors
>
> Caused by commit
>
>    243ce64b2b37 ("backlight: Do not include <linux/fb.h> in header file")
>
> interacting with commit
>
>    3eae82503f4f ("drm: panel: add support for Synaptics TDDI series DSI panels")
>
> from the drm-misc tree.
>
> I have applied the following merge fix patch.  It (or something linke it)
> should be applied to the drm-misc tree.
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 30 Oct 2025 14:57:03 +1100
> Subject: [PATCH] fix up for "backlight: Do not include <linux/fb.h> in header file"
>
> interacting with commit
>
>    3eae82503f4f ("drm: panel: add support for Synaptics TDDI series DSI panels")
>
> from the drm-misc tree.
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

I think we can take your patch into drm-misc. Thanks for fixing this.

Best regards
Thomas

> ---
>   drivers/gpu/drm/panel/panel-synaptics-tddi.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-synaptics-tddi.c b/drivers/gpu/drm/panel/panel-synaptics-tddi.c
> index a4b3cbdebb6c..0aea1854710e 100644
> --- a/drivers/gpu/drm/panel/panel-synaptics-tddi.c
> +++ b/drivers/gpu/drm/panel/panel-synaptics-tddi.c
> @@ -9,6 +9,7 @@
>   #include <linux/gpio/consumer.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
> +#include <linux/regulator/consumer.h>
>   
>   #include <video/mipi_display.h>
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


