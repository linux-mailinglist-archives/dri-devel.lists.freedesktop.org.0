Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOV8BFz5omkZ8gQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 15:19:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 868D81C3821
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 15:19:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F3110E127;
	Sat, 28 Feb 2026 14:19:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GCflw0UF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5E210E127
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 14:19:04 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2a871daa98fso24056485ad.1
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 06:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772288344; x=1772893144; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=80XRk/bwjPPdNiwFQbXl7n9xoB7/2Y8y5DKEs5r1FxA=;
 b=GCflw0UFl3SPhgHqCKIUklI61OzXRhWZAd3P7jLzhOOGd5ilV27PIvO+1CDrINivBO
 tyGin42VvpzBDTcAQZhbf7uaiUaYrnJnhswY2TscoQ4FZ4Zz7EfTFRL3ndF2DJeKwIRx
 CmqSDLjRv54eK29Y8da4jHmcvCe/NkHvI9D0cryyJeggXQ+o6uZHm3GuL6WaUA2f6feM
 OYw2ag+ci5G0pSX/rpcvpMa8YDnA5LM/urzrfOkDOrYzeI/oh5WK2y/BARWigMcC8Nvp
 jdwY9qj/PZ70FQQaYRJCSGW0Hfb9rk9NlwSCzMqHwqevLfRlMu7bIUXwaOlcdIx8S3ZR
 4b/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772288344; x=1772893144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=80XRk/bwjPPdNiwFQbXl7n9xoB7/2Y8y5DKEs5r1FxA=;
 b=nJbph4mpbAziHwExsypNZsIkYnmg9KbkPSAI215rlFEhPIThlDdZRk8+/rod5d/7j8
 7WHVQ9eEeqmLtZ9Wyd2eRgpk+EsSLi11xTkdUOz+Ddhv5qLeRRWMGAlE5o4YzMcX2fxP
 wcsfENL+6PJUUl7VhBOX4onJqULn0sK7GRWGZfKg/xSRZjE8HVHzUUMElr5A9xoIJfaG
 2gGgTOVYeElmvdSOfdrQ2JBQl+0I4USCTB6xZMZts27bPFQT3w5Yyeo6xAHZOORj94F+
 OuBDMNGfKQKXn6fbhGqJZivR4hohAJoU1xXXyhnevp2LJ2BcAIVYmf2ZPv++1tTM6YTh
 sgFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLUGDtTodcr4xbBjrCDniCjG5C6wAPJwAFrpDC6PvkEFWjLD6pqZ5kRMg3ABp5RadJVcAQRhoRVy8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWgw9u5PzwROM6XLCf2wy6ifI51dUskp3jSPrW+haRRjkAtZ8c
 jCKKlBCGoi0H/X37BETmzZqSv6CQ9zafyAx/YSTE4xrnkISHfyXVAnJF
X-Gm-Gg: ATEYQzyyY6rMAArCvCy1dNZmBXe9lIuMlkIvczpMw0Nu/T7SkgaovC4orTVrKZ+R9lj
 ZSKz5YTuswhqEOXLvBnMmgcIgnZW4CzUNtKHLfdgmR7jCzE3qTRS/KZZj6Vt9ZLBSiwzkPc3HJZ
 rxM7+1KSD3m3zLJkGcK5vpxqDXlVz+FkR8gZXlAiV4P90m4OUAL5N/2b3ENaM27TOV7/ICJGJrK
 4nbwmlBFWc7wWfgx6cdeob1Ol/fVc5cFUxw14Htm2ISe/6/5dok1C8SwDY/ZTP+PaBRZS46LGMk
 l5qbkmU6uGTWU4ZCdQqegY/fEwBtp2duEEhpZGG17gUqWD/0h19AwrucUiKLmcYF5MT3nYvsFZp
 U6qeq+XdnNmH/si5dPB6ctbIQzxn+y2mbgmaCB5GSoazcrRgTndqt+EBRvd2Jg5LQvnjUAFgMZu
 2F7YKHyPkYR/7kjDVxacf1
X-Received: by 2002:a17:902:f64c:b0:2aa:d6a1:e18b with SMTP id
 d9443c01a7336-2ae2e3f14e1mr76946475ad.18.1772288344231; 
 Sat, 28 Feb 2026 06:19:04 -0800 (PST)
Received: from nuvole ([2408:844d:b08:3702:16a4:72fd:8170:4ed3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae3d1b2c5esm18697235ad.6.2026.02.28.06.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Feb 2026 06:19:03 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianyu Gao <gty0622@gmail.com>,
 White Lewis <liu224806@gmail.com>, Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v3 4/4] arm64: dts: qcom: sc8280xp: Add dsi nodes on SC8280XP
Date: Sat, 28 Feb 2026 22:17:15 +0800
Message-ID: <20260228141715.35307-5-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260228141715.35307-1-mitltlatltl@gmail.com>
References: <20260228141715.35307-1-mitltlatltl@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_mkrishn@quicinc.com,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gty0622@gmail.com,m:liu224806@gmail.com,m:mitltlatltl@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 868D81C3821
X-Rspamd-Action: no action

The DT configuration follows other Samsung 5nm-based Qualcomm SOCs,
utilizing the same register layouts and clock structures.

However, DSI won't work properly for now until we submit dispcc fixes.
And some DSC enabled panels require DPU timing calculation fixes too.
(hdisplay / width timing round errors cause the fifo error)

Co-developed-by: Tianyu Gao <gty0622@gmail.com>
Signed-off-by: Tianyu Gao <gty0622@gmail.com>
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
Tested-by: White Lewis <liu224806@gmail.com> # HUAWEI Gaokun3
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 404 ++++++++++++++++++++++++-
 1 file changed, 396 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 706eb1309..1599d698b 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/clock/qcom,dispcc-sc8280xp.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
 #include <dt-bindings/clock/qcom,gpucc-sc8280xp.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
@@ -4652,13 +4653,31 @@ ports {
 
 					port@0 {
 						reg = <0>;
+
 						mdss0_intf0_out: endpoint {
 							remote-endpoint = <&mdss0_dp0_in>;
 						};
 					};
 
+					port@1 {
+						reg = <1>;
+
+						mdss0_intf1_out: endpoint {
+							remote-endpoint = <&mdss0_dsi0_in>;
+						};
+					};
+
+					port@2 {
+						reg = <2>;
+
+						mdss0_intf2_out: endpoint {
+							remote-endpoint = <&mdss0_dsi1_in>;
+						};
+					};
+
 					port@4 {
 						reg = <4>;
+
 						mdss0_intf4_out: endpoint {
 							remote-endpoint = <&mdss0_dp1_in>;
 						};
@@ -4666,6 +4685,7 @@ mdss0_intf4_out: endpoint {
 
 					port@5 {
 						reg = <5>;
+
 						mdss0_intf5_out: endpoint {
 							remote-endpoint = <&mdss0_dp3_in>;
 						};
@@ -4673,6 +4693,7 @@ mdss0_intf5_out: endpoint {
 
 					port@6 {
 						reg = <6>;
+
 						mdss0_intf6_out: endpoint {
 							remote-endpoint = <&mdss0_dp2_in>;
 						};
@@ -4791,6 +4812,189 @@ opp-810000000 {
 				};
 			};
 
+			mdss0_dsi0: dsi@ae94000 {
+				compatible = "qcom,sc8280xp-dsi-ctrl",
+					     "qcom,sa8775p-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
+				reg = <0 0x0ae94000 0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss0>;
+				interrupts = <4>;
+
+				clocks = <&dispcc0 DISP_CC_MDSS_BYTE0_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_BYTE0_INTF_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_PCLK0_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_ESC0_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+
+				assigned-clocks = <&dispcc0 DISP_CC_MDSS_BYTE0_CLK_SRC>,
+						  <&dispcc0 DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss0_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss0_dsi0_phy DSI_PIXEL_PLL_CLK>;
+
+				operating-points-v2 = <&dsi_opp_table>;
+				power-domains = <&rpmhpd SC8280XP_MMCX>;
+
+				refgen-supply = <&refgen>;
+
+				phys = <&mdss0_dsi0_phy>;
+				phy-names = "dsi";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss0_dsi0_in: endpoint {
+							remote-endpoint = <&mdss0_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss0_dsi0_out: endpoint {
+						};
+					};
+				};
+
+				dsi_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-187500000 {
+						opp-hz = /bits/ 64 <187500000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-300000000 {
+						opp-hz = /bits/ 64 <300000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-358000000 {
+						opp-hz = /bits/ 64 <358000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+				};
+			};
+
+			mdss0_dsi0_phy: phy@ae94400 {
+				compatible = "qcom,sc8280xp-dsi-phy-5nm"
+					     "qcom,sa8775p-dsi-phy-5nm";
+				reg = <0 0x0ae94400 0 0x200>,
+				      <0 0x0ae94600 0 0x280>,
+				      <0 0x0ae94900 0 0x280>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&dispcc0 DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+
+			mdss0_dsi1: dsi@ae96000 {
+				compatible = "qcom,sc8280xp-dsi-ctrl",
+					     "qcom,sa8775p-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
+				reg = <0 0x0ae96000 0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss0>;
+				interrupts = <5>;
+
+				clocks = <&dispcc0 DISP_CC_MDSS_BYTE1_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_BYTE1_INTF_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_PCLK1_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_ESC1_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+
+				assigned-clocks = <&dispcc0 DISP_CC_MDSS_BYTE1_CLK_SRC>,
+						  <&dispcc0 DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&mdss0_dsi1_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss0_dsi1_phy DSI_PIXEL_PLL_CLK>;
+
+				operating-points-v2 = <&dsi_opp_table>;
+				power-domains = <&rpmhpd SC8280XP_MMCX>;
+
+				refgen-supply = <&refgen>;
+
+				phys = <&mdss0_dsi1_phy>;
+				phy-names = "dsi";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss0_dsi1_in: endpoint {
+							remote-endpoint = <&mdss0_intf2_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss0_dsi1_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss0_dsi1_phy: phy@ae96400 {
+				compatible = "qcom,sc8280xp-dsi-phy-5nm"
+					     "qcom,sa8775p-dsi-phy-5nm";
+				reg = <0 0x0ae96400 0 0x200>,
+				      <0 0x0ae96600 0 0x280>,
+				      <0 0x0ae96900 0 0x280>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&dispcc0 DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+
 			mdss0_dp1: displayport-controller@ae98000 {
 				compatible = "qcom,sc8280xp-dp";
 				reg = <0 0xae98000 0 0x200>,
@@ -5080,10 +5284,10 @@ dispcc0: clock-controller@af00000 {
 				 <&mdss0_dp2_phy 1>,
 				 <&mdss0_dp3_phy 0>,
 				 <&mdss0_dp3_phy 1>,
-				 <0>,
-				 <0>,
-				 <0>,
-				 <0>;
+				 <&mdss0_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss0_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss0_dsi1_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss0_dsi1_phy DSI_PIXEL_PLL_CLK>;
 			power-domains = <&rpmhpd SC8280XP_MMCX>;
 
 			#clock-cells = <1>;
@@ -6011,13 +6215,31 @@ ports {
 
 					port@0 {
 						reg = <0>;
+
 						mdss1_intf0_out: endpoint {
 							remote-endpoint = <&mdss1_dp0_in>;
 						};
 					};
 
+					port@1 {
+						reg = <1>;
+
+						mdss1_intf1_out: endpoint {
+							remote-endpoint = <&mdss1_dsi0_in>;
+						};
+					};
+
+					port@2 {
+						reg = <2>;
+
+						mdss1_intf2_out: endpoint {
+							remote-endpoint = <&mdss1_dsi1_in>;
+						};
+					};
+
 					port@4 {
 						reg = <4>;
+
 						mdss1_intf4_out: endpoint {
 							remote-endpoint = <&mdss1_dp1_in>;
 						};
@@ -6025,6 +6247,7 @@ mdss1_intf4_out: endpoint {
 
 					port@5 {
 						reg = <5>;
+
 						mdss1_intf5_out: endpoint {
 							remote-endpoint = <&mdss1_dp3_in>;
 						};
@@ -6032,6 +6255,7 @@ mdss1_intf5_out: endpoint {
 
 					port@6 {
 						reg = <6>;
+
 						mdss1_intf6_out: endpoint {
 							remote-endpoint = <&mdss1_dp2_in>;
 						};
@@ -6147,6 +6371,170 @@ opp-810000000 {
 				};
 			};
 
+			mdss1_dsi0: dsi@22094000 {
+				compatible = "qcom,sc8280xp-dsi-ctrl",
+					     "qcom,sa8775p-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
+				reg = <0 0x22094000 0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss1>;
+				interrupts = <4>;
+
+				clocks = <&dispcc1 DISP_CC_MDSS_BYTE0_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_BYTE0_INTF_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_PCLK0_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_ESC0_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+
+				assigned-clocks = <&dispcc1 DISP_CC_MDSS_BYTE0_CLK_SRC>,
+						  <&dispcc1 DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss1_dsi1_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss1_dsi0_phy DSI_PIXEL_PLL_CLK>;
+
+				operating-points-v2 = <&dsi_opp_table>;
+				power-domains = <&rpmhpd SC8280XP_MMCX>;
+
+				refgen-supply = <&refgen>;
+
+				phys = <&mdss1_dsi0_phy>;
+				phy-names = "dsi";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss1_dsi0_in: endpoint {
+							remote-endpoint = <&mdss1_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss1_dsi0_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss1_dsi0_phy: phy@22094400 {
+				compatible = "qcom,sc8280xp-dsi-phy-5nm"
+					     "qcom,sa8775p-dsi-phy-5nm";
+				reg = <0 0x22094400 0 0x200>,
+				      <0 0x22094600 0 0x280>,
+				      <0 0x22094900 0 0x280>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+
+			mdss1_dsi1: dsi@22096000 {
+				compatible = "qcom,sc8280xp-dsi-ctrl",
+					     "qcom,sa8775p-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
+				reg = <0 0x22096000 0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss1>;
+				interrupts = <5>;
+
+				clocks = <&dispcc1 DISP_CC_MDSS_BYTE1_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_BYTE1_INTF_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_PCLK1_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_ESC1_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+
+				assigned-clocks = <&dispcc1 DISP_CC_MDSS_BYTE1_CLK_SRC>,
+						  <&dispcc1 DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&mdss1_dsi1_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss1_dsi1_phy DSI_PIXEL_PLL_CLK>;
+
+				operating-points-v2 = <&dsi_opp_table>;
+				power-domains = <&rpmhpd SC8280XP_MMCX>;
+
+				refgen-supply = <&refgen>;
+
+				phys = <&mdss1_dsi1_phy>;
+				phy-names = "dsi";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss1_dsi1_in: endpoint {
+							remote-endpoint = <&mdss1_intf2_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss1_dsi1_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss1_dsi1_phy: phy@22096400 {
+				compatible = "qcom,sc8280xp-dsi-phy-5nm"
+					     "qcom,sa8775p-dsi-phy-5nm";
+				reg = <0 0x22096400 0 0x200>,
+				      <0 0x22096600 0 0x280>,
+				      <0 0x22096900 0 0x280>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+
 			mdss1_dp1: displayport-controller@22098000 {
 				compatible = "qcom,sc8280xp-dp";
 				reg = <0 0x22098000 0 0x200>,
@@ -6434,10 +6822,10 @@ dispcc1: clock-controller@22100000 {
 				 <&mdss1_dp2_phy 1>,
 				 <&mdss1_dp3_phy 0>,
 				 <&mdss1_dp3_phy 1>,
-				 <0>,
-				 <0>,
-				 <0>,
-				 <0>;
+				 <&mdss1_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss1_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss1_dsi1_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss1_dsi1_phy DSI_PIXEL_PLL_CLK>;
 			power-domains = <&rpmhpd SC8280XP_MMCX>;
 
 			#clock-cells = <1>;
-- 
2.53.0

