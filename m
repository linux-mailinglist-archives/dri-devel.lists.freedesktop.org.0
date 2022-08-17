Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4191A59696B
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 08:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1CD310F42C;
	Wed, 17 Aug 2022 06:21:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38C610F3C2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 06:21:09 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id x9so12610977ljj.13
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 23:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=wA2XrQK8GobP+7+mFahAbX5R2GUCpHyA1dRW5wEOdPI=;
 b=hK/Rozp88H4rhDeZ+hY4Vhv7WUHpdiV8VqtypguCgSMbfbOG39z4PlqBBfIwqmytdA
 XRdn2S19b163p0zAowdILn0FyCka6+CzvCB9P4y00XRgjZTzeq4q3Zb/6Ez5mT8eWXAw
 H+JmiXtq6zcoRUFsPvfh9jSuXPXovPrHlqrjHrz1Lt+3aLdwJLk5HCGeQsxwxfA02kmC
 qpc7SGbfj3nx5zuuBUm7Norcpxzhqs9lDSiDeKyY1cCm56Ee0Dn86tNwa1r1EtiCoUxL
 T6kZK8IU/vESioX5i3/NUSmxOBDoYAbNwDjSJEaDCnWN9kWqsrZAVrsEhsdk4g/ZlTSz
 9pRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=wA2XrQK8GobP+7+mFahAbX5R2GUCpHyA1dRW5wEOdPI=;
 b=feKeJx4UIv5cSpTurz/Sc9vztf1Iy4bNW2XGdu6XOhFQA2+WErTP6qtBkb65LmwOsj
 2ZwZzOL4fCx6iaCCIzL3F7nVoq2fUcc8NFSDo4GQhr/1RnsQRYn1TNIY6KnUvpvRHZSc
 dFEoIhazufoRZiMkOxUns+9LM78mkc/1fQjTsgnjQw8gd8ny7us2M8mxsJckM/NUmVT3
 /je1GTXkGUdBg8MgrNHKs2tiFUHAfnc3eKFuQoDolQlJC4D63/GJw4PnIEwbQ/WZMC7C
 5691lhWea5/HmAJQYPL+pi8IhB2LGwZHf2r95Ijli2lQP0GSXBfsoZcZBQjhWZBK6xAB
 Dvcg==
X-Gm-Message-State: ACgBeo07ZQ/MG7uLQSWXk5kwOOTedBrGCo1bqzlBiNsTLKPiwCUIZVvm
 h3tSYu+AToKsoffxXl8Nd83XtA==
X-Google-Smtp-Source: AA6agR7EPsSNDenvWlk7mQ7+9HvJl9nFBJ+rv42B4kn2sy7EgcmK0pK6X2fIUsdKLahQuueV9Ndwug==
X-Received: by 2002:a2e:b894:0:b0:25e:cb1f:365d with SMTP id
 r20-20020a2eb894000000b0025ecb1f365dmr7440471ljp.285.1660717269206; 
 Tue, 16 Aug 2022 23:21:09 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi.
 [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
 by smtp.gmail.com with ESMTPSA id
 u27-20020ac258db000000b0048b0062a14fsm1581002lfo.144.2022.08.16.23.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 23:21:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] dt-bindings: display/msm: dpu-sc7280: add missing DPU
 opp-table
Date: Wed, 17 Aug 2022 09:20:58 +0300
Message-Id: <20220817062059.18640-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817062059.18640-1-krzysztof.kozlowski@linaro.org>
References: <20220817062059.18640-1-krzysztof.kozlowski@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The 'display-controller' child (DPU) of Display SubSystem (MDSS) uses
opp-table, so reference it which allows restricting DPU schema to fixed
list of properties.

Fixes: 57fd4f34ddac ("dt-bindings: msm: add DT bindings for sc7280")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
index f427eec3d3a4..584d646021d5 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
@@ -72,6 +72,7 @@ patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
     description: Node containing the properties of DPU.
+    additionalProperties: false
 
     properties:
       compatible:
@@ -112,6 +113,8 @@ patternProperties:
         maxItems: 1
 
       operating-points-v2: true
+      opp-table:
+        type: object
 
       ports:
         $ref: /schemas/graph.yaml#/properties/ports
-- 
2.34.1

