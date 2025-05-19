Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DEAABBF77
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 15:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F2F10E40D;
	Mon, 19 May 2025 13:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D252910E427
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 13:44:16 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43edb40f357so35901815e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 06:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747662255; x=1748267055;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=anhtEfC+aYWJeJvUly60jdWH8rm+sVcW8pcF9vb2eMk=;
 b=HJMFSUgU+pLE4f6xQoPZ838pVBmSmyqt2uQPUq1Cj3BXHXLyWZW2eMgELYNzveixGQ
 eSXXUz/Tw9WZjETx7WlGZdPIbSUWfFn8/uWbVyjujoP926Ooc83PFwC1r3xTbnK1r/cS
 MciOi5+gpBNxubRIsFqWn/+WQtFTG6fcqugxP1bUhL9zdF4c7gzlxnDzmLh+yck8bMVO
 Z0HtdwQPPn2n4Tl+Fe4ZevSp8LzkoN7WSZToqtO8GrPCdM41fe3rEMahukGSkidld682
 YkMlYLJd3DHZnkK/rORnsv84/PRucziqazzVAwKlq5yeLX0IlvQZRKOhTdq6CD9Nrq7S
 Dx1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+vWl6xSDDSCI5e79G/9pN6oTfHQ8sUnmtRNI9ecAF+fT49XC8VNPGtmMlBtyieDhDxKk9FKcffHc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8esZS4HHQiZyWw/qEqi6EZrNdJGqahOCmYB+SKPNgdhAtCZmy
 sywFJ4uCwA9x0EG66LFhBo81RltxcyX3H8/syGk7ugt+VFKlerbGbJvS
X-Gm-Gg: ASbGncthGiNnbh52fMZynA0optS4Z6LFf0Wx5ayGSMKz4TsKjFUflwNE1tJPDDLqId7
 9AXDI3VKy6BECV659MT2U0lyULUZEnBend1aVx7wG2/N2eMjAP9TfOBh6ROwf+UcyxoZtyfiHnA
 ESTHK2P69VAFZOS7RTG9Gs9XMwQuu9X7W0wIBNKYqMUO+PFCEBkNMeVlSg9+tvN4MK3kKw1qS4Z
 2kbfAO6gEMAADJ6Z43LnOGOEC4obtZc0B4gcxqMzQAP5Jt88t1vxnhv54iqDrMAjZcq4B8mv2JZ
 5ALa0LNzeT8TkTOiHCPrK8n1yRN1sjfP7mKmzm8OxabtNN3I61GauTBwAZoqTxlBIGXz8EdbKfb
 6od3Si4xO6g==
X-Google-Smtp-Source: AGHT+IEWSM8pwbQ+eewtaNC0pityD3poeCoFUie9piHQXV3RLcUMbKhDhTRCudb5lKuMqUm4AA1Amw==
X-Received: by 2002:a05:600c:529b:b0:43c:e7ae:4bcf with SMTP id
 5b1f17b1804b1-442fd5a347emr129006045e9.0.1747662255196; 
 Mon, 19 May 2025 06:44:15 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f8ab839esm171263005e9.17.2025.05.19.06.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 06:44:14 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 19 May 2025 15:43:42 +0200
Subject: [PATCH v4 10/10] arm64: dts: rockchip: enable NPU on ROCK 5B
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-6-10-rocket-v4-10-d6dff6b4c0ae@tomeuvizoso.net>
References: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
In-Reply-To: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

The NPU on the ROCK5B uses the same regulator for both the sram-supply
and the npu's supply. Add this regulator, and enable all the NPU bits.
Also add the regulator as a domain-supply to the pd_npu power domain.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts | 56 +++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
index d22068475c5dc6cb885f878f3f527a66edf1ba70..49500f7cbcb14af4919a6c1997e9e53a01d84973 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
@@ -316,6 +316,28 @@ regulator-state-mem {
 	};
 };
 
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1m2_xfer>;
+	status = "okay";
+
+	vdd_npu_s0: regulator@42 {
+		compatible = "rockchip,rk8602";
+		reg = <0x42>;
+		fcs,suspend-voltage-selector = <1>;
+		regulator-name = "vdd_npu_s0";
+		regulator-boot-on;
+		regulator-min-microvolt = <550000>;
+		regulator-max-microvolt = <950000>;
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+};
+
 &i2c6 {
 	status = "okay";
 
@@ -440,6 +462,10 @@ &pd_gpu {
 	domain-supply = <&vdd_gpu_s0>;
 };
 
+&pd_npu {
+	domain-supply = <&vdd_npu_s0>;
+};
+
 &pinctrl {
 	hdmirx {
 		hdmirx_hpd: hdmirx-5v-detection {
@@ -500,6 +526,36 @@ &pwm1 {
 	status = "okay";
 };
 
+&rknn_core_top {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_core_1 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_core_2 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_mmu_top {
+	status = "okay";
+};
+
+&rknn_mmu_1 {
+	status = "okay";
+};
+
+&rknn_mmu_2 {
+	status = "okay";
+};
+
 &saradc {
 	vref-supply = <&avcc_1v8_s0>;
 	status = "okay";

-- 
2.49.0

