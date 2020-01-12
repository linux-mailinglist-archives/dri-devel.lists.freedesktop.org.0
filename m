Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 661BE13880B
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2020 20:54:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5987A6E044;
	Sun, 12 Jan 2020 19:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57536E044;
 Sun, 12 Jan 2020 19:54:23 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id p14so3823706pfn.4;
 Sun, 12 Jan 2020 11:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9M3dlkPvAA74ZA3Dz07VUPHZPdx7oFweuiEOAHoWN1M=;
 b=GTq8olhq3p+o5nwwODwkds2g5yTd6UB+6v/XDM8BPwRZeMADFiH8YZ1Ni44TcURnBj
 VvRlqpR+kB20Ux7C7kDIkqObcxLq4ib2T5CkIgL4wVHMOefExmqIdzW4vfevzhzNJ1HQ
 iw8CudWouK/PM5OBRvSOya7XbJRj/CUOgKshFFrvreQt0cUxiKDcK3CpRovxgDlZ37h7
 hEsFT/1OTxgZsSZswWeTz9pBqI+wBig1Kt6JZQNjzO54UA9kUY0OchqgIZyJuqHCDJKc
 Cvm1jF3yy5DMjMDzQcqVodvcUqqjprYeoO/zsu3PBKe/o78N2NZYIrqnRYeyxN7TsfJb
 +ePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9M3dlkPvAA74ZA3Dz07VUPHZPdx7oFweuiEOAHoWN1M=;
 b=Z+5wBHvNiQA2Hob6VZDbhntWaa836KAHecoHdpHZpgIFSuK6xtvD1IuDQ1nnDKe4l1
 FzLk/V+qhVSp+Y8a0laVXW/ST21shan66WG1zyEVNJqkB6kQHoOlPahnvQUQW7s1kebd
 MaoOuCpsYoXFa4Kd68CL/rebTxJ9raZs7zbFIrR4PEp4/1wBt+7us6ftHHK6RfjIEzy7
 R9qYIADrK1oNQb3AZMHPPofOfdmys8NRsfGlHlXAWNEgOvfIizrYrSTiLXBAFJ9vmW1u
 vW56c/UlKD4O+m1cjvmd944p4NHlYhFTVcxaFYdpp19z8771AtKq9EhvB7nru3ruxXGW
 Xk/g==
X-Gm-Message-State: APjAAAWG79m2urxEgahjMipl4q7NVxMiN7CZXK09RCIkqb/XVWkYSFtW
 4A54UtL3C5JN7VOma3mIz+2C6gNCai8=
X-Google-Smtp-Source: APXvYqxgtDha2wIIkYQ0s11XiURON/vwog3S3qZJcZWdKW6/HnjDdywO8lijSbdzd2JcnS/+b7qgug==
X-Received: by 2002:a63:4a0e:: with SMTP id x14mr17052016pga.360.1578858862865; 
 Sun, 12 Jan 2020 11:54:22 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 n24sm11082138pff.12.2020.01.12.11.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jan 2020 11:54:22 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/4] arm64: dts: sdm845: move gpu zap nodes to per-device
 dts
Date: Sun, 12 Jan 2020 11:54:00 -0800
Message-Id: <20200112195405.1132288-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200112195405.1132288-1-robdclark@gmail.com>
References: <20200112195405.1132288-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 freedreno@lists.freedesktop.org
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
v2: use 'sdm845' for subdir for devices that use test-key signed fw

 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi           | 1 -
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts           | 7 +++++++
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts              | 7 +++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi                 | 6 +-----
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 7 +++++++
 5 files changed, 22 insertions(+), 6 deletions(-)

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
index d100f46791a6..6cd9201ffbbd 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -352,6 +352,13 @@ &gcc {
 			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
 };
 
+&gpu {
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		firmware-name = "qcom/sdm845/a630_zap.mbn";
+	};
+};
+
 &pm8998_gpio {
 	vol_up_pin_a: vol-up-active {
 		pins = "gpio6";
diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index c57548b7b250..09ad37b0dd71 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -360,6 +360,13 @@ &gcc {
 			   <GCC_LPASS_SWAY_CLK>;
 };
 
+&gpu {
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		firmware-name = "qcom/sdm845/a630_zap.mbn";
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
