Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 306C390532C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 15:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF8110E851;
	Wed, 12 Jun 2024 13:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="SROAlC1T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cRVAmEl1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GGh8lvue";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cz+b4DGr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E2810E851
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 13:03:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EE2B91FB99;
 Wed, 12 Jun 2024 13:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718197422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5uhrNVuEo/BCXhkbW9P9vkmF4+5JRKqB+xMwcvdddys=;
 b=SROAlC1T/ong55DgQM+s5kjU2TM81bJTOWBURxKknfhIDKS/Ymf+O/25/mUNHQkr9dA9eU
 hhLT4qernNVwGXtWxyxzUZ/RvjQC/GI1rfr3BCJdI4RS+KGVAaM/CARPw0LUV3/jshceMn
 J/yGvnV7Acp1sgUHKlcFgR0CeMdF30g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718197422;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5uhrNVuEo/BCXhkbW9P9vkmF4+5JRKqB+xMwcvdddys=;
 b=cRVAmEl1gd8gT4zLq6Iyg9aR82oAa9SOvjjD3nEQCegtf5ZeO9Tzl7yjuPED069VL4zhEr
 S4Ert79VjRYJvtDQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GGh8lvue;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cz+b4DGr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718197421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5uhrNVuEo/BCXhkbW9P9vkmF4+5JRKqB+xMwcvdddys=;
 b=GGh8lvueWVJUShFG9rZbtnpjdGse7ot6PS/lm9bXRm2wZKIuC6nRXtFntQQDbgsO7ybT1J
 HFQOhdONa0HQLM8pJppjSaMg5Pysgf4ROrY8GkJKhLdMIAluqvvdkbn7SLATuJ621VCi4E
 yli5S0MzQ5zzN5q3WMiZkUnBpQ6miOU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718197421;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5uhrNVuEo/BCXhkbW9P9vkmF4+5JRKqB+xMwcvdddys=;
 b=cz+b4DGr3v3NrcPWs70L/65cgwjo10rMRoxW/kg+n9SVRomKGXZy8ImxwKqOwWb++BwMV/
 T5DGF1hEArjPisAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B407E132FF;
 Wed, 12 Jun 2024 13:03:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id hLSkKq2caWaQMQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 12 Jun 2024 13:03:41 +0000
Message-ID: <605bf442-41f9-49d9-a4b7-e889ff800734@suse.de>
Date: Wed, 12 Jun 2024 15:03:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/fbdev-dma: fix getting smem_start
To: Peng Fan <peng.fan@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240604080328.4024838-1-peng.fan@oss.nxp.com>
 <8f4a6d80-dd3e-422f-88af-d26f50c973ff@suse.de>
 <AM6PR04MB59415B3F01D02024A255BFB988C72@AM6PR04MB5941.eurprd04.prod.outlook.com>
 <766908de-922c-4d71-bb04-29dbe4d1d64d@suse.de>
 <AM6PR04MB5941216A69AE325A79689C5888C72@AM6PR04MB5941.eurprd04.prod.outlook.com>
 <6c01bee4-c3f5-496e-8b4f-a29c97954808@suse.de>
 <ZmlgQV4Eov0xv5bc@phenom.ffwll.local>
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
In-Reply-To: <ZmlgQV4Eov0xv5bc@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: EE2B91FB99
X-Spam-Score: -6.50
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-6.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.998]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; MX_GOOD(-0.01)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_DN_SOME(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_DN_EQ_ADDR_SOME(0.00)[];
 FREEMAIL_TO(0.00)[nxp.com,oss.nxp.com,linux.intel.com,kernel.org,gmail.com,redhat.com,lists.freedesktop.org,vger.kernel.org];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
 RCPT_COUNT_SEVEN(0.00)[8]; MID_RHS_MATCH_FROM(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from]
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

Am 12.06.24 um 10:45 schrieb Daniel Vetter:
> On Tue, Jun 11, 2024 at 11:29:58AM +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 11.06.24 um 10:23 schrieb Peng Fan:
>>>> Subject: Re: [PATCH] drm/fbdev-dma: fix getting smem_start
>>>>
>>>> Hi
>>>>
>>>> Am 11.06.24 um 03:00 schrieb Peng Fan:
>>>>>> Subject: Re: [PATCH] drm/fbdev-dma: fix getting smem_start
>>>>>>
>>>>>> Hi
>>>>>>
>>>>>> Am 04.06.24 um 10:03 schrieb Peng Fan (OSS):
>>>>>>> From: Peng Fan <peng.fan@nxp.com>
>>>>>>>
>>>>>>> If 'info->screen_buffer' locates in vmalloc address space,
>>>>>>> virt_to_page will not be able to get correct results. With
>>>>>>> CONFIG_DEBUG_VM and CONFIG_DEBUG_VIRTUAL enabled on ARM64,
>>>>>> there is dump below:
>>>>>>
>>>>>> Which graphics driver triggers this bug?
>>>>> It is NXP i.MX95 DPU driver which is still in NXP downstream repo.
>>>> Which DRM memory manager does that driver use?
>>> DRM_GEM_DMA_DRIVER_OPS
>> So fbdev-dma would be correct. But with the gem-dma allocator, wouldn't you
>> allocate from one of these dma_alloc_() calls at [1] ? How does the drivers
>> end up with vmalloc'd fbdev memory? Specifically in the light of the docs at
>> [2].
> I think when you have an iommu dma_alloc just allocates pages, and uses
> the iommu to make it all contiguous for the device, and vmalloc for the
> kernel. So it's not allocated with vmalloc(), just ends up getting mapped
> into the vmalloc range.

Thanks, that makes sense. As I mentioned in another reply, it might make 
sense to protect smem_start with an opt-in flag for only that single 
driver that needs it.

Best regards
Thomas

> -Sima
>
>
>> [1] https://elixir.bootlin.com/linux/v6.9/source/drivers/gpu/drm/drm_gem_dma_helper.c#L146
>> [2] https://elixir.bootlin.com/linux/v6.9/source/Documentation/core-api/dma-api-howto.rst#L124
>>
>> Best regards
>> Thomas
>>
>>>> I'm asking because if the driver allocates BOs via vmalloc(), should it really
>>>> use fbdev-dma?
>>> We use it for fbdev emulation. If drm_kms_helper.fbdev_emulation is 0,
>>> fbdev emulation could be disabled.
>>>
>>> Thanks
>>> Peng
>>>> Best regards
>>>> Thomas
>>>>
>>>>> Thanks,
>>>>> Peng.
>>>> --
>>>> --
>>>> Thomas Zimmermann
>>>> Graphics Driver Developer
>>>> SUSE Software Solutions Germany GmbH
>>>> Frankenstrasse 146, 90461 Nuernberg, Germany
>>>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman HRB
>>>> 36809 (AG Nuernberg)
>> -- 
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Frankenstrasse 146, 90461 Nuernberg, Germany
>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>> HRB 36809 (AG Nuernberg)
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

