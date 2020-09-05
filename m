Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9298E25EA33
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 22:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E0F6E2D6;
	Sat,  5 Sep 2020 20:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A0B6E2DD;
 Sat,  5 Sep 2020 20:05:10 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id k13so719801plk.3;
 Sat, 05 Sep 2020 13:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RI73hAm8taFHglKyL+fRjHiZ9E+te2SePrFdWbpImkA=;
 b=vcwVx61Pt9UhOQmiYEavtCbKoTKImHwiu+5jNHRaBSnjLI1sdwRkCWJV7Ec4krDahz
 lc+nmsDR6BxsvxOcXYoa1f00LwwOFO8ueOqgYAWv9LYJ6smg5RbifVEIzOgln8l3P/l1
 kxjB3AO/QbVXPZ4QDZ/L9rWZYPKkOqi94fVEADu5b5L08A3T75RNv0g8OHkw6+OVZXQn
 FZYfZfboXk3lS0zsdJbCw4Bb/18UXsxjbCWTj5LgU6LVp65iJ8gZvtPHviCUsWPFJstF
 dLaCPjABpEIDLYyxFhuGouemYzSkTEMaicAUMUcUcFsAakPRpDHPxT1f20D+zjUnlnNP
 jLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RI73hAm8taFHglKyL+fRjHiZ9E+te2SePrFdWbpImkA=;
 b=f1R4lYg3GoPDpUGkSUXH7KFcQDDkzwJ8ngfLyaCmxaJuqMVtGCRLlyjABWTbjAmpFN
 jbmHh375PLrZVcY2fEdni8e/GoEcfdk14y6EnlET9xzO9YX69UILAoe4m4lmKLRj29gh
 uE0N0yO+VTcl0k1Cw+VbHPKBXrYT0g1qlm4rbE6Htg3hTC1NDhZoY5vm4vBoV28nSb3D
 XwRr5XNCWgO/0aMqIMxFpI5/PPDfArfTDny3oAGYFZhT5q1qnVrxhEXCChalWUFQBZie
 rt7WSfaCtgIlyAq0bOqxmEy9BsNlI+ez9wApzXh++wfznV40kW42MgMMYmi3fXTxbmD7
 m94A==
X-Gm-Message-State: AOAM5303qSdXrmH/pxGXDmu/ekM3qIJt7sN6mRZDs1nj6iptFyskFSOC
 FOFlBXBE1yA4ca4LoAXwLkY=
X-Google-Smtp-Source: ABdhPJzMiqoqztwMnULjxDUjTNS0z8BEMDOuI3DDlzgg2GpvsRIBIOXD8OIwXo/hNDfPqheUam39uw==
X-Received: by 2002:a17:902:b092:b029:d0:89f1:9e2c with SMTP id
 p18-20020a170902b092b02900d089f19e2cmr12189283plr.8.1599336310134; 
 Sat, 05 Sep 2020 13:05:10 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 x3sm10486542pfo.95.2020.09.05.13.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 13:05:08 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v17 18/20] dt-bindings: arm-smmu: Add compatible string for
 Adreno GPU SMMU
Date: Sat,  5 Sep 2020 13:04:24 -0700
Message-Id: <20200905200454.240929-19-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200905200454.240929-1-robdclark@gmail.com>
References: <20200905200454.240929-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
 Akhil P Oommen <akhilpo@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jordan Crouse <jcrouse@codeaurora.org>

Every Qcom Adreno GPU has an embedded SMMU for its own use. These
devices depend on unique features such as split pagetables,
different stall/halt requirements and other settings. Identify them
with a compatible string so that they can be identified in the
arm-smmu implementation specific code.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 503160a7b9a0..3b63f2ae24db 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -28,8 +28,6 @@ properties:
           - enum:
               - qcom,msm8996-smmu-v2
               - qcom,msm8998-smmu-v2
-              - qcom,sc7180-smmu-v2
-              - qcom,sdm845-smmu-v2
           - const: qcom,smmu-v2
 
       - description: Qcom SoCs implementing "arm,mmu-500"
@@ -40,6 +38,13 @@ properties:
               - qcom,sm8150-smmu-500
               - qcom,sm8250-smmu-500
           - const: arm,mmu-500
+      - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
+        items:
+          - enum:
+              - qcom,sc7180-smmu-v2
+              - qcom,sdm845-smmu-v2
+          - const: qcom,adreno-smmu
+          - const: qcom,smmu-v2
       - description: Marvell SoCs implementing "arm,mmu-500"
         items:
           - const: marvell,ap806-smmu-500
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
