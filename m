Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 512B013388D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 02:39:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43CB76E847;
	Wed,  8 Jan 2020 01:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86266E847;
 Wed,  8 Jan 2020 01:39:11 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id s64so729930pgb.9;
 Tue, 07 Jan 2020 17:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=THEg3QFZEQa/O6HzLLi2uHWnREbCmXjTJPDpWzYvpYE=;
 b=bFJiDvvzRPYy9tdXQ0hkK/djyuBrFTMSlg2q0m8p/LFtm9htcOMfpSjWHqApL/PkM1
 hjQIkMC5uFV8SbB/E1pKh54o/9vCh+9nmWdBu3HaR3xo4o6SpQHrIBL9bgxcIM7XM5n5
 ligtnEa3e6CeS/jpbKV9flDmO4A/oM+A1c7e25lpjOkA+FpY+zHr/ot9xfxSlu60X6C8
 S85g2bu68aqCM+Tpg2hGTVHvaNjPvHj6zCHJklt8o17So2Co3W96UWMIXT8C0pLGT1pg
 qdNQMPfkQKuBTx8p1/poFS+aWKOBCPydbaELEEYgcN7FF4LNdOzP1VJBlt996eRPax/w
 hMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=THEg3QFZEQa/O6HzLLi2uHWnREbCmXjTJPDpWzYvpYE=;
 b=Wsj6OCKagn8DuZ9falNdUdXchhgxUhxghBvn7/X7nRqlh8RBHSvElPlYYPh2J4UdaR
 oO6oz25QgDgiN2lr01sfVOgjMYVbWHu1gA1KX7lFW6uPgZeCu7pAcYo4lqdLJo4q2rgG
 2D1EvUEMtM9XLIduzUh7j4cGOE/SePzUC7M1AJLqxehomco8Y4ag8epnqME0PE2e87sI
 DwmjzKVChn/rwCRp9WiMcTEDa6WgkDOKFKk2Gj6UEiFB6lSJRAjfygz4Ld7EuL9pnd48
 sThXcSeXNmkAM6TWqO03hFMCDSt3qQKSjs06Pwkhq+tPi7D1uDoyHC5BZjB1VFBh3YmW
 oHQQ==
X-Gm-Message-State: APjAAAWuaaI0Hx+tFKwoZAJFgJVL66Gq0MjNYtgR/CIdHqtZYYipxoAP
 l8jOGekJk5Lqwt94Q/6fNNnw9w96dn8=
X-Google-Smtp-Source: APXvYqyW+M9y0psHwU0NpMvkTavrh7MZTxAMiyVpc4pqn2yNLfg6OeaTa33ovYQ/omgdDo7LgmmXpQ==
X-Received: by 2002:a62:1944:: with SMTP id 65mr2476029pfz.151.1578447550936; 
 Tue, 07 Jan 2020 17:39:10 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id a6sm994334pgg.25.2020.01.07.17.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 17:39:10 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] arm64: dts: sdm845: move gpu zap nodes to per-device dts
Date: Tue,  7 Jan 2020 17:38:44 -0800
Message-Id: <20200108013847.899170-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108013847.899170-1-robdclark@gmail.com>
References: <20200108013847.899170-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

We want to specify per-device firmware-name, so move the zap node into
the .dts file for individual boards/devices.  This lets us get rid of
the /delete-node/ for cheza, which does not use zap.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi           | 1 -
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts           | 7 +++++++
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts              | 8 ++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi                 | 6 +-----
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 7 +++++++
 5 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index 9a4ff57fc877..2db79c1ecdac 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -165,7 +165,6 @@ panel_in_edp: endpoint {
 /delete-node/ &venus_mem;
 /delete-node/ &cdsp_mem;
 /delete-node/ &cdsp_pas;
-/delete-node/ &zap_shader;
 /delete-node/ &gpu_mem;
 
 /* Increase the size from 120 MB to 128 MB */
diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index d100f46791a6..c472195e44fb 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -352,6 +352,13 @@ &gcc {
 			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
 };
 
+&gpu {
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		firmware-name = "qcom/db845c/a630_zap.mbn";
+	};
+};
+
 &pm8998_gpio {
 	vol_up_pin_a: vol-up-active {
 		pins = "gpio6";
diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index c57548b7b250..876155fc0547 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -360,6 +360,14 @@ &gcc {
 			   <GCC_LPASS_SWAY_CLK>;
 };
 
+&gpu {
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		// TODO presumably mtp can use same "test key" signed zap?
+		firmware-name = "qcom/db845c/a630_zap.mbn";
+	};
+};
+
 &i2c10 {
 	status = "okay";
 	clock-frequency = <400000>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index ddb1f23c936f..601c57cc9b6d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2804,7 +2804,7 @@ dsi1_phy: dsi-phy@ae96400 {
 			};
 		};
 
-		gpu@5000000 {
+		gpu: gpu@5000000 {
 			compatible = "qcom,adreno-630.2", "qcom,adreno";
 			#stream-id-cells = <16>;
 
@@ -2824,10 +2824,6 @@ gpu@5000000 {
 
 			qcom,gmu = <&gmu>;
 
-			zap_shader: zap-shader {
-				memory-region = <&gpu_mem>;
-			};
-
 			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 13dc619687f3..b255be3a4a0a 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -245,6 +245,13 @@ &gcc {
 			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
 };
 
+&gpu {
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		firmware-name = "qcom/LENOVO/81JL/qcdxkmsuc850.mbn";
+	};
+};
+
 &i2c1 {
 	status = "okay";
 	clock-frequency = <400000>;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
