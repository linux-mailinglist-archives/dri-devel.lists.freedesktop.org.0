Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A367ACCDB8
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 21:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6719910E19C;
	Tue,  3 Jun 2025 19:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MYbwFU0s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0555110E0D9
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 19:42:02 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id
 006d021491bc7-60be827f2b7so143298eaf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 12:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748979722; x=1749584522; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FgLtrMgHhQ/oGFMvm8sSOBZ5dDdVEtN1pzHrZf4N+fU=;
 b=MYbwFU0svDjyv1i2r3o9w8XHihTYAo3vsrrAGw0U1SCoe9tT0K+cF72oNh4yhtAzJa
 s+V/0QqRenxAwhOl509SHKjaLeVZPT1X2V3Mbl5WsIlLdW1bCYXSNOXjoKj7XiNu0wg5
 5OvadUvF71mvG2KGAGcc9V06el+ORBtXu5D6Bimtiw5h7w+nDoxMmCLrurukLpA4CI73
 1izJNzbz/jXZ+X2AcWq1ypRYpuVD8sj3OePrNV1UWSXNMB5iiQ19f1L3YCpLX1VHsusS
 +Hr+a7zXIoOnTXp8wnRxgFnRWCvWspjsoNNxKSAH2YPYnnWT0GBaTH/CluIjm7OBB+MF
 742g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748979722; x=1749584522;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FgLtrMgHhQ/oGFMvm8sSOBZ5dDdVEtN1pzHrZf4N+fU=;
 b=Xdi5vdnS6dILPwEFE3hrpULodFX5AHx5nnd0+qoSFLO7MF151+L/bAmxQZq2HST/pE
 7Z8UunyTDMvQOHP9vmEMr0jEA0Qed8CUmVmILgZhjThjXVcovKoqKO7qvf5xToabVN+M
 9p8P0wegS9JyD9zrmxeCMdfpUuDLUOd2mjpCB4XAKg83FG6poSjqnrtj5XKIujedKiIb
 JqC4pnOainDcUJ333BEAhYE310EviDzBeLR9PrfVWbzj6IgG6QickTlJ9oazibXx43K8
 VuXbwZrtM+3WF2x33FACqn4ZNtWZuvMDzcL+pJe7q45ZgpT0PXWHXZHFXJo6vLhgCE9N
 ILEw==
X-Gm-Message-State: AOJu0YxZJr9Eb2u9iFjGPQl6mez887Hk9NfsFrhG45P6pTqzD1g64hai
 l/GGiATDsgCaA3DzkwSOHlNJwRtedj3DZplStDdA6uSyEgkI+IsnicX4TJYhuA==
X-Gm-Gg: ASbGncu8IO9TGG8VwkM+JmKBpmjY5himiu1wtq61Ca+Vc1MTuTOX1yacvl/dNCr7F/o
 hk40V5bzHJSx1/q1T2r5JyvSk1fQL3tNxLqlP1B1e6AfyhH9QGyAOD74Wo9IT89JqNWyXqGPfTN
 mnR8e0iYRj041r5IcZVbpt4TW2UsIFnuJeq10fRlNfXfOvpAxiQmQaLR5Pyt3vIOBMvMFoUeInt
 r73cRbQwP1ZEDG7hPBPgKUAtr7eEyfThzEFyUcTJHXDYLy7brofcJI3mpd3ZepwQzRJinZYePJV
 K8FIyDv72Sx50nWdo3Q6TiHA0X/pBx8EaDCffMYKzbOV724z2olK6XYdSXWlFjlkIFybjOs=
X-Google-Smtp-Source: AGHT+IE9tiwKq/R/e3U5EawJb79KooQ4IxNgVCBv1cslv8xmu0yJpXxxMeDxU3qVBvLMhI+JZsrssA==
X-Received: by 2002:a4a:dc48:0:b0:608:3493:b807 with SMTP id
 006d021491bc7-60efdd1f98dmr1851832eaf.2.1748979722009; 
 Tue, 03 Jun 2025 12:42:02 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:d19a:d10c:4358:1346])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-60c14c88f96sm1967615eaf.17.2025.06.03.12.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 12:42:01 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 sebastian.reichel@collabora.com, heiko@sntech.de, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, tzimmermann@suse.de,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, quic_jesszhan@quicinc.com, neil.armstrong@linaro.org,
 javierm@redhat.com, megi@xff.cz, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 4/4] arm64: dts: rockchip: Add DSI panel support for
 gameforce-ace
Date: Tue,  3 Jun 2025 14:39:30 -0500
Message-ID: <20250603193930.323607-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250603193930.323607-1-macroalpha82@gmail.com>
References: <20250603193930.323607-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Enable the DSI controller, DSI DCPHY, and Huiling hl055fhav028c
1080x1920 panel for the Gameforce Ace.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../dts/rockchip/rk3588s-gameforce-ace.dts    | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts b/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
index 873a2bd6a6de..bb7c1b732cc2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
@@ -7,6 +7,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/pwm/pwm.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
 #include <dt-bindings/thermal/thermal.h>
 #include <dt-bindings/usb/pd.h>
 #include "rk3588s.dtsi"
@@ -456,6 +457,42 @@ &cpu_b3 {
 	cpu-supply = <&vdd_cpu_big1_s0>;
 };
 
+&dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "huiling,hl055fhav028c", "himax,hx8399c";
+		reg = <0>;
+		backlight = <&backlight>;
+		iovcc-supply = <&vcc3v3_lcd0_n>;
+		pinctrl-0 = <&lcd_rst>;
+		pinctrl-names = "default";
+		reset-gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_LOW>;
+		rotation = <90>;
+		vcc-supply = <&vcc3v3_lcd0_n>;
+
+		port {
+			mipi_panel_in: endpoint {
+				remote-endpoint = <&dsi0_out_panel>;
+			};
+		};
+	};
+};
+
+&dsi0_in {
+	dsi0_in_vp3: endpoint {
+		remote-endpoint = <&vp3_out_dsi0>;
+	};
+};
+
+&dsi0_out {
+	dsi0_out_panel: endpoint {
+		remote-endpoint = <&mipi_panel_in>;
+	};
+};
+
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
 	status = "okay";
@@ -633,6 +670,10 @@ &i2s0_sdi0
 	status = "okay";
 };
 
+&mipidcphy0 {
+	status = "okay";
+};
+
 &package_thermal {
 	polling-delay = <1000>;
 
@@ -769,6 +810,13 @@ lcd_bl_en: lcd-bl-en {
 		};
 	};
 
+	lcd_rst {
+		lcd_rst: lcd-rst {
+			rockchip,pins =
+				<1 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	pcie-pins {
 		pcie_rst: pcie-rst {
 			rockchip,pins =
@@ -1239,3 +1287,21 @@ bluetooth {
 		shutdown-gpios = <&gpio3 RK_PB7 GPIO_ACTIVE_HIGH>;
 	};
 };
+
+&vop {
+	status = "okay";
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vp3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	vp3_out_dsi0: endpoint@ROCKCHIP_VOP2_EP_MIPI0 {
+		reg = <ROCKCHIP_VOP2_EP_MIPI0>;
+		remote-endpoint = <&dsi0_in_vp3>;
+	};
+};
-- 
2.43.0

