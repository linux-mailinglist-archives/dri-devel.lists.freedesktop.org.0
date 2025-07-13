Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB4CB03008
	for <lists+dri-devel@lfdr.de>; Sun, 13 Jul 2025 10:39:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB2110E15B;
	Sun, 13 Jul 2025 08:39:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C9A10E33D
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 08:39:22 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-60c9d8a16e5so6532520a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 01:39:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752395961; x=1753000761;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4ARZBUzEfFCMAq5v8g7vjIVwF7+PfjU6DnKWe8vqNJQ=;
 b=TtzP1TvsDvWx5VaTU+RI4zcdbPWdu8aSYLua0RCjZ5TzN4dljS3z7wQmXplMgBrMgm
 yu+YY1c2QNL7HINHpYGguMZicv9qM7XD2rv1qb/FwKH02/C7bv43rwFFWcyt77tphmnh
 0/X+Z2nVWn+48fTOW8nA3/swu7dmgcSZqeDguJkmr24H7XDuJmNyQ2OBPdFpcpfibEdj
 hLKFSoWpgwu6LEGOHau6kzxXiUQBe/r/fOYGrw460w8+gkgT7wvgcDtxZUkN6+2oY0aH
 vSEGrt/bwx2K74uXn8YO3BGg0Us05POi3o9LB3RcF6eXn+rWJGOP0uNSm1FjN71Sdk0F
 pJUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6aoP1Hh0HA6tMX11E2O2+r7RsMyyK889w+AA0rk/ZALjSjmNv9YtQk9Xa91pKFk3hELm2ySGm4fQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYmd4VBDrRbOIJ8F6o2+Vq5daMgeQfWCW9MZyovmcKkIQ8wkX4
 AuK/rgvWLtRL/yFW95kXTXxzCXXeVnkdt6vutUZzW4EhnjwdDoOIN6wg
X-Gm-Gg: ASbGncutsBrekMr2O5je9BD+5j/cmzgDm8PhY+sbJ5Pzp1rnh3UccEJHYVuvvE+tx1I
 kPhhr/fKkgPxoR3YAcnHaN76hXMLYVIpmb1o7nnJdo8iDIJweFgcC+K7ABUs1XsqlLJM6NTm3M3
 gLo5ki+ENEhwaBIO3Mg8PvWYG2yKVWNY5y8ArLaQvSofnThrCZtcZAz+ed1SX6DWNw0Wyxa/YLp
 5dtA2L9ykjJ2UaIy6kh0Os0N2DOoR2TfMaSs6sEMATUYOriej3qFVgSqT7NmFvfopwVasc7fwN+
 t0GFbDaTEzZ+011c/oa8/71bFy8l3QQUdAwFxzn/5Bh5oR7AFYNS2HoN/tKRhnrRgD/q83Mfx2V
 Z5TJgerD9LtvPPdCzGaO3LwMUnMuapxrcqurF5dsrfHWpASAKLPoDOu7t
X-Google-Smtp-Source: AGHT+IExBlEevT28yq3f8GIk8BvM6vD/0UZe4pkBaz+41fUQECzjnBCvYRpaZSboFe48piBAxJ1srQ==
X-Received: by 2002:a17:906:c110:b0:ae0:cbc1:3468 with SMTP id
 a640c23a62f3a-ae6fbc886eamr1032521766b.15.1752395961350; 
 Sun, 13 Jul 2025 01:39:21 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e7e90a42sm610876266b.27.2025.07.13.01.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jul 2025 01:39:20 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sun, 13 Jul 2025 10:38:59 +0200
Subject: [PATCH v8 09/10] arm64: dts: rockchip: Enable the NPU on quartzpro64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-6-10-rocket-v8-9-64fa3115e910@tomeuvizoso.net>
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

Enable the nodes added in a previous commit to the rk3588s device tree.

v2:
- Split nodes (Sebastian Reichel)
- Sort nodes (Sebastian Reichel)
- Add board regulators (Sebastian Reichel)

v8:
- Remove notion of top core (Robin Murphy)

Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts b/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
index 78aaa6635b5d20a650aba8d8c2d0d4f498ff0d33..f8a0c95be58dc6c60ec0d48a327a9151a66fec5d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
@@ -415,6 +415,36 @@ &pcie3x4 {
 	status = "okay";
 };
 
+&rknn_core_0 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_mem_s0>;
+	status = "okay";
+};
+
+&rknn_core_1 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_mem_s0>;
+	status = "okay";
+};
+
+&rknn_core_2 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_mem_s0>;
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
 	vref-supply = <&vcc_1v8_s0>;
 	status = "okay";

-- 
2.50.0

