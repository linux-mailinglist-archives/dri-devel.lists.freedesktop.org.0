Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E72B4050D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 15:49:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A9410E722;
	Tue,  2 Sep 2025 13:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="1GwldwiP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4Zb+rStK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1GwldwiP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4Zb+rStK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536BA10E722
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 13:49:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BEF1721180;
 Tue,  2 Sep 2025 13:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756820949; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Wxz0Uc1f5kvFEmB6USJleWbSh5FczLUIrK4UKqBhp+g=;
 b=1GwldwiPUXZ0RgiJeG0WoLOQnC41/0OQ/Dw4E7w9fb0lInbRPHb6YTfEZWTmIVor6zStoP
 kF9PLp6x2nLiH3pACuI8OLh71jQgO6AIjGtZZCCRjWoZSXsqmrUSxXrYuViBP9TPjzSjo0
 A6BkLhYrWf+Db/O6V8qJyP/woccbLCI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756820949;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Wxz0Uc1f5kvFEmB6USJleWbSh5FczLUIrK4UKqBhp+g=;
 b=4Zb+rStKlqZBh5gn9803WpbHXniFuCoAEsOf5zHcTvR//xHRphhh/N0OzRvo8fMuntY979
 nHyaVtSq1zx6v1Aw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1GwldwiP;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4Zb+rStK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756820949; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Wxz0Uc1f5kvFEmB6USJleWbSh5FczLUIrK4UKqBhp+g=;
 b=1GwldwiPUXZ0RgiJeG0WoLOQnC41/0OQ/Dw4E7w9fb0lInbRPHb6YTfEZWTmIVor6zStoP
 kF9PLp6x2nLiH3pACuI8OLh71jQgO6AIjGtZZCCRjWoZSXsqmrUSxXrYuViBP9TPjzSjo0
 A6BkLhYrWf+Db/O6V8qJyP/woccbLCI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756820949;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Wxz0Uc1f5kvFEmB6USJleWbSh5FczLUIrK4UKqBhp+g=;
 b=4Zb+rStKlqZBh5gn9803WpbHXniFuCoAEsOf5zHcTvR//xHRphhh/N0OzRvo8fMuntY979
 nHyaVtSq1zx6v1Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3B2A913882;
 Tue,  2 Sep 2025 13:49:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UY7nDNX1tmhbYwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 02 Sep 2025 13:49:09 +0000
Message-ID: <c24cd299-388a-4223-9409-5a882b25c2f6@suse.de>
Date: Tue, 2 Sep 2025 15:49:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/29] drm/tidss: Convert to drm logging
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
 <20250902-drm-state-readout-v1-18-14ad5315da3f@kernel.org>
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
In-Reply-To: <20250902-drm-state-readout-v1-18-14ad5315da3f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: BEF1721180
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
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 TAGGED_RCPT(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo]
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
> DRM drivers should prefer the drm logging functions to the dev logging
> ones when possible. Let's convert the existing dev_* logs to their drm
> counterparts.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/tidss/tidss_crtc.c  | 4 ++--
>   drivers/gpu/drm/tidss/tidss_dispc.c | 6 ++++--
>   2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
> index da89fd01c3376352840185cd4ac355dd41fd5bb1..f497138ad053ed4be207e12eeee6c304e1c949bd 100644
> --- a/drivers/gpu/drm/tidss/tidss_crtc.c
> +++ b/drivers/gpu/drm/tidss/tidss_crtc.c
> @@ -101,11 +101,11 @@ static int tidss_crtc_atomic_check(struct drm_crtc *crtc,
>   
>   	mode = &crtc_state->adjusted_mode;
>   
>   	ok = dispc_vp_mode_valid(dispc, hw_videoport, mode);
>   	if (ok != MODE_OK) {
> -		dev_dbg(ddev->dev, "%s: bad mode: %ux%u pclk %u kHz\n",
> +		drm_dbg(ddev, "%s: bad mode: %ux%u pclk %u kHz\n",
>   			__func__, mode->hdisplay, mode->vdisplay, mode->clock);
>   		return -EINVAL;
>   	}
>   
>   	if (drm_atomic_crtc_needs_modeset(crtc_state))
> @@ -170,11 +170,11 @@ static void tidss_crtc_atomic_flush(struct drm_crtc *crtc,
>   	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
>   	struct drm_device *ddev = crtc->dev;
>   	struct tidss_device *tidss = to_tidss(ddev);
>   	unsigned long flags;
>   
> -	dev_dbg(ddev->dev, "%s: %s is %sactive, %s modeset, event %p\n",
> +	drm_dbg(ddev, "%s: %s is %sactive, %s modeset, event %p\n",
>   		__func__, crtc->name, crtc->state->active ? "" : "not ",
>   		drm_atomic_crtc_needs_modeset(crtc->state) ? "needs" : "doesn't need",
>   		crtc->state->event);
>   
>   	/*
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index 190d32ed53f84371456ccb997d1898ed5cef9db1..8b1d6b72f303b91fbf86f7d0e351800804757126 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -1063,24 +1063,26 @@ struct dispc_bus_format *dispc_vp_find_bus_fmt(struct dispc_device *dispc,
>   }
>   
>   int dispc_vp_bus_check(struct dispc_device *dispc, u32 hw_videoport,
>   		       const struct drm_crtc_state *state)
>   {
> +	struct tidss_device *tidss = dispc->tidss;
> +	struct drm_device *dev = &tidss->ddev;
>   	const struct tidss_crtc_state *tstate = to_tidss_crtc_state(state);
>   	const struct dispc_bus_format *fmt;
>   
>   	fmt = dispc_vp_find_bus_fmt(dispc, hw_videoport, tstate->bus_format,
>   				    tstate->bus_flags);
>   	if (!fmt) {
> -		dev_dbg(dispc->dev, "%s: Unsupported bus format: %u\n",
> +		drm_dbg(dev, "%s: Unsupported bus format: %u\n",
>   			__func__, tstate->bus_format);
>   		return -EINVAL;
>   	}
>   
>   	if (dispc->feat->vp_bus_type[hw_videoport] != DISPC_VP_OLDI_AM65X &&
>   	    fmt->is_oldi_fmt) {
> -		dev_dbg(dispc->dev, "%s: %s is not OLDI-port\n",
> +		drm_dbg(dev, "%s: %s is not OLDI-port\n",
>   			__func__, dispc->feat->vp_name[hw_videoport]);
>   		return -EINVAL;
>   	}
>   
>   	return 0;
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


