Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA10C534C7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 17:10:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D66210E76F;
	Wed, 12 Nov 2025 16:10:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="zUNHAruI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uR7Naycu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zUNHAruI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uR7Naycu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248F610E778
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 16:10:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AFCBF21B8C;
 Wed, 12 Nov 2025 16:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762963829; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=f2jyOSCgOp6rbYKKzi7ASlW4X80QPLA7gT4BUHkx5qI=;
 b=zUNHAruIXqjRxZdFnVzK5RuQzalreXKYuWyelPfhCviz3NyRt3ZxUVBm2e3pNDJ0xFLf+O
 qaFNIkJz2Th820e9k45/cptdzCv9HZ+1M4YxonVkVBakZeeSGBrPbxiWknPtGJTGvCp6Au
 pSibBZeQJyfCUd0JvXjUtXBMOknil40=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762963829;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=f2jyOSCgOp6rbYKKzi7ASlW4X80QPLA7gT4BUHkx5qI=;
 b=uR7NaycuXc4GO+J9paJy5e6Ob5ZBgh2YXRILONUjAnVMrWkS4X6yNgsV4n49Cw7tdwLXhP
 qL5zpaCoNad06JCw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zUNHAruI;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=uR7Naycu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762963829; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=f2jyOSCgOp6rbYKKzi7ASlW4X80QPLA7gT4BUHkx5qI=;
 b=zUNHAruIXqjRxZdFnVzK5RuQzalreXKYuWyelPfhCviz3NyRt3ZxUVBm2e3pNDJ0xFLf+O
 qaFNIkJz2Th820e9k45/cptdzCv9HZ+1M4YxonVkVBakZeeSGBrPbxiWknPtGJTGvCp6Au
 pSibBZeQJyfCUd0JvXjUtXBMOknil40=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762963829;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=f2jyOSCgOp6rbYKKzi7ASlW4X80QPLA7gT4BUHkx5qI=;
 b=uR7NaycuXc4GO+J9paJy5e6Ob5ZBgh2YXRILONUjAnVMrWkS4X6yNgsV4n49Cw7tdwLXhP
 qL5zpaCoNad06JCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 871963EA61;
 Wed, 12 Nov 2025 16:10:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sz/DH3WxFGkoGgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 12 Nov 2025 16:10:29 +0000
Message-ID: <59e889d6-bd03-4e61-94ac-cc0066b451c2@suse.de>
Date: Wed, 12 Nov 2025 17:10:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/24] drm/vblank: merge drm_vblank_restore() into
 drm_crtc_vblank_restore()
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 ville.syrjala@linux.intel.com
References: <cover.1762791343.git.jani.nikula@intel.com>
 <926fae6a95d64e8ad1caf3c3f1ef2a0d25594b72.1762791343.git.jani.nikula@intel.com>
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
In-Reply-To: <926fae6a95d64e8ad1caf3c3f1ef2a0d25594b72.1762791343.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AFCBF21B8C
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 MID_RHS_MATCH_FROM(0.00)[]; RCPT_COUNT_FIVE(0.00)[5];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.com:url,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:mid,suse.de:dkim];
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
> The extra function serves no useful purpose.
>
> This allows us to drop another superfluous pipe check warning.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/drm_vblank.c | 57 +++++++++++++++---------------------
>   1 file changed, 23 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 0ff69b06b2bd..64cd96207ad5 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -1524,23 +1524,41 @@ void drm_crtc_vblank_on(struct drm_crtc *crtc)
>   }
>   EXPORT_SYMBOL(drm_crtc_vblank_on);
>   
> -static void drm_vblank_restore(struct drm_device *dev, unsigned int pipe)
> +/**
> + * drm_crtc_vblank_restore - estimate missed vblanks and update vblank count.
> + * @crtc: CRTC in question
> + *
> + * Power manamement features can cause frame counter resets between vblank
> + * disable and enable. Drivers can use this function in their
> + * &drm_crtc_funcs.enable_vblank implementation to estimate missed vblanks since
> + * the last &drm_crtc_funcs.disable_vblank using timestamps and update the
> + * vblank counter.
> + *
> + * Note that drivers must have race-free high-precision timestamping support,
> + * i.e.  &drm_crtc_funcs.get_vblank_timestamp must be hooked up and
> + * &drm_vblank_crtc_config.disable_immediate must be set to indicate the
> + * time-stamping functions are race-free against vblank hardware counter
> + * increments.
> + */
> +void drm_crtc_vblank_restore(struct drm_crtc *crtc)
>   {
> +	struct drm_device *dev = crtc->dev;
> +	unsigned int pipe = drm_crtc_index(crtc);
> +	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
>   	ktime_t t_vblank;
> -	struct drm_vblank_crtc *vblank;
>   	int framedur_ns;
>   	u64 diff_ns;
>   	u32 cur_vblank, diff = 1;
>   	int count = DRM_TIMESTAMP_MAXRETRIES;
>   	u32 max_vblank_count = drm_max_vblank_count(dev, pipe);
>   
> -	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
> -		return;
> +	drm_WARN_ON_ONCE(dev, !crtc->funcs->get_vblank_timestamp);
> +	drm_WARN_ON_ONCE(dev, vblank->inmodeset);
> +	drm_WARN_ON_ONCE(dev, !vblank->config.disable_immediate);
>   
>   	assert_spin_locked(&dev->vbl_lock);
>   	assert_spin_locked(&dev->vblank_time_lock);
>   
> -	vblank = drm_vblank_crtc(dev, pipe);
>   	drm_WARN_ONCE(dev,
>   		      drm_debug_enabled(DRM_UT_VBL) && !vblank->framedur_ns,
>   		      "Cannot compute missed vblanks without frame duration\n");
> @@ -1561,35 +1579,6 @@ static void drm_vblank_restore(struct drm_device *dev, unsigned int pipe)
>   		    diff, diff_ns, framedur_ns, cur_vblank - vblank->last);
>   	vblank->last = (cur_vblank - diff) & max_vblank_count;
>   }
> -
> -/**
> - * drm_crtc_vblank_restore - estimate missed vblanks and update vblank count.
> - * @crtc: CRTC in question
> - *
> - * Power manamement features can cause frame counter resets between vblank
> - * disable and enable. Drivers can use this function in their
> - * &drm_crtc_funcs.enable_vblank implementation to estimate missed vblanks since
> - * the last &drm_crtc_funcs.disable_vblank using timestamps and update the
> - * vblank counter.
> - *
> - * Note that drivers must have race-free high-precision timestamping support,
> - * i.e.  &drm_crtc_funcs.get_vblank_timestamp must be hooked up and
> - * &drm_vblank_crtc_config.disable_immediate must be set to indicate the
> - * time-stamping functions are race-free against vblank hardware counter
> - * increments.
> - */
> -void drm_crtc_vblank_restore(struct drm_crtc *crtc)
> -{
> -	struct drm_device *dev = crtc->dev;
> -	unsigned int pipe = drm_crtc_index(crtc);
> -	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
> -
> -	drm_WARN_ON_ONCE(dev, !crtc->funcs->get_vblank_timestamp);
> -	drm_WARN_ON_ONCE(dev, vblank->inmodeset);
> -	drm_WARN_ON_ONCE(dev, !vblank->config.disable_immediate);
> -
> -	drm_vblank_restore(dev, pipe);
> -}
>   EXPORT_SYMBOL(drm_crtc_vblank_restore);
>   
>   static int drm_queue_vblank_event(struct drm_vblank_crtc *vblank,

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


