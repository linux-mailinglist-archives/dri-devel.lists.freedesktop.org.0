Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE49B4F9E9D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 23:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8323910E681;
	Fri,  8 Apr 2022 21:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556FF10E683
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 21:05:54 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 o20-20020a9d7194000000b005cb20cf4f1bso6920165otj.7
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 14:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aV4gP9imWb5RV0sDAD5Q2cONnZ9+iBwKt8kNT5bBOgs=;
 b=EPNSfj2nSYc7mOIqFUv4NpJ2ph3jKTAr6r155GsfmKoMjl+mstddRpU/PdkCD+veSr
 RRmRFlM2YM1vcHvSJOD16KHHggz7wTKD4KnPt2wSVe8I+KLt7zb2acZz8sBiiVifWvMI
 89QabWBFFUOuxcNwBpwpcOj/q4R2tLjw14g37tshRqdCwtxB/jvy3JDhfQRlsjwaauYJ
 MeuOb0c1u1AeWs9lU8KrdCEdbsORexjiWQFpe3SkflxGFQn9vCsryZO1CPhC/nA/L64U
 nk/F3WpK5aV6MdVZ9roK+zUfKDksBpag9Xp5jN+0GPLtufE3lREvNi2WfaVfsjG+Fa9d
 xC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aV4gP9imWb5RV0sDAD5Q2cONnZ9+iBwKt8kNT5bBOgs=;
 b=JUR3EwUypKkDLhqdQX/yLaP/eCwscflbNQdCKjbrJCAuw8lFerucVz/0rMnL/JXjNQ
 xjFmK0PALFj4PFgFLCH6BaHabOXUW+b1jLG1hw+Bupd1CY3YdtfcfqaH1pPj+tBX9IyE
 qXn6me+Q/QzxWbt+4QY6XYk43FXFJJqhyfqfX4reA8QN5Iy7TGFFE43QT/x/4krcUEue
 1UBW2N/lByKbCq1WNZwT4jKSKHptjnOM6xwrFIjJIsx0UlqskyMc1xPSIp/iva9XVj43
 luEoz9SzfbGpvlv7ymlhyyDLU7TR/1a2uakbESg4VwHg8093V4ZgNiQqfV41yw9KxGLm
 DpCA==
X-Gm-Message-State: AOAM5328EN1YhUs+kg5yZc83R5YqOedBoCcSwiDQYZwK2Lw9KbL/vYJX
 a44EBSMjRCUx6aslKdYOiVipwQ==
X-Google-Smtp-Source: ABdhPJzHAUSFVblBCfU82rzxb0/OF2t7uWRv3V+7FZkZRXyvsJrWXXh9cYS+NGxmn7hZPw0F8IU1Tg==
X-Received: by 2002:a9d:6447:0:b0:5b2:35ae:7ad6 with SMTP id
 m7-20020a9d6447000000b005b235ae7ad6mr7240550otl.275.1649451953460; 
 Fri, 08 Apr 2022 14:05:53 -0700 (PDT)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a056871011200b000e1f5910d45sm6560356oab.7.2022.04.08.14.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 14:05:52 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 1/2] dt-bindings: display: msm: Add optional resets
Date: Fri,  8 Apr 2022 14:08:12 -0700
Message-Id: <20220408210813.581391-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add an optional reference to the MDSS_CORE reset, which when specified
can be used by the implementation to reset the hardware blocks.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Resending these two patches again as I put "v2" in the subject, even though I
meant v3. Sorry about that.

Changes since v2:
- None

 .../devicetree/bindings/display/msm/dpu-qcm2290.yaml          | 4 ++++
 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml | 4 ++++
 Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml | 4 ++++
 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml | 4 ++++
 4 files changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
index 6fb7e321f011..734d14de966d 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
@@ -66,6 +66,10 @@ properties:
   interconnect-names:
     const: mdp0-mem
 
+  resets:
+    items:
+      - description: MDSS_CORE reset
+
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
index 12a86b1ec1bc..b41991eaa454 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
@@ -65,6 +65,10 @@ properties:
   interconnect-names:
     const: mdp0-mem
 
+  resets:
+    items:
+      - description: MDSS_CORE reset
+
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
index fbeb931a026e..6e417d06fc79 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
@@ -64,6 +64,10 @@ properties:
   interconnect-names:
     const: mdp0-mem
 
+  resets:
+    items:
+      - description: MDSS_CORE reset
+
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index 0dca4b3d66e4..1a42491efdbc 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -57,6 +57,10 @@ properties:
 
   ranges: true
 
+  resets:
+    items:
+      - description: MDSS_CORE reset
+
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
-- 
2.35.1

