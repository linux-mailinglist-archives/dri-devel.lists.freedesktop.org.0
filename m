Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBB4A4BBF6
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 11:23:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E169C10E3BB;
	Mon,  3 Mar 2025 10:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="GI4314C1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IzN1RMI+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GI4314C1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IzN1RMI+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AFAC10E3C1
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 10:23:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C0FCC1F383;
 Mon,  3 Mar 2025 10:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740997418; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cD16nGPOYunmYvi1t/7+nOhD/rhP7wlEHSzjLHolJpY=;
 b=GI4314C1AmJrSxZg+s9FQm9ee5u92N+T7a6ULt3l7orbqmofFaWpy78IRMjGnFGBpW69PQ
 P39vJJHmuGs/kjo9xtU/ues8WTzrBBmZU+XOM4yxu8UdtFnOpTi1zM1iwX7orC408Nh+it
 5k9bdsVnd+TvWXNnxxeusZZKON6NDB0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740997418;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cD16nGPOYunmYvi1t/7+nOhD/rhP7wlEHSzjLHolJpY=;
 b=IzN1RMI+/Umx3noGyZfKdcxwqmVkjr4T70A1OUmrBDfhyVIfafUU5rQc3NUuqdxATfBU8b
 gWFUcsk6/bM67PCA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GI4314C1;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IzN1RMI+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740997418; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cD16nGPOYunmYvi1t/7+nOhD/rhP7wlEHSzjLHolJpY=;
 b=GI4314C1AmJrSxZg+s9FQm9ee5u92N+T7a6ULt3l7orbqmofFaWpy78IRMjGnFGBpW69PQ
 P39vJJHmuGs/kjo9xtU/ues8WTzrBBmZU+XOM4yxu8UdtFnOpTi1zM1iwX7orC408Nh+it
 5k9bdsVnd+TvWXNnxxeusZZKON6NDB0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740997418;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cD16nGPOYunmYvi1t/7+nOhD/rhP7wlEHSzjLHolJpY=;
 b=IzN1RMI+/Umx3noGyZfKdcxwqmVkjr4T70A1OUmrBDfhyVIfafUU5rQc3NUuqdxATfBU8b
 gWFUcsk6/bM67PCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7996F13939;
 Mon,  3 Mar 2025 10:23:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +gR/HCqDxWcXGgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 03 Mar 2025 10:23:38 +0000
Message-ID: <e61777a1-8983-4394-87b4-9fb8f8759817@suse.de>
Date: Mon, 3 Mar 2025 11:23:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/prime: Support dedicated DMA device for dma-buf
 imports
To: Maxime Ripard <mripard@kernel.org>
Cc: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, hdegoede@redhat.com, airlied@redhat.com,
 sean@poorly.run, sumit.semwal@linaro.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org
References: <20250228094457.239442-1-tzimmermann@suse.de>
 <20250228094457.239442-2-tzimmermann@suse.de>
 <20250303-lyrical-cherry-goose-c871d1@houat>
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
In-Reply-To: <20250303-lyrical-cherry-goose-c871d1@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C0FCC1F383
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[ffwll.ch,redhat.com,gmail.com,linux.intel.com,poorly.run,linaro.org,amd.com,lists.freedesktop.org];
 MID_RHS_MATCH_FROM(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[11]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_VIA_SMTP_AUTH(0.00)[];
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

Am 03.03.25 um 10:57 schrieb Maxime Ripard:
> Hi Thomas,
>
> On Fri, Feb 28, 2025 at 10:32:51AM +0100, Thomas Zimmermann wrote:
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
> It looks good to me in general, but this is also useful with ARM
> platform is general. On those, the DRM device is bound to a virtual
> device (and thus can't do DMA), but the HW accesses will be done by
> one or more HW controllers that are part of the overall DRM driver.
>
> Thus, we typically have to make hacks to copy to the virtual device DMA
> setup from the actual device doing the DMA accesses.
>
> See for example
> https://elixir.bootlin.com/linux/v6.13.5/source/drivers/gpu/drm/vc4/vc4_drv.c#L313
> https://elixir.bootlin.com/linux/v6.13.5/source/drivers/gpu/drm/sun4i/sun4i_backend.c#L797
>
> It's probably worth documenting.

Sure, I can do that.

In the series' cover letter, I mention that the GEM-DMA code could use 
the dma_dev. It seems that these drivers would benefit from such a change.

Best regards
Thomas

>
> Maxime

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

