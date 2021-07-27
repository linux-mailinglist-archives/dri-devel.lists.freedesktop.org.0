Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 709BF3D7B9F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 19:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9683C6E4FB;
	Tue, 27 Jul 2021 17:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9540C6E364;
 Tue, 27 Jul 2021 17:07:33 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 k4-20020a17090a5144b02901731c776526so5263662pjm.4; 
 Tue, 27 Jul 2021 10:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e/9kD03R/I14WeS9EvRH7N0IZXDfhlSexdVdh0n2rZY=;
 b=i7gaNNHfBxvESxY/t6pzS/C83Ambk3XbnrdACydAsExmepDQXvbY5kgukcViLuH5tu
 /troXbxC8jfpcmHO6Ik6O1CjM/Ahmu9GsJ0G73zNMHfMONBsokoPfeyQcPBc4sCI4735
 5Y9X4q96OSbynSrwXaH1FIg5+k8Kh1GhMiW1mHdpQco0SLub01VYisDrkSSuPtA2YOHB
 7mpKvS0Iz6qDXYHSFUt3BAtaaJPMIMK8NKK/i8JPKszIG+25B9gx3o/CM1zdAn/TcuOU
 WwIjZ5xfhDoJi74amNOIqffPvIDjDR2eIenUbN3OHRK0zfSdcGRndvKyPnT2hQflRugp
 Iegw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e/9kD03R/I14WeS9EvRH7N0IZXDfhlSexdVdh0n2rZY=;
 b=oe4i7z+F0bhY1VZZdsCXD0j1Hxo3j74wSIkmhLybcwQ9ie2tYAMCwfCCU9sODtzUh0
 gVy4kvmeDk7DWP91wM/flo0Rm9dg1vxQwbTZG4AwtXEffCUXfetW7X7btG+sdIBrKgzB
 r08RIfDjToZfT1zEPChtmpZOwr6FZ0TXr3HkmEsUFi+6EHB928mZHrbLII6sP5fdmxAt
 kaVrNNg6FA8txbOuNoSmlzKrlxOCDizTskzXcvM+zLsE7N5Wi9jgSwqgcqbuiveS23tf
 ARhOp0S0fBrzZuRZbL3P4JqIbvuPqNszRyYYl9B2/VgwrLf1jn3XmzankKshaq/HffWH
 mUUQ==
X-Gm-Message-State: AOAM533odltk6hBMLz9rq6AKHF63Ugtpb1qrUGf1oHyGwjOfc6V50eT1
 S/bsvvpFw78KXNXQt9iXYfcsSHwGkyKKnw==
X-Google-Smtp-Source: ABdhPJznKDn7QfuMMYnupBEvksAbJv9BlxkSsUjezeD97HVW/DRiN6fv4FztqQTirqy8X/sMiDbR0Q==
X-Received: by 2002:a63:ee11:: with SMTP id e17mr24573575pgi.323.1627405652025; 
 Tue, 27 Jul 2021 10:07:32 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id d67sm4493585pfd.81.2021.07.27.10.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 10:07:31 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 01/13] drm/msm: Docs and misc cleanup
Date: Tue, 27 Jul 2021 10:11:17 -0700
Message-Id: <20210727171143.2549475-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210727171143.2549475-1-robdclark@gmail.com>
References: <20210727171143.2549475-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Fix a couple incorrect or misspelt comments, and add submitqueue doc
comment.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_gem.h         |  3 +--
 drivers/gpu/drm/msm/msm_gem_submit.c  |  1 +
 drivers/gpu/drm/msm/msm_gpu.h         | 15 +++++++++++++++
 drivers/gpu/drm/msm/msm_ringbuffer.c  |  2 +-
 drivers/gpu/drm/msm/msm_submitqueue.c |  9 +++++----
 5 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 405f8411e395..d69fcb37ce17 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -313,8 +313,7 @@ void msm_gem_vunmap(struct drm_gem_object *obj);
 
 /* Created per submit-ioctl, to track bo's and cmdstream bufs, etc,
  * associated with the cmdstream submission for synchronization (and
- * make it easier to unwind when things go wrong, etc).  This only
- * lasts for the duration of the submit-ioctl.
+ * make it easier to unwind when things go wrong, etc).
  */
 struct msm_gem_submit {
 	struct kref ref;
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 44f84bfd0c0e..6d46f9275a40 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -655,6 +655,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	bool has_ww_ticket = false;
 	unsigned i;
 	int ret, submitid;
+
 	if (!gpu)
 		return -ENXIO;
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 710c3fedfbf3..96efcb31e502 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -250,6 +250,21 @@ struct msm_gpu_perfcntr {
 	const char *name;
 };
 
+/**
+ * A submitqueue is associated with a gl context or vk queue (or equiv)
+ * in userspace.
+ *
+ * @id:        userspace id for the submitqueue, unique within the drm_file
+ * @flags:     userspace flags for the submitqueue, specified at creation
+ *             (currently unusued)
+ * @prio:      the submitqueue priority
+ * @faults:    the number of GPU hangs associated with this submitqueue
+ * @ctx:       the per-drm_file context associated with the submitqueue (ie.
+ *             which set of pgtables do submits jobs associated with the
+ *             submitqueue use)
+ * @node:      node in the context's list of submitqueues
+ * @ref:       reference count
+ */
 struct msm_gpu_submitqueue {
 	int id;
 	u32 flags;
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 7e92d9532454..054461662af5 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -32,7 +32,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 
 	if (IS_ERR(ring->start)) {
 		ret = PTR_ERR(ring->start);
-		ring->start = 0;
+		ring->start = NULL;
 		goto fail;
 	}
 
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index c3d206105d28..e5eef11ed014 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -98,17 +98,18 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 	return 0;
 }
 
+/*
+ * Create the default submit-queue (id==0), used for backwards compatibility
+ * for userspace that pre-dates the introduction of submitqueues.
+ */
 int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx)
 {
 	struct msm_drm_private *priv = drm->dev_private;
 	int default_prio;
 
-	if (!ctx)
-		return 0;
-
 	/*
 	 * Select priority 2 as the "default priority" unless nr_rings is less
-	 * than 2 and then pick the lowest pirority
+	 * than 2 and then pick the lowest priority
 	 */
 	default_prio = priv->gpu ?
 		clamp_t(uint32_t, 2, 0, priv->gpu->nr_rings - 1) : 0;
-- 
2.31.1

