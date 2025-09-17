Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA8CB801CA
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 16:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A9B10E851;
	Wed, 17 Sep 2025 14:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="mLnLCTT1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SjMSNiJA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mLnLCTT1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SjMSNiJA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154D110E851
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 14:41:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BB4712064D;
 Wed, 17 Sep 2025 14:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758120076; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wA7r1WZYbZub30NyQBFugxQeEYMaV29B73/0Mg7EIVQ=;
 b=mLnLCTT1SLKjduRUYUdcyO/R0VneI7W64pTlhR8d5W/ON99hgYbx2S1rhA4s6eOIRArFFx
 xUZiiBiyd8ricbrBJePLyLaTsGfHlfd8CLlFA8/sAzHZrmTw3RSB6lcqF+2e4ENPIy4Y5Z
 A3d9Sjvjo1hqZxEk0d1q4z7Jz9fubTk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758120076;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wA7r1WZYbZub30NyQBFugxQeEYMaV29B73/0Mg7EIVQ=;
 b=SjMSNiJA8J8jGrabu9XStHvkQ/SKk5O25RCCzAwCxhZDOqnXr5FlySijSfEnkThcwXuLMv
 1j/rrPJ+YO7yWGDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758120076; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wA7r1WZYbZub30NyQBFugxQeEYMaV29B73/0Mg7EIVQ=;
 b=mLnLCTT1SLKjduRUYUdcyO/R0VneI7W64pTlhR8d5W/ON99hgYbx2S1rhA4s6eOIRArFFx
 xUZiiBiyd8ricbrBJePLyLaTsGfHlfd8CLlFA8/sAzHZrmTw3RSB6lcqF+2e4ENPIy4Y5Z
 A3d9Sjvjo1hqZxEk0d1q4z7Jz9fubTk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758120076;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wA7r1WZYbZub30NyQBFugxQeEYMaV29B73/0Mg7EIVQ=;
 b=SjMSNiJA8J8jGrabu9XStHvkQ/SKk5O25RCCzAwCxhZDOqnXr5FlySijSfEnkThcwXuLMv
 1j/rrPJ+YO7yWGDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2D7F01368D;
 Wed, 17 Sep 2025 14:41:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id g/HcBozIymjkDgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 17 Sep 2025 14:41:16 +0000
Message-ID: <f2783a49-c60c-42ac-9b37-b71c253fb1cf@suse.de>
Date: Wed, 17 Sep 2025 16:41:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] fbdev/hyperv_fb: deprecate this in favor of Hyper-V
 DRM driver
To: Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 ssengar@linux.microsoft.com, mhklinux@outlook.com, rdunlap@infradead.org,
 bartosz.golaszewski@linaro.org, gonzalo.silvalde@gmail.com, arnd@arndb.de,
 decui@microsoft.com, wei.liu@kernel.org, deller@gmx.de, kys@microsoft.com,
 haiyangz@microsoft.com
References: <E5C2A201B1BD>
 <1758117785-20653-1-git-send-email-ptsm@linux.microsoft.com>
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
In-Reply-To: <1758117785-20653-1-git-send-email-ptsm@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TAGGED_RCPT(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWELVE(0.00)[16];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_TO(0.00)[linux.microsoft.com,lists.freedesktop.org,vger.kernel.org,outlook.com,infradead.org,linaro.org,gmail.com,arndb.de,microsoft.com,kernel.org,gmx.de];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,outlook.com];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.de:mid,
 suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80
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



Am 17.09.25 um 16:03 schrieb Prasanna Kumar T S M:
> The Hyper-V DRM driver is available since kernel version 5.14 and it
> provides full KMS support and fbdev emulation via the DRM fbdev helpers.
> Deprecate this driver in favor of Hyper-V DRM driver.
>
> Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/video/fbdev/Kconfig     | 5 ++++-
>   drivers/video/fbdev/hyperv_fb.c | 2 ++
>   2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index c21484d15f0c..48c1c7417f6d 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -1773,13 +1773,16 @@ config FB_BROADSHEET
>   	  a bridge adapter.
>   
>   config FB_HYPERV
> -	tristate "Microsoft Hyper-V Synthetic Video support"
> +	tristate "Microsoft Hyper-V Synthetic Video support (DEPRECATED)"
>   	depends on FB && HYPERV
>   	select DMA_CMA if HAVE_DMA_CONTIGUOUS && CMA
>   	select FB_IOMEM_HELPERS_DEFERRED
>   	help
>   	  This framebuffer driver supports Microsoft Hyper-V Synthetic Video.
>   
> +	  This driver is deprecated, please use the Hyper-V DRM driver at
> +	  drivers/gpu/drm/hyperv (CONFIG_DRM_HYPERV) instead.
> +
>   config FB_SIMPLE
>   	tristate "Simple framebuffer support"
>   	depends on FB
> diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
> index 75338ffc703f..c99e2ea4b3de 100644
> --- a/drivers/video/fbdev/hyperv_fb.c
> +++ b/drivers/video/fbdev/hyperv_fb.c
> @@ -1357,6 +1357,8 @@ static int __init hvfb_drv_init(void)
>   {
>   	int ret;
>   
> +	pr_warn("Deprecated: use Hyper-V DRM driver instead\n");
> +
>   	if (fb_modesetting_disabled("hyper_fb"))
>   		return -ENODEV;
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


