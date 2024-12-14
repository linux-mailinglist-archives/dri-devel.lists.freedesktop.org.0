Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BDD9F1F89
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2024 16:04:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EABA10E07F;
	Sat, 14 Dec 2024 15:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="LuSo0rEm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD9910E25D
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2024 01:26:59 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-728ea1573c0so2046773b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 17:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1734139618;
 x=1734744418; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5/+KurKcp2xVGxJIvQ1LDgS99/CeYiovkF9p6ewzEPQ=;
 b=LuSo0rEmwEZaBmknp47Ueo6KIDMLAMgJsGe7G3NxSyfDbnmq/NeN6GXMgr2KIOSWD3
 KpE/+0WM9Pp4eHxPC3SNlAn5th6Y8bqr9MIPDXX9kCBqNogy4cbnzSVHabubCSnnQoua
 sQecbFIl/YdTsI/XGRpNtCyaoDcHGpsHsGf4H4BrpHMuflqBgqlQeD27lwoChx5bPq8t
 Al3GsxGG8iNdHW9TeJmuwLU4IPixhzVCyDoylBYNFxX1Uu4LAc142kvgnoalu9stG5zu
 qvHhyQHqU/efZjqbOFDgrteDPwY2eRrootalZtRqPAsbCQb1zAPPH1GYKa4ICFiAZBEI
 kkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734139618; x=1734744418;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5/+KurKcp2xVGxJIvQ1LDgS99/CeYiovkF9p6ewzEPQ=;
 b=ixfFCT0ntPNMl9E8KNCbhk3KUOxyD5Dy6YOakwQWtnPFF4KC7vdW4P9rw3MDF4COsU
 GMeLyC5ey4nr6JftL7Fu8c8rxsNxqW7mDQG0Dd2P2h4ASe/Xy7Lfh6fM3zlHQnHm3ZKe
 ZMBUdpjXgfcLzGqDzW7agOnKRBqOG4/44WgVy+I6cQh8zakC2dx+ZriKePMrfzfwL9SJ
 dWofVHWF9ECsXb/d1+cvIvyB14jJRl9kqnP/Ob4VpmdMcc3m8fDd76NBjyyDV6g5vzfM
 iHn7h4ZY2Gm9KDygBnOHVtUkI3ZXvg9QDQne+Acn8mhQKxcVb+d99TnAaTQaYdp1upKV
 cEhQ==
X-Gm-Message-State: AOJu0YzWA8odDLFYTxEnO9E9RLv283q5MTwO1wiOiT7R3DZ11JUBnJup
 ykNX/8XKtHQQ2bl5ReA2dVJhZKPYm5zQ88EmF4OMwaEL53dEJUCT+p9x6i8nSbU=
X-Gm-Gg: ASbGncvrduASwtCmXHbetOrU3e3qD1rZUVQdF+dcvZD9kyoeqAZxNKXKpTLUZddDtRr
 KgiOxTsRWF6ndfVwwf4I1IqrIKYlbTBkuhRzFIBOpFtbbw+zvqACLhV1F8USVuslzbQGXXtNcDh
 cUcj6sSbiLd0YQNmtsf9b6g9qwm6OZapOdDEElAKL2nyTNC9hyJM6WV1KrYiauslIuIuKIJBeq6
 058Ohj6ZznXTUwBx1v1DNi5+ogaxh2UtAYKMdNpUX1pRcHgWg9aJLWpE3D2st76Q2ASbJm7NG7L
 TP8eOOIoybf60a3/ZcDWCAdvsUT3fDw8//wDbijBjFI=
X-Google-Smtp-Source: AGHT+IHSpi83dqQwXtTp2LnKsZP5838o2TCxqObtmtewymmgNwfTd6yPeZUvxHx/8DM+CUXGVRFAog==
X-Received: by 2002:aa7:8889:0:b0:724:bf30:3030 with SMTP id
 d2e1a72fcca58-7290be7250dmr7262712b3a.0.1734139618496; 
 Fri, 13 Dec 2024 17:26:58 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp.
 [133.32.227.190]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-801d5addbf9sm358087a12.47.2024.12.13.17.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 17:26:58 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH v2] drm/bridge: display-connector: implement the error path of
 .probe()
Date: Sat, 14 Dec 2024 10:26:52 +0900
Message-Id: <20241214012652.2104807-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 14 Dec 2024 15:04:01 +0000
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

Current implementation of .probe() leaks a reference of i2c_adapter.
Implement an error path and call put_device() on the obtained
i2c_adapter in it to fix this refcount bug.

This bug was found by an experimental static analysis tool that I am
developing.

Fixes: 0c275c30176b ("drm/bridge: Add bridge driver for display connectors")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
Changes in V2:
- Omit the null check before calling i2c_put_adapter().
---
 drivers/gpu/drm/bridge/display-connector.c | 27 +++++++++++++++-------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index 72bc508d4e6e..97f3a344a245 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -332,8 +332,11 @@ static int display_connector_probe(struct platform_device *pdev)
 		int ret;
 
 		ret = display_connector_get_supply(pdev, conn, "dp-pwr");
-		if (ret < 0)
-			return dev_err_probe(&pdev->dev, ret, "failed to get DP PWR regulator\n");
+		if (ret < 0) {
+			ret = dev_err_probe(&pdev->dev, ret,
+					    "failed to get DP PWR regulator\n");
+			goto err_put;
+		}
 	}
 
 	/* enable DDC */
@@ -345,19 +348,24 @@ static int display_connector_probe(struct platform_device *pdev)
 
 		if (IS_ERR(conn->ddc_en)) {
 			dev_err(&pdev->dev, "Couldn't get ddc-en gpio\n");
-			return PTR_ERR(conn->ddc_en);
+			ret = PTR_ERR(conn->ddc_en);
+			goto err_put;
 		}
 
 		ret = display_connector_get_supply(pdev, conn, "hdmi-pwr");
-		if (ret < 0)
-			return dev_err_probe(&pdev->dev, ret, "failed to get HDMI +5V Power regulator\n");
+		if (ret < 0) {
+			ret = dev_err_probe(
+				&pdev->dev, ret,
+				"failed to get HDMI +5V Power regulator\n");
+			goto err_put;
+		}
 	}
 
 	if (conn->supply) {
 		ret = regulator_enable(conn->supply);
 		if (ret) {
 			dev_err(&pdev->dev, "failed to enable PWR regulator: %d\n", ret);
-			return ret;
+			goto err_put;
 		}
 	}
 
@@ -383,6 +391,10 @@ static int display_connector_probe(struct platform_device *pdev)
 	drm_bridge_add(&conn->bridge);
 
 	return 0;
+
+err_put:
+	i2c_put_adapter(conn->bridge.ddc);
+	return ret;
 }
 
 static void display_connector_remove(struct platform_device *pdev)
@@ -397,8 +409,7 @@ static void display_connector_remove(struct platform_device *pdev)
 
 	drm_bridge_remove(&conn->bridge);
 
-	if (!IS_ERR(conn->bridge.ddc))
-		i2c_put_adapter(conn->bridge.ddc);
+	i2c_put_adapter(conn->bridge.ddc);
 }
 
 static const struct of_device_id display_connector_match[] = {
-- 
2.34.1

