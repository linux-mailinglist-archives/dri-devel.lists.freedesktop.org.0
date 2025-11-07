Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DEAC3F503
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 11:06:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE08310EA5F;
	Fri,  7 Nov 2025 10:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="IPlxFBXr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9KC+R6t+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IPlxFBXr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9KC+R6t+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBEFE10EA5E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 10:06:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 88E89211D2;
 Fri,  7 Nov 2025 10:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762509975; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gmE7nmZzFAddhz4V2SGkGQ3Br9XnY0OIrXjc2Zpj8HI=;
 b=IPlxFBXr05kW+w8tZvsxXAzTxKjQjuPFJplN0sbpRPQ0GpItZm8opG9FV0plXyjN1Z3rfL
 0He4XUSS2WbL0DSpNx4ykdxKCISUS8tZE7KlbvDWc6snaUOWCmxAL+K7LddWMMu9PBgCT0
 4aKRamKHzHDbZTBcc9h+mo/08amcmCU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762509975;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gmE7nmZzFAddhz4V2SGkGQ3Br9XnY0OIrXjc2Zpj8HI=;
 b=9KC+R6t+vog4t6blN0Yjzk02hvYTpWwrsMIrbCKtZwbDpyrIuYSqHGtwD2pqQZH0/2+wQQ
 SDDY/3o3pMBbDbCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762509975; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gmE7nmZzFAddhz4V2SGkGQ3Br9XnY0OIrXjc2Zpj8HI=;
 b=IPlxFBXr05kW+w8tZvsxXAzTxKjQjuPFJplN0sbpRPQ0GpItZm8opG9FV0plXyjN1Z3rfL
 0He4XUSS2WbL0DSpNx4ykdxKCISUS8tZE7KlbvDWc6snaUOWCmxAL+K7LddWMMu9PBgCT0
 4aKRamKHzHDbZTBcc9h+mo/08amcmCU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762509975;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gmE7nmZzFAddhz4V2SGkGQ3Br9XnY0OIrXjc2Zpj8HI=;
 b=9KC+R6t+vog4t6blN0Yjzk02hvYTpWwrsMIrbCKtZwbDpyrIuYSqHGtwD2pqQZH0/2+wQQ
 SDDY/3o3pMBbDbCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 46BAD1395F;
 Fri,  7 Nov 2025 10:06:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IS7TD5fEDWkbKgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 07 Nov 2025 10:06:15 +0000
Message-ID: <15166a78-b603-464a-8fa5-b7dd43d55029@suse.de>
Date: Fri, 7 Nov 2025 11:06:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/fb-helper: add fbdev screen expended mode display
 support
To: oushixiong1025@163.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>,
 Tiger Liu <liuyihu@kylinos.cn>
References: <20251107092641.111431-1-oushixiong1025@163.com>
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
In-Reply-To: <20251107092641.111431-1-oushixiong1025@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 RCVD_TLS_ALL(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[163.com,linux.intel.com];
 MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,kylinos.cn];
 RCPT_COUNT_SEVEN(0.00)[9]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.com:url,
 suse.de:mid]
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



Am 07.11.25 um 10:26 schrieb oushixiong1025@163.com:
> From: Shixiong Ou <oushixiong@kylinos.cn>
>
> Add fbdev screen extended mode display support

What? What is this about?

>
> Signed-off-by: Tiger Liu <liuyihu@kylinos.cn>
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> ---
>   drivers/gpu/drm/drm_fb_helper.c | 143 ++++++++++++++++++++++++++++++--
>   1 file changed, 135 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 53e9dc0543de..a6ec03bf3aef 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -78,6 +78,17 @@ MODULE_PARM_DESC(drm_leak_fbdev_smem,
>   		 "Allow unsafe leaking fbdev physical smem address [default=false]");
>   #endif
>   
> +#define SCREEN_CLONE			0x0
> +#define SCREEN_EXPAND_HORIZONTAL	0x1
> +#define SCREEN_EXPAND_VERTICAL		0x2
> +
> +static bool drm_fbdev_screen_expand_mode_enabled;
> +static int drm_fbdev_screen_mode = SCREEN_CLONE;
> +module_param_named(screen_mode, drm_fbdev_screen_mode, int, 0444);
> +MODULE_PARM_DESC(screen_mode,
> +		 "Screen display of the fbdev. [0 = clone(default), 1 = expand horizontally,"
> +		 "2 = expand vertically]");
> +
>   static LIST_HEAD(kernel_fb_helper_list);
>   static DEFINE_MUTEX(kernel_fb_helper_lock);
>   
> @@ -1345,15 +1356,35 @@ int drm_fb_helper_set_par(struct fb_info *info)
>   }
>   EXPORT_SYMBOL(drm_fb_helper_set_par);
>   
> -static void pan_set(struct drm_fb_helper *fb_helper, int dx, int dy)
> +static void pan_set_locked(struct drm_client_dev *client,
> +			   int dx, int dy)
>   {
>   	struct drm_mode_set *mode_set;
> +	int screen_x_offset = dx;
> +	int screen_y_offset = dy;
>   
> -	mutex_lock(&fb_helper->client.modeset_mutex);
> -	drm_client_for_each_modeset(mode_set, &fb_helper->client) {
> -		mode_set->x += dx;
> -		mode_set->y += dy;
> +	drm_client_for_each_modeset(mode_set, client) {
> +		if (drm_fbdev_screen_expand_mode_enabled) {
> +			if (drm_fbdev_screen_mode == SCREEN_EXPAND_HORIZONTAL) {
> +				mode_set->x += screen_x_offset;
> +				mode_set->y += screen_y_offset;
> +				screen_x_offset += mode_set->mode->hdisplay;
> +			} else if (drm_fbdev_screen_mode == SCREEN_EXPAND_VERTICAL) {
> +				mode_set->x += screen_x_offset;
> +				mode_set->y += screen_y_offset;
> +				screen_y_offset += mode_set->mode->vdisplay;
> +			}
> +		} else {
> +			mode_set->x = screen_x_offset;
> +			mode_set->y = screen_y_offset;
> +		}
>   	}
> +}
> +
> +static void pan_set(struct drm_fb_helper *fb_helper, int dx, int dy)
> +{
> +	mutex_lock(&fb_helper->client.modeset_mutex);
> +	pan_set_locked(&fb_helper->client, dx, dy);
>   	mutex_unlock(&fb_helper->client.modeset_mutex);
>   }
>   
> @@ -1387,10 +1418,8 @@ static int pan_display_legacy(struct fb_var_screeninfo *var,
>   
>   	mutex_lock(&client->modeset_mutex);
>   	drm_modeset_lock_all(fb_helper->dev);
> +	pan_set_locked(client, var->xoffset, var->yoffset);
>   	drm_client_for_each_modeset(modeset, client) {
> -		modeset->x = var->xoffset;
> -		modeset->y = var->yoffset;
> -
>   		if (modeset->num_connectors) {
>   			ret = drm_mode_set_config_internal(modeset);
>   			if (!ret) {
> @@ -1461,6 +1490,94 @@ static uint32_t drm_fb_helper_find_format(struct drm_fb_helper *fb_helper, const
>   	return DRM_FORMAT_INVALID;
>   }
>   
> +/*
> + * Check if the device supports extended mode
> + *
> + * return true if the device supports extended mode,
> + * otherwise return false.
> + */
> +static bool drm_fb_helper_validate_extended_mode(struct drm_fb_helper *fb_helper,
> +						 struct drm_fb_helper_surface_size *sizes)
> +{
> +	struct drm_client_dev *client = &fb_helper->client;
> +	struct drm_device *dev = fb_helper->dev;
> +	struct drm_mode_config *config = &dev->mode_config;
> +	struct drm_mode_set *mode_set;
> +	u32 crtc_count;
> +
> +	drm_client_for_each_modeset(mode_set, client) {
> +		crtc_count++;
> +
> +		for (int j = 0; j < mode_set->num_connectors; j++) {
> +			struct drm_connector *connector = mode_set->connectors[j];
> +
> +			if (connector->has_tile) {
> +				drm_dbg_kms(client->dev,
> +					    "Don't support extended with tile mode connector yet\n");
> +				return false;
> +			}
> +		}
> +	}
> +
> +	if (crtc_count < 2) {
> +		drm_dbg_kms(client->dev,
> +			    "Only support extended mode when device have mult-crtcs\n");
> +		return false;
> +	}
> +
> +	if (drm_fbdev_screen_mode == SCREEN_EXPAND_HORIZONTAL) {
> +		u32 x = 0;
> +
> +		drm_client_for_each_modeset(mode_set, client) {
> +			struct drm_display_mode *desired_mode;
> +
> +			desired_mode = mode_set->mode;
> +			x = mode_set->x;
> +			sizes->fb_width = sizes->surface_width  += desired_mode->hdisplay;
> +			sizes->surface_height =
> +				min_t(u32, desired_mode->vdisplay + mode_set->y,
> +				      sizes->surface_height);
> +			sizes->fb_height = min_t(u32, desired_mode->vdisplay + mode_set->y,
> +						 sizes->fb_height);
> +		}
> +		sizes->fb_width = sizes->surface_width += x;
> +
> +		if (sizes->fb_width > config->max_width) {
> +			drm_dbg_kms(client->dev,
> +				    "screen_buffer total width %d > config width %d\n",
> +				    sizes->fb_width, config->max_width);
> +			return false;
> +		}
> +	} else if (drm_fbdev_screen_mode == SCREEN_EXPAND_VERTICAL) {
> +		u32 y = 0;
> +
> +		drm_client_for_each_modeset(mode_set, client) {
> +			struct drm_display_mode *desired_mode;
> +
> +			desired_mode = mode_set->mode;
> +			y = mode_set->y;
> +			sizes->fb_height = sizes->surface_height += desired_mode->vdisplay;
> +			sizes->surface_width =
> +				min_t(u32, desired_mode->hdisplay + mode_set->x,
> +				      sizes->surface_width);
> +			sizes->fb_width = min_t(u32, desired_mode->hdisplay + mode_set->x,
> +						sizes->fb_width);
> +		}
> +		sizes->fb_height = sizes->surface_height += y;
> +
> +		if (sizes->fb_height > config->max_height) {
> +			drm_dbg_kms(client->dev,
> +				    "screen_buffer_total_height %d > config height %d\n",
> +				    sizes->fb_height, config->max_height);
> +			return false;
> +		}
> +	} else {
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>   static int __drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper,
>   				      struct drm_fb_helper_surface_size *sizes)
>   {
> @@ -1527,6 +1644,16 @@ static int __drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper,
>   
>   	/* first up get a count of crtcs now in use and new min/maxes width/heights */
>   	crtc_count = 0;
> +
> +	/* Check if we support extended mode. If we do, we will adjust the sizes accordingly. */
> +	if (drm_fbdev_screen_mode &&
> +		drm_fb_helper_validate_extended_mode(fb_helper, sizes)) {
> +		drm_fbdev_screen_expand_mode_enabled = true;
> +		drm_dbg_kms(dev, "Extended mode: horizontal expansion, width: %d, height: %d\n",
> +			    sizes->surface_width, sizes->surface_height);
> +		return 0;
> +	}
> +
>   	drm_client_for_each_modeset(mode_set, client) {
>   		struct drm_display_mode *desired_mode;
>   		int x, y, j;

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


