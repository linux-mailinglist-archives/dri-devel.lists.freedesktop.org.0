Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8D464A3D2
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 15:58:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C12F10E1E6;
	Mon, 12 Dec 2022 14:58:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A27310E1E6
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 14:58:08 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id x66so24272pfx.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 06:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=slfodVDPMruoMEUd9CJ4kv4m/AC9lL/s5BVlT03x0Dk=;
 b=Bm6zhWoOvwdrN8d/8xrAQ8kPKiF4eHTPBUJ+ruyerSIZ0o444J8wBbzQt2aYC0Mtii
 8EHqe2VXHT3OWgm9hmeBZ8/ZMPSCentAPS0n307CEFOYJYreTtmNxeT5UcARaUMmYNCN
 ZQFOjbYP+FlpJpOzg8GHlL44scZlcz5TBb58U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=slfodVDPMruoMEUd9CJ4kv4m/AC9lL/s5BVlT03x0Dk=;
 b=Bi66qLOoSWsihvAMztVjjh3BnKdLuySgszV8mFfVlwvoaRLl399NJbCOTzQzbLiq1Z
 0jg4M6eSD8jymwEOWOQLcMABNdbYzbMP4SI0V/D43j7F19aZWeSwH8b838RthcvZJuog
 QuZkDiMafBfghBPIHbstoouHUwVIOB4wGkD6nwZFr9h0Lfxp1WbB4t5u1SiHNpXc5sOe
 w8flQZDaloosUJDcAjmCBtKUebgIAWbFZ0JHmk9YrhjdozrjFtk4Nvue9AIk/DTIkrts
 UDB+RD98C5QzNFAiUd9/5G+VoCnth4WYtK+VTurZEZYG2LAI5mRMbm6tqbzyWxvbEykI
 VuDA==
X-Gm-Message-State: ANoB5pk4TxlG4YMrEdVz057RR202sxZ3I6iCK7KRHhkcCaLFMVZrwJsS
 o1B22roGQkWRMpLRXvx/5O0xyA==
X-Google-Smtp-Source: AA0mqf6nj0RzbfF4/6VHtvJ82R3mYcnkqy50roNy1ZwiaagkZEOFJX71HaGx/43lRK//TdHBYORCVQ==
X-Received: by 2002:a62:1450:0:b0:578:9708:887a with SMTP id
 77-20020a621450000000b005789708887amr1975355pfu.8.1670857087857; 
 Mon, 12 Dec 2022 06:58:07 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:c713:dc69:f2de:e52f])
 by smtp.gmail.com with ESMTPSA id
 h6-20020aa796c6000000b005769ccca18csm5868129pfq.85.2022.12.12.06.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 06:58:06 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v10 2/2] drm: exynos: dsi: Properly name HSA/HBP/HFP/HSE bits
Date: Mon, 12 Dec 2022 20:27:45 +0530
Message-Id: <20221212145745.15387-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221212145745.15387-1-jagan@amarulasolutions.com>
References: <20221212145745.15387-1-jagan@amarulasolutions.com>
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
Cc: Marek Vasut <marex@denx.de>, Nicolas Boichat <drinkcat@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

HSA/HBP/HFP/HSE mode bits in Processor Reference Manuals specify
a naming conversion as 'disable mode bit' due to its bit definition,
0 = Enable and 1 = Disable.

For HSE bit, the i.MX 8M Mini/Nano/Plus Applications Processor
Reference Manual named this bit as 'HseDisableMode' but the bit
definition is quite opposite like
0 = Disables transfer
1 = Enables transfer
which clearly states that HSE is not a disable bit.

HSE is named as per the manual even though it is not a disable
bit however the driver logic for handling HSE is based on the
MIPI_DSI_MODE_VIDEO_HSE flag itself.

Cc: Nicolas Boichat <drinkcat@chromium.org>
Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v10:
- add Marek V review tag
Changes for v9:
- new patch

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 33 +++++++++++++++++++------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 50a2a9ca88a9..b64bb6006b7d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -75,10 +75,27 @@
 #define DSIM_MAIN_PIX_FORMAT_RGB565	(0x4 << 12)
 #define DSIM_SUB_VC			(((x) & 0x3) << 16)
 #define DSIM_MAIN_VC			(((x) & 0x3) << 18)
-#define DSIM_HSA_MODE			(1 << 20)
-#define DSIM_HBP_MODE			(1 << 21)
-#define DSIM_HFP_MODE			(1 << 22)
-#define DSIM_HSE_MODE			(1 << 23)
+#define DSIM_HSA_DISABLE_MODE		(1 << 20)
+#define DSIM_HBP_DISABLE_MODE		(1 << 21)
+#define DSIM_HFP_DISABLE_MODE		(1 << 22)
+/*
+ * The i.MX 8M Mini Applications Processor Reference Manual,
+ * Rev. 3, 11/2020 Page 4091
+ * The i.MX 8M Nano Applications Processor Reference Manual,
+ * Rev. 2, 07/2022 Page 3058
+ * The i.MX 8M Plus Applications Processor Reference Manual,
+ * Rev. 1, 06/2021 Page 5436
+ * named this bit as 'HseDisableMode' but the bit definition
+ * is quite opposite like
+ * 0 = Disables transfer
+ * 1 = Enables transfer
+ * which clearly states that HSE is not a disable bit.
+ *
+ * This bit is named as per the manual even though it is not
+ * a disable bit however the driver logic for handling HSE
+ * is based on the MIPI_DSI_MODE_VIDEO_HSE flag itself.
+ */
+#define DSIM_HSE_DISABLE_MODE		(1 << 23)
 #define DSIM_AUTO_MODE			(1 << 24)
 #define DSIM_VIDEO_MODE			(1 << 25)
 #define DSIM_BURST_MODE			(1 << 26)
@@ -804,13 +821,13 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_AUTO_VERT)
 			reg |= DSIM_AUTO_MODE;
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HSE)
-			reg |= DSIM_HSE_MODE;
+			reg |= DSIM_HSE_DISABLE_MODE;
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP)
-			reg |= DSIM_HFP_MODE;
+			reg |= DSIM_HFP_DISABLE_MODE;
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP)
-			reg |= DSIM_HBP_MODE;
+			reg |= DSIM_HBP_DISABLE_MODE;
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA)
-			reg |= DSIM_HSA_MODE;
+			reg |= DSIM_HSA_DISABLE_MODE;
 	}
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
-- 
2.25.1

