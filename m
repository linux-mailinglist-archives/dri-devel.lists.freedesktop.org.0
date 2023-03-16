Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9096BC9E5
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 09:51:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4536210EC69;
	Thu, 16 Mar 2023 08:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB36410EC61
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 08:51:26 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id t14so849397ljd.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 01:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678956686;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yeylFVo7UbFotxXKN5Jk9AW63WMsXe+ARjqLamdFW7w=;
 b=Z3AAdZzei69KEGBWwngVymIGtG0e2xa+U+6TbMOtWfK1l1cEV5wJ3Oi6sWJ2+TKL/q
 EhbRSkMaKzivAqA3RZWQnkPaHiOfK2UGbG7XX2LIL2jZ0m1zoDIBejQRIix5sOlIEWO3
 Lk5ajq/5dDxD6snISzP1DGsPSF+aKSyMSzV/0qaIp8v2bUJctOrfujVAgmf8YGpHVFAh
 TPw6v4TvssRhGP1vj2JBl0iLXDDdTxn7CAV1hmWLjlMD73AbTLWbzW7IGO1HAsNjGkfx
 jpKtSQrYiR5YMhj03+49lnFb+XsB9v5hB+i5F+FQIzD6kM+SvhdsIWn6pjl7bmyjs/i2
 gYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678956686;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yeylFVo7UbFotxXKN5Jk9AW63WMsXe+ARjqLamdFW7w=;
 b=K/i4GVEjzAKt5/AhsDsoO2re3RVxtoeGzJuF7twsYvCWbhUg2BoBCAMp7208w32klQ
 gNk5f1tv2bW5ki7ltcXb8Ghn1TXDUxp0PRHdvky11eru2pNfNrftWFbkCU1UGczhxqhQ
 pMviAauXNB/1HOKSwngB+C5lNgU5FzGtL4xycbIr0uRBGuBeA9fZufLpNl/2Kyx5Qp1F
 CIkAD6kDBMgJxK+0yUNoxZZZjbYw3Mb4O5xif4bqqLAMw69ZTyHfiWkoNFPTgStjvkr/
 RV+oJLBP0Xzxp+q5Or82KrKoPzukRL3833mZQ/ZGTXDHZS4DWp8Gcp7i0UcQ39teGxTK
 olxA==
X-Gm-Message-State: AO0yUKXOXQGZu+WOgUH5fE2fFKMN0CddPqb6dWDnpDSj4QkUHSduYGXc
 9dRtaGX0PBKWJn0+ZszJXqiDAg==
X-Google-Smtp-Source: AK7set/0NJerC8vUaJNQ2tyW8LwLWSp5G6DBTMCvwIABzlv+WcmetLF/tmCq3vX0+utRYHtmPqbJeA==
X-Received: by 2002:a2e:9c8c:0:b0:295:a96c:f77c with SMTP id
 x12-20020a2e9c8c000000b00295a96cf77cmr1644721lji.3.1678956686536; 
 Thu, 16 Mar 2023 01:51:26 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a2e730b000000b002991baef49bsm251566ljc.12.2023.03.16.01.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 01:51:26 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 16 Mar 2023 09:51:16 +0100
Subject: [PATCH v5 10/10] arm64: dts: qcom: sm6115: Use the correct DSI
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v5-10-9d4235b77f4f@linaro.org>
References: <20230307-topic-dsi_qcm-v5-0-9d4235b77f4f@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v5-0-9d4235b77f4f@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678956668; l=835;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=fTDJ/Pk/K83TEsz8nt+gatYoQ7InKrC5bjtKXy4Z9Sw=;
 b=6dVPWc6fouGLAtAlDaU7jHpfHzCJJY89FA5mqEAD5VXJxPTs5FZju6xUdRCpTHYgRqkK04rKeJ9v
 GWYlKOQLDjLJlUaQssq0kx9ZMu1bZssR7Q1yyKs82T4JnyTfzVY5
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
index fbd67d2c8d78..18c7eedff300 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1219,7 +1219,7 @@ opp-384000000 {
 			};
 
 			mdss_dsi0: dsi@5e94000 {
-				compatible = "qcom,dsi-ctrl-6g-qcm2290";
+				compatible = "qcom,sm6115-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0x0 0x05e94000 0x0 0x400>;
 				reg-names = "dsi_ctrl";
 

-- 
2.39.2

