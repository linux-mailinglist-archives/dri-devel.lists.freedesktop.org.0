Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 896B952587B
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 01:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A3F10EDD1;
	Thu, 12 May 2022 23:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E04E10ED26
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 23:36:54 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id d19so11714430lfj.4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 16:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TX2EPeQO4iv5kbvdeC41BclBBjF3SbJIVPgRNnipG6Q=;
 b=HE08OQVAnUz2znm00hNElDbS1LEanC3qKT/KhfJ4Dnyuj6plz4TOoRXvqQC0+ztg7d
 VqgPqqlcPy7nZUg7yhtzgHI4zHwHpyVK8oEgk75jU/hA49F1m9frF4bNPHdAsn1jgMdM
 XXJ8p2CgFMpW71prYj9/XVW3LarKqJO60vhgC2RTtDn+1UYX9mHgK18p30Qc/NT8Cdjq
 ihav1A8UoabwD2K6QvCE0XiiEDvZq6mQ8wk8uDw2bW1RtUoO70dWiGAYSqpCpCjJsPPt
 2WPY0/AoGSzr0Pmz28/NaF4EqSrkQc0ULjXK8j4rEzUrjZNdSfsCcZN/MGj7BaOkyoP2
 LwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TX2EPeQO4iv5kbvdeC41BclBBjF3SbJIVPgRNnipG6Q=;
 b=Jaj0BJRSPtFDrZwAnIg2XaIL2b4OjfMQz8yViIAHnUN9ksh4duOnXddpOUDahRu+IU
 EwJCZ1hqROvC9pf9P7q2Rf2FMi6f3LedX7Nv2UVg+FB47BAcFemLXPQl6FAE7s9Ul6My
 MH5VUDhzaEwMWFzSiAIJmbR1fl4Pyg0ZNPVl1z2v2WOq1orHPInVAVXl3+RxHZR4ilVL
 MaXiYF34/ATCWY4mleKDchNJ+1oyHigsNXz8TM5jb4ExOJJZbjo2fWguPrmWxjyYozE6
 AkvAUDhUxJiJB3fqLvJ76HIhUz05RJvkCUtTYMI3bHy+64MzCxsAQMTgj6vhAuP3ap2S
 s7ag==
X-Gm-Message-State: AOAM532vN6RkkXl4c1W/Y9HBHNeQS7GCunkUpI+8KMc5evbI6XbZl+ky
 /6Wx2FYDbf3W2x9oRlW1+WJmnuz00h/o0A==
X-Google-Smtp-Source: ABdhPJy+8lSM7XQyQmcSe1HtYqihl1nvJXf2e/GgGHxotQZ2pTQPbTT5zA2DFcRKH6tbcadE0L/Isg==
X-Received: by 2002:ac2:46c3:0:b0:471:f5fc:ac4b with SMTP id
 p3-20020ac246c3000000b00471f5fcac4bmr1400214lfo.381.1652398612615; 
 Thu, 12 May 2022 16:36:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 p13-20020a19f00d000000b0047255d211c1sm127937lfc.240.2022.05.12.16.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 16:36:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 6/8] arm64: dts: qcom: sdm630: use defined symbols for
 interconnects
Date: Fri, 13 May 2022 02:36:45 +0300
Message-Id: <20220512233647.2672813-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512233647.2672813-1-dmitry.baryshkov@linaro.org>
References: <20220512233647.2672813-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace numeric values with the symbolic names defined in the bindings
header.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 17a1877587cf..01a1a1703568 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/qcom,gpucc-sdm660.h>
 #include <dt-bindings/clock/qcom,mmcc-sdm660.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
+#include <dt-bindings/interconnect/qcom,sdm660.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -1045,7 +1046,7 @@ adreno_gpu: gpu@5000000 {
 			nvmem-cells = <&gpu_speed_bin>;
 			nvmem-cell-names = "speed_bin";
 
-			interconnects = <&gnoc 1 &bimc 5>;
+			interconnects = <&gnoc MASTER_APSS_PROC &bimc SLAVE_EBI>;
 			interconnect-names = "gfx-mem";
 
 			operating-points-v2 = <&gpu_sdm630_opp_table>;
@@ -1299,8 +1300,8 @@ sdhc_2: sdhci@c084000 {
 					<&xo_board>;
 			clock-names = "core", "iface", "xo";
 
-			interconnects = <&a2noc 3 &a2noc 10>,
-					<&gnoc 0 &cnoc 28>;
+			interconnects = <&a2noc MASTER_SDCC_2 &a2noc SLAVE_A2NOC_SNOC>,
+					<&gnoc MASTER_APSS_PROC &cnoc SLAVE_SDCC_2>;
 			operating-points-v2 = <&sdhc2_opp_table>;
 
 			pinctrl-names = "default", "sleep";
@@ -1351,8 +1352,8 @@ sdhc_1: sdhci@c0c4000 {
 				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
 			clock-names = "core", "iface", "xo", "ice";
 
-			interconnects = <&a2noc 2 &a2noc 10>,
-					<&gnoc 0 &cnoc 27>;
+			interconnects = <&a2noc MASTER_SDCC_1 &a2noc SLAVE_A2NOC_SNOC>,
+					<&gnoc MASTER_APSS_PROC &cnoc SLAVE_SDCC_1>;
 			interconnect-names = "sdhc1-ddr", "cpu-sdhc1";
 			operating-points-v2 = <&sdhc1_opp_table>;
 			pinctrl-names = "default", "sleep";
@@ -1525,9 +1526,9 @@ mdp: mdp@c901000 {
 					      "core",
 					      "vsync";
 
-				interconnects = <&mnoc 2 &bimc 5>,
-						<&mnoc 3 &bimc 5>,
-						<&gnoc 0 &mnoc 17>;
+				interconnects = <&mnoc MASTER_MDP_P0 &bimc SLAVE_EBI>,
+						<&mnoc MASTER_MDP_P1 &bimc SLAVE_EBI>,
+						<&gnoc MASTER_APSS_PROC &mnoc SLAVE_DISPLAY_CFG>;
 				interconnect-names = "mdp0-mem",
 						     "mdp1-mem",
 						     "rotator-mem";
@@ -2034,7 +2035,7 @@ camss: camss@ca00000 {
 				"cphy_csid1",
 				"cphy_csid2",
 				"cphy_csid3";
-			interconnects = <&mnoc 5 &bimc 5>;
+			interconnects = <&mnoc MASTER_VFE &bimc SLAVE_EBI>;
 			interconnect-names = "vfe-mem";
 			iommus = <&mmss_smmu 0xc00>,
 				 <&mmss_smmu 0xc01>,
@@ -2097,8 +2098,8 @@ venus: video-codec@cc00000 {
 				 <&mmcc VIDEO_AXI_CLK>,
 				 <&mmcc THROTTLE_VIDEO_AXI_CLK>;
 			clock-names = "core", "iface", "bus", "bus_throttle";
-			interconnects = <&gnoc 0 &mnoc 13>,
-					<&mnoc 4 &bimc 5>;
+			interconnects = <&gnoc MASTER_APSS_PROC &mnoc SLAVE_VENUS_CFG>,
+					<&mnoc MASTER_VENUS &bimc SLAVE_EBI>;
 			interconnect-names = "cpu-cfg", "video-mem";
 			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
 			iommus = <&mmss_smmu 0x400>,
-- 
2.35.1

