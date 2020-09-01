Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FB7259A2F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 18:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E636E8A4;
	Tue,  1 Sep 2020 16:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17226E8A4
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 16:47:22 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id gf14so846319pjb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 09:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TkWyTxARTuQIVpZ4nA1zGbs/CkLTaav5w1kzBb9PxHE=;
 b=J04apcnc9yNiayNZvi3RYs6LgZ8DqVcJmH8Wr7KTsf3utcG6+8ceh5GGe5HDRit6bk
 MdnphK+NGv+I+f/0sk1/MaAHJmh7Ktms/5w3cL3HrJf3mZ0W5ysTqzr+uVCGsNi54rdD
 rbMoWwFeCig9zC+wiWq9md/RLsMrviLGxPOZZN0NOe+0xEB+j0laN7Xo5Owln6TF29+P
 eh6M6tnKd8cTmhDBIPYHE863ookRQ6I8lmDX0mV5Uhc8sLnydbYSbjJvwbMYCh4oJk0n
 Nqh1wBWRypBsmGZYuXraOizi28hKZ/p3WEGvqXA1NuPh18aROFbAVr8B1Uj4YI8vwNGK
 jMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TkWyTxARTuQIVpZ4nA1zGbs/CkLTaav5w1kzBb9PxHE=;
 b=em3BlRC6/kwXJ9nHLNnDYhLRWOfNVBMJRSDNNO976Cp6wAtXu/zvtf+HcLK9TO9P+e
 BP+LcDcfPKAUBYEGeJtbQliRhIHSxRtEJ//qC/3YaelB9pGCMa2EJ6BU/fNohDkWIuSs
 mA9cy0PJWmOKRtEIqi4qp6ct0Pa2CGLgr7UZeAWcuVDadsbT842kNR2LOVmjPLnCVEZI
 Urcviz3ZMZIFpCdK/ejTmy7boZz8B/izdGVeMKC4GhxPUca41DOKIvMaasOWDgo5dUhW
 RY2hy5Lb19rgyaj8kkk8omPWp42Sh13oFigvT6xzT/pN43wxgVGSxsBZt2/a+ECzUX0C
 nomQ==
X-Gm-Message-State: AOAM5328VsvsW3uiz23C98K+VFhOIByE7Cbq8lL5v8Ey0uUok0FOa9g6
 duYx5zX3/5lWAayWWF6yQZe5JON5EP/z7A==
X-Google-Smtp-Source: ABdhPJzPwgooR5I07lG6agi4o+XJIiUnZtxaG2d2E6PYRW6u09VjILA4cchEz56ubddK4K9nWje7yw==
X-Received: by 2002:a17:902:407:: with SMTP id 7mr2182544ple.167.1598978841446; 
 Tue, 01 Sep 2020 09:47:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id u2sm2036508pjj.57.2020.09.01.09.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 09:47:20 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v16 15/20] iommu/arm-smmu: Constify some helpers
Date: Tue,  1 Sep 2020 09:46:32 -0700
Message-Id: <20200901164707.2645413-16-robdclark@gmail.com>
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
 open list <linux-kernel@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Krishna Reddy <vdumpa@nvidia.com>, Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Sprinkle a few `const`s where helpers don't need write access.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 59ff3fc5c6c8..27c83333fc50 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -377,7 +377,7 @@ struct arm_smmu_master_cfg {
 	s16				smendx[];
 };
 
-static inline u32 arm_smmu_lpae_tcr(struct io_pgtable_cfg *cfg)
+static inline u32 arm_smmu_lpae_tcr(const struct io_pgtable_cfg *cfg)
 {
 	u32 tcr = FIELD_PREP(ARM_SMMU_TCR_TG0, cfg->arm_lpae_s1_cfg.tcr.tg) |
 		FIELD_PREP(ARM_SMMU_TCR_SH0, cfg->arm_lpae_s1_cfg.tcr.sh) |
@@ -398,13 +398,13 @@ static inline u32 arm_smmu_lpae_tcr(struct io_pgtable_cfg *cfg)
 	return tcr;
 }
 
-static inline u32 arm_smmu_lpae_tcr2(struct io_pgtable_cfg *cfg)
+static inline u32 arm_smmu_lpae_tcr2(const struct io_pgtable_cfg *cfg)
 {
 	return FIELD_PREP(ARM_SMMU_TCR2_PASIZE, cfg->arm_lpae_s1_cfg.tcr.ips) |
 	       FIELD_PREP(ARM_SMMU_TCR2_SEP, ARM_SMMU_TCR2_SEP_UPSTREAM);
 }
 
-static inline u32 arm_smmu_lpae_vtcr(struct io_pgtable_cfg *cfg)
+static inline u32 arm_smmu_lpae_vtcr(const struct io_pgtable_cfg *cfg)
 {
 	return ARM_SMMU_VTCR_RES1 |
 	       FIELD_PREP(ARM_SMMU_VTCR_PS, cfg->arm_lpae_s2_cfg.vtcr.ps) |
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
