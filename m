Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECA1D08251
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 10:17:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 679DB10E2A4;
	Fri,  9 Jan 2026 09:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="dDIeWs3I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1Q1sK4iN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="B/0XAQmx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="td1TZn/i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E0B710E2A4
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 09:17:25 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4306F5BEE8;
 Fri,  9 Jan 2026 09:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1767950244; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=deZXh0Znw+wcx84cK9R/NNIYmgNZoUTEP/U+GusY37s=;
 b=dDIeWs3IDpTXQ2sf6hgYqJzhjLEwHli8pfhFuJVNtM/gFc5FbJkcZ8kJ/5Emdz3xClTy6t
 VhIDV69RnDHbFiX84IKZcWE8+IKWsGxoWtqtTcgRWstmbAMkQc8F0uZMW0P13z3KM86NE8
 r5X8eRsulByGQQJbis2W6sFJPmKmERc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1767950244;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=deZXh0Znw+wcx84cK9R/NNIYmgNZoUTEP/U+GusY37s=;
 b=1Q1sK4iNLOFRtg58YuTYf4iAfyUo3HRDCt3ay2dzRnC2RhXjB/hrMIXkIc2Wmcm2y6yXg/
 jpoM9iFKX7WN3jAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1767950243; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=deZXh0Znw+wcx84cK9R/NNIYmgNZoUTEP/U+GusY37s=;
 b=B/0XAQmxFHU7HhkS/2rvWuw4JJE2VLNmVKek+J3Xksczqpzdf0MZGVOxSgPdcWs8I5WndV
 vOw+88+52bZMMP1aUBNINvPKyA40ZT9wmWbvE9qVNMGZ4tyFpgX5JCUL57jLe5ge8N62jv
 kMJ88y112Eg/3pxfA/fW9hhYQ9z2nsY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1767950243;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=deZXh0Znw+wcx84cK9R/NNIYmgNZoUTEP/U+GusY37s=;
 b=td1TZn/i3V+QvQSxrbYvv4XGlESsOz6Nlg0j2x4AU9JCjKtMU5TLVdk98UZpHMr5QTRPAU
 sMNrVnOml3bCS7CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E11893EA63;
 Fri,  9 Jan 2026 09:17:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id O+a6NaLHYGmSdwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 09 Jan 2026 09:17:22 +0000
Message-ID: <9d9015fa-aba4-4dd7-a024-563f58b7f43a@suse.de>
Date: Fri, 9 Jan 2026 10:17:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] firmware: google: Do sysfb test before creating
 coreboot framebuffer
To: Julius Werner <jwerner@chromium.org>
Cc: tzungbi@kernel.org, briannorris@chromium.org, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, chrome-platform@lists.linux.dev,
 dri-devel@lists.freedesktop.org
References: <20260108145058.56943-1-tzimmermann@suse.de>
 <20260108145058.56943-2-tzimmermann@suse.de>
 <CAODwPW9_ym3E4za3yoUAs0+1sQfaKTDOau4Oh9Zm8+2uvYVgFQ@mail.gmail.com>
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
In-Reply-To: <CAODwPW9_ym3E4za3yoUAs0+1sQfaKTDOau4Oh9Zm8+2uvYVgFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_CC(0.00)[kernel.org,chromium.org,redhat.com,linux.intel.com,gmail.com,ffwll.ch,lists.linux.dev,lists.freedesktop.org];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; RCPT_COUNT_SEVEN(0.00)[10];
 MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url, suse.com:url,
 imap1.dmz-prg2.suse.org:helo, suse.de:mid, suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -4.30
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

Am 08.01.26 um 17:55 schrieb Julius Werner:
> This seems less consistent to me, although tbh I don't understand the
> Linux device and driver framework that well. I think the original idea
> here was that the coreboot bus represents the coreboot table, and each
> entry is represented as one device (regardless of whether any driver
> actually wants to do anything with that entry). That's why we're
> creating a device for all the tags even though most of them aren't
> really interesting for kernel drivers. This also helps with inspecting
> things in sysfs.

We need to distinguish between coreboot and sysfb. Only one of these 
subsystems can handle the framebuffer. Having a framebuffer device on 
the coreboot bus, if the underlying framebuffer is managed by a 
different device seems even more incorrect.

>
> So the device with TAG_FRAMEBUFFER doesn't mean that we have a
> framebuffer, it just means that we have an entry in the table
> describing a framebuffer. Whether it should actually be used to set up
> a framebuffer should be up to the binding driver. That's why I think
> keeping this decision in the driver probe makes more sense, and
> excluding it from the devices on the bus is weird (because you're just
> randomly excluding one of the entries in the table from being
> represented like the others, just because of details about how its
> drivers would want to use it).
>
> If you want these devices to be bound by drivers outside this
> directory, then I think either that other driver needs to have the
> logic to decide when a coreboot framebuffer should actually be used,
> or maybe you should have a small stub driver in this directory that
> binds to the list entry device, makes the decision whether to actually
> use it, and if so creates a sub-device or something (if that's
> possible?) which the actual outside driver can find and bind to.

This is what the current code in framebuffer-coreboot.c does. It binds 
to the coreboot-framebuffer device and create another device for 
external DRM/fbdev drivers to handle. This is problematic, as

1) the additional device will be gone after the native hardware drivers 
takes over the display, so the pdev pointer at [1] is dangling. 
Apparently no one ever unloads the coreboot-framebuffer device to 
trigger this problem.

2) The corboot-framebuffer device sets itself as the external device's 
parent. This is incorrect. The framebuffer exists on top of a PCI 
graphics device, so that device should be the parent. Otherwise the user 
can hot-unplug the PCI hardware and the coreboot framebuffer operates on 
a bogus graphics aperture. Modeling the parent-child relationships 
correctly, avoids this problem.  We've seen these problems with 
UEFI/VESA framebuffers and fixed it accordingly. [2] Something similar 
should be done for coreboot. Coreboot devices can still be located on 
the coreboot bus.

[1] 
https://elixir.bootlin.com/linux/v6.18.4/source/drivers/firmware/google/framebuffer-coreboot.c#L92
[2] 
https://elixir.bootlin.com/linux/v6.18.4/source/drivers/firmware/sysfb.c#L160

Another question I have is why there's a separate device for the 
coreboot-table? Couldn't the kernel just create the coreboot bus and 
then populate it with the table entries? DT does that. If the 
coreboot-table device is really just the parent for the other deivce, 
that is incorrect, as I describe above.

The coreboot bus is only for convenience, I guess? Other subsystems 
(sysfb, DT) create platform devices directly.

Best regards
Thomas



>
> On Thu, Jan 8, 2026 at 3:51 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Test sysfb before creating the coreboot framebuffer device. Skip
>> device creation if the test fails, as this framebuffer does not exist.
>>
>> Depending on the system setup, the initial framebuffer can be provided
>> by the boot loader via screen_info boot parameters and handled by the
>> kernel's sysfb code in drivers/firmware/sysfb.c. With the sysfb test in
>> the coreboot-framebuffer probing, the coreboot device is present without
>> the framebuffer. Even after the sysfb device has been replaced with a
>> native PCI device, the coreboot device persists.
>>
>> Skipping device creation early avoids all these inconsistencies. It
>> further prepares coreboot to support graphics drivers besides the one
>> in framebuffer-coreboot.c.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/firmware/google/coreboot_table.c       | 17 +++++++++++++++++
>>   drivers/firmware/google/coreboot_table.h       |  1 +
>>   drivers/firmware/google/framebuffer-coreboot.c | 16 ----------------
>>   3 files changed, 18 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/firmware/google/coreboot_table.c b/drivers/firmware/google/coreboot_table.c
>> index 882db32e51be..c34426e5002d 100644
>> --- a/drivers/firmware/google/coreboot_table.c
>> +++ b/drivers/firmware/google/coreboot_table.c
>> @@ -18,6 +18,7 @@
>>   #include <linux/of.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/slab.h>
>> +#include <linux/sysfb.h>
>>
>>   #include "coreboot_table.h"
>>
>> @@ -118,6 +119,22 @@ static int coreboot_table_populate(struct device *dev, void *ptr)
>>                          return -EINVAL;
>>                  }
>>
>> +               switch (entry->tag) {
>> +               case CB_TAG_FRAMEBUFFER:
>> +                       /*
>> +                        * On coreboot systems, the advertised CB_TAG_FRAMEBUFFER entry
>> +                        * in the coreboot table should only be used if the payload did
>> +                        * not pass a framebuffer information to the Linux kernel.
>> +                        *
>> +                        * If the global screen_info data has been filled, the generic
>> +                        * system framebuffers (sysfb) will already register a platform
>> +                        * device and pass that screen_info as platform_data to a driver
>> +                        * that can scan-out using the system-provided framebuffer.
>> +                        */
>> +                       if (sysfb_handles_screen_info())
>> +                               continue;
>> +               }
>> +
>>                  device = kzalloc(sizeof(device->dev) + entry->size, GFP_KERNEL);
>>                  if (!device)
>>                          return -ENOMEM;
>> diff --git a/drivers/firmware/google/coreboot_table.h b/drivers/firmware/google/coreboot_table.h
>> index bb6f0f7299b4..e3c353676940 100644
>> --- a/drivers/firmware/google/coreboot_table.h
>> +++ b/drivers/firmware/google/coreboot_table.h
>> @@ -40,6 +40,7 @@ struct lb_cbmem_ref {
>>          u64 cbmem_addr;
>>   };
>>
>> +#define CB_TAG_FRAMEBUFFER 0x12
>>   #define LB_TAG_CBMEM_ENTRY 0x31
>>
>>   /* Corresponds to LB_TAG_CBMEM_ENTRY */
>> diff --git a/drivers/firmware/google/framebuffer-coreboot.c b/drivers/firmware/google/framebuffer-coreboot.c
>> index c68c9f56370f..bb53d1a47409 100644
>> --- a/drivers/firmware/google/framebuffer-coreboot.c
>> +++ b/drivers/firmware/google/framebuffer-coreboot.c
>> @@ -15,12 +15,9 @@
>>   #include <linux/module.h>
>>   #include <linux/platform_data/simplefb.h>
>>   #include <linux/platform_device.h>
>> -#include <linux/sysfb.h>
>>
>>   #include "coreboot_table.h"
>>
>> -#define CB_TAG_FRAMEBUFFER 0x12
>> -
>>   static const struct simplefb_format formats[] = SIMPLEFB_FORMATS;
>>
>>   static int framebuffer_probe(struct coreboot_device *dev)
>> @@ -37,19 +34,6 @@ static int framebuffer_probe(struct coreboot_device *dev)
>>                  .format = NULL,
>>          };
>>
>> -       /*
>> -        * On coreboot systems, the advertised LB_TAG_FRAMEBUFFER entry
>> -        * in the coreboot table should only be used if the payload did
>> -        * not pass a framebuffer information to the Linux kernel.
>> -        *
>> -        * If the global screen_info data has been filled, the Generic
>> -        * System Framebuffers (sysfb) will already register a platform
>> -        * device and pass that screen_info as platform_data to a driver
>> -        * that can scan-out using the system provided framebuffer.
>> -        */
>> -       if (sysfb_handles_screen_info())
>> -               return -ENODEV;
>> -
>>          if (!fb->physical_address)
>>                  return -ENODEV;
>>
>> --
>> 2.52.0
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


