Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 536D9835792
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jan 2024 20:47:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C667010E2A6;
	Sun, 21 Jan 2024 19:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC7AD10E2A6;
 Sun, 21 Jan 2024 19:47:01 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a29c4bbb2f4so227000566b.1; 
 Sun, 21 Jan 2024 11:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705866359; x=1706471159; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A2y3IKPyLzXC4v8koqDaasKaIIQSzzqRF+g1mhrKMn4=;
 b=Id+Jl8Imc9OVPY8QezDP2mbml/t5QBuQbXBCKgvIeTlszM7KTJM3E2xu6cFxxpUTAr
 16QwTG9CppwN67gGTwF/zaujAqwDONL/Pa+ZxwDJw+kCrfPvxAL8XjxgPVkzUJFhwaoh
 KA/SJx0M/pEYnVuh2gDZM08DSI84JEaQDp3yQPS4EIXQF6Idl4Kd1H/VkEaZyTbj86Ug
 tEu/dUt0S3pIR0ESqA70P2GSq7+T9STGKzvV16zJKkAZdlV143WT4LtLKI/mdCCJzEiT
 N9T53s7OSU/STAv58r4KR7yktNzaZxB/rSZbroufD7U++JAOVv99ekLR8ZQ7cPjNA/ry
 /Ppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705866359; x=1706471159;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A2y3IKPyLzXC4v8koqDaasKaIIQSzzqRF+g1mhrKMn4=;
 b=XMuUPaigVdC5BUKAx5sFltdZCgaB8uTwoByk/jgSXGUVPMufQeg7xy9Pp5A/u5E6OL
 7dbtMYYBfyzN5m+6h5evYr1hkwKYgvD5hFLqj47cdrVNC5WHwXfdkaAt9S82Jv8DdQow
 5JrTsGsHVoqiKTCQPAhPyw+3zOXW3y1qdBO9aNfg2IXTcw8nFu6cWLXSGDKcHpaNaYlh
 p5s33dquvW64HkK8vVubqsqp4vtO7Flps5M/qCU5EdM4HSJxRM5OYUGjAWGB7TmcG4Xu
 j451V5rUJGd8prZzc4nVjxqqIJK5J/0z7Y3sO8RLBxBwYLw9QjxKh9+b6shLLFn1nrIZ
 T6zg==
X-Gm-Message-State: AOJu0YzaJFtNGDjV3eyvlQhavZ2myEEx/+BmZdNnPVoIj4dPw/scqgnn
 faWkbUlGqjW+OoaBni8/emtX6vMUjTv9A4tJbRT18v2E1RL5f3cB
X-Google-Smtp-Source: AGHT+IHh8/TU/0VUDooBERyQGy+VFyA6oUokYFyCSTIbUVuzbfxUdGklOUSWy9+BZiEdMA8CJd9+DA==
X-Received: by 2002:a17:907:c088:b0:a2e:7db2:8f1e with SMTP id
 st8-20020a170907c08800b00a2e7db28f1emr1593296ejc.79.1705866359290; 
 Sun, 21 Jan 2024 11:45:59 -0800 (PST)
Received: from localhost.localdomain (byv51.neoplus.adsl.tpnet.pl.
 [83.30.41.51]) by smtp.gmail.com with ESMTPSA id
 k6-20020a170906128600b00a2b0b0fc80esm12547134ejb.193.2024.01.21.11.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jan 2024 11:45:58 -0800 (PST)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH 7/8] arm64: dts: qcom: msm8976: Declare and wire SDC pins
Date: Sun, 21 Jan 2024 20:41:05 +0100
Message-Id: <20240121194221.13513-8-a39.skl@gmail.com>
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

Declare pinctrls for SDC pins and wire them to consumers.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8976.dtsi | 100 ++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
index 765c90ac14cb..5a7be93a0115 100644
--- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
@@ -771,6 +771,96 @@ blsp2_i2c4_sleep: blsp2-i2c4-sleep-state {
 				drive-strength = <2>;
 				bias-disable;
 			};
+
+			sdc1_default: sdc1-default-state {
+				clk-pins {
+					pins = "sdc1_clk";
+					drive-strength = <16>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc1_cmd";
+					drive-strength = <10>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc1_data";
+					drive-strength = <10>;
+					bias-pull-up;
+				};
+
+				rclk-pins {
+					pins = "sdc1_rclk";
+					bias-pull-down;
+				};
+			};
+
+			sdc1_sleep: sdc1-sleep-state {
+				clk-pins {
+					pins = "sdc1_clk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc1_cmd";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc1_data";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				rclk-pins {
+					pins = "sdc1_rclk";
+					bias-pull-down;
+				};
+			};
+
+			sdc2_default: sdc2-default-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <16>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <10>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <10>;
+					bias-pull-up;
+				};
+			};
+
+			sdc2_sleep: sdc2-sleep-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
 		};
 
 		gcc: clock-controller@1800000 {
@@ -1246,6 +1336,11 @@ sdhc_1: mmc@7824900 {
 				 <&gcc GCC_SDCC1_APPS_CLK>,
 				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
 			clock-names = "iface", "core", "xo";
+
+			pinctrl-0 = <&sdc1_default>;
+			pinctrl-1 = <&sdc1_sleep>;
+			pinctrl-names = "default", "sleep";
+
 			status = "disabled";
 		};
 
@@ -1262,6 +1357,11 @@ sdhc_2: mmc@7864900 {
 				 <&gcc GCC_SDCC2_APPS_CLK>,
 				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
 			clock-names = "iface", "core", "xo";
+
+			pinctrl-0 = <&sdc2_default>;
+			pinctrl-1 = <&sdc2_sleep>;
+			pinctrl-names = "default", "sleep";
+
 			status = "disabled";
 		};
 
-- 
2.43.0

