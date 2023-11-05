Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4803E7E148F
	for <lists+dri-devel@lfdr.de>; Sun,  5 Nov 2023 17:29:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891F110E0FC;
	Sun,  5 Nov 2023 16:28:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.heh.ee (heh.ee [213.35.143.160])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4BA10E0FC
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Nov 2023 16:28:55 +0000 (UTC)
Received: from [10.0.0.254] (unknown [10.0.0.254])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.heh.ee (Hehee) with ESMTPSA id E9A05174EA5;
 Sun,  5 Nov 2023 18:28:49 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ristioja.ee; s=mail;
 t=1699201730; bh=AiaLIF5g7QTTrpxjUeuH4nQFZvh6PTy//pxt0nUuTho=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=ZTfZh2ihLkib2gmlxRm26jckCBi5G9Rv85B41UaPBSyqZC2RcFnEccCT5reag4f4u
 1pjjh4bXeATYUhSzV9asr3KOQo96uICJJ21VFFbSqAhKSeOJ1uBbTlh5xw7VSZP12L
 edXzawsSZ/aNJaDxdmifbJG8AFTTqKD0BLh8hHaM=
Message-ID: <51add74a-1d1a-493d-bb50-fccdad11b22c@ristioja.ee>
Date: Sun, 5 Nov 2023 18:28:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Blank screen on boot of Linux 6.5 and later on Lenovo ThinkPad
 L570
To: Huacai Chen <chenhuacai@kernel.org>, Evan Preston <x.arch@epreston.net>
References: <CAAhV-H5DH3Oj3ttSpa_k6jUdZ+0_pMwgoaqUTGGFr46j7DMXRw@mail.gmail.com>
 <ba16ad66-4b35-4fb4-b4e6-1d785f260eea@ristioja.ee>
 <CAAhV-H64AKdGoHnVLLOYXznpr_aq1jC_TUYXFQRdOjoBxanxkw@mail.gmail.com>
 <c3bb7983-86e4-424e-aadd-e82a0cb6ef37@ristioja.ee>
 <CAAhV-H7UTnTWQeT_qo7VgBczaZo37zjosREr16H8DsLi21XPqQ@mail.gmail.com>
 <CAAhV-H7fJS3-3_hqA4BUdH+q5EG6wSmEoPpO-fUZn5h35O=6OA@mail.gmail.com>
 <31ed0db1-9398-4c46-a391-fc644ec49268@ristioja.ee>
 <CAAhV-H4MekBgYZ1nJ-M7bnpo3bczOMcTanij18ACCALz2svjQQ@mail.gmail.com>
 <ZUSJDG82vzbuyFEY@P70.localdomain>
 <CAAhV-H6GyOnTOm6b8Xp=ySctyE-T905WKDUS2AZuqnEyzM7ZEg@mail.gmail.com>
 <ZUWtTuIcMwwCWg7z@P70.localdomain>
 <CAAhV-H7wnjac1Znr2yh8S2bGwuxF1RRGp=cn9oracrWm6y5VVQ@mail.gmail.com>
Content-Language: et-EE
From: Jaak Ristioja <jaak@ristioja.ee>
Autocrypt: addr=jaak@ristioja.ee; keydata=
 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
In-Reply-To: <CAAhV-H7wnjac1Znr2yh8S2bGwuxF1RRGp=cn9oracrWm6y5VVQ@mail.gmail.com>
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Thomas Zimmermann <tzimmermann@suse.de>, Bagas Sanjaya <bagasdotme@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05.11.23 14:40, Huacai Chen wrote:
> Hi, Evan,
> 
> On Sat, Nov 4, 2023 at 10:50 AM Evan Preston <x.arch@epreston.net> wrote:
>>
>> Hi Huacai,
>>
>> On 2023-11-03 Fri 02:36pm, Huacai Chen wrote:
>>> Hi, Evan,
>>>
>>> On Fri, Nov 3, 2023 at 1:54 PM Evan Preston <x.arch@epreston.net> wrote:
>>>>
>>>> Hi Huacai,
>>>>
>>>> On 2023-11-02 Thu 08:38pm, Huacai Chen wrote:
>>>>> Hi, Jaak,
>>>>>
>>>>> On Wed, Nov 1, 2023 at 7:52 PM Jaak Ristioja <jaak@ristioja.ee> wrote:
>>>>>>
>>>>>> On 31.10.23 14:17, Huacai Chen wrote:
>>>>>>> Hi, Jaak and Evan,
>>>>>>>
>>>>>>> On Sun, Oct 29, 2023 at 9:42 AM Huacai Chen <chenhuacai@kernel.org> wrote:
>>>>>>>>
>>>>>>>> On Sat, Oct 28, 2023 at 7:06 PM Jaak Ristioja <jaak@ristioja.ee> wrote:
>>>>>>>>>
>>>>>>>>> On 26.10.23 03:58, Huacai Chen wrote:
>>>>>>>>>> Hi, Jaak,
>>>>>>>>>>
>>>>>>>>>> On Thu, Oct 26, 2023 at 2:49 AM Jaak Ristioja <jaak@ristioja.ee> wrote:
>>>>>>>>>>>
>>>>>>>>>>> On 25.10.23 16:23, Huacai Chen wrote:
>>>>>>>>>>>> On Wed, Oct 25, 2023 at 6:08 PM Thorsten Leemhuis
>>>>>>>>>>>> <regressions@leemhuis.info> wrote:
>>>>>>>>>>>>>
>>>>>>>>>>>>> Javier, Dave, Sima,
>>>>>>>>>>>>>
>>>>>>>>>>>>> On 23.10.23 00:54, Evan Preston wrote:
>>>>>>>>>>>>>> On 2023-10-20 Fri 05:48pm, Huacai Chen wrote:
>>>>>>>>>>>>>>> On Fri, Oct 20, 2023 at 5:35 PM Linux regression tracking (Thorsten
>>>>>>>>>>>>>>> Leemhuis) <regressions@leemhuis.info> wrote:
>>>>>>>>>>>>>>>> On 09.10.23 10:54, Huacai Chen wrote:
>>>>>>>>>>>>>>>>> On Mon, Oct 9, 2023 at 4:45 PM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>>>>>>>>>>>>>>>>>> On Mon, Oct 09, 2023 at 09:27:02AM +0800, Huacai Chen wrote:
>>>>>>>>>>>>>>>>>>> On Tue, Sep 26, 2023 at 10:31 PM Huacai Chen <chenhuacai@kernel.org> wrote:
>>>>>>>>>>>>>>>>>>>> On Tue, Sep 26, 2023 at 7:15 PM Linux regression tracking (Thorsten
>>>>>>>>>>>>>>>>>>>> Leemhuis) <regressions@leemhuis.info> wrote:
>>>>>>>>>>>>>>>>>>>>> On 13.09.23 14:02, Jaak Ristioja wrote:
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> Upgrading to Linux 6.5 on a Lenovo ThinkPad L570 (Integrated Intel HD
>>>>>>>>>>>>>>>>>>>>>> Graphics 620 (rev 02), Intel(R) Core(TM) i7-7500U) results in a blank
>>>>>>>>>>>>>>>>>>>>>> screen after boot until the display manager starts... if it does start
>>>>>>>>>>>>>>>>>>>>>> at all. Using the nomodeset kernel parameter seems to be a workaround.
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> I've bisected this to commit 60aebc9559492cea6a9625f514a8041717e3a2e4
>>>>>>>>>>>>>>>>>>>>>> ("drivers/firmware: Move sysfb_init() from device_initcall to
>>>>>>>>>>>>>>>>>>>>>> subsys_initcall_sync").
>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> As confirmed by Jaak, disabling DRM_SIMPLEDRM makes things work fine
>>>>>>>>>>>>>>>>>>> again. So I guess the reason:
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Well, this to me still looks a lot (please correct me if I'm wrong) like
>>>>>>>>>>>>>>>> regression that should be fixed, as DRM_SIMPLEDRM was enabled beforehand
>>>>>>>>>>>>>>>> if I understood things correctly. Or is there a proper fix for this
>>>>>>>>>>>>>>>> already in the works and I just missed this? Or is there some good
>>>>>>>>>>>>>>>> reason why this won't/can't be fixed?
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> DRM_SIMPLEDRM was enabled but it didn't work at all because there was
>>>>>>>>>>>>>>> no corresponding platform device. Now DRM_SIMPLEDRM works but it has a
>>>>>>>>>>>>>>> blank screen. Of course it is valuable to investigate further about
>>>>>>>>>>>>>>> DRM_SIMPLEDRM on Jaak's machine, but that needs Jaak's effort because
>>>>>>>>>>>>>>> I don't have a same machine.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Side note: Huacai, have you tried working with Jaak to get down to the
>>>>>>>>>>>>> real problem? Evan, might you be able to help out here?
>>>>>>>>>>>> No, Jaak has no response after he 'fixed' his problem by disabling SIMPLEDRM.
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> I'm sorry, what was it exactly you want me to do? Please be mindful that
>>>>>>>>>>> I'm not familiar with the internals of the Linux kernel and DRI, and it
>>>>>>>>>>> might sometimes take weeks before I have time to work and respond on this.
>>>>>>>>>> It doesn't matter. I hope you can do some experiments to investigate
>>>>>>>>>> deeper. The first experiment you can do is enabling SIMPLEFB (i.e.
>>>>>>>>>> CONFIG_FB_SIMPLE) instead of SIMPLEDRM (CONFIG_DRM_SIMPLEDRM) to see
>>>>>>>>>> whether there is also a blank screen. If no blank screen, that
>>>>>>>>>> probably means SIMPLEDRM has a bug, if still blank screen, that means
>>>>>>>>>> the firmware may pass wrong screen information.
>>>>>>>>>
>>>>>>>>> Testing with 6.5.9 I get a blank screen with CONFIG_DRM_SIMPLEDRM=y and
>>>>>>>>> get no blank screen with CONFIG_FB_SIMPLE=y and CONFIG_DRM_SIMPLEDRM unset.
>>>>>>>> CONFIG_FB_SIMPLE and  CONFIG_DRM_SIMPLEDRM use the same device created
>>>>>>>> by sysfb_init(). Since FB_SIMPLE works fine, I think the real problem
>>>>>>>> is that DRM_SIMPLEDRM has a bug. The next step is to enable
>>>>>>>> CONFIG_DRM_SIMPLEDRM and trace its initialization. In detail, adding
>>>>>>>> some printk() in simpledrm_probe() and its sub-routines to see where
>>>>>>>> the driver fails. The output of these printk() can be seen by the
>>>>>>>> 'dmesg' command after boot.
>>>>>>> I need your help. I tried with my laptop (ThinkPad E490, Intel Core
>>>>>>> i3-8145U, UHD Graphics 620) but I can't reproduce your problem. So
>>>>>>> please patch your 6.5.x kernel with this temporary patch [1], then
>>>>>>> build a "bad kernel" with SIMPLEDRM enabled. And after booting your
>>>>>>> machine with this "bad kernel", please give me the dmesg output. Thank
>>>>>>> you very much.
>>>>>>>
>>>>>>> [1] http://ddns.miaomiaomiao.top:9000/download/kernel/patch-6.5.9
>>>>>>
>>>>>> I'm unable to download it. Can you please send it by e-mail?
>>>>> I'm sorry, please download from attachment.
>>>>
>>>> When applying this patch the first hunk (drivers/firmware/sysfb.c) fails for
>>>> me with 6.5.9.  Attempting to load the 6.5.9 kernel without this patch
>>>> produces no dmesg output on my machine.
>>> You copy-paste the patch? If you download it directly it can be
>>> applied successfully, I think.
>>
>> The patch downloaded from your URL applies successfully.  However, I still
>> see no dmesg output using the patched 6.5.9 kernel.  'journalctl -k -b all'
>> shows no dmesg output from any 6.5.x boots, only from 6.4.12 boots.
> Thank you for your testing. Since you cannot boot to GUI successfully
> as Jaak, you may have some troubles with getting the dmesg output. But
> you can try to use "systemd.unit=multi-user.target" boot parameters.
> In this way you may boot to the login: prompt and then you can get
> dmesg output. Or if you still fail, you may use 'jornalctl -k -b -1'
> to get the previous dmesg output with 6.4.12.
> 
> Hi, Jaak,
> 
> Have you tested? I think you can successfully get a dmesg output with my patch.

Yes, just tested it, here I think are the relevant parts from a dmesg 
produced with CONFIG_DRM_SIMPLEDRM and the patch provided by Huacai:

...
[    2.909625] sysfb 1
[    2.909627] sysfb 2
...
[    2.951477] ACPI: bus type drm_connector registered
[    2.952096] i915 0000:00:02.0: [drm] VT-d active for gfx access
[    2.952105] resource: resource sanity check: requesting [mem 
0x00000000e0000000-0x00000000efffffff], which spans more than BOOTFB 
[mem 0xe0000000-0xe012bfff]
[    2.952111] caller i915_ggtt_init_hw+0x88/0x120 mapping multiple BARs
[    2.952138] i915 0000:00:02.0: [drm] Using Transparent Hugepages
[    2.953204] Loading firmware: i915/kbl_dmc_ver1_04.bin
[    2.953485] i915 0000:00:02.0: [drm] Finished loading DMC firmware 
i915/kbl_dmc_ver1_04.bin (v1.4)
...
[    4.142075] [drm] Initialized i915 1.6.0 20201103 for 0000:00:02.0 on 
minor 0
[    4.144269] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: 
no  post: no)
[    4.144414] input: Video Bus as 
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input4
[    4.144580] [drm] Initialized vgem 1.0.0 20120112 for vgem on minor 1
[    4.144590] usbcore: registered new interface driver udl
[    4.144603] T: probe 1
[    4.144605] T: create 1
[    4.144610] T: create 2
[    4.144611] T: create 3a-1
[    4.144613] T: create 3a-2
[    4.144614] T: create 3a-3
[    4.144616] T: create 3a-4
[    4.144618] T: create 4
[    4.144619] T: create 5
[    4.144621] simple-framebuffer simple-framebuffer.0: [drm] display 
mode={"": 60 18432 640 640 640 640 480 480 480 480 0x40 0x0}
[    4.144628] simple-framebuffer simple-framebuffer.0: [drm] 
framebuffer format=XR24 little-endian (0x34325258), size=640x480, 
stride=2560 byte
[    4.144633] T: create 6b-1
[    4.144635] T: create 6b-2
[    4.144637] simple-framebuffer simple-framebuffer.0: [drm] using I/O 
memory framebuffer at [mem 0xe0000000-0xe012bfff flags 0x200]
[    4.144643] T: create 6b-3
[    4.144660] T: create 6b-4
[    4.144662] T: create 7
[    4.144673] T: create 8
[    4.144676] T: create 9
[    4.144678] T: create 10
[    4.144681] T: create 11
[    4.144685] T: create 12
[    4.144689] T: probe 2
[    4.144728] [drm] Initialized simpledrm 1.0.0 20200625 for 
simple-framebuffer.0 on minor 2
[    4.144732] T: probe 3
[    4.145905] Console: switching to colour frame buffer device 80x30
[    4.150437] simple-framebuffer simple-framebuffer.0: [drm] fb0: 
simpledrmdrmfb frame buffer device
[    4.150766] T: probe 4
[    4.151218] loop: module loaded
[    4.154434] i915 0000:00:02.0: [drm] fb1: i915drmfb frame buffer device
...
[   44.630789] simple-framebuffer simple-framebuffer.0: swiotlb buffer 
is full (sz: 1310720 bytes), total 32768 (slots), used 0 (slots)
...

The last message might be due to the display manager starting up.

Hope it helps.

J

> 
>>
>> Evan
>>
>>>
>>> Huacai
>>>
>>>>
>>>> Evan
>>>>
>>>>>
>>>>> Huacai
>>>>>
>>>>>>
>>>>>> Jaak
>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> Huacai
>>>>>>>
>>>>>>>>
>>>>>>>> Huacai
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Jaak
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Huacai
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Jaak
>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> But I write this mail for a different reason:
>>>>>>>>>>>>>
>>>>>>>>>>>>>> I am having the same issue on a Lenovo Thinkpad P70 (Intel
>>>>>>>>>>>>>> Corporation HD Graphics 530 (rev 06), Intel(R) Core(TM) i7-6700HQ).
>>>>>>>>>>>>>> Upgrading from Linux 6.4.12 to 6.5 and later results in only a blank
>>>>>>>>>>>>>> screen after boot and a rapidly flashing device-access-status
>>>>>>>>>>>>>> indicator.
>>>>>>>>>>>>>
>>>>>>>>>>>>> This additional report makes me wonder if we should revert the culprit
>>>>>>>>>>>>> (60aebc9559492c ("drivers/firmware: Move sysfb_init() from
>>>>>>>>>>>>> device_initcall to subsys_initcall_sync") [v6.5-rc1]). But I guess that
>>>>>>>>>>>>> might lead to regressions for some users? But the patch description says
>>>>>>>>>>>>> that this is not a common configuration, so can we maybe get away with that?
>>>>>>>>>>>>     From my point of view, this is not a regression, 60aebc9559492c
>>>>>>>>>>>> doesn't cause a problem, but exposes a problem. So we need to fix the
>>>>>>>>>>>> real problem (SIMPLEDRM has a blank screen on some conditions). This
>>>>>>>>>>>> needs Jaak or Evan's help.
>>>>>>>>>>>>
>>>>>>>>>>>> Huacai
>>>>>>>>>>>>>
>>>>>>>>>>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>>>>>>>>>>>> --
>>>>>>>>>>>>> Everything you wanna know about Linux kernel regression tracking:
>>>>>>>>>>>>> https://linux-regtracking.leemhuis.info/about/#tldr
>>>>>>>>>>>>> If I did something stupid, please tell me, as explained on that page.
>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> When SIMPLEDRM takes over the framebuffer, the screen is blank (don't
>>>>>>>>>>>>>>>>>>> know why). And before 60aebc9559492cea6a9625f ("drivers/firmware: Move
>>>>>>>>>>>>>>>>>>> sysfb_init() from device_initcall to subsys_initcall_sync") there is
>>>>>>>>>>>>>>>>>>> no platform device created for SIMPLEDRM at early stage, so it seems
>>>>>>>>>>>>>>>>>>> also "no problem".
>>>>>>>>>>>>>>>>>> I don't understand above. You mean that after that commit the platform
>>>>>>>>>>>>>>>>>> device is also none, right?
>>>>>>>>>>>>>>>>> No. The SIMPLEDRM driver needs a platform device to work, and that
>>>>>>>>>>>>>>>>> commit makes the platform device created earlier. So, before that
>>>>>>>>>>>>>>>>> commit, SIMPLEDRM doesn't work, but the screen isn't blank; after that
>>>>>>>>>>>>>>>>> commit, SIMPLEDRM works, but the screen is blank.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> Huacai
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> Confused...
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> --
>>>>>>>>>>>>>>>>>> An old man doll... just what I always wanted! - Clara
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>
>>>>>>
>>>>
>>>>

