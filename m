Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D9F53AAD1
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 18:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41DB910EECC;
	Wed,  1 Jun 2022 16:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7409F10EEC8
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 16:13:55 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id m26so2580784ljb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 09:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6P1Wa5YPp1teAJ/dKP3hCEeV4uIIm3lb36DEK4T0BVQ=;
 b=B2u2d9b/POleGIq7EY1e7Cztt/IGL0517QLi0Y8zPDaqn7SQrCv2J35XRkiDn0vrW0
 pF0YEnbY9LnhKVBekRfABxhFtBoRC3nk71SbEm3By3ANbRcqmhi9PkZEjbycU688fjQy
 7PRM1CYiviIINxf06Gxr5bFXRW40MDUvyzNxOCqAZXElPs4xDdo/9cXZEJl0oFUZ9ZfQ
 BYiiqoZn86K2OlyFaVz8XNkOyy8lfBRB7NJP4XBnOHCS9VAL4K9/wYzMoFV89VWvJV8/
 mSxlUE5bT2+pl4KY3uSdVBa3QjDHzo8/WxJ+22Z2H9btwbXW1FPWGk6sezVfVr/wMBxU
 0WgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6P1Wa5YPp1teAJ/dKP3hCEeV4uIIm3lb36DEK4T0BVQ=;
 b=TVRClzqThyibNr2Cv1i1vqtzWMpBMwDNCuqvHJnVcWctT0gY3co1+kwKfR6qK6U9BU
 ovydzjXDXCqlWWxhaKVu64vEon6ZelxEesUn16/HyyxJv+S3FPIDe1rzr0SHzRrcYnik
 9FkIgOd5yChsQvKtxDDJlIYVYKUyuylOM/8qF7M8xlAIBRzmTxKq7dIDbkhpvaNLPeF/
 32Oivw6AQGzbx/AmL2jNUu3fiey30lTUGCWQNKHjTk7nvR5sw4S2QOttJid3t4DZChZx
 3ib50X6fS2uW8Hx3A2Thx4MnaSDz50qxc5kNsd29Ghwn21C/T/gPfgioE4+4smqWOY0d
 VOJg==
X-Gm-Message-State: AOAM5329gqnLSLPyoPkCCRUl3iAKznAlgbQFL1KAGlgq/ibwhvl6IJKF
 cwpYK1S27DcIDZtGadyQd62xFQ==
X-Google-Smtp-Source: ABdhPJxDa35XMGNMS3vF5ibxcKNSKxwWSoDJChNGJvBMYN16FV2QIlUwoONqvz/apvkkKnj0fltjrA==
X-Received: by 2002:a05:651c:1690:b0:255:6cb6:662b with SMTP id
 bd16-20020a05651c169000b002556cb6662bmr2042335ljb.471.1654100033793; 
 Wed, 01 Jun 2022 09:13:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 k2-20020a05651239c200b00479066d45bcsm339545lfu.214.2022.06.01.09.13.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 09:13:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v1 4/4] drm/msm/dpu: move struct dpu_hw_blk definition to
 dpu_hw_utils.h
Date: Wed,  1 Jun 2022 19:13:49 +0300
Message-Id: <20220601161349.1517667-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220601161349.1517667-1-dmitry.baryshkov@linaro.org>
References: <20220601161349.1517667-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is little point in having a separate header just for a single
opaque struct definition. Drop it now and move the struct to the
dpu_hw_util.h header.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h      |  1 -
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h    | 25 -------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h   |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h     |  1 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h    |  1 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h    |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |  7 ++++++
 12 files changed, 7 insertions(+), 36 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index b8785c394fcc..da64b0f639a9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -12,7 +12,6 @@
 #include <drm/drm_crtc.h>
 #include "dpu_kms.h"
 #include "dpu_core_perf.h"
-#include "dpu_hw_blk.h"
 
 #define DPU_CRTC_NAME_SIZE	12
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 53bb4639c8e9..1db6b75cd1f6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -12,7 +12,6 @@
 #include "dpu_hw_top.h"
 #include "dpu_hw_wb.h"
 #include "dpu_hw_lm.h"
-#include "dpu_hw_blk.h"
 #include "dpu_hw_merge3d.h"
 #include "dpu_hw_interrupts.h"
 #include "dpu_core_irq.h"
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
deleted file mode 100644
index 52e92f37eda4..000000000000
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
+++ /dev/null
@@ -1,25 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/* Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
- */
-
-#ifndef _DPU_HW_BLK_H
-#define _DPU_HW_BLK_H
-
-#include <linux/types.h>
-#include <linux/list.h>
-
-struct dpu_hw_blk;
-
-
-/**
- * struct dpu_hw_blk - definition of hardware block object
- * @list: list of hardware blocks
- * @type: hardware block type
- * @id: instance id
- * @refcount: reference/usage count
- */
-struct dpu_hw_blk {
-	/* opaque */
-};
-
-#endif /*_DPU_HW_BLK_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 5755307089b5..7d9ad6a3f9f6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -10,7 +10,6 @@
 #include "dpu_hw_util.h"
 #include "dpu_hw_catalog.h"
 #include "dpu_hw_sspp.h"
-#include "dpu_hw_blk.h"
 
 /**
  * dpu_ctl_mode_sel: Interface mode selection
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
index 7fa189cfcb06..05ecfdfac93b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
@@ -5,8 +5,6 @@
 #ifndef _DPU_HW_DSPP_H
 #define _DPU_HW_DSPP_H
 
-#include "dpu_hw_blk.h"
-
 struct dpu_hw_dspp;
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 7b2d96ac61e8..c262430e4dbd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -8,7 +8,6 @@
 #include "dpu_hw_catalog.h"
 #include "dpu_hw_mdss.h"
 #include "dpu_hw_util.h"
-#include "dpu_hw_blk.h"
 
 struct dpu_hw_intf;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
index d8052fb2d5da..652ddfdedec3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
@@ -8,7 +8,6 @@
 
 #include "dpu_hw_mdss.h"
 #include "dpu_hw_util.h"
-#include "dpu_hw_blk.h"
 
 struct dpu_hw_mixer;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
index 870bdb14613e..81fd1d5f718e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
@@ -8,7 +8,6 @@
 #include "dpu_hw_catalog.h"
 #include "dpu_hw_mdss.h"
 #include "dpu_hw_util.h"
-#include "dpu_hw_blk.h"
 
 struct dpu_hw_merge_3d;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
index 12758468d9ca..c00223441d99 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
@@ -8,7 +8,6 @@
 #include "dpu_hw_catalog.h"
 #include "dpu_hw_mdss.h"
 #include "dpu_hw_util.h"
-#include "dpu_hw_blk.h"
 
 #define DITHER_MATRIX_SZ 16
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 7f7338fcddeb..78b1bc9e004f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -8,7 +8,6 @@
 #include "dpu_hw_catalog.h"
 #include "dpu_hw_mdss.h"
 #include "dpu_hw_util.h"
-#include "dpu_hw_blk.h"
 #include "dpu_formats.h"
 
 struct dpu_hw_pipe;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
index 3aa10c89ca1b..a1a9e44bed36 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
@@ -8,7 +8,6 @@
 #include "dpu_hw_catalog.h"
 #include "dpu_hw_mdss.h"
 #include "dpu_hw_util.h"
-#include "dpu_hw_blk.h"
 
 struct dpu_hw_mdp;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index d5338701fc2b..49d89d706200 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -25,6 +25,13 @@ struct dpu_hw_blk_reg_map {
 	u32 log_mask;
 };
 
+/**
+ * struct dpu_hw_blk - opaque hardware block object
+ */
+struct dpu_hw_blk {
+	/* opaque */
+};
+
 /**
  * struct dpu_hw_scaler3_de_cfg : QSEEDv3 detail enhancer configuration
  * @enable:         detail enhancer enable/disable
-- 
2.35.1

