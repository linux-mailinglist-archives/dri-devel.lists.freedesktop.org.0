Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F17194409EC
	for <lists+dri-devel@lfdr.de>; Sat, 30 Oct 2021 17:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9E16E041;
	Sat, 30 Oct 2021 15:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9FB6E03A;
 Sat, 30 Oct 2021 15:24:40 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id r2so10671675qtw.12;
 Sat, 30 Oct 2021 08:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:reply-to:subject
 :content-language:references:from:to:in-reply-to
 :content-transfer-encoding;
 bh=wspgBO+zbFXV33fMwZ+53MIBfOpz1gnwIjOZWmfjN1I=;
 b=JSwjdqaB6dPcw4NAQj2aRhnXCQB0CIiB2S16Ghww/doBW/VmNu0nPyiyYWfmqQpROk
 NjlLvblqe+nUv4Rv8nDb9HUlR7L9XmKXxpr1Y1cmrGiKFM9HDTlRa8VWq077haDmYNgm
 yTRHOVZu+R7jVPEhXVb0Lw+Qq+pp1ajV8FHB3J4cFfow7jklIS7iFUy1TlV3Jp0W5CaW
 jUnQi9uYXKpAMZ2+U6QUrKsh77GVEeQjKednu+Cr/1no4Dg/UDB3a9ezrFFWibmNQC9j
 vIiAxhi0CTnaHn5eWFFdhlR3nLMHwSz7+EpU5IekTPep7fhDRLv3JUlrvmbPxDKkWCsY
 u+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:references:from:to:in-reply-to
 :content-transfer-encoding;
 bh=wspgBO+zbFXV33fMwZ+53MIBfOpz1gnwIjOZWmfjN1I=;
 b=Y8Y/yKGkRedSfaMo+zUQsZZ/2JDZFKBe2SVxnSSLvKkEZgbYcj8YaW96wJYeHPE9Kw
 qGciw2klnTO+bD+6tvTbUz/DyfhC0FjnRvrxfy71eNFZiqsmp18NfBe0Z/ejZvGyuAd/
 D3UXU6CI1LjmPGpF8Bk3+pszKGULzMRw/ygYV+D5jI34qy2HP4rMkb6fAbZYRBM+cmIj
 PoTxJXLgbSkV4U/EX7R3snsdRs7VkpnDStfy9hC7c1J5kz/ukWJfJZLCk2y+OUS538D4
 9PsKIyNR9fzOxmyF3V55pvTACbC+0pOuy1yEJ3LyknuiV9ojsQ4mvB5NLQHdknFD4RNV
 t3EA==
X-Gm-Message-State: AOAM531pn11Y/ab/bjfTsIohEYqiJPrpKZMsyGGnTdTdGzfDKJjoA1bF
 ROMgoZ8dVTDE6aj3v/J7SquqS6vXC8c=
X-Google-Smtp-Source: ABdhPJy1TCtp5XUVBopU3TdGuSuWciWQdIOyzMez2OY6TTpzRmpsm6N+BDblhBGKJbJynzW8lPTPjg==
X-Received: by 2002:ac8:5c84:: with SMTP id r4mr6683980qta.11.1635607479150;
 Sat, 30 Oct 2021 08:24:39 -0700 (PDT)
Received: from mua.localhost ([2600:1700:e380:2c20::49])
 by smtp.gmail.com with ESMTPSA id f7sm6284913qkp.107.2021.10.30.08.24.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 08:24:38 -0700 (PDT)
Message-ID: <c08a4b33-ac3a-ef52-57d3-f55a4c2843c7@gmail.com>
Date: Sat, 30 Oct 2021 11:24:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.2.0
Subject: amdgpu on Ryzen 5600G -- 'purple' background [WAS: Re: amdgpu "Fatal
 error during GPU init"; Ryzen 5600G integrated GPU + kernel 5.14.13}
Content-Language: en-US
References: <b4adea1b-9a21-75d2-7ee7-25d4f28ef6f8@gmail.com>
 <2303555f-42cd-180c-7a67-1d104bceea7d@gmail.com>
 <CADnq5_PsKDreYH0aNNzfR_TbfMMsfVK=-hCCB0ThZ0PzcLPCpw@mail.gmail.com>
From: PGNet Dev <pgnet.dev@gmail.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
In-Reply-To: <CADnq5_PsKDreYH0aNNzfR_TbfMMsfVK=-hCCB0ThZ0PzcLPCpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Reply-To: pgnet.dev@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now I'm just guessing.

TBH, I've no idea what's causing this reproducible 'purple' background with `amdgpu` on Ryzen 5XXXG.

All I can definitively say is that it's real, reproducible, seen elsewhere in the wild for radeon/amd
Possibly related to driver defaulting to HDMI YCbCr color, rather than RGB.

I'll add more info as requested when someone with better knowledge of what's needed chimes in.

For now, here's the last bits of info I've found.

This issue

	https://community.amd.com/t5/drivers-software/purple-ish-desktop-screen-after-clean-installing-the-newest-19-5/td-p/99933/page/15

suggests in 2019, Microsoft fixed driver for this purple-hue issue on Ryzen

	https://support.microsoft.com/en-ca/help/4505903/windows-10-update-kb4505903

Seems like this had to do with the driver selecting YCbCr for HDMI rather than RGB ...

Here,

	Setting the amdgpu HDMI Pixel Format on Linux
	 https://www.wezm.net/v2/posts/2020/linux-amdgpu-pixel-format/

mentions

	"...
	I looked for a way to change the pixel format output from the HDMI port of my RX560 graphics card. Turns out this is super easy on Windows, but the amdgpu driver on Linux does not support changing it.
	..."

and refers to an EDID hack/fix

	https://www.wezm.net/v2/posts/2020/linux-amdgpu-pixel-format/#the-fix

More digging led to

	AMDGPU fails to properly parse EDID information from display, causing weird resolution setting issues
	 https://gitlab.freedesktop.org/drm/amd/-/issues/1589

with a familiar 'purple' display,

	https://gitlab.freedesktop.org/drm/amd/uploads/2e2b485aed26d77a9066ca9ea516d49d/image.png

and points to an amd issue "Created 3 years ago",

	no color format choice in amdgpu
	 https://gitlab.freedesktop.org/drm/amd/-/issues/476#note_852860

and finally, a patch

	[PATCH] drm/amdgpu/dc: Pixel encoding DRM property and module parameter
	 https://www.spinics.net/lists/amd-gfx/msg53281.html

which suggests adding

	pixel_encoding=rgb


checking

	hwinfo --gfxcard | egrep "Model|SysFS ID"
		SysFS ID: /devices/pci0000:00/0000:00:08.1/0000:30:00.0
		Model: "ATI VGA compatible controller"
		SysFS ID: /devices/pci0000:00/0000:00:01.1/0000:10:00.0
		Model: "nVidia GP108 [GeForce GT 1030]"


	ls -ald /sys/class/drm/card* | grep 30:
		lrwxrwxrwx 1 root root 0 Oct 30 09:56 /sys/class/drm/card0 -> ../../devices/pci0000:00/0000:00:08.1/0000:30:00.0/drm/card0/
		lrwxrwxrwx 1 root root 0 Oct 30 09:56 /sys/class/drm/card0-DP-1 -> ../../devices/pci0000:00/0000:00:08.1/0000:30:00.0/drm/card0/card0-DP-1/
		lrwxrwxrwx 1 root root 0 Oct 30 09:56 /sys/class/drm/card0-HDMI-A-1 -> ../../devices/pci0000:00/0000:00:08.1/0000:30:00.0/drm/card0/card0-HDMI-A-1/
		lrwxrwxrwx 1 root root 0 Oct 30 09:56 /sys/class/drm/card0-HDMI-A-2 -> ../../devices/pci0000:00/0000:00:08.1/0000:30:00.0/drm/card0/card0-HDMI-A-2/

( why are there *2* HDMI for card0, when only 1 phy output? )

next, added to kernel cmdline

	video=HDMI-A-1:2560x1440@60:pixel_encoding=rgb video=HDMI-A-2:2560x1440@60:pixel_encoding=rgb

and, for good measure,

	cat /etc/modprobe.d/amdgpu.conf
		

re-gen'd initrd, and rebooted.

STILL getting the purple screen :-/

dmesg, after boot completion,

	dmesg | grep encod
	...
	[    1.650090] amdgpu: unknown parameter 'pixel_encoding' ignored
	...

Paying close(r) attention, screen output after grub-select starts out with black-as-usual background, but switches to purple immediately after:

	dmesg

		...
>>		[    1.268709] systemd[1]: Starting dracut initqueue hook...
		...


where,

	dmesg | egrep -i "atpx|vga|drm|amdgpu|initqueue"
		[    0.329804] ACPI BIOS Error (bug): Failure creating named object [\_SB.PCI0.GPP0.VGA], AE_ALREADY_EXISTS (20210604/dswload2-326)
		[    0.351328] pci 0000:10:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
		[    0.351328] pci 0000:30:00.0: vgaarb: setting as boot VGA device
		[    0.351328] pci 0000:30:00.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
		[    0.351328] pci 0000:10:00.0: vgaarb: bridge control possible
		[    0.351328] pci 0000:30:00.0: vgaarb: bridge control possible
		[    0.351328] vgaarb: loaded
		[    0.410851] fb0: EFI VGA frame buffer device
		[    1.264753] ACPI: video: Video Device [VGA] (multi-head: yes  rom: no  post: no)
		[    1.265256] ACPI: video: Video Device [VGA1] (multi-head: yes  rom: no  post: no)
		[    1.268709] systemd[1]: Starting dracut initqueue hook...
		[    1.650090] amdgpu: unknown parameter 'pixel_encoding' ignored
		[    1.650094] amdgpu: unknown parameter 'modeset' ignored
		[    1.650416] [drm] amdgpu kernel modesetting enabled.
		[    1.650432] vga_switcheroo: detected switching method \_SB_.PCI0.GP17.VGA_.ATPX handle
		[    1.650720] ATPX version 1, functions 0x00000001
		[    1.650751] ATPX Hybrid Graphics
		[    1.656232] amdgpu: Virtual CRAT table created for CPU
		[    1.656240] amdgpu: Topology: Add CPU node
		[    1.656299] fb0: switching to amdgpudrmfb from EFI VGA
		[    1.656413] amdgpu 0000:30:00.0: vgaarb: deactivate vga console
		[    1.656503] [drm] initializing kernel modesetting (RENOIR 0x1002:0x1638 0x1002:0x1636 0xC9).
		[    1.656516] amdgpu 0000:30:00.0: amdgpu: Trusted Memory Zone (TMZ) feature enabled
		[    1.656548] [drm] register mmio base: 0xFCB00000
		[    1.656548] [drm] register mmio size: 524288
		[    1.656550] [drm] PCIE atomic ops is not supported
		[    1.657578] [drm] add ip block number 0 <soc15_common>
		[    1.657579] [drm] add ip block number 1 <gmc_v9_0>
		[    1.657581] [drm] add ip block number 2 <vega10_ih>
		[    1.657581] [drm] add ip block number 3 <psp>
		[    1.657582] [drm] add ip block number 4 <smu>
		[    1.657583] [drm] add ip block number 5 <gfx_v9_0>
		[    1.657584] [drm] add ip block number 6 <sdma_v4_0>
		[    1.657585] [drm] add ip block number 7 <dm>
		[    1.657586] [drm] add ip block number 8 <vcn_v2_0>
		[    1.657587] [drm] add ip block number 9 <jpeg_v2_0>
		[    1.663332] [drm] BIOS signature incorrect 0 0
		[    1.663360] amdgpu 0000:30:00.0: amdgpu: Fetched VBIOS from ROM BAR
		[    1.663363] amdgpu: ATOM BIOS: 113-CEZANNE-018
		[    1.664115] [drm] VCN decode is enabled in VM mode
		[    1.664117] [drm] VCN encode is enabled in VM mode
		[    1.664118] [drm] JPEG decode is enabled in VM mode
		[    1.664147] [drm] vm size is 262144 GB, 4 levels, block size is 9-bit, fragment size is 9-bit
		[    1.664153] amdgpu 0000:30:00.0: amdgpu: VRAM: 512M 0x000000F400000000 - 0x000000F41FFFFFFF (512M used)
		[    1.664155] amdgpu 0000:30:00.0: amdgpu: GART: 1024M 0x0000000000000000 - 0x000000003FFFFFFF
		[    1.664156] amdgpu 0000:30:00.0: amdgpu: AGP: 267419648M 0x000000F800000000 - 0x0000FFFFFFFFFFFF
		[    1.664161] [drm] Detected VRAM RAM=512M, BAR=512M
		[    1.664162] [drm] RAM width 128bits DDR4
		[    1.664200] [drm] amdgpu: 512M of VRAM memory ready
		[    1.664201] [drm] amdgpu: 3072M of GTT memory ready.
		[    1.664206] [drm] GART: num cpu pages 262144, num gpu pages 262144
		[    1.664285] [drm] PCIE GART of 1024M enabled.
		[    1.664286] [drm] PTB located at 0x000000F400900000
		[    1.668403] amdgpu 0000:30:00.0: amdgpu: PSP runtime database doesn't exist
		[    1.684148] [drm] Loading DMUB firmware via PSP: version=0x01010019
		[    1.699355] [drm] Found VCN firmware Version ENC: 1.14 DEC: 5 VEP: 0 Revision: 20
		[    1.699368] amdgpu 0000:30:00.0: amdgpu: Will use PSP to load VCN firmware
		[    2.119364] nvidia 0000:10:00.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=none
		[    2.371596] [drm] [nvidia-drm] [GPU ID 0x00001000] Loading driver
		[    2.425174] [drm] reserve 0x400000 from 0xf41f800000 for PSP TMR
		[    2.506778] amdgpu 0000:30:00.0: amdgpu: RAS: optional ras ta ucode is not available
		[    2.515189] amdgpu 0000:30:00.0: amdgpu: RAP: optional rap ta ucode is not available
		[    2.515191] amdgpu 0000:30:00.0: amdgpu: SECUREDISPLAY: securedisplay ta ucode is not available
		[    2.515540] amdgpu 0000:30:00.0: amdgpu: SMU is initialized successfully!
		[    2.516855] [drm] kiq ring mec 2 pipe 1 q 0
		[    2.517561] [drm] Display Core initialized with v3.2.141!
		[    2.517981] [drm] DMUB hardware initialized: version=0x01010019
		[    2.577117] [drm] VCN decode and encode initialized successfully(under DPG Mode).
		[    2.577132] [drm] JPEG decode initialized successfully.
		[    2.578072] kfd kfd: amdgpu: Allocated 3969056 bytes on gart
		[    2.707339] amdgpu: HMM registered 512MB device memory
		[    2.707361] amdgpu: SRAT table not found
		[    2.707361] amdgpu: Virtual CRAT table created for GPU
		[    2.708098] amdgpu: Topology: Add dGPU node [0x1638:0x1002]
		[    2.708103] kfd kfd: amdgpu: added device 1002:1638
		[    2.708170] amdgpu 0000:30:00.0: amdgpu: SE 1, SH per SE 2, CU per SH 18, active_cu_number 27
		[    2.709057] [drm] fb mappable at 0x90CD2000
		[    2.709059] [drm] vram apper at 0x90000000
		[    2.709059] [drm] size 14745600
		[    2.709059] [drm] fb depth is 24
		[    2.709060] [drm]    pitch is 10240
		[    2.896150] fbcon: amdgpu (fb0) is primary device
		[    3.000331] amdgpu 0000:30:00.0: [drm] fb0: amdgpu frame buffer device
		[    3.009001] amdgpu 0000:30:00.0: amdgpu: ring gfx uses VM inv eng 0 on hub 0
		[    3.009004] amdgpu 0000:30:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng 1 on hub 0
		[    3.009006] amdgpu 0000:30:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng 4 on hub 0
		[    3.009006] amdgpu 0000:30:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng 5 on hub 0
		[    3.009007] amdgpu 0000:30:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng 6 on hub 0
		[    3.009008] amdgpu 0000:30:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng 7 on hub 0
		[    3.009009] amdgpu 0000:30:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng 8 on hub 0
		[    3.009010] amdgpu 0000:30:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng 9 on hub 0
		[    3.009010] amdgpu 0000:30:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng 10 on hub 0
		[    3.009011] amdgpu 0000:30:00.0: amdgpu: ring kiq_2.1.0 uses VM inv eng 11 on hub 0
		[    3.009012] amdgpu 0000:30:00.0: amdgpu: ring sdma0 uses VM inv eng 0 on hub 1
		[    3.009013] amdgpu 0000:30:00.0: amdgpu: ring vcn_dec uses VM inv eng 1 on hub 1
		[    3.009014] amdgpu 0000:30:00.0: amdgpu: ring vcn_enc0 uses VM inv eng 4 on hub 1
		[    3.009015] amdgpu 0000:30:00.0: amdgpu: ring vcn_enc1 uses VM inv eng 5 on hub 1
		[    3.009016] amdgpu 0000:30:00.0: amdgpu: ring jpeg_dec uses VM inv eng 6 on hub 1
		[    3.155840] [drm] Initialized nvidia-drm 0.0.0 20160202 for 0000:10:00.0 on minor 1
		[    3.156216] [drm] Initialized amdgpu 3.42.0 20150101 for 0000:30:00.0 on minor 0
		[    4.598742] systemd[1]: Finished dracut initqueue hook.
		[    5.043799] systemd[1]: dracut-initqueue.service: Deactivated successfully.
		[    5.043873] systemd[1]: Stopped dracut initqueue hook.
		[   10.007951] systemd[1]: Starting Load Kernel Module drm...
		[   10.170619] systemd[1]: modprobe@drm.service: Deactivated successfully.
		[   10.170718] systemd[1]: Finished Load Kernel Module drm.
		[   13.750415] snd_hda_intel 0000:10:00.1: Handle vga_switcheroo audio client
		[   13.750632] snd_hda_intel 0000:30:00.1: Handle vga_switcheroo audio client
		[   13.879276] snd_hda_intel 0000:30:00.1: bound 0000:30:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])


Is that kernel/modconfig config incorrect?
Not relevant to the problem?
Something else(where) needed?

