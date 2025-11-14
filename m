Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C74BC5D9DA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 15:36:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58FA610EA90;
	Fri, 14 Nov 2025 14:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="niMI2gGD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B530D10EA84
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 14:36:48 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2957850c63bso21731815ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 06:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763131008; x=1763735808; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nSIls/3M4TGLauUnBJ5m3zl3fUniDuatmjiolK/RIlA=;
 b=niMI2gGDNAQFYGBauaYKpJbk8NCG60hk/P29vhD0ObSslJ9EsiBi0110szcqiyYkQu
 TC3I9kc7W8JsT2T+6IiBsuLabC+k4+RohEsw4pHIzQxjQQA0EetEBRavXTXOMqm9G3C+
 uauUGmCvP+Pv1cvvxNGosx/+AuYHimltudIFDDedqQ/4fR3WOD5iI96A0ccDXliSBwZr
 QGSsmpmwRn1mR66dhWMXOdx1B1FnCO2qADweR72aTQXzeMq6gASATqFRypi1iCVkFbMx
 tnO6XYWF9YSOLM45rjxvJCSLwVYrV8XiPmfyKHqjQt0kmGnV6q9Jv8glutOJ+eIsjlfP
 45lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763131008; x=1763735808;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nSIls/3M4TGLauUnBJ5m3zl3fUniDuatmjiolK/RIlA=;
 b=bPxdXPYLNluniAUmP3btwCeoCa2BXWKluWo1iAuastQ96R3AQDQ5fURJEXhL3kGwN3
 wvcsSY66a16mVKZd3uMa5B0hTyxBDi8UnxtKr+NiwCdYfMlWWr9/CzdXLnSYQZupiMyn
 +vidWLL1yUpPcWnOyWs2100A2ccUZWmIf4bFePTnsa0uE1ZXaDIZmud4rHLIMqXcMbPw
 DR/wALmp2HGgMlc5f0DY+kkxNz+874DotSFvwHbvHy7F5nf3Ne02AUWCgcxBUQznWZ1I
 gz73DSezwy/tst7xnDinge7yGKL321Ph3ESfOClDGg7zBNb/ohddrT5RlySkQnkPYC/g
 f+cQ==
X-Gm-Message-State: AOJu0Yxb7hxjwRMf2znFkTg/Uw/C0YYSyvonH7dIfkgBK20ASnP5zorj
 5ZkiMfOo3A+3R35+pc42Eimc3Eq/qdB9sDdguc4G1QoFoUpmSPLCFJsJ
X-Gm-Gg: ASbGncsTZwhdk5SHan1MsMiit8rVGQ3DMrqW7opPNEPAuN3oUaK73UbthTmP0O2116q
 famKVWbRY5HJN2CB0NGEW0bQmwS/BqlLPNm2bHpZn+L6a1toWuntzG+07g1/XrpdZKTPbtQhBbA
 OiXxrFRC4mmOlHT8Zvq29Eh+DO7uJVF0wQDdTAqE/Gzlv/nKmBvUWV9mvss23HYf6onHRWwxi7l
 uQXMM25zmba2g7VACxAzkLLePluXWRnXrfxWRYdvsoKHW5KzBo42XcN8ctxiwSixUeICeCIgdDM
 YMfT1cNPTrkotrmkj5lqyrZll6/jMFihwo2R5gWxDG6Oije/1ybLIR4x26gQI0RMGmuBv6ZlAER
 uHxR88F8qo3+zuDnGszQ7+1GFibcv8kNheAfPX5aLiy6Wj6A0EbXeLfnjmXbSu34N9Y7BrnuC0u
 5HLDslUxEgr+bt0D7E7jdveag3
X-Google-Smtp-Source: AGHT+IFUOGj7TJVl2OCdFbicu59hvK0bO9kwvvs9SY9g8DkfUCcDnSMPschk57hnTF261AwCNWmJ3Q==
X-Received: by 2002:a17:902:e54c:b0:297:df84:bd18 with SMTP id
 d9443c01a7336-298680346c1mr44257275ad.30.1763131007988; 
 Fri, 14 Nov 2025 06:36:47 -0800 (PST)
Received: from rahul-mintos.ban-spse ([165.204.156.251])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2b106bsm57015555ad.58.2025.11.14.06.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 06:36:47 -0800 (PST)
From: Rahul Kumar <rk0006818@gmail.com>
To: liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rk0006818@gmail.com
Subject: [PATCH] drm/komeda: Convert logging in d71_dev.c to drm_* with
 drm_device parameter
Date: Fri, 14 Nov 2025 20:06:27 +0530
Message-ID: <20251114143627.3981217-1-rk0006818@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace DRM_DEBUG() and DRM_ERROR() calls in
drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c with the
drm_dbg() and drm_err() helpers in functions where a drm_device
parameter is available.

The drm_*() logging macros require a struct drm_device * parameter,
which allows the DRM core to prefix log messages with the device
instance. This improves debugging clarity when multiple Komeda or
other DRM devices are present.

Logging in early hardware probing functions such as d71_identify()
is intentionally left unchanged because they do not have access to
a drm_device pointer at that stage of initialization.

This conversion follows the DRM TODO entry:
"Convert logging to drm_* functions with drm_device parameter".

Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
---
 .../gpu/drm/arm/display/komeda/d71/d71_dev.c  | 21 ++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
index 80973975bfdb..4305354badc8 100644
--- a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
+++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
@@ -9,6 +9,7 @@
 #include <drm/drm_print.h>
 #include "d71_dev.h"
 #include "malidp_io.h"
+#include "komeda_kms.h"
 
 static u64 get_lpu_event(struct d71_pipeline *d71_pipeline)
 {
@@ -348,6 +349,8 @@ static void d71_cleanup(struct komeda_dev *mdev)
 
 static int d71_enum_resources(struct komeda_dev *mdev)
 {
+	struct komeda_kms_dev *kms = dev_get_drvdata(mdev->dev);
+	struct drm_device *drm = &kms->base;
 	struct d71_dev *d71;
 	struct komeda_pipeline *pipe;
 	struct block_header blk;
@@ -366,7 +369,7 @@ static int d71_enum_resources(struct komeda_dev *mdev)
 
 	err = d71_reset(d71);
 	if (err) {
-		DRM_ERROR("Fail to reset d71 device.\n");
+		drm_err(drm, "Fail to reset d71 device.\n");
 		goto err_cleanup;
 	}
 
@@ -376,8 +379,8 @@ static int d71_enum_resources(struct komeda_dev *mdev)
 	d71->num_pipelines = (value >> 8) & 0x7;
 
 	if (d71->num_pipelines > D71_MAX_PIPELINE) {
-		DRM_ERROR("d71 supports %d pipelines, but got: %d.\n",
-			  D71_MAX_PIPELINE, d71->num_pipelines);
+		drm_err(drm, "d71 supports %d pipelines, but got: %d.\n",
+			D71_MAX_PIPELINE, d71->num_pipelines);
 		err = -EINVAL;
 		goto err_cleanup;
 	}
@@ -455,8 +458,8 @@ static int d71_enum_resources(struct komeda_dev *mdev)
 		offset += D71_BLOCK_SIZE;
 	}
 
-	DRM_DEBUG("total %d (out of %d) blocks are found.\n",
-		  i, d71->num_blocks);
+	drm_dbg(drm, "total %d (out of %d) blocks are found.\n",
+		i, d71->num_blocks);
 
 	return 0;
 
@@ -555,6 +558,8 @@ static void d71_init_fmt_tbl(struct komeda_dev *mdev)
 
 static int d71_connect_iommu(struct komeda_dev *mdev)
 {
+	struct komeda_kms_dev *kms = dev_get_drvdata(mdev->dev);
+	struct drm_device *drm = &kms->base;
 	struct d71_dev *d71 = mdev->chip_data;
 	u32 __iomem *reg = d71->gcu_addr;
 	u32 check_bits = (d71->num_pipelines == 2) ?
@@ -569,7 +574,7 @@ static int d71_connect_iommu(struct komeda_dev *mdev)
 	ret = dp_wait_cond(has_bits(check_bits, malidp_read32(reg, BLK_STATUS)),
 			100, 1000, 1000);
 	if (ret < 0) {
-		DRM_ERROR("timed out connecting to TCU!\n");
+		drm_err(drm, "timed out connecting to TCU!\n");
 		malidp_write32_mask(reg, BLK_CONTROL, 0x7, INACTIVE_MODE);
 		return ret;
 	}
@@ -582,6 +587,8 @@ static int d71_connect_iommu(struct komeda_dev *mdev)
 
 static int d71_disconnect_iommu(struct komeda_dev *mdev)
 {
+	struct komeda_kms_dev *kms = dev_get_drvdata(mdev->dev);
+	struct drm_device *drm = &kms->base;
 	struct d71_dev *d71 = mdev->chip_data;
 	u32 __iomem *reg = d71->gcu_addr;
 	u32 check_bits = (d71->num_pipelines == 2) ?
@@ -593,7 +600,7 @@ static int d71_disconnect_iommu(struct komeda_dev *mdev)
 	ret = dp_wait_cond(((malidp_read32(reg, BLK_STATUS) & check_bits) == 0),
 			100, 1000, 1000);
 	if (ret < 0) {
-		DRM_ERROR("timed out disconnecting from TCU!\n");
+		drm_err(drm, "timed out disconnecting from TCU!\n");
 		malidp_write32_mask(reg, BLK_CONTROL, 0x7, INACTIVE_MODE);
 	}
 
-- 
2.43.0

