Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7805166914C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 09:38:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C35010E9B0;
	Fri, 13 Jan 2023 08:38:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED9A10E9BD
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 08:37:41 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id d30so27194342lfv.8
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 00:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vfkoFa2aWXIMsvEye5R5adifXz0BMNct0gxornememI=;
 b=AoAqetfS3RLSABRWAprBoSvGGLyiZySm4fIcetmApEPKeEHb9Xb+CUSZd4monuRWN3
 cv5N99BpPaHPXosXS9WhmAbXBtgyIC6L7RyZhzV6M+GmZW+viutz8TDEsm65YTurvDJo
 Q6uVHe5eaP+gbVMRA5W9XCvMdh9kLaJGWR12rzYbN7AA/pZbg41VnQDe0DvG1qpaCK4q
 jhhzqL6HhHAOspmYHEvbaBJQO/WeV+a8y+Ho+fSMtN5uzgyl+opY4O5iHAnor+MOSWcv
 /1Fmj7mfg4DW3mnCq5K23O+r30+VvXB3t6KNbSSTYgyAO3bJpoIqKUnwbwiNeB8LU/eB
 Uuuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vfkoFa2aWXIMsvEye5R5adifXz0BMNct0gxornememI=;
 b=CqO802guc22zCQnD9T6VMRzkbo1tfWzmIUatcJFhNa3DuAA90Hc4OgWRAuByPznTxM
 CBhE9JTJV/cA3/s/qRft7DTj8pqO1Vp08o+1k/Z+IL9shr0Tw1iDgDxyQvDMJnxMgyxQ
 FBXmcS8MfhGJ0US7If83ZRw0W0s+KBCr+GD44AmYF4w4zNILQWBXGxjje8cb1pUb8xBA
 WDkR23trPtIQclrQnbQUptk0YVQilmZutbWwIR7CDdVoOWwHPeUb2nt4MiokFUHiAofa
 71G3bJusGGvegEY9+zNlm2Bq4Mb6UDW+yKS9tijUhstCuT1PNpLKV6v1fum1JOB1SD0B
 7R3A==
X-Gm-Message-State: AFqh2koi9FZEsS9X57Bkyw2oKny+UZt6G5WWgoPEX5GhmK+hvRzWTI6J
 7r3L/EtoCsleW+GCLo/DxQflMw==
X-Google-Smtp-Source: AMrXdXv50Vl5IXHjr9MKDidF5CnW105R55HzZ4q3U0nm6Zs3daEjfdbXxBNi+8HL79VJDe0zZLBeJg==
X-Received: by 2002:ac2:4bcb:0:b0:4bb:8d56:d859 with SMTP id
 o11-20020ac24bcb000000b004bb8d56d859mr23664966lfq.6.1673599061082; 
 Fri, 13 Jan 2023 00:37:41 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05651205c600b004994117b0fdsm3748038lfo.281.2023.01.13.00.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 00:37:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v6 11/11] ARM: dts: qcom: rename mdp nodes to
 display-controller
Date: Fri, 13 Jan 2023 10:37:20 +0200
Message-Id: <20230113083720.39224-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
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

Follow the schema change and rename mdp nodes to generic name
'display-controller'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 2 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index e045edeb5736..95705703fe8f 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1493,7 +1493,7 @@ hdmi_phy: phy@4a00400 {
 			status = "disabled";
 		};
 
-		mdp: mdp@5100000 {
+		mdp: display-controller@5100000 {
 			compatible = "qcom,mdp4";
 			reg = <0x05100000 0xf0000>;
 			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 2e46a8b6bb14..3c725ada52c0 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1577,7 +1577,7 @@ mdss: display-subsystem@fd900000 {
 			#size-cells = <1>;
 			ranges;
 
-			mdp: mdp@fd900000 {
+			mdp: display-controller@fd900000 {
 				compatible = "qcom,msm8974-mdp5", "qcom,mdp5";
 				reg = <0xfd900100 0x22000>;
 				reg-names = "mdp_phys";
-- 
2.39.0

