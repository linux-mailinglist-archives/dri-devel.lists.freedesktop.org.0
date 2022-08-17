Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DED59696E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 08:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D3710F434;
	Wed, 17 Aug 2022 06:21:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B889110F3E8
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 06:21:12 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id bx38so12602224ljb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 23:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=RfBVYdcgWCETO8kv58T7Yvcn1ctskhunxUupScfdMTY=;
 b=ydIHGt/P/asGeUFjJaMEu5NGac9v2aGsLucz96bXjD1yaKx9KvR+Yfvki1luQfNn0x
 aMvmbYy+qahOIUDUpMP3xKoe7fYugKzwX+DWhowMROOxAsXFWLy3CdpNZLqiXX97X/HI
 V4c52jbgI9uHNcWmdVmKJgEUozgd6BTn8VW/Ab6GfDuxDBzYi9M/JpX//fQ0Bq9ttthJ
 JekkFK0SBo0wTn2gwkkyZXDU+uUpcGNnaHJUwwzGBSPtfZZQXdBII9QDCWiJfn/taK/B
 KDsIru+Lgvu+toDRx+UTfEHMbLbaG/i6Bm+4Kp4Fi7US7cKbWGC2FqvD7YqjT77aeLGG
 cH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=RfBVYdcgWCETO8kv58T7Yvcn1ctskhunxUupScfdMTY=;
 b=ClPvBvL6u/O6c6ait02CuAMgFl+n2OTIPsworWlcm+j8EEl+ExCMW8o1DzuLkZr9uk
 TrXrKlSZcXgJLL6I3jjfffQCIqokuL7o27p2fb1CFh+5oJUOXGyP5g4DAM5uFxu8UZze
 X2JYBgLWikhh05+sA01m6JUR1mYTyx8/xvSlW91fi+9UxXXmm6MfCSy/GXUck4jt7v+L
 hPNOcHQUbzruj9zBsBhmF/hCeRVJnpstGVXnoz5wV98Vp4zAcwONvjW4B0BnAEwzbWId
 +yuuGEe7rDWwyfMhZOw085O8YasBge5m1czfuYQgEc4J2vLz+vBhoWDnzR1Mdnd9Mz7i
 WY1A==
X-Gm-Message-State: ACgBeo1NwjOavdp4TuPArcyGL9LWZqWeT5GnmzrAm8a79YdRrJwnoTfX
 3iloOjH1HskhX1/tlkf8SXJSbw==
X-Google-Smtp-Source: AA6agR4+FgNQRQuvaZE1/pe2oQDZwEobNJtZXGvgoiXBI2AAv7IjxeefZTGItBW5nCCEcgwemygMBw==
X-Received: by 2002:a2e:8092:0:b0:25f:f075:a1b1 with SMTP id
 i18-20020a2e8092000000b0025ff075a1b1mr6978448ljg.23.1660717270962; 
 Tue, 16 Aug 2022 23:21:10 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi.
 [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
 by smtp.gmail.com with ESMTPSA id
 u27-20020ac258db000000b0048b0062a14fsm1581002lfo.144.2022.08.16.23.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 23:21:10 -0700 (PDT)
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
Subject: [PATCH v2 5/5] dt-bindings: display/msm: dpu-sdm845: add missing DPU
 opp-table
Date: Wed, 17 Aug 2022 09:20:59 +0300
Message-Id: <20220817062059.18640-6-krzysztof.kozlowski@linaro.org>
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

Fixes: 3d7a0dd8f39b ("dt-bindings: msm: disp: add yaml schemas for DPU bindings")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index 2bb8896beffc..7d1037373175 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -65,6 +65,7 @@ patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
     description: Node containing the properties of DPU.
+    additionalProperties: false
 
     properties:
       compatible:
@@ -102,6 +103,9 @@ patternProperties:
         maxItems: 1
 
       operating-points-v2: true
+      opp-table:
+        type: object
+
       ports:
         $ref: /schemas/graph.yaml#/properties/ports
         description: |
-- 
2.34.1

