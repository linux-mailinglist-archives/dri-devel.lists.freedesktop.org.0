Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC846C53858
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 17:54:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF39E10E0FC;
	Wed, 12 Nov 2025 16:54:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="G7TgEqeg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SsyNx3Lp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LtPmy0gH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DAxVn/+h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3119910E0FC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 16:54:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D99FE21C1B;
 Wed, 12 Nov 2025 16:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762966474; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PeWWzh2SfhDhzPEsOiqb2Zg+WwOrRpMSYOa8n/GqIKc=;
 b=G7TgEqegkqZjQBY4bv/r8HCNxrXV5ErAujSBC6gsyGBkesTgXsVGo0gPq57uiHzU42qFpf
 YjE/U5f86XajsLnUIVCWTDccAkVpEJ5Jpa7Yj9Df058/dmbHW342FKK3okPuwNmRCDhMSU
 h0ooJ1j/TN/qwQmDrv+CTXDBADTulyY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762966474;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PeWWzh2SfhDhzPEsOiqb2Zg+WwOrRpMSYOa8n/GqIKc=;
 b=SsyNx3LprQXgZNSk8vuqlfTbnvZh0Dd9DpHeBIdwyR1k1k9ELbs1YF75VRiDYzpe4O7zIF
 W8BPWlndF3s+7uAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762966473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PeWWzh2SfhDhzPEsOiqb2Zg+WwOrRpMSYOa8n/GqIKc=;
 b=LtPmy0gHbqEq3qnTRuj4fyAJb1xvo1LzLQh0FT6Y8I7LnKO+nmo/v/2UblhY/DGw1XBqGA
 r/7e0f8Gds1zABzl7OKoDgIsmyD1c7inQxBYT9dfo9hXd4Enes4qgFrURlhN+V9QA3upEl
 gl/5eUOnq1ssB7ydWwVNNNJWZn4CGJA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762966473;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PeWWzh2SfhDhzPEsOiqb2Zg+WwOrRpMSYOa8n/GqIKc=;
 b=DAxVn/+h1K1JDOltkZjjABbZ/oMpTwE2p2q8/n9x7COLsNAh6r+O5BwXSZHaVfcXWi3y9n
 cDeZBcOxSUcMpUBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AA7593EA61;
 Wed, 12 Nov 2025 16:54:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sdROJ8m7FGk8RgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 12 Nov 2025 16:54:33 +0000
Message-ID: <348198aa-9736-4ca9-b476-5d3a020f1c9d@suse.de>
Date: Wed, 12 Nov 2025 17:54:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/24] drm/vblank: reduce pipe checks
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 ville.syrjala@linux.intel.com
References: <cover.1762791343.git.jani.nikula@intel.com>
 <472777431de3c0f8a8d43e2ee7a55b3a170d138c.1762791343.git.jani.nikula@intel.com>
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
In-Reply-To: <472777431de3c0f8a8d43e2ee7a55b3a170d138c.1762791343.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[5];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:mid, suse.com:url,
 imap1.dmz-prg2.suse.org:helo, intel.com:email]
X-Spam-Flag: NO
X-Spam-Score: -4.30
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



Am 10.11.25 um 17:17 schrieb Jani Nikula:
> Now that drm_vblank_crtc() is the only place that indexes dev->vblank[],
> and its usage has reduced considerably, add the primary pipe
> out-of-bounds check there, and return NULL. Expect callers to check it
> and act accordingly.
>
> In drm_crtc_vblank_crtc(), warn and return NULL, and let it go boom. If
> the crtc->pipe is out of bounds, it's a driver error that needs to be
> fixed.
>
> Remove superfluous pipe checks all around.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

See my comment below.

> ---
>   drivers/gpu/drm/drm_vblank.c | 36 +++++++++++++++---------------------
>   1 file changed, 15 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 44fb8d225485..7829e64e42b4 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -177,13 +177,22 @@ MODULE_PARM_DESC(timestamp_precision_usec, "Max. error on timestamps [usecs]");
>   static struct drm_vblank_crtc *
>   drm_vblank_crtc(struct drm_device *dev, unsigned int pipe)
>   {
> +	if (pipe >= dev->num_crtcs)
> +		return NULL;
> +
>   	return &dev->vblank[pipe];
>   }
>   
>   struct drm_vblank_crtc *
>   drm_crtc_vblank_crtc(struct drm_crtc *crtc)
>   {
> -	return drm_vblank_crtc(crtc->dev, drm_crtc_index(crtc));
> +	struct drm_vblank_crtc *vblank;
> +
> +	vblank = drm_vblank_crtc(crtc->dev, drm_crtc_index(crtc));
> +	if (drm_WARN_ON(crtc->dev, !vblank))
> +		return NULL;
> +
> +	return vblank;
>   }
>   EXPORT_SYMBOL(drm_crtc_vblank_crtc);
>   
> @@ -631,7 +640,6 @@ void drm_calc_timestamping_constants(struct drm_crtc *crtc,
>   				     const struct drm_display_mode *mode)
>   {
>   	struct drm_device *dev = crtc->dev;
> -	unsigned int pipe = drm_crtc_index(crtc);
>   	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
>   	int linedur_ns = 0, framedur_ns = 0;
>   	int dotclock = mode->crtc_clock;
> @@ -639,9 +647,6 @@ void drm_calc_timestamping_constants(struct drm_crtc *crtc,
>   	if (!drm_dev_has_vblank(dev))
>   		return;
>   
> -	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
> -		return;
> -
>   	/* Valid dotclock? */
>   	if (dotclock > 0) {
>   		int frame_size = mode->crtc_htotal * mode->crtc_vtotal;
> @@ -724,11 +729,6 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
>   	int vpos, hpos, i;
>   	int delta_ns, duration_ns;
>   
> -	if (pipe >= dev->num_crtcs) {
> -		drm_err(dev, "Invalid crtc %u\n", pipe);
> -		return false;
> -	}
> -
>   	/* Scanout position query not supported? Should not happen. */
>   	if (!get_scanout_position) {
>   		drm_err(dev, "Called from CRTC w/o get_scanout_position()!?\n");
> @@ -1339,9 +1339,6 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
>   	ktime_t now;
>   	u64 seq;
>   
> -	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
> -		return;
> -
>   	/*
>   	 * Grab event_lock early to prevent vblank work from being scheduled
>   	 * while we're in the middle of shutting down vblank interrupts
> @@ -1480,9 +1477,6 @@ void drm_crtc_vblank_on_config(struct drm_crtc *crtc,
>   	unsigned int pipe = drm_crtc_index(crtc);
>   	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
>   
> -	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
> -		return;
> -
>   	spin_lock_irq(&dev->vbl_lock);
>   	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
>   		    pipe, vblank->enabled, vblank->inmodeset);
> @@ -1764,10 +1758,9 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>   		pipe = pipe_index;
>   	}
>   
> -	if (pipe >= dev->num_crtcs)
> -		return -EINVAL;
> -
>   	vblank = drm_vblank_crtc(dev, pipe);
> +	if (!vblank)
> +		return -EINVAL;
>   
>   	/* If the counter is currently enabled and accurate, short-circuit
>   	 * queries to return the cached timestamp of the last vblank.
> @@ -1902,14 +1895,15 @@ static void drm_handle_vblank_events(struct drm_vblank_crtc *vblank)
>    */
>   bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
>   {
> -	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
> +	struct drm_vblank_crtc *vblank;
>   	unsigned long irqflags;
>   	bool disable_irq;
>   
>   	if (drm_WARN_ON_ONCE(dev, !drm_dev_has_vblank(dev)))
>   		return false;
>   
> -	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
> +	vblank = drm_vblank_crtc(dev, pipe);
> +	if (drm_WARN_ON(dev, !vblank))
>   		return false;

This can happen on each interrupt. Rather use drm_WARN_ON_ONCE here.


>   
>   	spin_lock_irqsave(&dev->event_lock, irqflags);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


