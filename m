Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E272D9399AC
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 08:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D18210E0BC;
	Tue, 23 Jul 2024 06:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="g/yOOoN1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E79210E0BC
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 06:26:30 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1fc66fc35f2so3774205ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 23:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1721715990; x=1722320790; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Gkiwi2HblLWIRJEo+ICl77dLaAlbyjAEjVCFsYMguCg=;
 b=g/yOOoN1y8RZ/DNTwr2IC9RzV8FcjSR1THsucu3Uw1591Yby8JqISjVK+vx3ceyAlc
 +DK06wY+8zWW7Ym0hAtEJk2fxu0wlz4Gof8cZwSOyyxTruOx06fCLSzrv0Kv40upRFF5
 1MCBPt4eyQFFQdmHIQWiifzwQu0IGSw4mHriyDYW3XlnrWLjhql5REfNcJHEq6Jp32rm
 X9gHmW/MdUFq1QMLjdF7+RgqAO7miLHaFT6aUOOSo58A3LFZC1EGstXMjDppmw8/e4Ju
 XsOzzwkVps3pcg2mUY3RygfGL6bvXf39uXlR7bC9dGkUMUT31h2Ks0OtBUAgyLLcQDVh
 0v3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721715990; x=1722320790;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gkiwi2HblLWIRJEo+ICl77dLaAlbyjAEjVCFsYMguCg=;
 b=mRcsNWcJIMLvlAii86btLIfVH57w5jTM1q17mr/MthqhYRl3VN6IYSD8EPBIVkp9Ds
 2hIOLlBiTVOCNcj6rNe0JeRToPvDQCYiVcIQxlxWg7rnIoIkEaXsLS2VorrRp1yPX+9E
 SnSU4e1Ta2HdXL/qp6sNZDlcLgEG5fC+qXBC4bPadcjFJL1B+y6xXYhj7NQDPehnnVu3
 g5WJRAGb9L71aLOM5/L0da0O2SfcO3f8xf3ecv9N5YBYtSt3jwuKNPGVvkHsZjh8KFVy
 JtJylsbCJ8HTeeC2WB0pWmH36qrwx5kI6aFy2u4yATfSFUqBjD7jgidcMCC0/DfayXV7
 f2ZA==
X-Gm-Message-State: AOJu0YzgyN4xR3tTSdrbWwzH/eGqSLSt3l93JRmbGEzleNylAkdqsT9T
 zWuqhBAvoW0w4c/wyFaMYix01zoceJTOvnjY1B9J7GqV1rQqT/fTejG8RXJDDhI=
X-Google-Smtp-Source: AGHT+IEMEYV49A/7sN13fNs7QtDLUZ+KsEivgaXNWoeS2uNGXFKSc3HIPXHBpH2cEqizv54RUEDbdg==
X-Received: by 2002:a17:902:d509:b0:1fc:4acb:3670 with SMTP id
 d9443c01a7336-1fdb95128e9mr16250375ad.12.1721715990126; 
 Mon, 22 Jul 2024 23:26:30 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fd6f25ab47sm66351465ad.45.2024.07.22.23.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 23:26:29 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 dianders@chromium.org, hsinyi@google.com, awarnecke002@hotmail.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v4 1/2] drm/panel: boe-th101mb31ig002 : Fix the way to get
 porch parameters
Date: Tue, 23 Jul 2024 14:26:14 +0800
Message-Id: <20240723062615.14796-2-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240723062615.14796-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240723062615.14796-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

The current driver can only obtain the porch parameters
of boe-th101mb31ig002. Modify it to obtain the porch
parameters of the panel currently being used.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
---
Changes between V4 and V3:
-  1. No changes.
v3: https://lore.kernel.org/all/20240722092428.24499-2-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V3 and V2:
-  1. No changes.
v2: https://lore.kernel.org/all/20240716121112.14435-2-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V2 and V1:
-  1. No changes, Modify the commit information format.
v1: https://lore.kernel.org/all/20240715031845.6687-2-lvzhaoxiong@huaqin.corp-partner.google.com/
---
 drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
index b55cf80c5522..d4e4abd103bb 100644
--- a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
+++ b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
@@ -312,15 +312,14 @@ static int boe_th101mb31ig002_get_modes(struct drm_panel *panel,
 	struct boe_th101mb31ig002 *ctx = container_of(panel,
 						      struct boe_th101mb31ig002,
 						      panel);
+	const struct drm_display_mode *desc_mode = ctx->desc->modes;
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev,
-				  &boe_th101mb31ig002_default_mode);
+	mode = drm_mode_duplicate(connector->dev, desc_mode);
 	if (!mode) {
 		dev_err(panel->dev, "Failed to add mode %ux%u@%u\n",
-			boe_th101mb31ig002_default_mode.hdisplay,
-			boe_th101mb31ig002_default_mode.vdisplay,
-			drm_mode_vrefresh(&boe_th101mb31ig002_default_mode));
+			desc_mode->hdisplay, desc_mode->vdisplay,
+			drm_mode_vrefresh(desc_mode));
 		return -ENOMEM;
 	}
 
-- 
2.17.1

