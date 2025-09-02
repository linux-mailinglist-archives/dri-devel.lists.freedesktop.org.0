Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA1EB402F4
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 15:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E751910E6EA;
	Tue,  2 Sep 2025 13:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="DcJTIi0q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ES131etr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c4xceIPw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="b32QcOvH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71EC310E6EA
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 13:26:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D18AE1F394;
 Tue,  2 Sep 2025 13:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756819611; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1ibtRypUd6zVnprMadkE/QRbap/gS4yKnaDwKpQ6XkA=;
 b=DcJTIi0qZU6O47/4FZjakObfdUtM4ZI3efc4jJhQQG+6jOmFUq87gH/UkunXjYdBRbXk+J
 r86h7kxwsBsNS7qpq+UfaEaVMugq0Payxq2ST17plSDxUuC3OGtSOX6tNUVYTFMHDUHZ1d
 01yITJ3Uczyn5d7a9CnH3ImzNjO9YW8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756819611;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1ibtRypUd6zVnprMadkE/QRbap/gS4yKnaDwKpQ6XkA=;
 b=ES131etrcnEW5ZWDiOJ+DaQ+j+GhngpJZSU3dnQD72uqWjzV0U8Gz8hU6xPnaq7WmuC0eg
 sNpSrGSWIwXZZjBg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=c4xceIPw;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=b32QcOvH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756819610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1ibtRypUd6zVnprMadkE/QRbap/gS4yKnaDwKpQ6XkA=;
 b=c4xceIPwqaMp8oxJhCjh/iBPRB7FL6DaVDJCG3EK8BC7c0FjFFqWpeEJi8XriCsASoJYzN
 STdF0QJhHdPrihF0uBNEvs7X1wJfn8tsstzoyUCI60SbfvAjOi5HBEoJD0+MXTBtdB8zN6
 2Czmb2cQhgczHyqOYZ5opb0oQf0jj0o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756819610;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1ibtRypUd6zVnprMadkE/QRbap/gS4yKnaDwKpQ6XkA=;
 b=b32QcOvHuCL+VIpdpMaXIuSV3wysOmuFYNTFXnFlBxzj2tWpbfGts5WooIdNf/qPJRO80v
 KuhRXk2/9GZbGGCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 67FEF13882;
 Tue,  2 Sep 2025 13:26:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 7mUJFprwtmilWwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 02 Sep 2025 13:26:50 +0000
Message-ID: <42e891ee-87b8-448e-a0c7-4f3e3b790556@suse.de>
Date: Tue, 2 Sep 2025 15:26:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/29] drm/atomic: Implement drm_atomic_print_old_state
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
 <20250902-drm-state-readout-v1-7-14ad5315da3f@kernel.org>
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
In-Reply-To: <20250902-drm-state-readout-v1-7-14ad5315da3f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: D18AE1F394
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TAGGED_RCPT(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email]
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
> We currently have a helper to print the new states associated to a
> drm_atomic_state, but we don't have a variant to print the old state.
>
> It's somewhat expected, since we almost never care about what the new
> state looks like when we commit a new state, but we're about to change
> that.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

I assume something later in the series uses this code?

> ---
>   drivers/gpu/drm/drm_atomic.c        | 45 +++++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/drm_crtc_internal.h |  2 ++
>   2 files changed, 47 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 9b198610791d19c7fd276ca59264a961d21caf43..38f2b2633fa992b3543e8c425c7faeab1ce69765 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1875,10 +1875,55 @@ void drm_atomic_print_new_state(const struct drm_atomic_state *state,
>   	for_each_new_private_obj_in_state(state, obj, obj_state, i)
>   		drm_atomic_private_obj_print_state(p, obj_state);
>   }
>   EXPORT_SYMBOL(drm_atomic_print_new_state);
>   
> +/**
> + * drm_atomic_print_old_state - prints drm atomic state
> + * @state: atomic configuration to check
> + * @p: drm printer
> + *
> + * This functions prints the drm atomic state snapshot using the drm printer
> + * which is passed to it. This snapshot can be used for debugging purposes.
> + *
> + * Note that this function looks into the old state objects and hence its not
> + * safe to be used after the call to drm_atomic_helper_commit_hw_done().
> + */
> +void drm_atomic_print_old_state(const struct drm_atomic_state *state,
> +		struct drm_printer *p)
> +{
> +	struct drm_plane *plane;
> +	struct drm_plane_state *plane_state;
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_connector *connector;
> +	struct drm_connector_state *connector_state;
> +	struct drm_private_obj *obj;
> +	struct drm_private_state *obj_state;
> +	int i;
> +
> +	if (!p) {
> +		drm_err(state->dev, "invalid drm printer\n");
> +		return;
> +	}
> +
> +	drm_dbg_atomic(state->dev, "checking %p\n", state);
> +
> +	for_each_old_plane_in_state(state, plane, plane_state, i)
> +		drm_atomic_plane_print_state(p, plane_state);
> +
> +	for_each_old_crtc_in_state(state, crtc, crtc_state, i)
> +		drm_atomic_crtc_print_state(p, crtc_state);
> +
> +	for_each_old_connector_in_state(state, connector, connector_state, i)
> +		drm_atomic_connector_print_state(p, connector_state);
> +
> +	for_each_old_private_obj_in_state(state, obj, obj_state, i)
> +		drm_atomic_private_obj_print_state(p, obj_state);
> +}
> +EXPORT_SYMBOL(drm_atomic_print_old_state);
> +
>   static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
>   			     bool take_locks)
>   {
>   	struct drm_mode_config *config = &dev->mode_config;
>   	struct drm_plane *plane;
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
> index 89706aa8232fc0b2830af67c7588985a29653299..a8139fda1a1015c2ac8d8af3b12c5ac0b00cfc1a 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -249,10 +249,12 @@ int __drm_atomic_helper_disable_plane(struct drm_plane *plane,
>   int __drm_atomic_helper_set_config(struct drm_mode_set *set,
>   				   struct drm_atomic_state *state);
>   
>   void drm_atomic_print_new_state(const struct drm_atomic_state *state,
>   		struct drm_printer *p);
> +void drm_atomic_print_old_state(const struct drm_atomic_state *state,
> +				struct drm_printer *p);
>   
>   /* drm_atomic_uapi.c */
>   int drm_atomic_connector_commit_dpms(struct drm_atomic_state *state,
>   				     struct drm_connector *connector,
>   				     int mode);
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


