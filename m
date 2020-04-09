Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D5F1A449C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 11:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070526EC9F;
	Fri, 10 Apr 2020 09:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CF36EB94
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 09:34:11 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f20so3492866wmh.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Apr 2020 02:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=7Q2NlCB63D2LhEGr0HwhcxP6aGwq461tbuIJ0oEX06M=;
 b=vVpj55hQZQvgH3Z3cGf73X1rvd1ZOVmJt3Ojbs5phtb5O/acyRVL6aXtux8iatz1KW
 X5oGIWVhTAcFuSlTN6gsnCxnj1V62CTHduOJdt3pQ5QlskkmM78GJwS6/I/oUr3Qrxaj
 n+ngvXzE5rJbiNcEToDunyRvf+5xjbYfoswYjfHEds2j93MQ+kAokg+7Bnztmv7TBPvz
 0x9nt1MHgx8bK+aE6PUNX84lPoYI+LUhDQFpxTnxL4fiodyCQQJkmGFuLeAJpGzC3g3e
 C5DWz/P5hQ1Eylw1ZkLkl2zGGSRsmb7uyjTvGD3AOVMZx7Leh0hqKUhfvkgePzvJlywS
 45OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7Q2NlCB63D2LhEGr0HwhcxP6aGwq461tbuIJ0oEX06M=;
 b=V89ge7ud4fplJoACmX8SvWQBCmUUC/eoVyqTyUsOqdUy3qfroUAuX858O5kJKU8z+6
 ra/gxwaD5h2jTRgJJOXUAFfjgDMmzDyY5e6RxJOWGiLTVMgjghVFHD51ZCA1Eu/9GkCZ
 xlJHQ5GnpXwWaNGPBLWrPc3NHBjGH/2ahXAti1cuJtJWD7sLSVVdgPY76EukG/PjvwOm
 ZqT1TV4X5VEbqN9EM+8VPMxGr8yGuQ0twYfW1hQNjHImYr+VfDPvrkNiYgZUJAinHF65
 sFthzs2em9bgFaqwy4/8bi1Ev95k7TN2k/wmNaajz7wLb6vPnWMfRx267MDtiGDODxOl
 90JQ==
X-Gm-Message-State: AGi0PubJ2jmKs8Kz4C6cSTSa5HpNT6KMXXCQbmECaMXNo/4mWXq8XABJ
 ACrRnAqtA3CZHhSqu0VFKpE=
X-Google-Smtp-Source: APiQypKUHubOBZw6V5DlQzjZbiHuk+zbVkHxWC7aj0wXhW0gzw3QUStWWUeaA3X1nOIr1T7nMS9ajQ==
X-Received: by 2002:a7b:c4c9:: with SMTP id g9mr282591wmk.171.1586424850185;
 Thu, 09 Apr 2020 02:34:10 -0700 (PDT)
Received: from localhost (ip1f115f16.dynamic.kabel-deutschland.de.
 [31.17.95.22])
 by smtp.gmail.com with ESMTPSA id f63sm2764515wma.47.2020.04.09.02.34.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Apr 2020 02:34:09 -0700 (PDT)
From: Oliver Graute <oliver.graute@gmail.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH v1] staging: fbtft: fb_st7789v: Initialize the Display
Date: Thu,  9 Apr 2020 11:25:32 +0200
Message-Id: <1586424337-26602-1-git-send-email-oliver.graute@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Fri, 10 Apr 2020 09:45:19 +0000
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
 dri-devel@lists.freedesktop.org, oliver.graute@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Oliver Graute <oliver.graute@kococonnector.com>

Set Gamma Values and Register Values for the HSD20_IPS

Signed-off-by: Oliver Graute <oliver.graute@kococonnector.com>
---
 drivers/staging/fbtft/fb_st7789v.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/fbtft/fb_st7789v.c b/drivers/staging/fbtft/fb_st7789v.c
index 84c5af2dc9a0..b0aa96b703a8 100644
--- a/drivers/staging/fbtft/fb_st7789v.c
+++ b/drivers/staging/fbtft/fb_st7789v.c
@@ -17,8 +17,8 @@
 #define DRVNAME "fb_st7789v"
 
 #define DEFAULT_GAMMA \
-	"70 2C 2E 15 10 09 48 33 53 0B 19 18 20 25\n" \
-	"70 2C 2E 15 10 09 48 33 53 0B 19 18 20 25"
+	"D0 05 0A 09 08 05 2E 44 45 0F 17 16 2B 33\n" \
+	"D0 05 0A 09 08 05 2E 43 45 0F 16 16 2B 33"
 
 /**
  * enum st7789v_command - ST7789V display controller commands
@@ -83,13 +83,13 @@ static int init_display(struct fbtft_par *par)
 	/* set pixel format to RGB-565 */
 	write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, MIPI_DCS_PIXEL_FMT_16BIT);
 
-	write_reg(par, PORCTRL, 0x08, 0x08, 0x00, 0x22, 0x22);
+	write_reg(par, PORCTRL, 0x05, 0x05, 0x00, 0x33, 0x33);
 
 	/*
 	 * VGH = 13.26V
 	 * VGL = -10.43V
 	 */
-	write_reg(par, GCTRL, 0x35);
+	write_reg(par, GCTRL, 0x75);
 
 	/*
 	 * VDV and VRH register values come from command write
@@ -101,13 +101,13 @@ static int init_display(struct fbtft_par *par)
 	 * VAP =  4.1V + (VCOM + VCOM offset + 0.5 * VDV)
 	 * VAN = -4.1V + (VCOM + VCOM offset + 0.5 * VDV)
 	 */
-	write_reg(par, VRHS, 0x0B);
+	write_reg(par, VRHS, 0x13);
 
 	/* VDV = 0V */
 	write_reg(par, VDVS, 0x20);
 
 	/* VCOM = 0.9V */
-	write_reg(par, VCOMS, 0x20);
+	write_reg(par, VCOMS, 0x22);
 
 	/* VCOM offset = 0V */
 	write_reg(par, VCMOFSET, 0x20);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
