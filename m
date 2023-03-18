Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 982F06BFA76
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 14:43:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC09610E458;
	Sat, 18 Mar 2023 13:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6FE010E124
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 13:43:07 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id x36so7789907ljq.7
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 06:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679146987;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CSwnb94Mzw2MbHXtm3N1Had+b6g5bP1qhG7RvTv6VYM=;
 b=mp00CxlpC+bkTh9hYBnVlOXwYPkqGR9yuB8P+OvNJKo3xvEtWKUwHs4IbXFw2sX6la
 ToDNU237KBDMj6KmaIqeO9aslzfGjZ3LTNbygp4AfmbnKSJYP/59Li1NnlMKaVDCoN6o
 yuMqdUS24LTw5dsubgBUbhxgsjGZrBVBOnl+4JrLZevj8jTlfGpLWf68jaxhK9ZFWUpV
 45M2iXZ+O7ra0hU/QFhKImpMFaivn7c/Hvn2oIBOTv0aSIszNwPWp4smKIJyL2v4XgEb
 eSWP3IULXLWZR9w2Rn9g/1ZhGCgkVuwZZMGGvzkrxGKGHiGtho0t6wiTdjt9lJ0zoJM1
 QHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679146987;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CSwnb94Mzw2MbHXtm3N1Had+b6g5bP1qhG7RvTv6VYM=;
 b=TiFl4NIUSuXIh+rIIocT6pN0FQrb0xaOXJ+MJ6Wm/mHIGYN4gmqyiqf0Gf0Jhby+FO
 mUb4BItay11q0ie+TpmTbwM3Lg1ZARIYaiuhzzDj+0n84ict6o3zpEbEq0T6JdXLyRq+
 elNRdlDhIeSQcICeWOjaQzkYXbyaUX1FOlNJoMfjwcnM2bfXElP0B91v7I7MYQxtnDyn
 EInlS1xrFFs0Fl959OSoieo3sn+v4ZANtDHNuqx3P4btHi+MhbIk16Bdd8sNJxXHUtUz
 uFt5SoLYtpYbt2ipw1wUp/Vfx0fKef489R1P/GS9IP3SEN8eVa5oFGS2UvtvQClljGmj
 U4wA==
X-Gm-Message-State: AO0yUKUqRTFp1NQuoWe1dT7KLtD4yYbTZbRZ73G+91/ajf1byI8K30Io
 a9cFcxqcMc2BaFaNbNZNqeUuUykKp6b3jGhqFHM=
X-Google-Smtp-Source: AK7set/4S1W5CR/JHQZnR+6Nm46fF8jPG9ALj+09ucPpRDC2nMHbjBg9W9/P6bHYNoTP678GQbmbyQ==
X-Received: by 2002:a05:651c:1a0a:b0:298:aada:99a4 with SMTP id
 by10-20020a05651c1a0a00b00298aada99a4mr5427625ljb.15.1679146987411; 
 Sat, 18 Mar 2023 06:43:07 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a2e9d82000000b0029a0b50a34asm888367ljj.36.2023.03.18.06.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 06:43:07 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 18 Mar 2023 14:42:55 +0100
Subject: [PATCH v6 9/9] arm64: dts: qcom: sm6115: Use the correct DSI
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v6-9-70e13b1214fa@linaro.org>
References: <20230307-topic-dsi_qcm-v6-0-70e13b1214fa@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v6-0-70e13b1214fa@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1679146971; l=835;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=TG72yG+FHoBCa8HzTOP2m4Zz/u5EM4iUM34Xg+mUMPo=;
 b=bzqbSxqJTBt3yGqTr/I3zYIXTWAXpQidX0CBQfgCGzZ+rFCB5HSPDbOq402ijR1rZFTBnYyMjPUz
 RjARwgnNAENPj7dkUeSVXV4dYPX1hCJeWkZ7aO/8yBaQyyXt59GZ
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the non-deprecated, SoC-specific DSI compatible.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index c56738633431..fcf7497e8a15 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1227,7 +1227,7 @@ opp-384000000 {
 			};
 
 			mdss_dsi0: dsi@5e94000 {
-				compatible = "qcom,dsi-ctrl-6g-qcm2290";
+				compatible = "qcom,sm6115-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0x0 0x05e94000 0x0 0x400>;
 				reg-names = "dsi_ctrl";
 

-- 
2.39.2

