Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C200A1D677
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 14:21:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4FFA10E50E;
	Mon, 27 Jan 2025 13:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jJ8QcOWm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B233C10E50E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 13:21:12 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-436203f1203so2758865e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 05:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737984071; x=1738588871; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1lrk19+x0xCyWtNAM9zqIl3MR0fAbQ4p3LHFnpdDhys=;
 b=jJ8QcOWms9z+sGwGXBNiPbvF1+wau2Llbssq+3v8wRGOsXc0NjwFzfyKz6o6+RCBhM
 PXao0vPTDfePYbiT+vKw63lY+CmFFZt4aujq3RgRd9UM3bKpmhzd/3SKastrDvgNkXZI
 snVxDOuGJSbdH7ByGx8ajdAyBIDZWaMZT4JQ+5wJr+Blk/BmxEiT8W18R2VTpG0duU8G
 744BDwIdLTho5CczYp0GCVnnhP0GD04by7xZmm3fHsAzmay8ni/S7NH17E1wUWEBE6X9
 umeQYEQahqycWWchQs+JI7Fols+DFsUDYy8R4oq425LgG6oL4zFYz/uKVOOTg49YL9sE
 dJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737984071; x=1738588871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1lrk19+x0xCyWtNAM9zqIl3MR0fAbQ4p3LHFnpdDhys=;
 b=IlylyFTIc6YbvJEUPwGpETh9LHZCePmu45b0LiEmMJ3UXxoo9tT22d1b36elZQiSvC
 ZVyzeMSgx3hURuI2hOmo3rXX307xq25fNBMKQedhDPQqor/YG92JBOLiSfPlqqtHzt2r
 dqM4VAZo1KbGQvl+LdHw2vENx5c791tNWVvVQadd8BbSMiOxtHvjtWMmAtv4CL3PR0nz
 Ry4WuHpM/f1U27PRhR2QBANjJQuvMk39Eafk7TBpHWtEiIVUoGYDLD+Z4f36sxD48GEW
 WB4xYsu5fDIzBFk+xLzYZSQBZvJLhhNM/+MqHZ1FPU+W1QZ3RypUQZnka4DJ9H+8FsIu
 z04w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVd0KzhrYXD3QLawkPxubHUaUTGJZm03k7HAB/rPTmdldkYsIFWUOshUroXqYX8D/Wb18hKK+aLFGs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx16FELLuMXeMjuCq43F8MZOTtSiNDZQrzmnn6uGMkj1zYhKCtO
 DiFJFIBn0yKIyq+RKXTbRUoAUO01r5LtpLSOxUSbjqkndiiy1h+fZgT+8qlEmVg=
X-Gm-Gg: ASbGncthiLlldTTBwqfyasi7cS2TsTNxRJU6kY/zVP9+Ndc1oXcKK7Mp7BtzkAXksQ8
 OHYp1OonksHUBoE5fC9pjdXE61MZl0knuvwffVBAu/02zVGelk5gvR97RmjiWrznfdq7u23C4qu
 Nf0U09BkBvE0VY4VsBAsG+PzbQcjVFIKoH0Vl8UqLfpmSH5e1DSzamHo1ebaraZ2VXSPJqKBbu5
 Mv3ca99nuKowPnKsAvps+vD0SgHIBCn8qX6BVG3W+Jx71D491Jdc7zfn22y9Inw+KvLFzHhJ394
 Q5JzDPNLyVUhwHr/bQ==
X-Google-Smtp-Source: AGHT+IFQ3yteVkt9TcZzs8X17uQXuOmJxl9Leoqq2TKqJE6nDiurSR7kDwbdcXBuU+CbDYLyoR4UeQ==
X-Received: by 2002:a05:600c:1f10:b0:436:fb10:d595 with SMTP id
 5b1f17b1804b1-438b1763eeemr80946485e9.1.1737984070644; 
 Mon, 27 Jan 2025 05:21:10 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.98]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd4b9977sm132386105e9.25.2025.01.27.05.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 05:21:10 -0800 (PST)
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
Subject: [PATCH 2/2] drm/msm/dsi/phy: Use the header with clock IDs
Date: Mon, 27 Jan 2025 14:21:05 +0100
Message-ID: <20250127132105.107138-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
References: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
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

Use the header with clock IDs to bind the interface between driver and
DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           | 5 ++---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      | 1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      | 1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       | 1 +
 6 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index fdb6c648e16f..7541ffde6521 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -6,6 +6,7 @@
 #ifndef __DSI_PHY_H__
 #define __DSI_PHY_H__
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/regulator/consumer.h>
@@ -85,9 +86,7 @@ struct msm_dsi_dphy_timing {
 	u8 hs_halfbyte_en_ckln;
 };
 
-#define DSI_BYTE_PLL_CLK		0
-#define DSI_PIXEL_PLL_CLK		1
-#define NUM_PROVIDED_CLKS		2
+#define NUM_PROVIDED_CLKS		(DSI_PIXEL_PLL_CLK + 1)
 
 #define DSI_LANE_MAX			5
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 677c62571811..9812b4d69197 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2018, The Linux Foundation
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/iopoll.h>
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 2c3cbe0f2870..3a1c8ece6657 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2016, The Linux Foundation. All rights reserved.
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 1383e3a4e050..90348a2af3e9 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2015, The Linux Foundation. All rights reserved.
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 5311ab7f3c70..f3643320ff2f 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2012-2015, The Linux Foundation. All rights reserved.
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index ed8192d56b06..305042c29b2b 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2018, The Linux Foundation
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/iopoll.h>
-- 
2.43.0

