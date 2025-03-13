Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27662A5FAA9
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 17:02:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77CFD10E231;
	Thu, 13 Mar 2025 16:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="RO9WW+xO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="77t1Xa4L";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RO9WW+xO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="77t1Xa4L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5AB610E231
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 16:02:50 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9C19B21189;
 Thu, 13 Mar 2025 16:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741881768; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=tXbC/rj42XjQ00LcFGrOyNrm+z2xLbLsVvmtNJS5qSE=;
 b=RO9WW+xOZL4x0VifG/9+R2HjAoHTYHGFDKb2tZchGVn1hbh+bb94MFnJ/R6JyKkVllVBlM
 rtYWJ+eT2h/J4p6dilXU02fXGc8lvoUH+gHTlXK1KTwJIm8oxL+oN/SxYBPYy1tpccL2yG
 qbzRwFYeGV2G3EAYZ6v6LLsGGo5A2YA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741881768;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=tXbC/rj42XjQ00LcFGrOyNrm+z2xLbLsVvmtNJS5qSE=;
 b=77t1Xa4LDjVyozoy7z32oI6+ODHP5u8xAcWjHpJAmvQ0xBOYw//7Cx7lNXtWzotq3rSVQk
 6FYjdaVEd+dwZABw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RO9WW+xO;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=77t1Xa4L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741881768; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=tXbC/rj42XjQ00LcFGrOyNrm+z2xLbLsVvmtNJS5qSE=;
 b=RO9WW+xOZL4x0VifG/9+R2HjAoHTYHGFDKb2tZchGVn1hbh+bb94MFnJ/R6JyKkVllVBlM
 rtYWJ+eT2h/J4p6dilXU02fXGc8lvoUH+gHTlXK1KTwJIm8oxL+oN/SxYBPYy1tpccL2yG
 qbzRwFYeGV2G3EAYZ6v6LLsGGo5A2YA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741881768;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=tXbC/rj42XjQ00LcFGrOyNrm+z2xLbLsVvmtNJS5qSE=;
 b=77t1Xa4LDjVyozoy7z32oI6+ODHP5u8xAcWjHpJAmvQ0xBOYw//7Cx7lNXtWzotq3rSVQk
 6FYjdaVEd+dwZABw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 25E39137BA;
 Thu, 13 Mar 2025 16:02:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2nXJB6gB02dkJgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Mar 2025 16:02:48 +0000
Message-ID: <a2f39979-459d-4581-baed-ff75e0af1bce@suse.de>
Date: Thu, 13 Mar 2025 17:02:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/mxsfb: fix missing rollback on failure in
 mxsfb_probe()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Marek Vasut <marex@denx.de>,
 Stefan Agner <stefan@agner.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250313-mxsfb_probe-fix-rollback-on-error-v2-1-38374088e8c7@bootlin.com>
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
In-Reply-To: <20250313-mxsfb_probe-fix-rollback-on-error-v2-1-38374088e8c7@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9C19B21189
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_TWELVE(0.00)[18];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FREEMAIL_TO(0.00)[bootlin.com,denx.de,agner.ch,linux.intel.com,kernel.org,gmail.com,ffwll.ch,pengutronix.de,amarulasolutions.com];
 ARC_NA(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
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

Am 13.03.25 um 16:21 schrieb Luca Ceresoli:
> When aperture_remove_all_conflicting_devices() fails, the current code
> returns without going through the rollback actions at the end of the
> function, thus the actions done by drm_dev_alloc() and mxsfb_load() are not
> undone.
>
> Fix by moving this call at the very beginning of the probe function, so
> that no rollback is needed if it fails. Conflicting drivers need to be
> kicked out before setting up DRM anyway.
>
> Fixes: c8e7b185d45b ("drm/mxsfb: Remove generic DRM drivers in probe function")
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

The patchdiff is somewhat non-intuitive, but looks correct.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for the fix.

Best regards
Thomas

> ---
> The offending commit is not yet merged into master, and even less in a
> released kernel, so this does not need to go through stable.
>
> Changes in v2:
> - move this call at the beginning instead of adding a goto
> ---
>   drivers/gpu/drm/mxsfb/mxsfb_drv.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> index c183b1112bc4e9fe4f3b048a2b6e4c98d1d47cb3..ee64053d381448360140c419fed1dc4fe9f7c68e 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -352,14 +352,6 @@ static int mxsfb_probe(struct platform_device *pdev)
>   	struct drm_device *drm;
>   	int ret;
>   
> -	drm = drm_dev_alloc(&mxsfb_driver, &pdev->dev);
> -	if (IS_ERR(drm))
> -		return PTR_ERR(drm);
> -
> -	ret = mxsfb_load(drm, device_get_match_data(&pdev->dev));
> -	if (ret)
> -		goto err_free;
> -
>   	/*
>   	 * Remove early framebuffers (ie. simplefb). The framebuffer can be
>   	 * located anywhere in RAM
> @@ -369,6 +361,14 @@ static int mxsfb_probe(struct platform_device *pdev)
>   		return dev_err_probe(&pdev->dev, ret,
>   				     "can't kick out existing framebuffers\n");
>   
> +	drm = drm_dev_alloc(&mxsfb_driver, &pdev->dev);
> +	if (IS_ERR(drm))
> +		return PTR_ERR(drm);
> +
> +	ret = mxsfb_load(drm, device_get_match_data(&pdev->dev));
> +	if (ret)
> +		goto err_free;
> +
>   	ret = drm_dev_register(drm, 0);
>   	if (ret)
>   		goto err_unload;
>
> ---
> base-commit: f9f087d946266bc5da7c3a17bd8fd9d01969e3cf
> change-id: 20250313-mxsfb_probe-fix-rollback-on-error-3074b9080f34
>
> Best regards,

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

