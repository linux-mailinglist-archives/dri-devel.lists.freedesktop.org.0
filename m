Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2363B404A5
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 15:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF22C10E03F;
	Tue,  2 Sep 2025 13:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="y8/0DUQb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dZqxWo4o";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0ZbVZ7PS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AOO3Xs9G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71FC010E03F
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 13:44:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DB60A1F7B5;
 Tue,  2 Sep 2025 13:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756820697; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wXGj3nVoER1zRaL2zejbxXeJVnvV28UXCb3CFQ0a3+8=;
 b=y8/0DUQbwGSdhAoj6JGwdPHI5sc3/rP1qQQ4JwPqMKZ7tSo3Cuh4zne2b89mQ07k56JIvF
 tQ2Ab9ImZ7gAc93OGXM9Z8TJhAFj5tnP8KwhHqBpHXNzoJJAecNzQ2/QXsf6yu/jElNGWL
 XS8jqcX4E+ZOrWED7SU4ruumTOvDxbI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756820697;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wXGj3nVoER1zRaL2zejbxXeJVnvV28UXCb3CFQ0a3+8=;
 b=dZqxWo4onGxqxxvbR8QVlPAxWQo3q+lojp45MEDfa938TXjtIIW6BWDUwj6bWy8HCkbKiO
 c/u0OlXMDG6TOhAQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0ZbVZ7PS;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AOO3Xs9G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756820695; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wXGj3nVoER1zRaL2zejbxXeJVnvV28UXCb3CFQ0a3+8=;
 b=0ZbVZ7PSayYhiLlGJMxtLV6kPVanGbHHkpvxcN6KIUfiIJxiEEmFk3hJFSGikOtrRmFmTT
 qCSlZ1y9oSBEbIWKH9FELVaKZeP3CxvpH89vR+j9RvqjMaRvwY+kUN4J/ubjd6Ol4vrs3h
 U4zwUhNdIdHXjADAr73Hiib/x5mUeHk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756820695;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wXGj3nVoER1zRaL2zejbxXeJVnvV28UXCb3CFQ0a3+8=;
 b=AOO3Xs9GfNGcWrB1EO2Dp94LXgHKMqFIvVWJdHkDgrjGre5g/2s3WFGL/wEUt482thnzyW
 oCrscvgn0HKTgkBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5CFDF13882;
 Tue,  2 Sep 2025 13:44:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qJdPFNf0tmjzYQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 02 Sep 2025 13:44:55 +0000
Message-ID: <03240fae-544f-4753-96c5-a116b4b5a318@suse.de>
Date: Tue, 2 Sep 2025 15:44:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/29] drm/atomic: Add atomic_state_readout infrastructure
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-10-14ad5315da3f@kernel.org>
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
In-Reply-To: <20250902-drm-state-readout-v1-10-14ad5315da3f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com,ffwll.ch,intel.com,linaro.org,ideasonboard.com,kwiboo.se,iki.fi];
 ARC_NA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCPT_COUNT_TWELVE(0.00)[15]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 TAGGED_RCPT(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: DB60A1F7B5
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

Am 02.09.25 um 10:32 schrieb Maxime Ripard:
> In order to enable drivers to fill their initial state from the hardware
> state, we need to provide an alternative atomic_reset helper.
>
> This helper relies on each state having its own atomic_state_readout()
> hooks. Each component will thus be able to fill the initial state based
> on what they can figure out from the hardware.
>
> It also allocates a dummy drm_atomic_state to glue the whole thing
> together so atomic_state_readout implementations can still figure out
> the state of other related entities.
>
> Link: https://lore.kernel.org/dri-devel/CAKMK7uHtqHy_oz4W7F+hmp9iqp7W5Ra8CxPvJ=9BwmvfU-O0gg@mail.gmail.com/
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>   drivers/gpu/drm/drm_atomic_helper.c | 382 ++++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/drm_mode_config.c   |   1 +
>   include/drm/drm_atomic_helper.h     |   1 +
>   include/drm/drm_bridge.h            |  21 ++
>   include/drm/drm_connector.h         |  26 +++
>   include/drm/drm_crtc.h              |  19 ++
>   include/drm/drm_plane.h             |  27 +++
>   7 files changed, 477 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index d5ebe6ea0acbc5a08aef7fa41ecb9ed5d8fa8e80..f59512476ebf2b48e1c7034950bcaf99237f03c6 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -45,10 +45,392 @@
>   #include <drm/drm_vblank.h>
>   #include <drm/drm_writeback.h>
>   
>   #include "drm_crtc_helper_internal.h"
>   #include "drm_crtc_internal.h"
> +#include "drm_internal.h"
> +
> +static void drm_atomic_set_old_plane_state(struct drm_atomic_state *state,
> +					   struct drm_plane *plane,
> +					   struct drm_plane_state *plane_state)
> +{
> +	int idx = drm_plane_index(plane);
> +
> +	state->planes[idx].old_state = plane_state;
> +	state->planes[idx].ptr = plane;
> +
> +	drm_dbg_atomic(plane->dev, "Added [PLANE:%d:%s] %p state to %p\n",
> +		       plane->base.id, plane->name, plane_state, state);
> +}
> +
> +static void drm_atomic_set_old_crtc_state(struct drm_atomic_state *state,
> +					  struct drm_crtc *crtc,
> +					  struct drm_crtc_state *crtc_state)
> +{
> +	int idx = drm_crtc_index(crtc);
> +
> +	state->crtcs[idx].old_state = crtc_state;
> +	state->crtcs[idx].ptr = crtc;
> +
> +	drm_dbg_atomic(state->dev, "Added [CRTC:%d:%s] %p state to %p\n",
> +		       crtc->base.id, crtc->name, crtc_state, state);
> +}
> +
> +static void drm_atomic_set_old_connector_state(struct drm_atomic_state *state,
> +					       struct drm_connector *conn,
> +					       struct drm_connector_state *conn_state)
> +{
> +	int idx = drm_connector_index(conn);
> +
> +	drm_connector_get(conn);
> +	state->connectors[idx].old_state = conn_state;
> +	state->connectors[idx].ptr = conn;
> +	state->num_connector++;
> +
> +	drm_dbg_atomic(conn->dev,
> +		       "Added [CONNECTOR:%d:%s] %p state to %p\n",
> +		       conn->base.id, conn->name, conn_state, state);
> +}
> +
> +static void drm_atomic_set_old_private_obj_state(struct drm_atomic_state *state,
> +						 struct drm_private_obj *obj,
> +						 struct drm_private_state *obj_state)
> +{
> +	int idx = state->num_private_objs;
> +
> +	memset(&state->private_objs[idx], 0, sizeof(*state->private_objs));
> +	state->private_objs[idx].old_state = obj_state;
> +	state->private_objs[idx].ptr = obj;
> +	state->num_private_objs++;
> +
> +	drm_dbg_atomic(state->dev,
> +		       "Added new private object %p state %p to %p\n", obj,
> +		       obj_state, state);
> +}
> +
> +static void drm_atomic_set_old_bridge_state(struct drm_atomic_state *state,
> +					    struct drm_bridge *bridge,
> +					    struct drm_bridge_state *bridge_state)
> +{
> +	drm_atomic_set_old_private_obj_state(state, &bridge->base, &bridge_state->base);
> +}
> +
> +static struct drm_connector_state *
> +find_connector_state_for_encoder(struct drm_atomic_state *state,
> +				struct drm_encoder *encoder)
> +{
> +	struct drm_connector_list_iter conn_iter;
> +	struct drm_connector *connector;
> +
> +	drm_connector_list_iter_begin(state->dev, &conn_iter);
> +	drm_for_each_connector_iter(connector, &conn_iter) {
> +		struct drm_connector_state *conn_state =
> +			drm_atomic_get_old_connector_state(state, connector);
> +
> +		if (WARN_ON(!conn_state))
> +			continue;
> +
> +		if (encoder == conn_state->best_encoder)
> +			return conn_state;
> +	}
> +	drm_connector_list_iter_end(&conn_iter);
> +
> +	return NULL;
> +}
> +
> +/**
> + * drm_atomic_helper_install_readout_state - Sets the state pointer from their readout state
> + * @state: drm_atomic_state to initialize the DRM device with.
> + *
> + * This function takes a &struct drm_atomic_state initialized by
> + * drm_atomic_build_readout_state() and sets up the entities state
> + * pointers (ie, &drm_crtc.state and similar) to properly setup the
> + * initial state.
> + */
> +static void
> +drm_atomic_helper_install_readout_state(struct drm_atomic_state *state)
> +{
> +	struct drm_connector_state *old_conn_state;
> +	struct drm_private_state *old_obj_state;
> +	struct drm_plane_state *old_plane_state;
> +	struct drm_crtc_state *old_crtc_state;
> +	struct drm_connector *connector;
> +	struct drm_private_obj *obj;
> +	struct drm_plane *plane;
> +	struct drm_crtc *crtc;
> +	unsigned int i;
> +
> +	for_each_old_connector_in_state(state, connector, old_conn_state, i) {
> +		connector->state = old_conn_state;
> +
> +		drm_connector_put(state->connectors[i].ptr);
> +		state->connectors[i].ptr = NULL;
> +		state->connectors[i].old_state = NULL;
> +	}
> +
> +	for_each_old_crtc_in_state(state, crtc, old_crtc_state, i) {
> +		crtc->state = old_crtc_state;
> +
> +		state->crtcs[i].ptr = NULL;
> +		state->crtcs[i].old_state = NULL;
> +	}
> +
> +	for_each_old_plane_in_state(state, plane, old_plane_state, i) {
> +		plane->state = old_plane_state;
> +
> +		state->planes[i].ptr = NULL;
> +		state->planes[i].old_state = NULL;
> +	}
> +
> +	for_each_old_private_obj_in_state(state, obj, old_obj_state, i) {
> +		obj->state = old_obj_state;
> +
> +		state->private_objs[i].ptr = NULL;
> +		state->private_objs[i].old_state = NULL;
> +	}
> +}
> +
> +static unsigned int count_private_obj(struct drm_device *dev)
> +{
> +	struct drm_mode_config *config = &dev->mode_config;
> +	struct drm_private_obj *obj;
> +	unsigned int count = 0;
> +
> +	list_for_each_entry(obj, &config->privobj_list, head)
> +		count++;
> +
> +	return count;
> +}
> +
> +/**
> + * drm_atomic_build_readout_state - Creates an initial state from the hardware
> + * @dev: DRM device to build the state for
> + *
> + * This function allocates a &struct drm_atomic_state, calls the
> + * atomic_readout_state callbacks, and fills the global state old states
> + * by what the callbacks returned.
> + *
> + * Returns:
> + *
> + * A partially initialized &struct drm_atomic_state on success, an error
> + * pointer otherwise.
> + */
> +static struct drm_atomic_state *
> +drm_atomic_build_readout_state(struct drm_device *dev)
> +{
> +	struct drm_connector_list_iter conn_iter;
> +	struct drm_atomic_state *state;
> +	struct drm_mode_config *config =
> +		&dev->mode_config;
> +	struct drm_connector *connector;
> +	struct drm_printer p =
> +		drm_info_printer(dev->dev);
> +	struct drm_encoder *encoder;
> +	struct drm_plane *plane;
> +	struct drm_crtc *crtc;
> +	int ret;
> +
> +	drm_dbg_kms(dev, "Starting to build atomic state from hardware state.\n");
> +
> +	state = drm_atomic_state_alloc(dev);
> +	if (WARN_ON(!state))
> +		return ERR_PTR(-ENOMEM);
> +
> +	state->connectors = kcalloc(config->num_connector, sizeof(*state->connectors), GFP_KERNEL);
> +	if (WARN_ON(!state->connectors)) {
> +		ret = -ENOMEM;
> +		goto err_state_put;
> +	}
> +
> +	state->private_objs = kcalloc(count_private_obj(dev), sizeof(*state->private_objs), GFP_KERNEL);
> +	if (WARN_ON(!state->private_objs)) {
> +		ret = -ENOMEM;
> +		goto err_state_put;
> +	}
> +
> +	drm_for_each_crtc(crtc, dev) {
> +		const struct drm_crtc_funcs *crtc_funcs =
> +			crtc->funcs;
> +		struct drm_crtc_state *crtc_state;
> +
> +		drm_dbg_kms(dev, "Initializing CRTC %s state.\n", crtc->name);
> +
> +		if (crtc_funcs->atomic_readout_state) {
> +			crtc_state = crtc_funcs->atomic_readout_state(crtc);
> +		} else if (crtc_funcs->reset) {
> +			crtc_funcs->reset(crtc);
> +
> +			/*
> +			 * We don't want to set crtc->state field yet. Let's save and clear it up.
> +			 */
> +			crtc_state = crtc->state;
> +			crtc->state = NULL;

Chancing the crtc->state pointer behind the back of the reset callback 
seems fragile. We never how if some other piece of the driver refers to 
it (although illegally).

For now, wouldn't it be better to require a read-out helper for all 
elements of the driver's mode-setting pipeline?  The trivial 
implementation would copy the existing reset function and keep 
crtc->state to NULL.

> +		} else {
> +			drm_warn(dev, "No CRTC readout or reset implementation.");
> +			continue;
> +		}
> +
> +		if (WARN_ON(IS_ERR(crtc_state))) {
> +			ret = PTR_ERR(crtc_state);
> +			goto err_state_put;
> +		}
> +
> +		drm_atomic_set_old_crtc_state(state, crtc, crtc_state);
> +	}
> +
> +	drm_connector_list_iter_begin(dev, &conn_iter);
> +	drm_for_each_connector_iter(connector, &conn_iter) {
> +		const struct drm_connector_funcs *conn_funcs =
> +			connector->funcs;
> +		struct drm_connector_state *conn_state;
> +
> +		drm_dbg_kms(dev, "Initializing Connector %s state.\n", connector->name);
> +
> +		if (conn_funcs->atomic_readout_state) {
> +			conn_state = conn_funcs->atomic_readout_state(connector, state);
> +		} else if (conn_funcs->reset) {
> +			conn_funcs->reset(connector);
> +
> +			/*
> +			 * We don't want to set connector->state field yet. Let's save and clear it
> +			 * up.
> +			 */
> +			conn_state = connector->state;
> +			connector->state = NULL;
> +		} else {
> +			drm_warn(dev, "No Connector readout or reset implementation.");
> +			continue;
> +		}
> +
> +		if (WARN_ON(IS_ERR(conn_state))) {
> +			ret = PTR_ERR(conn_state);
> +			goto err_state_put;
> +		}
> +
> +		drm_atomic_set_old_connector_state(state, connector, conn_state);
> +	}
> +	drm_connector_list_iter_end(&conn_iter);
> +
> +	WARN_ON(state->num_connector != config->num_connector);

drm_WARN_ON() here and elsewhere.


> +
> +	drm_for_each_encoder(encoder, dev) {
> +		struct drm_connector_state *enc_conn_state;
> +		struct drm_crtc_state *enc_crtc_state;
> +		struct drm_bridge *bridge;
> +
> +		/*
> +		 * It works a bit differently for bridges. Because they are
> +		 * using a drm_private_state, and because
> +		 * drm_atomic_private_obj_init() asks for its initial state when
> +		 * initializing, instead of doing it later on through a reset
> +		 * call like the other entities, we can't have reset xor
> +		 * readout.
> +		 *
> +		 * We'll need a mandatory reset to create that initial, blank,
> +		 * state, and then readout will fill that state later on if the
> +		 * driver implements it.
> +		 *
> +		 * This also means we don't need to call the readout state
> +		 * function if we don't have the bridge enabled (ie, if no
> +		 * drm_connector_state->best_encoder points to bridge->encoder,
> +		 * and / or if drm_connector_state->crtc is NULL).
> +		 *
> +		 * In such a case, we would get the blank state reset created
> +		 * during registration.
> +		 */
> +
> +		enc_conn_state = find_connector_state_for_encoder(state, encoder);
> +		if (!enc_conn_state)
> +			continue;
> +
> +		enc_crtc_state = drm_atomic_get_old_crtc_state(state, enc_conn_state->crtc);
> +		if (!enc_crtc_state)
> +			continue;
> +
> +		list_for_each_entry(bridge, &encoder->bridge_chain, chain_node) {
> +			const struct drm_bridge_funcs *bridge_funcs = bridge->funcs;
> +			struct drm_bridge_state *bridge_state;
> +
> +			bridge_state = drm_bridge_get_current_state(bridge);
> +			if (WARN_ON(!bridge_state)) {
> +				ret = -EINVAL;
> +				goto err_state_put;
> +			}
> +
> +			if (bridge_funcs->atomic_readout_state) {
> +				ret = bridge_funcs->atomic_readout_state(bridge,
> +									 bridge_state,
> +									 enc_crtc_state,
> +									 enc_conn_state);
> +				if (WARN_ON(ret))
> +					goto err_state_put;
> +			}
> +
> +			drm_atomic_set_old_bridge_state(state, bridge, bridge_state);
> +		}
> +	}
> +
> +	drm_for_each_plane(plane, dev) {
> +		const struct drm_plane_funcs *plane_funcs =
> +			plane->funcs;
> +		struct drm_plane_state *plane_state;
> +
> +		drm_dbg_kms(dev, "Initializing Plane %s state.\n", plane->name);
> +
> +		if (plane_funcs->atomic_readout_state) {
> +			plane_state = plane_funcs->atomic_readout_state(plane, state);
> +		} else if (plane_funcs->reset) {
> +			plane_funcs->reset(plane);
> +
> +			/*
> +			 * We don't want to set conn->state field yet. Let's save and clear it up.
> +			 */
> +			plane_state = plane->state;
> +			plane->state = NULL;
> +		} else {
> +			drm_warn(dev, "No plane readout or reset implementation.");
> +			continue;
> +		}
> +
> +		if (WARN_ON(IS_ERR(plane_state))) {
> +			ret = PTR_ERR(plane_state);
> +			goto err_state_put;
> +		}
> +
> +		drm_atomic_set_old_plane_state(state, plane, plane_state);
> +	}
> +
> +	drm_atomic_print_old_state(state, &p);
> +
> +	return state;
> +
> +err_state_put:
> +	drm_atomic_state_put(state);
> +	return ERR_PTR(ret);
> +}
> +
> +/**
> + * drm_atomic_helper_readout_state - Builds an initial state from hardware state
> + * @dev: DRM device to build the state for
> + *
> + * This function creates the initial state for all the entities on a
> + * @dev. Drivers can use this as their
> + * &drm_mode_config_helper_funcs.atomic_reset callback to implement
> + * hardware state readout suppport.
> + */
> +void drm_atomic_helper_readout_state(struct drm_device *dev)
> +{
> +	struct drm_atomic_state *state;
> +
> +	state = drm_atomic_build_readout_state(dev);
> +	if (IS_ERR(state))
> +		return;
> +
> +	drm_atomic_helper_install_readout_state(state);
> +	drm_atomic_state_put(state);
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_readout_state);
>   
>   /**
>    * DOC: overview
>    *
>    * This helper library provides implementations of check and commit functions on
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index 82180760032d3490d63fe83136465d2c26551d08..96d38a49be501a0090457cbe96135f82bb1358b5 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -26,10 +26,11 @@
>   #include <drm/drm_drv.h>
>   #include <drm/drm_encoder.h>
>   #include <drm/drm_file.h>
>   #include <drm/drm_framebuffer.h>
>   #include <drm/drm_managed.h>
> +#include <drm/drm_modeset_helper_vtables.h>
>   #include <drm/drm_mode_config.h>
>   #include <drm/drm_modeset_helper_vtables.h>
>   #include <drm/drm_print.h>
>   #include <linux/dma-resv.h>
>   
> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
> index 53382fe93537bbcda9cee8827bc95de9a515efb5..47902a9181727a08581fb808faabe67d92a755cf 100644
> --- a/include/drm/drm_atomic_helper.h
> +++ b/include/drm/drm_atomic_helper.h
> @@ -45,10 +45,11 @@
>   
>   struct drm_atomic_state;
>   struct drm_private_obj;
>   struct drm_private_state;
>   
> +void drm_atomic_helper_readout_state(struct drm_device *dev);
>   int drm_atomic_helper_check_modeset(struct drm_device *dev,
>   				struct drm_atomic_state *state);
>   int drm_atomic_helper_check_wb_connector_state(struct drm_connector *connector,
>   					       struct drm_atomic_state *state);
>   int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 8d9d4fd078e72977677fd992d725261232754e3e..15b63053f01869786831936ba28b7efc1e55e2e8 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -490,10 +490,31 @@ struct drm_bridge_funcs {
>   	 * The @atomic_post_disable callback is optional.
>   	 */
>   	void (*atomic_post_disable)(struct drm_bridge *bridge,
>   				    struct drm_atomic_state *state);
>   
> +	/**
> +	 * @atomic_readout_state:
> +	 *
> +	 * Initializes,this bridge atomic state.
> +	 *
> +	 * It's meant to be used by drivers that wants to implement fast

'want'

> +	 * / flicker-free boot and allows to initialize the atomic state

I think we should only call it flicker-free boot. Fast boot is misleading.

> +	 * from the hardware state left by the firmware.
> +	 *
> +	 * It's used at initialization time, so drivers must make sure
> +	 * that the power state is sensible when accessing the hardware.
> +	 *
> +	 * RETURNS:
> +	 *
> +	 * 0 on success, an error code otherwise.
> +	 */
> +	int (*atomic_readout_state)(struct drm_bridge *bridge,
> +				    struct drm_bridge_state *bridge_state,
> +				    struct drm_crtc_state *crtc_state,
> +				    struct drm_connector_state *conn_state);
> +
>   	/**
>   	 * @atomic_duplicate_state:
>   	 *
>   	 * Duplicate the current bridge state object (which is guaranteed to be
>   	 * non-NULL).
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 8f34f4b8183d83dccd3e820a444fbf74fb6c16f2..f68bd9627c085c6d2463b847aaa245ccc651f27b 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1464,10 +1464,36 @@ struct drm_connector_funcs {
>   	 * when a connector is being hot-unplugged for drivers that support
>   	 * connector hotplugging (e.g. DisplayPort MST).
>   	 */
>   	void (*destroy)(struct drm_connector *connector);
>   
> +	/**
> +	 * @atomic_readout_state:
> +	 *
> +	 * Allocates, initializes, and returns an atomic state for this
> +	 * connector.
> +	 *
> +	 * It's meant to be used by drivers that wants to implement fast
> +	 * / flicker-free boot and allows to initialize the atomic state
> +	 * from the hardware state left by the firmware.
> +	 *
> +	 * It's used at initialization time, so drivers must make sure
> +	 * that the power state is sensible when accessing the hardware.
> +	 *
> +	 * The drm_atomic_state being passed is not fully filled. Only
> +	 * the CRTC state are there when this hooks is called, and only
> +	 * their old state. The only safe operation one can do on this
> +	 * state in this hook is calling
> +	 * drm_atomic_get_old_crtc_state().
> +	 *
> +	 * RETURNS:
> +	 *
> +	 * An atomic state on success, an error pointer otherwise.
> +	 */
> +	struct drm_connector_state *(*atomic_readout_state)(struct drm_connector *connector,
> +							    struct drm_atomic_state *state);
> +
>   	/**
>   	 * @atomic_duplicate_state:
>   	 *
>   	 * Duplicate the current atomic state for this connector and return it.
>   	 * The core and helpers guarantee that any atomic state duplicated with
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index caa56e039da2a748cf40ebf45b37158acda439d9..c462bd9b2f7d3ae08e669463717002e5f78122fe 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -613,10 +613,29 @@ struct drm_crtc_funcs {
>   	 * 0 on success or a negative error code on failure.
>   	 */
>   	int (*set_property)(struct drm_crtc *crtc,
>   			    struct drm_property *property, uint64_t val);
>   
> +	/**
> +	 * @atomic_readout_state:
> +	 *
> +	 * Allocates, initializes, and returns an atomic state for this
> +	 * CRTC.
> +	 *
> +	 * It's meant to be used by drivers that wants to implement fast
> +	 * / flicker-free boot and allows to initialize the atomic state
> +	 * from the hardware state left by the firmware.
> +	 *
> +	 * It's used at initialization time, so drivers must make sure
> +	 * that the power state is sensible when accessing the hardware.
> +	 *
> +	 * RETURNS:
> +	 *
> +	 * An atomic state on success, an error pointer otherwise.
> +	 */
> +	struct drm_crtc_state *(*atomic_readout_state)(struct drm_crtc *crtc);
> +
>   	/**
>   	 * @atomic_duplicate_state:
>   	 *
>   	 * Duplicate the current atomic state for this CRTC and return it.
>   	 * The core and helpers guarantee that any atomic state duplicated with
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 01479dd94e76a8389a0c9e9d6744400aa2291064..691a267c857a228f674ef02a63fb6d1ff9e379a8 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -378,10 +378,37 @@ struct drm_plane_funcs {
>   	 * 0 on success or a negative error code on failure.
>   	 */
>   	int (*set_property)(struct drm_plane *plane,
>   			    struct drm_property *property, uint64_t val);
>   
> +	/**
> +	 * @atomic_readout_state:
> +	 *
> +	 * Allocates, initializes, and returns an atomic state for this
> +	 * plane.
> +	 *
> +	 * It's meant to be used by drivers that wants to implement fast
> +	 * / flicker-free boot and allows to initialize the atomic state
> +	 * from the hardware state left by the firmware.
> +	 *
> +	 * It's used at initialization time, so drivers must make sure
> +	 * that the power state is sensible when accessing the hardware.
> +	 *
> +	 * The drm_atomic_state being passed is not fully filled. Only
> +	 * the CRTC and connector states are there when this hooks is
> +	 * called, and only their old state. The only safe operation one
> +	 * can do on this state in this hook is calling
> +	 * drm_atomic_get_old_crtc_state() and
> +	 * drm_atomic_get_old_connector_state().
> +	 *
> +	 * RETURNS:
> +	 *
> +	 * An atomic state on success, an error pointer otherwise.
> +	 */
> +	struct drm_plane_state *(*atomic_readout_state)(struct drm_plane *plane,
> +							struct drm_atomic_state *state);
> +
>   	/**
>   	 * @atomic_duplicate_state:
>   	 *
>   	 * Duplicate the current atomic state for this plane and return it.
>   	 * The core and helpers guarantee that any atomic state duplicated with
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


