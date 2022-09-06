Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B16E65AEA6B
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 15:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D9110E686;
	Tue,  6 Sep 2022 13:49:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F8110E675
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 13:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Tuvy5Y2Yi3UNEoXv4av1eQWjOERqkurWhKK+J19WGaY=; b=jB9GenLAGk68whmfLt9Z0+r3ic
 SCD5HDPe9LvE/UE7QueLNbvZStSrsqt0OTXItcNYAbKS6oAEMU/DpEUyKYPU+F+V14ZejUXiWeuUh
 RjRn11MaMRlwHI2+9ABN5e+Kb9G3euJ+MezkALZ0Op4QUDUKV1VLsemmkL45D+KdSKZSL9rwNQhKT
 oea5ZTD0V+nyYQYeceTYy8SjKgzyndpQ3YbnHR/ek3PC0vycQu78zNoZk1WJTc0djKgUhmuEPRZxi
 dsGnGBXeVdQgpk6U3vAcQLg2onHqdJSPluHW4IiynAvLdDmg/PXoxnKlbY/x3dKoPF+Sd4NxlKcdc
 Ra6N7cRg==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1oVYdX-008sZV-1Q; Tue, 06 Sep 2022 16:29:07 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH 2/8] dt-bindings: Add headers for NVDEC on Tegra234
Date: Tue,  6 Sep 2022 16:28:17 +0300
Message-Id: <20220906132823.2390953-3-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220906132823.2390953-1-cyndis@kapsi.fi>
References: <20220906132823.2390953-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: devicetree@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org,
 Ashish Mhetre <amhetre@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Add clock, memory controller, powergate and reset dt-binding headers
necessary for NVDEC.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 include/dt-bindings/clock/tegra234-clock.h     | 4 ++++
 include/dt-bindings/memory/tegra234-mc.h       | 3 +++
 include/dt-bindings/power/tegra234-powergate.h | 1 +
 include/dt-bindings/reset/tegra234-reset.h     | 1 +
 4 files changed, 9 insertions(+)

diff --git a/include/dt-bindings/clock/tegra234-clock.h b/include/dt-bindings/clock/tegra234-clock.h
index 173364a93381..25b4a3fb4588 100644
--- a/include/dt-bindings/clock/tegra234-clock.h
+++ b/include/dt-bindings/clock/tegra234-clock.h
@@ -82,6 +82,8 @@
 #define TEGRA234_CLK_I2S6			66U
 /** @brief clock recovered from I2S6 input */
 #define TEGRA234_CLK_I2S6_SYNC_INPUT		67U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_NVDEC */
+#define TEGRA234_CLK_NVDEC                      83U
 /** PLL controlled by CLK_RST_CONTROLLER_PLLA_BASE for use by audio clocks */
 #define TEGRA234_CLK_PLLA			93U
 /** @brief PLLP clk output */
@@ -130,6 +132,8 @@
 #define TEGRA234_CLK_SYNC_I2S5			149U
 /** @brief output of mux controlled by CLK_RST_CONTROLLER_AUDIO_SYNC_CLK_I2S6 */
 #define TEGRA234_CLK_SYNC_I2S6			150U
+/** output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_PKA */
+#define TEGRA234_CLK_TSEC_PKA                   154U
 /** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_UARTA */
 #define TEGRA234_CLK_UARTA			155U
 /** @brief output of gate CLK_ENB_PEX1_CORE_6 */
diff --git a/include/dt-bindings/memory/tegra234-mc.h b/include/dt-bindings/memory/tegra234-mc.h
index 62987b47ce81..75f0bd30d365 100644
--- a/include/dt-bindings/memory/tegra234-mc.h
+++ b/include/dt-bindings/memory/tegra234-mc.h
@@ -32,6 +32,7 @@
 #define TEGRA234_SID_PCIE10	0x0b
 #define TEGRA234_SID_BPMP	0x10
 #define TEGRA234_SID_HOST1X	0x27
+#define TEGRA234_SID_NVDEC	0x29
 #define TEGRA234_SID_VIC	0x34
 
 /*
@@ -91,6 +92,8 @@
 #define TEGRA234_MEMORY_CLIENT_SDMMCWAB 0x67
 #define TEGRA234_MEMORY_CLIENT_VICSRD 0x6c
 #define TEGRA234_MEMORY_CLIENT_VICSWR 0x6d
+#define TEGRA234_MEMORY_CLIENT_NVDECSRD 0x78
+#define TEGRA234_MEMORY_CLIENT_NVDECSWR 0x79
 /* BPMP read client */
 #define TEGRA234_MEMORY_CLIENT_BPMPR 0x93
 /* BPMP write client */
diff --git a/include/dt-bindings/power/tegra234-powergate.h b/include/dt-bindings/power/tegra234-powergate.h
index ae9286cef85c..e5dc1e00be95 100644
--- a/include/dt-bindings/power/tegra234-powergate.h
+++ b/include/dt-bindings/power/tegra234-powergate.h
@@ -19,6 +19,7 @@
 #define TEGRA234_POWER_DOMAIN_MGBEB	18U
 #define TEGRA234_POWER_DOMAIN_MGBEC	19U
 #define TEGRA234_POWER_DOMAIN_MGBED	20U
+#define TEGRA234_POWER_DOMAIN_NVDEC     23U
 #define TEGRA234_POWER_DOMAIN_VIC	29U
 
 #endif
diff --git a/include/dt-bindings/reset/tegra234-reset.h b/include/dt-bindings/reset/tegra234-reset.h
index d48d22b2bc7f..17163019316c 100644
--- a/include/dt-bindings/reset/tegra234-reset.h
+++ b/include/dt-bindings/reset/tegra234-reset.h
@@ -30,6 +30,7 @@
 #define TEGRA234_RESET_I2C7			33U
 #define TEGRA234_RESET_I2C8			34U
 #define TEGRA234_RESET_I2C9			35U
+#define TEGRA234_RESET_NVDEC                    44U
 #define TEGRA234_RESET_MGBE0_PCS		45U
 #define TEGRA234_RESET_MGBE0_MAC		46U
 #define TEGRA234_RESET_MGBE1_PCS		49U
-- 
2.37.0

