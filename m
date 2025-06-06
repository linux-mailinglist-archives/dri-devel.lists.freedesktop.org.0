Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE5CACFC9F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 08:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29AD210E85C;
	Fri,  6 Jun 2025 06:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CFF510E882
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 06:29:13 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-606b6dbe316so3209879a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 23:29:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749191352; x=1749796152;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JMvFo5QL3bZFz0qcgL/CL0qvkVwIy7LI7zBc66tFtZI=;
 b=aYuId7XWEWakPz6XxpJoKpxPRDBes/ZKdzpXnd9Ww2XKUFwpjawzSO69YPH3CktfvK
 G/w+zYTVoOtER3R7LvT7sL/QzZ9MXPCLNZs/ABuQCzIum1A9OaLve3dXfp2nYJkA8u+Z
 oze3b5bF9XZy+gUUuujkwFdyKxSz3iiodobaqb0L/h87KHLuKOS9bGWeMRgoybydmIcG
 yOMtb1fACUgcRiwnhXYNVyfDAuZdufbJsYLiAvI2Y7529G+92+mo/scvQf/tE06+OVBD
 hksH5zCCdmMUwC+wWIDYiAwGZGEv2F5W+D/AQ/uS1gbQ/dBQ1PQT3E4x5MOclsQmLtq2
 o8Bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFlNOqyflS3F/qLyYzUYGzQuoxGCrMKHVgHfVHr/pxV1owJ8xb90f+LYJbYkO+eM6FARh7Xmthf/4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwADHzSUv3g2SR08CeUx+Pf2uWq9uaC67FqbetLUPYgeP9M7Vdj
 J//cY4DjYKVnBD+qa+le8nlWL6MOlHkkoj3cHB+yXyMn0Vp5KHpi2fCd
X-Gm-Gg: ASbGncunQNzqOqD3QrwtB8EXF7emVSJ9v/CctUwa4mP7mOhldXgUisfdDJedHVubRps
 d9g0l2viy1C6yhWv69QM7QXm+fC2c2EyknOKUSaS2yq2hjfy7yJbqdFhax7NvdyCx4adatXIMAZ
 B6P4Fla4dtFJKl1N2mbUJSNOpDnfCsXR1QX8vDGkhn0+hZ2V1fgxzpjOCBJim3LEjJohYlGwjg5
 2wYlUXzNzGZSvkNqFmQnR1dThauQ4uHViW3hdJwPowAbdX8ZEjngigaI9SLkS/dVxXKNgA09anD
 I+VbBjyTz+lTfljC0O+pMwF/Jknu0yPie5EeobT4DkUYTY1gU+2ZtZ8MF0VaYQWyYTKe7tZsH+t
 W89t5AE9WpA==
X-Google-Smtp-Source: AGHT+IH386t4fpjPSjXu6Q/P93pz2H4oKr1u5C7rbyqEt7KH415Hf2G+JglZ1eWXhfGWu7b+7DDqgw==
X-Received: by 2002:a17:907:97c2:b0:ad8:8efe:3206 with SMTP id
 a640c23a62f3a-ade1a9e825dmr164077166b.42.1749191351781; 
 Thu, 05 Jun 2025 23:29:11 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1d754653sm67989966b.20.2025.06.05.23.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 23:29:11 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 06 Jun 2025 08:28:29 +0200
Subject: [PATCH v7 09/10] arm64: dts: rockchip: Enable the NPU on quartzpro64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-6-10-rocket-v7-9-dc16cfe6fe4e@tomeuvizoso.net>
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

