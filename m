Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3A76F9B17
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 21:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC4610E2C9;
	Sun,  7 May 2023 19:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73B110E2C0
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 19:07:41 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2acb6571922so16126201fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 07 May 2023 12:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683486459; x=1686078459;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RSq41UJRxM1Id04+5Bgr5nBkxb99E6+NG+r6r99Xdss=;
 b=X2UPItrb69Iq2LW98ux7h+6Hr+2d7mH9vholzNqwX/ReqBihFSjzMFZMLxdSBnjwRn
 1MC5k+sVCusWvTy3FtDGBdNAUqAKG1J/vbflMPMxaiVeWzr482mKTE7pedT4iKGzzF+k
 K16qIkQ7L4QVvpPa5RvP4vUSzzxRX0rw3XvUidbo64zkaU0OT/K9inIMWZniJ6vjtkIG
 +TsO/ZAhgNNIDOTIYlJUITc1NEbtaVxCESojBI5/SMabVAgbKGDd3dnSQVVrx+vEA/XO
 JsxZkCeJX/5K34pK38rz0nlign9+9VX4iISp984hyYQ4SpBxA/0oCUEf3iJ/cZh544Ww
 Jo5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683486459; x=1686078459;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RSq41UJRxM1Id04+5Bgr5nBkxb99E6+NG+r6r99Xdss=;
 b=UpZYz6scsPbqGS8Acoh7Wjm2UjZ8LyeHE0SNbCYMrUemfklvDPgEvmj7DVvvrBNR9J
 IlJsiZiSWskqAH9MAQ9trFOZxGHPgVp5hAc0mohF0LeUx/nuhqyH7orvjOZi5UUCCdNW
 8to3M5jhHl2XbVluy0vEFlz/aFwER9jWkrXoJqZKeCES0Fcot4VBccPfMn4b7gZ+y+ZZ
 HVXrHUVD0m1nFnpR52erbUx/xL5mY0Bl8GRwV+sV+mDObhLbGNGa32wrpeNUMI795pZZ
 VQ261YpFnPIo8qnFB4Mdv416A1ANTezU+AuZ2dqjfz0XZSsEALMDZE7fcnc3n5yDE7NI
 UL/w==
X-Gm-Message-State: AC+VfDz+p+b7SfUTZ6ogS5pJ/EBQKvD8wy/JL0MsVfIGwd31nVpmOSku
 LFrPxWDaszzT/h7kql+AK+R8Pw==
X-Google-Smtp-Source: ACHHUZ4cx4F0q2aBgA1kXEmiFrVY2oIHHctVd/EdZd+fb7DC1OKAWyz6Ls/a/OeQXeq5q1HFrW+jXQ==
X-Received: by 2002:ac2:5542:0:b0:4ec:9e63:6144 with SMTP id
 l2-20020ac25542000000b004ec9e636144mr1690875lfk.42.1683486459550; 
 Sun, 07 May 2023 12:07:39 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 f8-20020a19ae08000000b004f14ecc03f1sm755841lfc.100.2023.05.07.12.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 12:07:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 3/4] ARM: dts: qcom: apq8074-dragonboard: enable adsp and MSS
Date: Sun,  7 May 2023 22:07:34 +0300
Message-Id: <20230507190735.2333145-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507190735.2333145-1-dmitry.baryshkov@linaro.org>
References: <20230507190735.2333145-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable ADSP and Modem DSPs on APQ8074 dragonboard. The MSS region
differs from the one defined in the msm8974, so it overriden locally.

The modem is specified use mba.mbn instead of mbn.b00 (for the sake of
similarity with other platforms). This requires a patch for remoteproc
to be applied [1].

[1] https://lore.kernel.org/all/20230507172041.2320279-1-dmitry.baryshkov@linaro.org/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../arm/boot/dts/qcom-apq8074-dragonboard.dts | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
index 6b047c679370..c893afc00eb4 100644
--- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
@@ -4,6 +4,8 @@
 #include "qcom-pm8841.dtsi"
 #include "qcom-pm8941.dtsi"
 
+/delete-node/ &mpss_region;
+
 / {
 	model = "Qualcomm APQ8074 Dragonboard";
 	compatible = "qcom,apq8074-dragonboard", "qcom,apq8074";
@@ -17,6 +19,13 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	reserved-memory {
+		mpss_region: mpss@ac00000 {
+			reg = <0x0ac00000 0x2500000>;
+			no-map;
+		};
+	};
 };
 
 &blsp1_uart2 {
@@ -39,6 +48,25 @@ eeprom: eeprom@52 {
 	};
 };
 
+&remoteproc_adsp {
+	cx-supply = <&pm8841_s2>;
+
+	firmware-name = "qcom/apq8074/adsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mss {
+	cx-supply = <&pm8841_s2>;
+	mss-supply = <&pm8841_s3>;
+	mx-supply = <&pm8841_s1>;
+	pll-supply = <&pm8941_l12>;
+
+	firmware-name = "qcom/apq8074/mba.mbn", "qcom/apq8074/modem.mbn";
+
+	status = "okay";
+};
+
 &rpm_requests {
 	regulators-0 {
 		compatible = "qcom,rpm-pm8841-regulators";
-- 
2.39.2

