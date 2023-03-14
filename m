Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CE16B92F7
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 13:14:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9A910E798;
	Tue, 14 Mar 2023 12:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8462010E78A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 12:14:09 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id n2so19687959lfb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 05:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678796047;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lGx1EMDayEFQk6t13uD2RfqUM6dmmVIVZCz4JA+bL8w=;
 b=IN4D0dhP51J73AC928u7PSOGfbeunpdQGStVAt9h5TmeX5jLgf3jc1Qa/gy/fZK6Rf
 U3mpgQfwm38HPzsY9Kf4DkAURMJxWEP/ntbQh2a1JcyLFhj6Vm3wJvkuEoM2pVWQCaIn
 +zva7ik68sjGdrQknoMnLiCOfAsKWxN4VCup2pvRffF15G715iSxAn9py66tK0GdPipw
 2fo3Z0mzmvz7i1IBbTIg3MqJBGWhEYNlXspOnfr2nWwMOmidvMMkIeD8mlhIxvmBrSfL
 FAkd11d79Xw5O2GhunZCHWU3W82Xd127MAi/dVNmABpO/BWeTNQKleva78Sce9RdcCiw
 xT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678796048;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lGx1EMDayEFQk6t13uD2RfqUM6dmmVIVZCz4JA+bL8w=;
 b=WDU5tzeL++zcxTTLTgPbapkYbvfVCUdlYaq/R1F+t1fOiVFMUZu46+mZ/nOYLj3M++
 uspssQ6QtStk63+eEWOjhV/bPUBDxhiuqDCKj1Snn84G3dCkPRCJ5bAdGM9XlSLwt9Av
 5kdbT21wrSl9Aebu0MOqTv+m7o8fnfYT8LCq6FshwrvjYzIpjRuBfcTb61rN3sgOdbIE
 p3xl7smLd8gUkYypUoq7KQa7rZiUHBeXWaGAyqjJH4m7HH95tmQyqgTaszzH74Ur2pxQ
 WxP6K3IFfmterZCYhMS7vzCOUmgrcwen/8PVCzMphfHQ1J8meonE2QH6bqZOz1vtBkom
 0QHQ==
X-Gm-Message-State: AO0yUKU5X6u1MXbVBZiD+cgILp/mhsbOgVSBkQU8HxBLQa799UObRZb8
 9pVyWs2vqeltiwvNA0pd0x2dzQ==
X-Google-Smtp-Source: AK7set/x21eFLtkIzcXtSctCs+9iV+u8JWi6kLextIoc2FBRYXSouawHkM4p5diiyGBhkZyYNGsHoQ==
X-Received: by 2002:ac2:52b2:0:b0:4de:290:1c08 with SMTP id
 r18-20020ac252b2000000b004de02901c08mr648482lfm.33.1678796047832; 
 Tue, 14 Mar 2023 05:14:07 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a19ad44000000b004dda87ecae3sm379058lfd.246.2023.03.14.05.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 05:14:07 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 14 Mar 2023 13:13:39 +0100
Subject: [PATCH v4 01/10] dt-bindings: display/msm: dsi-controller-main:
 Fix deprecated QCM2290 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v4-1-54b4898189cb@linaro.org>
References: <20230307-topic-dsi_qcm-v4-0-54b4898189cb@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v4-0-54b4898189cb@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678796043; l=1083;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Eh63V3hQJ0V0iEgOzc+LSRnQ4e7sliZ5heAo7YfywsQ=;
 b=XMDG9U0mfUCsKS5AsCiZDdtg2eJBZV+LlYeluv9OhuVeZDwOILnyipcH8rhQ5vpe7w7s5pJr6Okm
 8HksazrxAkfaybhRRFNJiYHqx9O4IjbB8/c2u2Uvs5KlBv01G+6r
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

The qcom, prefix was missed previously. Fix it.

Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index e75a3efe4dac..2494817c1bd6 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -33,7 +33,7 @@ properties:
           - const: qcom,mdss-dsi-ctrl
       - items:
           - enum:
-              - dsi-ctrl-6g-qcm2290
+              - qcom,dsi-ctrl-6g-qcm2290
           - const: qcom,mdss-dsi-ctrl
         deprecated: true
 

-- 
2.39.2

