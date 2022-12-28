Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 587F96576D5
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 14:11:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05AD10E3A2;
	Wed, 28 Dec 2022 13:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5410E10E188
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 13:11:15 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id fc4so38224647ejc.12
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 05:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yIvj6CLKAGPbCzVViYil+tBlKneBu3LIA/3PrIIlxx4=;
 b=DRQ24GnDGTJCp91rOOPpd4MtC7ukbeiX4EMp7aaJqkpCm2c4YkEhnQWvzuFja3CjCQ
 xI8qWXKmegyowqhNcU0SRG6LG/3GTHzQVxYleWpeTMVFfvPr7egRzwtTTWtdAUS8KHRO
 szlcy8xQTiLOXFeK0pyHFjIIfvlKZynD1wkg68WL3IGYgSEl67eXeV9d/EvA/oEkJV/1
 GMf0IFUgvhrMLi2dGnhjqq2drvfm7x3zG1+No14q//ZhIWA14kk3GPU+MXbaNLB38jvA
 JNIql6COciiep7X4T8M1aFIBNsgChvXrzni5hhVsOsLBBV5BarNDFp4VFceKo2y4iE8s
 N6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yIvj6CLKAGPbCzVViYil+tBlKneBu3LIA/3PrIIlxx4=;
 b=1LjA/gqY1AQPF2CYFirj9kXoibITX1Bq53CmIqXa5m6I90d1eHhyeowupJ7y5FY/Q4
 5SkJ6QPJjgzvENlCePEs4eDFu8DIDIaMdQRqqhivo2Gzr7A5eW3etoVoiPYep/ltdaJ8
 zRGWsIxL03gPC+dLFf9qCX0P1SpB5qpqnQa3KfgQWO57gq8s6kVZN0StS/vbNqH6VWJp
 HIwyYemm730nWkqDL2bG3AvdStyVV/OHkyo08oZCvVTkNRqxung0xHauGKIK9AHfoxWE
 zxKGhmj7pyOoKus1OL3VX4Uppr5ChdiDkITiW7o4y4GVG24/dCfV8KnlJ5HVDH4ovKsJ
 uq2w==
X-Gm-Message-State: AFqh2kr2HKuluaEAP7Qg6tFxJxu43YGT1unHqpU8Xa3YCvuSI2orPt1j
 aU5rnx3A/3WwkM1EF0sdClpj+w==
X-Google-Smtp-Source: AMrXdXvpJhSvObvLScgLH6nL9n1cKt22C9piLD5CYaGNWqas2AZDzHDkw5CZGHCuOLlqJ7typZS3DQ==
X-Received: by 2002:a17:906:6b96:b0:7c1:4bb2:f62b with SMTP id
 l22-20020a1709066b9600b007c14bb2f62bmr21246963ejr.27.1672233073820; 
 Wed, 28 Dec 2022 05:11:13 -0800 (PST)
Received: from planet9.chello.ie
 (2001-1c06-2302-5600-85f6-04b5-1651-3b6c.cable.dynamic.v6.ziggo.nl.
 [2001:1c06:2302:5600:85f6:4b5:1651:3b6c])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a056402180b00b0046bb7503d9asm7099545edy.24.2022.12.28.05.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 05:11:13 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v2 1/1] dt-bindings: msm: dsi-phy-28nm: Add missing qcom,
 dsi-phy-regulator-ldo-mode
Date: Wed, 28 Dec 2022 13:11:10 +0000
Message-Id: <20221228131110.213116-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221228131110.213116-1-bryan.odonoghue@linaro.org>
References: <20221228131110.213116-1-bryan.odonoghue@linaro.org>
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
 andersson@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, quic_mkrishn@quicinc.com,
 bryan.odonoghue@linaro.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add in missing qcom,dsi-phy-regulator-ldo-mode to the 28nm DSI PHY.
When converting from .txt to .yaml we missed this one.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-phy-28nm.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
index 3d8540a06fe22..95076c90ea171 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
@@ -25,6 +25,10 @@ properties:
       - description: dsi phy register set
       - description: dsi phy regulator register set
 
+  qcom,dsi-phy-regulator-ldo-mode:
+    type: boolean
+    description: Indicates if the LDO mode PHY regulator is wanted.
+
   reg-names:
     items:
       - const: dsi_pll
-- 
2.34.1

