Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F748752EFD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 03:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A5510E7C9;
	Fri, 14 Jul 2023 01:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA8E10E0F5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 01:55:08 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4fb9ae4cef6so2373890e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 18:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689299707; x=1689904507;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2JquCHecjR3dbAA9U6QNcI85J+r2eu2ORSn/fq669QI=;
 b=pzLMHR1mAk1KQV3ru54HqO7JHXu4tv4ICgOMhdY3t6WWFqP3B2lHYq+WN//EhSKEqW
 SmvECA2CTPOMY+OlCAufgAo3PwjQoNtil7+HXhRMypwdrOT/gpd9YGvjhR0qcbSaofTD
 4rJoWcB65M4H3jkt88Ll3SEPdp+R0Dz6AaNgiiFj8MuRDAyhGJV4kE3SwrzDP9yBIcyf
 aK6WSOSOG7yExB1MJhQ61ShriY47GdvJgIhWKFs0588ESpVVu1vTj4U9fxTO7URarvbO
 umrRZyce7/22TRM+c15CEAiqeafh/XkCKtM9P2EuKLXdA9SDXngebiAV90HlkQMCVvLT
 j+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689299707; x=1689904507;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2JquCHecjR3dbAA9U6QNcI85J+r2eu2ORSn/fq669QI=;
 b=iQZai502pQhe81SBllN1S72GWnaiFPAZQpVJ3YHWFc0VORSNOFHthFIeEIYWbegY0J
 JPEcE19Q/9BszU9+A12KZhCtaqjSxv3xLMwXDqNEGx1uD+bQILSbEl5NG849e8sciyW/
 qGO8Ic8rF+Ev3Cbpm8UaGANCCZbGahzAegKbcgdQi3Creu+QtJ/ZW5sZzf1CPXjKPQ/Z
 pULsOZMVf6jALoa0o0x18jX7YVlsniHvCqwDJT4Rcy0lbM66tyTn3TSZ61NmNHxBqL0t
 QGXZOoN1z4r9PD04R3d4DAdIm+26LwHtdZ6r1j1VbqqD2S7cxx6PBgh3pyiM+PKOQ2Zv
 h+Lg==
X-Gm-Message-State: ABy/qLbcfAbdLh4Pd8QzDjqkw8pvj44nqc5bzbUivpI4bc152ZtzxX+z
 Uq/6Q3yAt53UbnOcjcLfv56RWw==
X-Google-Smtp-Source: APBJJlEqY+gt/9wM8NakxtplQkZAgTGBOPl9wANXF1y1GsQH1RjFfBBArLBFEI0Hueu65lE26kdL+g==
X-Received: by 2002:a05:6512:3b9d:b0:4fb:8c52:611 with SMTP id
 g29-20020a0565123b9d00b004fb8c520611mr3477364lfv.38.1689299707104; 
 Thu, 13 Jul 2023 18:55:07 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q8-20020ac25148000000b004f3afa1767dsm1297550lfd.197.2023.07.13.18.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 18:55:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 4/4] drm/msm/dpu: drop DPU_HW_SUBBLK_INFO macro
Date: Fri, 14 Jul 2023 04:55:03 +0300
Message-Id: <20230714015503.3198971-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230714015503.3198971-1-dmitry.baryshkov@linaro.org>
References: <20230714015503.3198971-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As the subblock info is now mostly gone, inline and drop the macro
DPU_HW_SUBBLK_INFO.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 40 ++++++++++---------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index cc1800e324dd..61c6caf1b185 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -271,48 +271,50 @@ enum {
 	u32 len; \
 	unsigned long features
 
-/**
- * MACRO DPU_HW_SUBBLK_INFO - information of HW sub-block inside DPU
- * @name:              string name for debug purposes
- * @base:              offset of this sub-block relative to the block
- *                     offset
- * @len                register block length of this sub-block
- */
-#define DPU_HW_SUBBLK_INFO \
-	char name[DPU_HW_BLK_NAME_LEN]; \
-	u32 base; \
-	u32 len
-
 /**
  * struct dpu_scaler_blk: Scaler information
- * @info:   HW register and features supported by this sub-blk
+ * @name: string name for debug purposes
+ * @base: offset of this sub-block relative to the block offset
+ * @len: register block length of this sub-block
  * @version: qseed block revision
  */
 struct dpu_scaler_blk {
-	DPU_HW_SUBBLK_INFO;
+	char name[DPU_HW_BLK_NAME_LEN];
+	u32 base;
+	u32 len;
 	u32 version;
 };
 
 struct dpu_csc_blk {
-	DPU_HW_SUBBLK_INFO;
+	char name[DPU_HW_BLK_NAME_LEN];
+	u32 base;
+	u32 len;
 };
 
 /**
  * struct dpu_pp_blk : Pixel processing sub-blk information
- * @info:   HW register and features supported by this sub-blk
+ * @name: string name for debug purposes
+ * @base: offset of this sub-block relative to the block offset
+ * @len: register block length of this sub-block
  * @version: HW Algorithm version
  */
 struct dpu_pp_blk {
-	DPU_HW_SUBBLK_INFO;
+	char name[DPU_HW_BLK_NAME_LEN];
+	u32 base;
+	u32 len;
 	u32 version;
 };
 
 /**
  * struct dpu_dsc_blk - DSC Encoder sub-blk information
- * @info:   HW register and features supported by this sub-blk
+ * @name: string name for debug purposes
+ * @base: offset of this sub-block relative to the block offset
+ * @len: register block length of this sub-block
  */
 struct dpu_dsc_blk {
-	DPU_HW_SUBBLK_INFO;
+	char name[DPU_HW_BLK_NAME_LEN];
+	u32 base;
+	u32 len;
 };
 
 /**
-- 
2.39.2

