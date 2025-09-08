Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B2AB48E8F
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 15:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C35EC10E52B;
	Mon,  8 Sep 2025 13:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GKJ/PTZI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC7710E526
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 13:04:30 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-45de60d39b7so6951635e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 06:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757336669; x=1757941469; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6hVFR7tlfJ4rwCckjFd0RFg5PR9+fm+hwaJJl+Zp7RE=;
 b=GKJ/PTZIB5TRL8LbWxpbDsLjENMXYMrolh7N6ShE4SVzUQoEqmxgQaGyRk9oovCjhP
 IVc+JOENLhQWysRsYiibsjc0x7wmAyW8QVjvL/C8OMJwNHzZvh1FC6r5uuhDZbILwu/J
 fOJZ7kCOE106I6wS/ZOOdBGBSMhri2wDKC/SoZHYwLvbznTVoxngRbxorOAEU2RFrgaO
 tF/w1D8c2EfyUHiExmoNUQqK17R/8J0J0xt3xfLV7kV5s3exmZO8zyt/66W8Npl6HU+g
 Ds2zHKK4EsyQ1v7gIzbsjjOYmR4aN8x0mD/7OHwzgLITnK/S/W+p5iIf0v/8JO6nT3AS
 AKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757336669; x=1757941469;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6hVFR7tlfJ4rwCckjFd0RFg5PR9+fm+hwaJJl+Zp7RE=;
 b=Bh5PS1fSbVLWPis0n/bcou6IjHzDCNOwizfkZk1phGYBLESKsAppG/DQTuIyqc13Pn
 gsy3ogUvoL6PfDrhqxv779FX8tJWXDcDl0Hz6zxLmaHu/Gtu+J8VsGTCGE/oqvuBNr3R
 OjiwyQsAUyQlv03qHfdQi5Fq8WbAblbVeqouie89vekbDJQvtHdK29Gb9zi/r3Cseoyv
 kzBwCtizdGVyp1ChVOTzSbS3SiP2hcaHYSishSf6NLOo8GPlz8oLztSRY0ZS+Yr++p7S
 rYAywv+LwJ+Yo+2m6AUgnue9l3s0Pfm5IP8bogHUt7jYnEvKRaV0xr9l7uMDsgJG5R1f
 UBjg==
X-Gm-Message-State: AOJu0YwYOTh8uE8p/gA9lkywLWs2HDQ6zRuYV/8jIJ0HO5qsi32Q93Hk
 vNSA5quZCWuHyroKHEUO24/kNXhlJwmKwmf/yfjaaMUh3aKgHJEmteww5dyAZiSl43w=
X-Gm-Gg: ASbGncsXeR1E50LnFiIQtqzW6BX9k4r/6qDd6L+YQUXO40G24Qy5sMkkPRSJsGfCifs
 Qy9zQ4sdTpPQsriftm4ArRPMN7OL0Z0pZsPHMzo3XDDiLvsmObMGA2F8snR8mbHvhkeT/TBYbKj
 l/lzU0INUmQzUaDuNYoLJLYX7VJ7sHFhn3L3upexZ5XZ+lAgtizgEcqCsONg1mPBYiHWDuCXHKm
 Vyk08S8y/k7uznhlh8DgmBrBFs04AASi88aXSRiG5q1r/gRSJ/I6/sfap+kwa8XIKH+1eEdPRDk
 /d2QPF8lao+7koQqIkXTP7y52VHLmlZEPrfHKjc3LTw/FXvapmUZC0IdBBuboMmOQhK0v7/LciY
 W0OEUbJlhrDN4n3JnGVj9uBgCfRUJJdqnlKJrjyRfKTE=
X-Google-Smtp-Source: AGHT+IF6rpGHIQqohS9lzYVCz3pQ7EeM5njM+scjW7GHsTFOc2+YN9gxLQmujK0s7N4N9Z14XbFXDQ==
X-Received: by 2002:a05:600c:358a:b0:45b:9322:43fc with SMTP id
 5b1f17b1804b1-45ddded6b98mr60937485e9.29.1757336668917; 
 Mon, 08 Sep 2025 06:04:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45dd6891d23sm145632475e9.4.2025.09.08.06.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 06:04:28 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 08 Sep 2025 15:04:21 +0200
Subject: [PATCH v3 4/5] phy: qcom: qmp-combo: get the USB3 & DisplayPort
 lanes mapping from DT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-topic-x1e80100-hdmi-v3-4-c53b0f2bc2fb@linaro.org>
References: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
In-Reply-To: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5803;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=lOUHhuJduyd4uVL3cdLjbnnx7qqWeLxF7qvYd0HnxIo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBovtRXFe7zxBwluA3jvmm4gOBQteCg0RDZ+ZE5pQde
 sVco1pWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaL7UVwAKCRB33NvayMhJ0QBHD/
 4sPNXHxrN6EZYj8eY+ad2W5jKQqfW73Syl5NqdPrSaEnMVQ51QkdM++uGuTof+3Z4lK+NzCtHncnoc
 YnlRcw6Ww+hrzwyLoch8mBSHBxujd+nyYgREAq6u9+zE5F22HfD4hlCJAxMJbKO5AxnNKD42tcxlfb
 uDvR/P968VaYOnbwQEuhj1lfwXXWIBce9pfBstsRMKL0xCmSDruSB+2Lg/OXlgHXm5uQ5vJ/xO1irN
 AM2/lR+bXnHYD6jfW7fMHBnyrOYmVZChDpTDuw90ma/LYPjAYTtIFY/ElNkvr3XwxEOUWf3xIPS8g2
 O4KqI7z2GG9pKglCS/yChRcBq7iOI/LnCNvmsNcS9hjOw/Z4ydXSqBQYResJPLBhxVDwbkNQzh8Fxx
 4wj5c3d0p1XoVgIVQpADzFJUc583sA0a+3qhSusdHT9mZamqdO3+2sQz1gmOERol+oMb/Il+aahINK
 SdiKM0lXcUCoryjZvoHmXyD3SoKXtRlDEq1DexAgrijjj9rqyAHmJGuVTpVpi6RoEF2eGktiTgo/mX
 GYyg0KV98TF6Av5eEGmDF1in850fJHAW3Sd9RvTuXSZkN/D7oNDZ4QksOcNbWZ5QLnh9q8B9TGI5pZ
 334QiQfnZVqGPHgoo16ns3m0pa+CyKNU1VPjcb9hFE+omsIIcnyP8K8Ez8ZQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
of a combo glue to route either lanes to the 4 shared physical lanes.

The routing of the lanes can be:
- 2 DP + 2 USB3
- 4 DP
- 2 USB3

Get the lanes mapping from DT and stop registering the USB-C
muxes in favor of a static mode and orientation detemined
by the lanes mapping.

This allows supporting boards with direct connection of USB3 and
DisplayPort lanes to the QMP Combo PHY lanes, not using the
USB-C Altmode feature.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 132 ++++++++++++++++++++++++++++--
 1 file changed, 124 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 7b5af30f1d028c592500e723ecd27b54ed554709..f3f91a69dc8b81e049cd06f7ab4f04baf57776cd 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_graph.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
@@ -1744,6 +1745,21 @@ static const u8 qmp_dp_v6_pre_emphasis_hbr_rbr[4][4] = {
 	{ 0x22, 0xff, 0xff, 0xff }
 };
 
+static const u32 usb3_data_lane_mapping[][2] = {
+	[TYPEC_ORIENTATION_NORMAL] = { 1, 0 },
+	[TYPEC_ORIENTATION_REVERSE] = { 2, 3 },
+};
+
+static const u32 dp_2_data_lanes_mapping[][2] = {
+	[TYPEC_ORIENTATION_NORMAL] = { 0, 1 },
+	[TYPEC_ORIENTATION_REVERSE] = { 3, 2 },
+};
+
+static const u32 dp_4_data_lanes_mapping[][4] = {
+	[TYPEC_ORIENTATION_NORMAL] = { 0, 1, 2, 3 },
+	[TYPEC_ORIENTATION_REVERSE] = { 3, 2, 1, 0 },
+};
+
 struct qmp_combo;
 
 struct qmp_combo_offsets {
@@ -4167,9 +4183,114 @@ static int qmp_combo_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
-	ret = qmp_combo_typec_register(qmp);
-	if (ret)
-		goto err_node_put;
+	qmp->qmpphy_mode = QMPPHY_MODE_USB3DP;
+
+	if (of_find_property(dev->of_node, "mode-switch", NULL) ||
+	    of_find_property(dev->of_node, "orientation-switch", NULL)) {
+		ret = qmp_combo_typec_register(qmp);
+		if (ret)
+			goto err_node_put;
+	} else {
+		enum typec_orientation usb3_orientation = TYPEC_ORIENTATION_NONE;
+		enum typec_orientation dp_orientation = TYPEC_ORIENTATION_NONE;
+		struct device_node *usb3_ep, *dp_ep;
+		u32 data_lanes[4];
+		int count, i;
+
+		usb3_ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
+		dp_ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, 1);
+
+		if (usb3_ep) {
+			ret = of_property_count_u32_elems(usb3_ep, "data-lanes");
+			if (ret == -EINVAL)
+				/* Property isn't here, ignore property */
+				goto usb3_mapping_done;
+			if (ret < 0)
+				goto err_node_put;
+
+			count = ret;
+			if (count != 2)
+				/* Property size is invalid, ignore property */
+				goto usb3_mapping_done;
+
+			ret = of_property_read_u32_array(usb3_ep, "data-lanes", data_lanes, count);
+			if (ret)
+				goto err_node_put;
+
+			for (i = TYPEC_ORIENTATION_NORMAL; i <= TYPEC_ORIENTATION_REVERSE; i++)
+				if (!memcmp(data_lanes, usb3_data_lane_mapping[i], sizeof(u32) * 2))
+					break;
+
+			if (i >= TYPEC_ORIENTATION_REVERSE)
+				/* Property value is invalid, ignore property */
+				goto usb3_mapping_done;
+
+			usb3_orientation = i;
+		}
+
+usb3_mapping_done:
+		of_node_put(usb3_ep);
+
+		if (dp_ep) {
+			ret = of_property_count_u32_elems(dp_ep, "data-lanes");
+			if (ret == -EINVAL)
+				/* Property isn't here, ignore property */
+				goto dp_mapping_done;
+			if (ret < 0)
+				goto err_node_put;
+
+			count = ret;
+			if (count != 2 && count != 4)
+				/* Property size is invalid, ignore property */
+				goto dp_mapping_done;
+
+			ret = of_property_read_u32_array(dp_ep, "data-lanes", data_lanes, count);
+
+			if (ret)
+				goto err_node_put;
+
+			for (i = TYPEC_ORIENTATION_NORMAL; i <= TYPEC_ORIENTATION_REVERSE; i++) {
+				switch (count) {
+				case 2:
+					ret = memcmp(data_lanes, dp_2_data_lanes_mapping[i],
+						      sizeof(u32) * count);
+					break;
+				case 4:
+					ret = memcmp(data_lanes, dp_4_data_lanes_mapping[i],
+						     sizeof(u32) * count);
+					break;
+				}
+
+				if (!ret)
+					break;
+			}
+
+			if (i >= TYPEC_ORIENTATION_REVERSE)
+				/* Property value is invalid, ignore property */
+				goto dp_mapping_done;
+
+			dp_orientation = i;
+		}
+
+dp_mapping_done:
+		of_node_put(dp_ep);
+
+		if (dp_orientation == TYPEC_ORIENTATION_NONE &&
+		    usb3_orientation != TYPEC_ORIENTATION_NONE) {
+			qmp->qmpphy_mode = QMPPHY_MODE_USB3_ONLY;
+			qmp->orientation = usb3_orientation;
+		} else if (usb3_orientation == TYPEC_ORIENTATION_NONE &&
+			 dp_orientation != TYPEC_ORIENTATION_NONE) {
+			qmp->qmpphy_mode = QMPPHY_MODE_DP_ONLY;
+			qmp->orientation = dp_orientation;
+		} else if (dp_orientation != TYPEC_ORIENTATION_NONE &&
+			 dp_orientation == usb3_orientation) {
+			qmp->qmpphy_mode = QMPPHY_MODE_USB3DP;
+			qmp->orientation = dp_orientation;
+		} else {
+			dev_warn(dev, "unable to determine orientation & mode from data-lanes");
+		}
+	}
 
 	ret = drm_aux_bridge_register(dev);
 	if (ret)
@@ -4189,11 +4310,6 @@ static int qmp_combo_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
-	/*
-	 * The hw default is USB3_ONLY, but USB3+DP mode lets us more easily
-	 * check both sub-blocks' init tables for blunders at probe time.
-	 */
-	qmp->qmpphy_mode = QMPPHY_MODE_USB3DP;
 
 	qmp->usb_phy = devm_phy_create(dev, usb_np, &qmp_combo_usb_phy_ops);
 	if (IS_ERR(qmp->usb_phy)) {

-- 
2.34.1

