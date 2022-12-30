Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 433386599F1
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 16:36:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3AD10E19C;
	Fri, 30 Dec 2022 15:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E4510E445
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 15:36:19 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id l26so13813139wme.5
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 07:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yUZ4tH5NR3ShWZI1wP6dN+Rtb/3uNAvjYHh4qP5xPyE=;
 b=FuUdHcpUYQ9YPPxX4SKwXxQvofU88zGqyShLAyTMeaKmnILpPJQWKjaD9YxGKVrQcV
 W2hIH79me7FKOF8/Y1SB/koRnyad4gOnEl7UQkCVKXSw1RTi28RHLKhZ9jsnlh9QFU3y
 lK7oQ/5Ic27ki8095V8Cthvy3rc90ovibaN471dl1lcBjRDnU9rafr4zITjqECRkuXxG
 6nJmbXYELd7+JuPC1G8TIx7GrtYlPLYEKVppT194T61kc35ThguwFQimR+PMNEsMpbkB
 ETj8IXSQCPjYdwH17YFaYu9c5k/I+qVRuYwEYFYq+9Wgw4lHHF+a4PXwaHkdRCzuLCjk
 Trcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yUZ4tH5NR3ShWZI1wP6dN+Rtb/3uNAvjYHh4qP5xPyE=;
 b=gNXODrzzE0+Y4JyqTKbGoYDtwPZV3T+BTO015HuR/LAQPcZ8XaoFK6EGuhsrnHpvs2
 Qzg4mMmnExCeKcte+qQXfp63TLO0APK11MFlcxkpKmBm3ZrJ0m1102V3LmfskvFNR0Hb
 ZDMlX8SG2Vbg9bYUlpZQIRl7YH0Rf8L1VSzjpD8fd/SeA3f/dLcan18OpqwZv0U9rzQf
 5jJPkpPeIw9IX6mbdaDzO8XUwdUWduprKBHyU++P33RR8WaFiNXzFHeL0qj+WrKE35pZ
 ZeDGtLPvKoZNFfII5vM1zOZPfOuYhJs+gMtpyIncImllwwt0UCI3ALCyIwOEP0hHDDnL
 jlJQ==
X-Gm-Message-State: AFqh2kroQqCYv9VSxOmyztyTfpHFsH5ukNNFc01F3q8pcV4RBFQNmWuI
 2x2E4NxRXW3jO6DcJ//BJ8anxg==
X-Google-Smtp-Source: AMrXdXusPgecTGP7fZw7vXdt4tF+S4NwgTctVJuFf4pxyAgs9zjLTxk3FWQlnp0PQZM4bfCkaapj4A==
X-Received: by 2002:a05:600c:1e10:b0:3d1:f496:e25f with SMTP id
 ay16-20020a05600c1e1000b003d1f496e25fmr24402994wmb.16.1672414578700; 
 Fri, 30 Dec 2022 07:36:18 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 l42-20020a05600c1d2a00b003cfbbd54178sm49857993wms.2.2022.12.30.07.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Dec 2022 07:36:18 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_jesszhan@quicinc.com, robert.foss@linaro.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 vkoul@kernel.org, a39.skl@gmail.com, quic_khsieh@quicinc.com,
 quic_vpolimer@quicinc.com, swboyd@chromium.org, dianders@chromium.org,
 liushixin2@huawei.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org
Subject: [PATCH v4 10/11] arm64: dts: qcom: sm8350-hdk: Enable display & dsi
 nodes
Date: Fri, 30 Dec 2022 16:35:53 +0100
Message-Id: <20221230153554.105856-11-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230153554.105856-1-robert.foss@linaro.org>
References: <20221230153554.105856-1-robert.foss@linaro.org>
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

Enable the display subsystem and the dsi0 output for
the sm8350-hdk board.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index e6deb08c6da0..1961f941ff83 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -213,10 +213,32 @@ &cdsp {
 	firmware-name = "qcom/sm8350/cdsp.mbn";
 };
 
+&dispcc {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l6b_1p2>;
+	status = "okay";
+};
+
+&mdss_dsi0_phy  {
+	vdds-supply = <&vreg_l5b_0p88>;
+	status = "okay";
+};
+
 &gpi_dma1 {
 	status = "okay";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_mdp {
+	status = "okay";
+};
+
 &mpss {
 	status = "okay";
 	firmware-name = "qcom/sm8350/modem.mbn";
-- 
2.34.1

