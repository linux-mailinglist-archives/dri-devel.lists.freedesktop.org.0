Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C1659696C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 08:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE4710F3EC;
	Wed, 17 Aug 2022 06:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F7B10F3B5
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 06:21:07 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id x9so12610873ljj.13
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 23:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=HuUejYNqu/N+TiW6kMozoGOD+NSY1oswFg6/0Xs13h4=;
 b=pJZ5DkZNYpXuOf0hXNbcS+yS5hzdq8E3G3TAJrXcHys1iE028QcgupnJeumvo9U8JT
 BIPbWlwAh8B6r4bo9HF0Q/a5z5+bqr08zPZs/1RcMJsUeAtjQv0tpwkzvVVs7YOVew+G
 Q1y1eb7JGq5dbsPsE+hN0LKyu8+zzshtmW4bnQXBXHsezunX8KcAUmMIKehQcpgQnyBt
 ek0YpOIj9eO69sx91RPaCQ2PdxOvRjAwKVwjKSsYqB/4hs8VuNqzip1NsvIjTBCw/EPz
 i0RJfcNAVTuuuww+4aief+QOlTGmup0jVvQycB1LzoVCjNAD7Kk8R/vULgNOJBzB9xPV
 /lmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=HuUejYNqu/N+TiW6kMozoGOD+NSY1oswFg6/0Xs13h4=;
 b=vQSw+y8A0wv2pGu/GLCn2tY4PaahTybWu2VctDKUyNXQN63D6n9wY7jthrhBjaJn6w
 SwzD8opAGvfTVz7tDSlEHyPCwS7YBggdbVEarBp30uA7PxqHI6hIkZWfkAKTjhDFUIgk
 TtMeSBz6W7YvkzZXPIBNCiIdyxdJROGDExwfOGgDz6mntHECrYYOXKIG2qBIf2sf6jup
 Wq6ZDax8cpNQIaCBZFSr7jP4/i4oW5+b4Fcb/Ghlb97pWvXaQ2DJpwxcHqNx12LpPG67
 MG96D+3bSZDRjQzJSbNeM2lGxXblZ233H3Qc065xPtHFNxEAlopbgjG3xn18HpmZKSf+
 7MpA==
X-Gm-Message-State: ACgBeo1pQycaCzwdgeKy7xvZ/8ZevrGZ8QxmQ+AuqnNTbGtE2qRgRq0e
 7kZCmGc4Bu8kuFyI3Ta7eqLWsg==
X-Google-Smtp-Source: AA6agR6nP7zaIPS/O5c2eBWMpn2WzYmM8t4kMy8yV5jHzQmK5zD5FSzUNorUJeKyo34f7WAW0a146A==
X-Received: by 2002:a2e:904d:0:b0:25e:78dd:62f9 with SMTP id
 n13-20020a2e904d000000b0025e78dd62f9mr7380939ljg.122.1660717265839; 
 Tue, 16 Aug 2022 23:21:05 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi.
 [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
 by smtp.gmail.com with ESMTPSA id
 u27-20020ac258db000000b0048b0062a14fsm1581002lfo.144.2022.08.16.23.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 23:21:05 -0700 (PDT)
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
Subject: [PATCH v2 2/5] dt-bindings: display/msm: dpu-qcm2290: add missing DPU
 opp-table
Date: Wed, 17 Aug 2022 09:20:56 +0300
Message-Id: <20220817062059.18640-3-krzysztof.kozlowski@linaro.org>
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

Fixes: 164f69d9d45a ("dt-bindings: msm: disp: add yaml schemas for QCM2290 DPU bindings")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
index 734d14de966d..c5824e1d2382 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
@@ -74,6 +74,7 @@ patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
     description: Node containing the properties of DPU.
+    additionalProperties: false
 
     properties:
       compatible:
@@ -113,6 +114,8 @@ patternProperties:
         maxItems: 1
 
       operating-points-v2: true
+      opp-table:
+        type: object
 
       ports:
         $ref: /schemas/graph.yaml#/properties/ports
-- 
2.34.1

