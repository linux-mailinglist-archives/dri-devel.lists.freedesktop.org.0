Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DA09FA692
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2024 17:09:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA8210E1B3;
	Sun, 22 Dec 2024 16:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="uHR/jWv1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="05ZIY7zO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uHR/jWv1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="05ZIY7zO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6C410E1B3
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 16:09:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A3A0A2275F;
 Sun, 22 Dec 2024 16:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734883770; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0w5JYCkTk86bENgGzZBm6XTwqRNCnF6qczMkE+jarRE=;
 b=uHR/jWv1lAeLcdAsWQ4bMyYkiENa9S8CNr+mTwh9wcYd2/b5crxv63izOLtyuY4K3QdnXD
 FzYTMeOoxpDnpfDT6hZbCKuJPsd/4z55LUkYxJl5a5S/+zlc7BPbdud4WXvL1vZ/e79AYf
 woWJNpswPl2GkJiw7aQmp+7pAFE+T+I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734883770;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0w5JYCkTk86bENgGzZBm6XTwqRNCnF6qczMkE+jarRE=;
 b=05ZIY7zOsbIK74NavmQWUsZm6QBvJljqd6qj5zKlTIYDbqxUuP2RR/L9AaTGNc0dx2i13p
 GsO+zoVxY0ifRDBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734883770; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0w5JYCkTk86bENgGzZBm6XTwqRNCnF6qczMkE+jarRE=;
 b=uHR/jWv1lAeLcdAsWQ4bMyYkiENa9S8CNr+mTwh9wcYd2/b5crxv63izOLtyuY4K3QdnXD
 FzYTMeOoxpDnpfDT6hZbCKuJPsd/4z55LUkYxJl5a5S/+zlc7BPbdud4WXvL1vZ/e79AYf
 woWJNpswPl2GkJiw7aQmp+7pAFE+T+I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734883770;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0w5JYCkTk86bENgGzZBm6XTwqRNCnF6qczMkE+jarRE=;
 b=05ZIY7zOsbIK74NavmQWUsZm6QBvJljqd6qj5zKlTIYDbqxUuP2RR/L9AaTGNc0dx2i13p
 GsO+zoVxY0ifRDBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 474A7139D3;
 Sun, 22 Dec 2024 16:09:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id q61LD7o5aGfoBQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Sun, 22 Dec 2024 16:09:30 +0000
Message-ID: <4e1a06aa-3b00-45b5-a5e3-bb802e774c88@suse.de>
Date: Sun, 22 Dec 2024 17:09:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] fbdev: Fix recursive dependencies wrt
 BACKLIGHT_CLASS_DEVICE
To: Helge Deller <deller@gmx.de>, javierm@redhat.com, arnd@arndb.de,
 jani.nikula@linux.intel.com, christophe.leroy@csgroup.eu, simona@ffwll.ch,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
References: <20241216074450.8590-1-tzimmermann@suse.de>
 <20241216074450.8590-2-tzimmermann@suse.de>
 <6ed9693e-e8f5-4786-b440-4e27c6d31da3@gmx.de>
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
In-Reply-To: <6ed9693e-e8f5-4786-b440-4e27c6d31da3@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -8.30
X-Spamd-Result: default: False [-8.30 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.997]; MIME_GOOD(-0.10)[text/plain];
 RCPT_COUNT_SEVEN(0.00)[11];
 FREEMAIL_TO(0.00)[gmx.de,redhat.com,arndb.de,linux.intel.com,csgroup.eu,ffwll.ch,gmail.com];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
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


Am 22.12.24 um 07:31 schrieb Helge Deller:
> On 12/16/24 08:42, Thomas Zimmermann wrote:
>> Do not select BACKLIGHT_CLASS_DEVICE from FB_BACKLIGHT. The latter
>> only controls backlight support within fbdev core code and data
>> structures.
>>
>> Make fbdev drivers depend on BACKLIGHT_CLASS_DEVICE and let users
>> select it explicitly. Fixes warnings about recursive dependencies,
>> such as
>>
>> error: recursive dependency detected!
>>     symbol BACKLIGHT_CLASS_DEVICE is selected by FB_BACKLIGHT
>>     symbol FB_BACKLIGHT is selected by FB_SH_MOBILE_LCDC
>>     symbol FB_SH_MOBILE_LCDC depends on FB_DEVICE
>>     symbol FB_DEVICE depends on FB_CORE
>>     symbol FB_CORE is selected by DRM_GEM_DMA_HELPER
>>     symbol DRM_GEM_DMA_HELPER is selected by DRM_PANEL_ILITEK_ILI9341
>>     symbol DRM_PANEL_ILITEK_ILI9341 depends on BACKLIGHT_CLASS_DEVICE
>>
>> BACKLIGHT_CLASS_DEVICE is user-selectable, so making drivers adapt to
>> it is the correct approach in any case. For most drivers, backlight
>> support is also configurable separately.
>>
>> v3:
>> - Select BACKLIGHT_CLASS_DEVICE in PowerMac defconfigs (Christophe)
>> - Fix PMAC_BACKLIGHT module dependency corner cases (Christophe)
>> v2:
>> - s/BACKLIGHT_DEVICE_CLASS/BACKLIGHT_CLASS_DEVICE (Helge)
>> - Fix fbdev driver-dependency corner case (Arnd)
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   arch/powerpc/configs/pmac32_defconfig |  1 +
>>   arch/powerpc/configs/ppc6xx_defconfig |  1 +
>>   drivers/auxdisplay/Kconfig            |  2 +-
>>   drivers/macintosh/Kconfig             |  1 +
>>   drivers/staging/fbtft/Kconfig         |  1 +
>>   drivers/video/fbdev/Kconfig           | 18 +++++++++++++-----
>>   drivers/video/fbdev/core/Kconfig      |  3 +--
>>   7 files changed, 19 insertions(+), 8 deletions(-)
>>
>> ...
>> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
>> index de035071fedb..55c6686f091e 100644
>> --- a/drivers/video/fbdev/Kconfig
>> +++ b/drivers/video/fbdev/Kconfig
>> @@ -649,6 +649,7 @@ config FB_S1D13XXX
>>   config FB_ATMEL
>>       tristate "AT91 LCD Controller support"
>>       depends on FB && OF && HAVE_CLK && HAS_IOMEM
>> +    depends on BACKLIGHT_CLASS_DEVICE
>>       depends on HAVE_FB_ATMEL || COMPILE_TEST
>>       select FB_BACKLIGHT
>>       select FB_IOMEM_HELPERS
>> @@ -660,7 +661,6 @@ config FB_ATMEL
>>   config FB_NVIDIA
>>       tristate "nVidia Framebuffer Support"
>>       depends on FB && PCI
>> -    select FB_BACKLIGHT if FB_NVIDIA_BACKLIGHT
>>       select FB_CFB_FILLRECT
>>       select FB_CFB_COPYAREA
>>       select FB_CFB_IMAGEBLIT
>> @@ -700,6 +700,8 @@ config FB_NVIDIA_DEBUG
>>   config FB_NVIDIA_BACKLIGHT
>>       bool "Support for backlight control"
>>       depends on FB_NVIDIA
>> +    depends on BACKLIGHT_CLASS_DEVICE=y || 
>> BACKLIGHT_CLASS_DEVICE=FB_NVIDIA
>
> Seems wrong. BACKLIGHT_CLASS_DEVICE is of type tristate.
> There are more of those, please check.

It's exactly correct. Linking would fail with FB_NVIDIA=y and 
BACKLIGHT=m. The above construct avoids this case. Please see Arnd's 
review comment at [1].

That's also why I mentioned that 'imply' could be used rather than 
'depends on'. It would handle this situation automatically.

Best regards
Thomas

[1] https://patchwork.freedesktop.org/patch/628099/?series=142356&rev=1


>
> Helge

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

