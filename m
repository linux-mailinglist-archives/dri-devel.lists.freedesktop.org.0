Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C644E9F0571
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 08:26:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 476A610E113;
	Fri, 13 Dec 2024 07:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Os9ePr4o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WnFZIV8E";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Os9ePr4o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WnFZIV8E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA3710E113
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 07:26:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7C8E52116C;
 Fri, 13 Dec 2024 07:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734074780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0hZK7LmqioQzS/yZ2Yu6wiWtAV1imB4AD4cwUr6OgK4=;
 b=Os9ePr4oMfNr83SheK67Ha2lFIidz791Bt3A9sxe5DVDQtJlbv5Zcl8beakHLqUymEIk1V
 ll03BLmcrFZBUxU5h4jq8/YKdEDdXhfKQ/0hvaWmXapx8c4XbQfUniLHypUJba2n99wBdR
 lgxC9XVtIXi4G0SMOs9oQXWlAssZUgA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734074780;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0hZK7LmqioQzS/yZ2Yu6wiWtAV1imB4AD4cwUr6OgK4=;
 b=WnFZIV8E/k4krnFiJ3s+hf4Ars9rdOufRdF4xuRfhhIRGDlSpATpXNdy+Cwip5tcz5eRn+
 A7gCkIF1ZMAxCwAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734074780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0hZK7LmqioQzS/yZ2Yu6wiWtAV1imB4AD4cwUr6OgK4=;
 b=Os9ePr4oMfNr83SheK67Ha2lFIidz791Bt3A9sxe5DVDQtJlbv5Zcl8beakHLqUymEIk1V
 ll03BLmcrFZBUxU5h4jq8/YKdEDdXhfKQ/0hvaWmXapx8c4XbQfUniLHypUJba2n99wBdR
 lgxC9XVtIXi4G0SMOs9oQXWlAssZUgA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734074780;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0hZK7LmqioQzS/yZ2Yu6wiWtAV1imB4AD4cwUr6OgK4=;
 b=WnFZIV8E/k4krnFiJ3s+hf4Ars9rdOufRdF4xuRfhhIRGDlSpATpXNdy+Cwip5tcz5eRn+
 A7gCkIF1ZMAxCwAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3679513927;
 Fri, 13 Dec 2024 07:26:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Ik5rC5zhW2fnDAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 13 Dec 2024 07:26:20 +0000
Message-ID: <5566a3f5-496a-4b39-a0fa-6a1a5af9a67a@suse.de>
Date: Fri, 13 Dec 2024 08:26:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] fbdev: Fix recursive dependencies wrt
 BACKLIGHT_CLASS_DEVICE
To: Helge Deller <deller@gmx.de>, Jani Nikula <jani.nikula@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Javier Martinez Canillas
 <javierm@redhat.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
References: <20241212100636.45875-1-tzimmermann@suse.de>
 <20241212100636.45875-2-tzimmermann@suse.de>
 <09edb59a-527a-4ddb-bfaf-ea74fb5a3023@gmx.de>
 <88ce6863-4458-47cb-9b28-274c91bd8764@app.fastmail.com>
 <87frmstrhd.fsf@intel.com> <2701e824-d330-49c0-88fa-a26658a9710c@gmx.de>
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
In-Reply-To: <2701e824-d330-49c0-88fa-a26658a9710c@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-8.30 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCPT_COUNT_SEVEN(0.00)[10];
 FREEMAIL_TO(0.00)[gmx.de,linux.intel.com,arndb.de,redhat.com,ffwll.ch,gmail.com];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Score: -8.30
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


Am 13.12.24 um 00:56 schrieb Helge Deller:
> On 12/13/24 00:24, Jani Nikula wrote:
>> On Thu, 12 Dec 2024, "Arnd Bergmann" <arnd@arndb.de> wrote:
>>> On Thu, Dec 12, 2024, at 19:44, Helge Deller wrote:
>>>> On 12/12/24 11:04, Thomas Zimmermann wrote:
>>>>> Do not select BACKLIGHT_CLASS_DEVICE from FB_BACKLIGHT. The latter
>>>>> only controls backlight support within fbdev core code and data
>>>>> structures.
>>>>>
>>>>> Make fbdev drivers depend on BACKLIGHT_CLASS_DEVICE and let users
>>>>> select it explicitly. Fixes warnings about recursive dependencies,
>>>>> such as [...]
>>>>
>>>> I think in the fbdev drivers themselves you should do:
>>>>     select BACKLIGHT_CLASS_DEVICE
>>>> instead of "depending" on it.
>>>> This is the way as it's done in the DRM tiny and the i915/gma500 
>>>> DRM drivers.
>>>>
>>>> So, something like:
>>>>
>>>> --- a/drivers/staging/fbtft/Kconfig
>>>>          tristate "Support for small TFT LCD display modules"
>>>>          depends on FB && SPI
>>>>          depends on FB_DEVICE
>>>>     +    select BACKLIGHT_DEVICE_CLASS
>>>>          depends on GPIOLIB || COMPILE_TEST
>>>>          select FB_BACKLIGHT
>>>>
>>>> config FB_BACKLIGHT
>>>>             tristate
>>>>             depends on FB
>>>>     -      select BACKLIGHT_CLASS_DEVICE
>>>>     +       depends on BACKLIGHT_CLASS_DEVICE
>>>>
>>>>
>>>> Would that fix the dependency warning?
>>>
>>> The above is generally a mistake and the root cause of the
>>> dependency loops. With very few exceptions, the solution in
>>> these cases is to find the inconsistent 'select' and change
>>> it into 'depends on'.
>>
>> Agreed.
>
> That's fine, but my point is that it should be consistent.
> For example:
>
> ~:/git-kernel/linux$ grep -r "select.*BACKLIGHT_CLASS_DEVICE" 
> drivers/gpu/
> drivers/gpu/drm/tilcdc/Kconfig: select BACKLIGHT_CLASS_DEVICE
> drivers/gpu/drm/nouveau/Kconfig:        select BACKLIGHT_CLASS_DEVICE 
> if DRM_NOUVEAU_BACKLIGHT
> drivers/gpu/drm/nouveau/Kconfig:        select BACKLIGHT_CLASS_DEVICE 
> if ACPI && X86
> drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
> drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
> drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
> drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
> drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
> drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
> drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
> drivers/gpu/drm/fsl-dcu/Kconfig:        select BACKLIGHT_CLASS_DEVICE
> drivers/gpu/drm/i915/Kconfig:   select BACKLIGHT_CLASS_DEVICE if ACPI
> drivers/gpu/drm/gma500/Kconfig: select BACKLIGHT_CLASS_DEVICE if ACPI
> drivers/gpu/drm/amd/amdgpu/Kconfig:     select BACKLIGHT_CLASS_DEVICE
> drivers/gpu/drm/xe/Kconfig:     select BACKLIGHT_CLASS_DEVICE if ACPI
> drivers/gpu/drm/solomon/Kconfig:        select BACKLIGHT_CLASS_DEVICE
> drivers/gpu/drm/radeon/Kconfig: select BACKLIGHT_CLASS_DEVICE
> drivers/gpu/drm/renesas/shmobile/Kconfig:       select 
> BACKLIGHT_CLASS_DEVICE
> drivers/gpu/drm/gud/Kconfig:    select BACKLIGHT_CLASS_DEVICE
> drivers/gpu/drm/bridge/Kconfig: select BACKLIGHT_CLASS_DEVICE
>
> All major drm graphics drivers *select* BACKLIGHT_CLASS_DEVICE.
> Are you changing them to "depend on" as well?

All these drivers should be changed to either 'depends on' or maybe 'imply'.

Best regards
Thomas

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

