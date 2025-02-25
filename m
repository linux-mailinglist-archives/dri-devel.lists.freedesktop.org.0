Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C60F3A43698
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 08:56:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40EFD10E59D;
	Tue, 25 Feb 2025 07:56:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9978B10E59A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 07:56:07 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43aac0390e8so10174295e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 23:56:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740470166; x=1741074966;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZjST+tDBanh80dU/tgOfgWNh4nJ1bOb18ngSnNilxXE=;
 b=lwYJj9KWXYJ7FcR1KdxpZCyD+65RWlzBZW9XQXL6/ivzD9t2M9lEGdoTJ1zleKllyv
 VAfBYZRuaTDl6myT+qCoqCthlWSPIStn5r9wBIQYbaKz+eCLfcF6AlHpF70BSUVGPVRe
 6LyJYsTfV12DBmAS90GsJxe+sgw8/L1fjDra8LHOpT6MpAccfHWNqRpBKTyrTQcG42NO
 Nh9pyDfCvMzBnAnD2+aUri1NV7TCY4aUF4JMA40eIVfuUbEqvwU7XCRftmpGEUrkvco5
 eauy78a2QlK1FCmXqGqbdvJAWavCizNIkxYYavsFKiT2meWIuaO9p4kDApR5yA2ZOExR
 M2eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8Cr+I3/+agtqzh4xJpgZyPPnlrWpOdIaZDAlE+WwwfE9Ru7n8atVnXqvIfb4de+sqHtUvOTHxttA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywh+/YcWjStw3dOGy52W1TPuO1vsBcgZoH9pSsq/muWiBTejIqU
 VqEyOqEY1Z77thZkqKEkFppPY5b3v6qYnhkV9RKo4tUz8d3KPRgl
X-Gm-Gg: ASbGncvBJD9XjJ70BrhxRDvYk1mqSXwXznonroALQvMRZhKOmphMhUtD+eCY568XwLB
 4EzmT9Aa5ve3mOwL1yaPW0dCAQ5wRHfnvW/IbXlvUFjFuxgn5GBvgLnZ+uFwFf+/NXo85ISvuT2
 776qRzrlRDPF0VaR8mYO4iDWpuQv/gjbwfzD6B51ZDH3x+FxZGjnoN2otH6LpL1CYsDYdbNXk15
 rdPDPjXOGpiT9OP2xvgM5rEpc/ogffH79g56SHzpcRJ80RjzzpYwWDojNT2MWS9pfpqHdG4RXdl
 5nADsl/w95vbmMrYRaSLeUwhBs+kXlCq310782T1rvW5rD40dopwPkCZzA==
X-Google-Smtp-Source: AGHT+IFBVupjmoCIi4Z8rhYBHew03hpkxD1lkVsBkpbYaL9RCDyWui5OGx8IsblEOSEcCQ6omhnnfg==
X-Received: by 2002:a05:600c:5493:b0:439:9e8b:228e with SMTP id
 5b1f17b1804b1-439ae21cdddmr121462285e9.20.1740470165919; 
 Mon, 24 Feb 2025 23:56:05 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-37-50.cust.vodafone.cz. [46.135.37.50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02f2475sm130299475e9.20.2025.02.24.23.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 23:56:04 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 25 Feb 2025 08:55:49 +0100
Subject: [PATCH v2 3/7] arm64: dts: rockchip: Enable the NPU on quartzpro64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-6-10-rocket-v2-3-d4dbcfafc141@tomeuvizoso.net>
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
In-Reply-To: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
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
index 088cfade6f6f14b6383ab844fa174c69fa711fc0..5f6b87dc46361eea93ea2a1fa373cb9ecdb7bbce 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
@@ -411,6 +411,36 @@ &pcie3x4 {
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
2.48.1

