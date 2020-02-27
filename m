Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F4117324A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 08:59:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BDA6EE24;
	Fri, 28 Feb 2020 07:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Thu, 27 Feb 2020 21:19:24 UTC
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7556E0FC
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 21:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1582838365; x=1614374365;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AZYzhno8a1AffpbwkqfiLIlm+fMZL1Dp81qcUzuHaRE=;
 b=gG7eQ/LIdYDqCu6akHV2s5DvKV4zP9YQKjur4z3SPUUH51nstbrIBfwS
 plY9U0K7PMhHvuKzAJ6RwmU1MEZQjQG/ZpdCZT74639TsBYjnGu78q1AJ
 Os3q73fcHPSrsJihgMwROLQqGFbRTrzayBx/vrN7gW8e6WNcxb38z7Szk
 GU53rSXqnu2DlA6qnFlEzsqBOU6j5e2OGNW4OidcLVmPTlRQdIIhjKi2n
 CLYOUFxpqg2DjusrelWISobIrZS8+7z/9QXICrTxRx9LLNWMn3M+b8oR8
 THeyENNFliO6Oms9YVmNjmM5kfycrbi06jciu5jUqsslALuDiNZkJrch6 w==;
IronPort-SDR: fWkXwje/p16FoY39cch1o4uBircCZ8tKvmvfmmI4ISMpHG7USjTDl3rzxdo1LME9I9dqu5eXTE
 mSfAK/3dtpGsBpNjLr4tu5NWQq4gj55fO8tL89d+x+j8/exQAtc78+HY2ZT/UVN+Xh9zDIsCjD
 HVTr9WW0K0fVQKeN9aIha+eawLx1u4LYs6ZcrmBDcgzwfaL/QxRixD0NOssQRqp++mOFiD6xbs
 4powSwP9GfirJA1Fpym4VTu9n0jgqqWw//cgR44Eo8StAST5qGoLokK5px3gEcD5CaG/dAO2HA
 jPE=
X-IronPort-AV: E=Sophos;i="5.70,493,1574092800"; d="scan'208";a="132390564"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Feb 2020 05:12:07 +0800
IronPort-SDR: y0e8j8Sz/R2sKwkYs5dxHbyvUSxjTibiisenv+dIyZLR1shGUWDknly8pCmi739Lz2OlZShjNB
 +JO2YyDywBKO4A/03Sy9hQEd/ZPQnndpxrPiSDZfTNyhg58fbjtGMaVqlT8VtI3BB9xcbQ3HNp
 2J/4FHxKfgILpMFrJDGWr9Z45LySQjfsj/76ehYMIMBxk2L8HHPt2maL3xBJZGPgTYPPb1azY/
 hUbd5+cdsDTWn1ykOJGIJkYnFSgY1fQKEN8sseL2h3uo/rFwUF4VB1wiT/ahyK5aZwJCbvYff8
 +5o9ZJ+V9lofXJF/2P0bFMi6
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2020 13:04:07 -0800
IronPort-SDR: 13dHDQuDjVqwy8bQJ4BCMMPrMoM5zJFnejUUpuHIR70QwoFMAzTZphl0K1TRDjvt+V0mHY7dIN
 2qrCH9bD+NIRABatKHGwCexrRun/O6kt8oA/zGcHQKKX595Rv+/rS4Ea1pA9iqyzrzH7m/GuSw
 lNiCDt6q370n/YxDOk1tbF4xHMpTdaq65VQNiUB1n7f8ZG5go43b6PXOiwkT3eK/xHacdX0YDt
 nMD/aHbGf8kboB85aZrMza641cM7iDDZd3i74SeIxVcubdbqLaxNjirWa8S9GNKxIRw0RVlDag
 zGg=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.158.235])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Feb 2020 13:12:06 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Subject: [PATCH] drm/bochs: Remove vga write
Date: Thu, 27 Feb 2020 13:04:54 -0800
Message-Id: <20200227210454.18217-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 28 Feb 2020 07:59:27 +0000
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
Cc: airlied@linux.ie, Khem Raj <raj.khem@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, kraxel@redhat.com,
 alistair23@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The QEMU model for the Bochs display has no VGA memory section at offset
0x400 [1]. By writing to this register Linux can create a write to
unassigned memory which depending on machine and architecture can result
in a store fault.

I don't see any reference to this address at OSDev [2] or in the Bochs
source code.

Removing this write still allows graphics to work inside QEMU with
the bochs-display.

1: https://gitlab.com/qemu-project/qemu/-/blob/master/hw/display/bochs-display.c#L264
2. https://wiki.osdev.org/Bochs_VBE_Extensions

Reported-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 drivers/gpu/drm/bochs/bochs_hw.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/bochs/bochs_hw.c b/drivers/gpu/drm/bochs/bochs_hw.c
index b615b7dfdd9d..dfb2a5363c62 100644
--- a/drivers/gpu/drm/bochs/bochs_hw.c
+++ b/drivers/gpu/drm/bochs/bochs_hw.c
@@ -10,19 +10,6 @@
 
 /* ---------------------------------------------------------------------- */
 
-static void bochs_vga_writeb(struct bochs_device *bochs, u16 ioport, u8 val)
-{
-	if (WARN_ON(ioport < 0x3c0 || ioport > 0x3df))
-		return;
-
-	if (bochs->mmio) {
-		int offset = ioport - 0x3c0 + 0x400;
-		writeb(val, bochs->mmio + offset);
-	} else {
-		outb(val, ioport);
-	}
-}
-
 static u16 bochs_dispi_read(struct bochs_device *bochs, u16 reg)
 {
 	u16 ret = 0;
@@ -217,8 +204,6 @@ void bochs_hw_setmode(struct bochs_device *bochs,
 			 bochs->xres, bochs->yres, bochs->bpp,
 			 bochs->yres_virtual);
 
-	bochs_vga_writeb(bochs, 0x3c0, 0x20); /* unblank */
-
 	bochs_dispi_write(bochs, VBE_DISPI_INDEX_ENABLE,      0);
 	bochs_dispi_write(bochs, VBE_DISPI_INDEX_BPP,         bochs->bpp);
 	bochs_dispi_write(bochs, VBE_DISPI_INDEX_XRES,        bochs->xres);
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
