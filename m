Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD13835798
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jan 2024 20:47:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D60B10E2BC;
	Sun, 21 Jan 2024 19:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FEB010E2B7;
 Sun, 21 Jan 2024 19:47:13 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a2dda9d67ceso277097466b.3; 
 Sun, 21 Jan 2024 11:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705866371; x=1706471171; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VIbwgBu5HG4I26IeAw1uHQMEc/j1tlj9MtLw6eJ7dsE=;
 b=fzleA9wyFDGZs6UBsaWmrEuHWG/itWOv7c85gOOiVihBgbFjc+EhRB/duZlLGPuPaE
 PEO63rwU17dtXjX2/HsZ/9NhH88wwAy6Xvb9l5lnPQk/x5obpToV0piaUp6s0hLJLbXL
 FoWm7h3H6CwWshtI9MCKuw1PyNOIDwIKfljabrmJVTg9NNUzHoMXF03ALEwq73MJzlCU
 mq0ZoVcRu/3DOp/pTE/yo1HkMcNG2xy80M7VCAyufmj4fFpfrpw6sn4SyEmiopOu2V8D
 YRTB73x4JShfKvBaMc06sB3LD2oc9GtwqmeRGlxGDxrmOxm9W6ClYWhQQxMqD9nkjmnz
 5UyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705866371; x=1706471171;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VIbwgBu5HG4I26IeAw1uHQMEc/j1tlj9MtLw6eJ7dsE=;
 b=TQHSU414BlRNGZWWL5xHwmE5JVQ52SV3+vI3DRlI1jWPA45GoiAW3EqOGRdT/BU4z8
 QyrwgqwjmIXbc/civ++hk3F4KKag9mYewEZd1dUy8IO4DoZlwh2XRDKWaJDdhGcPqh+D
 SLik2qqUb30mA2GbK7/TGwCKsB14bIAv2wR+SU7ywtOLk3KTheU0W8Cf1U014Km6mgFj
 O0Rp7CHc/mYdSooNzrKz+NLHB4mdozuedn4r4Sc6oRBze/FG1rzyqxmcDP1RaO8MnSih
 VylYiu4yPDdz5Dsgh9uGORRxeInmGlwVOuCM7fMweIH7jaNUBPMfv426noExFHFLG5nn
 fbPA==
X-Gm-Message-State: AOJu0YzGiMwcH4dlt+iZ9gAum3qmiyEDq4tk7oKY9rN/AeNGPsUWvc8F
 eh9+LAfFFcp4ekQsstwZGvpAVul93we9sihqbWL9I1hO3b5duQB6
X-Google-Smtp-Source: AGHT+IE5ujiGSqVQzqNM3XibibseuNu6KZEHiDALmPAeQC298EmYbl9MQ4jAzSGOH0WWJZ3a6ouivQ==
X-Received: by 2002:a17:906:b88c:b0:a2c:cdd7:bdee with SMTP id
 hb12-20020a170906b88c00b00a2ccdd7bdeemr1569221ejb.132.1705866371577; 
 Sun, 21 Jan 2024 11:46:11 -0800 (PST)
Received: from localhost.localdomain (byv51.neoplus.adsl.tpnet.pl.
 [83.30.41.51]) by smtp.gmail.com with ESMTPSA id
 k6-20020a170906128600b00a2b0b0fc80esm12547134ejb.193.2024.01.21.11.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jan 2024 11:46:11 -0800 (PST)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH 8/8] arm64: dts: qcom: msm8976: Add WCNSS node
Date: Sun, 21 Jan 2024 20:41:06 +0100
Message-Id: <20240121194221.13513-9-a39.skl@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240121194221.13513-1-a39.skl@gmail.com>
References: <20240121194221.13513-1-a39.skl@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Andy Gross <agross@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Adam Skladowski <a39.skl@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add node describing wireless connectivity subsystem.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8976.dtsi | 96 +++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
index 5a7be93a0115..73ddfaecd3ad 100644
--- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
@@ -861,6 +861,36 @@ data-pins {
 					bias-pull-up;
 				};
 			};
+
+			wcss_wlan_default: wcss-wlan-default-state  {
+				wcss_wlan2-pins {
+					pins = "gpio40";
+					function = "wcss_wlan2";
+					drive-strength = <6>;
+					bias-pull-up;
+				};
+
+				wcss_wlan1-pins {
+					pins = "gpio41";
+					function = "wcss_wlan1";
+					drive-strength = <6>;
+					bias-pull-up;
+				};
+
+				wcss_wlan0-pins {
+					pins = "gpio42";
+					function = "wcss_wlan0";
+					drive-strength = <6>;
+					bias-pull-up;
+				};
+
+				wcss_wlan-pins {
+					pins = "gpio43", "gpio44";
+					function = "wcss_wlan";
+					drive-strength = <6>;
+					bias-pull-up;
+				};
+			};
 		};
 
 		gcc: clock-controller@1800000 {
@@ -1540,6 +1570,72 @@ blsp2_i2c4: i2c@7af8000 {
 			status = "disabled";
 		};
 
+		wcnss: remoteproc@a204000 {
+			compatible = "qcom,pronto-v3-pil", "qcom,pronto";
+			reg = <0xa204000 0x2000>, <0xa202000 0x1000>, <0xa21b000 0x3000>;
+			reg-names = "ccu", "dxe", "pmu";
+
+			memory-region = <&wcnss_fw_mem>;
+
+			interrupts-extended = <&intc GIC_SPI 149 IRQ_TYPE_EDGE_RISING>,
+					      <&wcnss_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&wcnss_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&wcnss_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&wcnss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack";
+
+			power-domains = <&rpmpd MSM8976_VDDCX>,
+					<&rpmpd MSM8976_VDDMX>;
+			power-domain-names = "cx", "mx";
+
+			qcom,smem-states = <&wcnss_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&wcss_wlan_default>;
+
+			status = "disabled";
+
+			wcnss_iris: iris {
+				/* Separate chip, compatible is board-specific */
+				clocks = <&rpmcc RPM_SMD_RF_CLK2>;
+				clock-names = "xo";
+			};
+
+			smd-edge {
+				interrupts = <GIC_SPI 142 IRQ_TYPE_EDGE_RISING>;
+
+				qcom,ipc = <&apcs 8 17>;
+				qcom,smd-edge = <6>;
+				qcom,remote-pid = <4>;
+
+				label = "pronto";
+
+				wcnss_ctrl: wcnss {
+					compatible = "qcom,wcnss";
+					qcom,smd-channels = "WCNSS_CTRL";
+
+					qcom,mmio = <&wcnss>;
+
+					wcnss_bt: bluetooth {
+						compatible = "qcom,wcnss-bt";
+					};
+
+					wcnss_wifi: wifi {
+						compatible = "qcom,wcnss-wlan";
+
+						interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+							     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+						interrupt-names = "tx", "rx";
+
+						qcom,smem-states = <&apps_smsm 10>, <&apps_smsm 9>;
+						qcom,smem-state-names = "tx-enable",
+									"tx-rings-empty";
+					};
+				};
+			};
+		};
+
 		intc: interrupt-controller@b000000 {
 			compatible = "qcom,msm-qgic2";
 			reg = <0x0b000000 0x1000>, <0x0b002000 0x1000>;
-- 
2.43.0

