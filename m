Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E003F9778C8
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 08:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4949510E73F;
	Fri, 13 Sep 2024 06:23:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="F4LS+Mck";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5yeOekLC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="F4LS+Mck";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5yeOekLC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1720310E556;
 Fri, 13 Sep 2024 06:23:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7F56621A6D;
 Fri, 13 Sep 2024 06:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726208618; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=VlaIwvORBzSC58n0AvMNAfRFFzzucrLdMqIWPEJpaX4=;
 b=F4LS+Mckph0krwNGnppvwxnoao2acuPRbGSLArUSjCoXeQeteTl2zj8H4GFIC1+916mxN6
 Qn2dv6+a5MzV8PDb9LDPkazbNAvely/aA0/7hJO3IP7kGyXYlajPIJ8214o4r1e8ZpjgWp
 zfDsSdA527gvDGUkxz/g9FIk5Q7mcg8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726208618;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=VlaIwvORBzSC58n0AvMNAfRFFzzucrLdMqIWPEJpaX4=;
 b=5yeOekLCLFc6AAtwC01yasdVn3UndPlmR0kQs3WgK++mNrg1RxsBP7Z0ReJ4DtCWyIFXEo
 2dyFPJPUlvoe7zAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726208618; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=VlaIwvORBzSC58n0AvMNAfRFFzzucrLdMqIWPEJpaX4=;
 b=F4LS+Mckph0krwNGnppvwxnoao2acuPRbGSLArUSjCoXeQeteTl2zj8H4GFIC1+916mxN6
 Qn2dv6+a5MzV8PDb9LDPkazbNAvely/aA0/7hJO3IP7kGyXYlajPIJ8214o4r1e8ZpjgWp
 zfDsSdA527gvDGUkxz/g9FIk5Q7mcg8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726208618;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=VlaIwvORBzSC58n0AvMNAfRFFzzucrLdMqIWPEJpaX4=;
 b=5yeOekLCLFc6AAtwC01yasdVn3UndPlmR0kQs3WgK++mNrg1RxsBP7Z0ReJ4DtCWyIFXEo
 2dyFPJPUlvoe7zAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 301D913999;
 Fri, 13 Sep 2024 06:23:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QlhRCmra42bsFQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 13 Sep 2024 06:23:38 +0000
Message-ID: <68992cff-b311-453d-869c-cb3774ff3c50@suse.de>
Date: Fri, 13 Sep 2024 08:23:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 68/80] drm/nouveau: Run DRM default client setup
To: Lyude Paul <lyude@redhat.com>, simona@ffwll.ch, airlied@gmail.com,
 jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
References: <20240909113633.595465-1-tzimmermann@suse.de>
 <20240909113633.595465-69-tzimmermann@suse.de>
 <2ac3101e31e2f85e1322ed7f0b645988de7a38b7.camel@redhat.com>
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
In-Reply-To: <2ac3101e31e2f85e1322ed7f0b645988de7a38b7.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com];
 RCPT_COUNT_TWELVE(0.00)[12]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
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

Am 12.09.24 um 20:04 schrieb Lyude Paul:
> Reviewed-by: Lyude Paul <lyude@redhat.com>

Thanks a lot.

>
> I assume you can push this to drm-misc-next yourself?

I think so. :)

Best regards
Thomas

>
> On Mon, 2024-09-09 at 13:31 +0200, Thomas Zimmermann wrote:
>> Call drm_client_setup() to run the kernel's default client setup
>> for DRM. Set fbdev_probe in struct drm_driver, so that the client
>> setup can start the common fbdev client.
>>
>> The nouveau driver specifies a preferred color mode depending on
>> the available video memory, with a default of 32. Adapt this for
>> the new client interface.
>>
>> v2:
>> - style changes
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Karol Herbst <kherbst@redhat.com>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Cc: Danilo Krummrich <dakr@redhat.com>
>> Acked-by: Danilo Krummrich <dakr@kernel.org>
>> ---
>>   drivers/gpu/drm/nouveau/nouveau_drm.c | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
>> index 4a9a9b9c3935..628c47a60de5 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
>> @@ -31,6 +31,7 @@
>>   #include <linux/dynamic_debug.h>
>>   
>>   #include <drm/drm_aperture.h>
>> +#include <drm/drm_client_setup.h>
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_fbdev_ttm.h>
>>   #include <drm/drm_gem_ttm_helper.h>
>> @@ -836,6 +837,7 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
>>   {
>>   	struct nvkm_device *device;
>>   	struct nouveau_drm *drm;
>> +	const struct drm_format_info *format;
>>   	int ret;
>>   
>>   	if (vga_switcheroo_client_probe_defer(pdev))
>> @@ -873,9 +875,11 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
>>   		goto fail_pci;
>>   
>>   	if (drm->client.device.info.ram_size <= 32 * 1024 * 1024)
>> -		drm_fbdev_ttm_setup(drm->dev, 8);
>> +		format = drm_format_info(DRM_FORMAT_C8);
>>   	else
>> -		drm_fbdev_ttm_setup(drm->dev, 32);
>> +		format = NULL;
>> +
>> +	drm_client_setup(drm->dev, format);
>>   
>>   	quirk_broken_nv_runpm(pdev);
>>   	return 0;
>> @@ -1317,6 +1321,8 @@ driver_stub = {
>>   	.dumb_create = nouveau_display_dumb_create,
>>   	.dumb_map_offset = drm_gem_ttm_dumb_map_offset,
>>   
>> +	DRM_FBDEV_TTM_DRIVER_OPS,
>> +
>>   	.name = DRIVER_NAME,
>>   	.desc = DRIVER_DESC,
>>   #ifdef GIT_REVISION

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

