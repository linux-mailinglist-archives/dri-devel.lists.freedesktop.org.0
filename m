Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21707B3F95E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4AD10E60B;
	Tue,  2 Sep 2025 09:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GPSKYn4h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA3110E609
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:00:38 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-45b7c01a708so17039605e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 02:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756803637; x=1757408437; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uG2Ow/KrfUPau7cUdJ1kjwBZjHHiJIe47jnJYV0FS6M=;
 b=GPSKYn4htJNNwyQNimkNS0AokXF+at7562DWPK+We27SDPXOPdmjtHqKxME5gYORIv
 Ptgase9oJt6YbEwjSocOIC6FpNeGnDTsDxG6Yn2KRi2B18Ml3Cd5xlOa1X3CvAMwt/zW
 AX8Tmv1oNLNmUGDA484a+SvYKPw5lJiBgSXe33cyv5a/mVaaFEeLRGScghtsnn4solX+
 7pMVu2zpCziUvHxe53sULb23TiOLGx2rlwXGZ30SoEdbl3B9Bzb2VguxP9fwYlVmTz79
 Ig/FihP5Ii0gSt4wO9P08PoiyePFm+obnkl9aymlPqS0/6H8c2S59+rBoWFVBv8L7RYQ
 Y/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756803637; x=1757408437;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uG2Ow/KrfUPau7cUdJ1kjwBZjHHiJIe47jnJYV0FS6M=;
 b=B0yKR/4at6xu1c3a/Q9xMEKF2VatmKvx5NTGRyK9j8XrG78pIwTHiuk6iqHTdbLYe7
 hDB/l3i0qFJVKx0K7jp0nRKb3rkkEmLZRTA0B3aBTohyF61JbMeSmrOVgZ5c5B+mOcEt
 tA5VYEWNrUHSCxC+j4p7hHxaKcYaokgimqB+NFwmiZQYqFQ9kmaWtX0bsjRsMxvAJ+fL
 q4v4fFxH1N3YFZGRpVB/bh787LBWOYpSrhUnFGLZZI3jPQs0rtXu4eWFL/1FC2oj8jl6
 q5reNcoWef6OYtMnvz8rb8qvcyWqIIZyGyICo+BjxZsrPVQ5v1N43ngXP3FHkimTeakr
 jBqw==
X-Gm-Message-State: AOJu0YwSSFinLe1XdfcquXLoU81vrBlj+CW3vjgBJtHZ0xH+0RIAXqLX
 I6oExWYV6AMQ6wr7DQ6hvW6sLDdhnm1ws/W6j0IojqOh+U5AA9lE6MuE7mYIuNHv0GE=
X-Gm-Gg: ASbGncslFZ0iGsYDcI2XWCAqN9BHRqSIPICescVEzcTdcgTla7qg1BQjwjWaeoVelm1
 CXcQ7gmGoeZdgXXDeYwt0iXP82BrknG4gA4pGg/cdaFDMc64Mpnpxo/t0KMqs9zAWURjHppwvOS
 0aoKH5tgG52wuKWcB44oDhr4lwJDI1q4THUfctE8lpQSza5B9K6qxZ5Wk5iQeUk3T7iTODADlIX
 wcHnVQ+ssXSTPJMcK5qlDgsnsEsm4/BF/x6XzQv6hq5nLJd8h2d8Qwfv7MV7GoSFz+B/zIltRyW
 U3vmjeHM4xNHE0dKx6Hbt/dJ0ZD8h2zdJ/YjSkHxdVCw1V+1vIisHS+CEQbmVALzX9H2DurkK2/
 e8lCkDfYVWnIMTkRrFDczJMzdoRdzQjL0wqBgrh+9Rqc=
X-Google-Smtp-Source: AGHT+IFar9tnrVzNvRWv4vs9RDcwWH8x6/oKpKs9B26t/CVh/B1GNcOENkRhKdPDKrLb8eWA4C7nKg==
X-Received: by 2002:a05:600c:4fcd:b0:45b:7185:9e5 with SMTP id
 5b1f17b1804b1-45b85525cddmr94188905e9.5.1756803637260; 
 Tue, 02 Sep 2025 02:00:37 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7271cd01sm261112045e9.23.2025.09.02.02.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 02:00:36 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 02 Sep 2025 11:00:31 +0200
Subject: [PATCH v2 4/5] phy: qcom: qmp-combo: get the static lanes mapping
 from DT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-topic-x1e80100-hdmi-v2-4-f4ccf0ef79ab@linaro.org>
References: <20250902-topic-x1e80100-hdmi-v2-0-f4ccf0ef79ab@linaro.org>
In-Reply-To: <20250902-topic-x1e80100-hdmi-v2-0-f4ccf0ef79ab@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5509;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=R+bIubWm0CbZM++7XjFU57IsDC7CloYPz/RJjoqOA9w=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBotrIvrkSdnqOJO70/0vuXWzbieSL0D81n8KBphRed
 tj4KjvyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaLayLwAKCRB33NvayMhJ0RTeD/
 90ggmuB07LjRwlGik2gYLD72R3CEE3SrAzufyoqTQI+x9T3fvDYPHXUp/A0ta9zvEyAhWpKNnq2Mdt
 53lO9z69AYW1LZDM+32RjlC4he5WSPgwq+pMJmgLY70Xtg1CRi8b3DTByIFW5aWkmUpZPKI6Ri5xgp
 nmhe3r9f/o4k7eIaaQxbrQLHPBK14myFoK+GbQ+AkmUKy+PvWbcqULQqWRVuifz1IE1qr+cYDB6NpF
 IwICHTosvb1DH2pfJGR2j2pu2vD50T6Eo2HnjmBcfviNkznIqD5hIBquQ/8iZU8BQFiInEguT/T0c7
 ETm8lJcCJaQnOjuHmdeg9ab3UPHMA5grQcUiQMYKjy03lZi3Tm5aNZ2I/O943EfXrbFd9PjsMfDyWO
 pueWSoOlE7ItK2P/vV2POhuiACjdU3XXtNOqfwSVKzFpkagxo1Caf7S5SYrcIxg0ZyXbRDtLkMVfVf
 Tgpc2FK2NMYDQPvP1hhUDafXx39BjHH4QEAH9yADof3hIw5Vkn1qdh8eVsEnrEobGCdbwHFf8q6Kpk
 Do6QuVIl/SYEgOCM8/wjOoo83y5Q1ML6M4fDpW+zUBlrdeodZu4OshAjavWlG+/kNsL6dhtUzcJAi4
 fnSHrb5HAbSTLf9/1FjfXG/mBcHk1RcYd3KoW6rpzP8oRWHE9X2BKO23x35Q==
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

Get the static lanes mapping from DT and stop registering the
USB-C muxes in favor of a static mode and orientation detemined
by the mapping.

This allows supporting boards with direct connection of USB3 and
DisplayPort lanes to the QMP Combo PHY lanes, not using the
USB-C Altmode feature.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 118 +++++++++++++++++++++++++++---
 1 file changed, 109 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 7b5af30f1d028c592500e723ecd27b54ed554709..9a121a61e77ed8a839fa0fb588ec379382fb63b2 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -24,6 +24,7 @@
 
 #include <drm/bridge/aux-bridge.h>
 
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 
 #include "phy-qcom-qmp-common.h"
@@ -1744,6 +1745,85 @@ static const u8 qmp_dp_v6_pre_emphasis_hbr_rbr[4][4] = {
 	{ 0x22, 0xff, 0xff, 0xff }
 };
 
+static struct qmp_lanes_mapping {
+	u32 map[4];
+	enum qmpphy_mode mode;
+	enum typec_orientation orientation;
+} const qmpphy_lanes_mapping[] = {
+	/* No lanes connected, set 'safe' USB3 mode */
+	{
+		.map = {PHY_NONE, PHY_NONE, PHY_NONE, PHY_NONE},
+		.mode = QMPPHY_MODE_USB3_ONLY,
+		.orientation = TYPEC_ORIENTATION_NONE,
+	},
+	/* USB3 Only */
+	{
+		.map = {PHY_TYPE_USB3, PHY_TYPE_USB3, PHY_NONE, PHY_NONE},
+		.mode = QMPPHY_MODE_USB3_ONLY,
+		.orientation = TYPEC_ORIENTATION_NORMAL,
+	},
+	/* USB3 Only, reverted */
+	{
+		.map = {PHY_NONE, PHY_NONE, PHY_TYPE_USB3, PHY_TYPE_USB3},
+		.mode = QMPPHY_MODE_USB3_ONLY,
+		.orientation = TYPEC_ORIENTATION_REVERSE,
+	},
+	/* USB3 and DP single lane */
+	{
+		.map = {PHY_TYPE_USB3, PHY_TYPE_USB3, PHY_NONE, PHY_TYPE_DP},
+		.mode = QMPPHY_MODE_USB3DP,
+		.orientation = TYPEC_ORIENTATION_NORMAL,
+	},
+	/* USB3 and DP */
+	{
+		.map = {PHY_TYPE_USB3, PHY_TYPE_USB3, PHY_TYPE_DP, PHY_TYPE_DP},
+		.mode = QMPPHY_MODE_USB3DP,
+		.orientation = TYPEC_ORIENTATION_NORMAL,
+	},
+	/* DP single lane and USB3 */
+	{
+		.map = {PHY_TYPE_DP, PHY_NONE, PHY_TYPE_USB3, PHY_TYPE_USB3},
+		.mode = QMPPHY_MODE_USB3DP,
+		.orientation = TYPEC_ORIENTATION_REVERSE,
+	},
+	/* DP and USB3 */
+	{
+		.map = {PHY_TYPE_DP, PHY_TYPE_DP, PHY_TYPE_USB3, PHY_TYPE_USB3},
+		.mode = QMPPHY_MODE_USB3DP,
+		.orientation = TYPEC_ORIENTATION_REVERSE,
+	},
+	/* DP single lane */
+	{
+		.map = {PHY_TYPE_DP, PHY_NONE, PHY_NONE, PHY_NONE},
+		.mode = QMPPHY_MODE_DP_ONLY,
+		.orientation = TYPEC_ORIENTATION_REVERSE,
+	},
+	/* DP 2 lanes */
+	{
+		.map = {PHY_TYPE_DP, PHY_TYPE_DP, PHY_NONE, PHY_NONE},
+		.mode = QMPPHY_MODE_DP_ONLY,
+		.orientation = TYPEC_ORIENTATION_REVERSE,
+	},
+	/* DP 4 lanes */
+	{
+		.map = {PHY_TYPE_DP, PHY_TYPE_DP, PHY_TYPE_DP, PHY_TYPE_DP},
+		.mode = QMPPHY_MODE_DP_ONLY,
+		.orientation = TYPEC_ORIENTATION_NORMAL,
+	},
+	/* DP 2 lanes, reverted */
+	{
+		.map = {PHY_NONE, PHY_NONE, PHY_TYPE_DP, PHY_TYPE_DP},
+		.mode = QMPPHY_MODE_DP_ONLY,
+		.orientation = TYPEC_ORIENTATION_NORMAL,
+	},
+	/* DP single lane, reverted */
+	{
+		.map = {PHY_NONE, PHY_NONE, PHY_NONE, PHY_TYPE_DP},
+		.mode = QMPPHY_MODE_DP_ONLY,
+		.orientation = TYPEC_ORIENTATION_NORMAL,
+	},
+};
+
 struct qmp_combo;
 
 struct qmp_combo_offsets {
@@ -4123,7 +4203,7 @@ static int qmp_combo_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *dp_np, *usb_np;
 	struct phy_provider *phy_provider;
-	int ret;
+	int ret, i;
 
 	qmp = devm_kzalloc(dev, sizeof(*qmp), GFP_KERNEL);
 	if (!qmp)
@@ -4167,9 +4247,34 @@ static int qmp_combo_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
-	ret = qmp_combo_typec_register(qmp);
-	if (ret)
-		goto err_node_put;
+	qmp->qmpphy_mode = QMPPHY_MODE_USB3DP;
+
+	if (of_find_property(dev->of_node, "qcom,static-lanes-mapping", NULL)) {
+		u32 mapping[4];
+
+		ret = of_property_read_u32_array(dev->of_node, "qcom,static-lanes-mapping",
+						 mapping, 4);
+		if (ret) {
+			dev_err(dev, "failed to read static lanes mapping: %d\n", ret);
+			goto err_node_put;
+		}
+
+		for (i = 0; i < ARRAY_SIZE(qmpphy_lanes_mapping); ++i) {
+			if (memcmp(mapping, &qmpphy_lanes_mapping[i].map, sizeof(mapping)))
+				continue;
+
+			qmp->qmpphy_mode = qmpphy_lanes_mapping[i].mode;
+			qmp->orientation = qmpphy_lanes_mapping[i].orientation;
+
+			break;
+		}
+		if (i == ARRAY_SIZE(qmpphy_lanes_mapping))
+			dev_warn(dev, "invalid qcom,static-lanes-mapping, keeping default\n");
+	} else {
+		ret = qmp_combo_typec_register(qmp);
+		if (ret)
+			goto err_node_put;
+	}
 
 	ret = drm_aux_bridge_register(dev);
 	if (ret)
@@ -4189,11 +4294,6 @@ static int qmp_combo_probe(struct platform_device *pdev)
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

