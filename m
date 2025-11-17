Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 074BEC6292E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 07:47:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AED810E2C8;
	Mon, 17 Nov 2025 06:47:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bq4+YV5D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8C010E2C8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 06:47:24 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-7b852bb31d9so4376724b3a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 22:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763362044; x=1763966844; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3IbKKPsoRB1Mx3WXroKWoaQI9BjNXtHuFALXaeWnR5c=;
 b=Bq4+YV5Dl0nrnPFcL7cJjMsxLpaTzwLzm9b0ngSJjSQKjZG6Rq4UO4egLTXUBg/B9X
 KRjrWG5UcEcLqvsfAbcelcAGe1xOb6RUCPSwSf9AzrE97g80P1blvy+h+yLAA8D/NlhT
 nqy0NmDiFlduP0n3ROZD1hX8ZtkgCGEY3LooQic7zYpxV84IuQbKd4W3xjfx1p/+keUL
 pr4cH/pd4M0Qt8zJUe3PMsWUlv92LwwJTxiFr3Seb32pXNu4RqUVt4QOx9+FMNZefCoJ
 Ze6QPG4395wL4Ye4YeDeNOTWecZ79dw5G6ncVn0sC8CBjiXSDdmIga3iB2oVCGraeXNL
 QQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763362044; x=1763966844;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3IbKKPsoRB1Mx3WXroKWoaQI9BjNXtHuFALXaeWnR5c=;
 b=lLh7w/Xrw6Apm3tYLi0uMy09YicXen6cCTwkqpCRFU2V/rUt21z3mnaPpZ0PvYgzhA
 /b+ukTGEvN+g1OUaJ+Pap8uss7nIy4a/WFHWiJnKnwOb0ZSzg4JcipbmgRoKRjD5FDUJ
 k6+TOG6Bvw9yfhp3e2iSV15HrZ0qCorME0e7K2V6Y8Lxs/nz2EyGS6VrB3KC4ilxNym1
 oMaN5+yCSR+v3zIT2Y/EvLFrJ3yrxlsX8+jodII62s/BocAppgO3tp4nka7Q4JW04NfI
 aKj79SKbMjkf9M4xyNSGxiIRjT034V0ln9/r4qFOSq9Lxz2fhKlZBehlKr/2lQNek98A
 W/Tw==
X-Gm-Message-State: AOJu0YzFemAFK89PwYIhQM95jlAcJBBRV8QMZHv/5jBZurUskLI951PS
 +/6+VpbbXT2UTfUNkRd0NAdmzFld4M5J27OgHdsZSTGKUcTDfC9ANYNagtRX/tfX
X-Gm-Gg: ASbGncvfYkkjvN7nPwM8YpPpcVgU3oWuH9q68Cd9kgSy9tjkl5I8dO/gB7JyzYNlktR
 xlO5FsfFGgrrhxdSuj+f8oFBoIG4Nj/SHXffL+Zaee41YRVFdFakMcywf7//zuD8oLqPXI5F3WS
 OtlW5qlRVwA0YlIrfmiEzrGVpYBTzet0nHHnx5tonWsKBNMBMqhKbfY7I7cYtYEbyCIevMZuyEF
 e8CsykIu8Cnlco3Zaau7AyswlBXYKAW2y+AVJ44lkM58IJOREwiJKzsznu/UCO7wV8c+oyH68rL
 8/UToEz51OSgjz+USEj8euXw7E5EN5BItSR49pSC/NMf9iM/ykvN1qc73AAVa+Z50T4gxssRdU9
 6KnrizfUR0qr6xmLZZfCjy6Y3whWSm2mzXqIqzmQIbQRn+/7xN66W9GDbsP9LfMfcHmMeHKQalr
 Hi5U+9ENX72QYHf/HsQTOuu+zyeVR8Nv10hpKA5YN735h7OVRygw==
X-Google-Smtp-Source: AGHT+IHJ49e+9ouwcUmzJ+pb4Jq299H7iuxWmBHY4uSa5JwRG/6wBhvME+Kno1HDnyjOHCqpxYkLyw==
X-Received: by 2002:a05:6a20:6a28:b0:262:cbbc:3125 with SMTP id
 adf61e73a8af0-35ba047d55amr13901423637.20.1763362044079; 
 Sun, 16 Nov 2025 22:47:24 -0800 (PST)
Received: from rahul-mintos.ban-spse ([165.204.156.251])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc36db21a0esm10866359a12.8.2025.11.16.22.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Nov 2025 22:47:23 -0800 (PST)
From: Abhishek Rajput <abhiraj21put@gmail.com>
To: jagan@edgeble.ai, neil.armstrong@linaro.org,
 jessica.zhang@oss.qualcomm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhiraj21put@gmail.com
Subject: [PATCH] drm/panel: jadard-jd9365da-h3: Use dev_err_probe() instead of
 DRM_DEV_ERROR() during probing
Date: Mon, 17 Nov 2025 12:17:02 +0530
Message-ID: <20251117064702.222424-1-abhiraj21put@gmail.com>
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

The DRM_DEV_ERROR() has been deprecated, and use dev_err_probe()
can be better. The other reason is that dev_err_probe() help avoid
unexpected repeated err logs during defered probing.

Signed-off-by: Abhishek Rajput <abhiraj21put@gmail.com>

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index 5c2530598ddb..aa05316dc57b 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -1132,22 +1132,19 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
 	dsi->lanes = desc->lanes;
 
 	jadard->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(jadard->reset)) {
-		DRM_DEV_ERROR(&dsi->dev, "failed to get our reset GPIO\n");
-		return PTR_ERR(jadard->reset);
-	}
+	if (IS_ERR(jadard->reset))
+		return dev_err_probe(&dsi->dev, PTR_ERR(jadard->reset),
+				"failed to get our reset GPIO\n");
 
 	jadard->vdd = devm_regulator_get(dev, "vdd");
-	if (IS_ERR(jadard->vdd)) {
-		DRM_DEV_ERROR(&dsi->dev, "failed to get vdd regulator\n");
-		return PTR_ERR(jadard->vdd);
-	}
+	if (IS_ERR(jadard->vdd))
+		return dev_err_probe(&dsi->dev, PTR_ERR(jadard->vdd),
+				"failed to get vdd regulator\n");
 
 	jadard->vccio = devm_regulator_get(dev, "vccio");
-	if (IS_ERR(jadard->vccio)) {
-		DRM_DEV_ERROR(&dsi->dev, "failed to get vccio regulator\n");
-		return PTR_ERR(jadard->vccio);
-	}
+	if (IS_ERR(jadard->vccio))
+		return dev_err_probe(&dsi->dev, PTR_ERR(jadard->vccio),
+				"failed to get vccio regulator\n");
 
 	ret = of_drm_get_panel_orientation(dev->of_node, &jadard->orientation);
 	if (ret < 0)
-- 
2.43.0

