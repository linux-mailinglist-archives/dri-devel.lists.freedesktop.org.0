Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB597716CD
	for <lists+dri-devel@lfdr.de>; Sun,  6 Aug 2023 23:41:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C073410E121;
	Sun,  6 Aug 2023 21:40:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 552 seconds by postgrey-1.36 at gabe;
 Sun, 06 Aug 2023 21:40:45 UTC
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458D310E03C;
 Sun,  6 Aug 2023 21:40:44 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 519D440E0191; 
 Sun,  6 Aug 2023 21:31:26 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3EDwEU3EFcvT; Sun,  6 Aug 2023 21:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1691357482; bh=OHjEeMmC5x4CkjeCMWYqJriYnSyVlai4d9bbKiPobp4=;
 h=Date:From:To:Cc:Subject:From;
 b=d/z26m2e7e/lDCZ3wj37vbzo+kv2qdHmJc7GxvZOJDNyKQDjyhemot+kwfL9HYg8m
 u3R/nn6N+kr9sHv57rum4fg5ifmO1LIskRC6lQi/jdPuD6tU07DRsJDV8CyqYZdAEk
 1b4pAjtjfXw1iKnqP7nMEXG+fSkXB396wf0alOllFY8+OlHITUxtZP5RSgU2ld15on
 lK2C8I77s1xO5LKv4DXGBkVvMkPmRXXAuvvdzPQrNAZ2Hh8VOTIlABSBmv3dKWf/vD
 O5WfIZ+9ptn91dU5kVh/2FB+osJC8QiO3i58yMRJusOB9RjuECVXwU6inDfcli9FUE
 US5BMLab/Kdx8yf05d6sCVUPxWzBO69binPhoC+IVTzmkbbd10xhx5gzNAYfSZsFj1
 8ezu1/c9nHFYZ+Ta5tyOj8ZuaB/0EGKhU+0g+S5GWl2jkQcUPTxJCPRmS6mw9D4Bch
 RG6EiSRDkWLErTZViRFxqjpwsR6V6cqdF2PQMMx4AITDlR/j7DoWlpe6ddQU3l9npS
 b+rhWBa+cCqFAMNIwR0/wSzjScWoQPnWkSKkbOEnlNM62dBSh51a83NCK5OomAyJ0E
 mvQCQnJmB+kv9JCofsoFPnOBB9RRJy/PZV5pecAnSvTELgOLiKXZKPwIPalu7GJETF
 xnwrOu0KFovZNPMO8upiOF3I=
Received: from zn.tnic (pd9530d32.dip0.t-ipconnect.de [217.83.13.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B9CFF40E018F;
 Sun,  6 Aug 2023 21:31:13 +0000 (UTC)
Date: Sun, 6 Aug 2023 23:31:07 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>
Subject: 2b5d1c29f6c4 ("drm/nouveau/disp: PIOR DP uses GPIO for HPD, not PMGR
 AUX interrupts")
Message-ID: <20230806213107.GFZNARG6moWpFuSJ9W@fat_crate.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: nouveau@lists.freedesktop.org, lkml <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, regressions@leemhuis.info
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi folks,

the patch in $Subject breaks booting here on one of my test boxes, see
below.

Reverting it ontop of -rc4 fixes the issue.

Thx.

[    3.580535] ACPI: \_PR_.CP04: Found 4 idle states
[    3.585694] ACPI: \_PR_.CP05: Found 4 idle states
[    3.590852] ACPI: \_PR_.CP06: Found 4 idle states
[    3.596037] ACPI: \_PR_.CP07: Found 4 idle states
[    3.644065] Freeing initrd memory: 6740K
[    3.742932] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    3.750409] 00:05: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
[    3.762111] serial 0000:00:16.3: enabling device (0000 -> 0003)
[    3.771589] 0000:00:16.3: ttyS1 at I/O 0xf0a0 (irq = 17, base_baud = 115200) is a 16550A
[    3.782503] Linux agpgart interface v0.103
[    3.787805] ACPI: bus type drm_connector registered

<--- boot stops here.

It should continue with this:

[    3.795491] Console: switching to colour dummy device 80x25
[    3.801933] nouveau 0000:03:00.0: vgaarb: deactivate vga console
[    3.808303] nouveau 0000:03:00.0: NVIDIA GT218 (0a8c00b1)
[    3.931002] nouveau 0000:03:00.0: bios: version 70.18.83.00.08
[    3.941731] nouveau 0000:03:00.0: fb: 512 MiB DDR3
[    4.110348] tsc: Refined TSC clocksource calibration: 3591.349 MHz
[    4.116627] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x33c466a1ab5, max_idle_ns: 440795209767 ns
[    4.126871] clocksource: Switched to clocksource tsc
[    4.252013] nouveau 0000:03:00.0: DRM: VRAM: 512 MiB
[    4.257088] nouveau 0000:03:00.0: DRM: GART: 1048576 MiB
[    4.262501] nouveau 0000:03:00.0: DRM: TMDS table version 2.0
[    4.268333] nouveau 0000:03:00.0: DRM: DCB version 4.0
[    4.273561] nouveau 0000:03:00.0: DRM: DCB outp 00: 02000360 00000000
[    4.280104] nouveau 0000:03:00.0: DRM: DCB outp 01: 02000362 00020010
[    4.286630] nouveau 0000:03:00.0: DRM: DCB outp 02: 028003a6 0f220010
[    4.293176] nouveau 0000:03:00.0: DRM: DCB outp 03: 01011380 00000000
[    4.299711] nouveau 0000:03:00.0: DRM: DCB outp 04: 08011382 00020010
[    4.306243] nouveau 0000:03:00.0: DRM: DCB outp 05: 088113c6 0f220010
[    4.312772] nouveau 0000:03:00.0: DRM: DCB conn 00: 00101064
[    4.318520] nouveau 0000:03:00.0: DRM: DCB conn 01: 00202165
[    4.329488] nouveau 0000:03:00.0: DRM: MM: using COPY for buffer copies
[    4.336261] stackdepot: allocating hash table of 1048576 entries via kvcalloc
...


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
