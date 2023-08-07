Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51355771D70
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 11:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1503E10E1E5;
	Mon,  7 Aug 2023 09:50:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B88B10E1E4;
 Mon,  7 Aug 2023 09:49:59 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1qSws7-0002ny-VN; Mon, 07 Aug 2023 11:49:56 +0200
Message-ID: <bb2f2c69-4dca-571a-3405-963dfb18d382@leemhuis.info>
Date: Mon, 7 Aug 2023 11:49:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 2b5d1c29f6c4 ("drm/nouveau/disp: PIOR DP uses GPIO for HPD, not
 PMGR AUX interrupts")
Content-Language: en-US, de-DE
To: Borislav Petkov <bp@alien8.de>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>
References: <20230806213107.GFZNARG6moWpFuSJ9W@fat_crate.local>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20230806213107.GFZNARG6moWpFuSJ9W@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1691401799;
 cbbf041d; 
X-HE-SMSGID: 1qSws7-0002ny-VN
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
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 nouveau@lists.freedesktop.org, lkml <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 06.08.23 23:31, Borislav Petkov wrote:
> 
> the patch in $Subject

Side note, in case anyone cares: it was also included in 6.4.7.

> breaks booting here on one of my test boxes, see
> below.
> 
> Reverting it ontop of -rc4 fixes the issue.
> 
> Thx.

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced 2b5d1c29f6c4
#regzbot title drm/nouveau: stopped booting
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (the parent of this mail). See page linked in footer for
details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

> [    3.580535] ACPI: \_PR_.CP04: Found 4 idle states
> [    3.585694] ACPI: \_PR_.CP05: Found 4 idle states
> [    3.590852] ACPI: \_PR_.CP06: Found 4 idle states
> [    3.596037] ACPI: \_PR_.CP07: Found 4 idle states
> [    3.644065] Freeing initrd memory: 6740K
> [    3.742932] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
> [    3.750409] 00:05: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
> [    3.762111] serial 0000:00:16.3: enabling device (0000 -> 0003)
> [    3.771589] 0000:00:16.3: ttyS1 at I/O 0xf0a0 (irq = 17, base_baud = 115200) is a 16550A
> [    3.782503] Linux agpgart interface v0.103
> [    3.787805] ACPI: bus type drm_connector registered
> 
> <--- boot stops here.
> 
> It should continue with this:
> 
> [    3.795491] Console: switching to colour dummy device 80x25
> [    3.801933] nouveau 0000:03:00.0: vgaarb: deactivate vga console
> [    3.808303] nouveau 0000:03:00.0: NVIDIA GT218 (0a8c00b1)
> [    3.931002] nouveau 0000:03:00.0: bios: version 70.18.83.00.08
> [    3.941731] nouveau 0000:03:00.0: fb: 512 MiB DDR3
> [    4.110348] tsc: Refined TSC clocksource calibration: 3591.349 MHz
> [    4.116627] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x33c466a1ab5, max_idle_ns: 440795209767 ns
> [    4.126871] clocksource: Switched to clocksource tsc
> [    4.252013] nouveau 0000:03:00.0: DRM: VRAM: 512 MiB
> [    4.257088] nouveau 0000:03:00.0: DRM: GART: 1048576 MiB
> [    4.262501] nouveau 0000:03:00.0: DRM: TMDS table version 2.0
> [    4.268333] nouveau 0000:03:00.0: DRM: DCB version 4.0
> [    4.273561] nouveau 0000:03:00.0: DRM: DCB outp 00: 02000360 00000000
> [    4.280104] nouveau 0000:03:00.0: DRM: DCB outp 01: 02000362 00020010
> [    4.286630] nouveau 0000:03:00.0: DRM: DCB outp 02: 028003a6 0f220010
> [    4.293176] nouveau 0000:03:00.0: DRM: DCB outp 03: 01011380 00000000
> [    4.299711] nouveau 0000:03:00.0: DRM: DCB outp 04: 08011382 00020010
> [    4.306243] nouveau 0000:03:00.0: DRM: DCB outp 05: 088113c6 0f220010
> [    4.312772] nouveau 0000:03:00.0: DRM: DCB conn 00: 00101064
> [    4.318520] nouveau 0000:03:00.0: DRM: DCB conn 01: 00202165
> [    4.329488] nouveau 0000:03:00.0: DRM: MM: using COPY for buffer copies
> [    4.336261] stackdepot: allocating hash table of 1048576 entries via kvcalloc
> ...
> 
> 
