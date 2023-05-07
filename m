Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1A36F9B4E
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 22:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C4010E2DA;
	Sun,  7 May 2023 20:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF37E10E028
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 20:12:23 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ac7ac8a4ffso42446991fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 07 May 2023 13:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683490342; x=1686082342;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=92Z832aMBC33/Bfq4zZaoBxYDVdvd+BYhXisQliMM1w=;
 b=LqrDriwjwo8e3FhHxwRi6zW6yQmmotVBbQob+58IhXiHrr0A5YFpaITYvd4lMUNerM
 noKx6dD2Qz4TG6tNrtwEJzhV8KAdEo+awr/9yk89xLqJVIkcuPnxdCMQNBBnAAGIxTer
 uEJnkGainOSUvRSETKNHLvimu3cYIepJr3DPOYTX05ABxVTk4VRGKY68wHQRoHkffaT+
 11/NP4s1DXZ2clFrp32kLy2WQsB9HrmUjr2/aKHSQRGt8olE69GNzgViXi9Flwsemvie
 L3Vct9egyiAIamaGjESbiPpn8NRdip4M63HV+9RujAywT/ZxP+bhQKcN7l/w2+7iKs2e
 7UIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683490342; x=1686082342;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=92Z832aMBC33/Bfq4zZaoBxYDVdvd+BYhXisQliMM1w=;
 b=fXXLHOOwwXSroBGN0jHzv/fqAb7hGsFMyGsrohJ6aJLJU10cussUi1cJVowibmbofh
 wM93+ID5MG1UYQ+/a6wgrG9clUHpncHxkVXGLs6DRnlYot10txcw7W0N3ApZ5S+qr4Yc
 5QjQts4yurQti2++Lg3nMIlYbwx4mYkWi2xgvruA6uVAWrdugE/cGN9yA5F90Z1lh9Uc
 mXJLq1+x4/HU8x7gQdSBX3ZDJoyLgETTo2GJKRVgJKIsroCrBr2alQYsrUpkw/QCGToD
 xLHpTFMvXC+dAc4DOvVKB6j23OVm03/OipQpLs0mKir3DqaqzefYWWdwQ71h5ceX0Cog
 bs8A==
X-Gm-Message-State: AC+VfDx5I3j/CyJ32vqG6xgAmaeX7+F5AJDlZ0PPLMPOR4emXKcTKLOf
 a76NF6B0IwwsPWfFS0qGITlcQQ==
X-Google-Smtp-Source: ACHHUZ7r6qt3TaSWm4LhzF/81gZ5OK/0uOnM2ZCXJvJX/0kOufF46BJDlTje8RYxybzOErdmGQLC9Q==
X-Received: by 2002:a2e:908c:0:b0:2a8:eee0:59f3 with SMTP id
 l12-20020a2e908c000000b002a8eee059f3mr2123188ljg.41.1683490341899; 
 Sun, 07 May 2023 13:12:21 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 f5-20020a2e3805000000b002ac74f5f022sm916522lja.0.2023.05.07.13.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 13:12:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 3/3] drm/bridge: display-connector: handle hdmi-pwr supply
Date: Sun,  7 May 2023 23:12:18 +0300
Message-Id: <20230507201218.2339014-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507201218.2339014-1-dmitry.baryshkov@linaro.org>
References: <20230507201218.2339014-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On some devices the 5V pin of the HDMI connector and/or the ESD
protection logic is powered on by a separate regulator. Instead of
declaring this regulator as always-on, make hdmi-connector support the
additional hdmi-pwr supply.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/display-connector.c | 37 +++++++++++++++++-----
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index 0d94e6edea50..037ba2eb5a2f 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -337,18 +337,12 @@ static int display_connector_probe(struct platform_device *pdev)
 				return ret;
 			}
 		}
-
-		if (conn->connector_pwr) {
-			ret = regulator_enable(conn->connector_pwr);
-			if (ret) {
-				dev_err(&pdev->dev, "failed to enable DP PWR regulator: %d\n", ret);
-				return ret;
-			}
-		}
 	}
 
 	/* enable DDC */
 	if (type == DRM_MODE_CONNECTOR_HDMIA) {
+		int ret;
+
 		conn->ddc_en = devm_gpiod_get_optional(&pdev->dev, "ddc-en",
 						       GPIOD_OUT_HIGH);
 
@@ -356,6 +350,33 @@ static int display_connector_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "Couldn't get ddc-en gpio\n");
 			return PTR_ERR(conn->ddc_en);
 		}
+
+		conn->connector_pwr = devm_regulator_get_optional(&pdev->dev, "hdmi-pwr");
+
+		if (IS_ERR(conn->connector_pwr)) {
+			ret = PTR_ERR(conn->connector_pwr);
+
+			switch (ret) {
+			case -ENODEV:
+				conn->connector_pwr = NULL;
+				break;
+
+			case -EPROBE_DEFER:
+				return -EPROBE_DEFER;
+
+			default:
+				dev_err(&pdev->dev, "failed to get HDMI PWR regulator: %d\n", ret);
+				return ret;
+			}
+		}
+	}
+
+	if (conn->connector_pwr) {
+		ret = regulator_enable(conn->connector_pwr);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to enable DP PWR regulator: %d\n", ret);
+			return ret;
+		}
 	}
 
 	conn->bridge.funcs = &display_connector_bridge_funcs;
-- 
2.39.2

