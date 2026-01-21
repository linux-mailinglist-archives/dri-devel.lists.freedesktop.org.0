Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBu4K4sBcWmgbAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 17:40:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE1F5A08C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 17:40:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE5910E85A;
	Wed, 21 Jan 2026 16:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aLzoB28i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FD910E859
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 16:40:36 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-47ee0291921so383515e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 08:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769013635; x=1769618435; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8sK6KTDMoM9yQ8EM9awhJzqGRUQ7d4anusUh3Wfygmc=;
 b=aLzoB28iKIBtP/66Ub7WSyefXuzJFpJkM1GVntUVpB8ZSQTxxsn3ea4rI2iRcneS/2
 23bivtVb/zssl1XTc5/6qMIcvqvrZoji2jV8MaPnN2LyLyizw7agCSN0EKboK/J4vwy/
 BFSEoe105k6LX9YS0tHmmcro58/NveDdQUTVHsMEx4qPQVxGfHaXxZFNSfLp2KICKIUV
 s1VouWg+7BmRv7Pw7rqdRJyckQFZJTvKThCj2Qgt5yXbEKYTYKLCHx80a9Y9YJmvYLE3
 T+1wuBLlTyZIPZx4ke6PoMI2jH1l7JMHgfq/XMNU3fApP4xfreyjonD7x7hW+s8boQG7
 v0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769013635; x=1769618435;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8sK6KTDMoM9yQ8EM9awhJzqGRUQ7d4anusUh3Wfygmc=;
 b=VJ4btl7oyJ4JDYVRt3BGhhrvQU+7vBK88eBSgiA3UUQ2Tpfv3Lz/Lo4Yhft0o9d/pC
 Vm3reGrZYOZEJ/k00NhuvbKShIywUCDbkjwz88wFsdbnM+JDngJBpB/aSJiMPO+f6WvH
 WqUN+IvRXfkPgVY4c09i5JNnDtFbosubt3fc70g9aNUNdi3gN75Qrk0VJ7I62++yJ7YY
 aLwPydMeVKgsReBC3WxLqbq8qmvoRE5Xwdk+L4nN/lpQXyf+nbS9aigm56OdLpaslvJV
 Nv/u6AvGStoebx+MRQkFj5Mox9FUsxVh5fc6Ntc2KEYKpTZS0VLKWTnjDrqxbTJUueto
 DWVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDFH9UcjTVnqQpxvxTEhUuYeqqKKOznWXlqh/fzvday5L/W25NEs1OMlqnuCExoM/uLSNYjYB97l8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyh1pKAKFQlZJ38PVSyTRA5WzphrhoQesZdM2rPyoeKC9yIknCe
 +biXMQyF1STHLHyOQ7xS+hFpqOJwg7AbuNCQYC1wwpL1/cEjGOPDe2Sz/OsacSlz0vM=
X-Gm-Gg: AZuq6aK+y4lzH1miZVdIdLLP7aFwviJK9O44tjUuwrRKkKixHqbyDw+/lOdpH3/rI9A
 qG4A9lwzE0z3t1yAcTkS2YvpIamXxEHjMMjrDfGx+2mQTGY52B5x/ECjMG/bvw5w/Yq5AU4kPyM
 k7eyr95Sy4ZkH7Bdznvk3aXxqAp7Lf3u/pQi5+TbZORu+vH6sFttv/9XYw6JKv9un3wYtYJ1WJ/
 EFulxcLf3+2qgZV7puMvKiSfZ1gTj37HpJVi1H5AtHc5EtxDRk3FLgDBBcsvyT7CSn+iIPqy4ec
 s+3f0xv6l+tCl7EKB6fQv8G+TPsZLjrIfI2Fy0xWD/r0XkwSZriFWsaj/OcvUDpecr1vz8gCKiH
 cWq8H8nwbqYETktIBvE2t/+kYeqRcWQ6hEhSNekICZVeALvwUKos48WOPjFTZCq4LTitlgHAgGT
 uQZyKdEB9WP9Mvrz1htcOYTzngyRp1pwY=
X-Received: by 2002:a05:600d:644e:10b0:47f:1a8d:4f30 with SMTP id
 5b1f17b1804b1-4801eb0efbdmr210570255e9.26.1769013635076; 
 Wed, 21 Jan 2026 08:40:35 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-480470287c3sm1000255e9.3.2026.01.21.08.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 08:40:34 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 21 Jan 2026 17:40:28 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket S2 gaming console
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-3-bb3f95f1c085@linaro.org>
References: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org>
In-Reply-To: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 KancyJoe <kancy2333@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=36344;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=xme4Jza4n/VB16OLEgfwnqiJDWLMuJDBYNin0V6tL5E=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpcQF8G3rBCzWZt5P01O3u+xtDfyW/LIjrsjyeENqe
 YKYtImOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaXEBfAAKCRB33NvayMhJ0SU3D/
 9tyFWPKk9ublqpQtBMUjVZAcb67JDfx633BurPjPHR7qn51vpAAVRFJ5kqEEe89H/rVhJtBqdVuKgP
 vUqYpql+gGNdg0Y44zLH3IBBylELPp+QDa3pdKDENrulzFSO79/I2Rv/wrohNJptbo+78PwuR0oznL
 +cro81T/TJ+5Jw+6SW3nn9AZlxVat8OpCwtYKAR3y+l5if9LouVgPBcgYGKZTh687wdDWGT2feH7cB
 Vr1Gb6rpebMyovLHJ67ru9Z1cGgEwvscvIHycyRfAgbFl3OP9x3q/2ty59I+gohl4478QcaBusHKSD
 yonmF9On242+j/mgvmXqwHnJsNyxktlZ0SgPCdQZL28fT5PoB8ac4iKyLtQ++FKwVzJTzOtD0qh68g
 2YdJexE41qJAMPd/OlfnbopUdugHsJs0EVtCXqGvgCRpRjYEuhoHA3kdiTOVXm+shC9VXSi3m39Sgk
 C32ZGPt+aCoNU6ncMpWH3RsgUgyU+xuI1K7+a/7x8DE9yRAu8y9MNgYXYO78ypk4FPJCkqvTHxYprN
 it5sNuw9vyRLvMwYa2AbGGKbu+ShJiZt0KSNQTvbVce0CDBjQRQygZIvUIE7HwbxgOm3ZaA6r4xieo
 tmpdYX24xuERLiKefYB75LExhsY3/VBInFobfbRLNtCl1FwlASMwoEeKkzdA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:neil.armstrong@linaro.org,m:kancy2333@outlook.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,linaro.org,outlook.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 3DE1F5A08C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: KancyJoe <kancy2333@outlook.com>

Add initial Device Tree for the Ayaneo Pocket S2 gaming console based
on the Qualcomm Snapdragon 8 Gen 3 platform.

The design is similar to a phone wihout the modem, the game control
is handled via a standalone controller connected to a PCIe USB
controller.

Display support will be added in a second time.

Signed-off-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 1445 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |    2 +-
 drivers/gpu/drm/msm/dsi/dsi.c                      |    4 +-
 4 files changed, 1449 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f34d5ed331c..1ba29755e5ba 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -313,6 +313,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-samsung-q5q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-sony-xperia-yodo-pdx234.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-ayaneo-pocket-s2.dtb
 
 sm8650-hdk-display-card-dtbs	:= sm8650-hdk.dtb sm8650-hdk-display-card.dtbo
 
diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
new file mode 100644
index 000000000000..141d92933957
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -0,0 +1,1445 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2023, Linaro Limited
+ * Copyright (c) 2025, Kancy Joe <kancy2333@outlook.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "sm8650.dtsi"
+#include "pm8550.dtsi"
+#include "pm8550b.dtsi"
+#define PMK8550VE_SID 8
+#include "pm8550ve.dtsi"
+#include "pm8550vs.dtsi"
+#include "pmk8550.dtsi"
+
+/delete-node/ &rmtfs_mem;
+/delete-node/ &hwfence_shbuf;
+
+/ {
+	model = "AYANEO Pocket S2 (Pro)";
+	compatible = "ayaneo,pocket-s2", "qcom,sm8650";
+
+	aliases {
+		serial0 = &uart15;
+		serial1 = &uart14;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	fan: pwm-fan {
+		status = "okay";
+		compatible = "pwm-fan";
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&fan_pwr_active>,
+			    <&pwm_fan_ctrl_default>,
+			    <&fan_int_active>;
+		pinctrl-1 = <&fan_pwr_sleep>;
+		pinctrl-names = "default",
+				"sleep";
+
+		pwms = <&pm8550_pwm 3 50000>;
+
+		#cooling-cells = <2>;
+		cooling-levels = <0 16 32 45 60 80 105 130 155 180 205 230 255>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&volume_up_n>;
+		pinctrl-names = "default";
+
+		key-volume-up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&pm8550_gpios 6 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+
+	pmic-glink {
+		compatible = "qcom,sm8650-pmic-glink",
+			     "qcom,sm8550-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		orientation-gpios = <&tlmm 29 GPIO_ACTIVE_HIGH>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+
+			power-role = "dual";
+			data-role = "dual";
+			self-powered;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&redriver_ss_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_sbu: endpoint {
+						remote-endpoint = <&wcd_usbss_sbu_mux>;
+					};
+				};
+			};
+		};
+	};
+
+	sound {
+		compatible = "qcom,sm8650-sndcard", "qcom,sm8450-sndcard";
+		model = "SM8650-APS2";
+		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
+				"SpkrRight IN", "WSA_SPK2 OUT",
+				"IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT",
+				"DMIC1", "MIC BIAS1",
+				"DMIC2", "MIC BIAS2",
+				"AMIC2", "MIC BIAS2",
+				"TX SWR_INPUT1", "ADC2_OUTPUT",
+				"TX SWR_INPUT7", "DMIC1_OUTPUT",
+				"TX SWR_INPUT8", "DMIC2_OUTPUT";
+
+		wcd-playback-dai-link {
+			link-name = "WCD Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&wcd939x 0>,
+					    <&swr1 0>,
+					    <&lpass_rxmacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wcd-capture-dai-link {
+			link-name = "WCD Capture";
+
+			cpu {
+				sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+			};
+
+			codec {
+				sound-dai = <&wcd939x 1>,
+					    <&swr2 0>,
+					    <&lpass_txmacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&right_spkr>,
+					    <&left_spkr>,
+					    <&swr3 0>,
+					    <&lpass_wsa2macro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
+	wcd939x: audio-codec {
+		compatible = "qcom,wcd9395-codec", "qcom,wcd9390-codec";
+
+		pinctrl-0 = <&wcd_default>;
+		pinctrl-names = "default";
+
+		qcom,micbias1-microvolt = <1800000>;
+		qcom,micbias2-microvolt = <1800000>;
+		qcom,micbias3-microvolt = <1800000>;
+		qcom,micbias4-microvolt = <1800000>;
+		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
+		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
+		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
+		qcom,rx-device = <&wcd_rx>;
+		qcom,tx-device = <&wcd_tx>;
+
+		reset-gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
+
+		vdd-buck-supply = <&vreg_l15b_1p8>;
+		vdd-rxtx-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l15b_1p8>;
+		vdd-mic-bias-supply = <&vreg_bob1>;
+
+		#sound-dai-cells = <1>;
+
+		mode-switch;
+		orientation-switch;
+
+		port {
+			wcd_codec_headset_in: endpoint {
+				remote-endpoint = <&wcd_usbss_headset_out>;
+			};
+		};
+	};
+
+	thermal-zones {
+		cpu2-top-thermal {
+			trips {
+				cpu2_active: cpu2-active {
+					temperature = <38000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+			};
+
+			cooling-maps {
+				map {
+					trip = <&cpu2_active>;
+					cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu3-top-thermal {
+			trips {
+				cpu3_active: cpu3-active {
+					temperature = <38000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+			};
+
+			cooling-maps {
+				map {
+					trip = <&cpu3_active>;
+					cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+
+		cpu4-top-thermal {
+			trips {
+				cpu4_active: cpu4-top-active {
+					temperature = <38000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+			};
+
+			cooling-maps {
+				map {
+					trip = <&cpu4_active>;
+					cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu5-top-thermal {
+			trips {
+				cpu5_active: cpu5-active {
+					temperature = <38000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+			};
+
+			cooling-maps {
+				map {
+					trip = <&cpu5_active>;
+					cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu6-top-thermal {
+			trips {
+				cpu6_active: cpu6-active {
+					temperature = <38000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+			};
+
+			cooling-maps {
+				map {
+					trip = <&cpu6_active>;
+					cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu7-top-thermal {
+			trips {
+				cpu7_active: cpu7-active {
+					temperature = <38000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+			};
+
+			cooling-maps {
+				map {
+					trip = <&cpu7_active>;
+					cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		gpuss0-thermal {
+			trips {
+				gpuss0_active: gpuss0-active {
+					temperature = <38000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+			};
+
+			cooling-maps {
+				map {
+					trip = <&gpuss0_active>;
+					cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		gpuss1-thermal {
+			trips {
+				gpuss1_active: gpuss1-active {
+					temperature = <38000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+			};
+
+			cooling-maps {
+				map {
+					trip = <&gpuss1_active>;
+					cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		gpuss2-thermal {
+			trips {
+				gpuss2_active: gpuss2-active {
+					temperature = <38000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+			};
+
+			cooling-maps {
+				map {
+					trip = <&gpuss2_active>;
+					cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		gpuss3-thermal {
+			trips {
+				gpuss3_active: gpuss3-active {
+					temperature = <38000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+			};
+
+			cooling-maps {
+				map {
+					trip = <&gpuss3_active>;
+					cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		gpuss4-thermal {
+			trips {
+				gpuss4_active: gpuss4-active {
+					temperature = <38000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+			};
+
+			cooling-maps {
+				map {
+					trip = <&gpuss4_active>;
+					cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		gpuss5-thermal {
+			trips {
+				gpuss5_active: gpuss5-active {
+					temperature = <38000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+			};
+
+			cooling-maps {
+				map {
+					trip = <&gpuss5_active>;
+					cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		gpuss6-thermal {
+			trips {
+				gpuss6_active: gpuss6-active {
+					temperature = <38000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+			};
+
+			cooling-maps {
+				map {
+					trip = <&gpuss6_active>;
+					cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wlan_en>, <&bt_default>;
+
+		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 17 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_s4i_0p85>;
+		vddio-supply = <&vreg_l15b_1p8>;
+		vddio1p2-supply = <&vreg_l3c_1p2>;
+		vddaon-supply = <&vreg_s2c_0p8>;
+		vdddig-supply = <&vreg_s3c_0p9>;
+		vddrfa1p2-supply = <&vreg_s1c_1p2>;
+		vddrfa1p8-supply = <&vreg_s6c_1p8>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK1>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8550-rpmh-regulators";
+
+		vdd-bob1-supply = <&vph_pwr>;
+		vdd-bob2-supply = <&vph_pwr>;
+		vdd-l2-l13-l14-supply = <&vreg_bob1>;
+		vdd-l3-supply = <&vreg_s1c_1p2>;
+		vdd-l5-l16-supply = <&vreg_bob1>;
+		vdd-l6-l7-supply = <&vreg_bob1>;
+		vdd-l8-l9-supply = <&vreg_bob1>;
+		vdd-l11-supply = <&vreg_s1c_1p2>;
+		vdd-l12-supply = <&vreg_s6c_1p8>;
+		vdd-l15-supply = <&vreg_s6c_1p8>;
+		vdd-l17-supply = <&vreg_bob2>;
+
+		qcom,pmic-id = "b";
+
+		vreg_bob1: bob1 {
+			regulator-name = "vreg_bob1";
+			regulator-min-microvolt = <3296000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob2: bob2 {
+			regulator-name = "vreg_bob2";
+			regulator-min-microvolt = <2720000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2b_3p0: ldo2 {
+			regulator-name = "vreg_l2b_3p0";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5b_3p1: ldo5 {
+			regulator-name = "vreg_l5b_3p1";
+			regulator-min-microvolt = <3104000>;
+			regulator-max-microvolt = <3104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6b_1p8: ldo6 {
+			regulator-name = "vreg_l6b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7b_1p8: ldo7 {
+			regulator-name = "vreg_l7b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8b_1p8: ldo8 {
+			regulator-name = "vreg_l8b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9b_2p9: ldo9 {
+			regulator-name = "vreg_l9b_2p9";
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11b_1p2: ldo11 {
+			regulator-name = "vreg_l11b_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12b_1p8: ldo12 {
+			regulator-name = "vreg_l12b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13b_3p0: ldo13 {
+			regulator-name = "vreg_l13b_3p0";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14b_3p2: ldo14 {
+			regulator-name = "vreg_l14b_3p2";
+			regulator-min-microvolt = <3200000>;
+			regulator-max-microvolt = <3200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b_1p8: ldo15 {
+			regulator-name = "vreg_l15b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16b_2p8: ldo16 {
+			regulator-name = "vreg_l16b_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vreg_l17b_2p5: ldo17 {
+			regulator-name = "vreg_l17b_2p5";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s1c_1p2>;
+		vdd-l2-supply = <&vreg_s1c_1p2>;
+		vdd-l3-supply = <&vreg_s1c_1p2>;
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+
+		qcom,pmic-id = "c";
+
+		vreg_s1c_1p2: smps1 {
+			regulator-name = "vreg_s1c_1p2";
+			regulator-min-microvolt = <1256000>;
+			regulator-max-microvolt = <1348000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s2c_0p8: smps2 {
+			regulator-name = "vreg_s2c_0p8";
+			regulator-min-microvolt = <852000>;
+			regulator-max-microvolt = <1036000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s3c_0p9: smps3 {
+			regulator-name = "vreg_s3c_0p9";
+			regulator-min-microvolt = <976000>;
+			regulator-max-microvolt = <1064000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s4c_1p2: smps4 {
+			regulator-name = "vreg_s4c_1p2";
+			regulator-min-microvolt = <1224000>;
+			regulator-max-microvolt = <1280000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s5c_0p7: smps5 {
+			regulator-name = "vreg_s5c_0p7";
+			regulator-min-microvolt = <752000>;
+			regulator-max-microvolt = <900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s6c_1p8: smps6 {
+			regulator-name = "vreg_s6c_1p8";
+			regulator-min-microvolt = <1856000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1c_1p2: ldo1 {
+			regulator-name = "vreg_l1c_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c_1p2: ldo3 {
+			regulator-name = "vreg_l3c_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s3c_0p9>;
+
+		qcom,pmic-id = "d";
+
+		vreg_l1d_0p88: ldo1 {
+			regulator-name = "vreg_l1d_0p88";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-3 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l3-supply = <&vreg_s3c_0p9>;
+
+		qcom,pmic-id = "e";
+
+		vreg_l3e_0p9: ldo3 {
+			regulator-name = "vreg_l3e_0p9";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-4 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s3c_0p9>;
+		vdd-l3-supply = <&vreg_s3c_0p9>;
+
+		qcom,pmic-id = "g";
+
+		vreg_l1g_0p91: ldo1 {
+			regulator-name = "vreg_l1g_0p91";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3g_0p91: ldo3 {
+			regulator-name = "vreg_l3g_0p91";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-5 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s3c_0p9>;
+		vdd-l2-supply = <&vreg_s3c_0p9>;
+		vdd-l3-supply = <&vreg_s1c_1p2>;
+		vdd-s4-supply = <&vph_pwr>;
+
+		qcom,pmic-id = "i";
+
+		vreg_s4i_0p85: smps4 {
+			regulator-name = "vreg_s4i_0p85";
+			regulator-min-microvolt = <852000>;
+			regulator-max-microvolt = <1004000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1i_0p88: ldo1 {
+			regulator-name = "vreg_l1i_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2i_0p88: ldo2 {
+			regulator-name = "vreg_l2i_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3i_1p2: ldo3 {
+			regulator-name = "vreg_l3i_0p91";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&gpi_dma2 {
+	status = "okay";
+};
+
+&i2c3 {
+	status = "okay";
+
+	wcd_usbss: typec-mux@e {
+		compatible = "qcom,wcd9395-usbss", "qcom,wcd9390-usbss";
+		reg = <0xe>;
+
+		vdd-supply = <&vreg_l15b_1p8>;
+		reset-gpios = <&tlmm 152 GPIO_ACTIVE_HIGH>;
+
+		mode-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				wcd_usbss_sbu_mux: endpoint {
+					remote-endpoint = <&pmic_glink_sbu>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				wcd_usbss_headset_out: endpoint {
+					remote-endpoint = <&wcd_codec_headset_in>;
+				};
+			};
+		};
+	};
+};
+
+&i2c6 {
+	status = "okay";
+
+	typec-mux@1c {
+		compatible = "onnn,nb7vpq904m";
+		reg = <0x1c>;
+
+		vcc-supply = <&vreg_l15b_1p8>;
+
+		retimer-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				redriver_ss_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				redriver_ss_in: endpoint {
+					remote-endpoint = <&usb_dp_qmpphy_out>;
+				};
+			};
+		};
+	};
+};
+
+&iris {
+	status = "okay";
+};
+
+&lpass_wsa2macro {
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1>;
+
+	status = "okay";
+};
+
+&pcie0 {
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcieport0 {
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l1i_0p88>;
+	vdda-pll-supply = <&vreg_l3i_1p2>;
+
+	status = "okay";
+};
+
+&pcie1 {
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcieport1 {
+	pinctrl-0 = <&upd720201_active>;
+	pinctrl-names = "default";
+
+	/* Renesas μPD720201 PCIe USB3.0 HOST CONTROLLER */
+	usb-controller@0 {
+		compatible = "pci1912,0014";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		pinctrl-0 = <&gamepad_pwr_en>;
+		pinctrl-names = "default";
+	};
+};
+
+&pcie1_phy {
+	vdda-phy-supply = <&vreg_l3e_0p9>;
+	vdda-pll-supply = <&vreg_l3i_1p2>;
+	vdda-qref-supply = <&vreg_l1i_0p88>;
+
+	status = "okay";
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&pm8550_gpios {
+	volume_up_n: volume-up-n-state {
+		pins = "gpio6";
+		function = "normal";
+		bias-pull-up;
+		input-enable;
+		power-source = <1>;
+	};
+
+	pwm_fan_ctrl_default: pwm-fan-ctrl-default-state {
+		pins = "gpio9";
+		function = "normal";
+		output-low;
+		bias-disable;
+		power-source = <0>;
+		qcom,drive-strength = <3>; /* PMIC_GPIO_STRENGTH_LOW */
+	};
+
+	pwm_fan_ctrl_sleep: pwm-fan-ctrl-sleep-state {
+		pins = "gpio9";
+		function = "normal";
+		output-high;
+		bias-disable;
+		power-source = <0>;
+		qcom,drive-strength = <3>; /* PMIC_GPIO_STRENGTH_LOW */
+	};
+
+	sdc2_card_det_n: sdc2-card-det-state {
+		pins = "gpio12";
+		function = "normal";
+		bias-pull-up;
+		input-enable;
+		output-disable;
+		power-source = <1>; /* 1.8 V */
+	};
+};
+
+&pm8550_pwm {
+	status = "okay";
+
+	multi-led {
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_STATUS;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led@2 {
+			reg = <2>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@3 {
+			reg = <3>;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+	};
+};
+
+&pm8550b_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_1p8>;
+	vdd3-supply = <&vreg_l5b_3p1>;
+};
+
+&qup_i2c3_data_clk {
+	/* Use internal I2C pull-up */
+	bias-pull-up = <2200>;
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/sm8650/ayaneo/ps2/adsp.mbn",
+			"qcom/sm8650/ayaneo/ps2/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/sm8650/ayaneo/ps2/cdsp.mbn",
+			"qcom/sm8650/ayaneo/ps2/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&reserved_memory {
+	lost_reg_mem: lost-reg-mem {
+		reg = <0 0x9b09c000 0 0x4000>;
+		no-map;
+	};
+
+	hwfence_shbuf: hwfence-shbuf@d4e23000 {
+		reg = <0 0xd4e23000 0 0x2dd000>;
+		no-map;
+	};
+
+	splash_region: splash-region {
+		label = "cont_splash_region";
+		reg = <0 0xd5100000 0 0x2b00000>;
+		no-map;
+	};
+};
+
+&sdhc_2 {
+	cd-gpios = <&pm8550_gpios 12 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vreg_l9b_2p9>;
+	vqmmc-supply = <&vreg_l8b_1p8>;
+	bus-width = <4>;
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc2_default>, <&sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep>, <&sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32764>;
+};
+
+&swr1 {
+	status = "okay";
+
+	/* WCD9395 RX */
+	wcd_rx: codec@0,4 {
+		compatible = "sdw20217010e00";
+		reg = <0 4>;
+
+		/*
+		 * WCD9395 RX Port 1 (HPH_L/R)      <=> SWR1 Port 1 (HPH_L/R)
+		 * WCD9395 RX Port 2 (CLSH)         <=> SWR1 Port 2 (CLSH)
+		 * WCD9395 RX Port 3 (COMP_L/R)     <=> SWR1 Port 3 (COMP_L/R)
+		 * WCD9395 RX Port 4 (LO)           <=> SWR1 Port 4 (LO)
+		 * WCD9395 RX Port 5 (DSD_L/R)      <=> SWR1 Port 5 (DSD_L/R)
+		 * WCD9395 RX Port 6 (HIFI_PCM_L/R) <=> SWR1 Port 9 (HIFI_PCM_L/R)
+		 */
+		qcom,rx-port-mapping = <1 2 3 4 5 9>;
+	};
+};
+
+&swr2 {
+	status = "okay";
+
+	/* WCD9395 TX */
+	wcd_tx: codec@0,3 {
+		compatible = "sdw20217010e00";
+		reg = <0 3>;
+
+		/*
+		 * WCD9395 TX Port 1 (ADC1,2,3,4)         <=> SWR2 Port 2 (TX SWR_INPUT 0,1,2,3)
+		 * WCD9395 TX Port 2 (ADC3,4 & DMIC0,1)   <=> SWR2 Port 2 (TX SWR_INPUT 0,1,2,3)
+		 * WCD9395 TX Port 3 (DMIC0,1,2,3 & MBHC) <=> SWR2 Port 3 (TX SWR_INPUT 4,5,6,7)
+		 * WCD9395 TX Port 4 (DMIC4,5,6,7)        <=> SWR2 Port 4 (TX SWR_INPUT 8,9,10,11)
+		 */
+		qcom,tx-port-mapping = <2 2 3 4>;
+	};
+};
+
+&swr3 {
+	status = "okay";
+
+	pinctrl-0 = <&wsa2_swr_active>, <&spkr_23_sd_n_active>;
+	pinctrl-names = "default";
+
+	/* WSA8845, Speaker Left */
+	left_spkr: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		#sound-dai-cells = <0>;
+		reset-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>;
+		sound-name-prefix = "SpkrLeft";
+		vdd-1p8-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l3c_1p2>;
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR3 Port 1 (SPKR_L)
+		 * WSA8845 Port 2 (COMP)    <=> SWR3 Port 2 (SPKR_L_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR3 Port 3 (SPKR_L_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR3 Port 7 (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR3 Port 10 (SPKR_L_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR3 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <1 2 3 7 10 13>;
+	};
+
+	/* WSA8845, Speaker Right */
+	right_spkr: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		#sound-dai-cells = <0>;
+		reset-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>;
+		sound-name-prefix = "SpkrRight";
+		vdd-1p8-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l3c_1p2>;
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR3 Port 4 (SPKR_R)
+		 * WSA8845 Port 2 (COMP)    <=> SWR3 Port 5 (SPKR_R_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR3 Port 6 (SPKR_R_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR3 Port 7 (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR3 Port 11 (SPKR_R_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR3 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <4 5 6 7 11 13>;
+	};
+};
+
+&tlmm {
+	/* Reserved I/Os for NFC */
+	gpio-reserved-ranges = <32 4>,  <36 1>, <38 6>, <74 1>;
+
+	bt_default: bt-default-state {
+		bt-en-pins {
+			pins = "gpio17";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		sw-ctrl-pins {
+			pins = "gpio18";
+			function = "gpio";
+			bias-pull-down;
+		};
+	};
+
+	fan_pwr_active: fan-pwr-active-state {
+		pins = "gpio124", "gpio125";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
+	fan_pwr_sleep: fan-pwr-sleep-state {
+		pins = "gpio124", "gpio125";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
+	fan_int_active: fan-int-active-state {
+		pins = "gpio14";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	upd720201_active: upd720201-active-state {
+		pins = "gpio121",  "gpio122", "gpio123";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+		output-high;
+	};
+
+	gamepad_pwr_en: gamepad-pwr-en-active-state {
+		pins = "gpio28";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
+	spkr_23_sd_n_active: spkr-23-sd-n-active-state {
+		pins = "gpio77";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+
+	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
+		pins = "gpio21";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-high;
+	};
+
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio107";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+
+	wlan_en: wlan-en-state {
+		pins = "gpio16";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
+};
+
+&uart14 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+
+		max-speed = <3200000>;
+	};
+};
+
+&uart15 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l17b_2p5>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l1c_1p2>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l1d_0p88>;
+	vdda-pll-supply = <&vreg_l3i_1p2>;
+
+	status = "okay";
+};
+
+/*
+ * DPAUX -> WCD9395 -> USB_SBU -> USB-C
+ * eUSB2 DP/DM -> PM85550HS -> eUSB2 DP/DM -> WCD9395 -> USB-C
+ * USB SS -> NB7VPQ904MMUTWG -> USB-C
+ */
+
+&usb_1 {
+	dr_mode = "otg";
+	usb-role-switch;
+
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l1i_0p88>;
+	vdda12-supply = <&vreg_l3i_1p2>;
+
+	phys = <&pm8550b_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3i_1p2>;
+	vdda-pll-supply = <&vreg_l3g_0p91>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&redriver_ss_in>;
+};
+
+&xo_board {
+	clock-frequency = <76800000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 07ae74851621..fcd5a1a45803 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -3917,7 +3917,7 @@ opp-32000000-4 {
 				};
 			};
 
-			pcie@0 {
+			pcieport1: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index d8bb40ef820e..0781dce7cda2 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -43,12 +43,12 @@ static int dsi_get_phy(struct msm_dsi *msm_dsi)
 	of_node_put(phy_node);
 
 	if (!phy_pdev) {
-		DRM_DEV_ERROR(&pdev->dev, "%s: phy driver is not ready\n", __func__);
+		DRM_DEV_ERROR(&pdev->dev, "%s: 0 phy driver is not ready\n", __func__);
 		return -EPROBE_DEFER;
 	}
 	if (!msm_dsi->phy) {
 		put_device(&phy_pdev->dev);
-		DRM_DEV_ERROR(&pdev->dev, "%s: phy driver is not ready\n", __func__);
+		DRM_DEV_ERROR(&pdev->dev, "%s: 1 phy driver is not ready\n", __func__);
 		return -EPROBE_DEFER;
 	}
 

-- 
2.34.1

