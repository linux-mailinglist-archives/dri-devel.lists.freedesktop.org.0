Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFD09778FF
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 08:53:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A8410EC5E;
	Fri, 13 Sep 2024 06:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ymF+olb+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CMTHBgrt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xZ1vCzb4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NC6VsYty";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D52F10EC31;
 Fri, 13 Sep 2024 06:53:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C4B7B1F7C8;
 Fri, 13 Sep 2024 06:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726210427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yodNtgpzY0RHuizbdjq7+LdG3DurlGyACVx8nEHLOGk=;
 b=ymF+olb+t/h3K766R2TSotEHM+fPyH9YXSS88pZvotya0kG4QjwYSKLFwue1DLkn/62KHW
 DH+cSOrj65nqxIxrscVFQ/r9F/m7sS39IY6ybtDAjEdtP3oseo08VYj87xhd57YjkKpK/e
 IH54zRe+9OQJi3pPwN5oG5FCA+aJjCs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726210427;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yodNtgpzY0RHuizbdjq7+LdG3DurlGyACVx8nEHLOGk=;
 b=CMTHBgrtf0acS3lwMX1PkeFVW3uArXeW1MKv5EI3MTIPTwm3maz9x9Z9tK3K+Moth1xIKL
 Q69CS6LH+hkPrHAw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xZ1vCzb4;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=NC6VsYty
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726210426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yodNtgpzY0RHuizbdjq7+LdG3DurlGyACVx8nEHLOGk=;
 b=xZ1vCzb4WXdH1w4owimLUMwJay3dIUyUYNbp1xjjwlpWLB/xEnl0vwaxhOwEoCiW24LFYT
 j1ICE//ZpN97Ok9Cs7+jHeDEy/hpk8fojWFPyXbzPU/rYhaO04Z0jBMOKAC81JGxVaUvEt
 6SQROsq5kllpffdeG1Xrb8Vcg/Wg5YI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726210426;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yodNtgpzY0RHuizbdjq7+LdG3DurlGyACVx8nEHLOGk=;
 b=NC6VsYtyvJTUa0jK9KyiqwnHc+fk8ZkYIg66wCiw/oEawU3CIwddsLRnHrqcXuSZIZ8HAV
 tsYRtCv7hxs61aAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 43F3413A73;
 Fri, 13 Sep 2024 06:53:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id VMA+D3rh42byHgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 13 Sep 2024 06:53:46 +0000
Message-ID: <6bf656e0-e0b6-4b97-b7a2-ff0bdc86b098@suse.de>
Date: Fri, 13 Sep 2024 08:53:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [NOT A REGRESSION] firmware: framebuffer-coreboot: duplicate
 device name "simple-framebuffer.0"
To: Javier Martinez Canillas <javierm@redhat.com>,
 Julius Werner <jwerner@chromium.org>
Cc: Brian Norris <briannorris@chromium.org>, Borislav Petkov <bp@alien8.de>,
 Hugues Bruant <hugues.bruant@gmail.com>, stable@vger.kernel.org,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 Fenghua Yu <fenghua.yu@intel.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Tony Luck
 <tony.luck@intel.com>, Tzung-Bi Shih <tzungbi@kernel.org>,
 chrome-platform@lists.linux.dev, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <CALvjV29jozswRtmYxDur2TuEQ=1JSDrM+uWVHmghW3hG5Y9F+w@mail.gmail.com>
 <20240909080200.GAZt6reI9c98c9S_Xc@fat_crate.local>
 <ZuCGkjoxKxpnhEh6@google.com>
 <87jzfhayul.fsf@minerva.mail-host-address-is-not-set>
 <CAODwPW8P+jcF0erUph5XyWoyQgLFbZWxEM6Ygi_LFCCTLmH89Q@mail.gmail.com>
 <87mskczv9l.fsf@minerva.mail-host-address-is-not-set>
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
In-Reply-To: <87mskczv9l.fsf@minerva.mail-host-address-is-not-set>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C4B7B1F7C8
X-Spam-Level: 
X-Spamd-Result: default: False [-5.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; SUSPICIOUS_RECIPS(1.50)[];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCPT_COUNT_TWELVE(0.00)[19];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[chromium.org,alien8.de,gmail.com,vger.kernel.org,lists.linux.dev,intel.com,kernel.org,linux.intel.com,ursulin.net,lists.freedesktop.org];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -5.01
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

Hi Javier,

thanks for the patch.

Am 12.09.24 um 18:33 schrieb Javier Martinez Canillas:
> Julius Werner <jwerner@chromium.org> writes:
>
> Hello Julius,
>
>>> On Coreboot platforms, a system framebuffer may be provided to the Linux
>>> kernel by filling a LB_TAG_FRAMEBUFFER entry in the Coreboot table. But
>>> it seems SeaBIOS payload can also provide a VGA mode in the boot params.
>>>
>>> [...]
>>>
>>> To prevent the issue, make the framebuffer_core driver to disable sysfb
>>> if there is system framebuffer data in the Coreboot table. That way only
>>> this driver will register a device and sysfb would not attempt to do it
>>> (or remove its registered device if was already executed before).
>> I wonder if the priority should be the other way around? coreboot's
>> framebuffer is generally only valid when coreboot exits to the payload
>> (e.g. SeaBIOS). Only if the payload doesn't touch the display
>> controller or if there is no payload and coreboot directly hands off
>> to a kernel does the kernel driver for LB_TAG_FRAMEBUFFER make sense.
>> But if there is some other framebuffer information passed to the
>> kernel from a firmware component running after coreboot, most likely
>> that one is more up to date and the framebuffer described by the
>> coreboot table doesn't work anymore (because the payload usually
>> doesn't modify the coreboot tables again, even if it changes hardware
>> state). So if there are two drivers fighting over which firmware
>> framebuffer description is the correct one, the coreboot driver should
>> probably give way.
>>
> That's a very good point. I'm actually not familiar with Coreboot and I
> used an educated guess (in the case of DT for example, that's the main
> source of truth and I didn't know if a Core table was in a similar vein).
>
> Maybe something like the following (untested) patch then?
>
>  From de1c32017006f4671d91b695f4d6b4e99c073ab2 Mon Sep 17 00:00:00 2001
> From: Javier Martinez Canillas <javierm@redhat.com>
> Date: Thu, 12 Sep 2024 18:31:55 +0200
> Subject: [PATCH] firmware: coreboot: Don't register a pdev if screen_info data
>   is available
>
> On Coreboot platforms, a system framebuffer may be provided to the Linux
> kernel by filling a LB_TAG_FRAMEBUFFER entry in the Coreboot table. But
> a Coreboot payload (e.g: SeaBIOS) could also provide this information to
> the Linux kernel.
>
> If that the case, early arch x86 boot code will fill the global struct
> screen_info data and that data used by the Generic System Framebuffers
> (sysfb) framework to add a platform device with platform data about the
> system framebuffer.
>
> But later then the framebuffer_coreboot driver will try to do the same
> framebuffer (using the information from the Coreboot table), which will
> lead to an error due a simple-framebuffer.0 device already registered:
>
>      sysfs: cannot create duplicate filename '/bus/platform/devices/simple-framebuffer.0'
>      ...
>      coreboot: could not register framebuffer
>      framebuffer coreboot8: probe with driver framebuffer failed with error -17
>
> To prevent the issue, make the framebuffer_core driver to not register a
> platform device if the global struct screen_info data has been filled.
>
> Reported-by: Brian Norris <briannorris@chromium.org>
> Link: https://lore.kernel.org/all/ZuCG-DggNThuF4pj@b20ea791c01f/T/#ma7fb65acbc1a56042258adac910992bb225a20d2
> Suggested-by: Julius Werner <jwerner@chromium.org>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>   drivers/firmware/google/framebuffer-coreboot.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/drivers/firmware/google/framebuffer-coreboot.c b/drivers/firmware/google/framebuffer-coreboot.c
> index daadd71d8ddd..4e50da17cd7e 100644
> --- a/drivers/firmware/google/framebuffer-coreboot.c
> +++ b/drivers/firmware/google/framebuffer-coreboot.c
> @@ -15,6 +15,7 @@
>   #include <linux/module.h>
>   #include <linux/platform_data/simplefb.h>
>   #include <linux/platform_device.h>
> +#include <linux/screen_info.h>
>   
>   #include "coreboot_table.h"
>   
> @@ -27,6 +28,7 @@ static int framebuffer_probe(struct coreboot_device *dev)
>   	int i;
>   	u32 length;
>   	struct lb_framebuffer *fb = &dev->framebuffer;
> +	struct screen_info *si = &screen_info;

Probably 'const'.

>   	struct platform_device *pdev;
>   	struct resource res;
>   	struct simplefb_platform_data pdata = {
> @@ -36,6 +38,20 @@ static int framebuffer_probe(struct coreboot_device *dev)
>   		.format = NULL,
>   	};
>   
> +	/*
> +	 * If the global screen_info data has been filled, the Generic
> +	 * System Framebuffers (sysfb) will already register a platform
> +	 * and pass the screen_info as platform_data to a driver that
> +	 * could scan-out using the system provided framebuffer.
> +	 *
> +	 * On Coreboot systems, the advertise LB_TAG_FRAMEBUFFER entry
> +	 * in the Coreboot table should only be used if the payload did
> +	 * not set video mode info and passed it to the Linux kernel.
> +	 */
> +	if (si->orig_video_isVGA == VIDEO_TYPE_VLFB ||
> +            si->orig_video_isVGA == VIDEO_TYPE_EFI)

Rather call screen_info_video_type(si) [1] to get the type. If it 
returns 0, the screen_info is unset and the corebios code can handle the 
framebuffer. In any other case, the framebuffer went through a 
bootloader, which might have modified it. This also handles awkward 
cases, such as if the bootloader programs a VGA text mode.

[1] 
https://elixir.bootlin.com/linux/v6.10.10/source/include/linux/screen_info.h#L92

With these changes:

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

> +		return -EINVAL;
> +
>   	if (!fb->physical_address)
>   		return -ENODEV;
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

