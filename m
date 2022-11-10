Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B70D46249A8
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 19:40:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C10610E795;
	Thu, 10 Nov 2022 18:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F12210E795
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 18:40:31 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 m14-20020a17090a3f8e00b00212dab39bcdso5618944pjc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 10:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dWQPw8kMGq61u2i3C2KyyYluiC9el7Rd/PLrQ+mO7W0=;
 b=goQ7p8zPMXgAfhGlVCGrkGciAvJvmErOHid9LNIxI1xYET7qKUmr9Bywo1rflRousl
 odZTkXfJVZ6eW4sC9UlxmmjbB018tUSujGgQOqVZVtFlext72knTU56pDrw3FxYreB1R
 LqJH4YejnEge4CFgaubqgxeWpPhqGKmYIqJxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dWQPw8kMGq61u2i3C2KyyYluiC9el7Rd/PLrQ+mO7W0=;
 b=Xrdw1QqXaA5mihtN+IVI45pT9dw2iV2whHo19JoqL1KBGKiuRexXB2km3zyM9kjJJe
 sxvZ9TZv7/DxI6ossVWx61KIbWvOtTxy4E1aKjch1X0UlEJ0MGKaBlWglcozmu95orSF
 Wi+ZZV1Zc73eOf92lwprag5cvVc218ej2/901GU9X604VrHD2VkIovrRERrKzyQWVPf0
 EntRytY8m+WkjUSE815OrH0d9HPQVLTkvX7woIFjdnwzJUO3U8Lp+5b4erdj9S8f2Wtf
 uswsz9t/Erx2+IfrmhrKssYHJg/0iMN6Y4efPcVjZtEQ5m8bbIdt484rx0i6EiO1bd8x
 X3gQ==
X-Gm-Message-State: ANoB5pnHc1CGWMhfzfojFOY+c/lk9VtD/Q9ZrgSWt7LXzyW5p0Az21lR
 ctrZvN7L3n+NtW5ZZtHtH5XBUw==
X-Google-Smtp-Source: AA0mqf5tMAPa5oKIRBRnWVvCjzLXh/u5bEn5mb8qPkVZv230xJzCgmMNSwOxtAdxATEyBohMaemNbA==
X-Received: by 2002:a17:902:c3d1:b0:188:758f:f473 with SMTP id
 j17-20020a170902c3d100b00188758ff473mr25672647plj.113.1668105631202; 
 Thu, 10 Nov 2022 10:40:31 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:b5a4:486a:f07:f67e])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170903234200b001869efb722csm11635627plh.215.2022.11.10.10.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 10:40:29 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v8 02/14] drm: exynos: dsi: Properly name HSA/HBP/HFP/HSE bits
Date: Fri, 11 Nov 2022 00:08:41 +0530
Message-Id: <20221110183853.3678209-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110183853.3678209-1-jagan@amarulasolutions.com>
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

HSA/HBP/HFP/HSE mode bits in Exynos DSI host specify a naming
conversion as 'disable mode bit' due to its bit definition,
0 = Enable and 1 = Disable.

Fix the naming convention of the mode bits.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index b5305b145ddb..fce7f0a7e4ee 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -75,10 +75,10 @@
 #define DSIM_MAIN_PIX_FORMAT_RGB565	(0x4 << 12)
 #define DSIM_SUB_VC			(((x) & 0x3) << 16)
 #define DSIM_MAIN_VC			(((x) & 0x3) << 18)
-#define DSIM_HSA_MODE			(1 << 20)
-#define DSIM_HBP_MODE			(1 << 21)
-#define DSIM_HFP_MODE			(1 << 22)
-#define DSIM_HSE_MODE			(1 << 23)
+#define DSIM_HSA_DISABLE		(1 << 20)
+#define DSIM_HBP_DISABLE		(1 << 21)
+#define DSIM_HFP_DISABLE		(1 << 22)
+#define DSIM_HSE_DISABLE		(1 << 23)
 #define DSIM_AUTO_MODE			(1 << 24)
 #define DSIM_VIDEO_MODE			(1 << 25)
 #define DSIM_BURST_MODE			(1 << 26)
@@ -804,13 +804,13 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_AUTO_VERT)
 			reg |= DSIM_AUTO_MODE;
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HSE)
-			reg |= DSIM_HSE_MODE;
+			reg |= DSIM_HSE_DISABLE;
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP)
-			reg |= DSIM_HFP_MODE;
+			reg |= DSIM_HFP_DISABLE;
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP)
-			reg |= DSIM_HBP_MODE;
+			reg |= DSIM_HBP_DISABLE;
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA)
-			reg |= DSIM_HSA_MODE;
+			reg |= DSIM_HSA_DISABLE;
 	}
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
-- 
2.25.1

