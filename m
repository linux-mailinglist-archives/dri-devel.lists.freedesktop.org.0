Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9797461F6
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 20:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7AA10E22C;
	Mon,  3 Jul 2023 18:16:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BD010E221
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 18:16:06 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fba8f2197bso4233755e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 11:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688408164; x=1691000164;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rfbq0gETnI1sgMFmbHrdDFl/8/rFlwdeWeNPy1LZMAk=;
 b=DyUggfEIdkP+zEhWECWn3vTa6gXyOFU9JIQ7hglnUTo1f7fQ6ekt+EV8pgkAYM+Jqf
 kRzL3Brc9MwA3lln/K4xWNuIBlLrkexczZhd4mDKkAia9xe1A0tjxADUmYDSBPqW6d1h
 E7DfxqSpDMkQArzT4/AgXRfTkfg6yNSjRXgwf5fRlrOQrX5dxkTriCF+VBzWjYO9rSv4
 X0SFrTGjs6zw3vDh99ytBEL/MoD5M6TMlizOm7DUR031HFbqBPK+g9gxKZVEqnMPCoZP
 vIJahMZv/da1p+w0+idh6HtVbiJ6uKZhmGLaZGrBChoJW0HSNJdmF+VNGJUDXewvyvZL
 RqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688408164; x=1691000164;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rfbq0gETnI1sgMFmbHrdDFl/8/rFlwdeWeNPy1LZMAk=;
 b=k2Do0nFpWnzaljYBLAIYPQt3v6gL+lREaH69OUaf4ack99V103KXmOlQDQFhfy1jiR
 QjingdiF8gR/K2NxNHLyqjwZeTKDZfLL2An9DEV6v8hGvYt9IKLHMCiX65T1qLvSUSL2
 xAPxaVJLyARLA8N7+1JqoaJwsevwap+Ovajzi7IbkS7H+PJDUdm1ADPmLfT4VLjO/yR8
 Xox8jcs76HHp7XHkX0CxTfYYIf7VaQ1vpB1YZts/0mwETV2oy8sqC3Ogn7yOFTGvf2YH
 Ot+UHxQAWR46VZ9Hm98mI7uIboehQKWFYeSAL53XR4gOlCOYRtVwbSwEmLYTHRmxqISB
 9Anw==
X-Gm-Message-State: ABy/qLaN1KXvR0Kz6aMbFmswfyIDm2xYfEcVG1XBdCpll7AmVTiIJfNP
 waUex2RI+OxyI8/5XIB/ubJdYw==
X-Google-Smtp-Source: APBJJlEd6e6YYV2peNdIjMzoqqPTLL2+ZbtH8QHhIBO9CiowXKyJWLK4BqfjRZRngtj72+4U1C1Ubg==
X-Received: by 2002:a19:7418:0:b0:4f9:5d2a:e0f6 with SMTP id
 v24-20020a197418000000b004f95d2ae0f6mr6907671lfe.14.1688408164399; 
 Mon, 03 Jul 2023 11:16:04 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a056512390600b004f1383d57ecsm4633034lfu.202.2023.07.03.11.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 11:16:04 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 03 Jul 2023 20:15:56 +0200
Subject: [PATCH v3 3/4] dt-bindings: display/msm: dsi-controller-main:
 Allow refgen-supply
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-refgen-v3-3-9fbf0e605d23@linaro.org>
References: <20230628-topic-refgen-v3-0-9fbf0e605d23@linaro.org>
In-Reply-To: <20230628-topic-refgen-v3-0-9fbf0e605d23@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688408157; l=960;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=UEARP/nzfff11sHWpuDiJ7VAKYi5TYY87h31tjxPZWc=;
 b=2TMqshCBAOBb1jGz8NS6X0REmrqcs64ytZcs8i+mMynKuIQDOWTOhDG/OmtTBPmumuHXIAZkK
 nMkhkBhtndwBN90jKKlwxo8uAZAwxLRYbbcbgtS0ZfB+daC1S74bqu3
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
 freedreno@lists.freedesktop.org, Konrad Dybcio <konradybcio@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DSI host needs REFGEN to be enabled (if it's present on a given platform).
Allow consuming it.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 01848bdd5873..76270992305a 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -166,6 +166,10 @@ properties:
     description:
       Phandle to vdd regulator device node
 
+  refgen-supply:
+    description:
+      Phandle to REFGEN regulator device node
+
   vcca-supply:
     description:
       Phandle to vdd regulator device node

-- 
2.41.0

