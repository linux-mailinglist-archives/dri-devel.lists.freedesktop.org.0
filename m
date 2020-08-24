Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57822250813
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 20:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788286E45E;
	Mon, 24 Aug 2020 18:42:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 047AA6E46F;
 Mon, 24 Aug 2020 18:42:23 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id x25so5309135pff.4;
 Mon, 24 Aug 2020 11:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kSk9Ml31XbJOG2f57h64F+Z+u/H7LjegKljJVlxq3/o=;
 b=PuQRr8H0J0Wm/JwS7TDm/n1aaDYpCp+u0Xhtd6ySCS+jIDk3G8tZ+NTj4I9yJl9Xi0
 ESlNd1bOyyh7orw4FugAlt6b+4E1XyjwB3dT9M21/hTZnBuqymaPtGRryP6vooFDmeCg
 WBeYpuFK/VhIFBz/ID3oiWyAmocmTWpc71sVReALesHl5XDdOuMmx5BRB2l0jgjEdjjL
 7NTUSfmUhr5gmrltKw5aeVI4wrDhmcyD8K51sVTFDE2s9RgvK0yi5wbt0jyc43vGwnz6
 llUJuwX98+NWd8VFREqSV3FObuRD5JQgg65Tdc9SiDaD++ha9SxdK+F2yxcFANSDRVgN
 6ErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kSk9Ml31XbJOG2f57h64F+Z+u/H7LjegKljJVlxq3/o=;
 b=KMI6hgft6Oh9GSJ+vFw1ndNYdQhxlcWwLHkA4k/5HjJoQ+pYcmkxYV4zsD63rpgK2i
 nKuGUk0xTDa4ITL9o05Dmc7Lk4xgyUzBaTOOz7BSB8LJ+G+yHpfD3+x9KMNeM7jREjvG
 Edt59Y5imWiQYwVr3cFHpwuWBGOZYsTYob+LO7dmyRN/EzoC5Haq2OPGMaj0ZQ7td7ou
 e6AcuST4WzWaEZPxAvylwOZm4btDR0sPdpvulbR0KT5tcyI3XcJyFyJyECPHXi+ZVkUy
 0hwRrAvvufC7K10ZpRF8OvzZVNPESGfXPNKGJAU/JD9zfiiVqnQujCm5H4hy641bIOrS
 Y4Lw==
X-Gm-Message-State: AOAM5338hupkejj9Um2MM0Urx47Aiya9sL5bGuFpfz8pRfqfo40UdHAT
 39/lH4SzzNG5H2JrML43nxHYGNpF6iE0Sg==
X-Google-Smtp-Source: ABdhPJypoRetU1pm/hYk35duEuEDV/9I1qEX2ndUelby0c1VRDwOv61H6tDsCuRdB0ISZKdafjLiDQ==
X-Received: by 2002:a17:902:7792:: with SMTP id
 o18mr4697906pll.150.1598294542026; 
 Mon, 24 Aug 2020 11:42:22 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id p12sm11985571pff.110.2020.08.24.11.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 11:42:20 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH 08/20] iommu/arm-smmu: constify some helpers
Date: Mon, 24 Aug 2020 11:37:42 -0700
Message-Id: <20200824183825.1778810-9-robdclark@gmail.com>
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
 Brian Masney <masneyb@onstation.org>, Joerg Roedel <jroedel@suse.de>,
 Stephen Boyd <swboyd@chromium.org>, Krishna Reddy <vdumpa@nvidia.com>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Sprinkle a few `const`s where helpers don't need write access.

Signed-off-by: Rob Clark <robdclark@chromium.org>
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
