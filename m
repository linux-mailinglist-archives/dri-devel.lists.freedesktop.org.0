Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C8A3274FD
	for <lists+dri-devel@lfdr.de>; Sun, 28 Feb 2021 23:56:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEEF6E435;
	Sun, 28 Feb 2021 22:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2650E89FEA
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Feb 2021 17:11:58 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id a22so23795763ejv.9
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Feb 2021 09:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dfQ46OGWItLgoKPUR/Czwfd0qqTUSj25+jf5yrElG/4=;
 b=GzeA/aDB2UBhnNVhm++I/Jk3Up7Sjll8FWko6UUVrR8GbwUj6tdWvj7U7T3p1JnaWE
 tuDT5n8KyfWwgonEFcDAlbP9Wnm/lzI5ynLZd5zXrmZLcqy0e5qJFV+Ury6tgPUdhcIC
 ZnUpySrUVv3A0oExsLsVOkNej6wDTO/NVed1e1lRxfeovoJIixufVCuML3LKRgEXHaK6
 AQIpA41ncR2vIctG/YIpRBR7PPh4Vs9caRlig7rCLuPUPKUXlteysI6kNYwN/3Yc//ci
 tD2NQsug/MYd9mQ+dWSVvw0ZV+w1YK/V6hQL8df04yN35+nWGaht76tutf0kiQ1Fxgq5
 E6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dfQ46OGWItLgoKPUR/Czwfd0qqTUSj25+jf5yrElG/4=;
 b=GfDitwpA7oayiv+0izbZC13vZ0q9ekxU4k9VmyT5G6YsGfT3Hygh5u7xabfxerJ5zI
 3FTfY4oef0117+caMfFp7yD14ypLVpT5XE3+0LnJNJAn6GEzg7S4z0w6M84Nc2Ukjh37
 W9OhzEhur2kylziAWesvOgvcbtxcVK88TpJFVmYjZFY1UTXH1u0RoZls/J9blhfyejpM
 W0lhnFrmezi7JuGDlMW8BgvFVkGGRHiNC6+DjW6WXc1LX57bGjQyEI1KRlWm7yxtEcRj
 392cOCLTVs0HBAcT3fhyv0T9QzEDzq1HzSRn7tU2qURgZuDGSAJ0ild/HgAHvlwpNaVp
 P2cw==
X-Gm-Message-State: AOAM532OW3aaEC4gf1TQMtzjvAkaLSoWn2zI6nk/AJ9r+9zAwjqh5tG+
 q6WdZXxaqrARU5KVqCL1GQ==
X-Google-Smtp-Source: ABdhPJw5sLbCUCcgxkhNvC6IgO3vmNaTgOeasYPBEho60Poa4WNRXoZ/cPiXNkLCHgbgyBJUziViqw==
X-Received: by 2002:a17:906:acb:: with SMTP id
 z11mr3855755ejf.193.1614532316774; 
 Sun, 28 Feb 2021 09:11:56 -0800 (PST)
Received: from localhost.localdomain ([46.53.249.223])
 by smtp.gmail.com with ESMTPSA id fw3sm6654338ejb.82.2021.02.28.09.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 09:11:56 -0800 (PST)
Date: Sun, 28 Feb 2021 20:11:54 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org, linux-arch@vger.kernel.org
Subject: [PATCH 12/11] pragma once: scripted treewide conversion
Message-ID: <YDvO2kmidKZaK26j@localhost.localdomain>
References: <YDvLYzsGu+l1pQ2y@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YDvLYzsGu+l1pQ2y@localhost.localdomain>
X-Mailman-Approved-At: Sun, 28 Feb 2021 22:56:33 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[  Bcc a lot of lists so that people understand what's this is all         ]
[  about without creating uber-cc-thread.                                  ]
[  Apologies if I missed your subsystem                                    ]
[  Please see [PATCH 11/11: pragma once: conversion script (in Python 2)]  ]

Hi, Linus.

Please run the script below from top-level directory, it will convert
most kernel headers to #pragma once directive advancing them into
21-st century.

The advantages are:

* less LOC

	18087 files changed, 18878 insertions(+), 99804 deletions(-)
	= -81 kLOC (give or take)

* less mental tax on developers forced to name things which aren't even
  real code

* less junk in preprocessor hashtables and editors/IDEs autocompletion
  lists

There are two bit exceptions: UAPI headers and ACPICA.
Given ubiquity of #pragma once, I personally think even these subsystems
should be converted in the future.

Compile tested on alpha, arc, arm, arm64, h8300, ia64, m68k, microblaze,
mips, nios2, parisc, powerpc, riscv, s390, sh, sparc, um-i386, um-x86_64,
i386, x86_64, xtensa (allnoconfig, all defconfigs, allmodconfig with or
without SMP/DEBUG_KERNEL + misc stuff).

Not compile tested on csky, hexagon, nds32, openrisc. 

Love,
	Alexey

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>



#!/bin/sh -x
find . -type f -name '*.h' -print	|\
LC_ALL=C sort				|\
sed -e 's#^./##g'			|\
xargs ./scripts/pragma-once.py

find . -type d -name 'uapi' | xargs git checkout -f
git checkout -f arch/alpha/include/asm/cmpxchg.h
git checkout -f arch/arm/mach-imx/hardware.h
git checkout -f arch/arm/mach-ixp4xx/include/mach/hardware.h
git checkout -f arch/arm/mach-sa1100/include/mach/hardware.h
git checkout -f arch/mips/include/asm/mips-cps.h
git checkout -f arch/x86/boot/boot.h
git checkout -f arch/x86/boot/ctype.h
git checkout -f arch/x86/include/asm/cpufeatures.h
git checkout -f arch/x86/include/asm/disabled-features.h
git checkout -f arch/x86/include/asm/required-features.h
git checkout -f arch/x86/include/asm/vmxfeatures.h
git checkout -f arch/x86/include/asm/vvar.h
git checkout -f drivers/acpi/acpica/
git checkout -f drivers/gpu/drm/amd/pm/inc/vega10_ppsmc.h
git checkout -f drivers/gpu/drm/amd/pm/powerplay/ppsmc.h
git checkout -f drivers/input/misc/yealink.h
git checkout -f drivers/media/usb/dvb-usb-v2/mxl111sf-demod.h
git checkout -f drivers/media/usb/dvb-usb-v2/mxl111sf-tuner.h
git checkout -f drivers/pcmcia/yenta_socket.h
git checkout -f drivers/staging/rtl8723bs/include/hal_com_h2c.h
git checkout -f include/linux/acpi.h
git checkout -f include/linux/bitops.h
git checkout -f include/linux/compiler_types.h
git checkout -f include/linux/device.h
git checkout -f include/linux/kbuild.h
git checkout -f include/linux/libfdt_env.h
git checkout -f include/linux/local_lock.h
git checkout -f include/linux/spinlock.h
git checkout -f include/linux/spinlock_api_smp.h
git checkout -f include/linux/spinlock_types.h
git checkout -f include/linux/tracepoint.h
git checkout -f mm/gup_test.h
git checkout -f net/batman-adv/main.h
git checkout -f scripts/dtc/
git checkout -f tools/include/linux/bitops.h
git checkout -f tools/include/linux/compiler.h
git checkout -f tools/testing/selftests/clone3/clone3_selftests.h
git checkout -f tools/testing/selftests/futex/include/atomic.h
git checkout -f tools/testing/selftests/futex/include/futextest.h
git checkout -f tools/testing/selftests/futex/include/logging.h
git checkout -f tools/testing/selftests/kselftest.h
git checkout -f tools/testing/selftests/kselftest_harness.h
git checkout -f tools/testing/selftests/pidfd/pidfd.h
git checkout -f tools/testing/selftests/x86/helpers.h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
