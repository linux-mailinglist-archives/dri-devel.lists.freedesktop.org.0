Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 655D390C449
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 09:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1861710E5AE;
	Tue, 18 Jun 2024 07:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="XrwjtL/i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983AF10E3F2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 14:28:24 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4W2sgX1DfyzDqfq;
 Mon, 17 Jun 2024 14:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1718634504; bh=P/NrncKQR4tv9oXaIUeKT1Nf/NY6cRVCw7zAn/4OBNI=;
 h=From:To:Subject:Date:From;
 b=XrwjtL/iln3NR2iQzbx77hmYVMi4RnePeEXTPlRDM+86BX8uj9GI57V1lqlXNfSUp
 NU702EoCYOSam/Q/FV6XR9qK3TikLVHodbjpLb4kqabeuJcrr8XrBXRxNNT1YEjU/M
 V/Bg5Ut7eyhVuwnQF0rx1czC+IeyTKL/uYhDpchE=
X-Riseup-User-ID: C43C3320A8254A748022E269A5DF7B5E499C7825BF1B5A845D821EB134D22584
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4W2sgW0yTXzFt8Q;
 Mon, 17 Jun 2024 14:28:22 +0000 (UTC)
From: Shiva Kiran K <shiva_kr@riseup.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Roshan Khatri <topofeverest8848@gmail.com>,
 Shiva Kiran K <shiva_kr@riseup.net>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH] staging: fbtft: Remove unnecessary parentheses
Date: Mon, 17 Jun 2024 19:57:47 +0530
Message-ID: <20240617142746.51885-2-shiva_kr@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 18 Jun 2024 07:29:33 +0000
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

Remove unnecessary parentheses in `if` statements.
Reported by checkpatch.pl

Signed-off-by: Shiva Kiran K <shiva_kr@riseup.net>
---
 drivers/staging/fbtft/fb_ili9320.c | 2 +-
 drivers/staging/fbtft/fb_ra8875.c  | 2 +-
 drivers/staging/fbtft/fbtft-bus.c  | 2 +-
 drivers/staging/fbtft/fbtft-core.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ili9320.c b/drivers/staging/fbtft/fb_ili9320.c
index 0be7c2d51..409b54cc5 100644
--- a/drivers/staging/fbtft/fb_ili9320.c
+++ b/drivers/staging/fbtft/fb_ili9320.c
@@ -37,7 +37,7 @@ static int init_display(struct fbtft_par *par)
 	devcode = read_devicecode(par);
 	fbtft_par_dbg(DEBUG_INIT_DISPLAY, par, "Device code: 0x%04X\n",
 		      devcode);
-	if ((devcode != 0x0000) && (devcode != 0x9320))
+	if (devcode != 0x0000 && devcode != 0x9320)
 		dev_warn(par->info->device,
 			 "Unrecognized Device code: 0x%04X (expected 0x9320)\n",
 			devcode);
diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
index 398bdbf53..ce305a0be 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -50,7 +50,7 @@ static int init_display(struct fbtft_par *par)
 
 	par->fbtftops.reset(par);
 
-	if ((par->info->var.xres == 320) && (par->info->var.yres == 240)) {
+	if (par->info->var.xres == 320 && par->info->var.yres == 240) {
 		/* PLL clock frequency */
 		write_reg(par, 0x88, 0x0A);
 		write_reg(par, 0x89, 0x02);
diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 3d422bc11..ab903c938 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -85,7 +85,7 @@ void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 	if (len <= 0)
 		return;
 
-	if (par->spi && (par->spi->bits_per_word == 8)) {
+	if (par->spi && par->spi->bits_per_word == 8) {
 		/* we're emulating 9-bit, pad start of buffer with no-ops
 		 * (assuming here that zero is a no-op)
 		 */
diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index c8d52c63d..64babfe3a 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -666,7 +666,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 		txbuflen = 0;
 
 #ifdef __LITTLE_ENDIAN
-	if ((!txbuflen) && (bpp > 8))
+	if (!txbuflen && bpp > 8)
 		txbuflen = PAGE_SIZE; /* need buffer for byteswapping */
 #endif
 
-- 
2.45.2

