Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A371CA23947
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 06:19:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE5C10E189;
	Fri, 31 Jan 2025 05:19:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="pXyvbWfq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2FF010E189
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 05:19:28 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-21628b3fe7dso29075215ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 21:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1738300768;
 x=1738905568; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dp893NXciyaEfZuR/cXXI+2jEwHI0ahDDPjD9XUHDcs=;
 b=pXyvbWfqKc7lLECiXXrc0I2XYuUIW6OWY3wK0yL9wQo8k2lKQcNCD8HODdHE8bNThp
 xHc1H4ciTEXNTRqprgvKnKjDMvagoi35omDiAdRg7ln8L/dsaGMY/I/iB66C8vsSoZ0s
 tZ0/KZopve2tLUkgz39gWrYpC6npXQx36q9sybG7mcdZ30UWW1h0RFCcGf/x9KIBNOLC
 JbqTxy1X0OwX30Fz2xBF5MQSTF9lSv++IRNFTSsqrrb43EilAL4CHP97h1G3lKfn3cPZ
 WlGcNxjq6wM/xdjqIGZewEkmogI2xrPqckVsv0dlALN5DMMA8dNrOPm+OlfeuwibmEy6
 bBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738300768; x=1738905568;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dp893NXciyaEfZuR/cXXI+2jEwHI0ahDDPjD9XUHDcs=;
 b=YBMpGmfKXalAlCSOdHffRKhKWUWKIsAsxxkRDPF6y0l4mUNRxa3qnuJ+rFLO5/Myzg
 EJypMbzwyD4G53SmWl2dDi/6kTNqLmUHt5DumjuA7BKod1xdhvJmrF7nwX7oPq0GUr3a
 awOXvpShbV7t2vmEKBanmNMzCxjDLxTosElm7bCJH2Lzn6x2w/RAFwP+rZ85JabNUT3l
 7V+L44tliBbtbFCcjQBTryJ52vy0lldTWWAo2xaKtP61Ghh3oh+oEBU2MJ4teAgoUjfv
 Sh4StRgQSQIgn0lMipQXSAWEbxCfv8n3i51R1QlcEIVjx3cgtcjGbLn8TeSiEllW+6Co
 11tw==
X-Gm-Message-State: AOJu0Yxn5NHRv/5EsgLpYMZIh/MLuIwDeRfQhmZWOSlvuZgXQMBpjylj
 Ne2mkZwy01KDGB4GYKTipRtTjsspsxV/HdvExhKHh7b3tg5Z9y7RBG4GaT6MVRSQFEtUoeSLkDP
 K
X-Gm-Gg: ASbGncspdvaB8eTdUMPTL72Wul9qZ1doN22hrVhKywGksVR83RA/WWDs10EC9Uzyxhi
 ebJv8WC2XrrkGvD8vr/QUW9xjW7+uusYsufkWowbsQPPqzd2PAEkfL+SM158pntiMJ80GZbEEHN
 OoyFcrtFpQi5gvxYPy4/9lQrxvJvdfmvOPCFi5guOwJrWR93L9qXyrLfYCagOZAyF/XO7XQ0YK/
 fsjWJfZ64rOlaeKtzVRhd1Y003xD3/07kVpQhWh2sY4/d/5uPBrZfJYRutEtLDBYey0qJ1fiszA
 CGSis/R7zLGGPD/JQgJ70T7WZ2jJH+UnxrKPzEGLtQE=
X-Google-Smtp-Source: AGHT+IHcRjZhOEwu38CtixKdVsRs+rXdS+8AvbuUQhGb+e9s3xvd//4xV1nN4dnZc09tlQXrA7cw5w==
X-Received: by 2002:a17:903:1110:b0:20d:cb6:11e with SMTP id
 d9443c01a7336-21dd7d73be6mr147496625ad.26.1738300768095; 
 Thu, 30 Jan 2025 21:19:28 -0800 (PST)
Received: from joe-White-Brand-Product..
 ([2001:f70:39c0:3a00:b655:219:8dac:8f58])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21de332520bsm22073095ad.247.2025.01.30.21.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 21:19:27 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, dmitry.baryshkov@linaro.org,
 dan.carpenter@linaro.org, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH v3] drm/bridge: display-connector: implement the error path of
 .probe()
Date: Fri, 31 Jan 2025 14:19:18 +0900
Message-ID: <20250131051918.549781-1-joe@pf.is.s.u-tokyo.ac.jp>
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

This bug was found by an experimental static analysis tool that I am
developing.

Fixes: 0c275c30176b ("drm/bridge: Add bridge driver for display connectors")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
Changes in V3:
- Removed shadowed variables (ret).

Changes in V2:
- Omit the null check before calling i2c_put_adapter().
---
 drivers/gpu/drm/bridge/display-connector.c | 31 +++++++++++++---------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index 72bc508d4e6e..411f9372e064 100644
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
+			ret = dev_err_probe(&pdev->dev, ret,
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

