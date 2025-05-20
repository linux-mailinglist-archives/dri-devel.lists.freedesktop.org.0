Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCA5ABED5D
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 09:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D0C10E131;
	Wed, 21 May 2025 07:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=helsinkinet.fi header.i=@helsinkinet.fi header.b="Pb1KliAz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 360 seconds by postgrey-1.36 at gabe;
 Wed, 21 May 2025 00:06:04 UTC
Received: from smtp.dnamail.fi (sender103.dnamail.fi [83.102.40.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6977A10E5BE
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 00:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp.dnamail.fi (Postfix) with ESMTP id 87CAE4098E96;
 Wed, 21 May 2025 02:59:54 +0300 (EEST)
X-Virus-Scanned: X-Virus-Scanned: amavis at smtp.dnamail.fi
Received: from smtp.dnamail.fi ([83.102.40.157])
 by localhost (dmail-psmtp02.s.dnaip.fi [127.0.0.1]) (amavis, port 10024)
 with ESMTP id Oi42qBaa9nU8; Wed, 21 May 2025 02:59:53 +0300 (EEST)
Received: from [192.168.101.100] (87-92-86-78.bb.dnainternet.fi [87.92.86.78])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: oak@dnamail.internal)
 by smtp.dnamail.fi (Postfix) with ESMTPSA id 36C934098E90;
 Wed, 21 May 2025 02:59:53 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.dnamail.fi 36C934098E90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=helsinkinet.fi;
 s=2025-03; t=1747785593;
 bh=SWDuj3wmUThUE9hYxR5T+9uZspPMegALAiwkNnCzcYE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Pb1KliAzX0YnTYAA7m9qhy5aGHznqESOQjat2y9q3uh5+UWbxb7wOwiSi4QThRPzU
 BkDTWgsp2Lpv7aW9Mj83c2yKXYgdRSrNuNVQNHGkburPjR8Ig/q804AGmDRYSPMTPv
 c0fv92CCzuCMhy479HEXwZALiMrqtajfaOYkgaG67QJnOvrYXyWeGWQEdxaHJ2Uy52
 jXwYJ9glLAUANK9cFczKim9J1W2DByKDKOfUS10zRnP38nNc8zTwHJuoCtwMoedw7g
 HQ7aSfL36jsROj5bISFD3DNxLwhra/zh7hc38wDldv/xPf65AMfqwf+84Dr8kuMz1U
 7oFaA6JE5usIA==
Message-ID: <74946b31-6166-44b0-b2a7-b0633f014b60@helsinkinet.fi>
Date: Wed, 21 May 2025 02:59:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/RFC 0/3] Atari DRM driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Michael Schmitz <schmitzmic@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-m68k@vger.kernel.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <cover.1669406380.git.geert@linux-m68k.org>
 <a9883a81-d909-09c5-708b-d598e030380e@physik.fu-berlin.de>
 <CAMuHMdWHUnWBN7ddBow+fqmt8W--9wFe5x_YMeRg7GQ=BNAL2Q@mail.gmail.com>
Content-Language: en-US
From: Eero Tamminen <oak@helsinkinet.fi>
In-Reply-To: <CAMuHMdWHUnWBN7ddBow+fqmt8W--9wFe5x_YMeRg7GQ=BNAL2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 21 May 2025 07:57:38 +0000
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

Hi Geert,

On 23.1.2023 17.10, Geert Uytterhoeven wrote:
> On Mon, Jan 23, 2023 at 4:09 PM John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de> wrote:
>> On 11/25/22 21:31, Geert Uytterhoeven wrote:
>>> This RFC patch series adds a DRM driver for the good old Atari
>>> ST/TT/Falcon hardware.  It was developed and tested (only) on the ARAnyM
>>> emulator.
>>
>> I just remembered this WIP driver. Has there been any progress?
> 
> So far no further progress.

I tried your "atari-drm-wip-v1" branch commits on top of 6.14.

After some minor changes those applied. Getting it to build required 
adding "&shadow_plane_state->fmtcnv_state" (struct drm_format_conv_state 
*) argument to *_blit() functions in atari_drm.c, and changing:
	drm_fbdev_generic_setup(dev, dev->mode_config.preferred_depth);
in its probe function to:
	struct drm_format_info *format = NULL;
         drm_client_setup(dev, format);

However, the result is not working very well yet.

Driver gets initialized fine under Hatari TT emulation:
-------------------------
atafb atafb: phys_screen_base 511000 screen_len 311296
atafb atafb: Determined 1280x960, depth 1
atafb atafb:    virtual 1280x1945
Console: switching to mono frame buffer device 160x60
fb0: frame buffer device, using 304K of video memory
...
atari_drm atari_drm: phys_screen_base 55d000 screen_len 311296
atari_drm atari_drm: Determined 1280x960, depth 1
atari_drm atari_drm:    virtual 1280x1945
[drm] Initialized atari_drm 1.0.0 for atari_drm on minor 0
atari_drm atari_drm: Atari DRM, using 304K of video memory
-------------------------

However, once screen switches from "atafb" to "atari_drm" driver, Linux 
boot logo & texts disappear, and (emulated) screen is either all white 
(on mono monitor) or all black (on VGA & RGGB monitors).


And while "atafb" works fine also under Falcon emulation with RGB (50Hz) 
or VGA (60Hz) monitor, "atari_drm" probing fails:
-------------------------
genirq: Flags mismatch irq 4. 00200000 (framebuffer:modeswitch) vs. 
00200000 (framebuffer:modeswitch)
CPU: 0 UID: 0 PID: 1 Comm: swapper Not tainted 
6.14.0hatari-00001-g1d98935cdfd7-dirty #4
Stack from 01029c78:
         ...
Call Trace: [<000088b0>] dump_stack+0x10/0x16
  [<0005852a>] __setup_irq+0x264/0x4a4
  [<00200000>] dma_buf_map_attachment_unlocked+0x34/0x6a
  [<00200000>] dma_buf_map_attachment_unlocked+0x34/0x6a
  [<001e874c>] falcon_vbl_switcher+0x0/0x14a
  [<00058876>] request_threaded_irq+0x10c/0x142
  [<0030fa1e>] strsep+0x0/0x36
  [<00449cfe>] atari_drm_probe+0x8ba/0xe28
  [<001e874c>] falcon_vbl_switcher+0x0/0x14a
  [<00200000>] dma_buf_map_attachment_unlocked+0x34/0x6a
  [<00042d6c>] parse_args+0x0/0x260
  [<00300c2a>] klist_next+0x0/0x8a
  [<00300c2a>] klist_next+0x0/0x8a
  [<00116d3c>] sysfs_do_create_link_sd+0x68/0x92
  [<00116d8e>] sysfs_create_link+0x28/0x3a
  [<001f2a52>] driver_sysfs_add+0x46/0x6c
  [<001f4dd0>] platform_probe+0x26/0x58
  [<001f3390>] really_probe+0xfa/0x1f8
  [<001f3296>] really_probe+0x0/0x1f8
  [<001f3558>] __driver_probe_device+0xca/0xd8
  [<00042d6c>] parse_args+0x0/0x260
  [<00300c2a>] klist_next+0x0/0x8a
  [<001f35da>] driver_probe_device+0x24/0x7c
  [<001f378a>] __driver_attach+0xca/0xda
  [<00300c2a>] klist_next+0x0/0x8a
  [<001f2156>] bus_for_each_dev+0x64/0x8a
  [<001f2d24>] driver_attach+0x1a/0x1e
  [<001f36c0>] __driver_attach+0x0/0xda
  [<001f270c>] bus_add_driver+0x9a/0x188
  [<001f3e66>] driver_register+0xa6/0xe4
  [<0044a790>] __platform_driver_probe+0x6c/0xa4
  [<004493ee>] atari_drm_init+0x0/0x56
  [<0044943c>] atari_drm_init+0x4e/0x56
  [<00449444>] atari_drm_probe+0x0/0xe28
  [<00437578>] do_one_initcall+0x5a/0x164
  [<0030f7e4>] strcpy+0x0/0x22
  [<00042d6c>] parse_args+0x0/0x260
  [<00060006>] __timer_delete_sync+0x38/0x6a
  [<00437820>] kernel_init_freeable+0x13e/0x198
  [<00437876>] kernel_init_freeable+0x194/0x198
  [<004493ee>] atari_drm_init+0x0/0x56
  [<00315cac>] kernel_init+0x0/0xf4
  [<00315cc4>] kernel_init+0x18/0xf4
  [<00315cac>] kernel_init+0x0/0xf4
  [<0000934c>] ret_from_kernel_thread+0xc/0x14

atari_drm atari_drm: probe with driver atari_drm failed with error -16
-------------------------

Any ideas?


============================================================

Btw. While testing this, I noticed quite a few "atafb" issues:

It panics under Falcon with mono monitor, so I couldn't test that with 
"atari_drm":
-------------------------
Kernel panic - not syncing: can't set default video mode
-------------------------

"video=atafb:stlow" CLI arg causes probe fail on Falcon + VGA monitor 
(but works with RGB monitor, and on TT):
-------------------------
atafb atafb: probe with driver atafb failed with error -22
-------------------------

Kernel CLI argument "video=atafb:falh2" gives 16-color mode, same as 
"falh16", not 2-color one as documented (in arch/m68k/kernel-options.rst).

Monochrome Tux logo is not shown in 2-color ("vga2", "sthigh") modes, 
only in 4-color ("vga4", "stmed") ones.

On TT, requesting unsupported mode, e.g. "fal2" or "tthigh" on color 
monitor, gives lowest (320x200x4) resolution, instead of more reasonable 
one, like the 640x480x4 given under Falcon.  "ttmid" (640x480x4) would 
be more reasonable default...

On TT, console text color is blue-on-black in "sthigh" mode, instead of 
expected white-on-black (and cyan-on-black in "stmid").  I suspect this 
is because "Duochrome" mode is not handled correctly, its colors should 
be set with palette entries 254 & 255, and palette entry 0 is used just 
for inverting the screen (like on real ST-high monitor/resolution).


	- Eero

