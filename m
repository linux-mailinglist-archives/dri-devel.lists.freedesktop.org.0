Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C5E7ED876
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 01:18:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6719B10E2C3;
	Thu, 16 Nov 2023 00:18:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ECC610E2B5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 00:17:52 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6ce2988d62eso126942a34.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 16:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700093872; x=1700698672; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fn0jnV8watcY8qyeukKxGsG/nXZh1+98BwjcKTbh6rk=;
 b=gh8pjjxd6Khv1bwVmrBrx2Y93omb5+Kl2rCMXXAHYgkeLofg1mWpcgOBLp/Z65P4L9
 TNEm799nRra2/l7hP3ChsjX40ZkO+tiYCxBdLoLbgOVL/ka8B7W83BRQODZgcsjsUV5X
 /ghHhKYtSaJ6KK0DPs88UthU4n9fN0CcjC14MfSOFXRQRFWqGhkVgk88q2F/lBKkE6sQ
 iieAyNX8KoEgPpWgwA3nGIhoDSLZznKuU4V0sMnRnlimWLB33j12d9yNox9hecU9oxDU
 GPi9Be5VIEPluMgWbTSAY7KuHT2Y+ILhIg7SkMWHLRK5OVIj0NaPFpaIM0Sg9jdduigG
 zWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700093872; x=1700698672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fn0jnV8watcY8qyeukKxGsG/nXZh1+98BwjcKTbh6rk=;
 b=jhoX/sQ9ZhKyt4P2d7Pt3wOk78/lRM7D884Iv3BgOLNJYrvaQA/hm2BKKaNtApOlmh
 hpdmwx9BPDoi+hN2BhYs2dMzkfRSadJq4QXaU1awM9jAQfJFODBFl2+K504tYL/KgVi/
 SC2yUmbD8sboWC/A6Hns1o1RWogfTG6+ewEdt9KdszEqhQbauxaz06jKQ2YwQ1IHrsEP
 mT6Zn5+R17Nu2UWW6z04et4j0d+M12mmqMRz5keAGUUKuAssPErW05dE7vbf70p3x3mB
 yLuBAUcczGLu3XX25SiqbFowVkL2wYgk1ru+Tg3AzcvmEtQhFT3zOWo7g7agHbCama1k
 WZjw==
X-Gm-Message-State: AOJu0YxltdKHtYu2SBRthrt3jG1fPWJHvN25ulQoWFE/uqkbT7NFLD7F
 u1P6NJLiatm1Nt2SxRA7gvY=
X-Google-Smtp-Source: AGHT+IFgW6c7qYUuH54nf6HOWx8QDa/CnQp5Ih8Am7cVXsTlWykB1rknOmnEGKWlpgCmzukCr7Kivw==
X-Received: by 2002:a05:6870:cd0e:b0:1e9:dae7:f58a with SMTP id
 qk14-20020a056870cd0e00b001e9dae7f58amr16617397oab.22.1700093871792; 
 Wed, 15 Nov 2023 16:17:51 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 j18-20020a9d7d92000000b006c619f17669sm727117otn.74.2023.11.15.16.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 16:17:51 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH V3 6/6] dt-bindings: arm: rockchip: Add Powkiddy RK2023
Date: Wed, 15 Nov 2023 18:17:42 -0600
Message-Id: <20231116001742.2340646-7-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231116001742.2340646-1-macroalpha82@gmail.com>
References: <20231116001742.2340646-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Powkiddy RK2023. The Powkiddy RK2023 is a handheld
gaming device with a 3.5 inch screen powered by the Rockchip RK3566
SoC. The device looks physically different from the Powkiddy RGB30,
but is functionally identical except for the panel.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile         |  1 +
 .../dts/rockchip/rk3566-powkiddy-rk2023.dts   | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index a18f33bf0c0e..f969618da352 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -78,6 +78,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-anbernic-rg503.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-pinenote-v1.1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-pinenote-v1.2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-powkiddy-rgb30.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-powkiddy-rk2023.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-quartz64-a.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-quartz64-b.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-radxa-cm3-io.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dts b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dts
new file mode 100644
index 000000000000..ba32d0793dca
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dts
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include "rk3566-powkiddy-rk2023.dtsi"
+
+/ {
+	model = "RK2023";
+	compatible = "powkiddy,rk2023", "rockchip,rk3566";
+};
+
+&cru {
+	assigned-clocks = <&pmucru CLK_RTC_32K>, <&cru PLL_GPLL>,
+			  <&pmucru PLL_PPLL>, <&cru PLL_VPLL>;
+	assigned-clock-rates = <32768>, <1200000000>,
+			  <200000000>, <115200000>;
+};
+
+&dsi0 {
+	panel: panel@0 {
+		compatible = "powkiddy,rk2023-panel", "newvision,nv3051d";
+		reg = <0>;
+		backlight = <&backlight>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&lcd_rst>;
+		reset-gpios = <&gpio4 RK_PA0 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&vcc3v3_lcd0_n>;
+
+		port {
+			mipi_in_panel: endpoint {
+				remote-endpoint = <&mipi_out_panel>;
+			};
+		};
+	};
+};
-- 
2.34.1

