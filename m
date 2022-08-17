Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC56E596969
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 08:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADAB10F426;
	Wed, 17 Aug 2022 06:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07A110F3C2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 06:21:07 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id e15so17841365lfs.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 23:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=f0ZUWiwp6O3VLep1SF30rju7EymJyHwt3q8Tihejmps=;
 b=JBiUhecfwE0OJ5ewX6RIWr8A6Aj/1U+4+9dQ/Cur4oCcoobtA5xAc1vnP9CiOi/r0l
 NzUjhyhUlqGpxoVqv1VR78+xCp/G4UErNTvMuxYFDaGi3gdgc29wz1VsKNVNBn+/QsNo
 Ycmy28yVzhYPi3s6tvEnMyHkPQHVTM7foiC9SwJheBEQN1rpeEfsT8KwUe1lHScdgKOF
 xcR10TnOpkO3lVdZjBgzWa1fsuY6ZOumd4yJvWZih4RzQpbSb/tiazD9vSZ6cuwATx0E
 Lo9BmPXFXwGUfQrGsPwclsoa1pwS63h4xODCN4MB4Y7yVcwFGksQDV0x4eIuq/xtSPMP
 1rtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=f0ZUWiwp6O3VLep1SF30rju7EymJyHwt3q8Tihejmps=;
 b=SV2P52SF0nJUXjg0JjNnczYJrKu9C45JnUf+odqJjfrqQv7kTtCSo50ngUDO6jHMfv
 ITGRP367BvNswFNOjULn5hmDtPjxTJgOL86NknECgBPL7IYeWRxrQvqt6BDUDQXWarDK
 Fs8gwacQeS353CMsIUMTNvDde126R6mFo/+ZHdWvH+T1dVM2MJE7mdcrK4KBcXFalILv
 WoKjsd9WbKao24yy9BKxcE3M6WArD1M5eEEvkGS/BSFwY1oYLhjTNVq4fY6KALVDSjrb
 jOckBmvEaG9IB59oojhOzOngaBPF0ZcI8HAO+sVk/QDaeR+BvdkX7vn5YVPlOy2yCWS9
 /U5Q==
X-Gm-Message-State: ACgBeo1jjzAX4iScdxlzF3dSBLFO1eek5D60vMtw5YGIMNQn7ojImn2s
 aHmdLbq06t3XLyCobknGnP0eZA==
X-Google-Smtp-Source: AA6agR7RhKLKTQRZcU2x4wPCfXEW3wfDR1kV3FqCuQgTvWFpQZM9cI2Jn3frwZjThfxYfhxQZFOhGQ==
X-Received: by 2002:a19:490b:0:b0:48a:f60f:aaaa with SMTP id
 w11-20020a19490b000000b0048af60faaaamr7890889lfa.364.1660717267536; 
 Tue, 16 Aug 2022 23:21:07 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi.
 [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
 by smtp.gmail.com with ESMTPSA id
 u27-20020ac258db000000b0048b0062a14fsm1581002lfo.144.2022.08.16.23.21.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 23:21:07 -0700 (PDT)
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
Subject: [PATCH v2 3/5] dt-bindings: display/msm: dpu-sc7180: add missing DPU
 opp-table
Date: Wed, 17 Aug 2022 09:20:57 +0300
Message-Id: <20220817062059.18640-4-krzysztof.kozlowski@linaro.org>
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
 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
index d3c3e4b07897..4890bc25f3fd 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
@@ -73,6 +73,7 @@ patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
     description: Node containing the properties of DPU.
+    additionalProperties: false
 
     properties:
       compatible:
@@ -114,6 +115,8 @@ patternProperties:
         maxItems: 1
 
       operating-points-v2: true
+      opp-table:
+        type: object
 
       ports:
         $ref: /schemas/graph.yaml#/properties/ports
-- 
2.34.1

