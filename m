Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64892B40620
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 16:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CD110E73B;
	Tue,  2 Sep 2025 14:06:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="NowuO1XU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qJvO2GVB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NowuO1XU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qJvO2GVB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BFB10E73B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 14:06:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 57F0D211D0;
 Tue,  2 Sep 2025 14:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756822006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=pCeyRXDjeXdIYPa2EpXAmE++weae5wnHDPz0vJ1nNwI=;
 b=NowuO1XU6pCdFMxyzfVwCM1NVTRvLoMLTMno+dzrAQb415IHogH4B7aBOu4eNUly5QqDI5
 5kd6OlDY5NnSRVMgtpTuSL/MI/PGOEDdyPSUxJVn3oMLDPyZ087tRNWFt9lRGrYa/cfG6I
 fvz8tfGTSrXOrReF5FClCJ6WzNRO0T4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756822006;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=pCeyRXDjeXdIYPa2EpXAmE++weae5wnHDPz0vJ1nNwI=;
 b=qJvO2GVB8bhj1tslii9DcANIwb2ZqQIJBjpFScu7IfvOlu6Zkad9i/0ig5gQ24R8e+O2Mk
 sEXdiotHFFhOFkCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756822006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=pCeyRXDjeXdIYPa2EpXAmE++weae5wnHDPz0vJ1nNwI=;
 b=NowuO1XU6pCdFMxyzfVwCM1NVTRvLoMLTMno+dzrAQb415IHogH4B7aBOu4eNUly5QqDI5
 5kd6OlDY5NnSRVMgtpTuSL/MI/PGOEDdyPSUxJVn3oMLDPyZ087tRNWFt9lRGrYa/cfG6I
 fvz8tfGTSrXOrReF5FClCJ6WzNRO0T4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756822006;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=pCeyRXDjeXdIYPa2EpXAmE++weae5wnHDPz0vJ1nNwI=;
 b=qJvO2GVB8bhj1tslii9DcANIwb2ZqQIJBjpFScu7IfvOlu6Zkad9i/0ig5gQ24R8e+O2Mk
 sEXdiotHFFhOFkCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E4BF113882;
 Tue,  2 Sep 2025 14:06:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uC4uNvX5tmjvaQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 02 Sep 2025 14:06:45 +0000
Message-ID: <3a73aada-48ad-45ad-8144-b58760113d6f@suse.de>
Date: Tue, 2 Sep 2025 16:06:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/29] drm/tidss: dispc: Improve mode checking logs
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
 <20250902-drm-state-readout-v1-24-14ad5315da3f@kernel.org>
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
In-Reply-To: <20250902-drm-state-readout-v1-24-14ad5315da3f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TAGGED_RCPT(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWELVE(0.00)[15];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com,ffwll.ch,intel.com,linaro.org,ideasonboard.com,kwiboo.se,iki.fi];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -2.80
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
> The dispc_vp_mode_valid() function checks whether a mode can be handled
> by the display controller.
>
> There's a whole bunch of criteria, and it's not clear when a rejection
> happens why it did. Let's add a bunch of logs on error to make it
> clearer.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>   drivers/gpu/drm/tidss/tidss_dispc.c | 47 +++++++++++++++++++++++++++++--------
>   1 file changed, 37 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index 32248b5f71b7566dc33d7a7db0efb26d3a9ed1c3..ef948e3041e10bc65cf2c4794a4e4cffa7e3fb3a 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -1349,47 +1349,63 @@ static void dispc_vp_set_default_color(struct dispc_device *dispc,
>   
>   enum drm_mode_status dispc_vp_mode_valid(struct dispc_device *dispc,
>   					 u32 hw_videoport,
>   					 const struct drm_display_mode *mode)
>   {
> +	struct tidss_device *tidss = dispc->tidss;
> +	struct drm_device *dev = &tidss->ddev;
>   	u32 hsw, hfp, hbp, vsw, vfp, vbp;
>   	enum dispc_vp_bus_type bus_type;
>   	int max_pclk;
>   
>   	bus_type = dispc->feat->vp_bus_type[hw_videoport];
>   
>   	max_pclk = dispc->feat->max_pclk_khz[bus_type];
>   
> -	if (WARN_ON(max_pclk == 0))
> +	if (WARN_ON(max_pclk == 0)) {

Better remove this WARN_ON(). User-space could trigger it and spam the 
kernel logs. It's also a driver bug, I think.

> +		drm_dbg(dev, "Invalid maximum pixel clock");
>   		return MODE_BAD;
> +	}
>   
> -	if (mode->clock < dispc->feat->min_pclk_khz)
> +	if (mode->clock < dispc->feat->min_pclk_khz) {
> +		drm_dbg(dev, "Mode pixel clock below hardware minimum pixel clock");
>   		return MODE_CLOCK_LOW;
> +	}
>   
> -	if (mode->clock > max_pclk)
> +	if (mode->clock > max_pclk) {
> +		drm_dbg(dev, "Mode pixel clock above hardware maximum pixel clock");
>   		return MODE_CLOCK_HIGH;
> +	}
>   
> -	if (mode->hdisplay > 4096)
> +	if (mode->hdisplay > 4096) {
> +		drm_dbg(dev, "Number of active horizontal pixels above hardware limits.");
>   		return MODE_BAD;
> +	}
>   
> -	if (mode->vdisplay > 4096)
> +	if (mode->vdisplay > 4096) {
> +		drm_dbg(dev, "Number of active vertical lines above hardware limits.");
>   		return MODE_BAD;
> +	}
>   
>   	/* TODO: add interlace support */
> -	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
> +	if (mode->flags & DRM_MODE_FLAG_INTERLACE) {
> +		drm_dbg(dev, "Interlace modes not suppported.");
>   		return MODE_NO_INTERLACE;
> +	}
>   
>   	/*
>   	 * Enforce the output width is divisible by 2. Actually this
>   	 * is only needed in following cases:
>   	 * - YUV output selected (BT656, BT1120)
>   	 * - Dithering enabled
>   	 * - TDM with TDMCycleFormat == 3
>   	 * But for simplicity we enforce that always.
>   	 */
> -	if ((mode->hdisplay % 2) != 0)
> +	if ((mode->hdisplay % 2) != 0) {
> +		drm_dbg(dev, "Number of active horizontal pixels must be even.");
>   		return MODE_BAD_HVALUE;
> +	}
>   
>   	hfp = mode->hsync_start - mode->hdisplay;
>   	hsw = mode->hsync_end - mode->hsync_start;
>   	hbp = mode->htotal - mode->hsync_end;
>   
> @@ -1397,29 +1413,40 @@ enum drm_mode_status dispc_vp_mode_valid(struct dispc_device *dispc,
>   	vsw = mode->vsync_end - mode->vsync_start;
>   	vbp = mode->vtotal - mode->vsync_end;
>   
>   	if (hsw < 1 || hsw > 256 ||
>   	    hfp < 1 || hfp > 4096 ||
> -	    hbp < 1 || hbp > 4096)
> +	    hbp < 1 || hbp > 4096) {
> +		drm_dbg(dev,
> +			"Horizontal blanking or sync outside of hardware limits (fp: %u, sw: %u, bp: %u).",
> +			hfp, hsw, hbp);
>   		return MODE_BAD_HVALUE;
> +	}
>   
>   	if (vsw < 1 || vsw > 256 ||
> -	    vfp > 4095 || vbp > 4095)
> +	    vfp > 4095 || vbp > 4095) {
> +		drm_dbg(dev,
> +			"Vertical blanking or sync outside of hardware limits (fp: %u, sw: %u, bp: %u).",
> +			vfp, vsw, vbp);
>   		return MODE_BAD_VVALUE;
> +	}
>   
>   	if (dispc->memory_bandwidth_limit) {
>   		const unsigned int bpp = 4;
>   		u64 bandwidth;
>   
>   		bandwidth = 1000 * mode->clock;
>   		bandwidth = bandwidth * mode->hdisplay * mode->vdisplay * bpp;
>   		bandwidth = div_u64(bandwidth, mode->htotal * mode->vtotal);
>   
> -		if (dispc->memory_bandwidth_limit < bandwidth)
> +		if (dispc->memory_bandwidth_limit < bandwidth) {
> +			drm_dbg(dev, "Required memory bandwidth outside of hardware limits.");
>   			return MODE_BAD;
> +		}
>   	}
>   
> +	drm_dbg(dev, "Mode is valid.");
>   	return MODE_OK;
>   }
>   
>   int dispc_vp_enable_clk(struct dispc_device *dispc, u32 hw_videoport)
>   {
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


