Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE5BB3310C
	for <lists+dri-devel@lfdr.de>; Sun, 24 Aug 2025 16:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD9110E0C3;
	Sun, 24 Aug 2025 14:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q1wATjT8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630B810E0C3
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 14:59:33 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-70a9f5625b7so32893176d6.2
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 07:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756047572; x=1756652372; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rnSjySc6sr/GcMl6WZdws9iNHYbtGeaN6kDGRl7xn5k=;
 b=Q1wATjT8EvqSzB2WTW6Ba+gHpVFq4K1yNA/h1Ofr99oQcKCLesECjccFqnbjgtHyIb
 DkB0tx518Zzi/+hStuE0OIe+kTl14hXOI0aP4zQt+31dHeUGf1naE/bVvASC1NXIqQOs
 hfTtRAhybyAy5XBp6dhqG1TY9Az2DROq5YWU3rNTgsxZ2FhT0tmFLzL3Yk4gwWilZsVo
 a/rZs9XvwmC4HL+XuK2u2sTQ4HmkiR/mmixgxKkqh4TWjdXg4xjvW6/m4sLbWFeo6vwl
 dCI+CeT80jZn+557fW36FuJ+5AVK/+j+qVlc9vOYN2HZIbjV1w7+XBE2mpoX1wW4PABL
 y7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756047572; x=1756652372;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rnSjySc6sr/GcMl6WZdws9iNHYbtGeaN6kDGRl7xn5k=;
 b=UgaE2XP2GDYN0KSq/LzM2xBo/OSmDT84g1EiiWHC1FULNMgwSoKtttYkNrFhYGS/Kz
 kP1IGzKYKUqZK+cs5fQEl8SPblnZQNO7g1/EVdzKjMUaiQV2JIf9Mt0L+JV3NYEezHbw
 SZLb3HdlGSl8jF+cPiukFhG2P7GBbbkab1mnA0eMrXWZQRQXa6MlYx5I79u+Wsb8KGcE
 +6d9F1kHNnwcTMhNprIWBWsJPp/mU98bWp4XwDceXEya9+yufHsv7CqhdMlY7tRtgH+8
 a1nHHKs4c9S1uQ0ta5QKf+16LmcagyGSFleJTOZf/8Aj9CAnNOH5N3hexjj7ukf/TVj/
 ztvw==
X-Gm-Message-State: AOJu0Yz9Yjrl1oN6CmkA3MVEJtRVObDnLzApjUbwWaxc9CfskEJjwQYL
 3D0C1psDHIdBrf9QXcFFnrb7MLHZpw3keFsVRNTRZqrd1YlswQJwtZJz
X-Gm-Gg: ASbGnctCPnn3h/YepqRrBk8LamCF/PqyYQhNwyHDH4MQfcIzlpSOr8bnaiw6sD8b0CR
 QS8+4IgLIUnjX2xerzB2JX3NHo+D70NWWg281voH9forYO9o/EF2AMNwsBKTxbqM8Ws4Cqi/Hv5
 1N3Qs9A/u39m82WQmf+uANpyU90TzMYBHwKWqiyPpamqtCxmRHvyV07nACeG/waN2Q8pjnQkw/O
 sk/GYkxcJyFNhhpU8Sgp6/M3GObdGF+J4brfVcCxhe1WSCfULKEeiOmJEOtQ1RUorbq7czYfocI
 VDSfpU3I/7+dff90HQD87Dgb2pmVAQhMSj2jKLsUUrUCX7hVgR9VQoJx7Xde7R1EzjgPjw5rvlG
 E9RCwVVyrmZGCAYbR0bR71t3SZ5YvjtRnSGYjikdhORWtFnwXAxUEdSbaVQ==
X-Google-Smtp-Source: AGHT+IHWS0giv/9NAXCJiSUax4+HqnfYikUftbaRG3vmR36f0UjrIE81WEpy8zXfpOKsVdxIivhzAA==
X-Received: by 2002:a05:6214:a54:b0:707:56dc:178d with SMTP id
 6a1803df08f44-70d971e9166mr73587496d6.37.1756047572303; 
 Sun, 24 Aug 2025 07:59:32 -0700 (PDT)
Received: from cr-x-redhat96-nsd-2.fyre.ibm.com ([129.41.87.0])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70da7145ec7sm29210466d6.15.2025.08.24.07.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 07:59:31 -0700 (PDT)
From: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
To: ogabbay@kernel.org,
	yaron.avizrat@intel.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Subject: [PATCH] accel: habanalabs: Use string choices helpers
Date: Sun, 24 Aug 2025 07:59:13 -0700
Message-ID: <20250824145913.2386190-1-chelsyratnawat2001@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Use string_choices.h helpers instead of hard-coded strings.

Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
---
 drivers/accel/habanalabs/common/firmware_if.c      | 14 +++++++-------
 drivers/accel/habanalabs/gaudi/gaudi_coresight.c   |  9 +++++----
 drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c |  9 +++++----
 drivers/accel/habanalabs/goya/goya.c               |  3 ++-
 drivers/accel/habanalabs/goya/goya_coresight.c     |  9 +++++----
 5 files changed, 24 insertions(+), 20 deletions(-)

diff --git a/drivers/accel/habanalabs/common/firmware_if.c b/drivers/accel/habanalabs/common/firmware_if.c
index eeb6b2a80fc7..cef53a3fd839 100644
--- a/drivers/accel/habanalabs/common/firmware_if.c
+++ b/drivers/accel/habanalabs/common/firmware_if.c
@@ -14,6 +14,7 @@
 #include <linux/slab.h>
 #include <linux/ctype.h>
 #include <linux/vmalloc.h>
+#include <linux/string_choices.h>
 
 #include <trace/events/habanalabs.h>
 
@@ -1705,13 +1706,13 @@ static void hl_fw_preboot_update_state(struct hl_device *hdev)
 							cpu_boot_dev_sts1);
 
 	dev_dbg(hdev->dev, "Firmware preboot hard-reset is %s\n",
-			prop->hard_reset_done_by_fw ? "enabled" : "disabled");
+			str_enabled_disabled(prop->hard_reset_done_by_fw));
 
 	dev_dbg(hdev->dev, "firmware-level security is %s\n",
-			prop->fw_security_enabled ? "enabled" : "disabled");
+			str_enabled_disabled(prop->fw_security_enabled));
 
 	dev_dbg(hdev->dev, "GIC controller is %s\n",
-			prop->gic_interrupts_enable ? "enabled" : "disabled");
+			str_enabled_disabled(prop->gic_interrupts_enable));
 }
 
 static int hl_fw_static_read_preboot_status(struct hl_device *hdev)
@@ -2455,7 +2456,7 @@ static void hl_fw_boot_fit_update_state(struct hl_device *hdev,
 	}
 
 	dev_dbg(hdev->dev, "Firmware boot CPU hard-reset is %s\n",
-			prop->hard_reset_done_by_fw ? "enabled" : "disabled");
+			str_enabled_disabled(prop->hard_reset_done_by_fw));
 }
 
 static void hl_fw_dynamic_update_linux_interrupt_if(struct hl_device *hdev)
@@ -2647,8 +2648,7 @@ static void hl_fw_linux_update_state(struct hl_device *hdev,
 			prop->fw_app_cpu_boot_dev_sts0);
 
 		dev_dbg(hdev->dev, "GIC controller is %s\n",
-				prop->gic_interrupts_enable ?
-						"enabled" : "disabled");
+				str_enabled_disabled(prop->gic_interrupts_enable));
 	}
 
 	if (prop->fw_cpu_boot_dev_sts1_valid) {
@@ -2660,7 +2660,7 @@ static void hl_fw_linux_update_state(struct hl_device *hdev,
 	}
 
 	dev_dbg(hdev->dev, "Firmware application CPU hard-reset is %s\n",
-			prop->hard_reset_done_by_fw ? "enabled" : "disabled");
+			str_enabled_disabled(prop->hard_reset_done_by_fw));
 
 	dev_info(hdev->dev, "Successfully loaded firmware to device\n");
 }
diff --git a/drivers/accel/habanalabs/gaudi/gaudi_coresight.c b/drivers/accel/habanalabs/gaudi/gaudi_coresight.c
index 1168fefa33f4..3900a7727f4c 100644
--- a/drivers/accel/habanalabs/gaudi/gaudi_coresight.c
+++ b/drivers/accel/habanalabs/gaudi/gaudi_coresight.c
@@ -12,6 +12,7 @@
 #include "../include/gaudi/gaudi_reg_map.h"
 
 #include <uapi/drm/habanalabs_accel.h>
+#include <linux/string_choices.h>
 
 #define SPMU_SECTION_SIZE		MME0_ACC_SPMU_MAX_OFFSET
 #define SPMU_EVENT_TYPES_OFFSET		0x400
@@ -497,7 +498,7 @@ static int gaudi_config_etf(struct hl_device *hdev,
 	if (rc) {
 		dev_err(hdev->dev,
 			"Failed to %s ETF on timeout, error %d\n",
-				params->enable ? "enable" : "disable", rc);
+				str_enable_disable(params->enable), rc);
 		return rc;
 	}
 
@@ -505,7 +506,7 @@ static int gaudi_config_etf(struct hl_device *hdev,
 	if (rc) {
 		dev_err(hdev->dev,
 			"Failed to %s ETF on timeout, error %d\n",
-				params->enable ? "enable" : "disable", rc);
+				str_enable_disable(params->enable), rc);
 		return rc;
 	}
 
@@ -601,14 +602,14 @@ static int gaudi_config_etr(struct hl_device *hdev,
 	rc = gaudi_coresight_timeout(hdev, mmPSOC_ETR_FFCR, 6, false);
 	if (rc) {
 		dev_err(hdev->dev, "Failed to %s ETR on timeout, error %d\n",
-				params->enable ? "enable" : "disable", rc);
+				str_enable_disable(params->enable), rc);
 		return rc;
 	}
 
 	rc = gaudi_coresight_timeout(hdev, mmPSOC_ETR_STS, 2, true);
 	if (rc) {
 		dev_err(hdev->dev, "Failed to %s ETR on timeout, error %d\n",
-				params->enable ? "enable" : "disable", rc);
+				str_enable_disable(params->enable), rc);
 		return rc;
 	}
 
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c b/drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c
index 2423620ff358..f35a024ad532 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c
@@ -6,6 +6,7 @@
  */
 #include "gaudi2_coresight_regs.h"
 #include <uapi/drm/habanalabs_accel.h>
+#include <linux/string_choices.h>
 
 #define GAUDI2_PLDM_CORESIGHT_TIMEOUT_USEC	(CORESIGHT_TIMEOUT_USEC * 2000)
 #define SPMU_MAX_COUNTERS			6
@@ -2106,14 +2107,14 @@ static int gaudi2_config_etf(struct hl_device *hdev, struct hl_debug_params *par
 	rc = gaudi2_coresight_timeout(hdev, base_reg + mmETF_FFCR_OFFSET, 6, false);
 	if (rc) {
 		dev_err(hdev->dev, "Failed to %s ETF on timeout, error %d\n",
-			params->enable ? "enable" : "disable", rc);
+			str_enable_disable(params->enable), rc);
 		return rc;
 	}
 
 	rc = gaudi2_coresight_timeout(hdev, base_reg + mmETF_STS_OFFSET, 2, true);
 	if (rc) {
 		dev_err(hdev->dev, "Failed to %s ETF on timeout, error %d\n",
-			params->enable ? "enable" : "disable", rc);
+			str_enable_disable(params->enable), rc);
 		return rc;
 	}
 
@@ -2215,14 +2216,14 @@ static int gaudi2_config_etr(struct hl_device *hdev, struct hl_ctx *ctx,
 	rc = gaudi2_coresight_timeout(hdev, mmPSOC_ETR_FFCR, 6, false);
 	if (rc) {
 		dev_err(hdev->dev, "Failed to %s ETR on timeout, error %d\n",
-				params->enable ? "enable" : "disable", rc);
+				str_enable_disable(params->enable), rc);
 		return rc;
 	}
 
 	rc = gaudi2_coresight_timeout(hdev, mmPSOC_ETR_STS, 2, true);
 	if (rc) {
 		dev_err(hdev->dev, "Failed to %s ETR on timeout, error %d\n",
-				params->enable ? "enable" : "disable", rc);
+				str_enable_disable(params->enable), rc);
 		return rc;
 	}
 
diff --git a/drivers/accel/habanalabs/goya/goya.c b/drivers/accel/habanalabs/goya/goya.c
index 84768e306269..cca904a21392 100644
--- a/drivers/accel/habanalabs/goya/goya.c
+++ b/drivers/accel/habanalabs/goya/goya.c
@@ -15,6 +15,7 @@
 #include <linux/hwmon.h>
 #include <linux/iommu.h>
 #include <linux/seq_file.h>
+#include <linux/string_choices.h>
 
 /*
  * GOYA security scheme:
@@ -820,7 +821,7 @@ int goya_set_frequency(struct hl_device *hdev, enum hl_pll_frequency freq)
 		return 0;
 
 	dev_dbg(hdev->dev, "Changing device frequency to %s\n",
-		freq == PLL_HIGH ? "high" : "low");
+		str_high_low(freq == PLL_HIGH));
 
 	goya_set_pll_profile(hdev, freq);
 
diff --git a/drivers/accel/habanalabs/goya/goya_coresight.c b/drivers/accel/habanalabs/goya/goya_coresight.c
index 3827ea4c02f7..f65c9a802444 100644
--- a/drivers/accel/habanalabs/goya/goya_coresight.c
+++ b/drivers/accel/habanalabs/goya/goya_coresight.c
@@ -11,6 +11,7 @@
 #include "../include/goya/asic_reg/goya_masks.h"
 
 #include <uapi/drm/habanalabs_accel.h>
+#include <linux/string_choices.h>
 
 #define GOYA_PLDM_CORESIGHT_TIMEOUT_USEC	(CORESIGHT_TIMEOUT_USEC * 100)
 
@@ -330,7 +331,7 @@ static int goya_config_etf(struct hl_device *hdev,
 	if (rc) {
 		dev_err(hdev->dev,
 			"Failed to %s ETF on timeout, error %d\n",
-				params->enable ? "enable" : "disable", rc);
+				str_enable_disable(params->enable), rc);
 		return rc;
 	}
 
@@ -338,7 +339,7 @@ static int goya_config_etf(struct hl_device *hdev,
 	if (rc) {
 		dev_err(hdev->dev,
 			"Failed to %s ETF on timeout, error %d\n",
-				params->enable ? "enable" : "disable", rc);
+				str_enable_disable(params->enable), rc);
 		return rc;
 	}
 
@@ -405,14 +406,14 @@ static int goya_config_etr(struct hl_device *hdev,
 	rc = goya_coresight_timeout(hdev, mmPSOC_ETR_FFCR, 6, false);
 	if (rc) {
 		dev_err(hdev->dev, "Failed to %s ETR on timeout, error %d\n",
-				params->enable ? "enable" : "disable", rc);
+				str_enable_disable(params->enable), rc);
 		return rc;
 	}
 
 	rc = goya_coresight_timeout(hdev, mmPSOC_ETR_STS, 2, true);
 	if (rc) {
 		dev_err(hdev->dev, "Failed to %s ETR on timeout, error %d\n",
-				params->enable ? "enable" : "disable", rc);
+				str_enable_disable(params->enable), rc);
 		return rc;
 	}
 
-- 
2.47.3

