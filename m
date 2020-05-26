Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D031E1C40
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 09:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4486E0DD;
	Tue, 26 May 2020 07:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C524789BFE
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 03:23:00 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id v15so8854528qvr.8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 20:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0VQLDJpM0rzdzDwm9I6kouTPUairFozQ0XrP2bnKQaY=;
 b=NJcNULoKv4NTrppdnuI1+h6RhDKoXrmM6JtatFLsfOU7I8waj2Ifw89KeuWMQ5n2zo
 pi69Ue+pxkHGB3+dsoYlFCRr6sn3d64Fl4rmlEri8x3CcCXBlpmcyNIA0bPcs1l11caV
 EpipHiynmq+wK10YYvIBIz052Id+EV8iIPD4vC7ThqFFrmtQrzNSvGJFsYbiclxRKrb3
 WInCrSKQla1PUza022LkBosYzettz/bQFh3JybaecbWizZCIZq7qK11t70/6tbJwaeul
 2MQt/MV0J3b/+x0PkXEVCmHX0naCuvMWiKqG2pV/03nWLi7vdFs0+ZQHEOtx0Zseq4HD
 dsmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0VQLDJpM0rzdzDwm9I6kouTPUairFozQ0XrP2bnKQaY=;
 b=uj/0vH1FWcup3tPxrMf5PoX4Kyyp/e2Aoad0UUmX8zbhf8F4hHFoYcHasuHhKG4Oiz
 0bdUMIUzwcMyULVKAYFW+XGdLT1wWgrVymqwDmelhQsZM3s08C/naPE7EZ+1Sn+ifjOl
 KpVNZRwYk592lrFO8lzybg2WZPXvK/Uw+EeDl/zD4v72beAa8A8vmmJSYjuxZtZQJ4QB
 0n+929ANyyDAiOk78Lm58eZ8OBwdeBGylwKRMS7PSgQSmbE/A7OWqZT7jN3czn1Z00m6
 O8I1S1YJJBbuB92hZgq30ZJQGOWQrl92Yh+ilZrm5m50NOodLJaCO4dHHKVa2ECuNRpy
 u+lg==
X-Gm-Message-State: AOAM533nIB2mR2z6zzs3f6pS0B67WVppRnQie4Four+F7RzLZRsQJsaI
 L0E3XUoW/aVMMWoxOQT4Vu1tIA==
X-Google-Smtp-Source: ABdhPJw0FxDLBwKiMcLrAc0fJx7TnkPhTvNdxnKJ59MX5rI8k4IsAOABxr6CSBMqKcG1Pe9PdZRJ5Q==
X-Received: by 2002:a05:6214:8c1:: with SMTP id
 da1mr17194373qvb.135.1590463379940; 
 Mon, 25 May 2020 20:22:59 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id k20sm2530796qtu.16.2020.05.25.20.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 20:22:59 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 4/8] drm/msm/dpu: don't use INTF_INPUT_CTRL feature on sdm845
Date: Mon, 25 May 2020 23:22:11 -0400
Message-Id: <20200526032235.21930-5-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200526032235.21930-1-jonathan@marek.ca>
References: <20200526032235.21930-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 26 May 2020 07:26:30 +0000
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
Cc: Shubhashree Dhar <dhar@codeaurora.org>,
 Raviteja Tamatam <travitej@codeaurora.org>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The INTF_INPUT_CTRL feature is not available on sdm845, so don't set it.

This also adds separate feature bits for INTF (based on downstream) instead
of using CTL feature bit for it, and removes the unnecessary NULL check in
the added bind_pingpong_blk function.

Fixes: 73bfb790ac786ca55fa2786a06f59 ("msm:disp:dpu1: setup display datapath for SC7180 target")

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 20 +++++++++++--------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 13 ++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   |  9 ++-------
 3 files changed, 27 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 496407f1cd08..1e64fa08c219 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -41,6 +41,10 @@
 #define PINGPONG_SDM845_SPLIT_MASK \
 	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
 
+#define INTF_SDM845_MASK (0)
+
+#define INTF_SC7180_MASK BIT(DPU_INTF_INPUT_CTRL) | BIT(DPU_INTF_TE)
+
 #define DEFAULT_PIXEL_RAM_SIZE		(50 * 1024)
 #define DEFAULT_DPU_LINE_WIDTH		2048
 #define DEFAULT_DPU_OUTPUT_LINE_WIDTH	2560
@@ -376,26 +380,26 @@ static struct dpu_pingpong_cfg sc7180_pp[] = {
 /*************************************************************
  * INTF sub blocks config
  *************************************************************/
-#define INTF_BLK(_name, _id, _base, _type, _ctrl_id) \
+#define INTF_BLK(_name, _id, _base, _type, _ctrl_id, _features) \
 	{\
 	.name = _name, .id = _id, \
 	.base = _base, .len = 0x280, \
-	.features = BIT(DPU_CTL_ACTIVE_CFG), \
+	.features = _features, \
 	.type = _type, \
 	.controller_id = _ctrl_id, \
 	.prog_fetch_lines_worst_case = 24 \
 	}
 
 static const struct dpu_intf_cfg sdm845_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0),
-	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0),
-	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1),
-	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1),
+	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, INTF_SDM845_MASK),
+	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, INTF_SDM845_MASK),
+	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, INTF_SDM845_MASK),
+	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, INTF_SDM845_MASK),
 };
 
 static const struct dpu_intf_cfg sc7180_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0),
-	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0),
+	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, INTF_SC7180_MASK),
+	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, INTF_SC7180_MASK),
 };
 
 /*************************************************************
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 7a8d1c6658d2..31ddb2be9c57 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -175,6 +175,19 @@ enum {
 	DPU_CTL_MAX
 };
 
+/**
+ * INTF sub-blocks
+ * @DPU_INTF_INPUT_CTRL         Supports the setting of pp block from which
+ *                              pixel data arrives to this INTF
+ * @DPU_INTF_TE                 INTF block has TE configuration support
+ * @DPU_INTF_MAX
+ */
+enum {
+	DPU_INTF_INPUT_CTRL = 0x1,
+	DPU_INTF_TE,
+	DPU_INTF_MAX
+};
+
 /**
  * VBIF sub-blocks and features
  * @DPU_VBIF_QOS_OTLIM        VBIF supports OT Limit
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index efe9a5719c6b..64f556d693dd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -225,14 +225,9 @@ static void dpu_hw_intf_bind_pingpong_blk(
 		bool enable,
 		const enum dpu_pingpong pp)
 {
-	struct dpu_hw_blk_reg_map *c;
+	struct dpu_hw_blk_reg_map *c = &intf->hw;
 	u32 mux_cfg;
 
-	if (!intf)
-		return;
-
-	c = &intf->hw;
-
 	mux_cfg = DPU_REG_READ(c, INTF_MUX);
 	mux_cfg &= ~0xf;
 
@@ -280,7 +275,7 @@ static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
 	ops->get_status = dpu_hw_intf_get_status;
 	ops->enable_timing = dpu_hw_intf_enable_timing_engine;
 	ops->get_line_count = dpu_hw_intf_get_line_count;
-	if (cap & BIT(DPU_CTL_ACTIVE_CFG))
+	if (cap & BIT(DPU_INTF_INPUT_CTRL))
 		ops->bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
 }
 
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
