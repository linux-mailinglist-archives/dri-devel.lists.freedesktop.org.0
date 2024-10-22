Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D401A9AB183
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 16:55:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2997210E0AD;
	Tue, 22 Oct 2024 14:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="1jZIwdqe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="40KbkGCa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1jZIwdqe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="40KbkGCa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4418610E1F4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 14:55:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5D61721D91;
 Tue, 22 Oct 2024 14:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1729608914; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LPlEaR4UZq1xUMQ4ycxKIr0onZ10MdoIayeHoNHWUdE=;
 b=1jZIwdqena8Vz1ZONOrl/JED47eApjqq5rWWvVKwVSUeMLrjBBfyAYt2Bjo4fGN3jTztyw
 jmGNCsOtwYCZbXzCYz7kPnL4yqwwi6FOaGjfx2WEIWVZXVtgliAUlVoh/65me8bd6Bn99n
 VPJASBvtYLxlHU+JHmbwNRKgrC4Pn9E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1729608914;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LPlEaR4UZq1xUMQ4ycxKIr0onZ10MdoIayeHoNHWUdE=;
 b=40KbkGCaaZB3PZqF3PZ+o5p1KBKW62Jivr/8UcSbMfXy923iSwmZXj/CXWxYZKOCggSGow
 dbRDbokN9/lIWJBA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1jZIwdqe;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=40KbkGCa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1729608914; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LPlEaR4UZq1xUMQ4ycxKIr0onZ10MdoIayeHoNHWUdE=;
 b=1jZIwdqena8Vz1ZONOrl/JED47eApjqq5rWWvVKwVSUeMLrjBBfyAYt2Bjo4fGN3jTztyw
 jmGNCsOtwYCZbXzCYz7kPnL4yqwwi6FOaGjfx2WEIWVZXVtgliAUlVoh/65me8bd6Bn99n
 VPJASBvtYLxlHU+JHmbwNRKgrC4Pn9E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1729608914;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LPlEaR4UZq1xUMQ4ycxKIr0onZ10MdoIayeHoNHWUdE=;
 b=40KbkGCaaZB3PZqF3PZ+o5p1KBKW62Jivr/8UcSbMfXy923iSwmZXj/CXWxYZKOCggSGow
 dbRDbokN9/lIWJBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 274DE13894;
 Tue, 22 Oct 2024 14:55:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cXxnCNK8F2d5ewAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 22 Oct 2024 14:55:14 +0000
Message-ID: <279c7b9b-9973-4eab-8321-a3bc23c97550@suse.de>
Date: Tue, 22 Oct 2024 16:55:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 42/43] drm/fbdev-generic: Convert to fbdev-ttm
To: Jon Hunter <jonathanh@nvidia.com>, daniel@ffwll.ch, airlied@gmail.com,
 deller@gmx.de, javierm@redhat.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20240312154834.26178-1-tzimmermann@suse.de>
 <20240312154834.26178-43-tzimmermann@suse.de>
 <1094c262-9d39-4a7b-bede-dc927cd1f52a@nvidia.com>
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
In-Reply-To: <1094c262-9d39-4a7b-bede-dc927cd1f52a@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5D61721D91
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[nvidia.com,ffwll.ch,gmail.com,gmx.de,redhat.com];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCPT_COUNT_SEVEN(0.00)[8]; MID_RHS_MATCH_FROM(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_EQ_ADDR_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
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

Am 22.10.24 um 15:31 schrieb Jon Hunter:
> Hi Thomas,
>
> On 12/03/2024 15:45, Thomas Zimmermann wrote:
>> Only TTM-based drivers use fbdev-generic. Rename it to fbdev-ttm and
>> change the symbol infix from _generic_ to _ttm_. Link the source file
>> into TTM helpers, so that it is only build if TTM-based drivers have
>> been selected. Select DRM_TTM_HELPER for loongson.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   Documentation/gpu/drm-kms-helpers.rst         |  2 +-
>>   drivers/gpu/drm/Makefile                      |  5 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  6 +-
>>   .../{drm_fbdev_generic.c => drm_fbdev_ttm.c}  | 80 +++++++++----------
>>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  4 +-
>>   drivers/gpu/drm/loongson/Kconfig              |  1 +
>>   drivers/gpu/drm/loongson/lsdc_drv.c           |  4 +-
>>   drivers/gpu/drm/nouveau/nouveau_drm.c         |  6 +-
>>   drivers/gpu/drm/qxl/qxl_drv.c                 |  4 +-
>>   drivers/gpu/drm/tiny/bochs.c                  |  4 +-
>>   drivers/gpu/drm/vboxvideo/vbox_drv.c          |  4 +-
>>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  4 +-
>>   include/drm/drm_fbdev_generic.h               | 15 ----
>>   include/drm/drm_fbdev_ttm.h                   | 15 ++++
>>   14 files changed, 77 insertions(+), 77 deletions(-)
>>   rename drivers/gpu/drm/{drm_fbdev_generic.c => drm_fbdev_ttm.c} (76%)
>>   delete mode 100644 include/drm/drm_fbdev_generic.h
>>   create mode 100644 include/drm/drm_fbdev_ttm.h
>
> ...
>
>> diff --git a/include/drm/drm_fbdev_ttm.h b/include/drm/drm_fbdev_ttm.h
>> new file mode 100644
>> index 0000000000000..9e6c3bdf35376
>> --- /dev/null
>> +++ b/include/drm/drm_fbdev_ttm.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: MIT */
>> +
>> +#ifndef DRM_FBDEV_TTM_H
>> +#define DRM_FBDEV_TTM_H
>> +
>> +struct drm_device;
>> +
>> +#ifdef CONFIG_DRM_FBDEV_EMULATION
>> +void drm_fbdev_ttm_setup(struct drm_device *dev, unsigned int 
>> preferred_bpp);
>> +#else
>> +static inline void drm_fbdev_ttm_setup(struct drm_device *dev, 
>> unsigned int preferred_bpp)
>> +{ }
>> +#endif
>> +
>> +#endif
>
>
> I recently noticed that with Linux v6.11 it is possible to enable
> CONFIG_DRM_FBDEV_EMULATION without enabling CONFIG_DRM_TTM_HELPER. Now
> while this does not currently cause any build issues, I believe that if
> the function drm_fbdev_ttm_setup() is ever used somewhere that does not
> explicitly select CONFIG_DRM_TTM_HELPER, then you could get a 'ERROR:
> modpost: "drm_fbdev_ttm_setup"'.
>
> So I was thinking that may be this should be ...
>
> diff --git a/include/drm/drm_fbdev_ttm.h b/include/drm/drm_fbdev_ttm.h
> index 9e6c3bdf3537..5b6723a37caa 100644
> --- a/include/drm/drm_fbdev_ttm.h
> +++ b/include/drm/drm_fbdev_ttm.h
> @@ -5,7 +5,7 @@
>
>  struct drm_device;
>
> -#ifdef CONFIG_DRM_FBDEV_EMULATION
> +#if defined(CONFIG_DRM_FBDEV_EMULATION) && 
> defined(CONFIG_DRM_TTM_HELPER)
>  void drm_fbdev_ttm_setup(struct drm_device *dev, unsigned int 
> preferred_bpp);
>  #else
>  static inline void drm_fbdev_ttm_setup(struct drm_device *dev, 
> unsigned int preferred_bpp)
>
>
> The above function has been removed now in -next, but I believe we could
> have the same problem with drm_fbdev_ttm_helper_fb_probe()?

We'd turn a linker/modpost error into a compiler error. Likely makes no 
difference. And AFAICT every driver that selects TTM also selects 
TTM_HELPER. Drivers without TTM should not use this header.

(DRM_TTM and DRM_TTM_HELPER are separate config options for historical 
reasons. Maybe one of them could go away.)

Best regards
Thomas

>
> Cheers
> Jon
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

