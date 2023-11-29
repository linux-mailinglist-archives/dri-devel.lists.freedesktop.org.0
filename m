Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 588937FDA04
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 15:44:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A7610E601;
	Wed, 29 Nov 2023 14:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5251C10E602
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 14:44:33 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-54af2498e85so7554810a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 06:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701269072; x=1701873872; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9K/KL6rUHA7mDcBMrrqIFDkXaVSeDD2iYf5D2W8YBIg=;
 b=plE1xjGb724mgSt+pOjxjwD33k8a13d+e8wIKKxMkSVei/K77RV+Iy/KNsZcmKmORn
 VXREx1IsD25fau5+iXkhZ47Jyzja/pH7MeRi7z2+4YOC5K1mwTold3HXCiXhNyqNAVQs
 It3JsxG2MHA3ZgeClyb7HTI+RStODa1r7eN+yWjJKAYByGenjBSlpVjrTqNbktr+/05q
 bsPdPhhX3qW9GumRBIXzbJdWGjVk+9fF8tQQrJZz18qVrvhfzqN+UMy8DCBnxsZC5Q2x
 Z2Rj9hbG1nE4n+WGmIp/PhOZgjt8pRaigXv1fhqnphZFSO4U/wOuzwCw90kj+ElPJL9M
 zZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701269072; x=1701873872;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9K/KL6rUHA7mDcBMrrqIFDkXaVSeDD2iYf5D2W8YBIg=;
 b=B/xoeHG20sIhBCUSoZ+Jyw6xWbfRWWYAH+bi59QbUKuEQlPiHNOOkRjrR2aDK7EGXO
 iNydYH8aV3vP4frGksqwF5cACp3TlMCAleLd8k7f2yHMcuBIm9Qu0wa9sDH+AIUQXGcg
 neu49JPm6TQIRPawWFrvreRuW3eZhenIFhP2/DYtc4ugsX2ywh65W8OV6PWn0ZpFWJ1j
 HTv25Vo7uwyPuovQ7JSAE4aP76UbkdgUO1VI+ziDa4ActgSwOSCY9ifiC7fF90JmApVL
 y0n/ojV/JfJZVRRocrWO87zqMCL2HDg//49tJ3IRayV4fbE8zoETiH8LZziFD5jh8g+M
 GjYQ==
X-Gm-Message-State: AOJu0Yy93rQmMOXVlyCJKkV70hDUFWpz652hUr+Nvc/m9/V/E7tcprUi
 ZXm9EpK/zWPmAmbP5ugiXfQWpQ==
X-Google-Smtp-Source: AGHT+IGjVdN7cz5padHg+T+KRoFbmsMzhIWory1lFuWkxTuEmzq2syYeBQUInK/9FTSsztA+J2jYow==
X-Received: by 2002:a17:906:2219:b0:a16:8d1b:5b13 with SMTP id
 s25-20020a170906221900b00a168d1b5b13mr3159519ejs.73.1701269071739; 
 Wed, 29 Nov 2023 06:44:31 -0800 (PST)
Received: from [10.167.154.1]
 (178235187166.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.166])
 by smtp.gmail.com with ESMTPSA id
 e27-20020a1709062c1b00b009fda627abd9sm7913738ejh.79.2023.11.29.06.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 06:44:31 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 29 Nov 2023 15:44:04 +0100
Subject: [PATCH v3 07/12] arm64: dts: qcom: sc7280: Add the missing MDSS
 icc path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231125-topic-rb1_feat-v3-7-4cbb567743bb@linaro.org>
References: <20231125-topic-rb1_feat-v3-0-4cbb567743bb@linaro.org>
In-Reply-To: <20231125-topic-rb1_feat-v3-0-4cbb567743bb@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Georgi Djakov <djakov@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
 cros-qcom-dts-watchers@chromium.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701269042; l=1493;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=RpzLMWuMbYjvqQjs1yjMVMPj1VmkWicMXA9dO0pSXPQ=;
 b=idb266kdiffZu3Aqa8UlqEsL6fRd558KK+7szhEZHwR5Nruiw3g141r8j8bfrnqsrqdUyCE8W
 EO6Zzca5zhMB+0xwj+IunhA6686/xhyDdRSJIxzzge1Fic1shg6vvOS
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDSS, aside from the MDP-MEM path, also requires the CPU-DISP_CFG one.
Failing to provide it may result in register accesses failing and that's
never good.

Add the missing path.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 04bf85b0399a..41d327b1f1b6 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -15,6 +15,7 @@
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sc7280.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -3958,8 +3959,12 @@ mdss: display-subsystem@ae00000 {
 			interrupt-controller;
 			#interrupt-cells = <1>;
 
-			interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>;
-			interconnect-names = "mdp0-mem";
+			interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+					 &cnoc2 SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "mdp0-mem",
+					     "cpu-cfg";
 
 			iommus = <&apps_smmu 0x900 0x402>;
 

-- 
2.43.0

