Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF6FB0BFE2
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 11:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B537E10E4B8;
	Mon, 21 Jul 2025 09:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC3810E4B7
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 09:18:28 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-ae0c571f137so757538166b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 02:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753089507; x=1753694307;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gyYROlBQpaQA9CwEtQJyumLb2Se+Dm1/eLYmwuEMq1o=;
 b=HzkBJlYSFFXY5I0VfQb40pgwLTnKJCQ3SbR42lTC8g6XK02FW4ZR7SyeqjK6ETlf8S
 6649DVSrU4NFKWSk8yDaUZk3xCDTGZM1zBMceOBwt1raOfYB7b/K+JNN2di/l4Y0F7bC
 tN/t9arkRPrDnpILRS13hncOmibfJzcGnPGryCiCRLghZ2ntM+XE6G1YaOa2oxWFFTeI
 xCqWjqRoTE98YZQ+9hYwhzHmGrkplRRuBLiHYDYL+y3rMdJoE+RHF5MtShxDChcq+w3E
 rd/0Q1+VhLA+8cQDNxJMAiwfKybAqBmMSWMnm4LlQAF3sG/WmrAl8nlIP8QrbRQRgPmN
 BvUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWidUgNv1BG5TalQTFNFIKSLdFRsK3hp34eI13i5tnD3Z+5iQ1q2k1gPyDpOIq9+UozTSh8eBJzrMY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtKn6OCLOCB8zn2ZPBegYhtqJVeiQribOzq8onSC0T1FehtqC6
 eFiUv68ybjYZbWp26E0Ds2FTTENwoYesYb30StHVAozJhbfzmzJ7gSgF
X-Gm-Gg: ASbGnctzvXIXTXDPaD18s98tu9KgbJH5w06h1HUFmxoutXJhrZ0XDRmMRLSPb4kcxsD
 dvbu8PnPs+GidRflozG0cDfwTKkp1hSp0B/67NsNUSiRrokzokLGxafPLf9A3YT8q9vszSvesjc
 8JIBS7IO1fFQzN+ntt9OaFnX1wGAA2/WWBI7fg9J3RzfydROMAzAIotpxSdJwfEVcRGk69ykAqc
 amBgNg60t5F2A+VQrI/4Ux7SNAc+9TWRsrVoxxKw7R+cUP2tankmvPIC/wmiCoqE5BW0Awo/F9r
 EfVDwVzaAvq9SDEUhzp2o53+vXEbeDBSnevA3n4XBFiFVWjnn4Ou6vzj4uxrUzSJxmetaZkehsq
 QvpHsy6n1Hv1g/c5Xds5mRYDhpwrLAjsdbvEy0LdC610C9K9BIqx7ITUA
X-Google-Smtp-Source: AGHT+IGLjyUKAxgg6t7I154f+BsmQXn5G2xI2hCpG0zZ9fD3Tr+3hSJlZ3Fv9sf5iHBEa2ta4Q/EoQ==
X-Received: by 2002:a17:907:1b93:b0:ae3:6d27:5246 with SMTP id
 a640c23a62f3a-ae9c9b72f65mr1263912966b.48.1753089506882; 
 Mon, 21 Jul 2025 02:18:26 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6ca2efc1sm643125266b.83.2025.07.21.02.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 02:18:26 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 21 Jul 2025 11:17:37 +0200
Subject: [PATCH v9 10/10] arm64: dts: rockchip: enable NPU on ROCK 5B
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-6-10-rocket-v9-10-77ebd484941e@tomeuvizoso.net>
References: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
In-Reply-To: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
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
index 6052787d2560978d2bae6cfbeea5fc1d419d583a..a1f3571b177fe00b1c169f62b7dd1d27024a663f 100644
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
+&rknn_mmu_0 {
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

