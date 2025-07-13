Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDBBB0300A
	for <lists+dri-devel@lfdr.de>; Sun, 13 Jul 2025 10:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D2010E34C;
	Sun, 13 Jul 2025 08:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37B610E33F
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 08:39:24 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-ae0de0c03e9so597462366b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 01:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752395963; x=1753000763;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FeyMo4Jt7UfkzhL/r2KfmA979+uFc7fR7QoglkpcpSU=;
 b=CWH6iVxoiG665hap3au25yMRRCJds8Q0q5glPLIkdAL4jhc4+8+V+aKnPjhZqhFkx0
 d1drfpN6VYygGIturTi0LDUUXcPLCJs+QCH/X9xJl1l8h7XZVVKM8K3y3lsTo+UsZzWN
 PBH19zzuj9azXHKkty2odtwNUN9s2yw9YcJSjvXbEfdObLQM1gtVX7t6VCFfaLO4PFH2
 6VjOdh1ScwDTbzzFZAL09lEumIdN4L1oVsk0cDiUCBaBHmHd6j+WRFNCzd4H3I1HAoXb
 iXxWUPc3hSS5NHTh7Q9q13+KlY1fUJ5Q5VpWfLMXAf3Zelgbs7Ou58h41TZQC6JV5M0q
 V6Kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5kwJgnJgT9JzS9ZNx6sAvEJ0DKDEX/pk+2nJdM2je+LdcnNZNbope4Vcf94WAq7yIZamrW6mCl7s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIWIuzD6AaqsCnLGTsazbbg0BDhp8puwAOzX5P9jDMN6vZAYAU
 xlnRC0zDmJFg3FkIjtBOXoK7739A4GPBQWBsLvTzItxtHBaxpCCL0Y5K
X-Gm-Gg: ASbGncuJo5O5jDlmBfJfeuW6g8I0XuSlqx+b2taRpnXrNLyEBsrp8UoumqCxfh/piCs
 tJfIKi5+N9b+h8xTRiVdwbLYYKYyFabC67KMft660zOf56r4OT0wCrOfAa6LS5T7NghU9HNz+Qj
 FhpkxvtMAM10DQ+KHoiE6AIuFj8Gv5UFrup+/VVOw922jXL5TTu4TTO3QmQkxUAuFlJtUv28CCS
 P2A4AuU3TAUZMQKDSv5KstytIm5iFR/A/KV+4dbrKiuw4OT1+tNYRVO+wxSD/7lHUpsWAuLfXfw
 8eozeAeajtaBuUbbZFEsheWakyOByhsha5+ZPTVtzeokAxSbDb5yleXYoqohRtB58kN8mWbKrTh
 /qCsg73NENp6hdsFY+5S5bucH0voVUmet7IerFZIHLQQ9OVFWRPVxnOL2
X-Google-Smtp-Source: AGHT+IHxIHGjEkE5SiJCVQleLSfE7Ew8CiAdy3INMXoGnJecgmb8mpelQgFGDmsS+2hlzLznSM+Hlw==
X-Received: by 2002:a17:907:803:b0:add:ede0:b9c4 with SMTP id
 a640c23a62f3a-ae6fc0c3696mr934268766b.42.1752395963198; 
 Sun, 13 Jul 2025 01:39:23 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e7e90a42sm610876266b.27.2025.07.13.01.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jul 2025 01:39:22 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sun, 13 Jul 2025 10:39:00 +0200
Subject: [PATCH v8 10/10] arm64: dts: rockchip: enable NPU on ROCK 5B
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-6-10-rocket-v8-10-64fa3115e910@tomeuvizoso.net>
References: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
In-Reply-To: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
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
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>, 
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
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

v8:
- Remove notion of top core (Robin Murphy)

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi | 57 ++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
index 6052787d2560978d2bae6cfbeea5fc1d419d583a..06f73f16901026485c02cecf9176d0d7dc7a021a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
@@ -309,6 +309,29 @@ regulator-state-mem {
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
+		regulator-enable-ramp-delay = <500>;
+		regulator-min-microvolt = <550000>;
+		regulator-max-microvolt = <950000>;
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		 };
+	};
+};
+
 &i2c6 {
 	status = "okay";
 
@@ -433,6 +456,10 @@ &pd_gpu {
 	domain-supply = <&vdd_gpu_s0>;
 };
 
+&pd_npu {
+	domain-supply = <&vdd_npu_s0>;
+};
+
 &pinctrl {
 	hdmirx {
 		hdmirx_hpd: hdmirx-5v-detection {
@@ -487,6 +514,36 @@ &pwm1 {
 	status = "okay";
 };
 
+&rknn_core_0 {
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
2.50.0

