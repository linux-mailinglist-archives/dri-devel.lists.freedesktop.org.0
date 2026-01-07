Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60662CFC5EE
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 08:33:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B6210E099;
	Wed,  7 Jan 2026 07:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="urNM36zl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SVW++TCH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XjTDy6kE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nHCbqayP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3167D10E099
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 07:33:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C615E5BCDA;
 Wed,  7 Jan 2026 07:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1767771202; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jbQ6F1Id175wdNW1Z1StlgxuCVGW3fVxij8J49gh0hc=;
 b=urNM36zl7LxtLlrIxaPSWAM6fDzZGRdeJ/IvS6e6QSkA8KRwYM+VD2b7gU4GZHKPUNLH5O
 59Yb9B0aW68vhWnWqoOxJTT+kwkEzIoElIlLeljBm7ZrZgG91lAhbc6UA30c3JjMfnnixT
 SRRdcuva1eqFtFTaFnu6Z5vZ0lu33Co=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1767771202;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jbQ6F1Id175wdNW1Z1StlgxuCVGW3fVxij8J49gh0hc=;
 b=SVW++TCH5MqV5C7pRJvO4kJ3COOyIWuSk++lnfqPrNNAd6Eobgxf4PKZEcmAZxuTyXgo+6
 ki9xtqJePFFZSuCA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XjTDy6kE;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nHCbqayP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1767771201; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jbQ6F1Id175wdNW1Z1StlgxuCVGW3fVxij8J49gh0hc=;
 b=XjTDy6kEGa7qrLI42gsBRs5Q0Um30g07NqIsw9hr7HuyuCqRrAczDPGLqtORdr5ZjB4Itx
 Y99EhgSzAOxw1eMDuPm4MyFtuNan1Ce+mY9N7yWE9lskBNDDM9oxjmCu9bG8lqWEVLGXvT
 jVRjOIyLXuzf9qv2pWnSHXTagOe/a0M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1767771201;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jbQ6F1Id175wdNW1Z1StlgxuCVGW3fVxij8J49gh0hc=;
 b=nHCbqayPUaZW9Cve8zDIpDTfdx1fMEHATnBRbxlRq/jQZnEs7Yi6sVuqTMwi4LP4KmsRGB
 I1cRJ672eT4BdnDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 822453EA63;
 Wed,  7 Jan 2026 07:33:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4wJYHkEMXmnVKgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 07 Jan 2026 07:33:21 +0000
Message-ID: <aa922030-b0a1-4503-a3c0-7ce4c36c236e@suse.de>
Date: Wed, 7 Jan 2026 08:33:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] fbdev: omapfb: Make FB_DEVICE dependency optional
To: Chintan Patel <chintanlike@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andy@kernel.org, deller@gmx.de, gregkh@linuxfoundation.org
References: <20260107044258.528624-1-chintanlike@gmail.com>
 <20260107044258.528624-4-chintanlike@gmail.com>
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
In-Reply-To: <20260107044258.528624-4-chintanlike@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Rspamd-Queue-Id: C615E5BCDA
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,lists.linux.dev];
 MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,kernel.org,gmx.de,linuxfoundation.org];
 RCPT_COUNT_SEVEN(0.00)[9]; FROM_EQ_ENVFROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:url];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
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



Am 07.01.26 um 05:42 schrieb Chintan Patel:
> omapfb provides several sysfs interfaces for framebuffer configuration
> and debugging, but these are not required for the core driver.
>
> Remove the hard dependency on CONFIG_FB_DEVICE and make sysfs support
> optional by using dev_of_fbinfo() to obtain the backing device at runtime.
> When FB_DEVICE is disabled, sysfs operations are skipped while the code
> still builds and is type-checked.
>
> Suggested-by: Helge Deller <deller@gmx.de>
> Signed-off-by: Chintan Patel <chintanlike@gmail.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/video/fbdev/omap2/omapfb/Kconfig       |  3 ++-
>   .../video/fbdev/omap2/omapfb/omapfb-sysfs.c    | 18 ++++++++++++++----
>   2 files changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/video/fbdev/omap2/omapfb/Kconfig b/drivers/video/fbdev/omap2/omapfb/Kconfig
> index f4cdf999a080..2d20e79adefc 100644
> --- a/drivers/video/fbdev/omap2/omapfb/Kconfig
> +++ b/drivers/video/fbdev/omap2/omapfb/Kconfig
> @@ -5,7 +5,6 @@ config OMAP2_VRFB
>   menuconfig FB_OMAP2
>   	tristate "OMAP2+ frame buffer support"
>   	depends on FB
> -	depends on FB_DEVICE
>   	depends on DRM_OMAP = n
>   	depends on GPIOLIB
>   	select FB_OMAP2_DSS
> @@ -13,6 +12,8 @@ menuconfig FB_OMAP2
>   	select FB_IOMEM_HELPERS
>   	help
>   	  Frame buffer driver for OMAP2+ based boards.
> +	  FB_DEVICE is not required, but if enabled, provides sysfs interface
> +	  for framebuffer configuration and debugging.
>   
>   if FB_OMAP2
>   
> diff --git a/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c b/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
> index 831b2c2fbdf9..38a635d38d58 100644
> --- a/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
> +++ b/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
> @@ -558,10 +558,15 @@ int omapfb_create_sysfs(struct omapfb2_device *fbdev)
>   
>   	DBG("create sysfs for fbs\n");
>   	for (i = 0; i < fbdev->num_fbs; i++) {
> +		struct device *dev;
>   		int t;
> +
> +		dev = dev_of_fbinfo(fbdev->fbs[i]);
> +		if (!dev)
> +			continue;
> +
>   		for (t = 0; t < ARRAY_SIZE(omapfb_attrs); t++) {
> -			r = device_create_file(fbdev->fbs[i]->dev,
> -					&omapfb_attrs[t]);
> +			r = device_create_file(dev, &omapfb_attrs[t]);
>   
>   			if (r) {
>   				dev_err(fbdev->dev, "failed to create sysfs "
> @@ -580,9 +585,14 @@ void omapfb_remove_sysfs(struct omapfb2_device *fbdev)
>   
>   	DBG("remove sysfs for fbs\n");
>   	for (i = 0; i < fbdev->num_fbs; i++) {
> +		struct device *dev;
> +
> +		dev = dev_of_fbinfo(fbdev->fbs[i]);
> +		if (!dev)
> +			continue;
> +
>   		for (t = 0; t < ARRAY_SIZE(omapfb_attrs); t++)
> -			device_remove_file(fbdev->fbs[i]->dev,
> -					&omapfb_attrs[t]);
> +			device_remove_file(dev, &omapfb_attrs[t]);
>   	}
>   }
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


