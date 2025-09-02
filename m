Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B37DB40336
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 15:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D7510E6EF;
	Tue,  2 Sep 2025 13:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="JPg/JMzz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4CjRX9DI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JPg/JMzz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4CjRX9DI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9BF10E6EF
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 13:30:20 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 221301F391;
 Tue,  2 Sep 2025 13:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756819819; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1Tuj4d2o1aVaUTb7IB0TvNttUNIo+iNkmbKZxn0ZJbI=;
 b=JPg/JMzzfKaLNRfEcPx7qWYPytsiMSsNMVBSvEEZBPuWnjIG2WHl9z7Qs81jg2F77l3ktd
 PGrW/EiSoSFg1sq3PYMDXqbYbCilQpUt49Nfdxn43U/Vt9CZxYiD5cr/bUDiIkmvVII4Di
 jjHES0Ekx83MFeDCHlirvAXdxJ70vvQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756819819;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1Tuj4d2o1aVaUTb7IB0TvNttUNIo+iNkmbKZxn0ZJbI=;
 b=4CjRX9DIL2jSsq7gkopogIh0clK1gdyxffBIjCsk1yml5Sjy03L9L75Kzw3z3TBvlsvFp6
 ge/HKWZ5zlJuboAQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="JPg/JMzz";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4CjRX9DI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756819819; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1Tuj4d2o1aVaUTb7IB0TvNttUNIo+iNkmbKZxn0ZJbI=;
 b=JPg/JMzzfKaLNRfEcPx7qWYPytsiMSsNMVBSvEEZBPuWnjIG2WHl9z7Qs81jg2F77l3ktd
 PGrW/EiSoSFg1sq3PYMDXqbYbCilQpUt49Nfdxn43U/Vt9CZxYiD5cr/bUDiIkmvVII4Di
 jjHES0Ekx83MFeDCHlirvAXdxJ70vvQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756819819;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1Tuj4d2o1aVaUTb7IB0TvNttUNIo+iNkmbKZxn0ZJbI=;
 b=4CjRX9DIL2jSsq7gkopogIh0clK1gdyxffBIjCsk1yml5Sjy03L9L75Kzw3z3TBvlsvFp6
 ge/HKWZ5zlJuboAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B6D7013882;
 Tue,  2 Sep 2025 13:30:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 1cJtK2rxtmjKXAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 02 Sep 2025 13:30:18 +0000
Message-ID: <d5ca271e-899f-4240-9a0a-99f70a81c000@suse.de>
Date: Tue, 2 Sep 2025 15:30:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/29] drm/atomic: Only call atomic_destroy_state on a
 !NULL pointer
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
 <20250902-drm-state-readout-v1-8-14ad5315da3f@kernel.org>
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
In-Reply-To: <20250902-drm-state-readout-v1-8-14ad5315da3f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com,ffwll.ch,intel.com,linaro.org,ideasonboard.com,kwiboo.se,iki.fi];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCPT_COUNT_TWELVE(0.00)[15]; SUBJECT_HAS_EXCLAIM(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TAGGED_RCPT(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 221301F391
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



Am 02.09.25 um 10:32 schrieb Maxime Ripard:
> The drm_atomic_state structure is freed through the
> drm_atomic_state_put() function, that eventually calls
> drm_atomic_state_default_clear() by default when there's no active
> users of that state.
>
> It then iterates over all entities with a state, and will call the
> atomic_destroy_state callback on the state pointer. The state pointer is
> mostly used these days to point to which of the old or new state needs
> to be freed, depending on whether the state was committed or not.
>
> So it all makes sense.
>
> However, with the hardware state readout support approaching, we might
> have a state, with multiple entities in it, but no state to free because
> we want them to persist. In such a case, state is going to be NULL, and
> thus we'll end up with NULL pointer dereference.
>
> In order to make it work, let's first test if the state pointer isn't
> NULL before calling atomic_destroy_state on it.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/drm_atomic.c | 23 +++++++++++++++--------
>   1 file changed, 15 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 38f2b2633fa992b3543e8c425c7faeab1ce69765..f26678835a94f40da56a8c1297d92f226d7ff2e2 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -249,12 +249,14 @@ void drm_atomic_state_default_clear(struct drm_atomic_state *state)
>   		struct drm_connector *connector = state->connectors[i].ptr;
>   
>   		if (!connector)
>   			continue;
>   
> -		connector->funcs->atomic_destroy_state(connector,
> -						       state->connectors[i].state);
> +		if (state->connectors[i].state)
> +			connector->funcs->atomic_destroy_state(connector,
> +							       state->connectors[i].state);
> +
>   		state->connectors[i].ptr = NULL;
>   		state->connectors[i].state = NULL;
>   		state->connectors[i].old_state = NULL;
>   		state->connectors[i].new_state = NULL;
>   		drm_connector_put(connector);
> @@ -264,12 +266,13 @@ void drm_atomic_state_default_clear(struct drm_atomic_state *state)
>   		struct drm_crtc *crtc = state->crtcs[i].ptr;
>   
>   		if (!crtc)
>   			continue;
>   
> -		crtc->funcs->atomic_destroy_state(crtc,
> -						  state->crtcs[i].state);
> +		if (state->crtcs[i].state)
> +			crtc->funcs->atomic_destroy_state(crtc,
> +							  state->crtcs[i].state);
>   
>   		state->crtcs[i].ptr = NULL;
>   		state->crtcs[i].state = NULL;
>   		state->crtcs[i].old_state = NULL;
>   		state->crtcs[i].new_state = NULL;
> @@ -284,12 +287,14 @@ void drm_atomic_state_default_clear(struct drm_atomic_state *state)
>   		struct drm_plane *plane = state->planes[i].ptr;
>   
>   		if (!plane)
>   			continue;
>   
> -		plane->funcs->atomic_destroy_state(plane,
> -						   state->planes[i].state);
> +		if (state->planes[i].state)
> +			plane->funcs->atomic_destroy_state(plane,
> +							       state->planes[i].state);
> +
>   		state->planes[i].ptr = NULL;
>   		state->planes[i].state = NULL;
>   		state->planes[i].old_state = NULL;
>   		state->planes[i].new_state = NULL;
>   	}
> @@ -298,12 +303,14 @@ void drm_atomic_state_default_clear(struct drm_atomic_state *state)
>   		struct drm_private_obj *obj = state->private_objs[i].ptr;
>   
>   		if (!obj)
>   			continue;
>   
> -		obj->funcs->atomic_destroy_state(obj,
> -						 state->private_objs[i].state);
> +		if (state->private_objs[i].state)
> +			obj->funcs->atomic_destroy_state(obj,
> +							       state->private_objs[i].state);
> +
>   		state->private_objs[i].ptr = NULL;
>   		state->private_objs[i].state = NULL;
>   		state->private_objs[i].old_state = NULL;
>   		state->private_objs[i].new_state = NULL;
>   	}
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


