Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4487B85A4C0
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 14:36:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E89410E313;
	Mon, 19 Feb 2024 13:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="a/nBPMZK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F30810E3DD
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 13:36:09 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-563fe793e1cso3561448a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 05:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708349767; x=1708954567; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EDFtd1C6W8+z/D4oBojXzEo0MFOHKoG2NOfGOeLFv6c=;
 b=a/nBPMZKvMXElPehRP9W3mUofFCxu3aK+ZWMo4pQgoT1gvqtFhtWJkImjrgtxyBtMI
 9VnUiKRt3LR0VS6YqE1ux2UkVAPs7dNwpf0bnJX57IlN76Vn5pu82rEzD58GrbMx3SqX
 OVYxN4Ure7mhOPfZnG0FlI5cGvafjjh+i3ELs4fuGN3n5km30PtrhF8JL0xB2458Ba+z
 F9QqtyzprhxX+tMRKVpXyEFAvEbP55o6hBMVtGOYKoumFlWD3EoPApwoSuFFdOTfrQuz
 p419Qtc+K0LcHJuOZ12Tq/wUNGU5HPZujfzDYj1s0QFIpz8HQTwoGDsB3V5U+B1j4xql
 SMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708349767; x=1708954567;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EDFtd1C6W8+z/D4oBojXzEo0MFOHKoG2NOfGOeLFv6c=;
 b=CmkutSVNpo84bWqwPP4jKADxw6w6TwMN/3ft9i6M4SmEiS1XjzY7INFUAv+bGhjUtV
 nh3pyvZEXCO7aLY5EG0eBbGx9j77G1TnpTfw3uWU5/e2E3OthLvVb6f7ZglrxBqUb+5L
 CzLkMthDTE9xZWby3fcD8e5eDx4Aov6CMV2zfxnlmIVbE75sI0k34FnHm6YTrV4XRz/Y
 oNKEgkWWOFOfc/S+A6vsyLJmdMRzXl8M9fuOp6xuIorWYzOGQPiZcIu/Ih648MaUob+W
 igDsmy8LGpq/HZCOV5Bt0bbDNcnyc4iGNsQbuHxbV9OjzMfQKyz/l/ksfTGR4EEZwtOe
 msBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWx2vQ8ULjaJOof9ZqNDkWEgfqW5GTMfchMyHNEBXyAMLxWNFPCuLQtshrYdujNlAOv1fnOTENa0qAbMAayTUEVS6gD3I6HQMXgQ73jVboQ
X-Gm-Message-State: AOJu0Yx1SsJsC9ikbAyfSrWyCE0K9bNn6aM24i0H8Y2TFeC1tPVQzXRL
 +Pk174rYkgREccAzAvDs4D/GLNFiWN41UA0kIk/pF4+35L8oHRehFTU2wbryq+M=
X-Google-Smtp-Source: AGHT+IHcY/jmN1CahbTZpalD29/Injnjyxx742wPBMQHK911Hmm+agbpDEvGFC5DMtm4072JH0z4Dg==
X-Received: by 2002:aa7:d382:0:b0:564:69be:6e86 with SMTP id
 x2-20020aa7d382000000b0056469be6e86mr2364504edq.0.1708349767419; 
 Mon, 19 Feb 2024 05:36:07 -0800 (PST)
Received: from [10.167.154.1] (078088045141.garwolin.vectranet.pl.
 [78.88.45.141]) by smtp.gmail.com with ESMTPSA id
 q29-20020a50cc9d000000b00563a3ff30basm2900168edi.59.2024.02.19.05.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 05:36:07 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 19 Feb 2024 14:35:47 +0100
Subject: [PATCH 2/8] dt-bindings: clock: Add Qcom QCM2290 GPUCC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240219-topic-rb1_gpu-v1-2-d260fa854707@linaro.org>
References: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org>
In-Reply-To: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708349759; l=3746;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=KHcmvINhJktJpppGgwULcqvLybPcSbgdTRhruWN1EGg=;
 b=NaBvuZXGfNqiXM+yEApolRkCjYx+y/6MOaCnl4/saDR6RxS+H19AcURQQ3xL9s1DIJWPv3piV
 7kE09+GRuIVBIzkVJIDvLMhuz1i4zyjDATa4Q78cYVazSmKNUX6FuQw
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

Add device tree bindings for graphics clock controller for Qualcomm
Technology Inc's QCM2290 SoCs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../bindings/clock/qcom,qcm2290-gpucc.yaml         | 76 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,qcm2290-gpucc.h     | 32 +++++++++
 2 files changed, 108 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
new file mode 100644
index 000000000000..a16cb7e87e26
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,qcm2290-gpucc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Graphics Clock & Reset Controller on QCM2290
+
+maintainers:
+  - Konrad Dybcio <konradybcio@kernel.org>
+
+description: |
+  Qualcomm graphics clock control module provides the clocks, resets and power
+  domains on Qualcomm SoCs.
+
+  See also::
+    include/dt-bindings/clock/qcom,qcm2290-gpucc.h
+
+properties:
+  compatible:
+    - const: qcom,qcm2290-gpucc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: AHB interface clock,
+      - description: SoC CXO clock
+      - description: GPLL0 main branch source
+      - description: GPLL0 div branch source
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  '#power-domain-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@5990000 {
+            compatible = "qcom,qcm2290-gpucc";
+            reg = <0x0 0x05990000 0x0 0x9000>;
+            clocks = <&gcc GCC_GPU_CFG_AHB_CLK>,
+                     <&rpmcc RPM_SMD_XO_CLK_SRC>,
+                     <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+                     <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+            power-domains = <&rpmpd QCM2290_VDDCX>;
+            required-opps = <&rpmpd_opp_low_svs>;
+            #clock-cells = <1>;
+            #reset-cells = <1>;
+            #power-domain-cells = <1>;
+        };
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,qcm2290-gpucc.h b/include/dt-bindings/clock/qcom,qcm2290-gpucc.h
new file mode 100644
index 000000000000..7c76dd05278f
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,qcm2290-gpucc.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2024, Linaro Limited
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_QCM2290_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_QCM2290_H
+
+/* GPU_CC clocks */
+#define GPU_CC_AHB_CLK			0
+#define GPU_CC_CRC_AHB_CLK		1
+#define GPU_CC_CX_GFX3D_CLK		2
+#define GPU_CC_CX_GMU_CLK		3
+#define GPU_CC_CX_SNOC_DVM_CLK		4
+#define GPU_CC_CXO_AON_CLK		5
+#define GPU_CC_CXO_CLK			6
+#define GPU_CC_GMU_CLK_SRC		7
+#define GPU_CC_GX_GFX3D_CLK		8
+#define GPU_CC_GX_GFX3D_CLK_SRC		9
+#define GPU_CC_PLL0			10
+#define GPU_CC_SLEEP_CLK		11
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK	12
+
+/* Resets */
+#define GPU_GX_BCR			0
+
+/* GDSCs */
+#define GPU_CX_GDSC			0
+#define GPU_GX_GDSC			1
+
+#endif

-- 
2.43.2

