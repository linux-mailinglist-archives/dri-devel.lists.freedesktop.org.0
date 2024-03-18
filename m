Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCC687ED3F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 17:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACD610FBB6;
	Mon, 18 Mar 2024 16:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="sDMIoY2x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QopC2bzt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sDMIoY2x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QopC2bzt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C3510FBB6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 16:17:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9D9405C72B;
 Mon, 18 Mar 2024 16:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710778659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2Rn0qfH2TwfVCYVB0JLiqP7xxZv4bz9lQj8zYVyEtSY=;
 b=sDMIoY2x+N86dSRv7x2Vqo44btvFw20A48ideLmZfZKv5Vd6i6wlC53RPiq9aVDnGx4LbT
 eCqWhyslXWYuqxUvD2/mQZ9gZovFkyzo04TO10pTId0pNj5lIxUZY07Ce+ScNFSApoMCzf
 FX7KtZJZN1dArJyNIOr4GnOvZMit9Ec=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710778659;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2Rn0qfH2TwfVCYVB0JLiqP7xxZv4bz9lQj8zYVyEtSY=;
 b=QopC2bztargtS9HsAxjQgy/NA7j13z4FGALLL7ChXAYzIW9hxUPLKwXoGNb/XtWy/KFkBL
 7l8V6X8Wvc0c2pAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710778659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2Rn0qfH2TwfVCYVB0JLiqP7xxZv4bz9lQj8zYVyEtSY=;
 b=sDMIoY2x+N86dSRv7x2Vqo44btvFw20A48ideLmZfZKv5Vd6i6wlC53RPiq9aVDnGx4LbT
 eCqWhyslXWYuqxUvD2/mQZ9gZovFkyzo04TO10pTId0pNj5lIxUZY07Ce+ScNFSApoMCzf
 FX7KtZJZN1dArJyNIOr4GnOvZMit9Ec=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710778659;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2Rn0qfH2TwfVCYVB0JLiqP7xxZv4bz9lQj8zYVyEtSY=;
 b=QopC2bztargtS9HsAxjQgy/NA7j13z4FGALLL7ChXAYzIW9hxUPLKwXoGNb/XtWy/KFkBL
 7l8V6X8Wvc0c2pAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 666F51349D;
 Mon, 18 Mar 2024 16:17:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6tOQFyNp+GUlYgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Mar 2024 16:17:39 +0000
Message-ID: <13c99de1-5940-4075-8be6-77e004e767b0@suse.de>
Date: Mon, 18 Mar 2024 17:17:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/Makefile: Move tiny drivers before native drivers
Content-Language: en-US
To: Jaak Ristioja <jaak@ristioja.ee>, Huacai Chen <chenhuacai@kernel.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Huacai Chen <chenhuacai@loongson.cn>
References: <20231108024613.2898921-1-chenhuacai@loongson.cn>
 <f461f122-d3e4-4ffb-a252-543f9b6e4e5a@suse.de>
 <CAFOAJEfDZGRY42SRGF64cFbN1e8sBhYsQw_uou8hxTYfyxkhdw@mail.gmail.com>
 <CAAhV-H52y902nP6nPeghLqs+K8gNzCc3DHTU1C0AQcD0TXHMAQ@mail.gmail.com>
 <32b4b912-794f-42b6-b666-5faea8e98d7c@ristioja.ee>
 <CAAhV-H5gFqd3z4Etzuz_q3Hs6A4BP0yzJ69GgMcJzJBRdOwGSA@mail.gmail.com>
 <5f52d611-6ec9-429c-aabf-956d23a8c74d@ristioja.ee>
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
In-Reply-To: <5f52d611-6ec9-429c-aabf-956d23a8c74d@ristioja.ee>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sDMIoY2x;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QopC2bzt
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.50 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 XM_UA_NO_VERSION(0.01)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]; MIME_GOOD(-0.10)[text/plain];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 NEURAL_HAM_LONG(-1.00)[-1.000]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_SEVEN(0.00)[7];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 RCVD_TLS_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Score: -4.50
X-Rspamd-Queue-Id: 9D9405C72B
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

Am 18.03.24 um 16:42 schrieb Jaak Ristioja:
> Hi Huacai,
>
> Uh, no, sorry, I did not get to test such changes. From what Thomas 
> wrote I presumed that this got fixed and no further action would be 
> required.

Right. We reverted the problematic patch and the issue should be gone now.

Best regards
Thomas

>
> To speed things up I would appreciate it if you provided a patch. As I 
> worked around the problem for the end user by changing the kernel 
> configuration, I have long forgotten the exact details. It would 
> otherwise probably take me a while to understand what and where you 
> propose to change exactly.
>
> Also, do you want me to test it on some newer kernel or should I 
> re-download the 6.5.# version sources?
>
>
> Best regards,
> Jaak
>
> On 18.03.24 16:43, Huacai Chen wrote:
>> Hi, Jaak,
>>
>> I'm still here as a boring man. :)
>> Have you ever tested whether using "fs_initcall(sysfb_init)" works
>> fine on your machine?
>>
>> Huacai
>>
>> On Wed, Jan 24, 2024 at 5:21 AM Jaak Ristioja <jaak@ristioja.ee> wrote:
>>>
>>> Hi,
>>>
>>> I apologize for not finding the time to test this earlier.
>>>
>>> On 11.12.23 05:08, Huacai Chen wrote:
>>>> And Jaak, could you please test with the below patch (but keep the
>>>> original order in Makefile) and then give me the dmesg output?
>>>>
>>>> diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
>>>> index 561be8feca96..cc2e39fb98f5 100644
>>>> --- a/drivers/video/aperture.c
>>>> +++ b/drivers/video/aperture.c
>>>> @@ -350,21 +350,29 @@ int
>>>> aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const
>>>> char *na
>>>>           resource_size_t base, size;
>>>>           int bar, ret = 0;
>>>>
>>>> -       if (pdev == vga_default_device())
>>>> +       printk("DEBUG: remove 1\n");
>>>> +
>>>> +       if (pdev == vga_default_device()) {
>>>> +               printk("DEBUG: primary = true\n");
>>>>                   primary = true;
>>>> +       }
>>>>
>>>> -       if (primary)
>>>> +       if (primary) {
>>>> +               printk("DEBUG: disable sysfb\n");
>>>>                   sysfb_disable();
>>>> +       }
>>>>
>>>>           for (bar = 0; bar < PCI_STD_NUM_BARS; ++bar) {
>>>>                   if (!(pci_resource_flags(pdev, bar) & 
>>>> IORESOURCE_MEM))
>>>>                           continue;
>>>>
>>>> +               printk("DEBUG: remove 2\n");
>>>>                   base = pci_resource_start(pdev, bar);
>>>>                   size = pci_resource_len(pdev, bar);
>>>>                   aperture_detach_devices(base, size);
>>>>           }
>>>>
>>>> +       printk("DEBUG: remove 3\n");
>>>>           /*
>>>>            * If this is the primary adapter, there could be a VGA 
>>>> device
>>>>            * that consumes the VGA framebuffer I/O range. Remove this
>>>>
>>>> [1] 
>>>> https://lore.kernel.org/lkml/170222766284.86103.11020060769330721008@leemhuis.info/T/#u
>>>
>>> Copy-pasting this from the e-mail body didn't work well, but I applied
>>> the changes manually to a 6.5.9 kernel without any of the other 
>>> patches.
>>> Here's the relevant dmesg output on the Lenovo L570:
>>>
>>> ...
>>> [    2.953405] ACPI: bus type drm_connector registered
>>> [    2.954014] i915 0000:00:02.0: [drm] VT-d active for gfx access
>>> [    2.954018] DEBUG: remove 1
>>> [    2.954020] DEBUG: remove 2
>>> [    2.954021] DEBUG: remove 2
>>> [    2.954023] DEBUG: remove 3
>>> [    2.954029] resource: resource sanity check: requesting [mem
>>> 0x00000000e0000000-0x00000000efffffff], which spans more than BOOTFB
>>> [mem 0xe0000000-0xe012bfff]
>>> [    2.954035] caller i915_ggtt_init_hw+0x88/0x120 mapping multiple 
>>> BARs
>>> [    2.954061] i915 0000:00:02.0: [drm] Using Transparent Hugepages
>>> [    2.955103] Loading firmware: i915/kbl_dmc_ver1_04.bin
>>> [    2.955384] i915 0000:00:02.0: [drm] Finished loading DMC firmware
>>> i915/kbl_dmc_ver1_04.bin (v1.4)
>>> ...
>>> [    4.145013] [drm] Initialized i915 1.6.0 20201103 for 
>>> 0000:00:02.0 on
>>> minor 0
>>> [    4.147101] ACPI: video: Video Device [GFX0] (multi-head: yes  rom:
>>> no  post: no)
>>> [    4.147244] input: Video Bus as
>>> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input4
>>> [    4.147410] [drm] Initialized vgem 1.0.0 20120112 for vgem on 
>>> minor 1
>>> [    4.147420] usbcore: registered new interface driver udl
>>> [    4.147500] [drm] Initialized simpledrm 1.0.0 20200625 for
>>> simple-framebuffer.0 on minor 2
>>> [    4.148643] Console: switching to colour frame buffer device 80x30
>>> [    4.153216] simple-framebuffer simple-framebuffer.0: [drm] fb0:
>>> simpledrmdrmfb frame buffer device
>>> [    4.154043] loop: module loaded
>>> [    4.156017] ahci 0000:00:17.0: version 3.0
>>> [    4.157373] i915 0000:00:02.0: [drm] fb1: i915drmfb frame buffer 
>>> device
>>> ...
>>>
>>> J
>>>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

