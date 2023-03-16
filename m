Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE41F6BC9E1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 09:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD8D10EC2B;
	Thu, 16 Mar 2023 08:51:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0006710EC2B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 08:51:24 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id z5so840371ljc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 01:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678956683;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0GttnUpSMQrNUPBOzshROVp8f4Y5lS6s/EI+l80bqFw=;
 b=kor1lxAULsgXkpl5n64+yKp3HEn3UHihlasLo4LG+IOiKjqo1qtzr1e5I/ghTBAylY
 BCoZPVTDVpOVOWIbDNddIMYOAXk6EEyYrsFqKaa5+FnmIJhNEuurv5b0RcODOjjXuDN0
 PM2JSV7/QYTIVm85BHodt4ikndfKKD8HBosxsc1RGNfLC1O9dVl2Mn0c5CtGjgmK1kOF
 fHTtwg6SBZkgxtJtbReG5xwaoMzywUUN8BhqF5vrpxWZnTfNlaLGR9dO5PmKAG+QieFi
 QD5f71lxG8Ou3wJL/5WHhlZUbech32UsOKsG7bVeGODz300d6VYJ6SyiEWRmVBwgkMmE
 Qjrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678956683;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0GttnUpSMQrNUPBOzshROVp8f4Y5lS6s/EI+l80bqFw=;
 b=fUy8FTVb4iC8CC557397ClwBdIAcl/OvjGkDswqBl9Y+/dw8j/9MRLP+LFoGUGEljT
 DaGpGmyVq+trHNcZHRjAQ4hzRmn0kw27Z8WBJmY64xEfXX5Hkv1xzkdrg78NBhY/fgJm
 h6OL9z1OtxYIm7VCMnvR0r7odqfTKdqbv6m0l4TN9fAicAhnSDCD6EN955GrdA3jweQt
 kNupFdrEdwmF+clejAk8aW2SeMOZCIdgULT0SFrU6EXUfaUgotSnfNSukHrKjeT54M0r
 z0livUrkNtsPGilRzYarGTNcer4+pwivhaOUxRse1UCqYoYkDTK7Jw1hCsKaElCJ9su5
 xd8A==
X-Gm-Message-State: AO0yUKXdz0ELm5mgexAWgUi5NV79X+NwIB9yIc3nnKxxW41yPr5Rl/FU
 RcBEJ+cKGXswexrCZDwI8hsqDQ==
X-Google-Smtp-Source: AK7set+Auq5+dK5gJxeZ4K0r+SZ3n9ajfcsMSJJWCPkouivw5kREanh325/ho0hHzItRpdsZj7o0LA==
X-Received: by 2002:a2e:b81a:0:b0:295:9d32:a653 with SMTP id
 u26-20020a2eb81a000000b002959d32a653mr1892728ljo.35.1678956683403; 
 Thu, 16 Mar 2023 01:51:23 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a2e730b000000b002991baef49bsm251566ljc.12.2023.03.16.01.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 01:51:23 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 16 Mar 2023 09:51:14 +0100
Subject: [PATCH v5 08/10] dt-bindings: display/msm: dsi-controller-main:
 Fix deprecated compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v5-8-9d4235b77f4f@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678956668; l=1378;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=gFmAP3VKT7x6AjOlQ5QOdQrgbA01mNjW7lXWqOa56r4=;
 b=/UpSuxnKnArcV+HWoUWDAufdkfQwfpnaiqHNzcClp4+YCDcXHujpQWA5K/0h66dCKLiARD8E1ApW
 NmjtaJn1A1mPgRT5NzHJaiJqjVVNBs64JEninpB86VDW33G3VRwB
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

The point of the previous cleanup was to disallow "qcom,mdss-dsi-ctrl"
alone. This however didn't quite work out and the property became
undocumented instead of deprecated. Fix that.

Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml       | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 2494817c1bd6..ecc89011bec4 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -31,10 +31,9 @@ properties:
               - qcom,sm8450-dsi-ctrl
               - qcom,sm8550-dsi-ctrl
           - const: qcom,mdss-dsi-ctrl
-      - items:
-          - enum:
-              - qcom,dsi-ctrl-6g-qcm2290
-          - const: qcom,mdss-dsi-ctrl
+      - enum:
+          - qcom,dsi-ctrl-6g-qcm2290
+          - qcom,mdss-dsi-ctrl # This should always come with an SoC-specific compatible
         deprecated: true
 
   reg:

-- 
2.39.2

