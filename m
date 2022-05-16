Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C832F52812C
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 12:02:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D07FA10E7C2;
	Mon, 16 May 2022 10:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF5410E798
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 10:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bFaoYKE+rc6SnVof0cEgO4N8K0rH2w7eaPwkAQ3ydaQ=; b=R14CaqUVqsjY8xYKlCHkdONQQL
 cXib7ljuMjWPTnp6/+qTgj5vkv+u4Hzmft7ex0dMYUCxtqetKuh4TMrJnpdZuipfKZceZP+ucs6VR
 zWftEjA5qDTV0cSJUDa+WfuzvOhEbNyqfizjSpt2RXWPYTWAzxwInFH3z9USbsJOHUyPra79Zziht
 GOaHbfWhGLRzQRwBOs1o6uQmAODynA8nJfH+yoA8Xxe2njqSGu2d3X7N0N+jB8HAqO4r8nsVrJWCZ
 KlmP0F/Pm+L7juVJsrreUJAsP9g9swFDeK8fL9wNaKaOF5zt6/KWRbdUaEmKRCXodXQK7JIPc47T8
 KGLzOvMg==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <cyndis@kapsi.fi>)
 id 1nqXYe-0005yU-RO; Mon, 16 May 2022 13:02:32 +0300
From: cyndis@kapsi.fi
To: thierry.reding@gmail.com, jonathanh@nvidia.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, digetx@gmail.com
Subject: [PATCH v1 02/13] dt-bindings: Add headers for Host1x and VIC on
 Tegra234
Date: Mon, 16 May 2022 13:02:02 +0300
Message-Id: <20220516100213.1536571-3-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516100213.1536571-1-cyndis@kapsi.fi>
References: <20220516100213.1536571-1-cyndis@kapsi.fi>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Add clock, memory controller, powergate and reset dt-binding headers
for Host1x and VIC on Tegra234.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 include/dt-bindings/clock/tegra234-clock.h     | 4 ++++
 include/dt-bindings/memory/tegra234-mc.h       | 5 +++++
 include/dt-bindings/power/tegra234-powergate.h | 1 +
 include/dt-bindings/reset/tegra234-reset.h     | 1 +
 4 files changed, 11 insertions(+)

diff --git a/include/dt-bindings/clock/tegra234-clock.h b/include/dt-bindings/clock/tegra234-clock.h
index bd4c3086a2da..6e4e5cc75631 100644
--- a/include/dt-bindings/clock/tegra234-clock.h
+++ b/include/dt-bindings/clock/tegra234-clock.h
@@ -38,6 +38,8 @@
  * throughput and memory controller power.
  */
 #define TEGRA234_CLK_EMC			31U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_HOST1X */
+#define TEGRA234_CLK_HOST1X                     46U
 /** @brief output of gate CLK_ENB_FUSE */
 #define TEGRA234_CLK_FUSE			40U
 /** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_I2C1 */
@@ -132,6 +134,8 @@
 #define TEGRA234_CLK_UARTA			155U
 /** @brief output of gate CLK_ENB_PEX1_CORE_6 */
 #define TEGRA234_CLK_PEX1_C6_CORE		161U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_VIC */
+#define TEGRA234_CLK_VIC                        167U
 /** @brief output of gate CLK_ENB_PEX2_CORE_7 */
 #define TEGRA234_CLK_PEX2_C7_CORE		171U
 /** @brief output of gate CLK_ENB_PEX2_CORE_8 */
diff --git a/include/dt-bindings/memory/tegra234-mc.h b/include/dt-bindings/memory/tegra234-mc.h
index e3b0e9da295d..73fdd18523a9 100644
--- a/include/dt-bindings/memory/tegra234-mc.h
+++ b/include/dt-bindings/memory/tegra234-mc.h
@@ -26,6 +26,8 @@
 #define TEGRA234_SID_PCIE8	0x09
 #define TEGRA234_SID_PCIE10	0x0b
 #define TEGRA234_SID_BPMP	0x10
+#define TEGRA234_SID_HOST1X	0x27
+#define TEGRA234_SID_VIC	0x34
 
 /*
  * memory client IDs
@@ -33,6 +35,7 @@
 
 /* High-definition audio (HDA) read clients */
 #define TEGRA234_MEMORY_CLIENT_HDAR 0x15
+#define TEGRA234_MEMORY_CLIENT_HOST1XDMAR 0x16
 /* PCIE6 read clients */
 #define TEGRA234_MEMORY_CLIENT_PCIE6AR 0x28
 /* PCIE6 write clients */
@@ -65,6 +68,8 @@
 #define TEGRA234_MEMORY_CLIENT_SDMMCRAB 0x63
 /* sdmmcd memory write client */
 #define TEGRA234_MEMORY_CLIENT_SDMMCWAB 0x67
+#define TEGRA234_MEMORY_CLIENT_VICSRD 0x6c
+#define TEGRA234_MEMORY_CLIENT_VICSWR 0x6d
 /* BPMP read client */
 #define TEGRA234_MEMORY_CLIENT_BPMPR 0x93
 /* BPMP write client */
diff --git a/include/dt-bindings/power/tegra234-powergate.h b/include/dt-bindings/power/tegra234-powergate.h
index f610eee9bce8..c3f7e380d2c6 100644
--- a/include/dt-bindings/power/tegra234-powergate.h
+++ b/include/dt-bindings/power/tegra234-powergate.h
@@ -18,5 +18,6 @@
 #define TEGRA234_POWER_DOMAIN_MGBEA	17U
 #define TEGRA234_POWER_DOMAIN_MGBEB	18U
 #define TEGRA234_POWER_DOMAIN_MGBEC	19U
+#define TEGRA234_POWER_DOMAIN_VIC       29U
 
 #endif
diff --git a/include/dt-bindings/reset/tegra234-reset.h b/include/dt-bindings/reset/tegra234-reset.h
index 547ca3b60caa..1971400bf360 100644
--- a/include/dt-bindings/reset/tegra234-reset.h
+++ b/include/dt-bindings/reset/tegra234-reset.h
@@ -44,6 +44,7 @@
 #define TEGRA234_RESET_QSPI1			77U
 #define TEGRA234_RESET_SDMMC4			85U
 #define TEGRA234_RESET_UARTA			100U
+#define TEGRA234_RESET_VIC                      113U
 #define TEGRA234_RESET_PEX0_CORE_0		116U
 #define TEGRA234_RESET_PEX0_CORE_1		117U
 #define TEGRA234_RESET_PEX0_CORE_2		118U
-- 
2.36.1

