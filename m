Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E32DB520E11
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 08:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE7710ED0C;
	Tue, 10 May 2022 06:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD01D10E07C;
 Mon,  9 May 2022 16:23:33 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id v59so25868590ybi.12;
 Mon, 09 May 2022 09:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=o09YVCh1mJQw4VSlSm4Z8xeTjK0fr2xaHgKilffXS2s=;
 b=OpRpEUkR7zZREIJEtYebpotKL58jNZGUbdJC3S3TGXeMBnX+wls42lH4KpjvvVqf/z
 M7BUsofvMnxtwPEtG8w8/vBtyddUCK+LUkfbyTMaK6HOlLS55eXLCLmqF1XAgsvund54
 iBmzcV/TMkDRSDcV78I8WPk+MSaPmclFxDKaRc4wVVBQ/zqLeWDs2ttwBqU/WovmRaPq
 lnwFVAsf6vJwDPREx1GLNtqVdiuesbRoqhA697qkR87Uce4JZ6ExumXMkra+T8BENVN1
 hoV7x7vF9N45EB+kbCBK6SPij9GVOGKwotF0WUQ4kbEDRIryPrTvTBMuQxags8aJd8kY
 LhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=o09YVCh1mJQw4VSlSm4Z8xeTjK0fr2xaHgKilffXS2s=;
 b=lNjyFkDbjuSauf1hteXTRjhpORuN/teoYt3U8Ey6cb+ld+gfG6wtTTHRyJM9DOtmkP
 6JQoNhIdsEDeM1Rmlwv2a5ih6KOgr14e8p59tBYQeWWtdAz80KWxyOXw8cEMoFu2mBkQ
 zOUMC/E45Grw3LXw/i34txOdJBDy+7r0p50a7YmOpH8aSFUbgTDu1Ove6dSzAL1D//Ea
 hR/j8UOzrF0EFQ/YFuEJEunHnyfuQ/2m0Q/iR/l6NqQLfVc8Zh6BFAJYSKZLW+M98ti7
 /vX6wG+vI4QpCj6qYBhB7kigwfD0gMF8P5v8wD6naBvklXzjvnLlpUxwzN4auvO+c02e
 oc8w==
X-Gm-Message-State: AOAM531gW+I+N7mHEqRDTzfk68yV3uyhaJRsEDd8QpyLXuZjfULQIhoq
 5pxequ2jWnsDY+F5KENb7Gf6okS28uxz+50vyIozXqKl3Js=
X-Google-Smtp-Source: ABdhPJyiHgj5934QtcDLMhYh+2YO1SsEdWZ7FQNW3uuIo1YufxMtn8emfISdTrv9VzHbnBNxiz5wTznqB6TP9vd9E4M=
X-Received: by 2002:a25:2554:0:b0:646:afdc:636b with SMTP id
 l81-20020a252554000000b00646afdc636bmr14761574ybl.15.1652113412947; Mon, 09
 May 2022 09:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <bug-215958-41252@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215958-41252@https.bugzilla.kernel.org/>
From: Bjorn Helgaas <bjorn.helgaas@gmail.com>
Date: Mon, 9 May 2022 11:23:21 -0500
Message-ID: <CABhMZUW4=XUOwFAE74nebnZcKBp5pwktWufHNBpB79t3iUeQ3A@mail.gmail.com>
Subject: Re: [Bug 215958] New: thunderbolt3 egpu cannot disconnect cleanly
To: Linux PCI <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 10 May 2022 06:48:43 +0000
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
Reply-To: bjorn@helgaas.com
Cc: r087r70@yahoo.it, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 8, 2022 at 3:29 PM <bugzilla-daemon@kernel.org> wrote:
>
> https://bugzilla.kernel.org/show_bug.cgi?id=215958
>
>             Bug ID: 215958
>            Summary: thunderbolt3 egpu cannot disconnect cleanly
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.17.0-1003-oem #3-Ubuntu SMP PREEMPT
>           Hardware: All
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: PCI
>           Assignee: drivers_pci@kernel-bugs.osdl.org
>           Reporter: r087r70@yahoo.it
>         Regression: No

I assume this is not a regression, right?  If it is a regression, what
previous kernel worked correctly?

> I have an external egpu (Radeon 6600 RX) connected through thunderbolt3 to my
> Thinkpad X1 carbon 6th Gen.. When I disconnect the thunderbolt3 cable I get the
> following error in dmesg:
>
> [21874.194994] amdgpu 0000:0c:00.0: amdgpu: SMU: response:0xFFFFFFFF for
> index:18 param:0x00000005 message:TransferTableSmu2Dram?
> [21874.195006] amdgpu 0000:0c:00.0: amdgpu: Failed to export SMU metrics table!
> [21874.195123] amdgpu 0000:0c:00.0: amdgpu: SMU: response:0xFFFFFFFF for
> index:18 param:0x00000005 message:TransferTableSmu2Dram?
> [21874.195129] amdgpu 0000:0c:00.0: amdgpu: Failed to export SMU metrics table!
> [21874.195271] amdgpu 0000:0c:00.0: amdgpu: SMU: response:0xFFFFFFFF for
> index:18 param:0x00000005 message:TransferTableSmu2Dram?
> [21874.195276] amdgpu 0000:0c:00.0: amdgpu: Failed to export SMU metrics table!
> [21874.195406] amdgpu 0000:0c:00.0: amdgpu: SMU: response:0xFFFFFFFF for
> index:18 param:0x00000005 message:TransferTableSmu2Dram?
> [21874.195411] amdgpu 0000:0c:00.0: amdgpu: Failed to export SMU metrics table!
> [21874.195544] amdgpu 0000:0c:00.0: amdgpu: SMU: response:0xFFFFFFFF for
> index:51 param:0x00000000 message:GetPptLimit?
> [21874.195550] amdgpu 0000:0c:00.0: amdgpu: [smu_v11_0_get_current_power_limit]
> get PPT limit failed!
> [21874.195582] amdgpu 0000:0c:00.0: amdgpu: SMU: response:0xFFFFFFFF for
> index:18 param:0x00000005 message:TransferTableSmu2Dram?
> [21874.195587] amdgpu 0000:0c:00.0: amdgpu: Failed to export SMU metrics table!
> [21874.227454] amdgpu 0000:0c:00.0: amdgpu: SMU: response:0xFFFFFFFF for
> index:18 param:0x00000005 message:TransferTableSmu2Dram?
> [21874.227463] amdgpu 0000:0c:00.0: amdgpu: Failed to export SMU metrics table!
> [21874.227532] amdgpu 0000:0c:00.0: amdgpu: SMU: response:0xFFFFFFFF for
> index:18 param:0x00000005 message:TransferTableSmu2Dram?
> [21874.227536] amdgpu 0000:0c:00.0: amdgpu: Failed to export SMU metrics table!
> [21874.227618] amdgpu 0000:0c:00.0: amdgpu: SMU: response:0xFFFFFFFF for
> index:18 param:0x00000005 message:TransferTableSmu2Dram?
> [21874.227621] amdgpu 0000:0c:00.0: amdgpu: Failed to export SMU metrics table!
> [21874.227700] amdgpu 0000:0c:00.0: amdgpu: SMU: response:0xFFFFFFFF for
> index:18 param:0x00000005 message:TransferTableSmu2Dram?
> [21874.227703] amdgpu 0000:0c:00.0: amdgpu: Failed to export SMU metrics table!
> [21874.227784] amdgpu 0000:0c:00.0: amdgpu: [smu_v11_0_get_current_power_limit]
> get PPT limit failed!
> [21874.227804] amdgpu 0000:0c:00.0: amdgpu: Failed to export SMU metrics table!
> [21874.514661] snd_hda_codec_hdmi hdaudioC1D0: Unable to sync register
> 0x2f0d00. -5
> [21874.568360] amdgpu 0000:0c:00.0: amdgpu: Failed to switch to AC mode!
> [21874.599292] amdgpu 0000:0c:00.0: amdgpu: Failed to switch to AC mode!
> [21874.718562] amdgpu 0000:0c:00.0: amdgpu: amdgpu: finishing device.
> [21878.722376] amdgpu: cp queue pipe 4 queue 0 preemption failed
> [21878.722422] amdgpu 0000:0c:00.0: amdgpu: Failed to disable gfxoff!
> [21879.134918] amdgpu 0000:0c:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
> *ERROR* ring kiq_2.1.0 test failed (-110)
> [21879.135144] [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* KGQ disable failed
> [21879.338158] amdgpu 0000:0c:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
> *ERROR* ring kiq_2.1.0 test failed (-110)
> [21879.338402] [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* KCQ disable failed
> [21879.543318] [drm:gfx_v10_0_cp_gfx_enable.isra.0 [amdgpu]] *ERROR* failed to
> halt cp gfx
> [21879.544216] __smu_cmn_reg_print_error: 5 callbacks suppressed
> [21879.544220] amdgpu 0000:0c:00.0: amdgpu: SMU: response:0xFFFFFFFF for
> index:7 param:0x00000000 message:DisableAllSmuFeatures?
> [21879.544226] amdgpu 0000:0c:00.0: amdgpu: Failed to disable smu features.
> [21879.544230] amdgpu 0000:0c:00.0: amdgpu: Fail to disable dpm features!
> [21879.544238] [drm] free PSP TMR buffer

The above looks like what amdgpu would see when the GPU is no longer
accessible (writes are dropped and reads return 0xffffffff).  It's
possible amdgpu could notice this and shut down more gracefully, but I
don't think it's the main problem here and it probably wouldn't force
you to reboot.

> [21880.455935] i915 0000:00:02.0: vgaarb: changed VGA decodes:
> olddecodes=none,decodes=io+mem:owns=io+mem
> [21880.456218] pci 0000:0c:00.0: Removing from iommu group 14
> [21880.456715] pci 0000:0c:00.1: Removing from iommu group 14
> [21880.456798] pci_bus 0000:0c: busn_res: [bus 0c] is released
> [21880.456950] pci 0000:0b:00.0: Removing from iommu group 14
> [21880.456985] pci_bus 0000:0b: busn_res: [bus 0b-0c] is released
> [21880.457106] pci 0000:0a:00.0: Removing from iommu group 14
> [21880.457156] pci_bus 0000:0a: busn_res: [bus 0a-0c] is released
> [21880.457279] pci 0000:09:01.0: Removing from iommu group 14
> [21880.457311] pci_bus 0000:09: busn_res: [bus 09-3a] is released
> [21880.457543] pci 0000:08:00.0: Removing from iommu group 14

This looks like removing 0c:00.0 (the GPU) and two switches leading to
it (probably part of the Thunderbolt topology), so to be expected.

> [21880.457847] pci_bus 0000:06: Allocating resources
> [21880.457888] pcieport 0000:06:02.0: bridge window [io  0x1000-0x0fff] to [bus
> 3b] add_size 1000
> [21880.457897] pcieport 0000:06:04.0: bridge window [io  0x1000-0x0fff] to [bus
> 3c-6f] add_size 1000
> [21880.457913] pcieport 0000:06:02.0: BAR 13: no space for [io  size 0x1000]
> [21880.457919] pcieport 0000:06:02.0: BAR 13: failed to assign [io  size
> 0x1000]
> [21880.457924] pcieport 0000:06:04.0: BAR 13: no space for [io  size 0x1000]
> [21880.457928] pcieport 0000:06:04.0: BAR 13: failed to assign [io  size
> 0x1000]
> [21880.457934] pcieport 0000:06:04.0: BAR 13: no space for [io  size 0x1000]
> [21880.457938] pcieport 0000:06:04.0: BAR 13: failed to assign [io  size
> 0x1000]
> [21880.457943] pcieport 0000:06:02.0: BAR 13: no space for [io  size 0x1000]
> [21880.457947] pcieport 0000:06:02.0: BAR 13: failed to assign [io  size
> 0x1000]

I'm not sure why we're allocating resources as part of the removal.
The hierarchies under 06:02.0 (to [bus 3b]) and 06:04.0 (to [bus
3c-6f]) seem to be siblings of the hierarchy you just removed (my
guess is that was 06:01.0 to [bus 08-3a]).  But again, shouldn't
require a reboot.

> upon reconnection of the cable I get:
>
> [22192.753261] input: HDA ATI HDMI HDMI/DP,pcm=3 as
> /devices/pci0000:00/0000:00:1d.0/0000:05:00.0/0000:06:01.0/0000:08:00.0/0000:09:01.0/0000:0a:00.0/0000:0b:00.0/0000:0c:00.1/sound/card1/input98
> [22192.753738] input: HDA ATI HDMI HDMI/DP,pcm=7 as
> /devices/pci0000:00/0000:00:1d.0/0000:05:00.0/0000:06:01.0/0000:08:00.0/0000:09:01.0/0000:0a:00.0/0000:0b:00.0/0000:0c:00.1/sound/card1/input99
> [22192.753952] input: HDA ATI HDMI HDMI/DP,pcm=8 as
> /devices/pci0000:00/0000:00:1d.0/0000:05:00.0/0000:06:01.0/0000:08:00.0/0000:09:01.0/0000:0a:00.0/0000:0b:00.0/0000:0c:00.1/sound/card1/input100
> [22192.755234] input: HDA ATI HDMI HDMI/DP,pcm=9 as
> /devices/pci0000:00/0000:00:1d.0/0000:05:00.0/0000:06:01.0/0000:08:00.0/0000:09:01.0/0000:0a:00.0/0000:0b:00.0/0000:0c:00.1/sound/card1/input101
> [22192.763885] input: HDA ATI HDMI HDMI/DP,pcm=10 as
> /devices/pci0000:00/0000:00:1d.0/0000:05:00.0/0000:06:01.0/0000:08:00.0/0000:09:01.0/0000:0a:00.0/0000:0b:00.0/0000:0c:00.1/sound/card1/input102
> [22192.975773] thunderbolt 0-1: new device found, vendor=0x127 device=0x1
> [22192.975786] thunderbolt 0-1: Razer Core X
>
> but the egpu no longer appears in `xrandr --listproviders`. Full reboot is
> needed.

Can you please build with CONFIG_DYNAMIC_DEBUG=y, boot with
'dyndbg="file pciehp* +p"', and attach the complete dmesg log to the
bugzilla?  Also please attach the complete "sudo lspci -vv" output
(before the unplug and after the replug)?
