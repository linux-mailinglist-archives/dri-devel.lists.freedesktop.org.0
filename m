Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22255ABD4A2
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 12:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991BE10E4C9;
	Tue, 20 May 2025 10:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA6F10E4A1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 10:27:31 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so43399785e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 03:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747736850; x=1748341650;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JMvFo5QL3bZFz0qcgL/CL0qvkVwIy7LI7zBc66tFtZI=;
 b=EfT9zaGAQiOknOWl7ehZPULieXLjt0GaKARze5vYZYPMF8SFwLOoYOfpnmffDY1qUt
 w0g3sLYNAHOiqJripxcel4mjLicvvA/dY/LvTYoPIUFMrs9xeK50BrehFGKbkETGUz7I
 jBpC0jd4D5gu9URBMFTDxsLguq69ybzlkYDRtu9+3GbOwQa/SXbAnJcJL8aKQ75ELubg
 pYFA469RQpbBoinRsuq11wLXVmdgk64CV88AWAeF15Rz1BIy5nmXuB95kHKwob2hOI2F
 ej9JmjjKckRFlDgycUHHjFJjLlNKFyF6do8SGTgLMDoPU2prPRDwYi+vrMJZnVLJmPhv
 1Q3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXy/ZLc9FOomhpvwr7mMFhfGpTFW8embkCnU+3iOTKgmoWpTO0UCpjloYAEVhxT5nPqSMgnTuSXQN0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsL+FeQOzTb1JwagJBa/pKyG8eiI5Ya7cRm/2BiXHKmxChQyHm
 p1u9xIzkxXvooYC7s9a79aETCz6pdlNMsK1groovvbjCvEb/gklsO7jX
X-Gm-Gg: ASbGncsrKai1qXGZ43sVBaea66Oj6JUkqrnYurbxgHOUGBGxv+4V4EH2xgthBN4ONYQ
 /Qzst3UUIOaX0rKGe0g3fzCsAPihytYSVdVzXaIoI1Bp2aYDEYia97whNflxDKVznh5ssNJEdkL
 oMM5dNi8cSNddK64ApTYwSegXPqZqNjNRR7CRgm34J7ePE+ujYn29B/PHcG1NOsNrxZJndddPcX
 SDAMkBSZw5r4ciIiXmIP8JY4Zw+rnO4Dd8/SbNyfxLAolfvWccudcxRZhB9qfHKj4uhJQpGeONq
 n8d/XL+sTrYowpPiOelIO6LNTVi0jz42yHkGW3uvT8c7lnuj+IAh9IQpHI6SY6oJtka2JqTtmt6
 y9insidjhqA==
X-Google-Smtp-Source: AGHT+IFaTNDTTs/HbVoDD7uNt9+VoHIWuf+2KdFCdYZjQ41F12fKv5MmzphIdTQmi2qfd3qs7Ll6jA==
X-Received: by 2002:a05:600c:4e42:b0:43c:e70d:4504 with SMTP id
 5b1f17b1804b1-442fd64dfccmr154018695e9.19.1747736849844; 
 Tue, 20 May 2025 03:27:29 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f73d3defsm24680025e9.18.2025.05.20.03.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 03:27:29 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 20 May 2025 12:26:56 +0200
Subject: [PATCH v5 03/10] arm64: dts: rockchip: Enable the NPU on quartzpro64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-6-10-rocket-v5-3-18c9ca0fcb3c@tomeuvizoso.net>
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
In-Reply-To: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
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

