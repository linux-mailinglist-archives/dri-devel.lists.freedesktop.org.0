Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFC15A38B6
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 18:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A6E10E579;
	Sat, 27 Aug 2022 16:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D195A10E15F
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Aug 2022 16:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zPmPnNZPACtq5NG+tqbATF9Mb19lHqa2VFl/1U7+gUI=; b=AhPD18DZbKKJmlXMNxIYTfrKst
 fKssAO+7MzubKlPMFGuayViwHzeZwzg205Psce9ksNdiy6+qfNCeGKOpR49vwuKOgaYbarbLYTnj/
 kdBEjjfXv+Vpr8DpdQmt+LSGIFgsKlRBmPAzRx6BuSJE56vz6mfeXEwX//wj+aRCUeBIgBDAZ2b7U
 hiLQAOPSQGKpW7+ag68TV6M5WSpZQRLFxmIeRDr7F2rLHKau4LNPnAPbZgWYKttqYW0H8OQ/an1uk
 giISumJkudveqD5XeevSpJuj/s943fJQz/ZRYMcpmmskNh0NDu8/5Ak5FtWtYahTrcXGLxH5zJ2ns
 y5BdY1uw==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=65252)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oRyPV-0003Mx-Q9; Sat, 27 Aug 2022 18:11:49 +0200
Message-ID: <3da6e58f-1e23-7106-abf2-206af0fabc13@tronnes.org>
Date: Sat, 27 Aug 2022 18:11:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 00/35] drm: Analog TV Improvements
To: Dom Cobley <dom@raspberrypi.com>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <987d6114-5fcb-d668-3b0d-ad6d8723dfdb@tronnes.org>
 <20220822074800.qzyctchqn5usr55g@houat>
 <9a15b1cf-692c-1b0d-02a6-316cbd954525@gmail.com>
 <20220825155506.wqurh5r752qfufqs@houat>
 <18737c8a-78f4-5b9f-aea2-588bc65c13d9@gmail.com>
 <9d9ba040-99d7-25cb-ba10-1c132d7f7663@gmail.com>
 <CANUESCG22TrxasYoE2U0OJ7TVzNAcs_9zkuAfBQfZrEbM4h9dg@mail.gmail.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <CANUESCG22TrxasYoE2U0OJ7TVzNAcs_9zkuAfBQfZrEbM4h9dg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 Mateusz Kwiatkowski <kfyatek@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Ripard <maxime@cerno.tech>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 26.08.2022 16.56, skrev Dom Cobley:
> On Fri, 26 Aug 2022 at 05:08, Mateusz Kwiatkowski <kfyatek@gmail.com> wrote:
>> - Commenting out the pm_runtime_put() / pm_runtime_get_sync() calls in vc4_vec.c
>> - Reverting this PR by Dom Cobley a.k.a. popcornmix:
>>    https://github.com/raspberrypi/linux/pull/4639
>>
>> Either of these approaches makes VEC mode switching work again. Obviously
>> neither is appropriate for a permanent solution.
> 
> Might be worth trying the latest rpi-update firmware.
> There was a change that affects restoring PIXEL/VEC clocks after a
> power domain cycle.
> There is also a fix for a USB boot breakage.
> 

That firmware gives me firmware timeout references in the 5 attempts
I've done.

My first attempt gave me this:

[  112.454982] WARNING: CPU: 2 PID: 855 at
drivers/firmware/raspberrypi.c:63 rpi_firmware_property_list+0x204/0x270
[  112.466985] Firmware transaction timeout
...
[  112.533740]  warn_slowpath_fmt from
rpi_firmware_property_list+0x204/0x270
[  112.541449]  rpi_firmware_property_list from
rpi_firmware_property+0x68/0x94
[  112.549326]  rpi_firmware_property from
raspberrypi_clock_property+0x50/0x84
[  112.557197]  raspberrypi_clock_property from
raspberrypi_fw_set_rate+0x4c/0xc4
[  112.565242]  raspberrypi_fw_set_rate from clk_change_rate+0x16c/0x6f8
[  112.572502]  clk_change_rate from clk_core_set_rate_nolock+0x1c4/0x2a4
[  112.579857]  clk_core_set_rate_nolock from
clk_set_rate_range.part.0+0x128/0x2ac
[  112.588091]  clk_set_rate_range.part.0 from
vc4_atomic_commit_tail+0x2b4/0x854 [vc4]
[  112.596832]  vc4_atomic_commit_tail [vc4] from commit_tail+0xa4/0x19c
[  112.604269]  commit_tail from drm_atomic_helper_commit+0x16c/0x194
[  112.611279]  drm_atomic_helper_commit from drm_atomic_commit+0xb4/0xec
[  112.618625]  drm_atomic_commit from drm_mode_atomic_ioctl+0x8f0/0xb6c
[  112.625877]  drm_mode_atomic_ioctl from drm_ioctl_kernel+0xcc/0x170
[  112.632950]  drm_ioctl_kernel from drm_ioctl+0x1d8/0x374
[  112.639056]  drm_ioctl from sys_ioctl+0xe4/0xbac
[  112.644462]  sys_ioctl from ret_fast_syscall+0x0/0x1c
...
[  112.726171] raspberrypi-clk soc:firmware:clocks: Failed to change
fw-clk-core frequency: -110

I've also done one with drm debug enabled.
Kernel messages:
https://gist.github.com/notro/53afe9fdc3d0afbf0fb12678be1ab377

Dom, in case you want to debug this I've uploaded a rpi-update'able
archive plus config.txt and cmdline.txt.
There are some custom overlays in there that are needed.

Kernel: tronnes.org/downloads/vec-kernel-2022-08-27.gz
Build/setup info from another post:
https://gist.github.com/notro/41c59d77c3022dc6d931d4f9547c4ea6

I've tried this on another Pi4 (same revision: c03111) as well to rule
out any hw issues. The first attempt also gave me an mmc fault (no dmesg
-w) and the second one (dmesg -w) gave me the timeout.

Noralf.
