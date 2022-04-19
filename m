Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3548B507384
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF4010F111;
	Tue, 19 Apr 2022 16:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9218210F0FF
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:44:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3A117B81BFB;
 Tue, 19 Apr 2022 16:44:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61AA5C385AD;
 Tue, 19 Apr 2022 16:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386652;
 bh=xU/U9xkTvFUXFL8Wopr4rZHXHyzXgLRf0YqQRK4Kvss=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OM0GwvoFjDTXu7F7DMTK9IAJLrdekpoJNNdqgKZOqnT0MxcJctOA38FNelxFTEIEi
 rfOkyib+5L0BuGs5gSth50JnQfK4wt3P5XbEMzwjlxtkKR2D5Fp6NSpVpT6JKLzOYa
 sUcSPu9YpMeAuC5R0d9Ntrrwz+yhMHEr/UloCY/EYZJ1RL8i+BYnDoiDTB5kDUDvsN
 cfM9amClMURurngFRlcw5eiNrdaaZ0Wt5Rgqq1W263FPZpQFgkIEKzYtsp52+Hu//Z
 ZDG5KKaetJsY/MAdjSi0qUGYxcFLyaW3uLnIWcs9gXXeXABgeTGYRt2fpOditJ3OfS
 VNvsgnrEcsb+w==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 41/48] ARM: pxa: remove unused mach/bitfield.h
Date: Tue, 19 Apr 2022 18:38:03 +0200
Message-Id: <20220419163810.2118169-42-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
MIME-Version: 1.0
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>, linux-mips@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 Tomas Cech <sleep_walker@suse.com>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, Marek Vasut <marek.vasut@gmail.com>,
 Paul Parsons <lost.distance@yahoo.com>, Sergey Lapin <slapin@ossfans.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linux-input@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 alsa-devel@alsa-project.org, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The sa1111.h header defines some constants using the bitfield
macros, but those are only used on sa1100, not on pxa, and the
users include the bitfield header through mach/hardware.h.

Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/include/asm/hardware/sa1111.h    |   2 -
 arch/arm/mach-pxa/include/mach/bitfield.h | 114 ----------------------
 2 files changed, 116 deletions(-)
 delete mode 100644 arch/arm/mach-pxa/include/mach/bitfield.h

diff --git a/arch/arm/include/asm/hardware/sa1111.h b/arch/arm/include/asm/hardware/sa1111.h
index 2e70db6f22ea..d8c6f8a99dfa 100644
--- a/arch/arm/include/asm/hardware/sa1111.h
+++ b/arch/arm/include/asm/hardware/sa1111.h
@@ -13,8 +13,6 @@
 #ifndef _ASM_ARCH_SA1111
 #define _ASM_ARCH_SA1111
 
-#include <mach/bitfield.h>
-
 /*
  * Don't ask the (SAC) DMA engines to move less than this amount.
  */
diff --git a/arch/arm/mach-pxa/include/mach/bitfield.h b/arch/arm/mach-pxa/include/mach/bitfield.h
deleted file mode 100644
index fe2ca441bc0a..000000000000
--- a/arch/arm/mach-pxa/include/mach/bitfield.h
+++ /dev/null
@@ -1,114 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- *	FILE    	bitfield.h
- *
- *	Version 	1.1
- *	Author  	Copyright (c) Marc A. Viredaz, 1998
- *	        	DEC Western Research Laboratory, Palo Alto, CA
- *	Date    	April 1998 (April 1997)
- *	System  	Advanced RISC Machine (ARM)
- *	Language	C or ARM Assembly
- *	Purpose 	Definition of macros to operate on bit fields.
- */
-
-
-
-#ifndef __BITFIELD_H
-#define __BITFIELD_H
-
-#ifndef __ASSEMBLY__
-#define UData(Data)	((unsigned long) (Data))
-#else
-#define UData(Data)	(Data)
-#endif
-
-
-/*
- * MACRO: Fld
- *
- * Purpose
- *    The macro "Fld" encodes a bit field, given its size and its shift value
- *    with respect to bit 0.
- *
- * Note
- *    A more intuitive way to encode bit fields would have been to use their
- *    mask. However, extracting size and shift value information from a bit
- *    field's mask is cumbersome and might break the assembler (255-character
- *    line-size limit).
- *
- * Input
- *    Size      	Size of the bit field, in number of bits.
- *    Shft      	Shift value of the bit field with respect to bit 0.
- *
- * Output
- *    Fld       	Encoded bit field.
- */
-
-#define Fld(Size, Shft)	(((Size) << 16) + (Shft))
-
-
-/*
- * MACROS: FSize, FShft, FMsk, FAlnMsk, F1stBit
- *
- * Purpose
- *    The macros "FSize", "FShft", "FMsk", "FAlnMsk", and "F1stBit" return
- *    the size, shift value, mask, aligned mask, and first bit of a
- *    bit field.
- *
- * Input
- *    Field     	Encoded bit field (using the macro "Fld").
- *
- * Output
- *    FSize     	Size of the bit field, in number of bits.
- *    FShft     	Shift value of the bit field with respect to bit 0.
- *    FMsk      	Mask for the bit field.
- *    FAlnMsk   	Mask for the bit field, aligned on bit 0.
- *    F1stBit   	First bit of the bit field.
- */
-
-#define FSize(Field)	((Field) >> 16)
-#define FShft(Field)	((Field) & 0x0000FFFF)
-#define FMsk(Field)	(((UData (1) << FSize (Field)) - 1) << FShft (Field))
-#define FAlnMsk(Field)	((UData (1) << FSize (Field)) - 1)
-#define F1stBit(Field)	(UData (1) << FShft (Field))
-
-
-/*
- * MACRO: FInsrt
- *
- * Purpose
- *    The macro "FInsrt" inserts a value into a bit field by shifting the
- *    former appropriately.
- *
- * Input
- *    Value     	Bit-field value.
- *    Field     	Encoded bit field (using the macro "Fld").
- *
- * Output
- *    FInsrt    	Bit-field value positioned appropriately.
- */
-
-#define FInsrt(Value, Field) \
-                	(UData (Value) << FShft (Field))
-
-
-/*
- * MACRO: FExtr
- *
- * Purpose
- *    The macro "FExtr" extracts the value of a bit field by masking and
- *    shifting it appropriately.
- *
- * Input
- *    Data      	Data containing the bit-field to be extracted.
- *    Field     	Encoded bit field (using the macro "Fld").
- *
- * Output
- *    FExtr     	Bit-field value.
- */
-
-#define FExtr(Data, Field) \
-                	((UData (Data) >> FShft (Field)) & FAlnMsk (Field))
-
-
-#endif /* __BITFIELD_H */
-- 
2.29.2

