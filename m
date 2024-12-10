Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFFF9EB543
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 16:42:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CEF610E28F;
	Tue, 10 Dec 2024 15:42:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="KVtiJ7hG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dowVL3fY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZibNBPCW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YexXGOs0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5289B10E28F
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 15:42:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E54111F390;
 Tue, 10 Dec 2024 15:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1733845370; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9glmd4oYc5v1M9AibNUTOXtbQP0sX2MWRHrygkBRQ1M=;
 b=KVtiJ7hGpyd4aE9Tmd6guIjuPeZyKG2MvuLjEjC9BEv/RyngQn4WffmSdbCOCZkCOLKHym
 VJ2zK1mgr4va3etA2wbq4p8QCazZejLZ9K/e/OWTw9eKvBdQPeDGQcQZuYCfmc1M4aIR9S
 aN6quRqh8n69xYAyAk0ggFFauuLnB40=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1733845370;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9glmd4oYc5v1M9AibNUTOXtbQP0sX2MWRHrygkBRQ1M=;
 b=dowVL3fYi7nk0Y2gZBB30jA82c4zuo2n3x0eaB4vzvDqb2ZTWJxcha06Kk6KK9QLv/109J
 XIU53XEx/xIzFFDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1733845368; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9glmd4oYc5v1M9AibNUTOXtbQP0sX2MWRHrygkBRQ1M=;
 b=ZibNBPCWGMVjSXoW6JFyQKt7xnRK4tNBgiwPqAvW0qeBonNj/SUUWrQfcIiNj53M/EVe9U
 TP9U+OgEj9OBHmfZ3AmgkRJbdZuPl/oa+UvZiKzE2nSfagD8n25HANtDtw7oe6n39jg0Yv
 juqsaeUmXz+QoQykvaJ6NJlZQzYPgLQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1733845368;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9glmd4oYc5v1M9AibNUTOXtbQP0sX2MWRHrygkBRQ1M=;
 b=YexXGOs0Zgu2+Vafshv6IwmDjdrNWZYASNticOqNOHndzEL6nLOyMAze3sBvLR/eRwBQzD
 OkSQWn8AKUdS8SCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A744B138D2;
 Tue, 10 Dec 2024 15:42:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wByYJ3hhWGcOLQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 10 Dec 2024 15:42:48 +0000
Message-ID: <37740461-709f-47a0-ba00-161015605f21@suse.de>
Date: Tue, 10 Dec 2024 16:42:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] fbdev: Fix recursive dependencies wrt
 BACKLIGHT_CLASS_DEVICE
To: Arnd Bergmann <arnd@arndb.de>,
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>,
 Simona Vetter <simona@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
References: <20241210142329.660801-1-tzimmermann@suse.de>
 <20241210142329.660801-2-tzimmermann@suse.de>
 <ba44a87e-1587-42ee-9da4-ae96e4a26c1c@app.fastmail.com>
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
In-Reply-To: <ba44a87e-1587-42ee-9da4-ae96e4a26c1c@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -8.30
X-Spamd-Result: default: False [-8.30 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCPT_COUNT_SEVEN(0.00)[9];
 FREEMAIL_TO(0.00)[arndb.de,redhat.com,gmx.de,ffwll.ch,gmail.com];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, suse.de:email,
 imap1.dmz-prg2.suse.org:helo]
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


Am 10.12.24 um 15:30 schrieb Arnd Bergmann:
> On Tue, Dec 10, 2024, at 15:09, Thomas Zimmermann wrote:
>> Do not select BACKLIGHT_CLASS_DEVICE from FB_BACKLIGHT. The latter
>> only controls backlight support within fbdev core code and data
>> structures.
>>
>> Make fbdev drivers depend on BACKLIGHT_CLASS_DEVICE and let users
>> select it explicitly. Fixes warnings about recursive dependencies,
>> such as
>>
>> error: recursive dependency detected!
>> 	symbol BACKLIGHT_CLASS_DEVICE is selected by FB_BACKLIGHT
>> 	symbol FB_BACKLIGHT is selected by FB_SH_MOBILE_LCDC
>> 	symbol FB_SH_MOBILE_LCDC depends on FB_DEVICE
>> 	symbol FB_DEVICE depends on FB_CORE
>> 	symbol FB_CORE is selected by DRM_GEM_DMA_HELPER
>> 	symbol DRM_GEM_DMA_HELPER is selected by DRM_PANEL_ILITEK_ILI9341
>> 	symbol DRM_PANEL_ILITEK_ILI9341 depends on BACKLIGHT_CLASS_DEVICE
>>
>> BACKLIGHT_CLASS_DEVICE is user-selectable, so making drivers adapt to
>> it is the correct approach in any case. For most drivers, backlight
>> support is also configurable separately.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Thanks for revisiting this!
>
> My patch that failed to work correctly happened to work on my
> randconfig tree because I still have an old variant of this
> change, see
>
> https://lore.kernel.org/linux-fbdev/20200417155553.675905-8-arnd@arndb.de/
>
> This is almost the same as your version, except for the
> optional fbdev Kconfig bits
> PERS
>> @@ -660,7 +661,6 @@ config FB_ATMEL
>>   config FB_NVIDIA
>>   	tristate "nVidia Framebuffer Support"
>>   	depends on FB && PCI
>> -	select FB_BACKLIGHT if FB_NVIDIA_BACKLIGHT
>>   	select FB_CFB_FILLRECT
>>   	select FB_CFB_COPYAREA
>>   	select FB_CFB_IMAGEBLIT
>> @@ -700,6 +700,8 @@ config FB_NVIDIA_DEBUG
>>   config FB_NVIDIA_BACKLIGHT
>>   	bool "Support for backlight control"
>>   	depends on FB_NVIDIA
>> +	depends on BACKLIGHT_CLASS_DEVICE
>> +	select FB_BACKLIGHT
>>   	default y
>>   	help
>>   	  Say Y here if you want to control the backlight of your display.
> For instance here I used
>
> @@ -702,6 +703,7 @@ config FB_NVIDIA_DEBUG
>   config FB_NVIDIA_BACKLIGHT
>          bool "Support for backlight control"
>          depends on FB_NVIDIA
> +       depends on BACKLIGHT_CLASS_DEVICE=y || BACKLIGHT_CLASS_DEVICE=FB_NVIDIA
>          default y
>          help
>            Say Y here if you want to control the backlight of your display.
>
> while your patch causes a link failure with
>
> CONFIG_FB_NVIDIA=y
> CONFIG_FB_NVIDIA_BACKLIGHT=y
> CONFIG_BACKLIGHT_CLASS_DEVICE=m

Ah, right. I'll update the series to use your approach.

Best regards
Thomas

>
>         Arnd

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

