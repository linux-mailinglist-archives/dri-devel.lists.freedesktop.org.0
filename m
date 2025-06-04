Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 206B8ACD9FA
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 10:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E0910E21C;
	Wed,  4 Jun 2025 08:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="hkRdrCHV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GJH9w6iX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hkRdrCHV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GJH9w6iX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C5010E21C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 08:38:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9151E2087A;
 Wed,  4 Jun 2025 08:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749026305; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9S0BYJIxxu6xxPTg5TN7ydJxSg23zwapyVGJRkXtW6g=;
 b=hkRdrCHVhU71d9VCddDYB3MuH17wXPfRKMO1TxGvVzG1OZ1v0hn3H1SvjsaBo9T6CROLoQ
 uewTIq4Z661cK7ldKpDnf9QTUxRm33iPVzRlDcLOZNbX1z8vwDS15I9/yOIujjzhSNl1QZ
 lFNAuppBDCsH68YXALBs/gIXVBcVSXQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749026305;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9S0BYJIxxu6xxPTg5TN7ydJxSg23zwapyVGJRkXtW6g=;
 b=GJH9w6iX2TsSiB5KDdbJzs/1WZ6wx9DvDBRhviCbTwqoI3eJjVVtjPSPzj58ffWI44OPmF
 J0maashxl6Ew5QCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749026305; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9S0BYJIxxu6xxPTg5TN7ydJxSg23zwapyVGJRkXtW6g=;
 b=hkRdrCHVhU71d9VCddDYB3MuH17wXPfRKMO1TxGvVzG1OZ1v0hn3H1SvjsaBo9T6CROLoQ
 uewTIq4Z661cK7ldKpDnf9QTUxRm33iPVzRlDcLOZNbX1z8vwDS15I9/yOIujjzhSNl1QZ
 lFNAuppBDCsH68YXALBs/gIXVBcVSXQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749026305;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9S0BYJIxxu6xxPTg5TN7ydJxSg23zwapyVGJRkXtW6g=;
 b=GJH9w6iX2TsSiB5KDdbJzs/1WZ6wx9DvDBRhviCbTwqoI3eJjVVtjPSPzj58ffWI44OPmF
 J0maashxl6Ew5QCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 01D8113A63;
 Wed,  4 Jun 2025 08:38:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kO+/OgAGQGhkAQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 04 Jun 2025 08:38:24 +0000
Message-ID: <b292457c-f97b-45e4-b8a8-9752be0ea14d@suse.de>
Date: Wed, 4 Jun 2025 10:38:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/5] drm/atomic-helper: Separate out bridge
 pre_enable/post_disable from enable/disable
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>
References: <20250406131642.171240-1-aradhya.bhatia@linux.dev>
 <20250406131642.171240-3-aradhya.bhatia@linux.dev>
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
In-Reply-To: <20250406131642.171240-3-aradhya.bhatia@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.79
X-Spamd-Result: default: False [-2.79 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.19)[-0.964]; MIME_GOOD(-0.10)[text/plain];
 MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_TO(0.00)[linux.dev,ideasonboard.com,oss.qualcomm.com,intel.com,linaro.org,kernel.org,kwiboo.se,gmail.com,linux.intel.com,ffwll.ch];
 ARC_NA(0.00)[]; TAGGED_RCPT(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_TWELVE(0.00)[22];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TO_DN_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
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



Am 06.04.25 um 15:16 schrieb Aradhya Bhatia:
> The encoder-bridge ops occur by looping over the new connector states of
> the display pipelines. The enable sequence runs as follows -
>
> 	- pre_enable(bridge),
> 	- enable(encoder),
> 	- enable(bridge),
>
> while the disable sequnce runs as follows -
>
> 	- disable(bridge),
> 	- disable(encoder),
> 	- post_disable(bridge).
>
> Separate out the pre_enable(bridge), and the post_disable(bridge)
> operations into separate functions each.
>
> This patch keeps the sequence same for any singular disaplay pipe, but
> changes the sequence across multiple display pipelines.
>
> This patch is meant to be an interim patch, to cleanly pave the way for
> the sequence re-ordering patch, and maintain bisectability in the
> process.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Jayesh Choudhary <j-choudhary@ti.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
> ---
>   drivers/gpu/drm/drm_atomic_helper.c | 91 ++++++++++++++++++++++++++++-
>   1 file changed, 88 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index d185486071c5..86824f769623 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1223,8 +1223,6 @@ encoder_bridge_disable(struct drm_device *dev, struct drm_atomic_state *state)
>   			else if (funcs->dpms)
>   				funcs->dpms(encoder, DRM_MODE_DPMS_OFF);
>   		}
> -
> -		drm_atomic_bridge_chain_post_disable(bridge, state);
>   	}
>   }
>   
> @@ -1281,11 +1279,65 @@ crtc_disable(struct drm_device *dev, struct drm_atomic_state *state)
>   	}
>   }
>   
> +static void
> +encoder_bridge_post_disable(struct drm_device *dev, struct drm_atomic_state *state)
> +{
> +	struct drm_connector *connector;
> +	struct drm_connector_state *old_conn_state, *new_conn_state;
> +	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
> +	int i;
> +
> +	for_each_oldnew_connector_in_state(state, connector, old_conn_state, new_conn_state, i) {
> +		struct drm_encoder *encoder;
> +		struct drm_bridge *bridge;
> +
> +		/*
> +		 * Shut down everything that's in the changeset and currently
> +		 * still on. So need to check the old, saved state.
> +		 */
> +		if (!old_conn_state->crtc)
> +			continue;
> +
> +		old_crtc_state = drm_atomic_get_old_crtc_state(state, old_conn_state->crtc);
> +
> +		if (new_conn_state->crtc)
> +			new_crtc_state = drm_atomic_get_new_crtc_state(
> +						state,
> +						new_conn_state->crtc);

Indention is odd here. You can use up to 100 chars per line.

> +		else
> +			new_crtc_state = NULL;
> +
> +		if (!crtc_needs_disable(old_crtc_state, new_crtc_state) ||
> +		    !drm_atomic_crtc_needs_modeset(old_conn_state->crtc->state))
> +			continue;
> +
> +		encoder = old_conn_state->best_encoder;
> +
> +		/* We shouldn't get this far if we didn't previously have
> +		 * an encoder.. but WARN_ON() rather than explode.
> +		 */

Comment style should use an empty line first

  /*
   * foo bla
   */

With style issues fixed:

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> +		if (WARN_ON(!encoder))
> +			continue;
> +
> +		drm_dbg_atomic(dev, "post-disabling bridges [ENCODER:%d:%s]\n",
> +			       encoder->base.id, encoder->name);
> +
> +		/*
> +		 * Each encoder has at most one connector (since we always steal
> +		 * it away), so we won't call disable hooks twice.
> +		 */
> +		bridge = drm_bridge_chain_get_first_bridge(encoder);
> +		drm_atomic_bridge_chain_post_disable(bridge, state);
> +	}
> +}
> +
>   static void
>   disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
>   {
>   	encoder_bridge_disable(dev, state);
>   
> +	encoder_bridge_post_disable(dev, state);
> +
>   	crtc_disable(dev, state);
>   }
>   
> @@ -1498,6 +1550,38 @@ static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
>   	}
>   }
>   
> +static void
> +encoder_bridge_pre_enable(struct drm_device *dev, struct drm_atomic_state *state)
> +{
> +	struct drm_connector *connector;
> +	struct drm_connector_state *new_conn_state;
> +	int i;
> +
> +	for_each_new_connector_in_state(state, connector, new_conn_state, i) {
> +		struct drm_encoder *encoder;
> +		struct drm_bridge *bridge;
> +
> +		if (!new_conn_state->best_encoder)
> +			continue;
> +
> +		if (!new_conn_state->crtc->state->active ||
> +		    !drm_atomic_crtc_needs_modeset(new_conn_state->crtc->state))
> +			continue;
> +
> +		encoder = new_conn_state->best_encoder;
> +
> +		drm_dbg_atomic(dev, "pre-enabling bridges [ENCODER:%d:%s]\n",
> +			       encoder->base.id, encoder->name);
> +
> +		/*
> +		 * Each encoder has at most one connector (since we always steal
> +		 * it away), so we won't call enable hooks twice.
> +		 */
> +		bridge = drm_bridge_chain_get_first_bridge(encoder);
> +		drm_atomic_bridge_chain_pre_enable(bridge, state);
> +	}
> +}
> +
>   static void
>   crtc_enable(struct drm_device *dev, struct drm_atomic_state *state)
>   {
> @@ -1559,7 +1643,6 @@ encoder_bridge_enable(struct drm_device *dev, struct drm_atomic_state *state)
>   		 * it away), so we won't call enable hooks twice.
>   		 */
>   		bridge = drm_bridge_chain_get_first_bridge(encoder);
> -		drm_atomic_bridge_chain_pre_enable(bridge, state);
>   
>   		if (funcs) {
>   			if (funcs->atomic_enable)
> @@ -1593,6 +1676,8 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
>   {
>   	crtc_enable(dev, state);
>   
> +	encoder_bridge_pre_enable(dev, state);
> +
>   	encoder_bridge_enable(dev, state);
>   
>   	drm_atomic_helper_commit_writebacks(dev, state);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

