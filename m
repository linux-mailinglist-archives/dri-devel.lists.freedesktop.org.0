Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A26F1D4648
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 08:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FC56EBE9;
	Fri, 15 May 2020 06:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D34E6E487
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 14:32:12 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id s8so21179312wrt.9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 07:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=e5l1ivHxvrs1cxo8s+YGVNADN8Rkef6bb/X9HBvnEUo=;
 b=jYfhdyXMvfikdAmp4t94kn7Oqc+gcUglu6kotXtK7pCKoEZcxVf+D/gfJXZgnlA3tY
 VcjpeS5YBLgOvzR5lH8nd8xcxAdRH5J/1H+Rx0YuTlUz/0uGIY6A8YBpL08huizZsKAk
 pQTiCU//78OYtJbklytYh8aNf58msaMeP+CHrBi+IMPVFrxmNPRXvWfqUONnqkYrCTX6
 gvaFx+iNa4Fpv9gfJJ9qbT4HuW1APNIdtSjeNhLXuUCQ+UFiSiHNQBRrDklcXRcQBRGJ
 /WFHn0p2Cbgl8iZvetZyCwySHcma/dxORA0r5kTxv83q873p1+IsAj4VwSbTtPefwDf3
 YB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=e5l1ivHxvrs1cxo8s+YGVNADN8Rkef6bb/X9HBvnEUo=;
 b=hrz0vou/s+nCHFCHqN0DSx6Lndd/6DGaE0OO0BuN0I8hxaYwiR5qxINCMpWhc0j6eA
 glbQzbSpCC/dnHN7BQzCalVKe/pbKh7ddJcFsnGJd1fLBc5ntgLJe0nbrd5MdMHj8QIL
 Ug5+OndT05YwpXGTYerGmreIwWQA38fiNbyr5S9Tph7i//2FCl4McoLbzBHpwpX5HK+/
 gczXQdZRsmk6ig3Kda9vWDp0fxxQ/ihNyiZOKXRHKoYcXn3uKS11dCFrPZlQ/AqjInuW
 kx2Br1z+INQtZJwHHIrHFtyqOIFoY2eaA5nD7hUBVtiuxt8BgU1KBWdkwSG3+vSziGJw
 E7mQ==
X-Gm-Message-State: AGi0PubDpuULSgOEGVFrb+xBQiDX8kSCqlE9qYYNkGM+6JVciiHpf9xb
 7dkYw7m/Raf1T8La5W3HiAw=
X-Google-Smtp-Source: APiQypLALuA0r2EITrx0jgdNwC0QL/EE50fO/i1b1frjQJxz76h8l1YXSRVhSmv9cyqfKw97a8V3XQ==
X-Received: by 2002:adf:ee03:: with SMTP id y3mr29782517wrn.190.1589380330471; 
 Wed, 13 May 2020 07:32:10 -0700 (PDT)
Received: from localhost
 (ipv6-fd0e7292a9d5c758.ost.clients.hamburg.freifunk.net.
 [2a03:2267:4:0:fd0e:7292:a9d5:c758])
 by smtp.gmail.com with ESMTPSA id b2sm25212812wrm.30.2020.05.13.07.32.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 May 2020 07:32:09 -0700 (PDT)
From: Oliver Graute <oliver.graute@gmail.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH v2] staging: fbtft: fb_st7789v: Initialize the Display
Date: Wed, 13 May 2020 16:30:46 +0200
Message-Id: <1589380299-21871-1-git-send-email-oliver.graute@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Fri, 15 May 2020 06:52:55 +0000
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
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 Oliver Graute <oliver.graute@kococonnector.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, oliver.graute@gmail.com,
 dan.carpenter@oracle.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Oliver Graute <oliver.graute@kococonnector.com>

Set Gamma Values and Register Values for the HSD20_IPS Panel

Signed-off-by: Oliver Graute <oliver.graute@kococonnector.com>
---

need information howto set HSD20_IPS Panel at run time and not at compile time

Changes for v2:
 - added define for HSD20_IPS_GAMMA values
 - check for HSD20_IPS define
 - enabled MIPI_DCS_ENTER_INVERT_MODE

 drivers/staging/fbtft/fb_st7789v.c | 32 +++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/fbtft/fb_st7789v.c b/drivers/staging/fbtft/fb_st7789v.c
index 3c3f387936e8..ebc17e05ecd0 100644
--- a/drivers/staging/fbtft/fb_st7789v.c
+++ b/drivers/staging/fbtft/fb_st7789v.c
@@ -20,6 +20,12 @@
 	"70 2C 2E 15 10 09 48 33 53 0B 19 18 20 25\n" \
 	"70 2C 2E 15 10 09 48 33 53 0B 19 18 20 25"
 
+#define HSD20_IPS_GAMMA \
+	"D0 05 0A 09 08 05 2E 44 45 0F 17 16 2B 33\n" \
+	"D0 05 0A 09 08 05 2E 43 45 0F 16 16 2B 33"
+
+#define HSD20_IPS "true"
+
 /**
  * enum st7789v_command - ST7789V display controller commands
  *
@@ -82,14 +88,20 @@ static int init_display(struct fbtft_par *par)
 
 	/* set pixel format to RGB-565 */
 	write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, MIPI_DCS_PIXEL_FMT_16BIT);
+	if (HSD20_IPS)
+		write_reg(par, PORCTRL, 0x05, 0x05, 0x00, 0x33, 0x33);
 
-	write_reg(par, PORCTRL, 0x08, 0x08, 0x00, 0x22, 0x22);
+	else
+		write_reg(par, PORCTRL, 0x08, 0x08, 0x00, 0x22, 0x22);
 
 	/*
 	 * VGH = 13.26V
 	 * VGL = -10.43V
 	 */
-	write_reg(par, GCTRL, 0x35);
+	if (HSD20_IPS)
+		write_reg(par, GCTRL, 0x75);
+	else
+		write_reg(par, GCTRL, 0x35);
 
 	/*
 	 * VDV and VRH register values come from command write
@@ -101,13 +113,19 @@ static int init_display(struct fbtft_par *par)
 	 * VAP =  4.1V + (VCOM + VCOM offset + 0.5 * VDV)
 	 * VAN = -4.1V + (VCOM + VCOM offset + 0.5 * VDV)
 	 */
-	write_reg(par, VRHS, 0x0B);
+	if (HSD20_IPS)
+		write_reg(par, VRHS, 0x13);
+	else
+		write_reg(par, VRHS, 0x0B);
 
 	/* VDV = 0V */
 	write_reg(par, VDVS, 0x20);
 
 	/* VCOM = 0.9V */
-	write_reg(par, VCOMS, 0x20);
+	if (HSD20_IPS)
+		write_reg(par, VCOMS, 0x22);
+	else
+		write_reg(par, VCOMS, 0x20);
 
 	/* VCOM offset = 0V */
 	write_reg(par, VCMOFSET, 0x20);
@@ -120,6 +138,10 @@ static int init_display(struct fbtft_par *par)
 	write_reg(par, PWCTRL1, 0xA4, 0xA1);
 
 	write_reg(par, MIPI_DCS_SET_DISPLAY_ON);
+
+	if (HSD20_IPS)
+		write_reg(par, MIPI_DCS_ENTER_INVERT_MODE);
+
 	return 0;
 }
 
@@ -234,7 +256,7 @@ static struct fbtft_display display = {
 	.height = 320,
 	.gamma_num = 2,
 	.gamma_len = 14,
-	.gamma = DEFAULT_GAMMA,
+	.gamma = HSD20_IPS_GAMMA,
 	.fbtftops = {
 		.init_display = init_display,
 		.set_var = set_var,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
