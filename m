Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B6EBC0D75
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 11:17:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E19010E5E4;
	Tue,  7 Oct 2025 09:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="zBo8/jGE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D9JAxYqN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ohuPrs5u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="re0PlpM9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2BD10E5C0
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 09:17:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AB134336EA;
 Tue,  7 Oct 2025 09:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759828671; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LO7NpB6m0arMDbmzyc7LQrwCspDplXm5kHmCO4Mqo8Y=;
 b=zBo8/jGE+prC6IHmW+5bb5OTuwO0wk5Plecrghn9eKfWuT+5lz6pOTW1+CByUZe3Wk/UAn
 QF3UN8kIGxyqBwR2DdGFmfMb7nn+h57yXFmRprcWngxReK/CW1t85qLWsotrteBlq3FAhX
 ckJ4ctxsbtd7Gm8z+SvQRBVOBGR7++k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759828671;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LO7NpB6m0arMDbmzyc7LQrwCspDplXm5kHmCO4Mqo8Y=;
 b=D9JAxYqNjG8zCgkbpkSqmxjnbaQXfQRF2U5Zz72iU3MJTjUomWt8TDON8XGw4D37ut0oWq
 tGXTo2jHCIg07wCQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ohuPrs5u;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=re0PlpM9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759828670; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LO7NpB6m0arMDbmzyc7LQrwCspDplXm5kHmCO4Mqo8Y=;
 b=ohuPrs5uADJQB47+8uqq8HST3NwUyTerJwBd4Oz2ExizefGwgah8wBNMFmjpKqys7hrhJz
 7mruioxqoI4PjBkH/HLOlrz7I2w8eukn9SzQPxA3uRvC3IHD8Bb0t1AT2WaFBug0z0LZlT
 OnWH/tQo9tSnJjWdEXQTb3xUVh8/nmQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759828670;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LO7NpB6m0arMDbmzyc7LQrwCspDplXm5kHmCO4Mqo8Y=;
 b=re0PlpM9vAnu+5Kmm+AeTZ1kPQPGf7i2y20b26xVFVnEXLKfrSjjs0BJzbkEK4hrrDwJ1X
 gR3VZSgELyzV2/Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 734CD13693;
 Tue,  7 Oct 2025 09:17:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2MgeGr7a5GhqTAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 07 Oct 2025 09:17:50 +0000
Message-ID: <e0d81b43-22cf-4004-936f-2a1dae9d8741@suse.de>
Date: Tue, 7 Oct 2025 11:17:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gud: move plane init to gud_pipe.c
To: Ruben Wauters <rubenru09@aol.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251004175900.15235-2-rubenru09.ref@aol.com>
 <20251004175900.15235-2-rubenru09@aol.com>
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
In-Reply-To: <20251004175900.15235-2-rubenru09@aol.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: AB134336EA
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[aol.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[aol.com,gmail.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_SEVEN(0.00)[7]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, suse.de:dkim, suse.de:mid]
X-Spam-Score: -4.51
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

Hi Ruben,

please see my comments below.

Am 04.10.25 um 19:49 schrieb Ruben Wauters:
> gud_probe() currently is a quite large function that does a lot of
> different things, including USB detection, plane init, and several other
> things.
>
> This patch moves the plane and crtc init into gud_plane_init() in
> gud_pipe.c, which is a more appropriate file for this. Associated
> variables and structs have also been moved to gud_pipe.c
>
> Signed-off-by: Ruben Wauters <rubenru09@aol.com>
> ---
> It was somewhat difficult to determine what exactly should be moved
> over, gud_probe() as a function quite a mess, so I need to figure out
> exactly how to split this one up.

Agreed. The probe function looks really chaotic.

I think that just moving CRTC and plane is a not enough. In ast and udl, 
we have functions that init the whole display pipeline from 
drmm_mode_config_init() to _reset(). See [1] and [2] for examples. That 
would likely be a good model for gud as well, but gud's probe function 
mixes up pipeline init with other code.

[1] 
https://elixir.bootlin.com/linux/v6.17.1/source/drivers/gpu/drm/ast/ast_mode.c#L1005
[2] 
https://elixir.bootlin.com/linux/v6.17.1/source/drivers/gpu/drm/udl/udl_modeset.c#L482


Looking over gud_probe, the following blocks are related to pipeline init:

- lines 466-469 [3]
- lines 486-489
- lines 558-565
- lines 590-599
- lines 610-623
- line 641

[3] 
https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/gud/gud_drv.c#L466

I'd try to move these lines into a new helper that initializes the full 
modesetting pipeline.

The other code that happens in between is either preparation or clean up 
and should be done before or after creating the pipeline.


>
> As an aside, I noticed that the driver doesn't have a version macro in
> gud_drv.c, and therefore is shown as 1.0.0. I was thinking of
> introducing a version, but I wanted to know how others generally deal
> with driver versions. I'm not 100% sure if it's *necessary* for GUD but
> it might be a good idea.

I wouldn't bother at all about module versions. AFAIK no one cares about 
it anyway.

Best regards
Thomas

> ---
>   drivers/gpu/drm/gud/gud_drv.c      | 48 +-----------------------
>   drivers/gpu/drm/gud/gud_internal.h |  1 +
>   drivers/gpu/drm/gud/gud_pipe.c     | 60 ++++++++++++++++++++++++++++++
>   3 files changed, 62 insertions(+), 47 deletions(-)
>
> diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
> index b7345c8d823d..967c16479b5c 100644
> --- a/drivers/gpu/drm/gud/gud_drv.c
> +++ b/drivers/gpu/drm/gud/gud_drv.c
> @@ -16,7 +16,6 @@
>   #include <drm/clients/drm_client_setup.h>
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_blend.h>
> -#include <drm/drm_crtc_helper.h>
>   #include <drm/drm_damage_helper.h>
>   #include <drm/drm_debugfs.h>
>   #include <drm/drm_drv.h>
> @@ -338,43 +337,12 @@ static int gud_stats_debugfs(struct seq_file *m, void *data)
>   	return 0;
>   }
>   
> -static const struct drm_crtc_helper_funcs gud_crtc_helper_funcs = {
> -	.atomic_check = drm_crtc_helper_atomic_check
> -};
> -
> -static const struct drm_crtc_funcs gud_crtc_funcs = {
> -	.reset = drm_atomic_helper_crtc_reset,
> -	.destroy = drm_crtc_cleanup,
> -	.set_config = drm_atomic_helper_set_config,
> -	.page_flip = drm_atomic_helper_page_flip,
> -	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
> -};
> -
> -static const struct drm_plane_helper_funcs gud_plane_helper_funcs = {
> -	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> -	.atomic_check = gud_plane_atomic_check,
> -	.atomic_update = gud_plane_atomic_update,
> -};
> -
> -static const struct drm_plane_funcs gud_plane_funcs = {
> -	.update_plane = drm_atomic_helper_update_plane,
> -	.disable_plane = drm_atomic_helper_disable_plane,
> -	.destroy = drm_plane_cleanup,
> -	DRM_GEM_SHADOW_PLANE_FUNCS,
> -};
> -
>   static const struct drm_mode_config_funcs gud_mode_config_funcs = {
>   	.fb_create = drm_gem_fb_create_with_dirty,
>   	.atomic_check = drm_atomic_helper_check,
>   	.atomic_commit = drm_atomic_helper_commit,
>   };
>   
> -static const u64 gud_plane_modifiers[] = {
> -	DRM_FORMAT_MOD_LINEAR,
> -	DRM_FORMAT_MOD_INVALID
> -};
> -
>   DEFINE_DRM_GEM_FOPS(gud_fops);
>   
>   static const struct drm_driver gud_drm_driver = {
> @@ -587,17 +555,10 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
>   			return -ENOMEM;
>   	}
>   
> -	ret = drm_universal_plane_init(drm, &gdrm->plane, 0,
> -				       &gud_plane_funcs,
> -				       formats, num_formats,
> -				       gud_plane_modifiers,
> -				       DRM_PLANE_TYPE_PRIMARY, NULL);
> +	ret = gud_plane_init(gdrm, formats, num_formats);
>   	if (ret)
>   		return ret;
>   
> -	drm_plane_helper_add(&gdrm->plane, &gud_plane_helper_funcs);
> -	drm_plane_enable_fb_damage_clips(&gdrm->plane);
> -
>   	devm_kfree(dev, formats);
>   	devm_kfree(dev, formats_dev);
>   
> @@ -607,13 +568,6 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
>   		return ret;
>   	}
>   
> -	ret = drm_crtc_init_with_planes(drm, &gdrm->crtc, &gdrm->plane, NULL,
> -					&gud_crtc_funcs, NULL);
> -	if (ret)
> -		return ret;
> -
> -	drm_crtc_helper_add(&gdrm->crtc, &gud_crtc_helper_funcs);
> -
>   	ret = gud_get_connectors(gdrm);
>   	if (ret) {
>   		dev_err(dev, "Failed to get connectors (error=%d)\n", ret);
> diff --git a/drivers/gpu/drm/gud/gud_internal.h b/drivers/gpu/drm/gud/gud_internal.h
> index d27c31648341..4a91aae61e50 100644
> --- a/drivers/gpu/drm/gud/gud_internal.h
> +++ b/drivers/gpu/drm/gud/gud_internal.h
> @@ -69,6 +69,7 @@ void gud_plane_atomic_update(struct drm_plane *plane,
>   int gud_connector_fill_properties(struct drm_connector_state *connector_state,
>   				  struct gud_property_req *properties);
>   int gud_get_connectors(struct gud_device *gdrm);
> +int gud_plane_init(struct gud_device *gdrm, u32 *formats, unsigned int num_formats);
>   
>   /* Driver internal fourcc transfer formats */
>   #define GUD_DRM_FORMAT_R1		0x00000122
> diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
> index 3a208e956dff..1f7af86b28fd 100644
> --- a/drivers/gpu/drm/gud/gud_pipe.c
> +++ b/drivers/gpu/drm/gud/gud_pipe.c
> @@ -10,6 +10,7 @@
>   
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_connector.h>
> +#include <drm/drm_crtc_helper.h>
>   #include <drm/drm_damage_helper.h>
>   #include <drm/drm_drv.h>
>   #include <drm/drm_format_helper.h>
> @@ -450,6 +451,65 @@ static void gud_fb_handle_damage(struct gud_device *gdrm, struct drm_framebuffer
>   	gud_flush_damage(gdrm, fb, src, !fb->obj[0]->import_attach, damage);
>   }
>   
> +static const struct drm_plane_funcs gud_plane_funcs = {
> +	.update_plane = drm_atomic_helper_update_plane,
> +	.disable_plane = drm_atomic_helper_disable_plane,
> +	.destroy = drm_plane_cleanup,
> +	DRM_GEM_SHADOW_PLANE_FUNCS,
> +};
> +
> +static const struct drm_plane_helper_funcs gud_plane_helper_funcs = {
> +	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> +	.atomic_check = gud_plane_atomic_check,
> +	.atomic_update = gud_plane_atomic_update,
> +};
> +
> +static const struct drm_crtc_helper_funcs gud_crtc_helper_funcs = {
> +	.atomic_check = drm_crtc_helper_atomic_check
> +};
> +
> +static const struct drm_crtc_funcs gud_crtc_funcs = {
> +	.reset = drm_atomic_helper_crtc_reset,
> +	.destroy = drm_crtc_cleanup,
> +	.set_config = drm_atomic_helper_set_config,
> +	.page_flip = drm_atomic_helper_page_flip,
> +	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
> +};
> +
> +static const u64 gud_plane_modifiers[] = {
> +	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_INVALID
> +};
> +
> +int gud_plane_init(struct gud_device *gdrm, u32 *formats, unsigned int num_formats)
> +{
> +	struct drm_device *drm = &gdrm->drm;
> +	struct drm_plane *plane = &gdrm->plane;
> +	struct drm_crtc *crtc = &gdrm->crtc;
> +	int ret;
> +
> +	ret = drm_universal_plane_init(drm, plane, 0,
> +				       &gud_plane_funcs,
> +				       formats, num_formats,
> +				       gud_plane_modifiers,
> +				       DRM_PLANE_TYPE_PRIMARY, NULL);
> +	if (ret)
> +		return ret;
> +
> +	drm_plane_helper_add(plane, &gud_plane_helper_funcs);
> +	drm_plane_enable_fb_damage_clips(plane);
> +
> +	ret = drm_crtc_init_with_planes(drm, crtc, plane, NULL,
> +					&gud_crtc_funcs, NULL);
> +	if (ret)
> +		return ret;
> +
> +	drm_crtc_helper_add(crtc, &gud_crtc_helper_funcs);
> +
> +	return 0;
> +}
> +
>   int gud_plane_atomic_check(struct drm_plane *plane,
>   			   struct drm_atomic_state *state)
>   {

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


