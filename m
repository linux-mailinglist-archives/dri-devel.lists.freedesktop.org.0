Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06493C5374C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 17:40:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E08B210E77D;
	Wed, 12 Nov 2025 16:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="vfo18s7z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="55TtKFdQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vfo18s7z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="55TtKFdQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D351410E0E5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 16:40:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 615F221CF1;
 Wed, 12 Nov 2025 16:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762965618; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dLv7EIn0hWHREKYJYlM30qBrLZB9u5y3f7faL2TW1y4=;
 b=vfo18s7zafh5sd2Oq3E8rk7oQcVoRdV/6U0K8NpK5aZxRbWFeQrd5W8b+FlF7v208M8uQd
 UZ7GPvVutlC44McMVp4KH6SbD6kvglo4a95HhmRJneiFWG4BqXDuzOTS+LPX36gkdKWb42
 jhrGbTth8Sm0vSntZYs4T/t/a+qkIi0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762965618;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dLv7EIn0hWHREKYJYlM30qBrLZB9u5y3f7faL2TW1y4=;
 b=55TtKFdQa1rKWpTeHJkzhwLhGAfwToCMCkTLObblKeY9I3cmGiGGAE0xOFCkgm3wpPxil3
 qAGxfxHFBz7uEsAw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vfo18s7z;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=55TtKFdQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762965618; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dLv7EIn0hWHREKYJYlM30qBrLZB9u5y3f7faL2TW1y4=;
 b=vfo18s7zafh5sd2Oq3E8rk7oQcVoRdV/6U0K8NpK5aZxRbWFeQrd5W8b+FlF7v208M8uQd
 UZ7GPvVutlC44McMVp4KH6SbD6kvglo4a95HhmRJneiFWG4BqXDuzOTS+LPX36gkdKWb42
 jhrGbTth8Sm0vSntZYs4T/t/a+qkIi0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762965618;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dLv7EIn0hWHREKYJYlM30qBrLZB9u5y3f7faL2TW1y4=;
 b=55TtKFdQa1rKWpTeHJkzhwLhGAfwToCMCkTLObblKeY9I3cmGiGGAE0xOFCkgm3wpPxil3
 qAGxfxHFBz7uEsAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 359563EA61;
 Wed, 12 Nov 2025 16:40:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +5PkC3K4FGkwOAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 12 Nov 2025 16:40:18 +0000
Message-ID: <876dd458-283a-434e-85ef-470d635bc996@suse.de>
Date: Wed, 12 Nov 2025 17:40:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/24] drm/vblank: pass vblank to __get_vblank_counter()
 and drm_max_vblank_count()
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 ville.syrjala@linux.intel.com
References: <cover.1762791343.git.jani.nikula@intel.com>
 <c2e143b5c10f6f1e02840078a52e9fc467e9bc24.1762791343.git.jani.nikula@intel.com>
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
In-Reply-To: <c2e143b5c10f6f1e02840078a52e9fc467e9bc24.1762791343.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 615F221CF1
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_FIVE(0.00)[5];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.51
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



Am 10.11.25 um 17:17 schrieb Jani Nikula:
> Use the vblank pointer instead of a dev, pipe pair to simplify code.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/drm_vblank.c | 34 +++++++++++++++++-----------------
>   1 file changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 34d0b6939d52..955cea949d3d 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -209,27 +209,27 @@ static void store_vblank(struct drm_vblank_crtc *vblank,
>   	write_sequnlock(&vblank->seqlock);
>   }
>   
> -static u32 drm_max_vblank_count(struct drm_device *dev, unsigned int pipe)
> +static u32 drm_max_vblank_count(struct drm_vblank_crtc *vblank)
>   {
> -	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
> -
> -	return vblank->max_vblank_count ?: dev->max_vblank_count;
> +	return vblank->max_vblank_count ?: vblank->dev->max_vblank_count;
>   }
>   
>   /*
>    * "No hw counter" fallback implementation of .get_vblank_counter() hook,
>    * if there is no usable hardware frame counter available.
>    */
> -static u32 drm_vblank_no_hw_counter(struct drm_device *dev, unsigned int pipe)
> +static u32 drm_vblank_no_hw_counter(struct drm_vblank_crtc *vblank)
>   {
> -	drm_WARN_ON_ONCE(dev, drm_max_vblank_count(dev, pipe) != 0);
> +	drm_WARN_ON_ONCE(vblank->dev, drm_max_vblank_count(vblank) != 0);
>   	return 0;
>   }
>   
> -static u32 __get_vblank_counter(struct drm_device *dev, unsigned int pipe)
> +static u32 __get_vblank_counter(struct drm_vblank_crtc *vblank)
>   {
> +	struct drm_device *dev = vblank->dev;
> +
>   	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
> -		struct drm_crtc *crtc = drm_crtc_from_index(dev, pipe);
> +		struct drm_crtc *crtc = drm_crtc_from_vblank(vblank);
>   
>   		if (drm_WARN_ON(dev, !crtc))
>   			return 0;
> @@ -238,7 +238,7 @@ static u32 __get_vblank_counter(struct drm_device *dev, unsigned int pipe)
>   			return crtc->funcs->get_vblank_counter(crtc);
>   	}
>   
> -	return drm_vblank_no_hw_counter(dev, pipe);
> +	return drm_vblank_no_hw_counter(vblank);
>   }
>   
>   /*
> @@ -266,9 +266,9 @@ static void drm_reset_vblank_timestamp(struct drm_vblank_crtc *vblank)
>   	 * when drm_vblank_enable() applies the diff
>   	 */
>   	do {
> -		cur_vblank = __get_vblank_counter(dev, pipe);
> +		cur_vblank = __get_vblank_counter(vblank);
>   		rc = drm_get_last_vbltimestamp(dev, pipe, &t_vblank, false);
> -	} while (cur_vblank != __get_vblank_counter(dev, pipe) && --count > 0);
> +	} while (cur_vblank != __get_vblank_counter(vblank) && --count > 0);
>   
>   	/*
>   	 * Only reinitialize corresponding vblank timestamp if high-precision query
> @@ -309,7 +309,7 @@ static void drm_update_vblank_count(struct drm_vblank_crtc *vblank,
>   	ktime_t t_vblank;
>   	int count = DRM_TIMESTAMP_MAXRETRIES;
>   	int framedur_ns = vblank->framedur_ns;
> -	u32 max_vblank_count = drm_max_vblank_count(dev, pipe);
> +	u32 max_vblank_count = drm_max_vblank_count(vblank);
>   
>   	/*
>   	 * Interrupts were disabled prior to this call, so deal with counter
> @@ -324,9 +324,9 @@ static void drm_update_vblank_count(struct drm_vblank_crtc *vblank,
>   	 * corresponding vblank timestamp.
>   	 */
>   	do {
> -		cur_vblank = __get_vblank_counter(dev, pipe);
> +		cur_vblank = __get_vblank_counter(vblank);
>   		rc = drm_get_last_vbltimestamp(dev, pipe, &t_vblank, in_vblank_irq);
> -	} while (cur_vblank != __get_vblank_counter(dev, pipe) && --count > 0);
> +	} while (cur_vblank != __get_vblank_counter(vblank) && --count > 0);
>   
>   	if (max_vblank_count) {
>   		/* trust the hw counter when it's around */
> @@ -1555,7 +1555,7 @@ void drm_crtc_vblank_restore(struct drm_crtc *crtc)
>   	u64 diff_ns;
>   	u32 cur_vblank, diff = 1;
>   	int count = DRM_TIMESTAMP_MAXRETRIES;
> -	u32 max_vblank_count = drm_max_vblank_count(dev, pipe);
> +	u32 max_vblank_count = drm_max_vblank_count(vblank);
>   
>   	drm_WARN_ON_ONCE(dev, !crtc->funcs->get_vblank_timestamp);
>   	drm_WARN_ON_ONCE(dev, vblank->inmodeset);
> @@ -1570,9 +1570,9 @@ void drm_crtc_vblank_restore(struct drm_crtc *crtc)
>   	framedur_ns = vblank->framedur_ns;
>   
>   	do {
> -		cur_vblank = __get_vblank_counter(dev, pipe);
> +		cur_vblank = __get_vblank_counter(vblank);
>   		drm_get_last_vbltimestamp(dev, pipe, &t_vblank, false);
> -	} while (cur_vblank != __get_vblank_counter(dev, pipe) && --count > 0);
> +	} while (cur_vblank != __get_vblank_counter(vblank) && --count > 0);
>   
>   	diff_ns = ktime_to_ns(ktime_sub(t_vblank, vblank->time));
>   	if (framedur_ns)

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


