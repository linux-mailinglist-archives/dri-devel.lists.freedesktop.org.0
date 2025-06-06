Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0691DACFCA0
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 08:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4636210E3D0;
	Fri,  6 Jun 2025 06:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D9110E84B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 06:29:15 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-60766191202so1187926a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 23:29:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749191354; x=1749796154;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=anhtEfC+aYWJeJvUly60jdWH8rm+sVcW8pcF9vb2eMk=;
 b=et5rtzsg//iABRDrYSeofaskxQdIQfwPWXCeaQPreh2UG4m/hkm/7rjhL9CPNk7Lug
 V8lDpZQqa+NRi1Cw7Vc3fVqZhY0vq/vTj86OjBvmoGkHIWtOU76ImRDrlOk3VK/pov2+
 PUiRFw4VlyWkKBE0nvcYLk+sCdKb4O/gCD/6BoZ3ePKje94e+8j2/ha37LLNkGwmrqAX
 8mfrDJh1KCtWru/ekGDkQvuboVI9CveeLEArAuYXtcpq+JVVgsiXPrq5B2YPMr71tC4I
 ZtLVQ0fEX/lq2GP5KvKmGf6/GeYf6B54GSSzautmCzGMCQuvRmNbb8woMlEF0dQy0XdF
 vh3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNIyGEzUMzY8ZBgxmmvNN7zY5s3b0/wu82DZ30rFaOgZ7l8e16Ma3d2HedlHleBfsXgmAn0XCFVoA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvDDTuJROvxKFcFQQszrSSrpM+8+ZR+7X4bwJ9jJWvcu+No8VN
 XbYvb49KPkoddfcIMZhPoJ++tT8wEDQfC6Lajb/JGjLhyiGnefG7dTgo
X-Gm-Gg: ASbGncvJIJ+A14VT/VGf0iZdtoF5N5LL1SVbQk7gK0bCYjkEIFU7IHAMvpBvyPeOtka
 93Qv5TaGKcr5CQn1RQwZiiXLB+PtdjNV07EykOKZCMRg7tq8lSNRueRu5VjHmP4qS2V+8hmMtSD
 9GXXHbTBUlT7lnmS5bdSo0dA6k0cDCsmNQjVqJ1Q17eZz2Ozo7NgJOFDpsqAdRw2h/z2PaSuvA/
 zU5dk0tFAg+B5y0PjjGOcEaAseDbCiyF8jOY6Sht4kne7S2lUDPYMQGVNM3KjGSID8zUkk8Tyn6
 g3uPfplMWhweMKBpRstaIY/WAIiVsXFwhgcbIlBiWsLp5X0WUbM0K2OkoAA2FQeFt4QalQpjdUG
 QcvbKEPkJbGPf+Cs7FEBb
X-Google-Smtp-Source: AGHT+IEQhHpZGVCxH1ZaUqlfgXtzTnbNuSiyE94GQATLfAusLPGKyuMEVAdsVmPX89pYi5j539z3bQ==
X-Received: by 2002:a17:907:94c8:b0:ad5:55db:e413 with SMTP id
 a640c23a62f3a-ade1a9248d4mr174784266b.26.1749191353364; 
 Thu, 05 Jun 2025 23:29:13 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1d754653sm67989966b.20.2025.06.05.23.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 23:29:12 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 06 Jun 2025 08:28:30 +0200
Subject: [PATCH v7 10/10] arm64: dts: rockchip: enable NPU on ROCK 5B
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-6-10-rocket-v7-10-dc16cfe6fe4e@tomeuvizoso.net>
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
In-Reply-To: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
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

