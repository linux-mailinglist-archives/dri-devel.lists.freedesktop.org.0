Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF15ABBF69
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 15:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88ECA10E3FE;
	Mon, 19 May 2025 13:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF6510E3ED
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 13:44:03 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-442ccf0e1b3so54444085e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 06:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747662242; x=1748267042;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JMvFo5QL3bZFz0qcgL/CL0qvkVwIy7LI7zBc66tFtZI=;
 b=jtb3fUz1DZhqvV/mtrPZoB+ygDXDoUY8b2wZcx93saYh2q6/7Xdxf2B5qfS1s5oPdH
 5FVAxpFQo2YrlfPFKRx7ikP7F638S5qjE4A2S5Q00h0Qmah90wmiYrMcFXWrQISgb27p
 l7+66a8WARE3EEPemkra0EGdJUyW7+hdb9W0s3OBLH8jexk0rsRRFaCDLGhmc0oJsr95
 TvpyK5sMtzBCAvQ+CRz75K/rP4lWay5x1Q8krwZqCt50P2ZQxZ2qNFwJYld1UwxGettj
 XLuZ6irgPsODzGoJXsHqTwvVnoBGrWuBPjg0cJoJzMtg5SRxEmXfhOe4unDfEbWgJrkS
 0ccA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZnMnBXtDyBj9edKzQgNDfFFDnlulOcq2graMZ0S9Kl29sXrbJr3/JSdENVE3rTe01L1BR39Pb9yY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjeR5eVgqFm8ofDog4lsVMh0utCTPwv4kCy+pxfaXHRl0pCJ2H
 ukTP5dXMAY05YunxChNWrM6WO+7AjvAiADpceuTyNcRwJ2eH7fSiCcQc
X-Gm-Gg: ASbGncvETCYFyQf3ar4v+SflNmc8O4lril6Saz62b8nzT/LBV2IAKkfbRo82x/kHLUp
 a5/vNQKgWjw+58sgVJBKQb2xWK6OJy4rnGCcmV69eTfrQtD2C7uwquTb7xsWdWW2f3P8WtSanjj
 fcygWGyEep2xslyrxQaUrBPn4hpO9iEXzO/6SG8fZ25t1S03ae8ATHtzWZBHAqhnasQZDyoqY3b
 N1lrYFdntfZyXhChrC1WJy9SZQGMb5wumeTt9VimNOwDktB1138jbZTdQa932b6L4cSSr5wCW4f
 H0ICY5y/B3hAzAmE4CQpcynA0XNhrzWZ6d4bv67XLWmeB/1HTTbRtr5d/BWme6GNS8/sTivPb4S
 KSiFj03b4EQ==
X-Google-Smtp-Source: AGHT+IGqaMWHqsYu3YzcAO5QAiGSlI1CdiHCVwdtYh347xJkvMrzMo1SL7n38SQ7xE6N+he27vPggw==
X-Received: by 2002:a05:600c:3114:b0:439:6118:c188 with SMTP id
 5b1f17b1804b1-442fd63c6f6mr112316475e9.19.1747662241895; 
 Mon, 19 May 2025 06:44:01 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f8ab839esm171263005e9.17.2025.05.19.06.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 06:44:01 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 19 May 2025 15:43:35 +0200
Subject: [PATCH v4 03/10] arm64: dts: rockchip: Enable the NPU on quartzpro64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-6-10-rocket-v4-3-d6dff6b4c0ae@tomeuvizoso.net>
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

