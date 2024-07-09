Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB74892BBB4
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 15:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 420CC10E55A;
	Tue,  9 Jul 2024 13:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="QUX+MV/h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4944A10E553
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 13:48:22 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1fb64d627b0so14225655ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 06:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1720532902; x=1721137702; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EcZGfscxWH1cfj2JazAFXoJC02WpocVggpq54m1oHTg=;
 b=QUX+MV/hjFM1Zu+yFbIabCrzWQtLd5CVI7F8UH1Dpedugmpj3k4vE4pMTmPaul2Nyp
 Y78z3jeAgKOgenX3MI10uMB6zp4nrWTJWfY3cBFYU/bHfTyWljavIUk9ldDQ57U8WmM+
 sBBmt9OxfgFdcuR/Dro4PLShLwuDPxPLvF7uL9eP/Qnsqgj6piDeA5LfTz74/f/9mg5f
 dy8vz0cd4jWRnthm8PYs3CDzoCqC4vxCz4hILyobf9fWrB8tzMA7Jz2ToLztseHf9FA3
 N7p9U/sfRZnGyA6Fi7fg6M9N1Ch0DcuJjD9R62SUGmGaCkmBiuzZ2MjK/Adgo8Idr0sz
 tnqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720532902; x=1721137702;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EcZGfscxWH1cfj2JazAFXoJC02WpocVggpq54m1oHTg=;
 b=SGf4Ft8YPlRKT8Glw85gnjU2fvVKu6b9y66O8nwWHAVbEaNYp+lsxGQdJF4BHKdmOB
 EWov6BjdF2f3+Uxj7a/LQuNsaaZtj5D83DZIzallz1lb7UoJzNQps+JK/6doj+XKhp0u
 2tDwQpJNRO2bpWv4saIyoHf+Jqhyh6JKI0ZVwCeXhez81QeJbGtt1JaC1g+MLnlGiOc6
 u/B51Xj375mACOr1Xs1ZjS5jlo54B/LMq8MCOBJx4ZKokeiSNShmfxMody96uydbE4U5
 0CQxuTvKc1du9XrTz7nOwntsbijWgGYX+Xbr0mJJMl9LHk+eEc5L3IZiZP3RiVJSFGlH
 uPKA==
X-Gm-Message-State: AOJu0YwFnHA2kPIqSWacPJ30M09iH2RxC0QE+oG6sRTK0RtrJCGyLVDA
 +xn0aVLRlLO5cUy0QXY+WoLaoX9SnZbvuzMiq4ZYOUYUti5rkDE6T/LiEhy5Yw8=
X-Google-Smtp-Source: AGHT+IFX21o+X3VwRasdQwyrEqH0PuWe1B+40bbzeOg94dAYx5KftRVmTty5gE2r5cIfdyuv5HR6pw==
X-Received: by 2002:a17:902:d552:b0:1fb:90bd:afc2 with SMTP id
 d9443c01a7336-1fbb6d2516emr17327055ad.36.1720532901816; 
 Tue, 09 Jul 2024 06:48:21 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6ab6b9fsm16211685ad.138.2024.07.09.06.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 06:48:21 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, airlied@gmail.com,
 mripard@kernel.org, dianders@google.com, hsinyi@google.com,
 awarnecke002@hotmail.com, quic_jesszhan@quicinc.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v6 2/5] drm/panel: boe-th101mb31ig002: switch to
 devm_gpiod_get_optional() for reset_gpio
Date: Tue,  9 Jul 2024 21:47:51 +0800
Message-Id: <20240709134754.28013-3-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240709134754.28013-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240709134754.28013-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

Switch the driver to use devm_gpiod_get_optional() on reset_gpio to avoid
driver probe issues when reset line is not specified.

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
---
Changes between V6 and V5:
-  1. No changes.
v5: https://lore.kernel.org/all/20240704072958.27876-3-lvzhaoxiong@huaqin.corp-partner.google.com/
---
 drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
index 8f03920e3503..b92082bfc932 100644
--- a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
+++ b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
@@ -286,7 +286,7 @@ static int boe_th101mb31ig002_dsi_probe(struct mipi_dsi_device *dsi)
 		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->enable),
 				     "Failed to get enable GPIO\n");
 
-	ctx->reset = devm_gpiod_get(&dsi->dev, "reset", GPIOD_OUT_HIGH);
+	ctx->reset = devm_gpiod_get_optional(&dsi->dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(ctx->reset))
 		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->reset),
 				     "Failed to get reset GPIO\n");
-- 
2.17.1

