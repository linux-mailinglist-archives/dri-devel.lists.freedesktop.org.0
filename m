Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A892B29AA9
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 09:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F1A10E3DA;
	Mon, 18 Aug 2025 07:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="DoXE5yg/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wwbFLpb2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DoXE5yg/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wwbFLpb2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7051C10E3DA
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 07:17:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 10E0E211EA;
 Mon, 18 Aug 2025 07:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755501463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mN+6g6/ncisl6DggwDS80FBm/cP2ZsvfuYuaOXsBmws=;
 b=DoXE5yg/b3i+WFGpekbzrhblDxHOOlMZ1nZeK+TwJCbFrFoBSB1ILc/EgSceh/wT75txVX
 /k9YDCOAetDPDdDpncZeA7dnrG4IFr2cc8Ic7CDMgPSj6Yzyiq5gjZOCQr8/e6ADsinPkw
 I3YLhmWcfXGBQT2H4Z8ctPGe3xZuFyA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755501463;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mN+6g6/ncisl6DggwDS80FBm/cP2ZsvfuYuaOXsBmws=;
 b=wwbFLpb2WvSJ4Bl8LwH/NT1lLtP6UgAMRG4IOKFnP3OijVbNUIMJnnFwKqkeiiFa0JwKZi
 7mqjKD2K/jBNMqDg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="DoXE5yg/";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wwbFLpb2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755501463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mN+6g6/ncisl6DggwDS80FBm/cP2ZsvfuYuaOXsBmws=;
 b=DoXE5yg/b3i+WFGpekbzrhblDxHOOlMZ1nZeK+TwJCbFrFoBSB1ILc/EgSceh/wT75txVX
 /k9YDCOAetDPDdDpncZeA7dnrG4IFr2cc8Ic7CDMgPSj6Yzyiq5gjZOCQr8/e6ADsinPkw
 I3YLhmWcfXGBQT2H4Z8ctPGe3xZuFyA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755501463;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mN+6g6/ncisl6DggwDS80FBm/cP2ZsvfuYuaOXsBmws=;
 b=wwbFLpb2WvSJ4Bl8LwH/NT1lLtP6UgAMRG4IOKFnP3OijVbNUIMJnnFwKqkeiiFa0JwKZi
 7mqjKD2K/jBNMqDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BF4E213A55;
 Mon, 18 Aug 2025 07:17:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id DQz0LJbTomivEAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Aug 2025 07:17:42 +0000
Message-ID: <d74f16f0-9615-4816-a49c-efa35b9ab344@suse.de>
Date: Mon, 18 Aug 2025 09:17:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/vesadrm: Match framebuffer device by id instead
 of driver name
To: Yao Zi <ziyao@disroot.org>, Javier Martinez Canillas
 <javierm@redhat.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250816153430.51235-1-ziyao@disroot.org>
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
In-Reply-To: <20250816153430.51235-1-ziyao@disroot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 10E0E211EA
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-6.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_TO(0.00)[disroot.org,redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[8]; MID_RHS_MATCH_FROM(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -6.51
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

Am 16.08.25 um 17:34 schrieb Yao Zi:
> Currently the driver matches the platform framebuffer device registered
> by sysfb through driver name, "vesa-framebuffer", this is a little
> confusing since this driver registers a DRM device, instead of a
> framebuffer.
>
> Moreover, we have a driver with the same name, enabled by
> CONFIG_FB_VESA, that acts as a consumer of vesa-framebuffer as well.
> They cannot be both loaded into the kernel.

That is intentional and desired. Please pick one of the drivers and use 
that. Vesafb is obsolete, but it's slightly smaller footprint might make 
s difference on ancient systems. For anything new, vesadrm is a better 
choice.

>
> Making these two drivers coexist is sometimes useful, e.g., a
> distribution may want to build fbcon into the kernel image for debugging
> purpose, but keep the whole DRM subsystem enabled as module. In such
> case vesadrm could serve as a solution for running DRM-specific
> userspace programs on platforms with only VESA VBIOS available.

You can do debugging with vesadrm as well. We also have DRM-based panic 
output if you just want the stack trace. If that's not enough, please 
build better debugging infrastructure for DRM.

>
> Let's rename the driver as "vesa-display" to avoid possible confusion.
> A platform_device_id table is introduced to match "vesa-framebuffer"
> devices.

NAK.

Best regards
Thomas

>
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>   drivers/gpu/drm/sysfb/vesadrm.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/sysfb/vesadrm.c b/drivers/gpu/drm/sysfb/vesadrm.c
> index 90615e9ac86b..16635dc3d5cc 100644
> --- a/drivers/gpu/drm/sysfb/vesadrm.c
> +++ b/drivers/gpu/drm/sysfb/vesadrm.c
> @@ -3,6 +3,7 @@
>   #include <linux/aperture.h>
>   #include <linux/ioport.h>
>   #include <linux/limits.h>
> +#include <linux/mod_devicetable.h>
>   #include <linux/platform_device.h>
>   #include <linux/screen_info.h>
>   
> @@ -517,10 +518,17 @@ static void vesadrm_remove(struct platform_device *pdev)
>   	drm_dev_unplug(dev);
>   }
>   
> +static const struct platform_device_id vesadrm_platform_id[] = {
> +	{ "vesa-framebuffer" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(platform, vesadrm_platform_id);
> +
>   static struct platform_driver vesadrm_platform_driver = {
>   	.driver = {
> -		.name = "vesa-framebuffer",
> +		.name = "vesa-display",
>   	},
> +	.id_table = vesadrm_platform_id,
>   	.probe = vesadrm_probe,
>   	.remove = vesadrm_remove,
>   };

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


