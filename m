Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A37887ECAD
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 16:52:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A6610FB53;
	Mon, 18 Mar 2024 15:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ristioja.ee header.i=@ristioja.ee header.b="hfd0JKrC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 606 seconds by postgrey-1.36 at gabe;
 Mon, 18 Mar 2024 15:52:44 UTC
Received: from mx1.heh.ee (heh.ee [213.35.143.160])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A500D10FB53
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 15:52:44 +0000 (UTC)
Received: from [10.0.0.254] (unknown [10.0.0.254])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.heh.ee (Hehee) with ESMTPSA id 8915A177480;
 Mon, 18 Mar 2024 17:42:34 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ristioja.ee; s=mail;
 t=1710776554; bh=Fk+Q4eZfT3m6Z1/E7US3z2Vg7fPRZeJgLqJRDrL+bJ8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=hfd0JKrC3leK+quyCLDNk6KHOieH2HM8DbPQlSih+m/C2dSqCgZODPSgV6kutvjlO
 /5vo/9Ou+brkCgvkmCx0miwuREPG7wBul1YMgWlhlBK7c3R3BBySa1rwtLEn5GOhJr
 IUrCqYezf6F/kwLilUF8LZCP1+hNR0evQ1Ho6UkY=
Message-ID: <5f52d611-6ec9-429c-aabf-956d23a8c74d@ristioja.ee>
Date: Mon, 18 Mar 2024 17:42:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/Makefile: Move tiny drivers before native drivers
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Huacai Chen <chenhuacai@loongson.cn>
References: <20231108024613.2898921-1-chenhuacai@loongson.cn>
 <f461f122-d3e4-4ffb-a252-543f9b6e4e5a@suse.de>
 <CAFOAJEfDZGRY42SRGF64cFbN1e8sBhYsQw_uou8hxTYfyxkhdw@mail.gmail.com>
 <CAAhV-H52y902nP6nPeghLqs+K8gNzCc3DHTU1C0AQcD0TXHMAQ@mail.gmail.com>
 <32b4b912-794f-42b6-b666-5faea8e98d7c@ristioja.ee>
 <CAAhV-H5gFqd3z4Etzuz_q3Hs6A4BP0yzJ69GgMcJzJBRdOwGSA@mail.gmail.com>
Content-Language: et-EE
From: Jaak Ristioja <jaak@ristioja.ee>
Autocrypt: addr=jaak@ristioja.ee; keydata=
 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
In-Reply-To: <CAAhV-H5gFqd3z4Etzuz_q3Hs6A4BP0yzJ69GgMcJzJBRdOwGSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Huacai,

Uh, no, sorry, I did not get to test such changes. From what Thomas 
wrote I presumed that this got fixed and no further action would be 
required.

To speed things up I would appreciate it if you provided a patch. As I 
worked around the problem for the end user by changing the kernel 
configuration, I have long forgotten the exact details. It would 
otherwise probably take me a while to understand what and where you 
propose to change exactly.

Also, do you want me to test it on some newer kernel or should I 
re-download the 6.5.# version sources?


Best regards,
Jaak

On 18.03.24 16:43, Huacai Chen wrote:
> Hi, Jaak,
> 
> I'm still here as a boring man. :)
> Have you ever tested whether using "fs_initcall(sysfb_init)" works
> fine on your machine?
> 
> Huacai
> 
> On Wed, Jan 24, 2024 at 5:21 AM Jaak Ristioja <jaak@ristioja.ee> wrote:
>>
>> Hi,
>>
>> I apologize for not finding the time to test this earlier.
>>
>> On 11.12.23 05:08, Huacai Chen wrote:
>>> And Jaak, could you please test with the below patch (but keep the
>>> original order in Makefile) and then give me the dmesg output?
>>>
>>> diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
>>> index 561be8feca96..cc2e39fb98f5 100644
>>> --- a/drivers/video/aperture.c
>>> +++ b/drivers/video/aperture.c
>>> @@ -350,21 +350,29 @@ int
>>> aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const
>>> char *na
>>>           resource_size_t base, size;
>>>           int bar, ret = 0;
>>>
>>> -       if (pdev == vga_default_device())
>>> +       printk("DEBUG: remove 1\n");
>>> +
>>> +       if (pdev == vga_default_device()) {
>>> +               printk("DEBUG: primary = true\n");
>>>                   primary = true;
>>> +       }
>>>
>>> -       if (primary)
>>> +       if (primary) {
>>> +               printk("DEBUG: disable sysfb\n");
>>>                   sysfb_disable();
>>> +       }
>>>
>>>           for (bar = 0; bar < PCI_STD_NUM_BARS; ++bar) {
>>>                   if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
>>>                           continue;
>>>
>>> +               printk("DEBUG: remove 2\n");
>>>                   base = pci_resource_start(pdev, bar);
>>>                   size = pci_resource_len(pdev, bar);
>>>                   aperture_detach_devices(base, size);
>>>           }
>>>
>>> +       printk("DEBUG: remove 3\n");
>>>           /*
>>>            * If this is the primary adapter, there could be a VGA device
>>>            * that consumes the VGA framebuffer I/O range. Remove this
>>>
>>> [1]  https://lore.kernel.org/lkml/170222766284.86103.11020060769330721008@leemhuis.info/T/#u
>>
>> Copy-pasting this from the e-mail body didn't work well, but I applied
>> the changes manually to a 6.5.9 kernel without any of the other patches.
>> Here's the relevant dmesg output on the Lenovo L570:
>>
>> ...
>> [    2.953405] ACPI: bus type drm_connector registered
>> [    2.954014] i915 0000:00:02.0: [drm] VT-d active for gfx access
>> [    2.954018] DEBUG: remove 1
>> [    2.954020] DEBUG: remove 2
>> [    2.954021] DEBUG: remove 2
>> [    2.954023] DEBUG: remove 3
>> [    2.954029] resource: resource sanity check: requesting [mem
>> 0x00000000e0000000-0x00000000efffffff], which spans more than BOOTFB
>> [mem 0xe0000000-0xe012bfff]
>> [    2.954035] caller i915_ggtt_init_hw+0x88/0x120 mapping multiple BARs
>> [    2.954061] i915 0000:00:02.0: [drm] Using Transparent Hugepages
>> [    2.955103] Loading firmware: i915/kbl_dmc_ver1_04.bin
>> [    2.955384] i915 0000:00:02.0: [drm] Finished loading DMC firmware
>> i915/kbl_dmc_ver1_04.bin (v1.4)
>> ...
>> [    4.145013] [drm] Initialized i915 1.6.0 20201103 for 0000:00:02.0 on
>> minor 0
>> [    4.147101] ACPI: video: Video Device [GFX0] (multi-head: yes  rom:
>> no  post: no)
>> [    4.147244] input: Video Bus as
>> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input4
>> [    4.147410] [drm] Initialized vgem 1.0.0 20120112 for vgem on minor 1
>> [    4.147420] usbcore: registered new interface driver udl
>> [    4.147500] [drm] Initialized simpledrm 1.0.0 20200625 for
>> simple-framebuffer.0 on minor 2
>> [    4.148643] Console: switching to colour frame buffer device 80x30
>> [    4.153216] simple-framebuffer simple-framebuffer.0: [drm] fb0:
>> simpledrmdrmfb frame buffer device
>> [    4.154043] loop: module loaded
>> [    4.156017] ahci 0000:00:17.0: version 3.0
>> [    4.157373] i915 0000:00:02.0: [drm] fb1: i915drmfb frame buffer device
>> ...
>>
>> J
>>

