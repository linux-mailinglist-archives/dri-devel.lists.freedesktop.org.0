Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A6D347B47
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:00:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CCF66EA48;
	Wed, 24 Mar 2021 15:00:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC026EA25
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:00:33 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id b4so8495942lfi.6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9wzQE8+xRHWzVhPWo7572hdM5q9VQaMb98U6+A0d0g4=;
 b=pYtSSrnv8CFg3IABkUt9XMlFzQg2M5Mdg6rbm/gaZoKRXmSazYUgXOQ1J/BjoqOnZL
 k1bf9CNcm6rlluwQ+N4dC2sU3nQo95KTnvHRIixy1KByHAMNx4WsqqeO9lzV8gW2A5IN
 dcGtBnr2hN3xjpMxd/TldRidedsB1TR1EDdb/JsLRTydmUPUnlKlxZf6ZvEWA0Pz70n/
 KO0aueAI2Zt8KQCxHI1VYVT79U1VaDAaWJAF5RzLh9YyVcI/b6JOzm89p3fd7XUdrmEa
 oFmLNz3RAA9bBwzl0qWWS1YYQwkP6OeSpb1rD5vfjxtV4AiRjEoFSiQbDL3UeMaqK57D
 iYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9wzQE8+xRHWzVhPWo7572hdM5q9VQaMb98U6+A0d0g4=;
 b=XqXn+ALl+WEgvu4FLn0jdZPNJeM40GPpGEBHyFboni6m03DB3Pd7otd3dtF4tHl0IM
 kSxbqOL0S7lXngbNy4jl/4EKYsAKFhU+2E2BG2GRYOZXZyDduyltr/8Q9CGIwFEYhEb3
 3LVlZQopOQpIm31UEjoJiAePWqP5LvXX5jhJKwp2XVL/ctz6g8oTi2aZ5/alTkyTT7kT
 dd9VzR6FdMZsEOQit2k4A6nczLPhSg6mqYJMNwLiL09nLhcDIIzhX7JqJb5aUYmmn4f3
 hkNQnzWI24mxfI25NUjclt/LVgkLSrJxBmn5ObIdmmC2bw42moLAeNHteHnxFVngIqyL
 k6DA==
X-Gm-Message-State: AOAM532+vV5I0nXBaNXCtLf/1R5FHwGqMWdkowLGXbGROfWf2Yph+v66
 jUGgatp5Uw86xWUH24/czvsdRA==
X-Google-Smtp-Source: ABdhPJw8bXEMvJpiu+aIjkejqcrrw76CDISOnm4hQhnTGRlrctSOD5+fuVsuQlovR9gQgfY1xdcZcQ==
X-Received: by 2002:ac2:51a4:: with SMTP id f4mr2181482lfk.411.1616598031539; 
 Wed, 24 Mar 2021 08:00:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:00:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH 02/21] drm/msm/dpu: remove unused dpu_hw_blk features
Date: Wed, 24 Mar 2021 18:00:05 +0300
Message-Id: <20210324150024.2768215-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
References: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove all unused dpu_hw_blk features and functions:
- dpu_hw_blk_get()/_put() and respective refcounting,
- global list of all dpu_hw_blk instances,
- dpu_hw_blk_ops and empty implementation inside each hw_blk subdriver.

This leaves dpu_hw_blk as a placeholder with just type and index.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c    | 104 +-----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h    |  19 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c   |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     |   4 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    |   4 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    |   4 +-
 10 files changed, 10 insertions(+), 145 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
index 819b26e660b9..abad043f35f5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
@@ -11,33 +11,16 @@
 #include "dpu_hw_mdss.h"
 #include "dpu_hw_blk.h"
 
-/* Serialization lock for dpu_hw_blk_list */
-static DEFINE_MUTEX(dpu_hw_blk_lock);
-
-/* List of all hw block objects */
-static LIST_HEAD(dpu_hw_blk_list);
-
 /**
  * dpu_hw_blk_init - initialize hw block object
  * @hw_blk: pointer to hw block object
  * @type: hw block type - enum dpu_hw_blk_type
  * @id: instance id of the hw block
- * @ops: Pointer to block operations
  */
-void dpu_hw_blk_init(struct dpu_hw_blk *hw_blk, u32 type, int id,
-		struct dpu_hw_blk_ops *ops)
+void dpu_hw_blk_init(struct dpu_hw_blk *hw_blk, u32 type, int id)
 {
-	INIT_LIST_HEAD(&hw_blk->list);
 	hw_blk->type = type;
 	hw_blk->id = id;
-	atomic_set(&hw_blk->refcount, 0);
-
-	if (ops)
-		hw_blk->ops = *ops;
-
-	mutex_lock(&dpu_hw_blk_lock);
-	list_add(&hw_blk->list, &dpu_hw_blk_list);
-	mutex_unlock(&dpu_hw_blk_lock);
 }
 
 /**
@@ -51,89 +34,4 @@ void dpu_hw_blk_destroy(struct dpu_hw_blk *hw_blk)
 		pr_err("invalid parameters\n");
 		return;
 	}
-
-	if (atomic_read(&hw_blk->refcount))
-		pr_err("hw_blk:%d.%d invalid refcount\n", hw_blk->type,
-				hw_blk->id);
-
-	mutex_lock(&dpu_hw_blk_lock);
-	list_del(&hw_blk->list);
-	mutex_unlock(&dpu_hw_blk_lock);
-}
-
-/**
- * dpu_hw_blk_get - get hw_blk from free pool
- * @hw_blk: if specified, increment reference count only
- * @type: if hw_blk is not specified, allocate the next available of this type
- * @id: if specified (>= 0), allocate the given instance of the above type
- * return: pointer to hw block object
- */
-struct dpu_hw_blk *dpu_hw_blk_get(struct dpu_hw_blk *hw_blk, u32 type, int id)
-{
-	struct dpu_hw_blk *curr;
-	int rc, refcount;
-
-	if (!hw_blk) {
-		mutex_lock(&dpu_hw_blk_lock);
-		list_for_each_entry(curr, &dpu_hw_blk_list, list) {
-			if ((curr->type != type) ||
-					(id >= 0 && curr->id != id) ||
-					(id < 0 &&
-						atomic_read(&curr->refcount)))
-				continue;
-
-			hw_blk = curr;
-			break;
-		}
-		mutex_unlock(&dpu_hw_blk_lock);
-	}
-
-	if (!hw_blk) {
-		pr_debug("no hw_blk:%d\n", type);
-		return NULL;
-	}
-
-	refcount = atomic_inc_return(&hw_blk->refcount);
-
-	if (refcount == 1 && hw_blk->ops.start) {
-		rc = hw_blk->ops.start(hw_blk);
-		if (rc) {
-			pr_err("failed to start  hw_blk:%d rc:%d\n", type, rc);
-			goto error_start;
-		}
-	}
-
-	pr_debug("hw_blk:%d.%d refcount:%d\n", hw_blk->type,
-			hw_blk->id, refcount);
-	return hw_blk;
-
-error_start:
-	dpu_hw_blk_put(hw_blk);
-	return ERR_PTR(rc);
-}
-
-/**
- * dpu_hw_blk_put - put hw_blk to free pool if decremented refcount is zero
- * @hw_blk: hw block to be freed
- */
-void dpu_hw_blk_put(struct dpu_hw_blk *hw_blk)
-{
-	if (!hw_blk) {
-		pr_err("invalid parameters\n");
-		return;
-	}
-
-	pr_debug("hw_blk:%d.%d refcount:%d\n", hw_blk->type, hw_blk->id,
-			atomic_read(&hw_blk->refcount));
-
-	if (!atomic_read(&hw_blk->refcount)) {
-		pr_err("hw_blk:%d.%d invalid put\n", hw_blk->type, hw_blk->id);
-		return;
-	}
-
-	if (atomic_dec_return(&hw_blk->refcount))
-		return;
-
-	if (hw_blk->ops.stop)
-		hw_blk->ops.stop(hw_blk);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
index 2bf737f8dd1b..fb3be9a36a50 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
@@ -7,19 +7,9 @@
 
 #include <linux/types.h>
 #include <linux/list.h>
-#include <linux/atomic.h>
 
 struct dpu_hw_blk;
 
-/**
- * struct dpu_hw_blk_ops - common hardware block operations
- * @start: start operation on first get
- * @stop: stop operation on last put
- */
-struct dpu_hw_blk_ops {
-	int (*start)(struct dpu_hw_blk *);
-	void (*stop)(struct dpu_hw_blk *);
-};
 
 /**
  * struct dpu_hw_blk - definition of hardware block object
@@ -29,17 +19,10 @@ struct dpu_hw_blk_ops {
  * @refcount: reference/usage count
  */
 struct dpu_hw_blk {
-	struct list_head list;
 	u32 type;
 	int id;
-	atomic_t refcount;
-	struct dpu_hw_blk_ops ops;
 };
 
-void dpu_hw_blk_init(struct dpu_hw_blk *hw_blk, u32 type, int id,
-		struct dpu_hw_blk_ops *ops);
+void dpu_hw_blk_init(struct dpu_hw_blk *hw_blk, u32 type, int id);
 void dpu_hw_blk_destroy(struct dpu_hw_blk *hw_blk);
-
-struct dpu_hw_blk *dpu_hw_blk_get(struct dpu_hw_blk *hw_blk, u32 type, int id);
-void dpu_hw_blk_put(struct dpu_hw_blk *hw_blk);
 #endif /*_DPU_HW_BLK_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 8981cfa9dbc3..ad60d59d3106 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -560,8 +560,6 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
 	ops->get_bitmask_dspp = dpu_hw_ctl_get_bitmask_dspp;
 };
 
-static struct dpu_hw_blk_ops dpu_hw_ops;
-
 struct dpu_hw_ctl *dpu_hw_ctl_init(enum dpu_ctl idx,
 		void __iomem *addr,
 		const struct dpu_mdss_cfg *m)
@@ -586,7 +584,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(enum dpu_ctl idx,
 	c->mixer_count = m->mixer_count;
 	c->mixer_hw_caps = m->mixer;
 
-	dpu_hw_blk_init(&c->base, DPU_HW_BLK_CTL, idx, &dpu_hw_ops);
+	dpu_hw_blk_init(&c->base, DPU_HW_BLK_CTL, idx);
 
 	return c;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index e42f901a7de5..d2f1045a736a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -85,8 +85,6 @@ static const struct dpu_dspp_cfg *_dspp_offset(enum dpu_dspp dspp,
 	return ERR_PTR(-EINVAL);
 }
 
-static struct dpu_hw_blk_ops dpu_hw_ops;
-
 struct dpu_hw_dspp *dpu_hw_dspp_init(enum dpu_dspp idx,
 			void __iomem *addr,
 			const struct dpu_mdss_cfg *m)
@@ -112,7 +110,7 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(enum dpu_dspp idx,
 	c->cap = cfg;
 	_setup_dspp_ops(c, c->cap->features);
 
-	dpu_hw_blk_init(&c->base, DPU_HW_BLK_DSPP, idx, &dpu_hw_ops);
+	dpu_hw_blk_init(&c->base, DPU_HW_BLK_DSPP, idx);
 
 	return c;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 6f0f54588124..db78842e3999 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -289,8 +289,6 @@ static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
 		ops->bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
 }
 
-static struct dpu_hw_blk_ops dpu_hw_ops;
-
 struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf idx,
 		void __iomem *addr,
 		const struct dpu_mdss_cfg *m)
@@ -317,7 +315,7 @@ struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf idx,
 	c->mdss = m;
 	_setup_intf_ops(&c->ops, c->cap->features);
 
-	dpu_hw_blk_init(&c->base, DPU_HW_BLK_INTF, idx, &dpu_hw_ops);
+	dpu_hw_blk_init(&c->base, DPU_HW_BLK_INTF, idx);
 
 	return c;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 6ac0b5a0e057..554bb881de3a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -160,8 +160,6 @@ static void _setup_mixer_ops(const struct dpu_mdss_cfg *m,
 	ops->setup_border_color = dpu_hw_lm_setup_border_color;
 }
 
-static struct dpu_hw_blk_ops dpu_hw_ops;
-
 struct dpu_hw_mixer *dpu_hw_lm_init(enum dpu_lm idx,
 		void __iomem *addr,
 		const struct dpu_mdss_cfg *m)
@@ -184,7 +182,7 @@ struct dpu_hw_mixer *dpu_hw_lm_init(enum dpu_lm idx,
 	c->cap = cfg;
 	_setup_mixer_ops(m, &c->ops, c->cap->features);
 
-	dpu_hw_blk_init(&c->base, DPU_HW_BLK_LM, idx, &dpu_hw_ops);
+	dpu_hw_blk_init(&c->base, DPU_HW_BLK_LM, idx);
 
 	return c;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
index 720813e5a8ae..863229dd0140 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
@@ -58,8 +58,6 @@ static void _setup_merge_3d_ops(struct dpu_hw_merge_3d *c,
 	c->ops.setup_3d_mode = dpu_hw_merge_3d_setup_3d_mode;
 };
 
-static struct dpu_hw_blk_ops dpu_hw_ops;
-
 struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(enum dpu_merge_3d idx,
 		void __iomem *addr,
 		const struct dpu_mdss_cfg *m)
@@ -81,7 +79,7 @@ struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(enum dpu_merge_3d idx,
 	c->caps = cfg;
 	_setup_merge_3d_ops(c, c->caps->features);
 
-	dpu_hw_blk_init(&c->base, DPU_HW_BLK_MERGE_3D, idx, &dpu_hw_ops);
+	dpu_hw_blk_init(&c->base, DPU_HW_BLK_MERGE_3D, idx);
 
 	return c;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 245a7a62b5c6..334d5b28f533 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -261,8 +261,6 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
 		c->ops.setup_dither = dpu_hw_pp_setup_dither;
 };
 
-static struct dpu_hw_blk_ops dpu_hw_ops;
-
 struct dpu_hw_pingpong *dpu_hw_pingpong_init(enum dpu_pingpong idx,
 		void __iomem *addr,
 		const struct dpu_mdss_cfg *m)
@@ -284,7 +282,7 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(enum dpu_pingpong idx,
 	c->caps = cfg;
 	_setup_pingpong_ops(c, c->caps->features);
 
-	dpu_hw_blk_init(&c->base, DPU_HW_BLK_PINGPONG, idx, &dpu_hw_ops);
+	dpu_hw_blk_init(&c->base, DPU_HW_BLK_PINGPONG, idx);
 
 	return c;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 34d81aa16041..ceb2488ea270 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -706,8 +706,6 @@ static const struct dpu_sspp_cfg *_sspp_offset(enum dpu_sspp sspp,
 	return ERR_PTR(-ENOMEM);
 }
 
-static struct dpu_hw_blk_ops dpu_hw_ops;
-
 struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
 		void __iomem *addr, struct dpu_mdss_cfg *catalog,
 		bool is_virtual_pipe)
@@ -735,7 +733,7 @@ struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
 	hw_pipe->cap = cfg;
 	_setup_layer_ops(hw_pipe, hw_pipe->cap->features);
 
-	dpu_hw_blk_init(&hw_pipe->base, DPU_HW_BLK_SSPP, idx, &dpu_hw_ops);
+	dpu_hw_blk_init(&hw_pipe->base, DPU_HW_BLK_SSPP, idx);
 
 	return hw_pipe;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index 01b76766a9a8..5d2c33ec1de7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -295,8 +295,6 @@ static const struct dpu_mdp_cfg *_top_offset(enum dpu_mdp mdp,
 	return ERR_PTR(-EINVAL);
 }
 
-static struct dpu_hw_blk_ops dpu_hw_ops;
-
 struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp idx,
 		void __iomem *addr,
 		const struct dpu_mdss_cfg *m)
@@ -324,7 +322,7 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp idx,
 	mdp->caps = cfg;
 	_setup_mdp_ops(&mdp->ops, mdp->caps->features);
 
-	dpu_hw_blk_init(&mdp->base, DPU_HW_BLK_TOP, idx, &dpu_hw_ops);
+	dpu_hw_blk_init(&mdp->base, DPU_HW_BLK_TOP, idx);
 
 	return mdp;
 }
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
