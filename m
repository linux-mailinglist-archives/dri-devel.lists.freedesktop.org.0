Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A32856CE33
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 11:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1EE10F841;
	Sun, 10 Jul 2022 09:00:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A07A110F1DA
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 09:00:43 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id a10so1223795ljj.5
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 02:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bs8QcdQy1djDK+VwdSiBURhhZ88rl9ZJFN4yb8iwpTk=;
 b=Z5xFyCHBCVYLY1mZfAZfsU5c6pkVZ6MlPczZS71RWrQtF7VcFHZWX+qWZQOndLG8gU
 /QDhAD750LzOVIsSMGx4baiRCUGNJ+eg/BNDKDTmrVbr6LbavUuG0Mw7pl/sF4IS5K5s
 WINEfm+3j8naAu1BDaM2uc1fGxE4hPH+85YzKm9Vl0HvcR+9H0/UrjOz9q18mH0f196y
 Ti+/Nn4PikZKK3HJF3xBiRd6pODr3wESjRBH/sN8LNTbFDZE5t1Xza31PouWU5HT4z+A
 BCFTzxgiuG6mhXVT0km2NOm58Z+WVrmhgiZMGy2bddifwdDYpIC92W95TnPXLGZy+w7m
 xggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bs8QcdQy1djDK+VwdSiBURhhZ88rl9ZJFN4yb8iwpTk=;
 b=wbttcrIyFT0CZWo5F2z1QJTt2PwwFOa/5wjF/0CQvfj8VcjhWzRFJVyT0sdL/uxhuk
 3uLPt5qZY/dn78cDK9yq38LBV3Lr4va0opTcxYeLPcyIu5IA1WL1LY5KlSbCFcRgawJH
 T7oZ2OFn6lB5+b7ha5lZPnIwf/5A+RfGuzGv75KmW8xCW4L+rqntSYB6fjsdi/SLIUG8
 z0arf5ByMr04MefC2riXdp74fBeynhhSceXx/Hrk0wuVoyIbpDtEFaIXYkNQR4ZxNkxq
 9Tz2QnrW4iv2dEClPmOhrdv1jSV8bJofA3k+6bR9SkV4MT3sAGk3EdOcOG2bMFkd7Y/X
 7y4Q==
X-Gm-Message-State: AJIora8s7d32nuVZPSPDPjhKxiWv928+0UdY4AI+zXOOYWfZTsW8bIFU
 LQqmRLZjqj/vTErubrjRsSOJIQ==
X-Google-Smtp-Source: AGRyM1vAAXRUW/u9eNMC5CQ2DdLm7LWjiipCc6GIG3Ei2jlPeO67YClCuNTtwAwSpvGfp3/lv9hZ7A==
X-Received: by 2002:a2e:bf20:0:b0:25a:45a6:7587 with SMTP id
 c32-20020a2ebf20000000b0025a45a67587mr6997088ljr.377.1657443641951; 
 Sun, 10 Jul 2022 02:00:41 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 u16-20020a056512095000b004896b58f2fasm822881lft.270.2022.07.10.02.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 02:00:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 01/11] arm64: dts: qcom: sdm845: rename DPU device node
Date: Sun, 10 Jul 2022 12:00:30 +0300
Message-Id: <20220710090040.35193-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename DPU device node to display-controller@ae01000 to follow the
DPU schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 32ad5972a642..7c66f490e822 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4265,7 +4265,7 @@ mdss: mdss@ae00000 {
 			#size-cells = <2>;
 			ranges;
 
-			mdss_mdp: mdp@ae01000 {
+			mdss_mdp: display-controller@ae01000 {
 				compatible = "qcom,sdm845-dpu";
 				reg = <0 0x0ae01000 0 0x8f000>,
 				      <0 0x0aeb0000 0 0x2008>;
-- 
2.35.1

