Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E6FA1D679
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 14:21:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1AB910E3B0;
	Mon, 27 Jan 2025 13:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TV7rmXZ7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7901A10E23F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 13:21:10 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43616c12d72so7028205e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 05:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737984069; x=1738588869; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+klEMk0HAOeZBAXubltjLaVWMvzRQNoO88wNMjjAFMg=;
 b=TV7rmXZ7m7dE0Bq+y7MI3kH794/DZ4fgvEweWAjXWW9FpjX0YNiVBusbJPZyhfQ6hy
 7sA6WvJWg74V/29lzRoHBkGxAqceUW9zloWbH9nyiAnTzjaTQith4CtiBU84Mq8TWMWh
 NBgDIslPLxpSYIoltn7nADIUkKO8FlFIORMuUwyyK1kr6JStk9P9GW3ncUNmgYBpT3eO
 qyfq8nknl4/YaifyprgWMjouxY6B39rvgxAZeCqik64mBJrx7CcTwQmg9FbCwLCC3qxe
 LCQTRpaSKvzi2OoKUOSutHvp6wVXoIB2hXiHS1ryRYEzD4zFBNNBgI8rnA1ghuGJU8S4
 NVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737984069; x=1738588869;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+klEMk0HAOeZBAXubltjLaVWMvzRQNoO88wNMjjAFMg=;
 b=NWpDi5/8U3TuQRQ3U47XmBf/+lbEfQdiv07GNreYZy9y5bi2liua2HiyEouP10pnTA
 L75Q+PUS2cEbSVEzN7RRiiqg1i20+IyFy5Ww57VdtuDKmX7dCDZmU3LjjWJi+Yo5GGC8
 PeJlpIb+4RpuSiGivFv3/G0AIIoIKAY/nZIULDPb8H4r3E5UllP1Dz89TA8hSuQUodTH
 25xlaFkwCKE8N0XEjiR3Ykj2mow9I2W5Iwh2gbxrcnY4gH2TZV051zF6ZtfXF+xPUTXt
 swOh8MhpMldzRRM/E+iIpQaCAB3jgHMgRG7xTIMXntPANM049sfzXyenhMMb4ODrrp6R
 UsVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWq68TfZ+vvxA1q2zfipu6wMNevO2U3fUjJ+w+oqmIbZ5miXcfGVgbS8IyZzdbBftQ7lPofYZuMgJg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKXT9WlD1FuPAkNfCnlA5S+Iv3hBFBZWrb+pgBqqdr6cM0SBDw
 AFldA9gU1H2zt4vnUxIg24P2OvHjs80jv4GNNcVFtEzY87EYVYiIOid2gGqyMVU=
X-Gm-Gg: ASbGncuhhs7wiwPlSPsQqd06lLLfAnx3lADEeV/8XquAEbd1re38OwbuCePgk1q2Q98
 kKitliVxp+BvhSn530DhMHHqkevQzhxqi/yauXbK6Hg0qmXAssr+Xamrml5eQSdg8QPM3iznBJ9
 LaA2K9C0B9tNAP3RtvH0W3FCfawrg77zDSwh0YBkg5mmmGKqSCIbifkHT4opbB8yOzYalrf1U8w
 wnvDlgO4BUhEo10koa7fHwrUehnavS5czpPYJfX/isGCtGEBgwTjSrOPQ51JRqsPMOq25mh42LC
 360UlP7IU88vUvv0EA==
X-Google-Smtp-Source: AGHT+IHXp0TkSnUcKeJc7jgumcRa74yvba9PnZUCBYFw4tCqyzZOJvhurHlS0rdMsNnSl5Phd/c0+g==
X-Received: by 2002:a05:600c:1c0a:b0:42c:bfd6:9d2f with SMTP id
 5b1f17b1804b1-438913bde78mr147472595e9.1.1737984068879; 
 Mon, 27 Jan 2025 05:21:08 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.98]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd4b9977sm132386105e9.25.2025.01.27.05.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 05:21:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: display/msm/dsi-phy: Add header with exposed
 clock IDs
Date: Mon, 27 Jan 2025 14:21:04 +0100
Message-ID: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
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

DSI phys, from earliest (28 nm) up to newest (3 nm) generation, provide
two clocks.  The respective clock ID is used by drivers and DTS, so it
should be documented as explicit ABI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Patch for Display tree, although with Ack from clock.
---
 .../devicetree/bindings/display/msm/dsi-phy-common.yaml  | 2 ++
 MAINTAINERS                                              | 1 +
 include/dt-bindings/clock/qcom,dsi-phy-28nm.h            | 9 +++++++++
 3 files changed, 12 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,dsi-phy-28nm.h

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
index 6b57ce41c95f..d0ce85a08b6d 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
@@ -15,6 +15,8 @@ description:
 properties:
   "#clock-cells":
     const: 1
+    description:
+      See include/dt-bindings/clock/qcom,dsi-phy-28nm.h for clock IDs.
 
   "#phy-cells":
     const: 0
diff --git a/MAINTAINERS b/MAINTAINERS
index eb75c95f6c45..30103e3918ea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7398,6 +7398,7 @@ T:	git https://gitlab.freedesktop.org/drm/msm.git
 F:	Documentation/devicetree/bindings/display/msm/
 F:	drivers/gpu/drm/ci/xfails/msm*
 F:	drivers/gpu/drm/msm/
+F:	include/dt-bindings/clock/qcom,dsi-phy-28nm.h
 F:	include/uapi/drm/msm_drm.h
 
 DRM DRIVER FOR NOVATEK NT35510 PANELS
diff --git a/include/dt-bindings/clock/qcom,dsi-phy-28nm.h b/include/dt-bindings/clock/qcom,dsi-phy-28nm.h
new file mode 100644
index 000000000000..ab94d58377a1
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,dsi-phy-28nm.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DSI_PHY_28NM_H
+#define _DT_BINDINGS_CLK_QCOM_DSI_PHY_28NM_H
+
+#define DSI_BYTE_PLL_CLK		0
+#define DSI_PIXEL_PLL_CLK		1
+
+#endif
-- 
2.43.0

