Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8F3C537A4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 17:44:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F43C10E781;
	Wed, 12 Nov 2025 16:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="H4T/yCGp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="15sx2VVq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="H4T/yCGp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="15sx2VVq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC06610E755
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 16:44:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 789FE218D9;
 Wed, 12 Nov 2025 16:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762965846; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wNT3zH3m1POmrQR0ywiuremuprqx7KtB0YT4DNpZkfU=;
 b=H4T/yCGpR0cf89y1V/FdfXtT1KiNlQBm9x1TMlSRM0Ro5evsZUavfPOT1xWLbZ8HKY45Wk
 fxC+ii1m1WDLgr3Zbfk7yTO+IKpcVKs9GMuwBU4PJ0tTg+ZYcahc1Y3zhbkU5Z4CevEHnT
 POxVUrLiMrsGPtFap+NLENshC8nnRyQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762965846;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wNT3zH3m1POmrQR0ywiuremuprqx7KtB0YT4DNpZkfU=;
 b=15sx2VVqN0E0SPM9Ig4vS5+9mG8DkNIrFhNlOH7yEKidVBkUIuPfcGUL+/cizjeBstCuu6
 X/AYaydONYPRodBA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="H4T/yCGp";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=15sx2VVq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762965846; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wNT3zH3m1POmrQR0ywiuremuprqx7KtB0YT4DNpZkfU=;
 b=H4T/yCGpR0cf89y1V/FdfXtT1KiNlQBm9x1TMlSRM0Ro5evsZUavfPOT1xWLbZ8HKY45Wk
 fxC+ii1m1WDLgr3Zbfk7yTO+IKpcVKs9GMuwBU4PJ0tTg+ZYcahc1Y3zhbkU5Z4CevEHnT
 POxVUrLiMrsGPtFap+NLENshC8nnRyQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762965846;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wNT3zH3m1POmrQR0ywiuremuprqx7KtB0YT4DNpZkfU=;
 b=15sx2VVqN0E0SPM9Ig4vS5+9mG8DkNIrFhNlOH7yEKidVBkUIuPfcGUL+/cizjeBstCuu6
 X/AYaydONYPRodBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4E28A3EA61;
 Wed, 12 Nov 2025 16:44:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WJOkEVa5FGn1OwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 12 Nov 2025 16:44:06 +0000
Message-ID: <f90a61f3-1fdd-43ab-aec1-83cff4c2689a@suse.de>
Date: Wed, 12 Nov 2025 17:44:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/24] drm/vblank: pass vblank to
 drm_get_last_vbltimestamp()
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 ville.syrjala@linux.intel.com
References: <cover.1762791343.git.jani.nikula@intel.com>
 <37e6210dd475c9d4e53a1feadc5cb42fa1e0aeac.1762791343.git.jani.nikula@intel.com>
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
In-Reply-To: <37e6210dd475c9d4e53a1feadc5cb42fa1e0aeac.1762791343.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 789FE218D9
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_TLS_ALL(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; TO_DN_SOME(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:mid,suse.de:dkim,suse.com:url];
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
>   drivers/gpu/drm/drm_vblank.c | 20 ++++++++------------
>   1 file changed, 8 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index a274b4a7b1c2..ee9355d5069b 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -162,9 +162,8 @@
>    */
>   #define DRM_REDUNDANT_VBLIRQ_THRESH_NS 1000000
>   
> -static bool
> -drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
> -			  ktime_t *tvblank, bool in_vblank_irq);
> +static bool drm_get_last_vbltimestamp(struct drm_vblank_crtc *vblank,
> +				      ktime_t *tvblank, bool in_vblank_irq);
>   
>   static unsigned int drm_timestamp_precision = 20;  /* Default to 20 usecs. */
>   
> @@ -253,7 +252,6 @@ static u32 __get_vblank_counter(struct drm_vblank_crtc *vblank)
>   static void drm_reset_vblank_timestamp(struct drm_vblank_crtc *vblank)
>   {
>   	struct drm_device *dev = vblank->dev;
> -	unsigned int pipe = vblank->pipe;
>   	u32 cur_vblank;
>   	bool rc;
>   	ktime_t t_vblank;
> @@ -267,7 +265,7 @@ static void drm_reset_vblank_timestamp(struct drm_vblank_crtc *vblank)
>   	 */
>   	do {
>   		cur_vblank = __get_vblank_counter(vblank);
> -		rc = drm_get_last_vbltimestamp(dev, pipe, &t_vblank, false);
> +		rc = drm_get_last_vbltimestamp(vblank, &t_vblank, false);
>   	} while (cur_vblank != __get_vblank_counter(vblank) && --count > 0);
>   
>   	/*
> @@ -325,7 +323,7 @@ static void drm_update_vblank_count(struct drm_vblank_crtc *vblank,
>   	 */
>   	do {
>   		cur_vblank = __get_vblank_counter(vblank);
> -		rc = drm_get_last_vbltimestamp(dev, pipe, &t_vblank, in_vblank_irq);
> +		rc = drm_get_last_vbltimestamp(vblank, &t_vblank, in_vblank_irq);
>   	} while (cur_vblank != __get_vblank_counter(vblank) && --count > 0);
>   
>   	if (max_vblank_count) {
> @@ -909,11 +907,10 @@ drm_crtc_get_last_vbltimestamp(struct drm_crtc *crtc, ktime_t *tvblank,
>   	return ret;
>   }
>   
> -static bool
> -drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
> -			  ktime_t *tvblank, bool in_vblank_irq)
> +static bool drm_get_last_vbltimestamp(struct drm_vblank_crtc *vblank,
> +				      ktime_t *tvblank, bool in_vblank_irq)
>   {
> -	struct drm_crtc *crtc = drm_crtc_from_index(dev, pipe);
> +	struct drm_crtc *crtc = drm_crtc_from_vblank(vblank);
>   
>   	return drm_crtc_get_last_vbltimestamp(crtc, tvblank, in_vblank_irq);
>   }
> @@ -1552,7 +1549,6 @@ EXPORT_SYMBOL(drm_crtc_vblank_on);
>   void drm_crtc_vblank_restore(struct drm_crtc *crtc)
>   {
>   	struct drm_device *dev = crtc->dev;
> -	unsigned int pipe = drm_crtc_index(crtc);
>   	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
>   	ktime_t t_vblank;
>   	int framedur_ns;
> @@ -1575,7 +1571,7 @@ void drm_crtc_vblank_restore(struct drm_crtc *crtc)
>   
>   	do {
>   		cur_vblank = __get_vblank_counter(vblank);
> -		drm_get_last_vbltimestamp(dev, pipe, &t_vblank, false);
> +		drm_get_last_vbltimestamp(vblank, &t_vblank, false);
>   	} while (cur_vblank != __get_vblank_counter(vblank) && --count > 0);
>   
>   	diff_ns = ktime_to_ns(ktime_sub(t_vblank, vblank->time));

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


