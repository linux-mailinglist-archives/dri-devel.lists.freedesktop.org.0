Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA872ACD995
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 10:21:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351D310E09B;
	Wed,  4 Jun 2025 08:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="jE6qGEU1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ae+Vz/zr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0V/VYmXr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6A20rT0a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D12910E228
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 08:21:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C5D5A350EF;
 Wed,  4 Jun 2025 08:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749025311; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2n/bkRHgnG9P7ZT6vtnrtjlLXrNGIP6j8VGYddgKYuY=;
 b=jE6qGEU18Xqy4I09fQB93ri37QNebo4NX3BOU95JctgBU7K6A0S9acijgVA0fhnKTw1+Vj
 ANEq8zZzAWX2TqGflHprgCHMbm4sT2EX0xRFSAgSWgteskdgWM9rlbJW7PoHKrqApcN8DK
 p3OcdU3pPRnqYs/Fgkg6bwsS8k0ZzWk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749025311;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2n/bkRHgnG9P7ZT6vtnrtjlLXrNGIP6j8VGYddgKYuY=;
 b=ae+Vz/zrf36ZA+Xwaoq5XQ5BF9I3PRrTSAPYYv+/YaOp4P5fjMLQX05pA4zwAJCyiTVsSM
 JJ/O2VaTpORS3cAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749025310; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2n/bkRHgnG9P7ZT6vtnrtjlLXrNGIP6j8VGYddgKYuY=;
 b=0V/VYmXr9oXzSg4ByQ52G+HdHE2ihZvFKPdQWrXXNxtVjmqmSBBGY7es3FgIrs0HyqKJL/
 GQnjxTuuc0D0i3+wo05vTIcSUvHvlLBf2bi5Trtk/EFWWRVc/BXCkSUL/+7gYN16098lvZ
 QVs6hubC01uv6Vd+LyRUFjc4Mzf9KD0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749025310;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2n/bkRHgnG9P7ZT6vtnrtjlLXrNGIP6j8VGYddgKYuY=;
 b=6A20rT0a9fp8D157OSbn62MY+J19gaGpesh3oLIP1B7yAopZf5rV35eXfYZnURdmOQ1FTC
 v7xkwapmLEDj0BDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2CA5B13A63;
 Wed,  4 Jun 2025 08:21:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SUmaCR4CQGgSegAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 04 Jun 2025 08:21:50 +0000
Message-ID: <ceef94d5-7033-49d2-9fe6-e9fcb67eaf91@suse.de>
Date: Wed, 4 Jun 2025 10:21:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/5] drm/atomic-helper: Refactor crtc & encoder-bridge
 op loops into separate functions
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
 <20250406131642.171240-2-aradhya.bhatia@linux.dev>
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
In-Reply-To: <20250406131642.171240-2-aradhya.bhatia@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.78 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.18)[-0.919]; MIME_GOOD(-0.10)[text/plain];
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,suse.de:email,suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.78
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
> From: Aradhya Bhatia <a-bhatia1@ti.com>
>
> The way any singular display pipeline, in need of a modeset, gets
> enabled is as follows -
>
> 	crtc enable
> 	(all) bridge pre-enable
> 	encoder enable
> 	(all) bridge enable
>
> - and the disable sequence is exactly the reverse of this.
>
> The crtc operations occur by looping over the old and new crtc states,
> while the encoder and bridge operations occur together, by looping over
> the connector states of the display pipelines.
>
> Refactor these operations - crtc enable/disable, and encoder & bridge
> (pre/post) enable/disable - into separate functions each, to make way
> for the re-ordering of the enable/disable sequences.
>
> This patch doesn't alter the sequence of crtc/encoder/bridge operations
> in any way, but helps to cleanly pave the way for the next two patches,
> by maintaining logical bisectability.
>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/drm_atomic_helper.c | 69 ++++++++++++++++++++---------
>   1 file changed, 49 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index ee64ca1b1bec..d185486071c5 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1160,11 +1160,10 @@ crtc_needs_disable(struct drm_crtc_state *old_state,
>   }
>   
>   static void
> -disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
> +encoder_bridge_disable(struct drm_device *dev, struct drm_atomic_state *state)
>   {
>   	struct drm_connector *connector;
>   	struct drm_connector_state *old_conn_state, *new_conn_state;
> -	struct drm_crtc *crtc;
>   	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
>   	int i;
>   
> @@ -1227,6 +1226,14 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
>   
>   		drm_atomic_bridge_chain_post_disable(bridge, state);
>   	}
> +}
> +
> +static void
> +crtc_disable(struct drm_device *dev, struct drm_atomic_state *state)
> +{
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
> +	int i;
>   
>   	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
>   		const struct drm_crtc_helper_funcs *funcs;
> @@ -1274,6 +1281,14 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
>   	}
>   }
>   
> +static void
> +disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
> +{
> +	encoder_bridge_disable(dev, state);
> +
> +	crtc_disable(dev, state);
> +}
> +
>   /**
>    * drm_atomic_helper_update_legacy_modeset_state - update legacy modeset state
>    * @dev: DRM device
> @@ -1483,28 +1498,12 @@ static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
>   	}
>   }
>   
> -/**
> - * drm_atomic_helper_commit_modeset_enables - modeset commit to enable outputs
> - * @dev: DRM device
> - * @state: atomic state object being committed
> - *
> - * This function enables all the outputs with the new configuration which had to
> - * be turned off for the update.
> - *
> - * For compatibility with legacy CRTC helpers this should be called after
> - * drm_atomic_helper_commit_planes(), which is what the default commit function
> - * does. But drivers with different needs can group the modeset commits together
> - * and do the plane commits at the end. This is useful for drivers doing runtime
> - * PM since planes updates then only happen when the CRTC is actually enabled.
> - */
> -void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
> -					      struct drm_atomic_state *state)
> +static void
> +crtc_enable(struct drm_device *dev, struct drm_atomic_state *state)
>   {
>   	struct drm_crtc *crtc;
>   	struct drm_crtc_state *old_crtc_state;
>   	struct drm_crtc_state *new_crtc_state;
> -	struct drm_connector *connector;
> -	struct drm_connector_state *new_conn_state;
>   	int i;
>   
>   	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
> @@ -1528,6 +1527,14 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
>   				funcs->commit(crtc);
>   		}
>   	}
> +}
> +
> +static void
> +encoder_bridge_enable(struct drm_device *dev, struct drm_atomic_state *state)
> +{
> +	struct drm_connector *connector;
> +	struct drm_connector_state *new_conn_state;
> +	int i;
>   
>   	for_each_new_connector_in_state(state, connector, new_conn_state, i) {
>   		const struct drm_encoder_helper_funcs *funcs;
> @@ -1565,6 +1572,28 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
>   
>   		drm_atomic_bridge_chain_enable(bridge, state);
>   	}
> +}
> +
> +/**
> + * drm_atomic_helper_commit_modeset_enables - modeset commit to enable outputs
> + * @dev: DRM device
> + * @state: atomic state object being committed
> + *
> + * This function enables all the outputs with the new configuration which had to
> + * be turned off for the update.
> + *
> + * For compatibility with legacy CRTC helpers this should be called after
> + * drm_atomic_helper_commit_planes(), which is what the default commit function
> + * does. But drivers with different needs can group the modeset commits together
> + * and do the plane commits at the end. This is useful for drivers doing runtime
> + * PM since planes updates then only happen when the CRTC is actually enabled.
> + */
> +void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
> +					      struct drm_atomic_state *state)
> +{
> +	crtc_enable(dev, state);
> +
> +	encoder_bridge_enable(dev, state);
>   
>   	drm_atomic_helper_commit_writebacks(dev, state);
>   }

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

