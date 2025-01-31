Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3459A23A2F
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 08:35:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012C210EA23;
	Fri, 31 Jan 2025 07:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="k2X3/oLP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D0B10EA23
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 07:35:05 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2161eb94cceso20068045ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 23:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1738308905;
 x=1738913705; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aQHz63JJqIEOU3JbuW7+imJYEN8GGWGxWep+wHv/Pek=;
 b=k2X3/oLP4J9F3+MzKWrdpedzDi4Gp68WFLG5D8quch1O/UbGITLe3ju584gRERxehF
 mT308hLKp6ZFmKuyMjyxfQN8ReCcwjekclWsH4RQyEtsXGCxVeldLRHEqgfq+qbi82C+
 rRRpC8MHwzp45fvZFjEHrXPwmDzKwzYYufOOpQZOSRpwzLATDfmDCSMYlco5Ajea9QPj
 vO0gtbJTf/VQtIG5YMYLc5G14RyzZi4pbj5LdZGqPT5S0502XT0CTykTinCae1bW8v9j
 n5Soxo8mLq9XjTxMeoFx3BmctPYP0FY5EB6amfltKhF0oNa1r6akG2oS/N6AGgRvZhgd
 Klcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738308905; x=1738913705;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aQHz63JJqIEOU3JbuW7+imJYEN8GGWGxWep+wHv/Pek=;
 b=S574/qRPtgSsaFRogh3/a00qzAcWGATiA3TD9yns1QA1GKCSlHdJoVAio3fuN/+r6a
 Vl0BVGnaaOxQRkO9f9bEEVdymPTmh4ClKspWZfLitbnvYkWlQ4kMpe37rE3RF35xV6l/
 Sbyh1Sd8ddsHoAwqf29iZXfdkCWkk5VZUINjUKpUY1BWZXcpLRAh4Oqk/uZ+eF404l+C
 L8IVT9aIH9BvuVMHSlSxZTphK4SwKzcOe0gUq+1jooVIRFls8Lc0I9aEZAWVVYxbHg48
 56iZp5UqVafdQbmiP2imf+PKMXkwLVWxNYaAEqaZ+v1AWHpqaCA10ZWKq4PNNlkOiDwy
 kTbg==
X-Gm-Message-State: AOJu0YzXTPlxr+V1FhiepQXgxns8iQW8FKO7/ZuiUUeTT68a+RFm3q1r
 DIS17kv8IF0uyJ0qUavEOv2nWthVhgxvOTl2vxdAIdozybarEt75+j945AIa0Yw=
X-Gm-Gg: ASbGncspS2jVzOBZAM9A7qycU65M7dIa9ALIlCrJyjxM3c+FqGWQAnYBnsUfmZVrrgb
 KJNxST7nPQE1qo3aY6TueHNwvKC5TsLPep5cwd50alZPLUgROlvEYgb+Wwxc1b6SRWiUAqCQ2cT
 4Wiu430MrpQQUVhYj5gEpZ5j33YkZgrm9M5hKytkC4dM4752PUyOrwfI5L9U4AF2E5310BbHfJT
 uCtlxtw1CKDpHq0dL1XimLkekFtG/YmOwukaHMnM+/o053FXN3mjppCDiIZGhpWT94JHh157B4w
 cnXnTgEgFY3TQQ/p1yKndO7hesbmPmF/qP1MQlmnEhg=
X-Google-Smtp-Source: AGHT+IHmopWj+UQtWyVFZd4kY/yyGWNXZheYB1RrU7b4H9wkZMFciEYw0nqH0BWjaRvZuVBNiYTfgw==
X-Received: by 2002:a17:902:dacd:b0:216:50fb:5dfc with SMTP id
 d9443c01a7336-21dd7c3cddemr131884635ad.9.1738308905111; 
 Thu, 30 Jan 2025 23:35:05 -0800 (PST)
Received: from joe-White-Brand-Product..
 ([2001:f70:39c0:3a00:b655:219:8dac:8f58])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-acec04796c9sm2480729a12.62.2025.01.30.23.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 23:35:04 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, dmitry.baryshkov@linaro.org,
 dan.carpenter@linaro.org, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH v4] drm/bridge: display-connector: implement the error path of
 .probe()
Date: Fri, 31 Jan 2025 16:34:53 +0900
Message-ID: <20250131073453.551252-1-joe@pf.is.s.u-tokyo.ac.jp>
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

Current implementation of .probe() leaks a reference of i2c_adapter.
Implement an error path and call put_device() on the obtained
i2c_adapter in it to fix this refcount bug.

Also, remove the IS_ERR() check before calling
i2c_put_adapter(conn->bridge.ddc) since conn->bridge.dcc is either NULL
or a valid pointer, and a null-check is already done in
i2c_put_adapter().

This bug was found by an experimental verification tool that I am
developing.

Fixes: 0c275c30176b ("drm/bridge: Add bridge driver for display connectors")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
Changes in V4:
- Stopped assigning the return value of dev_err_probe().
- Updated the commit message.

Changes in V3:
- Removed shadowed variables (ret).

Changes in V2:
- Omit the null check before calling i2c_put_adapter().
---
 drivers/gpu/drm/bridge/display-connector.c | 31 +++++++++++++---------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index 72bc508d4e6e..52a86f99fa45 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -329,35 +329,39 @@ static int display_connector_probe(struct platform_device *pdev)
 
 	/* Get the DP PWR for DP connector. */
 	if (type == DRM_MODE_CONNECTOR_DisplayPort) {
-		int ret;
-
 		ret = display_connector_get_supply(pdev, conn, "dp-pwr");
-		if (ret < 0)
-			return dev_err_probe(&pdev->dev, ret, "failed to get DP PWR regulator\n");
+		if (ret < 0) {
+			dev_err_probe(&pdev->dev, ret,
+					    "failed to get DP PWR regulator\n");
+			goto err_put;
+		}
 	}
 
 	/* enable DDC */
 	if (type == DRM_MODE_CONNECTOR_HDMIA) {
-		int ret;
-
 		conn->ddc_en = devm_gpiod_get_optional(&pdev->dev, "ddc-en",
 						       GPIOD_OUT_HIGH);
 
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
+			dev_err_probe(
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
 
@@ -383,6 +387,10 @@ static int display_connector_probe(struct platform_device *pdev)
 	drm_bridge_add(&conn->bridge);
 
 	return 0;
+
+err_put:
+	i2c_put_adapter(conn->bridge.ddc);
+	return ret;
 }
 
 static void display_connector_remove(struct platform_device *pdev)
@@ -397,8 +405,7 @@ static void display_connector_remove(struct platform_device *pdev)
 
 	drm_bridge_remove(&conn->bridge);
 
-	if (!IS_ERR(conn->bridge.ddc))
-		i2c_put_adapter(conn->bridge.ddc);
+	i2c_put_adapter(conn->bridge.ddc);
 }
 
 static const struct of_device_id display_connector_match[] = {
-- 
2.43.0

