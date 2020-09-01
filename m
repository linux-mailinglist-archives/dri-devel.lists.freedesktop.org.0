Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95787259A37
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 18:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1216E8AE;
	Tue,  1 Sep 2020 16:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B216E8AD
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 16:47:39 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id w7so1124203pfi.4
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 09:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RI73hAm8taFHglKyL+fRjHiZ9E+te2SePrFdWbpImkA=;
 b=iK/gWhvX43nTVceqadIhYvSqK91IRCJCr5an4KZFK1DTvINxVcTZMuQyegyN/355Bw
 JZQ7Y2NxnEyNgHakr4ZD9u87n6KRWb0TKstSl2SZ3PzPV7YLJVSPcDu6euUaGOQkNRud
 h/4COkh5TdixQZkT8bM/oxcl04nzVQ3WdlDCo9PGw+fVjnSiUbbujl8LFIUnDWnDJ2Xd
 Kxrsomm8Prr7eCxcP7aZHzasUFTLyJ4ODxcdLAuEMq9dv/FyYghppWV3sNUAyRmMhpzB
 UUeqqU/WJ87+Ydrrx0WdNSh8807h1sbE0add+3495kD6sIYWodJy28OaQcodE2eH8PRw
 XMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RI73hAm8taFHglKyL+fRjHiZ9E+te2SePrFdWbpImkA=;
 b=YdSZyGkU5RTDrdTL0Ou7+VIJoD3i4JLCyL8BZUpw+O1l4QkbprdhiTDGoYAqRC+FVw
 PxAEFTL1W26s5UgQncRAg/R58YdO+igjhS40fhQSUitO16HUz5CQmQGLletsI/jja6pC
 K1nkGfrVezRyArlkqT0flqZa90xbEMY5wHV69jlNLLZ5wqDS4Xu9i6Txuc9LUqgfGG9W
 OkeHzWP1Wtvu1xZMCtVHCexgEvnkmOJ87VaND8Bj2W0V/J9hMb2P7fGxDgxNtR1ct11v
 u+JsJqQWpunCRFbWLzNi14uM3GxSC17ro3fbHB9CEIpiKNjd8IDa7zfow+oPvAv0awJr
 dY3A==
X-Gm-Message-State: AOAM5325838Gssh7CyLGes8HsIVpJzOQ+BnqP9OJSSxxkI5TrSZv4qXP
 oxcEoaf5ERxRYx2KzQHv4XfrJaEbHaA0TMXG
X-Google-Smtp-Source: ABdhPJxqESFlReg5RGOlUO1KFXl0W8xH0asJAzoRAGy9j2bDD2ncGLx0thhLxLusFeJPcxyqh3MDbA==
X-Received: by 2002:a63:6d4c:: with SMTP id i73mr2312150pgc.63.1598978857690; 
 Tue, 01 Sep 2020 09:47:37 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id i1sm2497656pfo.212.2020.09.01.09.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 09:47:36 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v16 18/20] dt-bindings: arm-smmu: Add compatible string for
 Adreno GPU SMMU
Date: Tue,  1 Sep 2020 09:46:35 -0700
Message-Id: <20200901164707.2645413-19-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200901164707.2645413-1-robdclark@gmail.com>
References: <20200901164707.2645413-1-robdclark@gmail.com>
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Akhil P Oommen <akhilpo@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Sibi Sankar <sibis@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
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
