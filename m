Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F24D4877BC9
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 09:40:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6D210FD0D;
	Mon, 11 Mar 2024 08:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="nhLR0DFM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LihrBgwI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nhLR0DFM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LihrBgwI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C89C10FD4C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 08:40:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 97F3934A17;
 Mon, 11 Mar 2024 08:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710146426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cRc0a+aATq2UY+1X/t+lznE5No0cAlgFI2V7cc5rHLg=;
 b=nhLR0DFMkYmbzMsWsbSWwm75eLBJrO8Q/aNxZ8RVlahBOtRg301vkARt3vewss0Qe74fIr
 d6dpYgqlUSejDeOY3clJ77NQ9Bd5tj4B6bM59eF8JCyhR8NEw4ZEQlMYYOE/bIKpLCbddc
 pHh2B1unNwOZFLOsjUB3Wq6YCdImkxA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710146426;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cRc0a+aATq2UY+1X/t+lznE5No0cAlgFI2V7cc5rHLg=;
 b=LihrBgwIdFhdq+W93tYbVxmJgutU4RRHiAL+cmI2BrIi+EQ3bWq+SPpGzp2Li6drwH+AV7
 D2PJz3L7kq8wrKAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710146426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cRc0a+aATq2UY+1X/t+lznE5No0cAlgFI2V7cc5rHLg=;
 b=nhLR0DFMkYmbzMsWsbSWwm75eLBJrO8Q/aNxZ8RVlahBOtRg301vkARt3vewss0Qe74fIr
 d6dpYgqlUSejDeOY3clJ77NQ9Bd5tj4B6bM59eF8JCyhR8NEw4ZEQlMYYOE/bIKpLCbddc
 pHh2B1unNwOZFLOsjUB3Wq6YCdImkxA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710146426;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cRc0a+aATq2UY+1X/t+lznE5No0cAlgFI2V7cc5rHLg=;
 b=LihrBgwIdFhdq+W93tYbVxmJgutU4RRHiAL+cmI2BrIi+EQ3bWq+SPpGzp2Li6drwH+AV7
 D2PJz3L7kq8wrKAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2CBC613695;
 Mon, 11 Mar 2024 08:40:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 5l1DCXrD7mXBcQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 11 Mar 2024 08:40:26 +0000
Message-ID: <c3203f70-0e8c-493b-813e-1dff93a28323@suse.de>
Date: Mon, 11 Mar 2024 09:40:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: Don't return unsupported formats in
 drm_mode_legacy_fb_format
Content-Language: en-US
To: Frej Drejhammar <frej.drejhammar@gmail.com>,
 dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20240310152803.3315-1-frej.drejhammar@gmail.com>
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
In-Reply-To: <20240310152803.3315-1-frej.drejhammar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -2.76
X-Spamd-Result: default: False [-2.76 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.17)[-0.828]; BAYES_HAM(-3.00)[100.00%];
 RCPT_COUNT_TWELVE(0.00)[17];
 FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[vger.kernel.org,armlinux.org.uk,gmail.com,ffwll.ch,linux.intel.com,kernel.org,linaro.org,quicinc.com,ideasonboard.com,redhat.com,igalia.com];
 RCVD_TLS_ALL(0.00)[]; SUSPICIOUS_RECIPS(1.50)[]
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

Hi,

thanks for the patch.

Am 10.03.24 um 16:28 schrieb Frej Drejhammar:
[...]
>   	size = cmd.pitches[0] * cmd.height;
> diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
> index ab89b7fc7bf6..ded868601aea 100644
> --- a/drivers/gpu/drm/tiny/ofdrm.c
> +++ b/drivers/gpu/drm/tiny/ofdrm.c
> @@ -100,14 +100,14 @@ static const struct drm_format_info *display_get_validated_format(struct drm_dev
>   
>   	switch (depth) {
>   	case 8:
> -		format = drm_mode_legacy_fb_format(8, 8);
> +		format = drm_mode_legacy_fb_format(dev, 8, 8);
>   		break;
>   	case 15:
>   	case 16:
> -		format = drm_mode_legacy_fb_format(16, depth);
> +		format = drm_mode_legacy_fb_format(dev, 16, depth);
>   		break;
>   	case 32:
> -		format = drm_mode_legacy_fb_format(32, 24);
> +		format = drm_mode_legacy_fb_format(dev, 32, 24);
>   		break;

This will break ofdrm, which needs the returned value as-is to build its 
internal list of plane formats.

I suggest to switch all fbdev code over to drm_driver_legacy_fb_format 
<https://elixir.bootlin.com/linux/latest/C/ident/drm_driver_legacy_fb_format>() 
first and then modify the format indrm_driver_legacy_fb_format 
<https://elixir.bootlin.com/linux/latest/C/ident/drm_driver_legacy_fb_format>() 
after reading it from drm_fb_legacy_fb_format(). I can help a bit with 
testing the fbdev changes.

Best regards
Thomas


>   	default:
>   		drm_err(dev, "unsupported framebuffer depth %u\n", depth);
> diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
> index 51ae3561fd0d..a38a8143d632 100644
> --- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
> +++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
> @@ -32,7 +32,8 @@ struct drm_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
>   
>   	mode_cmd.pitches[0] = ALIGN(mode_cmd.width *
>   				    DIV_ROUND_UP(sizes->surface_bpp, 8), XE_PAGE_SIZE);
> -	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
> +	mode_cmd.pixel_format = drm_mode_legacy_fb_format(dev,
> +							  sizes->surface_bpp,
>   							  sizes->surface_depth);
>   
>   	size = mode_cmd.pitches[0] * mode_cmd.height;
> diff --git a/include/drm/drm_fourcc.h b/include/drm/drm_fourcc.h
> index ccf91daa4307..75d06393a564 100644
> --- a/include/drm/drm_fourcc.h
> +++ b/include/drm/drm_fourcc.h
> @@ -310,7 +310,8 @@ const struct drm_format_info *drm_format_info(u32 format);
>   const struct drm_format_info *
>   drm_get_format_info(struct drm_device *dev,
>   		    const struct drm_mode_fb_cmd2 *mode_cmd);
> -uint32_t drm_mode_legacy_fb_format(uint32_t bpp, uint32_t depth);
> +uint32_t drm_mode_legacy_fb_format(struct drm_device *dev,
> +				   uint32_t bpp, uint32_t depth);
>   uint32_t drm_driver_legacy_fb_format(struct drm_device *dev,
>   				     uint32_t bpp, uint32_t depth);
>   unsigned int drm_format_info_block_width(const struct drm_format_info *info,
>
> base-commit: b9511c6d277c31b13d4f3128eba46f4e0733d734

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

