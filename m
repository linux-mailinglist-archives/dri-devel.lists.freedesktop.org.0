Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF00734591
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jun 2023 10:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AADC10E106;
	Sun, 18 Jun 2023 08:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114F910E106
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jun 2023 08:51:07 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-30fcde6a73cso1711636f8f.2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jun 2023 01:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687078266; x=1689670266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QTMdpVu9zcROFMVsz6T+C+h5mIKmLtZWdHwxQBCPR5I=;
 b=Fh8hIlVoS/wbv8OUsIwPmLZWva6mur0bFHpAaMXzlEg1EecvqfhJu85SH0R81LOwah
 RpuQXxAEb17Y929Muoxw2ubuKpIrRsf9/xy9zX10xPx8ArlyxJMnQAxKKrL5tQpQbT+d
 RntyAiIDMzb+sy2anfFq19RHzYPz3tmH6qvtgiuw33PrU8EpIYFqcbghjpdm49YuOT7n
 ait5W1W+In7qWdR9A0cNijeR2jHJmXiWbjtS/rcJJDFqMlv/ARdirrdH61IHIzBUk8Ll
 VIYelOfN8W6PFAhJBnwb/OoWyRzsXk8C6wE2NE7vMiO7XX+0v6+nJgUf9XxjLQBVqt4m
 6lmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687078266; x=1689670266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QTMdpVu9zcROFMVsz6T+C+h5mIKmLtZWdHwxQBCPR5I=;
 b=KufoNBlQS+pzFeKCOeMVYoPDiUX93uFVjTsSsDSBN0l0WSvDcVKKq/iOufq0DlsF1d
 kN9X6aqx0cuN+vqJNHJoh/WlS3dvGlpx6MkvJsfhrVw3RBeFoGiobvN3PTzBSu0WSbgH
 WEzg7t9AmtLZKG6CcdQIO3mCOftwYo2KFDWe73ZEnNBReZMxhz8BH7+WvONul4Gn4L49
 lzjiOJfLBPftP65ZpPBQcSVfxx3ej7EL/+5LCNNMbOS0WtTm5xY5xyqT+iIfEtGAwKSD
 BipRyiwOM2eXAwgWUDWXNCMlB21rI0IaB8HjH9tSJq4PtCxOWtbb3jO7woM0faS6QF8R
 +hnA==
X-Gm-Message-State: AC+VfDy7e0d2Xcv6jK3rdKr8jID1gfNXlGCmAOu0OXxTDFfk/dc0yfOF
 5JY8xaZC4S1G0iabYxDWLy8=
X-Google-Smtp-Source: ACHHUZ5iAvnY9+VrzTEbxe/zrg7W9+3kiDTUUX8UossRPNVMZs6v+1EbD8nADrl6LsmsWR+fqeDpOA==
X-Received: by 2002:adf:d092:0:b0:30f:c7e4:d207 with SMTP id
 y18-20020adfd092000000b0030fc7e4d207mr3606483wrh.61.1687078265669; 
 Sun, 18 Jun 2023 01:51:05 -0700 (PDT)
Received: from xeon.. ([188.163.112.79]) by smtp.gmail.com with ESMTPSA id
 i17-20020adfded1000000b00301a351a8d6sm6953550wrn.84.2023.06.18.01.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jun 2023 01:51:05 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 1/2] drm/tegra: output: hdmi: Support bridge/connector
Date: Sun, 18 Jun 2023 11:50:45 +0300
Message-Id: <20230618085046.10081-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230618085046.10081-1-clamor95@gmail.com>
References: <20230618085046.10081-1-clamor95@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maxim Schwalm <maxim.schwalm@gmail.com>

Some Tegra device-trees may specify a video output graph, which involves
MHL bridge/simple bridge and/or connector framework. This patch adds
support for the bridge/connector attached to the HDMI output, allowing
us to model the hardware properly.

Inspired by: 29efdc2 ("drm/tegra: output: rgb: Support LVDS encoder bridge")

Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com> # ASUS TF T30
Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> # ASUS P1801-T T30
Tested-by: Robert Eckelmann <longnoserob@gmail.com> # ASUS TF101 T20
Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # ASUS TF201 T30
Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/hdmi.c | 44 +++++++++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 6eac54ae1205..a5b12b169e57 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -19,6 +19,7 @@
 #include <soc/tegra/common.h>
 #include <sound/hdmi-codec.h>
 
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_debugfs.h>
@@ -1544,26 +1545,47 @@ static int tegra_hdmi_init(struct host1x_client *client)
 {
 	struct tegra_hdmi *hdmi = host1x_client_to_hdmi(client);
 	struct drm_device *drm = dev_get_drvdata(client->host);
+	struct drm_connector *connector;
 	int err;
 
 	hdmi->output.dev = client->dev;
 
-	drm_connector_init_with_ddc(drm, &hdmi->output.connector,
-				    &tegra_hdmi_connector_funcs,
-				    DRM_MODE_CONNECTOR_HDMIA,
-				    hdmi->output.ddc);
-	drm_connector_helper_add(&hdmi->output.connector,
-				 &tegra_hdmi_connector_helper_funcs);
-	hdmi->output.connector.dpms = DRM_MODE_DPMS_OFF;
-
 	drm_simple_encoder_init(drm, &hdmi->output.encoder,
 				DRM_MODE_ENCODER_TMDS);
 	drm_encoder_helper_add(&hdmi->output.encoder,
 			       &tegra_hdmi_encoder_helper_funcs);
 
-	drm_connector_attach_encoder(&hdmi->output.connector,
-					  &hdmi->output.encoder);
-	drm_connector_register(&hdmi->output.connector);
+	if (hdmi->output.bridge) {
+		err = drm_bridge_attach(&hdmi->output.encoder, hdmi->output.bridge,
+					NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+		if (err) {
+			dev_err(client->dev, "failed to attach bridge: %d\n",
+				err);
+			return err;
+		}
+
+		connector = drm_bridge_connector_init(drm, &hdmi->output.encoder);
+		if (IS_ERR(connector)) {
+			dev_err(client->dev,
+				"failed to initialize bridge connector: %pe\n",
+				connector);
+			return PTR_ERR(connector);
+		}
+
+		drm_connector_attach_encoder(connector, &hdmi->output.encoder);
+	} else {
+		drm_connector_init_with_ddc(drm, &hdmi->output.connector,
+					    &tegra_hdmi_connector_funcs,
+					    DRM_MODE_CONNECTOR_HDMIA,
+					    hdmi->output.ddc);
+		drm_connector_helper_add(&hdmi->output.connector,
+					 &tegra_hdmi_connector_helper_funcs);
+		hdmi->output.connector.dpms = DRM_MODE_DPMS_OFF;
+
+		drm_connector_attach_encoder(&hdmi->output.connector,
+					     &hdmi->output.encoder);
+		drm_connector_register(&hdmi->output.connector);
+	}
 
 	err = tegra_output_init(drm, &hdmi->output);
 	if (err < 0) {
-- 
2.39.2

