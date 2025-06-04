Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C90ACD8E3
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 09:57:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E839F10E689;
	Wed,  4 Jun 2025 07:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962D110E678
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 07:57:29 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-6020ff8d51dso11452861a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 00:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749023848; x=1749628648;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JMvFo5QL3bZFz0qcgL/CL0qvkVwIy7LI7zBc66tFtZI=;
 b=QxHXMJymJc7HEVu1Oh5bRZDFaAmDnIA3D1RGpNxLkwElQHxWMSYmcC7WUqaIwlsNvA
 7CQhNSa6EffrnTpFCepHg8C98CCZpHz95gz/hdCkqIifNF+GnXXL8JNS2hGdXlND5qLi
 TwEEhV91X0AYny+ZUSmatfLdd5btfynm7RpVToPGAyCp64k1asx8MhJFxoJqFsHZOKTI
 OHmLX4wU6iJl4vOCLC7xCzExdgUIVsaf9xzQNZXln7Y+Kjw4rMchP4E00wryo0J2AVsI
 GsvnfdJoGG+mZGgTu6CaBoGPLBBfsdFGvhvciixNBnuWcPskFho+GzGcS/BPm+Pa+QrM
 ebpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa9eXLpoLc3rQH5d9dLw+FvEaQIZ5PJq74lvgU8ht9aKkEjMGCUdcGGevhBGpcic/qwyHxbWk6nsk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlqkB9QH6StbcdIH1H2pB9MAKN5UKzW3tVS8wzhYvXFx9L/R1a
 zQvTjt43/rvfezZ2eRnmxW6nO9x0Usayz2vhtIYU2Y/Lyh1g3M8/Ldl/
X-Gm-Gg: ASbGncu8OxJDEZHxGWV1POULXauvN7o6S6c+resrT8NYkMaHvorZocG//Pyo4+hlY9k
 vMBsvxHqmYSwakX2/sKTOH+zig1BzqftVwtWNM1/jtt02RQANJc7nsZxJx5IOEh0HMyZazviOgD
 Tx9FqCQSQsg6QaL8/XhWzak7Ci99TywQPdtMN191pg+x4pB+yRq/xLpS/RjCi1fviY7WJCE/Q+k
 aorxcAZXTXu6NlukznxhTH7s4YRmMMAouhIecNYGTCJaMFBqJXr9fum5g/LRK+/SmpMYdug2FO8
 gURfocFMhOpFO+p0D4S7dJdBCQpJvCOcrzJRQdEBf1OWrZ0btVl467Y6r+L6ShQAdPMwqSyKNZA
 NZMiX8q2IMQ==
X-Google-Smtp-Source: AGHT+IGEU6JSHhOsqaZUgh9IRrRp0GWAjJJWZO/9WRDdIfgcT6aiVd16m1f2gcnNK7ZFqAce+m67Lw==
X-Received: by 2002:a17:907:1c26:b0:ad8:8529:4fa5 with SMTP id
 a640c23a62f3a-addf8fdd025mr150851166b.46.1749023847871; 
 Wed, 04 Jun 2025 00:57:27 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-606fb36a160sm348569a12.45.2025.06.04.00.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 00:57:27 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 04 Jun 2025 09:57:16 +0200
Subject: [PATCH v6 03/10] arm64: dts: rockchip: Enable the NPU on quartzpro64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-6-10-rocket-v6-3-237ac75ddb5e@tomeuvizoso.net>
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
In-Reply-To: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
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
 Kever Yang <kever.yang@rock-chips.com>, 
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

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts b/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
index 78aaa6635b5d20a650aba8d8c2d0d4f498ff0d33..2e45b213c25b99571dd71ce90bc7970418f60276 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
@@ -415,6 +415,36 @@ &pcie3x4 {
 	status = "okay";
 };
 
+&rknn_core_top {
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
2.49.0

