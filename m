Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 960F993B1D9
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 15:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D0E10E5A0;
	Wed, 24 Jul 2024 13:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cZjjVnwc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94AE410E427
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 06:03:46 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1fc66fc35f2so3653155ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 23:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721714626; x=1722319426; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=54T/UrOSVnJ9rISsin1qHr+L1d8cmHOyygXczypoES8=;
 b=cZjjVnwcD+3SoWGJrHipkLM7BW2xAltT2h9l5aYfapge3mtPzWYwt0DNFUwSmvcn3D
 NVvBgAmk/NRZsUyiTRlrRQ5/60DoPAXsxq8TMcm48ltL6HOqXR2D0BlMwNqsN/1ejLh8
 D+iujU+8pL5/ynskM7Sd97RT12gzTDQH5C9zZjn7Wq9DVlNF7W9KbZvu73LjOSYMqCCN
 7hXm8CGOza8UFhJtSom9QDTJOM/5Xh9N0h5FmgBL1WoktZPrfqhaJO6RJut4yqmaXT7o
 uvLLiiTPPjK7rd5wMrclFJWCmgjJp4RcDnZy8zH+q3sdXl6r2XhJCbOIg01g0QDpzHF6
 Vmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721714626; x=1722319426;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=54T/UrOSVnJ9rISsin1qHr+L1d8cmHOyygXczypoES8=;
 b=eqo0F4BmiaLDZSBhsKMJAnAjHl2FHjn3UQ5sBMVGYe7Y3k1xROHh/kvJ9Qcencxe5M
 k0LShTp8s8w+0UoDh3p0Kq4hHmzNKVZHXvNBhU5CpcFGWzw/nDzEAZy926cfFmGp/Tgy
 ovmPMbJy/LOy3P/47pOsMZftdzpZjY0hki4wLhMCAk/mnG2puZNfo9IOSIN8KdAPSkEe
 MRTn75/VaHIP3LbUmL1LWgVR2xG4jkEbhEvAKEZZCQoNvNsVPuQNBWpt1cugdnrcvnQo
 TYb/1PCGB30GQKtm1VgngaynsMh1pAaetJ9eLkPwKhBUTWC4HneLcwoxJKGp+HLxgtEQ
 7bvw==
X-Gm-Message-State: AOJu0Ywu9NpDbkFZw3MZxoDkWQDpLpKuVPKlr7pc3cdLFlHsnmzHxRzf
 Edub+fzrtVDTyHT/prGO/QCtILQasTk95/lli+zpIte4Xp3oZE+l
X-Google-Smtp-Source: AGHT+IF5N9Hpjd9u7ffX60R/GPm9+eBUewVTteCh1raMCU9msqL1QfiaSt035qpW/Ns8EXNEz8UJ/A==
X-Received: by 2002:a17:903:2a83:b0:1fa:1a78:b5a9 with SMTP id
 d9443c01a7336-1fdb94d1692mr20402295ad.3.1721714625795; 
 Mon, 22 Jul 2024 23:03:45 -0700 (PDT)
Received: from Riyan.inspiron ([122.176.198.184])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fd6f291f10sm65597795ad.103.2024.07.22.23.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 23:03:45 -0700 (PDT)
From: Riyan Dhiman <riyandhiman14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Riyan Dhiman <riyandhiman14@gmail.com>
Subject: [PATCH] staging: fbtft: remove unnecessary braces in if statements
 and space before close parenthesis in function call
Date: Tue, 23 Jul 2024 11:33:11 +0530
Message-Id: <20240723060311.32043-1-riyandhiman14@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 24 Jul 2024 13:42:48 +0000
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

Adhere to Linux kernel coding style.

Reported by checkpatch:

CHECK: Unnecessary parentheses around 'devcode != 0x0000'
CHECK: Unnecessary parentheses around 'devcode != 0x9320'
CHECK: Unnecessary parentheses around 'par->info->var.xres == 320'
CHECK: Unnecessary parentheses around 'par->info->var.yres == 240'
CHECK: Unnecessary parentheses around 'par->spi->bits_per_word == 8'
CHECK: Unnecessary parentheses around '!txbuflen'
CHECK: Unnecessary parentheses around 'bpp > 8'
ERROR: space prohibited before that close parenthesis ')'

Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
---
 drivers/staging/fbtft/fb_ili9320.c | 2 +-
 drivers/staging/fbtft/fb_ra8875.c  | 2 +-
 drivers/staging/fbtft/fbtft-bus.c  | 6 +++---
 drivers/staging/fbtft/fbtft-core.c | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ili9320.c b/drivers/staging/fbtft/fb_ili9320.c
index 0be7c2d51548..409b54cc562e 100644
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
index 398bdbf53c9a..ce305a0bea48 100644
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
index 3d422bc11641..02d7dbd38678 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -62,9 +62,9 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8,)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16,)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
@@ -85,7 +85,7 @@ void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 	if (len <= 0)
 		return;
 
-	if (par->spi && (par->spi->bits_per_word == 8)) {
+	if (par->spi && par->spi->bits_per_word == 8) {
 		/* we're emulating 9-bit, pad start of buffer with no-ops
 		 * (assuming here that zero is a no-op)
 		 */
diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 8e2fd0c0fee2..53b104559502 100644
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
2.39.2

