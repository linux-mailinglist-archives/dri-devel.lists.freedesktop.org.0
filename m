Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 050E7A85551
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 09:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222C010E175;
	Fri, 11 Apr 2025 07:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="qsOydtgm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vaWFrQjK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qsOydtgm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vaWFrQjK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F06C10EB05
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 07:18:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3628321162;
 Fri, 11 Apr 2025 07:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744355931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0njJU8Qj/9SuIcpYsTDG/HkOUJ9q01C6ypN+QynsvHY=;
 b=qsOydtgmCe4xpR0fNWwUUrKg7ROdTlR2I5pwpMeUARMoRJ1paIf4U0t1HY2cPNMLxN4VYW
 BSeuRxfbYwBVKP6uxGKqKyAoFoTOXPH7hgPDIMwpNeKQWgbwx6eXnQt71gpxFrgVpQ5GZ6
 5XxUa7T58/RWgAKrl3atBhzLXeoPbVg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744355931;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0njJU8Qj/9SuIcpYsTDG/HkOUJ9q01C6ypN+QynsvHY=;
 b=vaWFrQjKOksFI1/QYbeyYlenWlMBLG1NRyV7FNeGHIikdS87gu1qwJKmZ7vLufHY3vHYIA
 CVHAHy4QAuxWq/AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744355931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0njJU8Qj/9SuIcpYsTDG/HkOUJ9q01C6ypN+QynsvHY=;
 b=qsOydtgmCe4xpR0fNWwUUrKg7ROdTlR2I5pwpMeUARMoRJ1paIf4U0t1HY2cPNMLxN4VYW
 BSeuRxfbYwBVKP6uxGKqKyAoFoTOXPH7hgPDIMwpNeKQWgbwx6eXnQt71gpxFrgVpQ5GZ6
 5XxUa7T58/RWgAKrl3atBhzLXeoPbVg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744355931;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0njJU8Qj/9SuIcpYsTDG/HkOUJ9q01C6ypN+QynsvHY=;
 b=vaWFrQjKOksFI1/QYbeyYlenWlMBLG1NRyV7FNeGHIikdS87gu1qwJKmZ7vLufHY3vHYIA
 CVHAHy4QAuxWq/AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0EEF213886;
 Fri, 11 Apr 2025 07:18:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CPnRAVvC+GeafgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Apr 2025 07:18:51 +0000
Message-ID: <fafd92ec-5319-4a76-bbf9-b7a627c0f514@suse.de>
Date: Fri, 11 Apr 2025 09:18:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/19] drm: Look up the format info earlier
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
 <20250410163218.15130-4-ville.syrjala@linux.intel.com>
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
In-Reply-To: <20250410163218.15130-4-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Flag: NO
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

Am 10.04.25 um 18:32 schrieb Ville Syrjala:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Looks up the format info in already drm_internal_framebuffer_create()
> so that we can later pass it along to .fb_create(). Currently various

The first sentence seems off.

> drivers are doing additional lookups in their .fb_create()
> implementations, and these lookups are rather expensive now (given
> how many different pixel formats we have).
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   drivers/gpu/drm/drm_framebuffer.c | 25 +++++++++++++------------
>   1 file changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> index 18a0267e374e..ae09ef6977b2 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -153,18 +153,11 @@ int drm_mode_addfb_ioctl(struct drm_device *dev,
>   }
>   
>   static int framebuffer_check(struct drm_device *dev,
> +			     const struct drm_format_info *info,
>   			     const struct drm_mode_fb_cmd2 *r)
>   {
> -	const struct drm_format_info *info;
>   	int i;
>   
> -	/* check if the format is supported at all */
> -	if (!__drm_format_info(r->pixel_format)) {
> -		drm_dbg_kms(dev, "bad framebuffer format %p4cc\n",
> -			    &r->pixel_format);
> -		return -EINVAL;
> -	}
> -
>   	if (r->width == 0) {
>   		drm_dbg_kms(dev, "bad framebuffer width %u\n", r->width);
>   		return -EINVAL;
> @@ -175,9 +168,6 @@ static int framebuffer_check(struct drm_device *dev,
>   		return -EINVAL;
>   	}
>   
> -	/* now let the driver pick its own format info */
> -	info = drm_get_format_info(dev, r->pixel_format, r->modifier[0]);
> -
>   	for (i = 0; i < info->num_planes; i++) {
>   		unsigned int width = drm_format_info_plane_width(info, r->width, i);
>   		unsigned int height = drm_format_info_plane_height(info, r->height, i);
> @@ -272,6 +262,7 @@ drm_internal_framebuffer_create(struct drm_device *dev,
>   				struct drm_file *file_priv)
>   {
>   	struct drm_mode_config *config = &dev->mode_config;
> +	const struct drm_format_info *info;
>   	struct drm_framebuffer *fb;
>   	int ret;
>   
> @@ -297,7 +288,17 @@ drm_internal_framebuffer_create(struct drm_device *dev,
>   		return ERR_PTR(-EINVAL);
>   	}
>   
> -	ret = framebuffer_check(dev, r);
> +	/* check if the format is supported at all */
> +	if (!__drm_format_info(r->pixel_format)) {
> +		drm_dbg_kms(dev, "bad framebuffer format %p4cc\n",
> +			    &r->pixel_format);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	/* now let the driver pick its own format info */
> +	info = drm_get_format_info(dev, r->pixel_format, r->modifier[0]);
> +
> +	ret = framebuffer_check(dev, info, r);
>   	if (ret)
>   		return ERR_PTR(ret);
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

