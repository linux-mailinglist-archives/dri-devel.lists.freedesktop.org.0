Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 568845B98C5
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 12:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CFE10E180;
	Thu, 15 Sep 2022 10:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFAD110E165
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 10:29:30 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 n35-20020a05600c502300b003b4924c6868so3571744wmr.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 03:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=y4XRiTWvqgw8E7sxid7nxz5JdJQpRcJN2TxmeR9LcxI=;
 b=UskMr1TVUJPvARbAHGUNzn4UiwFMUZlB0Pg8EpP5zSDSP1fl6GzS2MqlHLQYjG71Kk
 mJ7i9ugJFQlFbTlIT1tX0Rt6B+7F40RcaExLSC/fxFBjFwn5XjtonqDUNtxECzOC0g5H
 RWAZzm+5cAbLo5v63fZaTyVBwskAbGpAkmbiVQWL6kfJviigzbCmsHG8RLsLUZG3kOsf
 76TwZdJcnKsnEeVHvYnhPkVRV8AQLOpLP0C3cIIm8ATYtVaXEEdw5NmleWJD2HVcU7JY
 exEcoPpIJvFE3ilh07DDzOBJIpL4bnpiUoZr+b6SwT0RL3IIGIOruY7XSCK3NMzguzB+
 qVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=y4XRiTWvqgw8E7sxid7nxz5JdJQpRcJN2TxmeR9LcxI=;
 b=XqHIWHtIpyqV2AUhLw5Wu8R6iVG4LzCHWGQ+YJaCjGL9VpCM4EIIzOTbfbuvzlZMD9
 H4K01MQdzdTshvB+HIXfZkKbpZyW7lfKC2OQxUD7Vtn+EI57S44rpXCJScNqm/CuIC5c
 V2YNtYc80ttEbcJ06fhNSQTzHcZ7dl69FauXZMGsopQMJCF4bcFB9VhwcmFzXNxw0Yu0
 BD+tcAetM26b36egjhKv6sRrAjTGxBpn26wQ2xMdB9jPdxzvx6kR/0LAG+jhAIuSRHBx
 2+BWZRsR1ZA+wE8Db0h3NVxtbz/sExXgJ/wNHLVuJ+BOCtm9Yq4ZuqtYijq/nf68QYWR
 NMNQ==
X-Gm-Message-State: ACgBeo2vANDPk8CjkFOueql/AHAAb7mOmtbnP/N57U+LOTg5jJPIOyYN
 /0pVHpZN47yB9ScCOIs4QObZkw==
X-Google-Smtp-Source: AA6agR4ITHPf6PE0PpNsbQL8uu+SD5+Ipjy3UMkuh7QN1NNOw1P8DQLXtw9k5JAvWgJlo0dMBPEE3w==
X-Received: by 2002:a05:600c:268f:b0:3b4:acef:34ab with SMTP id
 15-20020a05600c268f00b003b4acef34abmr1427464wmt.176.1663237769154; 
 Thu, 15 Sep 2022 03:29:29 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 q17-20020adff951000000b00228dff8d975sm2098257wrr.109.2022.09.15.03.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 03:29:28 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 devicetree@vger.kernel.org
Subject: [PATCH v1 1/2] Revert "Revert "drm/bridge: ti-sn65dsi86: Implement
 bridge connector operations for DP""
Date: Thu, 15 Sep 2022 12:29:23 +0200
Message-Id: <20220915102924.370090-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220915102924.370090-1-robert.foss@linaro.org>
References: <20220915102924.370090-1-robert.foss@linaro.org>
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

This commit was accidentally reverted instead of another commit, and
therefore needs to be reinstated.

This reverts commit 8c9c40ec83445b188fb6b59e119bf5c2de81b02d.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 28 +++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 6e053e2af229..3c3561942eb6 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -29,6 +29,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -68,6 +69,7 @@
 #define  BPP_18_RGB				BIT(0)
 #define SN_HPD_DISABLE_REG			0x5C
 #define  HPD_DISABLE				BIT(0)
+#define  HPD_DEBOUNCED_STATE			BIT(4)
 #define SN_GPIO_IO_REG				0x5E
 #define  SN_GPIO_INPUT_SHIFT			4
 #define  SN_GPIO_OUTPUT_SHIFT			0
@@ -1158,10 +1160,33 @@ static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	pm_runtime_put_sync(pdata->dev);
 }
 
+static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
+{
+	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+	int val = 0;
+
+	pm_runtime_get_sync(pdata->dev);
+	regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
+	pm_runtime_put_autosuspend(pdata->dev);
+
+	return val & HPD_DEBOUNCED_STATE ? connector_status_connected
+					 : connector_status_disconnected;
+}
+
+static struct edid *ti_sn_bridge_get_edid(struct drm_bridge *bridge,
+					  struct drm_connector *connector)
+{
+	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+
+	return drm_get_edid(connector, &pdata->aux.ddc);
+}
+
 static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.attach = ti_sn_bridge_attach,
 	.detach = ti_sn_bridge_detach,
 	.mode_valid = ti_sn_bridge_mode_valid,
+	.get_edid = ti_sn_bridge_get_edid,
+	.detect = ti_sn_bridge_detect,
 	.atomic_pre_enable = ti_sn_bridge_atomic_pre_enable,
 	.atomic_enable = ti_sn_bridge_atomic_enable,
 	.atomic_disable = ti_sn_bridge_atomic_disable,
@@ -1257,6 +1282,9 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 	pdata->bridge.type = pdata->next_bridge->type == DRM_MODE_CONNECTOR_DisplayPort
 			   ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_eDP;
 
+	if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
+		pdata->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
+
 	drm_bridge_add(&pdata->bridge);
 
 	ret = ti_sn_attach_host(pdata);
-- 
2.34.1

