Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 791E1992624
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 09:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C13110E313;
	Mon,  7 Oct 2024 07:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="1N17+uQr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="60K1hteN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1N17+uQr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="60K1hteN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40ED210E313;
 Mon,  7 Oct 2024 07:36:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4C24421AD4;
 Mon,  7 Oct 2024 07:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728286574; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2lvvyKDHYJEWJ5YAjzoqiTrsZNbnW0RaLNBmGUZEypA=;
 b=1N17+uQr0Eaa/a+XcoqFKAzssNYGTxgRzM+ip3mmB5M+BefCMPkel2taW1E00E0SHmAl3g
 /6Bf+q7jLTtQ4Cvs7k1/rW2/pGOrn8X66v7pEGravRLrT9T05VkSIjs6h06COUgwODQ3DM
 tyuJoyegfgIhC/1TA2u9epT0Lh7Be/s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728286574;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2lvvyKDHYJEWJ5YAjzoqiTrsZNbnW0RaLNBmGUZEypA=;
 b=60K1hteNNg8Pco3WXV1nnrjbdI7jDTbDMQMHyBkPw1EPmDzSr8YX78pFEDJUSq8ZAfLwBE
 dzUQB7O5SWW7oGAA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1N17+uQr;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=60K1hteN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728286574; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2lvvyKDHYJEWJ5YAjzoqiTrsZNbnW0RaLNBmGUZEypA=;
 b=1N17+uQr0Eaa/a+XcoqFKAzssNYGTxgRzM+ip3mmB5M+BefCMPkel2taW1E00E0SHmAl3g
 /6Bf+q7jLTtQ4Cvs7k1/rW2/pGOrn8X66v7pEGravRLrT9T05VkSIjs6h06COUgwODQ3DM
 tyuJoyegfgIhC/1TA2u9epT0Lh7Be/s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728286574;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2lvvyKDHYJEWJ5YAjzoqiTrsZNbnW0RaLNBmGUZEypA=;
 b=60K1hteNNg8Pco3WXV1nnrjbdI7jDTbDMQMHyBkPw1EPmDzSr8YX78pFEDJUSq8ZAfLwBE
 dzUQB7O5SWW7oGAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2724A132BD;
 Mon,  7 Oct 2024 07:36:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id JcHwB26PA2cYbAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 07 Oct 2024 07:36:14 +0000
Message-ID: <d6678cad-7017-4d46-914f-27126d894b91@suse.de>
Date: Mon, 7 Oct 2024 09:36:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] drm/client: Make copies of modes
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
References: <20241003113304.11700-1-ville.syrjala@linux.intel.com>
 <20241003113304.11700-5-ville.syrjala@linux.intel.com>
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
In-Reply-To: <20241003113304.11700-5-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4C24421AD4
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[];
 TO_DN_SOME(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
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

Hi

Am 03.10.24 um 13:33 schrieb Ville Syrjala:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> drm_client_firmware_config() is currently picking up the current
> mode of the crtc via the legacy crtc->mode, which is not supposed
> to be used by atomic drivers at all. We can't simply switch over
> to the proper crtc->state->mode because we drop the crtc->mutex
> (which protects crtc->state) before the mode gets used.
>
> The most straightforward solution to extend the lifetime of
> modes[] seem to be to make full copies of the modes instead
> of just storing pointers. We do have to replace the NULL checks
> with something else though. Checking that mode->clock!=0
> should be sufficient.
>
> And with this we can undo also commit 3eadd887dbac
> ("drm/client:Fully protect modes[] with dev->mode_config.mutex")
> as the lifetime of modes[] no longer has anything to do with
> that lock.

I think it would be a lot better to first build that mode list while 
holding the mutex, and afterwards copy the resulting modes before 
releasing the lock. The code below is convoluted with drm_mode_copy().

>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   drivers/gpu/drm/drm_client_modeset.c | 80 +++++++++++++++-------------
>   1 file changed, 43 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index 888323137a6a..d413e119db3f 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -265,10 +265,15 @@ static void drm_client_connectors_enabled(struct drm_connector *connectors[],
>   		enabled[i] = drm_connector_enabled(connectors[i], false);
>   }
>   
> +static bool mode_valid(const struct drm_display_mode *mode)
> +{
> +	return mode->clock != 0;

A mode's clock isn't always known and not all drivers might set it 
correctly. At least in simpledrm/ofdrm, we have to make up a clock value 
for the firmware framebuffer. Otherwise some of our userspace would oops.

The test for clock != 0 makes sense, but it's maybe the wrong place to 
do this. Would a test for hdisplay/vdisplay != 0 work instead?

> +}
> +
>   static bool drm_client_target_cloned(struct drm_device *dev,
>   				     struct drm_connector *connectors[],
>   				     unsigned int connector_count,
> -				     const struct drm_display_mode *modes[],
> +				     struct drm_display_mode modes[],
>   				     struct drm_client_offset offsets[],
>   				     bool enabled[], int width, int height)
>   {
> @@ -296,15 +301,16 @@ static bool drm_client_target_cloned(struct drm_device *dev,
>   	for (i = 0; i < connector_count; i++) {
>   		if (!enabled[i])
>   			continue;
> -		modes[i] = drm_connector_pick_cmdline_mode(connectors[i]);
> -		if (!modes[i]) {
> +
> +		drm_mode_copy(&modes[i], drm_connector_pick_cmdline_mode(connectors[i]));
> +		if (!mode_valid(&modes[i])) {

You're copying and only then test for validity?

>   			can_clone = false;
>   			break;
>   		}
>   		for (j = 0; j < i; j++) {
>   			if (!enabled[j])
>   				continue;
> -			if (!drm_mode_match(modes[j], modes[i],
> +			if (!drm_mode_match(&modes[j], &modes[i],
>   					    DRM_MODE_MATCH_TIMINGS |
>   					    DRM_MODE_MATCH_CLOCK |
>   					    DRM_MODE_MATCH_FLAGS |
> @@ -335,9 +341,9 @@ static bool drm_client_target_cloned(struct drm_device *dev,
>   					   DRM_MODE_MATCH_CLOCK |
>   					   DRM_MODE_MATCH_FLAGS |
>   					   DRM_MODE_MATCH_3D_FLAGS))
> -				modes[i] = mode;
> +				drm_mode_copy(&modes[i], mode);
>   		}
> -		if (!modes[i])
> +		if (!mode_valid(&modes[i]))
>   			can_clone = false;
>   	}
>   	drm_mode_destroy(dev, dmt_mode);
> @@ -354,7 +360,7 @@ static bool drm_client_target_cloned(struct drm_device *dev,
>   static int drm_client_get_tile_offsets(struct drm_device *dev,
>   				       struct drm_connector *connectors[],
>   				       unsigned int connector_count,
> -				       const struct drm_display_mode *modes[],
> +				       const struct drm_display_mode modes[],
>   				       struct drm_client_offset offsets[],
>   				       int idx,
>   				       int h_idx, int v_idx)
> @@ -368,17 +374,17 @@ static int drm_client_get_tile_offsets(struct drm_device *dev,
>   		if (!connector->has_tile)
>   			continue;
>   
> -		if (!modes[i] && (h_idx || v_idx)) {
> +		if (!mode_valid(&modes[i]) && (h_idx || v_idx)) {
>   			drm_dbg_kms(dev,
>   				    "[CONNECTOR:%d:%s] no modes for connector tiled %d\n",
>   				    connector->base.id, connector->name, i);
>   			continue;
>   		}
>   		if (connector->tile_h_loc < h_idx)
> -			hoffset += modes[i]->hdisplay;
> +			hoffset += modes[i].hdisplay;
>   
>   		if (connector->tile_v_loc < v_idx)
> -			voffset += modes[i]->vdisplay;
> +			voffset += modes[i].vdisplay;
>   	}
>   	offsets[idx].x = hoffset;
>   	offsets[idx].y = voffset;
> @@ -389,7 +395,7 @@ static int drm_client_get_tile_offsets(struct drm_device *dev,
>   static bool drm_client_target_preferred(struct drm_device *dev,
>   					struct drm_connector *connectors[],
>   					unsigned int connector_count,
> -					const struct drm_display_mode *modes[],
> +					struct drm_display_mode modes[],
>   					struct drm_client_offset offsets[],
>   					bool enabled[], int width, int height)
>   {
> @@ -445,16 +451,16 @@ static bool drm_client_target_preferred(struct drm_device *dev,
>   		}
>   
>   		mode_type = "cmdline";
> -		modes[i] = drm_connector_pick_cmdline_mode(connector);
> +		drm_mode_copy(&modes[i], drm_connector_pick_cmdline_mode(connector));
>   
> -		if (!modes[i]) {
> +		if (!mode_valid(&modes[i])) {
>   			mode_type = "preferred";
> -			modes[i] = drm_connector_preferred_mode(connector, width, height);
> +			drm_mode_copy(&modes[i], drm_connector_preferred_mode(connector, width, height));
>   		}
>   
> -		if (!modes[i]) {
> +		if (!mode_valid(&modes[i])) {
>   			mode_type = "first";
> -			modes[i] = drm_connector_first_mode(connector);
> +			drm_mode_copy(&modes[i], drm_connector_first_mode(connector));
>   		}
>   
>   		/*
> @@ -472,17 +478,17 @@ static bool drm_client_target_preferred(struct drm_device *dev,
>   			     connector->tile_v_loc == 0 &&
>   			     !drm_connector_get_tiled_mode(connector))) {
>   				mode_type = "non tiled";
> -				modes[i] = drm_connector_fallback_non_tiled_mode(connector);
> +				drm_mode_copy(&modes[i], drm_connector_fallback_non_tiled_mode(connector));
>   			} else {
>   				mode_type = "tiled";
> -				modes[i] = drm_connector_get_tiled_mode(connector);
> +				drm_mode_copy(&modes[i], drm_connector_get_tiled_mode(connector));
>   			}
>   		}
>   
> -		if (modes[i])
> +		if (mode_valid(&modes[i]))
>   			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] found %s mode: %s\n",
>   				    connector->base.id, connector->name,
> -				    mode_type, modes[i]->name);
> +				    mode_type, modes[i].name);
>   		else
>   			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] no mode found\n",
>   				    connector->base.id, connector->name);
> @@ -514,7 +520,7 @@ static int drm_client_pick_crtcs(struct drm_client_dev *client,
>   				 struct drm_connector *connectors[],
>   				 unsigned int connector_count,
>   				 struct drm_crtc *best_crtcs[],
> -				 const struct drm_display_mode *modes[],
> +				 const struct drm_display_mode modes[],
>   				 int n, int width, int height)
>   {
>   	struct drm_device *dev = client->dev;
> @@ -532,7 +538,7 @@ static int drm_client_pick_crtcs(struct drm_client_dev *client,
>   	best_crtcs[n] = NULL;
>   	best_score = drm_client_pick_crtcs(client, connectors, connector_count,
>   					   best_crtcs, modes, n + 1, width, height);
> -	if (modes[n] == NULL)
> +	if (!mode_valid(&modes[n]))
>   		return best_score;
>   
>   	crtcs = kcalloc(connector_count, sizeof(*crtcs), GFP_KERNEL);
> @@ -566,7 +572,7 @@ static int drm_client_pick_crtcs(struct drm_client_dev *client,
>   			if (dev->mode_config.num_crtc > 1)
>   				continue;
>   
> -			if (!drm_mode_equal(modes[o], modes[n]))
> +			if (!drm_mode_equal(&modes[o], &modes[n]))
>   				continue;
>   		}
>   
> @@ -589,7 +595,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
>   				       struct drm_connector *connectors[],
>   				       unsigned int connector_count,
>   				       struct drm_crtc *crtcs[],
> -				       const struct drm_display_mode *modes[],
> +				       struct drm_display_mode modes[],
>   				       struct drm_client_offset offsets[],
>   				       bool enabled[], int width, int height)
>   {
> @@ -690,20 +696,20 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
>   		}
>   
>   		mode_type = "cmdline";
> -		modes[i] = drm_connector_pick_cmdline_mode(connector);
> +		drm_mode_copy(&modes[i], drm_connector_pick_cmdline_mode(connector));
>   
> -		if (!modes[i]) {
> +		if (!mode_valid(&modes[i])) {
>   			mode_type = "preferred";
> -			modes[i] = drm_connector_preferred_mode(connector, width, height);
> +			drm_mode_copy(&modes[i], drm_connector_preferred_mode(connector, width, height));
>   		}
>   
> -		if (!modes[i]) {
> +		if (!mode_valid(&modes[i])) {
>   			mode_type = "first";
> -			modes[i] = drm_connector_first_mode(connector);
> +			drm_mode_copy(&modes[i], drm_connector_first_mode(connector));
>   		}
>   
>   		/* last resort: use current mode */
> -		if (!modes[i]) {
> +		if (!mode_valid(&modes[i])) {
>   			/*
>   			 * IMPORTANT: We want to use the adjusted mode (i.e.
>   			 * after the panel fitter upscaling) as the initial
> @@ -716,7 +722,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
>   			 * fastboot check to work correctly.
>   			 */
>   			mode_type = "current";
> -			modes[i] = &connector->state->crtc->mode;
> +			drm_mode_copy(&modes[i], &connector->state->crtc->mode);
>   		}
>   
>   		/*
> @@ -726,14 +732,14 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
>   		if (connector->has_tile &&
>   		    num_tiled_conns < connector->num_h_tile * connector->num_v_tile) {
>   			mode_type = "non tiled";
> -			modes[i] = drm_connector_fallback_non_tiled_mode(connector);
> +			drm_mode_copy(&modes[i], drm_connector_fallback_non_tiled_mode(connector));
>   		}
>   		crtcs[i] = new_crtc;
>   
>   		drm_dbg_kms(dev, "[CONNECTOR::%d:%s] on [CRTC:%d:%s] using %s mode: %s\n",
>   			    connector->base.id, connector->name,
>   			    new_crtc->base.id, new_crtc->name,
> -			    mode_type, modes[i]->name);
> +			    mode_type, modes[i].name);
>   
>   		fallback = false;
>   		conn_configured |= BIT(i);
> @@ -789,8 +795,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
>   	unsigned int total_modes_count = 0;
>   	struct drm_client_offset *offsets;
>   	unsigned int connector_count = 0;
> -	/* points to modes protected by mode_config.mutex */
> -	const struct drm_display_mode **modes;
> +	struct drm_display_mode *modes;
>   	struct drm_crtc **crtcs;
>   	int i, ret = 0;
>   	bool *enabled;
> @@ -858,10 +863,12 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
>   				      crtcs, modes, 0, width, height);
>   	}
>   
> +	mutex_unlock(&dev->mode_config.mutex);
> +
>   	drm_client_modeset_release(client);
>   
>   	for (i = 0; i < connector_count; i++) {
> -		const struct drm_display_mode *mode = modes[i];
> +		const struct drm_display_mode *mode = &modes[i];
>   		struct drm_crtc *crtc = crtcs[i];
>   		struct drm_client_offset *offset = &offsets[i];
>   
> @@ -892,7 +899,6 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
>   			modeset->y = offset->y;
>   		}
>   	}
> -	mutex_unlock(&dev->mode_config.mutex);
>   
>   	mutex_unlock(&client->modeset_mutex);
>   out:

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

