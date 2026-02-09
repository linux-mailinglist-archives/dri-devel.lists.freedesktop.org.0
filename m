Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIWjHhqbiWkv/gQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 09:30:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A8E10CFB5
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 09:30:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C8C10E33A;
	Mon,  9 Feb 2026 08:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="lgBKvltS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uzk17wv+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lgBKvltS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uzk17wv+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B6910E33A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 08:30:13 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 808DE3E710;
 Mon,  9 Feb 2026 08:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770625812; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gWWaoaj4DxsJ36ynhxlm+5JFKGCSP8VNSjM2kjDoJUA=;
 b=lgBKvltS07NrJnlxb8wSIgqWa3pNrzCmovteuUqqwon8mG1QVsRsCj4mMSkCSuDNGonPFP
 5OL2F00Roo/7XTwnJ2hKRS9FewOgxS8LZ1WJRQ3IjOateVikG3B2bFtGkbOMrYNlJYiYpF
 oeE87SyIIZ4pMeWHStEV57cpGsNlRQw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770625812;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gWWaoaj4DxsJ36ynhxlm+5JFKGCSP8VNSjM2kjDoJUA=;
 b=uzk17wv+6/W79wOCm/bqIBN0R7XmBk3PPq58lww0uilK4IVK0gh9laMHxPuvyfYq3UER/e
 UA+sFwG7ZohQoBCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770625812; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gWWaoaj4DxsJ36ynhxlm+5JFKGCSP8VNSjM2kjDoJUA=;
 b=lgBKvltS07NrJnlxb8wSIgqWa3pNrzCmovteuUqqwon8mG1QVsRsCj4mMSkCSuDNGonPFP
 5OL2F00Roo/7XTwnJ2hKRS9FewOgxS8LZ1WJRQ3IjOateVikG3B2bFtGkbOMrYNlJYiYpF
 oeE87SyIIZ4pMeWHStEV57cpGsNlRQw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770625812;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gWWaoaj4DxsJ36ynhxlm+5JFKGCSP8VNSjM2kjDoJUA=;
 b=uzk17wv+6/W79wOCm/bqIBN0R7XmBk3PPq58lww0uilK4IVK0gh9laMHxPuvyfYq3UER/e
 UA+sFwG7ZohQoBCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0FE603EA63;
 Mon,  9 Feb 2026 08:30:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id naFuAhSbiWl5RAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Feb 2026 08:30:12 +0000
Message-ID: <ead8313b-3823-467f-a402-d5436bfc13fa@suse.de>
Date: Mon, 9 Feb 2026 09:30:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/15] drm/bridge: Switch private_obj initialization to
 atomic_create_state
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com>
 <20260128-drm-private-obj-reset-v4-4-90891fa3d3b0@redhat.com>
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
In-Reply-To: <20260128-drm-private-obj-reset-v4-4-90891fa3d3b0@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:maarten.lankhorst@linux.intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.baryshkov@oss.qualcomm.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,oss.qualcomm.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,suse.com:url,suse.de:email,suse.de:dkim,suse.de:mid,intel.com:email,linaro.org:email,kwiboo.se:email]
X-Rspamd-Queue-Id: 52A8E10CFB5
X-Rspamd-Action: no action



Am 28.01.26 um 13:43 schrieb Maxime Ripard:
> The bridge implementation relies on a drm_private_obj, that is
> initialized by allocating and initializing a state, and then passing it
> to drm_private_obj_init.
>
> Since we're gradually moving away from that pattern to the more
> established one relying on a atomic_create_state implementation, let's
> migrate this instance to the new pattern.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>   drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
>   drivers/gpu/drm/drm_bridge.c              | 31 ++++++++++++++++---------------
>   2 files changed, 17 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index d21f32f0ad51f4305f75d01be58dc404acf7674c..716631e8a10a04674ae498b7fcbfc64a668a051e 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -823,10 +823,11 @@ EXPORT_SYMBOL(drm_atomic_helper_bridge_destroy_state);
>    */
>   void __drm_atomic_helper_bridge_reset(struct drm_bridge *bridge,
>   				      struct drm_bridge_state *state)
>   {
>   	memset(state, 0, sizeof(*state));
> +	__drm_atomic_helper_private_obj_create_state(&bridge->base, &state->base);
>   	state->bridge = bridge;
>   }
>   EXPORT_SYMBOL(__drm_atomic_helper_bridge_reset);
>   
>   /**
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 3b165a0d1e779ebcf7fe710a28ce3d15d7ab9c81..94864e05619d1678ea6c0571e889f951e17d8d16 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -458,11 +458,25 @@ drm_bridge_atomic_destroy_priv_state(struct drm_private_obj *obj,
>   	struct drm_bridge *bridge = drm_priv_to_bridge(obj);
>   
>   	bridge->funcs->atomic_destroy_state(bridge, state);
>   }
>   
> +static struct drm_private_state *
> +drm_bridge_atomic_create_priv_state(struct drm_private_obj *obj)
> +{
> +	struct drm_bridge *bridge = drm_priv_to_bridge(obj);
> +	struct drm_bridge_state *state;
> +
> +	state = bridge->funcs->atomic_reset(bridge);
> +	if (IS_ERR(state))
> +		return ERR_CAST(state);
> +
> +	return &state->base;
> +}
> +
>   static const struct drm_private_state_funcs drm_bridge_priv_state_funcs = {
> +	.atomic_create_state = drm_bridge_atomic_create_priv_state,
>   	.atomic_duplicate_state = drm_bridge_atomic_duplicate_priv_state,
>   	.atomic_destroy_state = drm_bridge_atomic_destroy_priv_state,
>   };
>   
>   static bool drm_bridge_is_atomic(struct drm_bridge *bridge)
> @@ -535,30 +549,17 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>   		ret = bridge->funcs->attach(bridge, encoder, flags);
>   		if (ret < 0)
>   			goto err_reset_bridge;
>   	}
>   
> -	if (drm_bridge_is_atomic(bridge)) {
> -		struct drm_bridge_state *state;
> -
> -		state = bridge->funcs->atomic_reset(bridge);
> -		if (IS_ERR(state)) {
> -			ret = PTR_ERR(state);
> -			goto err_detach_bridge;
> -		}
> -
> +	if (drm_bridge_is_atomic(bridge))
>   		drm_atomic_private_obj_init(bridge->dev, &bridge->base,
> -					    &state->base,
> +					    NULL,
>   					    &drm_bridge_priv_state_funcs);
> -	}
>   
>   	return 0;
>   
> -err_detach_bridge:
> -	if (bridge->funcs->detach)
> -		bridge->funcs->detach(bridge);
> -
>   err_reset_bridge:
>   	bridge->dev = NULL;
>   	bridge->encoder = NULL;
>   	list_del(&bridge->chain_node);
>   
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


