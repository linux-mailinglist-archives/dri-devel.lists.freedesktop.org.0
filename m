Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 014F8C0D8FD
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:35:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FAA10E46E;
	Mon, 27 Oct 2025 12:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="UnVzCyFu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wgRX50jh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UnVzCyFu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wgRX50jh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC4810E478
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 12:35:33 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7E40A1F45F;
 Mon, 27 Oct 2025 12:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761568532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=L8YKDcVbLcdtv9vkqeCvVb34FYIxMDyVf28aoaptO9U=;
 b=UnVzCyFu/9tV4cUYX7ePfRXZI8Vpt0si19CyG2sTGr/pkQ41Y+3y08L3xZtAlosgqX0ciA
 vIngZt/V0Zph2iGsGKAJikZ2KkwCtyYRNuAWAq5Yzh+V+dR+byEfOz4tA+ExIIz6jsTrJk
 ro9Qk9TfzDdpZArEypcvYM42q17jRKc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761568532;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=L8YKDcVbLcdtv9vkqeCvVb34FYIxMDyVf28aoaptO9U=;
 b=wgRX50jhSX/rXiTHvBOLccLYqxxWZ9/R9trmhcsIXjY2o4ixmi5nsO2W7w2+6g6LalyJY/
 OkWsXKq9DY6XeNBQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UnVzCyFu;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wgRX50jh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761568532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=L8YKDcVbLcdtv9vkqeCvVb34FYIxMDyVf28aoaptO9U=;
 b=UnVzCyFu/9tV4cUYX7ePfRXZI8Vpt0si19CyG2sTGr/pkQ41Y+3y08L3xZtAlosgqX0ciA
 vIngZt/V0Zph2iGsGKAJikZ2KkwCtyYRNuAWAq5Yzh+V+dR+byEfOz4tA+ExIIz6jsTrJk
 ro9Qk9TfzDdpZArEypcvYM42q17jRKc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761568532;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=L8YKDcVbLcdtv9vkqeCvVb34FYIxMDyVf28aoaptO9U=;
 b=wgRX50jhSX/rXiTHvBOLccLYqxxWZ9/R9trmhcsIXjY2o4ixmi5nsO2W7w2+6g6LalyJY/
 OkWsXKq9DY6XeNBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1E70513693;
 Mon, 27 Oct 2025 12:35:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 9sH9BRRn/2hTGwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Oct 2025 12:35:32 +0000
Message-ID: <3edea192-6a3f-44f5-b570-7033776e2ce4@suse.de>
Date: Mon, 27 Oct 2025 13:35:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/3] Add splash DRM client
To: Maxime Ripard <mripard@kernel.org>, Francesco Valla <francesco@valla.it>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-embedded@vger.kernel.org
References: <20251027-drm_client_splash-v1-0-00698933b34a@valla.it>
 <yq4btdc5qqukuqps7y53dratmu64ghyifgprlndnk5rbgml4of@rvca75sncvsm>
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
In-Reply-To: <yq4btdc5qqukuqps7y53dratmu64ghyifgprlndnk5rbgml4of@rvca75sncvsm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 7E40A1F45F
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCPT_COUNT_TWELVE(0.00)[13]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,ffwll.ch,lwn.net,redhat.com,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
 RCVD_TLS_ALL(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MID_RHS_MATCH_FROM(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url, imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, suse.de:dkim, suse.de:mid]
X-Spam-Score: -4.51
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

Hi Francenso, Maxime,

Am 27.10.25 um 11:09 schrieb Maxime Ripard:
> Hi,
>
> On Mon, Oct 27, 2025 at 12:03:00AM +0100, Francesco Valla wrote:
>> this patchset adds a new DRM client offering splash functionalities,
>> able to draw to screen:
>>
>>    - a colored background;
> So, I like that part, and we were recently discussing about this.

The panic screen has configurable foreground/background colors. Maybe we 
can harmonize these settings.

>
>>    - a single-line text message, which can be set through sysfs or
>>      directly from the kernel command line;

Put it into the kernel config.

>>    - a very simple progress bar, which can be driven through sysfs;

Once you have options to control these settings from user space, you 
should do it in user space entirely. As Maxime suggested, please improve 
plymouth for anything with animation.

>>    - a static image (optional).

Board vendors often provide an image, see /sys/firmware/acpi/bgrt/. This 
is a candidate for display, or the penguin or a custom image. Please 
make it configurable by Kconfig. Again, if you need policy and 
heuristics for deciding what to display, you better do this in user space.

> But there's no reason to have all that in the kernel, and we already
> have userspace components to do so (plymouth being the main "mainstream"
> one).
>
>> Once compiled inside the kernel, the client can be enabled through the
>> command line specifying the drm_client_lib.active=splash parameter.
>>
>> == Motivation ==
>>
>> The motivation behind this work is to offer to embedded system
>> developers a new path for a simple activation of the display(s)
>> connected to their system, with the following usecases:
>>
>>    - bootsplash - possibly displaying even before init;
>>    - early activation of the display pipeline, in particular whenever one
>>      component of the pipeline (e.g.: a panel) takes a non-negligible
>>      time to initialize;
>>    - recovery systems, where the splash client can offer a simple feedback
>>      for unattended recovery tasks;
>>    - update systems, where the splash client can offer a simple feedback
>>      for unattended update tasks.
> If plymouth cannot be used by embedded systems for some reason, then you
> should work on a plymouth alternative.

Agreed. With an updater running in user space, that process should also 
manage the display update. No need for this in the kernel.

>
>> While the first seems the most obvious one, it was the second that acted
>> as the driver, as in the past I had to implement a ugly workaround using
>> a systemd generator to kickstart the initialization of a display and
>> shave ~400ms of boot time.
>>
>> The last 2 usecase, instead, are the reason I dropped the "boot" part
>> from bootsplash.
>>
>> == Implementation details ==
>>
>> The design is quite simple, with a kernel thread doing the heavylifting
>> for the rendering part and some locking to protect interactions with it.
>>
>> The splash image is loaded using the firmware framework, with the client
>> expecting to find a binary dump having the right dimensions (width and
>> height) and FOURCC format for each modeset. Given a 1920x1080 RGB888
>> modeset, the client will for example search for a firmware named:
>>
>>     drm_splash_1920x1080_RG24.raw
>>
>> If the firmware cannot be loaded directly, the NOUEVENT sysfs fallback
>> mechanism is used to let userspace load the appropriate image.
>>
>> == Testing ==
>>
>> Testing was done on qemu (both with vkms and bochs drivers), on a HDMI
>> display connected to a Beagleplay and on a ILI9341 SPI display connected
>> to a i.MX93 FRDM board. All these platforms revealed different
>> weaknesses that were hopefully removed.
>>
>> == Open points / issues ==
>>
>> The reason for this being an RFC is that there are several open points:
>>
>>    - Support for tiled connectors should be there, but has not been
>>      tested. Any idea on how to test it?
> Did you mean tiled formats?
>
>>    - I'm not entirely convinced that using the firmware framework to load
>>      the images is the right path. The idea behind it was to re-use the
>>      compressed firmware support, but then I discovered it is not there
>>      for built-in firmware.
> Yeah, firmware loading for this has a few issues (being tedious to setup
> for when built-in being one). I think just going the fbdev penguin road
> is a better choice: you provide the path, and it's embedded in the
> kernel directly.
>
>>    - Again on the firmware loading: CONFIG_LOADPIN would interfere with
>>      sysfs loading.
>>    - And again: FW_ACTION_NOUEVENT only has one user inside the kernel,
>>      leading me to think it is de-facto deprecated. And still, uevents
>>      for firmware loading seem frowned upon these days...
>>    - Generating binary dumps for... basically any format is not so
>>      straightforward. I crafted a Python tool with AI help which seems
>>      to work quite well, but I honestly did not yet understood which is
>>      the policy for AI-generated code inside the kernel, so it is not
>>      included in this patch set. All client code is genuine, though.
> BMP is simple enough to support so we should probably use that instead
> of a custom format.

file /sys/firmware/acpi/bgrt/image
/sys/firmware/acpi/bgrt/image: PC bitmap, Windows 3.x format, 768 x 256 
x 24, image size 589824, cbSize 589878, bits offset 54

That should probably be the format for now unless your firmware uses 
something else natively. Code for reading a BMP file can be found in the 
efifb driver. [1]

[1] 
https://elixir.bootlin.com/linux/v6.17.5/source/drivers/video/fbdev/efifb.c#L24

Apart from the criticism for complexity, I do like the idea of having a 
splash screen.

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


