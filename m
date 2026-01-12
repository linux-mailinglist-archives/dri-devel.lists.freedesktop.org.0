Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FECD103A9
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 02:08:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EDCE89711;
	Mon, 12 Jan 2026 01:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GmfyKHba";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A38689711
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 01:07:57 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-81f4ba336b4so743998b3a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 17:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768180077; x=1768784877; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TkOZXJ1yiBIweSUTCBJOqJ16hNtrAInO8IpS+8lGicY=;
 b=GmfyKHbaBSiTFekxclWVtyiRspMl+7/VMxAGW7z7nVrZ/BKx6xS6sHOD04O4v/wZYN
 MhsFgwjQmBbBB+M3sNa3WV3FH2bi2ie1DJDmNKf0jaHrgpSg3k4CQFzPe6MCpaVNqM/k
 CyvfC3NTEvykx6w3NTpBNp13CRTbQf6+MbIeMF+w5S0zfcqr/kY2/wrXt9oGAyQijcG5
 J7euSy9GJrdBxjUyPRs4FYwRphyEpL08rcBcbyDbgk7y6aCOZnTD3WlxVLkHD2nCUh8h
 9kxxarE4c0r4YyZFq1ierljY23YL4QIWp3LRaFklarUg/J35WZz+VuwI94geNYJ6qqRO
 qk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768180077; x=1768784877;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TkOZXJ1yiBIweSUTCBJOqJ16hNtrAInO8IpS+8lGicY=;
 b=VN9CEej25pI2T8aZmynTYTGESVh6fu8n9M0E7Fo+qN1XyP3qpDqKfYKEprKoC+2SBp
 gm2Ldqf900eLKQ02v1eTXSI/0tycTHXc5g3q/lqWzqDG7b0KD3CT+ZP+ck69WXmiTi0Z
 Am7pozBkavUDVzy0HA5+NmlVEgUoIAzMhKSbN7STmLNRSaUwZoGniP/tWzomyiA7c+sx
 7XhiyOjJDFetnaoQ+pHxsNhCCxDz+nJyWul4hQicM6zzh094Jp7ODCx0ujusZcDdiQtJ
 ehkTq+jKRI7p7ynjecXhUrDlJcxu/96yPrgo/mSGM2wx0QNC7BcE3nIgTRX+ja2lPmC9
 fLpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/3sFkV3Vrq09zFrZTiF/qSRktOSnatp/wNF1W0Tgj9Amv12GK5B3TXUoFOO4kHUU84N8WcpfR5wU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtcZirA6Jwph7H+q7VSwornVhvzqDqFIYJLB8B7IOi8Qxkwxli
 HzkZ4dmZtkvQRmQ49THAqpaU+bDsy5l0TqpOF/j4fPFL+Hw1ePAPS5Jz
X-Gm-Gg: AY/fxX4K8tBiT2e9tvUg/qbvmnRcnr0UTPnA6BU2eZwh2XSz/SiXJk2Jv5yyxxuUpqc
 Env6eNfqKwKdVqfpb/Rz0oT4QP7RK+tN31i9+kHoGkOoUZ0ARgeXS/YjQv9PCIHCUy+yy7XOL0I
 k6mjYFNSWKcrkJ7rQoC/ilHDkqTagLf/sR39n1XQDFgxaNgTZzTpwsiUGRhXNv4Vpxm/KnKq32E
 M+2oibkpvAk4kP39JGmVe6orGZ79SQtvMNud7Z5/FrnxQqvKFLS8OvACOY3fNZluqyfBH8cTALv
 VOUGEbiuanjnnEOa5YZmL9kiflpne42/nvsb0TD2ZFGRMb8kCC7r09pdxHP5bI3DCbPZs/XqiEI
 kubJ7SZyVouWCLSnsWfNeddmUzWy1a/Eel4KPfOgak24C9aD1TnypPTvZ2zTg8/iGzUxOJjOlCl
 yJ3uy4spdtsJ5GBv7uQObxJ6RRdYpsoqBjlhuIRrv+O4U=
X-Google-Smtp-Source: AGHT+IEqSuoKlQd99SJwcfXAwafP6Ad6qD2z83UEaG0kD39I3j77hVcCOmXZQVclGkZssS94ypX4yw==
X-Received: by 2002:a05:6a00:a883:b0:81f:31c3:2e34 with SMTP id
 d2e1a72fcca58-81f31c33305mr4830490b3a.25.1768180076713; 
 Sun, 11 Jan 2026 17:07:56 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:a2d6:d17d:ed6b:f017])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81e042e75b1sm3980489b3a.21.2026.01.11.17.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jan 2026 17:07:55 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, andy@kernel.org, deller@gmx.de,
 gregkh@linuxfoundation.org, Chintan Patel <chintanlike@gmail.com>,
 kernel test robot <lkp@intel.com>
Subject: [PATCH v5] staging: fbtft: use dev_of_fbinfo() instead of info->dev
Date: Sun, 11 Jan 2026 17:07:39 -0800
Message-ID: <20260112010740.186248-1-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This fixes commit
a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")

from my previous v4 series:
https://patchwork.kernel.org/project/dri-devel/cover/20260107044258.528624-1-chintanlike@gmail.com/

All direct accesses to info->dev or fb_info->dev are replaced with
dev_of_fbinfo() helper, improving readability and ensuring 
compilation succeeds when CONFIG_FB_DEVICE=n.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601110740.Y9XK5HtN-lkp@intel.com
Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/staging/fbtft/fbtft-core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 8a5ccc8ae0a1..309e81d7d208 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -364,8 +364,9 @@ static int fbtft_fb_setcolreg(unsigned int regno, unsigned int red,
 {
 	unsigned int val;
 	int ret = 1;
+	struct device *dev = dev_of_fbinfo(info);
 
-	dev_dbg(info->dev,
+	dev_dbg(dev,
 		"%s(regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X)\n",
 		__func__, regno, red, green, blue, transp);
 
@@ -389,9 +390,10 @@ static int fbtft_fb_setcolreg(unsigned int regno, unsigned int red,
 static int fbtft_fb_blank(int blank, struct fb_info *info)
 {
 	struct fbtft_par *par = info->par;
+	struct device *dev = dev_of_fbinfo(info);
 	int ret = -EINVAL;
 
-	dev_dbg(info->dev, "%s(blank=%d)\n",
+	dev_dbg(dev, "%s(blank=%d)\n",
 		__func__, blank);
 
 	if (!par->fbtftops.blank)
@@ -739,6 +741,7 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 	char text2[50] = "";
 	struct fbtft_par *par = fb_info->par;
 	struct spi_device *spi = par->spi;
+	struct device *dev = dev_of_fbinfo(fb_info);
 
 	/* sanity checks */
 	if (!par->fbtftops.init_display) {
@@ -793,7 +796,7 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 	if (spi)
 		sprintf(text2, ", spi%d.%d at %d MHz", spi->controller->bus_num,
 			spi_get_chipselect(spi, 0), spi->max_speed_hz / 1000000);
-	dev_info(fb_info->dev,
+	dev_info(dev,
 		 "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
 		 fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
 		 fb_info->fix.smem_len >> 10, text1,
-- 
2.43.0

