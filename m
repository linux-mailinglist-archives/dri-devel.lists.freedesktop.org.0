Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9404B91439A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 09:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C69F10E38C;
	Mon, 24 Jun 2024 07:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="MM5jglMP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+YZLq6/y";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MM5jglMP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+YZLq6/y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B795910E383;
 Mon, 24 Jun 2024 07:23:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 54404219B3;
 Mon, 24 Jun 2024 07:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719213778; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fgSDJ0z94oZbJGJHnBFcznbCTngzO26B2p3hIxsS10s=;
 b=MM5jglMPd4AphcM325LFaEGFKUPtm6gHmrh80YZ4rundjP76oMEYmc9HtU6OZWIZd5JgwT
 6DZeqAHtaMKdGAMm+iFnHUARqjrYWjzpUQOrknVjWeLGREr4PLJjOsrIHx9EjHuizqs3qr
 a11OGgoSqpHMVho87QV78C2hVVSjCi8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719213778;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fgSDJ0z94oZbJGJHnBFcznbCTngzO26B2p3hIxsS10s=;
 b=+YZLq6/ypqGE8pnCMKvRCWexi8l8Xi2oHnXKyys98G3DgoNl4ttTAffHzZD5C8o1ufJRRS
 /+trlsmeYSpiU/CA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MM5jglMP;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="+YZLq6/y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719213778; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fgSDJ0z94oZbJGJHnBFcznbCTngzO26B2p3hIxsS10s=;
 b=MM5jglMPd4AphcM325LFaEGFKUPtm6gHmrh80YZ4rundjP76oMEYmc9HtU6OZWIZd5JgwT
 6DZeqAHtaMKdGAMm+iFnHUARqjrYWjzpUQOrknVjWeLGREr4PLJjOsrIHx9EjHuizqs3qr
 a11OGgoSqpHMVho87QV78C2hVVSjCi8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719213778;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fgSDJ0z94oZbJGJHnBFcznbCTngzO26B2p3hIxsS10s=;
 b=+YZLq6/ypqGE8pnCMKvRCWexi8l8Xi2oHnXKyys98G3DgoNl4ttTAffHzZD5C8o1ufJRRS
 /+trlsmeYSpiU/CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 12A1E13ACD;
 Mon, 24 Jun 2024 07:22:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ulMyA9IeeWaIewAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Jun 2024 07:22:58 +0000
Message-ID: <dd5ec9e5-14c1-4bd3-b210-fdba2766dfd7@suse.de>
Date: Mon, 24 Jun 2024 09:22:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] drm/radeon: remove load callback
To: Wu Hoi Pok <wuhoipok@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20240621141544.19817-1-wuhoipok@gmail.com>
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
In-Reply-To: <20240621141544.19817-1-wuhoipok@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 54404219B3
X-Spam-Score: -4.50
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 XM_UA_NO_VERSION(0.01)[]; TO_DN_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FREEMAIL_TO(0.00)[gmail.com];
 ARC_NA(0.00)[];
 FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; MIME_TRACE(0.00)[0:+];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_SEVEN(0.00)[9]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Am 21.06.24 um 16:15 schrieb Wu Hoi Pok:
> This is "drm/radeon: remove load callback" v2, the only changes
> were made are adding "ddev->dev_private = rdev;", right after
> the allocation of "struct radeon_device". Patch v2 2-7 mostly
> describes simple "rdev->ddev" to "rdev_to_drm(rdev)" to suit
> Patch v2 1/7.
>
> Please be aware that these 7 patches depends on each other.

Thanks for the update. In the current form, it's not reviewable, or 
trackable in patchwork 
(https://patchwork.freedesktop.org/project/dri-devel/series/).

For sending patch series, please use 'git send-email' with the 
--cover-letter option. This will provide you with a single email for 
describing the patchset as a whole, and create all actual patch mails as 
replies to the cover letter.

Maybe test this first with your local email account and then please 
resubmit to the mailing list.

Best regards
Thomas

>
> Thank you.
>
> Signed-off-by: Wu Hoi Pok <wuhoipok@gmail.com>
> ---
>   drivers/gpu/drm/radeon/radeon.h     | 11 ++++++++---
>   drivers/gpu/drm/radeon/radeon_drv.c | 27 ++++++++++++++++++---------
>   drivers/gpu/drm/radeon/radeon_drv.h |  1 -
>   drivers/gpu/drm/radeon/radeon_kms.c | 18 ++++++------------
>   4 files changed, 32 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
> index 0999c8eaae94..69bb30ced189 100644
> --- a/drivers/gpu/drm/radeon/radeon.h
> +++ b/drivers/gpu/drm/radeon/radeon.h
> @@ -2297,7 +2297,7 @@ typedef void (*radeon_wreg_t)(struct radeon_device*, uint32_t, uint32_t);
>   
>   struct radeon_device {
>   	struct device			*dev;
> -	struct drm_device		*ddev;
> +	struct drm_device		ddev;
>   	struct pci_dev			*pdev;
>   #ifdef __alpha__
>   	struct pci_controller		*hose;
> @@ -2440,10 +2440,13 @@ struct radeon_device {
>   	u64 gart_pin_size;
>   };
>   
> +static inline struct drm_device *rdev_to_drm(struct radeon_device *rdev)
> +{
> +	return &rdev->ddev;
> +}
> +
>   bool radeon_is_px(struct drm_device *dev);
>   int radeon_device_init(struct radeon_device *rdev,
> -		       struct drm_device *ddev,
> -		       struct pci_dev *pdev,
>   		       uint32_t flags);
>   void radeon_device_fini(struct radeon_device *rdev);
>   int radeon_gpu_wait_for_idle(struct radeon_device *rdev);
> @@ -2818,6 +2821,8 @@ struct radeon_device *radeon_get_rdev(struct ttm_device *bdev);
>   
>   /* KMS */
>   
> +int radeon_driver_load_kms(struct radeon_device *dev, unsigned long flags);
> +
>   u32 radeon_get_vblank_counter_kms(struct drm_crtc *crtc);
>   int radeon_enable_vblank_kms(struct drm_crtc *crtc);
>   void radeon_disable_vblank_kms(struct drm_crtc *crtc);
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
> index 7bf08164140e..ae9cadceba83 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -259,7 +259,8 @@ static int radeon_pci_probe(struct pci_dev *pdev,
>   			    const struct pci_device_id *ent)
>   {
>   	unsigned long flags = 0;
> -	struct drm_device *dev;
> +	struct drm_device *ddev;
> +	struct radeon_device *rdev;
>   	int ret;
>   
>   	if (!ent)
> @@ -300,28 +301,37 @@ static int radeon_pci_probe(struct pci_dev *pdev,
>   	if (ret)
>   		return ret;
>   
> -	dev = drm_dev_alloc(&kms_driver, &pdev->dev);
> -	if (IS_ERR(dev))
> -		return PTR_ERR(dev);
> +	rdev = devm_drm_dev_alloc(&pdev->dev, &kms_driver, typeof(*rdev), ddev);
> +	if (IS_ERR(rdev))
> +		return PTR_ERR(rdev);
> +
> +	rdev->dev  = &pdev->dev;
> +	rdev->pdev = pdev;
> +	ddev = rdev_to_drm(rdev);
> +	ddev->dev_private = rdev;
>   
>   	ret = pci_enable_device(pdev);
>   	if (ret)
>   		goto err_free;
>   
> -	pci_set_drvdata(pdev, dev);
> +	pci_set_drvdata(pdev, ddev);
> +
> +	ret = radeon_driver_load_kms(rdev, flags);
> +	if (ret)
> +		goto err_agp;
>   
> -	ret = drm_dev_register(dev, ent->driver_data);
> +	ret = drm_dev_register(ddev, flags);
>   	if (ret)
>   		goto err_agp;
>   
> -	radeon_fbdev_setup(dev->dev_private);
> +	radeon_fbdev_setup(ddev->dev_private);
>   
>   	return 0;
>   
>   err_agp:
>   	pci_disable_device(pdev);
>   err_free:
> -	drm_dev_put(dev);
> +	drm_dev_put(ddev);
>   	return ret;
>   }
>   
> @@ -569,7 +579,6 @@ static const struct drm_ioctl_desc radeon_ioctls_kms[] = {
>   static const struct drm_driver kms_driver = {
>   	.driver_features =
>   	    DRIVER_GEM | DRIVER_RENDER | DRIVER_MODESET,
> -	.load = radeon_driver_load_kms,
>   	.open = radeon_driver_open_kms,
>   	.postclose = radeon_driver_postclose_kms,
>   	.unload = radeon_driver_unload_kms,
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.h b/drivers/gpu/drm/radeon/radeon_drv.h
> index 02a65971d140..6c1eb75a951b 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.h
> +++ b/drivers/gpu/drm/radeon/radeon_drv.h
> @@ -117,7 +117,6 @@
>   long radeon_drm_ioctl(struct file *filp,
>   		      unsigned int cmd, unsigned long arg);
>   
> -int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags);
>   void radeon_driver_unload_kms(struct drm_device *dev);
>   int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv);
>   void radeon_driver_postclose_kms(struct drm_device *dev,
> diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
> index a16590c6247f..d2df194393af 100644
> --- a/drivers/gpu/drm/radeon/radeon_kms.c
> +++ b/drivers/gpu/drm/radeon/radeon_kms.c
> @@ -91,7 +91,7 @@ void radeon_driver_unload_kms(struct drm_device *dev)
>   /**
>    * radeon_driver_load_kms - Main load function for KMS.
>    *
> - * @dev: drm dev pointer
> + * @rdev: radeon dev pointer
>    * @flags: device flags
>    *
>    * This is the main load function for KMS (all asics).
> @@ -101,24 +101,18 @@ void radeon_driver_unload_kms(struct drm_device *dev)
>    * (crtcs, encoders, hotplug detect, etc.).
>    * Returns 0 on success, error on failure.
>    */
> -int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags)
> +int radeon_driver_load_kms(struct radeon_device *rdev, unsigned long flags)
>   {
> -	struct pci_dev *pdev = to_pci_dev(dev->dev);
> -	struct radeon_device *rdev;
> +	struct pci_dev *pdev = rdev->pdev;
> +	struct drm_device *dev = rdev_to_drm(rdev);
>   	int r, acpi_status;
>   
> -	rdev = kzalloc(sizeof(struct radeon_device), GFP_KERNEL);
> -	if (rdev == NULL) {
> -		return -ENOMEM;
> -	}
> -	dev->dev_private = (void *)rdev;
> -
>   #ifdef __alpha__
>   	rdev->hose = pdev->sysdata;
>   #endif
>   
>   	if (pci_find_capability(pdev, PCI_CAP_ID_AGP))
> -		rdev->agp = radeon_agp_head_init(dev);
> +		rdev->agp = radeon_agp_head_init(rdev_to_drm(rdev));
>   	if (rdev->agp) {
>   		rdev->agp->agp_mtrr = arch_phys_wc_add(
>   			rdev->agp->agp_info.aper_base,
> @@ -147,7 +141,7 @@ int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags)
>   	 * properly initialize the GPU MC controller and permit
>   	 * VRAM allocation
>   	 */
> -	r = radeon_device_init(rdev, dev, pdev, flags);
> +	r = radeon_device_init(rdev, flags);
>   	if (r) {
>   		dev_err(dev->dev, "Fatal error during GPU init\n");
>   		goto out;

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

