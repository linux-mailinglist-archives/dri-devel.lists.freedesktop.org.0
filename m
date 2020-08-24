Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1629E25081C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 20:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39FF86E47A;
	Mon, 24 Aug 2020 18:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA096E46F;
 Mon, 24 Aug 2020 18:42:32 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id y206so5297748pfb.10;
 Mon, 24 Aug 2020 11:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8jrJbdIXQQAFjo/ry7i+txJOnZIwex0ahQyZ/9frdio=;
 b=vDZcQosIOwttT+7YVD0YcJH63i/4ANBtWVWvB3iylHAaQulSk6Zt7LO0aYaQGeR8La
 Nf8A20AmUnyBL5dyL5YvhbxVitCshAaCyxzgTjfew1FhVN8rwvRSHF+nw1IRTCT+HJEy
 LgfiPuvEKOs/thV8w202+qBEZDCU+r1Zl8SLot+h3dwwLhotl/DUgl81PJRW1yM79dcZ
 9QGffNgb65T+Rovp82CSbUGQINp+vpJ8/XXTWUFo6wLY6s7ajEGZZXyDUVmzzrVB1BeB
 DA6m6erABwDeEATCGThEYV5o1xN7WllNV2le6drxEfsYY72ehk5qdU1vkRSxeuJJeZFW
 XY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8jrJbdIXQQAFjo/ry7i+txJOnZIwex0ahQyZ/9frdio=;
 b=iNt3ayVCOzxkIMsty4JVEfYLJyeAGa0wDB0ZX054Xi+NAM7nsbkSe8MdOY8cWV4B6a
 BY+umlPt4gAwQ/M4hmVICpcBfYV2UmPFTb/87cSKmK1/jT1B1H8j1/mqCEheQeYtZHXz
 USkl7zBfbXnFlzJiKMkSZP9GATaLflelzMAsNoNYM3O+0FxmNfnl4IBvFI/Y2JEocTDy
 v3sqdDgAs+pkaxoYwIOzSwyADs6ZUWeJailPnxYx/lfQxqPI8S6wzIFjeGKwGGKLzFqT
 BBxgSZbYfTwDFlXIdy7+yhY2xKGnEHyu+B/15/BxA60DYleal52oZ6IFRrapJLIVLBgn
 Op5Q==
X-Gm-Message-State: AOAM533WsmhlH/9toILe8DtIdk5r8UB1QVXuf+qNDVxAi2gq2W5snvar
 EzwqhgJk0gu90nTWwZ5/DxFrzrPJgclEvaB4
X-Google-Smtp-Source: ABdhPJz3GfCDsrY2e8D8NgnMkrpU5oev72R67ENvd+ltLeKwaHWMDwrcr34kf5ZWRUkLqlnrTXmo9w==
X-Received: by 2002:a63:ca4e:: with SMTP id o14mr4352543pgi.213.1598294551624; 
 Mon, 24 Aug 2020 11:42:31 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id il13sm251907pjb.0.2020.08.24.11.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 11:42:30 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH 10/20] dt-bindings: arm-smmu: Add compatible string for Adreno
 GPU SMMU
Date: Mon, 24 Aug 2020 11:37:44 -0700
Message-Id: <20200824183825.1778810-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200824183825.1778810-1-robdclark@gmail.com>
References: <20200824183825.1778810-1-robdclark@gmail.com>
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
Cc: Akhil P Oommen <akhilpo@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Joerg Roedel <joro@8bytes.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Sibi Sankar <sibis@codeaurora.org>,
 Brian Masney <masneyb@onstation.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Joerg Roedel <jroedel@suse.de>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
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
