Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C94D525E156
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 20:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABDF86E092;
	Fri,  4 Sep 2020 18:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13056E092
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 18:09:01 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id v15so4723638pgh.6
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 11:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IF4hZRilImi4GxcYV7qEP7KPFRG9zaXJ3kKDrwVOQs4=;
 b=IHef9VrWxwXnNg13BXyKnAQivvkeN+lXiPl4dz8j2xcTf6cDy2iA4NyhW5KSHDXL57
 ZDKNOPOGC7eZc0a5p4KBydw1He+hnLV89apGSLi8zJ4u/AkiQESxZpmxkYApIeMHybjP
 30H+4nB698PbsR82NQhxo6opiAD6tJ9MJNxnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IF4hZRilImi4GxcYV7qEP7KPFRG9zaXJ3kKDrwVOQs4=;
 b=H/EwkqWAMTdzsXr0NgrmSoeoMRD6iycXO2xM14ca0rjXcUb9v9CTdwt0cLWDC5x7fJ
 RGWEm4CV1Nk09DyPIs/kBjWygaehzXFtyNA35v9yJMvu5KBWjXAuSRyM3mZadT/rywiV
 DLPPikIERUDdKDLTOmJqmHL1tq6ln7oVfo9FNql03y11sfk0kebMypDhkD0TSdvfA3EJ
 +lH8klwR5IkQZ59NYfqOTsdks41zlQzUjgJrjynOD7szL6/6Wf1oOzSfPtP9AEArDkK1
 aQ4UjDi6PhLDrc78vkdUlxbvtxmjZqSrBN7sm11ZsT77QcGwyGAVhjW/SONFJcdGvR+t
 vQ7A==
X-Gm-Message-State: AOAM530Z6VqHfUpEBG9ZyNNSCf0xjBUIMTHym7slEmOyK5+Q5S7h6W4U
 FrQvj15TkVkFOOv9EsxWHNx+4dI7j6ruxg==
X-Google-Smtp-Source: ABdhPJwV7R5MJBq0lY0RQvR78do2fecNytmePNDLyXB9T9y/8s9S7ztIMlIbQ2EGqdfi0qbtKjwtcw==
X-Received: by 2002:a63:dd0f:: with SMTP id t15mr6923191pgg.123.1599242941476; 
 Fri, 04 Sep 2020 11:09:01 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:b9ea:24bf:6b2b:1eee])
 by smtp.gmail.com with ESMTPSA id 131sm7448281pfy.5.2020.09.04.11.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 11:09:00 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 3/3] drm/panel: simple: Add YTC700TLAG-05-201C
Date: Fri,  4 Sep 2020 23:38:21 +0530
Message-Id: <20200904180821.302194-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200904180821.302194-1-jagan@amarulasolutions.com>
References: <20200904180821.302194-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, linux-amarula@amarulasolutions.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add panel timings for YTC700TLAG-05-201C 7" TFT LCD panel from
Yes Optoelectronics Co.,Ltd.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index b106142b11ca..9ca9a6b2ebc1 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3634,6 +3634,32 @@ static const struct panel_desc winstar_wf35ltiacd = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 };
 
+static const struct drm_display_mode yes_optoelectronics_ytc700tlag_05_201c_mode = {
+	.clock = 51200,
+	.hdisplay = 1024,
+	.hsync_start = 1024 + 100,
+	.hsync_end = 1024 + 100 + 100,
+	.htotal = 1024 + 100 + 100 + 120,
+	.vdisplay = 600,
+	.vsync_start = 600 + 10,
+	.vsync_end = 600 + 10 + 10,
+	.vtotal = 600 + 10 + 10 + 15,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
+};
+
+static const struct panel_desc yes_optoelectronics_ytc700tlag_05_201c = {
+	.modes = &yes_optoelectronics_ytc700tlag_05_201c_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 154,
+		.height = 90,
+	},
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct drm_display_mode arm_rtsm_mode[] = {
 	{
 		.clock = 65000,
@@ -4040,6 +4066,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "winstar,wf35ltiacd",
 		.data = &winstar_wf35ltiacd,
+	}, {
+		.compatible = "yes-optoelectronics,ytc700tlag-05-201c",
+		.data = &yes_optoelectronics_ytc700tlag_05_201c,
 	}, {
 		/* Must be the last entry */
 		.compatible = "panel-dpi",
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
