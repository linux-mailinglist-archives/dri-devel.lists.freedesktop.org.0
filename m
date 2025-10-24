Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96414C0560E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 11:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1392410E152;
	Fri, 24 Oct 2025 09:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=0x0f.com header.i=@0x0f.com header.b="CqrVXt+A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD63910E152
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 09:37:36 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-290d4d421f6so16896225ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 02:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0x0f.com; s=google; t=1761298656; x=1761903456; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TluK3MF0nWIoJUSNiEPuReJVhgVvccO24FAbWBod7M8=;
 b=CqrVXt+A0ZXI0z2cFW5sN28qU4BnM54dV7Prp+GgEuNGMUkcfZsJZHOHLi7wgtP7Pk
 KVFLwhMQLRLQOgLIZoPGQIIBT+n+wwAwDtp6m1p0leeEtnpPiu33oiPooLgsdhwVAyXy
 5hveT2hpa4RE1nUZK5Bbh69cs7jhRzyBl4TPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761298656; x=1761903456;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TluK3MF0nWIoJUSNiEPuReJVhgVvccO24FAbWBod7M8=;
 b=qHTfv5ni46tNHZLwWNY5pKbsONUSo8yYyuKUnvgOkci1LU5t2T27Q+APwp2xIJ1H+N
 s99gaw6IritshiD3uG7lEbiFqtzFtbxgTFzdpVQwSCrBUA/6m9/gxJKxwGZkwBEqJrBW
 vK8xj0yVo+yOKCZ/Rj1DkZdSFO079j8jOZ+z5hz4zxrXEKrLihoecCoIRzY3taXDUf2z
 61J54+vtwbLa0dLkEJzq7N3GrMAu9v1rPnbRzTJzNJKdnNJpfGlDiImSkwjoh3XNa7AJ
 3VJrX4K/vyYGUTPA52QevrVR5/InQIxQF2Kx+/WWARDpRV+WEfetxAOPLQfcW/NVK9Dc
 cmWA==
X-Gm-Message-State: AOJu0YyQR0ldCcR9ps3SrIWp9Zk+Gu/2/k4wzNlflXW5hfuM9AcZG/cr
 JGNd2JPugKjWkSSy5nSQTiWv85RpA+/CNbP6UDiNj6Mxlc2vCR3lkFnEt32O/PxSX+0=
X-Gm-Gg: ASbGnctB/1NIwKlPtPjM46n5CJd5ByxOBtOJLl0W9/T3kWxIMZo3M0uaYmransIayle
 FwFxTl6jeH1XMJm44VZm5Q4zs8MD/dc7zAlr3xvBzOVzf2TK9sHANRCLb0ZuA3WZ/cPBz8Mhqrp
 foVN78G57uz5UBOYdaYvfe0lOK0u9YHcmxjEydr4bH93C8NCeUNaX5lVjexM6/B9H3+8ofzmZHl
 nyEhCfgceGb5vqKAwQBPqlQvUzq0nXjMZZs3rL3Bo4X7aDe9NffL8uTKFbr82afh+/VUhNw29+S
 6/Jef2WoGfrfDQ6s24ZU6+a2K+x1umnQosVmpxX56E7GQJFbSBYVwO1L5ijo5xRLPxclFe9v8Iv
 XbzQnzng5T2pEr0qlgrFHcTnI163q5GQ3U5IoFnevWXVyThsS68ALwZ29rix6bn9hr4Bx6kY+If
 Wi+6LJmBq9W9SoI2tVgdLoa6ywsVKiO496a+oi6+JX3ssPjAv2s6LFnSZH2c75ag==
X-Google-Smtp-Source: AGHT+IEKtLA3XRvvshIlIg79q8hd8Y4gzZ4mZdxItUorXlFdB2qoWeLIZZW4BUstYBazD2NVXVoh/g==
X-Received: by 2002:a17:903:1a4c:b0:267:a1f1:9b23 with SMTP id
 d9443c01a7336-290c9cbb12bmr378539265ad.18.1761298656100; 
 Fri, 24 Oct 2025 02:37:36 -0700 (PDT)
Received: from shiro (p1391188-ipxg00a01sizuokaden.shizuoka.ocn.ne.jp.
 [153.222.3.188]) by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-2946dda72d0sm49975485ad.16.2025.10.24.02.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 02:37:35 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: deller@gmx.de,
	linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH] fbdev: atyfb: Check if pll_ops->init_pll failed
Date: Fri, 24 Oct 2025 18:37:15 +0900
Message-ID: <20251024093715.4012119-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.51.0
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

Actually check the return value from pll_ops->init_pll()
as it can return an error.

If the card's BIOS didn't run because it's not the primary VGA card
the fact that the xclk source is unsupported is printed as shown
below but the driver continues on regardless and on my machine causes
a hard lock up.

[   61.470088] atyfb 0000:03:05.0: enabling device (0080 -> 0083)
[   61.476191] atyfb: using auxiliary register aperture
[   61.481239] atyfb: 3D RAGE XL (Mach64 GR, PCI-33) [0x4752 rev 0x27]
[   61.487569] atyfb: 512K SGRAM (1:1), 14.31818 MHz XTAL, 230 MHz PLL, 83 Mhz MCLK, 63 MHz XCLK
[   61.496112] atyfb: Unsupported xclk source:  5.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 drivers/video/fbdev/aty/atyfb_base.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
index 210fd3ac18a4..56ef1d88e003 100644
--- a/drivers/video/fbdev/aty/atyfb_base.c
+++ b/drivers/video/fbdev/aty/atyfb_base.c
@@ -2614,8 +2614,12 @@ static int aty_init(struct fb_info *info)
 		pr_cont("\n");
 	}
 #endif
-	if (par->pll_ops->init_pll)
-		par->pll_ops->init_pll(info, &par->pll);
+	if (par->pll_ops->init_pll) {
+		ret = par->pll_ops->init_pll(info, &par->pll);
+		if (ret)
+			return ret;
+	}
+
 	if (par->pll_ops->resume_pll)
 		par->pll_ops->resume_pll(info, &par->pll);
 
-- 
2.51.0

