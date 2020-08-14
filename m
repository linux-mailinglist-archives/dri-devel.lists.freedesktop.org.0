Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D74244360
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 04:41:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABA16EB03;
	Fri, 14 Aug 2020 02:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC3E6EB07;
 Fri, 14 Aug 2020 02:41:44 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id mw10so3702723pjb.2;
 Thu, 13 Aug 2020 19:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kKA+x0uy5NlO00Iqox0wh7pVzFT+/CgBiD5qZahgaMc=;
 b=OZ5AfjFtazVgCqyUoQKl0fVe4Zv1HBrkEcINpNZ4TF+rbwR3vfDA9C9hHNqhcfyovd
 hZ0VTlsSUQGx3HzvF866Vm87XoGiPc05zzEE8XuM080SPnyPJg7B7rLW8KmgJ70BHHF4
 zuSCrRo/Feri8CzJPWbSPNyKWMQRNkaZqHnQXvB4FIe1sWs2HoP3IZfCaJ3jHHjohB91
 R7iNeBNBpJM8lEn6KPKCMvKuUiUHWOk6KDMEIgZjNiiA8cPE9SSyOHHs45CBiftnkt2D
 cxK4wqvStzkpHkn2HCgopkUqnND6mu/tHLkHdk8vgl6ZBEIWrRjfD7ip/MJGFtVsGphZ
 sXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kKA+x0uy5NlO00Iqox0wh7pVzFT+/CgBiD5qZahgaMc=;
 b=idqdCECR7iIjEY5uRdL7R4iZqd9GDz/J+a1Kb2/ucXrX+VJg/vKpSOUjFHTN8Svumv
 H+0ayksJyOA8ZgCofH4rgYENszSqSlgsY9K4LzUqFe6+/BxhoSHQ02Yvh77l7Isz9nTe
 l+dt9Z3uawVX/a3qH1Se8rNyyPk31jEMUinZQWrsZdHvIhdNqOS0hLGYl1lC3/H11E/D
 gEeT93+KE51+AVhn1wnbSkkJ49x8JkmbCvP51sCZ4zBqfgzLdnbOwW4IMdhtjTVLn4gl
 C328naHC1j8DAO69On0Ke2iDWFc9xyG8pCYKh/pXOYG6+FoO4sH+fOB5TK5VmlLPtUt4
 nkwQ==
X-Gm-Message-State: AOAM533xdBvOR36UB0hwooUpt/HA+NgFqASGxth9uZJoXVosoeIdDuue
 CT/TQF47f5W+OxY4J5oL1/3jx/g9MNc=
X-Google-Smtp-Source: ABdhPJxRU2uTcC7U1hC33YEDToytochFsUhJDPj0RKliYV1Cr2UAtF1I/WVfqPUwtN3PZCCpa2huaw==
X-Received: by 2002:a17:90a:2207:: with SMTP id
 c7mr557865pje.206.1597372903537; 
 Thu, 13 Aug 2020 19:41:43 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id e8sm7219856pfd.34.2020.08.13.19.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 19:41:42 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH 10/19] dt-bindings: arm-smmu: Add compatible string for Adreno
 GPU SMMU
Date: Thu, 13 Aug 2020 19:41:05 -0700
Message-Id: <20200814024114.1177553-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200810222657.1841322-1-jcrouse@codeaurora.org>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
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
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Sibi Sankar <sibis@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
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
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 503160a7b9a0..5ec5d0d691f6 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -40,6 +40,10 @@ properties:
               - qcom,sm8150-smmu-500
               - qcom,sm8250-smmu-500
           - const: arm,mmu-500
+      - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
+        items:
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
