Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F40ABA118
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 18:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC6D10EB2D;
	Fri, 16 May 2025 16:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F8B10EB2D
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 16:53:34 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3a0af41faa5so1306168f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 09:53:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747414413; x=1748019213;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JMvFo5QL3bZFz0qcgL/CL0qvkVwIy7LI7zBc66tFtZI=;
 b=joWYz4/zMtyZ+0NSk4ZvPlc8sojUKOO/zGFuJMr4G8dvKRKv5ElOq7wQpcw1G+7i1p
 OSAO3B4qFMC89vC2fmS0yEyAwCO4C4SWYqxSBKEmMJx9D9bWgDuoAUfBuybxujkYZe7B
 fk6JH0dnsTjvlpvq61I7o6oiVulcNRuXEtTG7kN9RLKFOT/S5pS8WyrzcGha5GKFXYDK
 DBLbGzbc+NWB8habr98cHthK4SVczhLxzSqbmZMX37fqiSJB/ZuY80l5c4Z1fHo7Socy
 /cL15+GRjqzSfhuRgLTDFk/EOlP63pF/MPo9s+ptKxrugJVlxtC7ZvNV9HxIFjx98b3E
 3XnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzvLCf8rDUUUj0QN4ve8iDka1/hacbyvWuL7pHV4k21BRKJX7oQmrqQ4AcXpvU2jllJEfycrtku4c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwM5u5PcG1itzVASn9Yzr8SkgEt0oEL+PwOS0tG8s0vNK+hsImP
 nP4xS+KhCC+9EgCmzKi8ISYJyb05wmXWjCX0tlJBm3Lfdb2B6lucf7oS
X-Gm-Gg: ASbGncshvQmCp2FfGQFES9ypUZYrK1eoZhlg6RXGApbqFhssZwtfX+vHGCWqMyHDSDG
 gNw4IN+u/+aFzXU9HQu0455s16JwCRl8CLE0J4wmjMiXsMm0LkXTAueky/iwwHnjQfiB9V1G8uc
 ylNHB0Xx/urhGXlYgiFcaPG1x9Vv3FXuV+PwKHkDwCkkLOhoJGXGzoB5iNPf7DCrV7x3IP5AbsK
 loOYlk1WPVZFVn6Nsihci5vNCO3idjA3z2pNyCkPS9KUkYh/IgurejjdmRsCxCPxWveqjGvuzO/
 ZQe4OLc2vaSqS6Ujy3iSTfCYpgy4kvHHN9FSABpiwQ8DJfXhu2x4299FlLpVN73mZJAiSCr7XLn
 SkVCSG+SteA==
X-Google-Smtp-Source: AGHT+IE3kKJia1yJ69hIetn7LETCPISzu5AThEm8caL/gjKNo+SI7DcwJ/kykHCbu+Yw1iluEYSstA==
X-Received: by 2002:a05:6000:2af:b0:3a1:f5cf:9553 with SMTP id
 ffacd0b85a97d-3a35fe6628amr3027912f8f.6.1747414412687; 
 Fri, 16 May 2025 09:53:32 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f3380498sm116511755e9.11.2025.05.16.09.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 09:53:32 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 16 May 2025 18:53:17 +0200
Subject: [PATCH v3 03/10] arm64: dts: rockchip: Enable the NPU on quartzpro64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-6-10-rocket-v3-3-7051ac9225db@tomeuvizoso.net>
References: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
In-Reply-To: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
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

