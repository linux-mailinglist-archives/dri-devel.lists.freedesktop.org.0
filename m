Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 594E86638DD
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 06:54:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED8110E537;
	Tue, 10 Jan 2023 05:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC30F10E0DD
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 05:54:36 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id g13so16657569lfv.7
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 21:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jabBOsJuAOXz5E6THeGhybq8PYs1uczTB0v4S2evLMk=;
 b=h4RQqHNEfkj41nymtOI+D7jgMNy01AWBjtC1b8wD2De98Pof3DcabgU4VlfKWSLYVC
 5Pok6PncltK1wMh63eJ0OdcZWrMZ3VlMaGf8m/YmRLdNFdUA38MoXV/9sdtLb4ugg5cf
 g4IYKzHkmSQ+fma2gQaDR+nYIaYiLKZ94owYJdkk+9ZRg5DLU6kNkfqM3dt4cXbjjSW2
 aHd4j/gwKs6NeTAwX/OyODxIAKTDpH9qUySV1iGj4/qtA88RSPXZfFQQqrHYaaNPDEXy
 4UJvkxL8r4u2x8f9MgIVfTm7j796eDO+hxJIfe7oTKurU6sc1nSUGviYoDLbwENjsnEp
 O5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jabBOsJuAOXz5E6THeGhybq8PYs1uczTB0v4S2evLMk=;
 b=5v4vrzemrlMw1wm5EvMz8n94KTVreYl7VYUfmaqyFOXT8aUkLfCRkglBzY1JyMd0sS
 yDb5qphRd5pY05qRVBk4J9eWRo3NyC8MVBKi/vw7E+MYF5/yaELTGgrWKQ21tFJ7CVGt
 GOsURAxbzBZKSKF2sT/oCC/SKp+PETHK5my3+Ox+NX0QkJc3deSYFIMTRFglq94D/qtc
 JOdFozMRsWNaomJHLodE9V8KBdSg+bUlUlOKwadcPETyfmjErYGKMqzKRPoBsqe5uHB1
 ec+dehMviHYWxafvnxaA/yHwT3oM1f9RhAr6rb4tu4TeEucBHYstYD9knXY723BX9R1d
 vplQ==
X-Gm-Message-State: AFqh2kpmWCaFaTzCvUMWt3/ISgENpF84rv0CvFI79Q+3qMF/ia9tC1G4
 QzdzeoYledS3d77hNGmwm7X8wQ==
X-Google-Smtp-Source: AMrXdXv/efda3LfIKeTP9mZZ+E5CKIcJvbRv192lmiNh2BuVQ9hoOhuA7Gf/Cwp16+bWmKg2rCXl0Q==
X-Received: by 2002:a05:6512:ba8:b0:4ca:98ec:7d9a with SMTP id
 b40-20020a0565120ba800b004ca98ec7d9amr22111640lfv.15.1673330074947; 
 Mon, 09 Jan 2023 21:54:34 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 h37-20020a0565123ca500b004b52aea5ff8sm1987227lfv.30.2023.01.09.21.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 21:54:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 1/3] ARM: dts: qcom: msm8974: Add compat qcom,
 msm8974-dsi-ctrl to dsi1
Date: Tue, 10 Jan 2023 07:54:31 +0200
Message-Id: <20230110055433.734188-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Extend the secon DSI interface with the SoC-specific compat entry,
following the change for the first DSI interface.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 14737a3300d1..3c725ada52c0 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1686,7 +1686,8 @@ dsi0_phy: phy@fd922a00 {
 			};
 
 			dsi1: dsi@fd922e00 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,msm8974-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0xfd922e00 0x1f8>;
 				reg-names = "dsi_ctrl";
 
-- 
2.39.0

