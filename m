Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 936DF53A36F
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 13:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061B110E2B7;
	Wed,  1 Jun 2022 11:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CDB510E2B7
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 11:03:11 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id d26so1802984wrb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 04:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7T75qdFUJRrTfq8rZsvTxHnq9WmFnzbyWZBt91nUGv4=;
 b=UvVKUFoGj8BE8wKVShM9g1vZtcUpz9koCKyv27BPpa1d69JAA9GuVGSKgRYb5f4H/P
 PuFtTujTXybsEsGRBXrSuCjguJ8As29GCRoa31nEZ+AJqDxA9rfdO/eSEwtp7grTd3/d
 wCMoqhaB4cJohaM7zK3ydnjxjryFPBMhX0KUYbUj9JhduxQ9Hk6+CxvzQdVtRm99XFO+
 7Owow+FtI6e6yOONGf2OCt/HPfwSbcAdNi/KopY6ZXhU5LbKqDNbaek5aeipXUlNY9JM
 pGbBHO+uUiR1HtzB2OPGCut7WxPZCO86tgxwTLv41Z1H+MKooePLcsOptDS13R/y4Ttm
 zvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7T75qdFUJRrTfq8rZsvTxHnq9WmFnzbyWZBt91nUGv4=;
 b=lECoX+jkBROUpiX47y980lg7KivRiRf4LvSXP6FA+Pxrh19IJ/4QemeDjgXacEbJ28
 hD/cAa/0FcBhSj+EX53Qxd55zdMT118nWW6ldsFxDrBrW8z6Qi1A9dWPrkZQCCEuNtFL
 bvrY/BgJSQ93ic7LwM8LK+cP1Mkf35vq4r2PETHz1po8FCdHzF3WFB2HMvKto6PRuo5i
 KuVL88GM1Plf3ZU81XJ+qwSN3FeOwXmvAfG/SHwFdMvTgZgHgyRQc4q5eZsEX4gpkPoR
 ZkvsT2z69MhYJygLkQ6FJr+ko2OmPQPWOugO8q8Pr31C1pan1n+Jmok+FysR4Yz3VPBp
 uhwg==
X-Gm-Message-State: AOAM531WdVxxXbUu3wdi12fyEfG0upJ89aKksncp7zxV0YfxJXzB8X8p
 yBc+JlGjl30fd7LZni8OdK4=
X-Google-Smtp-Source: ABdhPJyFukaGJRvYWHjSXo1WZgIH6pzJMFXudFnk8AkT0I7/rJ/CCSzlqahWs8S6XeTgf8oqGsOiXg==
X-Received: by 2002:a05:6000:1d84:b0:20e:5fae:6e71 with SMTP id
 bk4-20020a0560001d8400b0020e5fae6e71mr54637270wrb.224.1654081389762; 
 Wed, 01 Jun 2022 04:03:09 -0700 (PDT)
Received: from morpheus.home.roving-it.com (82-132-215-116.dab.02.net.
 [82.132.215.116]) by smtp.googlemail.com with ESMTPSA id
 j14-20020a05600c190e00b00397381a7ae8sm6074559wmq.30.2022.06.01.04.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 04:03:09 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, bcm-kernel-feedback-list@broadcom.com,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Emma Anholt <emma@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>,
 javierm@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, maxime@cerno.tech,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Subject: [PATCH v5 2/6] drm/v3d: Get rid of pm code
Date: Wed,  1 Jun 2022 12:02:45 +0100
Message-Id: <20220601110249.569540-3-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601110249.569540-1-pbrobinson@gmail.com>
References: <20220601110249.569540-1-pbrobinson@gmail.com>
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
Cc: Peter Robinson <pbrobinson@gmail.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Runtime PM doesn't seem to work correctly on this driver. On top of
that, commit 8b6864e3e138 ("drm/v3d/v3d_drv: Remove unused static
variable 'v3d_v3d_pm_ops'") hints that it most likely never did as the
driver's PM ops were not hooked-up.

So, in order to support regular operation with V3D on BCM2711 (Raspberry
Pi 4), get rid of the PM code. PM will be reinstated once we figure out
the underlying issues.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
Changes since v5:
- Rebase

Changes since v3:
- Minor updates for rebase

 drivers/gpu/drm/v3d/v3d_debugfs.c | 18 +-----------------
 drivers/gpu/drm/v3d/v3d_drv.c     | 11 -----------
 drivers/gpu/drm/v3d/v3d_gem.c     | 12 +-----------
 3 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/v3d_debugfs.c
index 29fd13109e43..efbde124c296 100644
--- a/drivers/gpu/drm/v3d/v3d_debugfs.c
+++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
@@ -4,7 +4,6 @@
 #include <linux/circ_buf.h>
 #include <linux/ctype.h>
 #include <linux/debugfs.h>
-#include <linux/pm_runtime.h>
 #include <linux/seq_file.h>
 #include <linux/string_helpers.h>
 
@@ -131,11 +130,7 @@ static int v3d_v3d_debugfs_ident(struct seq_file *m, void *unused)
 	struct drm_device *dev = node->minor->dev;
 	struct v3d_dev *v3d = to_v3d_dev(dev);
 	u32 ident0, ident1, ident2, ident3, cores;
-	int ret, core;
-
-	ret = pm_runtime_get_sync(v3d->drm.dev);
-	if (ret < 0)
-		return ret;
+	int core;
 
 	ident0 = V3D_READ(V3D_HUB_IDENT0);
 	ident1 = V3D_READ(V3D_HUB_IDENT1);
@@ -188,9 +183,6 @@ static int v3d_v3d_debugfs_ident(struct seq_file *m, void *unused)
 			   (misccfg & V3D_MISCCFG_OVRTMUOUT) != 0);
 	}
 
-	pm_runtime_mark_last_busy(v3d->drm.dev);
-	pm_runtime_put_autosuspend(v3d->drm.dev);
-
 	return 0;
 }
 
@@ -218,11 +210,6 @@ static int v3d_measure_clock(struct seq_file *m, void *unused)
 	uint32_t cycles;
 	int core = 0;
 	int measure_ms = 1000;
-	int ret;
-
-	ret = pm_runtime_get_sync(v3d->drm.dev);
-	if (ret < 0)
-		return ret;
 
 	if (v3d->ver >= 40) {
 		V3D_CORE_WRITE(core, V3D_V4_PCTR_0_SRC_0_3,
@@ -246,9 +233,6 @@ static int v3d_measure_clock(struct seq_file *m, void *unused)
 		   cycles / (measure_ms * 1000),
 		   (cycles / (measure_ms * 100)) % 10);
 
-	pm_runtime_mark_last_busy(v3d->drm.dev);
-	pm_runtime_put_autosuspend(v3d->drm.dev);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 1afcd54fbbd5..56d5f831e48b 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -19,7 +19,6 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
 #include <drm/drm_drv.h>
@@ -43,7 +42,6 @@ static int v3d_get_param_ioctl(struct drm_device *dev, void *data,
 {
 	struct v3d_dev *v3d = to_v3d_dev(dev);
 	struct drm_v3d_get_param *args = data;
-	int ret;
 	static const u32 reg_map[] = {
 		[DRM_V3D_PARAM_V3D_UIFCFG] = V3D_HUB_UIFCFG,
 		[DRM_V3D_PARAM_V3D_HUB_IDENT1] = V3D_HUB_IDENT1,
@@ -69,17 +67,12 @@ static int v3d_get_param_ioctl(struct drm_device *dev, void *data,
 		if (args->value != 0)
 			return -EINVAL;
 
-		ret = pm_runtime_get_sync(v3d->drm.dev);
-		if (ret < 0)
-			return ret;
 		if (args->param >= DRM_V3D_PARAM_V3D_CORE0_IDENT0 &&
 		    args->param <= DRM_V3D_PARAM_V3D_CORE0_IDENT2) {
 			args->value = V3D_CORE_READ(0, offset);
 		} else {
 			args->value = V3D_READ(offset);
 		}
-		pm_runtime_mark_last_busy(v3d->drm.dev);
-		pm_runtime_put_autosuspend(v3d->drm.dev);
 		return 0;
 	}
 
@@ -280,10 +273,6 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_set_autosuspend_delay(dev, 50);
-	pm_runtime_enable(dev);
-
 	ret = v3d_gem_init(drm);
 	if (ret)
 		goto dma_free;
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 92bc0faee84f..7026214a09f0 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -6,7 +6,6 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/sched/signal.h>
 #include <linux/uaccess.h>
@@ -367,9 +366,6 @@ v3d_job_free(struct kref *ref)
 	dma_fence_put(job->irq_fence);
 	dma_fence_put(job->done_fence);
 
-	pm_runtime_mark_last_busy(job->v3d->drm.dev);
-	pm_runtime_put_autosuspend(job->v3d->drm.dev);
-
 	if (job->perfmon)
 		v3d_perfmon_put(job->perfmon);
 
@@ -471,14 +467,10 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 	job->v3d = v3d;
 	job->free = free;
 
-	ret = pm_runtime_get_sync(v3d->drm.dev);
-	if (ret < 0)
-		goto fail;
-
 	ret = drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue],
 				 v3d_priv);
 	if (ret)
-		goto fail_job;
+		goto fail;
 
 	if (has_multisync) {
 		if (se->in_sync_count && se->wait_stage == queue) {
@@ -509,8 +501,6 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 
 fail_deps:
 	drm_sched_job_cleanup(&job->base);
-fail_job:
-	pm_runtime_put_autosuspend(v3d->drm.dev);
 fail:
 	kfree(*container);
 	*container = NULL;
-- 
2.36.1

