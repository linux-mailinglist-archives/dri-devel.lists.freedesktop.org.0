Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E00AEC53770
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 17:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F99E10E784;
	Wed, 12 Nov 2025 16:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="NytyPKNc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WvNBBpuU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f2YuuU75";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QLRgZGkO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0414A10E781
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 16:41:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 744D31F828;
 Wed, 12 Nov 2025 16:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762965710; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Yrlb9ZFIg5yIx7Ab8tzDFgTJvnNGnQ+WOS5xJ4loIJ4=;
 b=NytyPKNcY/vCH525NOIXqRFY1Gh0+Jpm2ZDJUODZxWO5jzXAqNwB9pOb7xecGZKHABL+OH
 25Pbia9Zxnb82w8uEjtR4A0S6HVv6W/7XRafg+bmJdnWzJ6FvPBIcpei6ByJV6B1nfNsBy
 zdAKfBQkZ6Q/KOmpO/GFqGX4ZGWTLPw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762965710;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Yrlb9ZFIg5yIx7Ab8tzDFgTJvnNGnQ+WOS5xJ4loIJ4=;
 b=WvNBBpuU6WnxdZEtXLvuBfORbMVG0iIcqKyvdJbtZ9wZH7X9D5rGWzXYY5Mxi1iRLh5Pwg
 N+9k8M/lLaAuD7CQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=f2YuuU75;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QLRgZGkO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762965709; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Yrlb9ZFIg5yIx7Ab8tzDFgTJvnNGnQ+WOS5xJ4loIJ4=;
 b=f2YuuU75DCCtHOj12x/E6UMEhaviay07c9KcO7bovLJbnrwxstA6eh0vd2dTN0oDINJHpI
 koA/dHQ5uLhoC47vA057/1gOtNUAF0wKW28mHNP+qJT3odDFw3zLeKcU8RbAPO9Ymm4hC0
 5SqQtvbnzEGTILsaQr+fpSm2UNxhRQQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762965709;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Yrlb9ZFIg5yIx7Ab8tzDFgTJvnNGnQ+WOS5xJ4loIJ4=;
 b=QLRgZGkO0SWvAdQCT41Jj3X33ZIi6Zg8vV0U+9Cqq6MDZfoFJMWo+j/Yv0sWZRUyz03VNo
 HrY8RND5Os8+VuCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 41E163EA61;
 Wed, 12 Nov 2025 16:41:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id j0vSDc24FGnaOQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 12 Nov 2025 16:41:49 +0000
Message-ID: <237e9d88-d6de-4c80-a216-9e236176f833@suse.de>
Date: Wed, 12 Nov 2025 17:41:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/24] drm/vblank: pass vblank to
 __{enable,disable}_vblank()
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 ville.syrjala@linux.intel.com
References: <cover.1762791343.git.jani.nikula@intel.com>
 <96b915f7e4e95aceeea3b579d183fbf043eac817.1762791343.git.jani.nikula@intel.com>
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
In-Reply-To: <96b915f7e4e95aceeea3b579d183fbf043eac817.1762791343.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 744D31F828
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_TLS_ALL(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.com:url,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
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
> Use the vblank pointer instead of a dev, pipe pair to simplify code.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/drm_vblank.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 955cea949d3d..a274b4a7b1c2 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -443,10 +443,12 @@ u64 drm_crtc_accurate_vblank_count(struct drm_crtc *crtc)
>   }
>   EXPORT_SYMBOL(drm_crtc_accurate_vblank_count);
>   
> -static void __disable_vblank(struct drm_device *dev, unsigned int pipe)
> +static void __disable_vblank(struct drm_vblank_crtc *vblank)
>   {
> +	struct drm_device *dev = vblank->dev;
> +
>   	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
> -		struct drm_crtc *crtc = drm_crtc_from_index(dev, pipe);
> +		struct drm_crtc *crtc = drm_crtc_from_vblank(vblank);
>   
>   		if (drm_WARN_ON(dev, !crtc))
>   			return;
> @@ -491,7 +493,7 @@ void drm_vblank_disable_and_save(struct drm_device *dev, unsigned int pipe)
>   	 * between drm_crtc_vblank_on() and drm_crtc_vblank_off().
>   	 */
>   	drm_update_vblank_count(vblank, false);
> -	__disable_vblank(dev, pipe);
> +	__disable_vblank(vblank);
>   	vblank->enabled = false;
>   
>   out:
> @@ -1153,10 +1155,12 @@ void drm_crtc_send_vblank_event(struct drm_crtc *crtc,
>   }
>   EXPORT_SYMBOL(drm_crtc_send_vblank_event);
>   
> -static int __enable_vblank(struct drm_device *dev, unsigned int pipe)
> +static int __enable_vblank(struct drm_vblank_crtc *vblank)
>   {
> +	struct drm_device *dev = vblank->dev;
> +
>   	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
> -		struct drm_crtc *crtc = drm_crtc_from_index(dev, pipe);
> +		struct drm_crtc *crtc = drm_crtc_from_vblank(vblank);
>   
>   		if (drm_WARN_ON(dev, !crtc))
>   			return 0;
> @@ -1186,7 +1190,7 @@ static int drm_vblank_enable(struct drm_vblank_crtc *vblank)
>   		 * timestamps. Filtercode in drm_handle_vblank() will
>   		 * prevent double-accounting of same vblank interval.
>   		 */
> -		ret = __enable_vblank(dev, pipe);
> +		ret = __enable_vblank(vblank);
>   		drm_dbg_core(dev, "enabling vblank on crtc %u, ret: %d\n",
>   			     pipe, ret);
>   		if (ret) {

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


