Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C829BC57D67
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 15:06:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A947710E81C;
	Thu, 13 Nov 2025 14:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="LbFrpm+M";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZY6g90Qt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0FUC9NRs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WoVEQ17K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615C910E08D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 14:06:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C8A1421270;
 Thu, 13 Nov 2025 14:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1763042761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=GbNxxemo1maMHtqOXvYcp/H0bpCDfFxUsZon7jNxje4=;
 b=LbFrpm+M1anciw4p7knOJmTDsxKmoRexKYXeYlqFzcDzGs9P+zwlOu4w/Xu+5oDzzO36Qt
 86HpjtsBtt7uom4itSvyC4GXalEIjBvuYLcRmNZXiw2IQbSIK1lAzAN/AznrgeKvLRfsG7
 +D5itWaQoOGejgZJGAtcenjMVIwW1Go=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1763042761;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=GbNxxemo1maMHtqOXvYcp/H0bpCDfFxUsZon7jNxje4=;
 b=ZY6g90QtVt5xDEUcQ7alH4PaOIp3mbdkOP+fiS0hpHjlt7RDRqLoYbLsSu7QktqHp1u0/j
 qLUdTKTzDvLeiiCQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0FUC9NRs;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WoVEQ17K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1763042760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=GbNxxemo1maMHtqOXvYcp/H0bpCDfFxUsZon7jNxje4=;
 b=0FUC9NRsGLIsQGhEk4ns73RXErAmDMVCS1haz2YGn4vQwglnQ1kwOnDZrbrmM/dRHZGJkz
 FoN9/nPsRfEwKEHT9r95JMh7jzko8yzN3fg6fLJTALn9TS5afKnt4rdCV/KewdSV1/QEG5
 bMACcbRvF+rXysFlfSJeV7kpDNRc/BY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1763042760;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=GbNxxemo1maMHtqOXvYcp/H0bpCDfFxUsZon7jNxje4=;
 b=WoVEQ17KH1pMBMfm02yVYrmfa5J7UHlCWO/pB1D5BM5fOgNpBEwScR4EYNsJyP6eELRNRR
 ft1gXtFD7fXvNRCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 75CBF3EA61;
 Thu, 13 Nov 2025 14:06:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id fkIQG8jlFWl4DQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Nov 2025 14:06:00 +0000
Message-ID: <fcf78f4b-e45d-43c2-8fb6-2366e016ed28@suse.de>
Date: Thu, 13 Nov 2025 15:05:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/24] drm/vblank: clean up debug logging
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 ville.syrjala@linux.intel.com
References: <cover.1762791343.git.jani.nikula@intel.com>
 <ac70a7318a7b9d5e25f47e97df4b0fdb8b335e74.1762791343.git.jani.nikula@intel.com>
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
In-Reply-To: <ac70a7318a7b9d5e25f47e97df4b0fdb8b335e74.1762791343.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C8A1421270
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 URIBL_BLOCKED(0.00)[intel.com:email,suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:url];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.com:url,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
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

Hi

Am 10.11.25 um 17:17 schrieb Jani Nikula:
> Use the usual [CRTC:%d:%s] when crtc is available. Start using a new
> uniform [VBLANK:%u] prefix with the pipe when crtc is not
> available. Remove extra line breaks. Use string choice helpers here and
> there. Use %pe to decode error returns.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Given Ville's comment on decoupling pipes and CRTCs, would it make sense 
to prefer [VBLANK] over [CRTC]? This seems to be possible with some of 
these changes.

Best regards
Thomas

> ---
>   drivers/gpu/drm/drm_vblank.c | 109 ++++++++++++++++-------------------
>   1 file changed, 50 insertions(+), 59 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 7829e64e42b4..5ee132b3a6b5 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -27,6 +27,7 @@
>   #include <linux/export.h>
>   #include <linux/kthread.h>
>   #include <linux/moduleparam.h>
> +#include <linux/string_choices.h>
>   
>   #include <drm/drm_crtc.h>
>   #include <drm/drm_drv.h>
> @@ -347,14 +348,13 @@ static void drm_update_vblank_count(struct drm_vblank_crtc *vblank,
>   		 * frame/field duration.
>   		 */
>   
> -		drm_dbg_vbl(dev, "crtc %u: Calculating number of vblanks."
> -			    " diff_ns = %lld, framedur_ns = %d)\n",
> +		drm_dbg_vbl(dev, "[VBLANK:%u] Calculating number of vblanks. diff_ns = %lld, framedur_ns = %d)\n",
>   			    pipe, (long long)diff_ns, framedur_ns);
>   
>   		diff = DIV_ROUND_CLOSEST_ULL(diff_ns, framedur_ns);
>   
>   		if (diff == 0 && in_vblank_irq)
> -			drm_dbg_vbl(dev, "crtc %u: Redundant vblirq ignored\n",
> +			drm_dbg_vbl(dev, "[VBLANK:%u] Redundant vblirq ignored\n",
>   				    pipe);
>   	} else {
>   		/* some kind of default for drivers w/o accurate vbl timestamping */
> @@ -372,13 +372,12 @@ static void drm_update_vblank_count(struct drm_vblank_crtc *vblank,
>   	 */
>   	if (diff > 1 && (vblank->inmodeset & 0x2)) {
>   		drm_dbg_vbl(dev,
> -			    "clamping vblank bump to 1 on crtc %u: diffr=%u"
> -			    " due to pre-modeset.\n", pipe, diff);
> +			    "[VBLANK:%u] clamping vblank bump to 1: diffr=%u due to pre-modeset.\n",
> +			    pipe, diff);
>   		diff = 1;
>   	}
>   
> -	drm_dbg_vbl(dev, "updating vblank count on crtc %u:"
> -		    " current=%llu, diff=%u, hw=%u hw_last=%u\n",
> +	drm_dbg_vbl(dev, "[VBLANK:%u] updating vblank count: current=%llu, diff=%u, hw=%u hw_last=%u\n",
>   		    pipe, (unsigned long long)atomic64_read(&vblank->count),
>   		    diff, cur_vblank, vblank->last);
>   
> @@ -517,7 +516,7 @@ static void vblank_disable_fn(struct timer_list *t)
>   
>   	spin_lock_irqsave(&dev->vbl_lock, irqflags);
>   	if (atomic_read(&vblank->refcount) == 0 && vblank->enabled) {
> -		drm_dbg_core(dev, "disabling vblank on crtc %u\n", pipe);
> +		drm_dbg_core(dev, "[VBLANK:%u] disabling vblank\n", pipe);
>   		drm_vblank_disable_and_save(vblank);
>   	}
>   	spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
> @@ -665,8 +664,8 @@ void drm_calc_timestamping_constants(struct drm_crtc *crtc,
>   		if (mode->flags & DRM_MODE_FLAG_INTERLACE)
>   			framedur_ns /= 2;
>   	} else {
> -		drm_err(dev, "crtc %u: Can't calculate constants, dotclock = 0!\n",
> -			crtc->base.id);
> +		drm_err(dev, "[CRTC:%d:%s] Can't calculate constants, dotclock = 0!\n",
> +			crtc->base.id, crtc->name);
>   	}
>   
>   	vblank->linedur_ns  = linedur_ns;
> @@ -674,11 +673,11 @@ void drm_calc_timestamping_constants(struct drm_crtc *crtc,
>   	drm_mode_copy(&vblank->hwmode, mode);
>   
>   	drm_dbg_core(dev,
> -		     "crtc %u: hwmode: htotal %d, vtotal %d, vdisplay %d\n",
> -		     crtc->base.id, mode->crtc_htotal,
> +		     "[CRTC:%d:%s] hwmode: htotal %d, vtotal %d, vdisplay %d\n",
> +		     crtc->base.id, crtc->name, mode->crtc_htotal,
>   		     mode->crtc_vtotal, mode->crtc_vdisplay);
> -	drm_dbg_core(dev, "crtc %u: clock %d kHz framedur %d linedur %d\n",
> -		     crtc->base.id, dotclock, framedur_ns, linedur_ns);
> +	drm_dbg_core(dev, "[CRTC:%d:%s] clock %d kHz framedur %d linedur %d\n",
> +		     crtc->base.id, crtc->name, dotclock, framedur_ns, linedur_ns);
>   }
>   EXPORT_SYMBOL(drm_calc_timestamping_constants);
>   
> @@ -731,7 +730,8 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
>   
>   	/* Scanout position query not supported? Should not happen. */
>   	if (!get_scanout_position) {
> -		drm_err(dev, "Called from CRTC w/o get_scanout_position()!?\n");
> +		drm_err(dev, "[CRTC:%d:%s] Called from CRTC w/o get_scanout_position()!?\n",
> +			crtc->base.id, crtc->name);
>   		return false;
>   	}
>   
> @@ -744,7 +744,7 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
>   	 * Happens during initial modesetting of a crtc.
>   	 */
>   	if (mode->crtc_clock == 0) {
> -		drm_dbg_core(dev, "crtc %u: Noop due to uninitialized mode.\n",
> +		drm_dbg_core(dev, "[VBLANK:%u] Noop due to uninitialized mode.\n",
>   			     pipe);
>   		drm_WARN_ON_ONCE(dev, drm_drv_uses_atomic_modeset(dev));
>   		return false;
> @@ -769,9 +769,8 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
>   
>   		/* Return as no-op if scanout query unsupported or failed. */
>   		if (!vbl_status) {
> -			drm_dbg_core(dev,
> -				     "crtc %u : scanoutpos query failed.\n",
> -				     pipe);
> +			drm_dbg_core(dev, "[CRTC:%d:%s] scanoutpos query failed.\n",
> +				     crtc->base.id, crtc->name);
>   			return false;
>   		}
>   
> @@ -785,9 +784,8 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
>   
>   	/* Noisy system timing? */
>   	if (i == DRM_TIMESTAMP_MAXRETRIES) {
> -		drm_dbg_core(dev,
> -			     "crtc %u: Noisy timestamp %d us > %d us [%d reps].\n",
> -			     pipe, duration_ns / 1000, *max_error / 1000, i);
> +		drm_dbg_core(dev, "[CRTC:%d:%s] Noisy timestamp %d us > %d us [%d reps].\n",
> +			     crtc->base.id, crtc->name, duration_ns / 1000, *max_error / 1000, i);
>   	}
>   
>   	/* Return upper bound of timestamp precision error. */
> @@ -811,9 +809,8 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
>   	ts_etime = ktime_to_timespec64(etime);
>   	ts_vblank_time = ktime_to_timespec64(*vblank_time);
>   
> -	drm_dbg_vbl(dev,
> -		    "crtc %u : v p(%d,%d)@ %lld.%06ld -> %lld.%06ld [e %d us, %d rep]\n",
> -		    pipe, hpos, vpos,
> +	drm_dbg_vbl(dev, "[CRTC:%d:%s] v p(%d,%d)@ %lld.%06ld -> %lld.%06ld [e %d us, %d rep]\n",
> +		    crtc->base.id, crtc->name, hpos, vpos,
>   		    (u64)ts_etime.tv_sec, ts_etime.tv_nsec / 1000,
>   		    (u64)ts_vblank_time.tv_sec, ts_vblank_time.tv_nsec / 1000,
>   		    duration_ns / 1000, i);
> @@ -1188,7 +1185,7 @@ static int drm_vblank_enable(struct drm_vblank_crtc *vblank)
>   		 * prevent double-accounting of same vblank interval.
>   		 */
>   		ret = __enable_vblank(vblank);
> -		drm_dbg_core(dev, "enabling vblank on crtc %u, ret: %d\n",
> +		drm_dbg_core(dev, "[VBLANK:%u] enabling vblank, ret: %d\n",
>   			     pipe, ret);
>   		if (ret) {
>   			atomic_dec(&vblank->refcount);
> @@ -1346,8 +1343,9 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
>   	spin_lock_irq(&dev->event_lock);
>   
>   	spin_lock(&dev->vbl_lock);
> -	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
> -		    pipe, vblank->enabled, vblank->inmodeset);
> +	drm_dbg_vbl(dev, "[CRTC:%d:%s] vblank %s, inmodeset: %s\n",
> +		    crtc->base.id, crtc->name, str_enabled_disabled(vblank->enabled),
> +		    str_yes_no(vblank->inmodeset));
>   
>   	/* Avoid redundant vblank disables without previous
>   	 * drm_crtc_vblank_on(). */
> @@ -1372,9 +1370,8 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
>   	list_for_each_entry_safe(e, t, &dev->vblank_event_list, base.link) {
>   		if (e->pipe != pipe)
>   			continue;
> -		drm_dbg_core(dev, "Sending premature vblank event on disable: "
> -			     "wanted %llu, current %llu\n",
> -			     e->sequence, seq);
> +		drm_dbg_core(dev, "[CRTC:%d:%s] Sending premature vblank event on disable: wanted %llu, current %llu\n",
> +			     crtc->base.id, crtc->name, e->sequence, seq);
>   		list_del(&e->base.link);
>   		drm_vblank_put(vblank);
>   		send_vblank_event(dev, e, seq, now);
> @@ -1474,12 +1471,12 @@ void drm_crtc_vblank_on_config(struct drm_crtc *crtc,
>   			       const struct drm_vblank_crtc_config *config)
>   {
>   	struct drm_device *dev = crtc->dev;
> -	unsigned int pipe = drm_crtc_index(crtc);
>   	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
>   
>   	spin_lock_irq(&dev->vbl_lock);
> -	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
> -		    pipe, vblank->enabled, vblank->inmodeset);
> +	drm_dbg_vbl(dev, "[CRTC:%d:%s] vblank %s, inmodeset: %s\n",
> +		    crtc->base.id, crtc->name, str_enabled_disabled(vblank->enabled),
> +		    str_yes_no(vblank->inmodeset));
>   
>   	vblank->config = *config;
>   
> @@ -1573,8 +1570,8 @@ void drm_crtc_vblank_restore(struct drm_crtc *crtc)
>   		diff = DIV_ROUND_CLOSEST_ULL(diff_ns, framedur_ns);
>   
>   
> -	drm_dbg_vbl(dev,
> -		    "missed %d vblanks in %lld ns, frame duration=%d ns, hw_diff=%d\n",
> +	drm_dbg_vbl(dev, "[CRTC:%d:%s] missed %d vblanks in %lld ns, frame duration=%d ns, hw_diff=%d\n",
> +		    crtc->base.id, crtc->name,
>   		    diff, diff_ns, framedur_ns, cur_vblank - vblank->last);
>   	vblank->last = (cur_vblank - diff) & max_vblank_count;
>   }
> @@ -1631,8 +1628,8 @@ static int drm_queue_vblank_event(struct drm_vblank_crtc *vblank,
>   
>   	seq = drm_vblank_count_and_time(vblank, &now);
>   
> -	drm_dbg_core(dev, "event on vblank count %llu, current %llu, crtc %u\n",
> -		     req_seq, seq, pipe);
> +	drm_dbg_core(dev, "[VBLANK:%u] event on vblank count %llu, current %llu\n",
> +		     pipe, req_seq, seq);
>   
>   	trace_drm_vblank_event_queued(file_priv, pipe, req_seq);
>   
> @@ -1728,8 +1725,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>   	if (vblwait->request.type &
>   	    ~(_DRM_VBLANK_TYPES_MASK | _DRM_VBLANK_FLAGS_MASK |
>   	      _DRM_VBLANK_HIGH_CRTC_MASK)) {
> -		drm_dbg_core(dev,
> -			     "Unsupported type value 0x%x, supported mask 0x%x\n",
> +		drm_dbg_core(dev, "Unsupported type value 0x%x, supported mask 0x%x\n",
>   			     vblwait->request.type,
>   			     (_DRM_VBLANK_TYPES_MASK | _DRM_VBLANK_FLAGS_MASK |
>   			      _DRM_VBLANK_HIGH_CRTC_MASK));
> @@ -1774,9 +1770,8 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>   
>   	ret = drm_vblank_get(vblank);
>   	if (ret) {
> -		drm_dbg_core(dev,
> -			     "crtc %d failed to acquire vblank counter, %d\n",
> -			     pipe, ret);
> +		drm_dbg_core(dev, "[VBLANK:%u] failed to acquire vblank counter %pe\n",
> +			     pipe, ERR_PTR(ret));
>   		return ret;
>   	}
>   	seq = drm_vblank_count(vblank);
> @@ -1812,8 +1807,8 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>   	if (req_seq != seq) {
>   		int wait;
>   
> -		drm_dbg_core(dev, "waiting on vblank count %llu, crtc %u\n",
> -			     req_seq, pipe);
> +		drm_dbg_core(dev, "[VBLANK:%d] waiting on vblank count %llu\n",
> +			     pipe, req_seq);
>   		wait = wait_event_interruptible_timeout(vblank->queue,
>   			drm_vblank_passed(drm_vblank_count(vblank), req_seq) ||
>   				      !READ_ONCE(vblank->enabled),
> @@ -1837,10 +1832,10 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>   	if (ret != -EINTR) {
>   		drm_wait_vblank_reply(vblank, &vblwait->reply);
>   
> -		drm_dbg_core(dev, "crtc %d returning %u to client\n",
> +		drm_dbg_core(dev, "[VBLANK:%u] returning %u to client\n",
>   			     pipe, vblwait->reply.sequence);
>   	} else {
> -		drm_dbg_core(dev, "crtc %d vblank wait interrupted by signal\n",
> +		drm_dbg_core(dev, "[VBLANK:%u] vblank wait interrupted by signal\n",
>   			     pipe);
>   	}
>   
> @@ -1869,8 +1864,8 @@ static void drm_handle_vblank_events(struct drm_vblank_crtc *vblank)
>   		if (!drm_vblank_passed(seq, e->sequence))
>   			continue;
>   
> -		drm_dbg_core(dev, "vblank event on %llu, current %llu\n",
> -			     e->sequence, seq);
> +		drm_dbg_core(dev, "[VBLANK:%u] vblank event on %llu, current %llu\n",
> +			     pipe, e->sequence, seq);
>   
>   		list_del(&e->base.link);
>   		drm_vblank_put(vblank);
> @@ -1987,7 +1982,6 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
>   {
>   	struct drm_crtc *crtc;
>   	struct drm_vblank_crtc *vblank;
> -	int pipe;
>   	struct drm_crtc_get_sequence *get_seq = data;
>   	ktime_t now;
>   	bool vblank_enabled;
> @@ -2003,8 +1997,6 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
>   	if (!crtc)
>   		return -ENOENT;
>   
> -	pipe = drm_crtc_index(crtc);
> -
>   	vblank = drm_crtc_vblank_crtc(crtc);
>   	vblank_enabled = READ_ONCE(vblank->config.disable_immediate) &&
>   		READ_ONCE(vblank->enabled);
> @@ -2012,9 +2004,8 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
>   	if (!vblank_enabled) {
>   		ret = drm_crtc_vblank_get(crtc);
>   		if (ret) {
> -			drm_dbg_core(dev,
> -				     "crtc %d failed to acquire vblank counter, %d\n",
> -				     pipe, ret);
> +			drm_dbg_core(dev, "[CRTC:%d:%s] failed to acquire vblank counter %pe\n",
> +				     crtc->base.id, crtc->name, ERR_PTR(ret));
>   			return ret;
>   		}
>   	}
> @@ -2079,9 +2070,8 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
>   
>   	ret = drm_crtc_vblank_get(crtc);
>   	if (ret) {
> -		drm_dbg_core(dev,
> -			     "crtc %d failed to acquire vblank counter, %d\n",
> -			     pipe, ret);
> +		drm_dbg_core(dev, "[CRTC:%d:%s] failed to acquire vblank counter %pe\n",
> +			     crtc->base.id, crtc->name, ERR_PTR(ret));
>   		goto err_free;
>   	}
>   
> @@ -2166,7 +2156,8 @@ static enum hrtimer_restart drm_vblank_timer_function(struct hrtimer *timer)
>   
>   	ret_overrun = hrtimer_forward_now(&vtimer->timer, interval);
>   	if (ret_overrun != 1)
> -		drm_dbg_vbl(dev, "vblank timer overrun\n");
> +		drm_dbg_vbl(dev, "[CRTC:%d:%s] vblank timer overrun\n",
> +			    crtc->base.id, crtc->name);
>   
>   	if (crtc_funcs->handle_vblank_timeout)
>   		succ = crtc_funcs->handle_vblank_timeout(crtc);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


