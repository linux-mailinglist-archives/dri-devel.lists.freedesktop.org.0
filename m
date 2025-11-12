Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9ED6C53374
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 16:56:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB6410E766;
	Wed, 12 Nov 2025 15:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="NDql1UTe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Fklynw9S";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NDql1UTe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Fklynw9S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C7E110E774
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 15:56:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1E2C421AF6;
 Wed, 12 Nov 2025 15:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762962999; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6PLf4Umj0QdLuw64N2M4PsmZcYqDi8WaY6ATGqzD+og=;
 b=NDql1UTey2cW/bJD1xMWg0dfdMDuIWYc58y6HVD6/DL1fm+UlG1vlVwFxTg03YA8PjjXNf
 wqCiCoxinPz0VCaUqJ9qFdsfAbRWnqumdYSwJW7aiSgeWiLoRoX9vvCNG+Lt4/uNfTmnqD
 PAADs1v/9Rv2pWcy4UB+HrkMAjK5zwM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762962999;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6PLf4Umj0QdLuw64N2M4PsmZcYqDi8WaY6ATGqzD+og=;
 b=Fklynw9SmAVowjSBkZL0yyFERP/PqJUdwc4hyooijpvcnTtOWqcmmPwUaL2hNfPk2CCWAQ
 Noeypvz31T08hrCg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NDql1UTe;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Fklynw9S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762962999; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6PLf4Umj0QdLuw64N2M4PsmZcYqDi8WaY6ATGqzD+og=;
 b=NDql1UTey2cW/bJD1xMWg0dfdMDuIWYc58y6HVD6/DL1fm+UlG1vlVwFxTg03YA8PjjXNf
 wqCiCoxinPz0VCaUqJ9qFdsfAbRWnqumdYSwJW7aiSgeWiLoRoX9vvCNG+Lt4/uNfTmnqD
 PAADs1v/9Rv2pWcy4UB+HrkMAjK5zwM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762962999;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6PLf4Umj0QdLuw64N2M4PsmZcYqDi8WaY6ATGqzD+og=;
 b=Fklynw9SmAVowjSBkZL0yyFERP/PqJUdwc4hyooijpvcnTtOWqcmmPwUaL2hNfPk2CCWAQ
 Noeypvz31T08hrCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E65CD3EA61;
 Wed, 12 Nov 2025 15:56:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id E3u/NjauFGnWCwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 12 Nov 2025 15:56:38 +0000
Message-ID: <454ddf9e-c995-4f1c-a2db-8a5c921d0515@suse.de>
Date: Wed, 12 Nov 2025 16:56:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/24] drm/vblank: use the vblank based interfaces more
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 ville.syrjala@linux.intel.com
References: <cover.1762791343.git.jani.nikula@intel.com>
 <5bc164f2dfe11bf9a2655797e17e420405261c21.1762791343.git.jani.nikula@intel.com>
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
In-Reply-To: <5bc164f2dfe11bf9a2655797e17e420405261c21.1762791343.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 1E2C421AF6
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 URIBL_BLOCKED(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:url,intel.com:email];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,suse.de:dkim,suse.de:mid,suse.de:email];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.51
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
> With the prep work in place, we can get rid of _drm_vblank_get(),
> _drm_vblank_put(), and _drm_vblank_count().
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/drm_vblank.c | 44 ++++++++----------------------------
>   1 file changed, 10 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 91bedf8e6ea8..1c0ade41a57f 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -403,14 +403,6 @@ u64 drm_vblank_count(struct drm_vblank_crtc *vblank)
>   	return count;
>   }
>   
> -static u64 _drm_vblank_count(struct drm_device *dev, unsigned int pipe)
> -{
> -	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
> -		return 0;
> -
> -	return drm_vblank_count(drm_vblank_crtc(dev, pipe));
> -}
> -
>   /**
>    * drm_crtc_accurate_vblank_count - retrieve the master vblank counter
>    * @crtc: which counter to retrieve
> @@ -940,7 +932,7 @@ drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
>    */
>   u64 drm_crtc_vblank_count(struct drm_crtc *crtc)
>   {
> -	return _drm_vblank_count(crtc->dev, drm_crtc_index(crtc));
> +	return drm_vblank_count(drm_crtc_vblank_crtc(crtc));
>   }
>   EXPORT_SYMBOL(drm_crtc_vblank_count);
>   
> @@ -1238,14 +1230,6 @@ int drm_vblank_get(struct drm_vblank_crtc *vblank)
>   	return ret;
>   }
>   
> -static int _drm_vblank_get(struct drm_device *dev, unsigned int pipe)
> -{
> -	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
> -		return -EINVAL;
> -
> -	return drm_vblank_get(drm_vblank_crtc(dev, pipe));
> -}
> -
>   /**
>    * drm_crtc_vblank_get - get a reference count on vblank events
>    * @crtc: which CRTC to own
> @@ -1258,7 +1242,7 @@ static int _drm_vblank_get(struct drm_device *dev, unsigned int pipe)
>    */
>   int drm_crtc_vblank_get(struct drm_crtc *crtc)
>   {
> -	return _drm_vblank_get(crtc->dev, drm_crtc_index(crtc));
> +	return drm_vblank_get(drm_crtc_vblank_crtc(crtc));
>   }
>   EXPORT_SYMBOL(drm_crtc_vblank_get);
>   
> @@ -1282,14 +1266,6 @@ void drm_vblank_put(struct drm_vblank_crtc *vblank)
>   	}
>   }
>   
> -static void _drm_vblank_put(struct drm_device *dev, unsigned int pipe)
> -{
> -	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
> -		return;
> -
> -	drm_vblank_put(drm_vblank_crtc(dev, pipe));
> -}
> -
>   /**
>    * drm_crtc_vblank_put - give up ownership of vblank events
>    * @crtc: which counter to give up
> @@ -1300,7 +1276,7 @@ static void _drm_vblank_put(struct drm_device *dev, unsigned int pipe)
>    */
>   void drm_crtc_vblank_put(struct drm_crtc *crtc)
>   {
> -	_drm_vblank_put(crtc->dev, drm_crtc_index(crtc));
> +	drm_vblank_put(drm_crtc_vblank_crtc(crtc));
>   }
>   EXPORT_SYMBOL(drm_crtc_vblank_put);
>   
> @@ -1401,7 +1377,7 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
>   			     "wanted %llu, current %llu\n",
>   			     e->sequence, seq);
>   		list_del(&e->base.link);
> -		_drm_vblank_put(dev, pipe);
> +		drm_vblank_put(vblank);
>   		send_vblank_event(dev, e, seq, now);
>   	}
>   
> @@ -1677,7 +1653,7 @@ static int drm_queue_vblank_event(struct drm_device *dev, unsigned int pipe,
>   
>   	e->sequence = req_seq;
>   	if (drm_vblank_passed(seq, req_seq)) {
> -		_drm_vblank_put(dev, pipe);
> +		drm_vblank_put(vblank);
>   		send_vblank_event(dev, e, seq, now);
>   		vblwait->reply.sequence = seq;
>   	} else {
> @@ -1694,7 +1670,7 @@ static int drm_queue_vblank_event(struct drm_device *dev, unsigned int pipe,
>   	spin_unlock_irq(&dev->event_lock);
>   	kfree(e);
>   err_put:
> -	_drm_vblank_put(dev, pipe);
> +	drm_vblank_put(vblank);
>   	return ret;
>   }
>   
> @@ -1812,14 +1788,14 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>   		return 0;
>   	}
>   
> -	ret = _drm_vblank_get(dev, pipe);
> +	ret = drm_vblank_get(vblank);
>   	if (ret) {
>   		drm_dbg_core(dev,
>   			     "crtc %d failed to acquire vblank counter, %d\n",
>   			     pipe, ret);
>   		return ret;
>   	}
> -	seq = _drm_vblank_count(dev, pipe);
> +	seq = drm_vblank_count(vblank);
>   
>   	switch (vblwait->request.type & _DRM_VBLANK_TYPES_MASK) {
>   	case _DRM_VBLANK_RELATIVE:
> @@ -1855,7 +1831,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>   		drm_dbg_core(dev, "waiting on vblank count %llu, crtc %u\n",
>   			     req_seq, pipe);
>   		wait = wait_event_interruptible_timeout(vblank->queue,
> -			drm_vblank_passed(_drm_vblank_count(dev, pipe), req_seq) ||
> +			drm_vblank_passed(drm_vblank_count(vblank), req_seq) ||
>   				      !READ_ONCE(vblank->enabled),
>   			msecs_to_jiffies(3000));
>   
> @@ -1885,7 +1861,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>   	}
>   
>   done:
> -	_drm_vblank_put(dev, pipe);
> +	drm_vblank_put(vblank);
>   	return ret;
>   }
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


