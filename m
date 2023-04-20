Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C86976E9ED8
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 00:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B8010ED1C;
	Thu, 20 Apr 2023 22:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E32610ED0F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 22:31:27 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2a8bbea12d7so9474291fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 15:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682029885; x=1684621885;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mgy1m01DsGQkO8m6umm6ha07ksFZFFo7FoVlVrv2pCk=;
 b=WleTIZCSyGhCiRH+O5xPdhKxDlRPx3jxmlS6I8zc9dTtPQpUulWszVYU/24DRXIWrx
 TyTAz2cSZSp77irfa2s+QuxXhWNuP98IAuNQitxIvEp38mNY9XkD35p01x86OBA+LoAc
 i5MIcTrh2faAd5zAh5V/TxUvUHDNNWldY5gwehCxA+JRZX4VqZBd4cK1ugV9It7/CJvv
 pOliZeCZjaF7GFwqPEzKbTIiwzzVMx2pbijbXlBRI6K97dU6vig21HP9b6E9NJwfDbXh
 cxWaja6+AcHhUqGiu498Q4U9M+zFrg/YvsKPH4LhYV3vTKl2TKKaAmBcsOqweKIYOAON
 1iuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682029885; x=1684621885;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mgy1m01DsGQkO8m6umm6ha07ksFZFFo7FoVlVrv2pCk=;
 b=Ng+5nrQDP2T1NCJTxi2L4mlW6bCtjjktsWgW584eqoqOpIfz17Hi4h8QQHXeh5JxzE
 UXJjP9+GdVlXvx/HUNN8+HnlyThq+6C9TPVxZz6gpSUb+83FaW/QLTZhGA777dIbk85e
 BCTG8TrFVOXxH0nYiejQcc4sdft+v0hP/apu1FGS0MQgliILxtAhsC5SRUYAzY2w+lKw
 j2Exib5Pgq3kg8wTOQxryUOjisJ/BGzHnFAi4xo8bf2C7ACURXkwzlTWkZkqYgfkWtnY
 rahcSBCUZ460h2HbYdII8oIagVKwDnsVwYHzElNOrOfCVbw0XybDvnJGvI9jZy0D8FJf
 qi7g==
X-Gm-Message-State: AAQBX9f9t7R8+TIyPwoo8cilmW7lZ1embx/ZmMli81V7aeF0l6jvvj/Q
 u+d/CCQrlrNDsxWHiqSE+DnDbN2A5oiiUxC228s=
X-Google-Smtp-Source: AKy350ZAf10TswzpeU0L8mqlrgrQZIW7aM7IXW4Y6tz+en9CcheCpNxhhVoVesxB41VU6Bo+G6fZGQ==
X-Received: by 2002:a2e:98d8:0:b0:2a8:ee05:ca1e with SMTP id
 s24-20020a2e98d8000000b002a8ee05ca1emr95726ljj.13.1682029884877; 
 Thu, 20 Apr 2023 15:31:24 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 w8-20020ac25d48000000b004eedb66983csm324256lfd.273.2023.04.20.15.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 15:31:24 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 21 Apr 2023 00:31:11 +0200
Subject: [PATCH v2 02/13] dt-bindings: display/msm: dsi-controller-main:
 Add SM6375
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v2-2-5def73f50980@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1682029879; l=1145;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=QlPpd+ksZO3I03gNbWxED0xzwfnGvYwQQWVE28vN1qo=;
 b=Tg+MM4R6Hq9ZR30v4XBrUBNZ1ekzX3I5GoPUGc3SFwD2ubk3y9GVml3+HBbWLW3rLJL2w+YLpVEq
 V8PlvA1pCze0dvkmYouDUIxE2ZfSWhXFOvvibcPr3IyU+rxq9Qyw
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
 Konrad Dybcio <konrad.dybcio@linaro.org>, iommu@lists.linux.dev,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the DSI host found on SM6375.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 6f367a1fabf8..f7dc05a65420 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -27,6 +27,7 @@ properties:
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
               - qcom,sm6350-dsi-ctrl
+              - qcom,sm6375-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
               - qcom,sm8250-dsi-ctrl
               - qcom,sm8350-dsi-ctrl
@@ -354,6 +355,7 @@ allOf:
             enum:
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
+              - qcom,sm6375-dsi-ctrl
     then:
       properties:
         clocks:

-- 
2.40.0

