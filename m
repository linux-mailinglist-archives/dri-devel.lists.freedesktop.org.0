Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 137C4A49853
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 12:29:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43CE10E253;
	Fri, 28 Feb 2025 11:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="qqJTyn3u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jy0vDuyy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qfiU8McS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ecdao6Ye";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9247B10E0E5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 11:29:50 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F39D21F37E;
 Fri, 28 Feb 2025 11:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740742189; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=N7brGfKSIcPFwa3yDK4Fwm3oBgZgE/JEnKosbmNx3xk=;
 b=qqJTyn3u7XGGhDuKvg/QRV6ItR3rIaMCjUi0SVZztiFnRk2BW8jZec29Jy4PytAC4sKKEm
 Pl6C0hH5A+GPlrAi/MHZq3nyTS6EnP9kgDwWbWYkUwOMPN8eSnwpsfWuoIn+R97yu0YIiL
 jSNkwz17xyFPZo9x+nU3HL2XKoo2S3A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740742189;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=N7brGfKSIcPFwa3yDK4Fwm3oBgZgE/JEnKosbmNx3xk=;
 b=jy0vDuyy9iAb8q+IuEHU6RI6jyYax6LzeC5Qaatx4RMOzAZZKCb65l3i8+CmgCxF1Psn3B
 qDk5jTH5bX9QmvCw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qfiU8McS;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Ecdao6Ye
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740742188; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=N7brGfKSIcPFwa3yDK4Fwm3oBgZgE/JEnKosbmNx3xk=;
 b=qfiU8McSnRMPUdJ7d56KbJXWKFuCF/jG4aNghfsA+FeucsvtI7cmdUOOeiOKLgBuEirKke
 Yu+uukjdHefeY2njYUy8gHcEcSN2BcGSV+nWQJfi07ekk9+7GPMaZW1U8P0DScV+fTt9Zo
 Va74NCDbvpLpUlflngY1Tn7tA9BlvnU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740742188;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=N7brGfKSIcPFwa3yDK4Fwm3oBgZgE/JEnKosbmNx3xk=;
 b=Ecdao6YeCXnApsy5/2ijgRnJlHe7WFRhb00WkVWvXFObSkNAtTRINZO/5TZhVEZWO+eAur
 RmD0rckev9gB4HDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A1451344A;
 Fri, 28 Feb 2025 11:29:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id TNFDJCuewWcFdwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Feb 2025 11:29:47 +0000
Message-ID: <5a140090-e8cf-4136-87ff-04785d9a12b3@suse.de>
Date: Fri, 28 Feb 2025 12:29:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/prime: Support dedicated DMA device for dma-buf
 imports
To: Jani Nikula <jani.nikula@linux.intel.com>, simona@ffwll.ch,
 javierm@redhat.com, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, hdegoede@redhat.com, airlied@redhat.com,
 sean@poorly.run, sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org
References: <20250228094457.239442-1-tzimmermann@suse.de>
 <20250228094457.239442-2-tzimmermann@suse.de> <8734fy2u3l.fsf@intel.com>
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
In-Reply-To: <8734fy2u3l.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: F39D21F37E
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[linux.intel.com,ffwll.ch,redhat.com,gmail.com,kernel.org,poorly.run,linaro.org,amd.com];
 ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCPT_COUNT_TWELVE(0.00)[12]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, suse.de:dkim, suse.de:mid, suse.de:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
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

Hi

Am 28.02.25 um 12:21 schrieb Jani Nikula:
> On Fri, 28 Feb 2025, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Importing dma-bufs via PRIME requires a DMA-capable device. Devices on
>> peripheral busses, such as USB, often cannot perform DMA by themselves.
>> Without DMA-capable device PRIME import fails. DRM drivers for USB
>> devices already use a separate DMA device for dma-buf imports. Make the
>> mechanism generally available.
>>
>> Add the field dma_dev to struct drm_device to refer to the device's DMA
>> device. For USB this should be the USB controller. Use dma_dev in the
>> PRIME import helpers, if set.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/drm_drv.c   |  2 ++
>>   drivers/gpu/drm/drm_prime.c |  2 +-
>>   include/drm/drm_device.h    | 37 +++++++++++++++++++++++++++++++++++++
>>   3 files changed, 40 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index 17fc5dc708f4..f8c3c9f77d22 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -654,6 +654,8 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
>>   {
>>   	drm_fs_inode_free(dev->anon_inode);
>>   
>> +	put_device(dev->dma_dev);
>> +	dev->dma_dev = NULL;
> The asymmetry in who gets and puts the ->dma_dev bugs me.
>
> You could avoid that by providing a helper for setting ->dma_dev, and
> having that get the device:
>
> int drm_dev_set_dma_device(struct drm_device *drm, struct device *dma_device)
> {
> 	dev->dma_dev = get_device(dma_device);
>
> 	return dev->dma_dev ? 0 : -ENODEV.
> }
>
> Taking drm/gm12u320 from patch 2 as an example, it would become:
>
> 	dma_device = usb_intf_get_dma_device(to_usb_interface(dev->dev))
> 	if (drm_dev_set_dma_device(drm, dma_device))
> 		drm_warn(dev, "buffer sharing not supported"); /* not an error */
> 	put_device(dma_device);
>
> Sligthly more verbose, but has a get/put pair in the driver, and a
> get/put pair in the core, instead of the asymmetry.
>
> I'm not insisting, but something to consider.

We're doing a get_device() on the regular parent kept in dev. So yeah, 
keeping a ref on the dma_dev would make sense.

Best regards
Thomas

>
>
> BR,
> Jani.
>
>
>>   	put_device(dev->dev);
>>   	/* Prevent use-after-free in drm_managed_release when debugging is
>>   	 * enabled. Slightly awkward, but can't really be helped. */
>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>> index 32a8781cfd67..258858f2f8dd 100644
>> --- a/drivers/gpu/drm/drm_prime.c
>> +++ b/drivers/gpu/drm/drm_prime.c
>> @@ -1004,7 +1004,7 @@ EXPORT_SYMBOL(drm_gem_prime_import_dev);
>>   struct drm_gem_object *drm_gem_prime_import(struct drm_device *dev,
>>   					    struct dma_buf *dma_buf)
>>   {
>> -	return drm_gem_prime_import_dev(dev, dma_buf, dev->dev);
>> +	return drm_gem_prime_import_dev(dev, dma_buf, drm_dev_dma_dev(dev));
>>   }
>>   EXPORT_SYMBOL(drm_gem_prime_import);
>>   
>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>> index 6ea54a578cda..a24cac4b2077 100644
>> --- a/include/drm/drm_device.h
>> +++ b/include/drm/drm_device.h
>> @@ -64,6 +64,23 @@ struct drm_device {
>>   	/** @dev: Device structure of bus-device */
>>   	struct device *dev;
>>   
>> +	/**
>> +	 * @dma_dev:
>> +	 *
>> +	 * Device for DMA operations. Only required if the device @dev
>> +	 * cannot perform DMA by itself. Should be NULL otherwise.
>> +	 *
>> +	 * Devices on USB and other peripheral busses cannot perform DMA
>> +	 * by themselves. The @dma_dev field should point the bus controller
>> +	 * that does DMA on behalve of such a device. Required for importing
>> +	 * buffers via dma-buf.
>> +	 *
>> +	 * If set, the DRM driver has to acquire a reference on the DMA
>> +	 * device, which will be owned and released automatically by the
>> +	 * DRM core.
>> +	 */
>> +	struct device *dma_dev;
>> +
>>   	/**
>>   	 * @managed:
>>   	 *
>> @@ -327,4 +344,24 @@ struct drm_device {
>>   	struct dentry *debugfs_root;
>>   };
>>   
>> +/**
>> + * drm_dev_dma_dev - returns the DMA device for a DRM device
>> + * @dev: DRM device
>> + *
>> + * Returns the DMA device of the given DRM device. This is usually
>> + * the same as the DRM device's parent. Devices on some peripheral
>> + * busses, such as USB, are incapable of performing DMA by themselves.
>> + * Drivers should set struct &drm_device.dma_dev to the bus controller
>> + * to make DMA work. Required for PRIME buffer import.
>> + *
>> + * Returns:
>> + * A DMA-capable device for the DRM device.
>> + */
>> +static inline struct device *drm_dev_dma_dev(struct drm_device *dev)
>> +{
>> +	if (dev->dma_dev)
>> +		return dev->dma_dev;
>> +	return dev->dev;
>> +}
>> +
>>   #endif

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

