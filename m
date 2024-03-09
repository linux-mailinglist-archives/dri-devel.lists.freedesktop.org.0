Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5688771CE
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 16:09:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF5E10E39C;
	Sat,  9 Mar 2024 15:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VJCZdBbv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A462B10E29D
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 15:09:10 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2d28051376eso20275211fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Mar 2024 07:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709996948; x=1710601748; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=aDBr2FAG34D/nO8EL2D1pYlW3kGuhkxGNLEsghBUPo4=;
 b=VJCZdBbvIUVT344rSRFupaq9ipYKg1lRLmHnnSgF2HNH9bbdDT5MTjkhIy+gxcA8rt
 AvarMJE3CY7VrT/Ch554LzJ3mBLSwRCt5Fm4UP2cdWS3hofpWZ6D1GWqU4RfReaMkkOT
 h4enW1DQBZkffBGcXIEWS1QJ3xKuHU6h8y0mKeDu5T6J/aS/LptFU7WfyrDh4vj+0DVH
 ZtKJz/GTZvULcUv4wM0sFg2+ozFh/EPdKM3p3z5DtL1uzXIi8D7qZuIrtX/RDuKzZJlY
 OhVRZtzHPB2eMBwPHkEyzW0xfKJz72usRlqFCc2tUKAPLjcExDzw6ZIwaRKtvl12S5K+
 L2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709996948; x=1710601748;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aDBr2FAG34D/nO8EL2D1pYlW3kGuhkxGNLEsghBUPo4=;
 b=Rj+z+YFY64ocIvjn3VQTWAmJDC+bZp+5NgLbBqLnK+6KLJQLzhr2LuQPVwe3u019r/
 FV0lL2RLKEhIkU0Coh/lwWRdBjBM+qoracpI9RNza/KVbbkK4OXVMfeB9U9vI+9sV/Pv
 X6nhtceKBfvMaCz4NEuTHKSU4YIXunvafodPiLvgiXqKQ14N0vxUW34I/PY5rWf7r4+2
 1WnsdJgoCWOoTVHbChaV7JZ0Zk9/Hy3kcZoBBxEb/fTay9ez5RDP/S4hlN1EJAFad8um
 J+2u7fSjJq3Z9kNoaC/2pdwRpRZh1lHHBavTdNEUIwTVNlhcpY7gUDZvMYIJJekMf0Qi
 ZqDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGQIFZR4bI8q09hTe8aODgGdAJig0BzC9BZdDiWT9UJ0PJ6WT/wBINIeG6nl6BIaO+L80QPCGZ/KzOBvNjsIv0bTPANaLHMSeQcIebFVO7
X-Gm-Message-State: AOJu0YwTvPbrHWZgiiYb3sn2qX/Mb7n9O0zqhhPkEttKV2IHBxlK8OBa
 1P1PJZ7iyYwC5Y3XAvqSOBs+z0Uz90xdXGYroQWYMuOK7EHbS5ZdpMeCceYP9FA=
X-Google-Smtp-Source: AGHT+IEPT352wtTz9iAipTw3WZyhnuQwbR41TmyOH1p5I8NW7VTHUCkkrju+IO+M+E5Komq4fBWr9w==
X-Received: by 2002:a2e:9890:0:b0:2d3:a7da:b17b with SMTP id
 b16-20020a2e9890000000b002d3a7dab17bmr1584405ljj.4.1709996948665; 
 Sat, 09 Mar 2024 07:09:08 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 m1-20020a2eb6c1000000b002d4062c833dsm328511ljo.98.2024.03.09.07.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Mar 2024 07:09:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Mar 2024 17:09:05 +0200
Subject: [PATCH 1/3] drm/msm/dsi: remove the drm_bridge_attach fallback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240309-fd-dsi-cleanup-bridges-v1-1-962ebdba82ed@linaro.org>
References: <20240309-fd-dsi-cleanup-bridges-v1-0-962ebdba82ed@linaro.org>
In-Reply-To: <20240309-fd-dsi-cleanup-bridges-v1-0-962ebdba82ed@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2369;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=25sj2EpAUs4CVgh43hLR16WG/PkkmsNSMdc3g9mxl2I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7HuSPyhU7mt5oJSmJoDFQtH4cLTENnWHFQ6NV
 7NYXoxKi+SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZex7kgAKCRCLPIo+Aiko
 1UWUB/9fcjO5+fe58xaEbgbtZcYIbSS/rTMGDmJ9GSgRT3x9eINjFvydclOPe1eyvrtLy1gcS+W
 JFLKvxnr0//Dyf2ObqocW3EpKp9/TMA1OpkCYUbAnP9sjgtcyoPNQ+6KVfCkgorZySXFPvTtWZK
 98tClxsDyXUeG7sEvDzqjvmOFNdSZa/oIl/XRcyeRa2+T9LOECKniV0U0i6vRpcqQvWCBndWW/u
 TstpB/6g/UflC+2ZLlGbLgJHfbl1iD4YA1Gs7FHCq4+bYqbM+6EuzN318o8y1LP6egUlo1YJa7s
 RD28X1JAPXAjGSE+pI7rztz/i0tj+XiD7SSyMngfAg35+Raw
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

All the bridges that are being used with the MSM DSI hosts have been
converted to support DRM_BRIDGE_ATTACH_NO_CONNECTOR. Drop the fallback
code and require DRM_BRIDGE_ATTACH_NO_CONNECTOR to be supported by the
downstream bridges.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 36 +++++++++++------------------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index af2a287cb3bd..a7c7f85b73e4 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -465,6 +465,7 @@ int msm_dsi_manager_ext_bridge_init(u8 id, struct drm_bridge *int_bridge)
 	struct drm_device *dev = msm_dsi->dev;
 	struct drm_encoder *encoder;
 	struct drm_bridge *ext_bridge;
+	struct drm_connector *connector;
 	int ret;
 
 	ext_bridge = devm_drm_of_get_bridge(&msm_dsi->pdev->dev,
@@ -474,36 +475,21 @@ int msm_dsi_manager_ext_bridge_init(u8 id, struct drm_bridge *int_bridge)
 
 	encoder = int_bridge->encoder;
 
-	/*
-	 * Try first to create the bridge without it creating its own
-	 * connector.. currently some bridges support this, and others
-	 * do not (and some support both modes)
-	 */
 	ret = drm_bridge_attach(encoder, ext_bridge, int_bridge,
 			DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-	if (ret == -EINVAL) {
-		/*
-		 * link the internal dsi bridge to the external bridge,
-		 * connector is created by the next bridge.
-		 */
-		ret = drm_bridge_attach(encoder, ext_bridge, int_bridge, 0);
-		if (ret < 0)
-			return ret;
-	} else {
-		struct drm_connector *connector;
-
-		/* We are in charge of the connector, create one now. */
-		connector = drm_bridge_connector_init(dev, encoder);
-		if (IS_ERR(connector)) {
-			DRM_ERROR("Unable to create bridge connector\n");
-			return PTR_ERR(connector);
-		}
+	if (ret)
+		return ret;
 
-		ret = drm_connector_attach_encoder(connector, encoder);
-		if (ret < 0)
-			return ret;
+	connector = drm_bridge_connector_init(dev, encoder);
+	if (IS_ERR(connector)) {
+		DRM_ERROR("Unable to create bridge connector\n");
+		return PTR_ERR(connector);
 	}
 
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret < 0)
+		return ret;
+
 	return 0;
 }
 

-- 
2.39.2

