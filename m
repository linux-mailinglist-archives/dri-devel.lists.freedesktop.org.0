Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 846AA98FDB2
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 09:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F0E10E84D;
	Fri,  4 Oct 2024 07:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="IPy2JHSE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dtxxDeyJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IPy2JHSE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dtxxDeyJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B71B10E84D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 07:16:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A5B581FE5F;
 Fri,  4 Oct 2024 07:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728026214; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=AnI1rbVuirV7guJvyNoPAdUvy5FjgrS6EqE4NCJKGAU=;
 b=IPy2JHSEbG12/hrMJ0/hYC6y9vLbBw3kU9jbIlrRIQ0SPKseenc0Kll1NInl247MSzjsZ1
 D4N2yyBvIAQL2pPEYak4nLtivMwcWqH/adp/doYjjKcB8Mqk5ATIMIaJHgFlltUxjy8y4B
 89rhFRkGpvqmDEjzLzcAnp3v+BnLwNE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728026214;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=AnI1rbVuirV7guJvyNoPAdUvy5FjgrS6EqE4NCJKGAU=;
 b=dtxxDeyJ7m6g1ojc9+eWgTGyTGzd/DZk6BHvbfvhGM1QdJ24XcmCNrhYiVWEnXbV4Lq1WQ
 qywfnKtt/N2QcqCw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IPy2JHSE;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=dtxxDeyJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728026214; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=AnI1rbVuirV7guJvyNoPAdUvy5FjgrS6EqE4NCJKGAU=;
 b=IPy2JHSEbG12/hrMJ0/hYC6y9vLbBw3kU9jbIlrRIQ0SPKseenc0Kll1NInl247MSzjsZ1
 D4N2yyBvIAQL2pPEYak4nLtivMwcWqH/adp/doYjjKcB8Mqk5ATIMIaJHgFlltUxjy8y4B
 89rhFRkGpvqmDEjzLzcAnp3v+BnLwNE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728026214;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=AnI1rbVuirV7guJvyNoPAdUvy5FjgrS6EqE4NCJKGAU=;
 b=dtxxDeyJ7m6g1ojc9+eWgTGyTGzd/DZk6BHvbfvhGM1QdJ24XcmCNrhYiVWEnXbV4Lq1WQ
 qywfnKtt/N2QcqCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6532B13A55;
 Fri,  4 Oct 2024 07:16:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 1HVaDmaW/2apYAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 04 Oct 2024 07:16:54 +0000
Message-ID: <bb6c536e-c602-42bb-932b-77ecd893910a@suse.de>
Date: Fri, 4 Oct 2024 09:16:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2,06/10] drm/bochs: Allocate DRM device in struct bochs_device
To: Kees Bakker <kees@ijzerbout.nl>, kraxel@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev
References: <20240902105546.792625-7-tzimmermann@suse.de>
 <8c5bfc12-cbcc-4102-9826-494060df4179@ijzerbout.nl>
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
In-Reply-To: <8c5bfc12-cbcc-4102-9826-494060df4179@ijzerbout.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A5B581FE5F
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCPT_COUNT_SEVEN(0.00)[8];
 FREEMAIL_TO(0.00)[ijzerbout.nl,redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
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

Am 02.10.24 um 22:00 schrieb Kees Bakker:
> Op 02-09-2024 om 12:53 schreef Thomas Zimmermann:
>> Allocate an instance of struct drm_device in struct bochs_device. Also
>> remove all uses of dev_private from bochs and upcast from the embedded
>> instance if necessary.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
>> ---
>>   drivers/gpu/drm/tiny/bochs.c | 52 +++++++++++++++++-------------------
>>   1 file changed, 25 insertions(+), 27 deletions(-)
>>
>> [...]
>> @@ -606,6 +602,7 @@ static const struct dev_pm_ops bochs_pm_ops = {
>>     static int bochs_pci_probe(struct pci_dev *pdev, const struct 
>> pci_device_id *ent)
>>   {
>> +    struct bochs_device *bochs;
>>       struct drm_device *dev;
>>       unsigned long fbsize;
>>       int ret;
>> @@ -620,9 +617,10 @@ static int bochs_pci_probe(struct pci_dev *pdev, 
>> const struct pci_device_id *ent
>>       if (ret)
>>           return ret;
>>   -    dev = drm_dev_alloc(&bochs_driver, &pdev->dev);
>> -    if (IS_ERR(dev))
>> +    bochs = devm_drm_dev_alloc(&pdev->dev, &bochs_driver, struct 
>> bochs_device, dev);
>> +    if (IS_ERR(bochs))
>>           return PTR_ERR(dev);
>> +    dev = &bochs->dev;
> The assignment of dev comes after potential use of dev in PTR_ERR(dev).
> Did you perhaps meant to have PTR_ERR(&pdev->dev) ?

Thanks for reporting. That should return PTR_ERR(bochs).

Best regards
Thomas

>>         ret = pcim_enable_device(pdev);
>>       if (ret)
>> @@ -630,7 +628,7 @@ static int bochs_pci_probe(struct pci_dev *pdev, 
>> const struct pci_device_id *ent
>>         pci_set_drvdata(pdev, dev);
>>   -    ret = bochs_load(dev);
>> +    ret = bochs_load(bochs);
>>       if (ret)
>>           goto err_free_dev;
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

