Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 028EC80CFE8
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 16:45:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C9EC10E495;
	Mon, 11 Dec 2023 15:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3BE10E477
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 15:44:50 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50bfd7be487so5215645e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 07:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702309489; x=1702914289; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MEK43V9yIRVqJnm4P3NZA5kYSX3VWqUkzCX7w77Xo/Y=;
 b=ry/YP1p+13RZFOoF00mZvBBjE8rpG572fgjv4dI+SoBSA4vzbY6SJdbxKO0tb7VCdK
 8WKw4Meyb8BAm77mIZVMeoxv6ouIHEZF7Oehv8BYGhuCqXhu9YlSiBu9TqwAWfUf7wmV
 mxWgvII4EK5IO8g4jQhj0nJGW1Kj+rhWMnKnngE66Dox5pongQXYIGlCwoZ1aNJe4szS
 awZD5lEfmMJ0NdCETPNjCpJpayC3yPKbII31ASm/iIR9XDAP6BI6lSnJzK9InZ10hfY3
 O1EKQV9C2OSc6fMVLtayijppUFHpIMbW304IDLOM6x6hQfd1UiMK84VbL1k/F9LqChwF
 wA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702309489; x=1702914289;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MEK43V9yIRVqJnm4P3NZA5kYSX3VWqUkzCX7w77Xo/Y=;
 b=UsheQQxjxMEh7WL+h3BtaS72GOF8XwXnt+8JL27mcDmwcoxJhPq1+5HiMZLdjzP9iy
 ED808Qcy3dx00EUfoOA6AMSmCw0v7Jqdz8DzauKMoGjN4QLWpqbWoKtmvNtumqY2SrF5
 5a2aJlRinTtH1K+jXSqrRfSfIAjMhpkVUC7C0TLArHEJE/84Ade9Q47ONspPOi7qD7qQ
 tag3P8DzGVg4G7gbZMruqn1cl1A303goYh7jIxL3tmcuDVuu9sIZYEWci8MmVql0lcuK
 2Yaymekr/NDdoFSRTEQQx7n2tEwfD9PIpmwGcAdidRNPwVpquX+JQplFUsjvV+yMo9NC
 Kk1g==
X-Gm-Message-State: AOJu0Yzr5BTd/mQBC43kZxMySEDn4fF32KBdkVtf2UZ1ohxk7N8V1GBe
 Vk9pbjsPIALvxD/OGYPQnOU7AA==
X-Google-Smtp-Source: AGHT+IH9/Y+1gcwCpPn7xa1mzp2YcdXrFEVyvR6Ns3iDEf9MbtKQDoXsa3ElBa3w9w2aGvcdxQULAw==
X-Received: by 2002:a19:690e:0:b0:50b:f268:7ed9 with SMTP id
 e14-20020a19690e000000b0050bf2687ed9mr1865801lfc.124.1702309488635; 
 Mon, 11 Dec 2023 07:44:48 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c5-20020ac244a5000000b0050aa6e2ae87sm1109646lfm.2.2023.12.11.07.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 07:44:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 2/8] arm64: dts: qcom: sm8150: make dispcc cast minimal
 vote on MMCX
Date: Mon, 11 Dec 2023 18:44:39 +0300
Message-Id: <20231211154445.3666732-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
References: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add required-opps property to the display clock controller. This makes
it cast minimal vote on the MMCX lane and prevents further 'clock stuck'
errors when enabling the display.

Fixes: 2ef3bb17c45c ("arm64: dts: qcom: sm8150: Add DISPCC node")
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index fb41f91cefc6..153c531c1d41 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3925,6 +3925,7 @@ dispcc: clock-controller@af00000 {
 				      "dp_phy_pll_link_clk",
 				      "dp_phy_pll_vco_div_clk";
 			power-domains = <&rpmhpd SM8150_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-- 
2.39.2

