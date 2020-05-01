Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 524401C241B
	for <lists+dri-devel@lfdr.de>; Sat,  2 May 2020 10:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061176ED9C;
	Sat,  2 May 2020 08:34:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D3F6ECDA
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 21:50:14 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id b6so806606plz.13
 for <dri-devel@lists.freedesktop.org>; Fri, 01 May 2020 14:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=sCwnL9j5tuq9C/zCfZk+GBElwtsC97H/4kGQxJh9yoE=;
 b=kq+6SN7e26oYWrvqvD/PA/9Es8QwBjsr2gG4NxFyAibz89l3IQti445oA24zTob1RZ
 YJ/2OTzeKhsphayq+l15QLDGwz4yZc5aCC8b6e8weZjIhZPPuA5aecfJB25MypwQMqbY
 YDLddZW+q4yqko3e3hjvXTgJYlTXgSknrXim/jyUys1ZGpTd3fsinQ/5k1CkDVTbwGaz
 NQKYIu3rjI94Z7ES2rMcYybAaOx4lEtnFiAchY41w47dRuRNrH6HoYoh26iiC2W/wZtX
 nY02lCNJRhV7LgBYPaIFkZ62BNAM/eeDcvjf1b9mv5HB3iQXTzU0Lrn3yBE0cO08cIs3
 N+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=sCwnL9j5tuq9C/zCfZk+GBElwtsC97H/4kGQxJh9yoE=;
 b=lOnlrJ7oS2d+DAJGh7PoOxoRbRixSifrVtXx8PmVJ31TNMipo/fBB4R1fciyXjFGsB
 D36KN/QwMutSV/QO0Sg335UgyvkjovwaODFaxlHhvRW7taB5w26tfKP9d8l9cPgGDjYG
 gAbDXIgbYEdKTAxvkQv4Q7C0iVL5zdIGgBpE/zkQ50/4bP43jHRTsAI1NIjshTQuiDdE
 lDXoJLxieyQRWbl2oVIgs86/pZfF8eLvRLDKs97pcn0gVAq2Zr1E0OI7vEq82KQeNNnX
 oImYdjGTG5jiG4wBdOCDsVqgGTAgdY/kelntuy5K6Xmr7DFvxZbU/sLvJQTCUkiPh4n9
 a5Jg==
X-Gm-Message-State: AGi0Puaral6Wz/2fQTAlISZFMppGBVHGMJhlJ65AqFX44SGINZ2Y8lJ4
 8b6TJ9/LdcyBeD7mzUMJS+E=
X-Google-Smtp-Source: APiQypJQ7Nfrbks03oaOCxMJQ3OHB+u/pNUinmspXJ8F4Pe3OkpqRQo9et58+4EuthMBfNUZtngURw==
X-Received: by 2002:a17:90a:1f4b:: with SMTP id
 y11mr2015936pjy.136.1588369814033; 
 Fri, 01 May 2020 14:50:14 -0700 (PDT)
Received: from jordon-HP-15-Notebook-PC.domain.name ([171.48.31.149])
 by smtp.gmail.com with ESMTPSA id h26sm2088769pfk.35.2020.05.01.14.50.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 01 May 2020 14:50:13 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: b.zolnierkie@samsung.com, tglx@linutronix.de, gregkh@linuxfoundation.org
Subject: [PATCH] video/fbdev/matroxfb: Remove dead code
Date: Sat,  2 May 2020 03:28:11 +0530
Message-Id: <1588370291-7746-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Sat, 02 May 2020 08:34:27 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Souptick Joarder <jrdr.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These are dead code since 3.15. If there is no plan to use it further
it can be removed forever.

Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
---
 drivers/video/fbdev/matrox/matroxfb_DAC1064.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/video/fbdev/matrox/matroxfb_DAC1064.c b/drivers/video/fbdev/matrox/matroxfb_DAC1064.c
index 765e805..9c2a2c0 100644
--- a/drivers/video/fbdev/matrox/matroxfb_DAC1064.c
+++ b/drivers/video/fbdev/matrox/matroxfb_DAC1064.c
@@ -603,9 +603,6 @@ static void MGA1064_ramdac_init(struct matrox_fb_info *minfo)
 /* BIOS environ */
 static int x7AF4 = 0x10;	/* flags, maybe 0x10 = SDRAM, 0x00 = SGRAM??? */
 				/* G100 wants 0x10, G200 SGRAM does not care... */
-#if 0
-static int def50 = 0;	/* reg50, & 0x0F, & 0x3000 (only 0x0000, 0x1000, 0x2000 (0x3000 disallowed and treated as 0) */
-#endif
 
 static void MGAG100_progPixClock(const struct matrox_fb_info *minfo, int flags,
 				 int m, int n, int p)
@@ -843,9 +840,6 @@ static int MGAG100_preinit(struct matrox_fb_info *minfo)
 	struct matrox_hw_state *hw = &minfo->hw;
 
         u_int32_t reg50;
-#if 0
-	u_int32_t q;
-#endif
 
 	DBG(__func__)
 
@@ -927,11 +921,6 @@ static int MGAG100_preinit(struct matrox_fb_info *minfo)
 		mga_writeb(minfo->video.vbase, 0x0000, 0xAA);
 		mga_writeb(minfo->video.vbase, 0x0800, 0x55);
 		mga_writeb(minfo->video.vbase, 0x4000, 0x55);
-#if 0
-		if (mga_readb(minfo->video.vbase, 0x0000) != 0xAA) {
-			hw->MXoptionReg &= ~0x1000;
-		}
-#endif
 		hw->MXoptionReg |= 0x00078020;
 	} else if (minfo->devflags.accelerator == FB_ACCEL_MATROX_MGAG200) {
 		pci_read_config_dword(minfo->pcidev, PCI_OPTION2_REG, &reg50);
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
