Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B249067127B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 05:13:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F8B10E66D;
	Wed, 18 Jan 2023 04:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27B010E676
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 04:13:00 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id w14so30631256edi.5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 20:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XixFfJqW7fWztjbCaUKdGCwc9XrR0sFINh15AHy3o88=;
 b=bXKU6XTtT9ieurvaDVda982TPoWPVwLPfGgMrGmIr3+RUX7uhaoL1IXd30pmBC/EeT
 T4o9xDSlFO+XRjee7e5ZW1tYtKZyXY5HmjmCueXu8AMYKHbFhKMSzgeDUzqtTOVoXhke
 jyb0OIZXAE7b9LQW1cozW2OwZ/Tf1kq5oXetYKLDc0mb1HwHL4zqy6FN9N26LNo/iCpR
 n4z8WLkAsy6fRrnu46ScykRUcohGdVhVcoFmgoxEfY26B70Ot0ENewCg6Iw8PCoGKXX4
 S9e3vDTn7KVyHCZFo+lbgLNKA4DO5Ic9xCl46TsRFv/gobFMbM3wnsISQOsFvMsMEZic
 Zjxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XixFfJqW7fWztjbCaUKdGCwc9XrR0sFINh15AHy3o88=;
 b=jm6t0ye5zOtWtkgmOvcGxd+7jcdD+MB8x5HSef+KobLJ3DQ+4VMbSIB0l6JNUBj8UR
 sGBHVm2A9EGsfupB/cF6v2ES5rIYBjEuFjnIij9d3PCWY4KxtNlyKqfiVRDU3KM4jh0l
 tqemW9VXVDxgqz8LvOGaTZ8G20V7D7lXoZUOAMh3GN7ks+dL5yW4UuAZ6ZnVPBwEc6x2
 MlBT015fUQtSMQh1sFrVpP5Sa30mhvVX/+toNP208Vzsr0S6KilSE+Rx4YphuCV2NcOr
 qb9XKqQJeIdIPXpwpNyj7bbhxd7UCNhFJT0HdGfsVPLBv9yjK1bS6pm8awkyXH/v/A4k
 pRYQ==
X-Gm-Message-State: AFqh2kroDJGZwTQnX5USQPfggNAHsJ9GxwSL5IhcoSXaCGaaFlAlixoA
 i+SOFxBgK/g2dWahn2Cl6A5RQw==
X-Google-Smtp-Source: AMrXdXv+phuCKBPJgXH6uF3amx3393AwEaVxAucehUBhtjYRdM2N1Wl3T1MiOAdSSQrVR1H9TUIWyg==
X-Received: by 2002:a05:6402:24a4:b0:49e:1f0e:e209 with SMTP id
 q36-20020a05640224a400b0049e1f0ee209mr8903454eda.10.1674015179135; 
 Tue, 17 Jan 2023 20:12:59 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 hp24-20020a1709073e1800b008720c458bd4sm2314100ejc.3.2023.01.17.20.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 20:12:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v7 11/11] ARM: dts: qcom: rename mdp nodes to
 display-controller
Date: Wed, 18 Jan 2023 06:12:43 +0200
Message-Id: <20230118041243.1720520-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
References: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
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
index ec0c526d0483..2879b29a109c 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1579,7 +1579,7 @@ mdss: display-subsystem@fd900000 {
 			#size-cells = <1>;
 			ranges;
 
-			mdp: mdp@fd900000 {
+			mdp: display-controller@fd900000 {
 				compatible = "qcom,msm8974-mdp5", "qcom,mdp5";
 				reg = <0xfd900100 0x22000>;
 				reg-names = "mdp_phys";
-- 
2.39.0

