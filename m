Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7D99D49E8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 10:24:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C303F10E8BA;
	Thu, 21 Nov 2024 09:24:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lAUUn9Ob";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F420110E8CA;
 Thu, 21 Nov 2024 09:24:15 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a99f646ff1bso105499866b.2; 
 Thu, 21 Nov 2024 01:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732181054; x=1732785854; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L7j4QqoxhFbCgJwkjEEmxm2qKB1etaPM/Wk727FzG74=;
 b=lAUUn9ObVMD3mNxCqwFcZ7CyMPvfmmS4TFRq3IIXYapNCrugBOB7pKhHFKqrJVnrCu
 T+VX/d4qyXxkPHBHNvB6hzGjjLjYOd+KfJN8f62k+n7IHz06DypytBN5zv/+E3TO2tBP
 cIpb+mjJASRU4FUM/R5paacAVII9nKbu1ub5zuRQOJFZ8gE+QJ2YbFWeNUGrWEe5XQAC
 uEGsD2IX3B1X8KwX1xLchu80Mp2htbaHzlas7QDk9yCidoCgKHzzWfF3wxwAwmStOk3u
 02XQq/unqn+buEudRiJNnirDHnyA1tjn/isOoWoyy0J4UwfiaHPOz4huHqYSASs7bsOG
 jR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732181054; x=1732785854;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L7j4QqoxhFbCgJwkjEEmxm2qKB1etaPM/Wk727FzG74=;
 b=hg6gcvQDIb9g2Nr2Thmwg2NSMqVuKRKJJrxXJzjG+UdedInORwr3rXWZBr14p5z206
 sgrawYwARV6AiBu3Y9SGLPpPF5niTrvYst6MDM8TZwZAC2Yrj795ytL2hH4JtB2VWkUf
 S8M/xBFuMI5LHNkiUGoMoJtBR7odF6/kl82uUbRAvNV6FsIrRFzrADt8dJXqC62XO30M
 AeOovZq9Bzlqinf/svMOKn8F+VmSndcWckRlEl5ktvHcCZBtrPpMuBEQsiKGPbSmaWHE
 QXWGS1HQFfoKr4umwRm59CvZb9MDMeaISZ30eMjTjBPudiikBYkCVsBkuGq2RnkduoJx
 LEow==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwrcvv2sSVFK6mHSW4dBWC9/6JhhaMUmepZWzuAJ7VD5kR8woO3uSL50/YLnWyWbz6pr0weI72Zg==@lists.freedesktop.org,
 AJvYcCVXh++vOjIWer5WQBZGf7Pjiv9Cp9QVfP/GLEyzlD90+RNBre28x1Vp43YvXuzDoUVbOCnhCMMt2oI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0fFiXrUyQbDk1H6Lj5Mf8pflcSfi99rP8cvEuck6ns/Z86qhd
 NjS5TVIhMK/cdPiYzunrps6BN1QfiT+wePlmISM+dqRJ0ZpoP1IH
X-Google-Smtp-Source: AGHT+IEZYPG7qh/PlestFeKGHpZh1lDojcSBdGkG+BBHCtprwgWlBnbq7O9VkXEfLN5oXr+sCBlAcg==
X-Received: by 2002:a17:907:7ba3:b0:aa4:9ab1:1985 with SMTP id
 a640c23a62f3a-aa4dd760d98mr510243766b.51.1732181054107; 
 Thu, 21 Nov 2024 01:24:14 -0800 (PST)
Received: from localhost.localdomain (62-178-82-42.cable.dynamic.surfer.at.
 [62.178.82.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa4f4153741sm59112066b.20.2024.11.21.01.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 01:24:13 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, tursulin@igalia.com,
 Christian Gmeiner <cgmeiner@igalia.com>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/etnaviv: Add fdinfo support for memory stats
Date: Thu, 21 Nov 2024 10:24:08 +0100
Message-ID: <20241121092409.3859592-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.47.0
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

From: Christian Gmeiner <cgmeiner@igalia.com>

Use the new helper to export stats about memory usage.

Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 12 +++++++++++-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 12 ++++++++++++
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 6500f3999c5f..35f47dd6367f 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -488,7 +488,16 @@ static const struct drm_ioctl_desc etnaviv_ioctls[] = {
 	ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
 };
 
-DEFINE_DRM_GEM_FOPS(fops);
+static void etnaviv_show_fdinfo(struct drm_printer *p, struct drm_file *file)
+{
+	drm_show_memory_stats(p, file);
+}
+
+static const struct file_operations fops = {
+	.owner = THIS_MODULE,
+	DRM_GEM_FOPS,
+	.show_fdinfo = drm_show_fdinfo,
+};
 
 static const struct drm_driver etnaviv_drm_driver = {
 	.driver_features    = DRIVER_GEM | DRIVER_RENDER,
@@ -498,6 +507,7 @@ static const struct drm_driver etnaviv_drm_driver = {
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = etnaviv_debugfs_init,
 #endif
+	.show_fdinfo        = etnaviv_show_fdinfo,
 	.ioctls             = etnaviv_ioctls,
 	.num_ioctls         = DRM_ETNAVIV_NUM_IOCTLS,
 	.fops               = &fops,
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 5c0c9d4e3be1..e81c261b0017 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -527,6 +527,17 @@ void etnaviv_gem_obj_add(struct drm_device *dev, struct drm_gem_object *obj)
 	mutex_unlock(&priv->gem_lock);
 }
 
+static enum drm_gem_object_status etnaviv_gem_status(struct drm_gem_object *obj)
+{
+	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
+	enum drm_gem_object_status status = 0;
+
+	if (etnaviv_obj->pages)
+		status |= DRM_GEM_OBJECT_RESIDENT;
+
+	return status;
+}
+
 static const struct vm_operations_struct vm_ops = {
 	.fault = etnaviv_gem_fault,
 	.open = drm_gem_vm_open,
@@ -540,6 +551,7 @@ static const struct drm_gem_object_funcs etnaviv_gem_object_funcs = {
 	.get_sg_table = etnaviv_gem_prime_get_sg_table,
 	.vmap = etnaviv_gem_prime_vmap,
 	.mmap = etnaviv_gem_mmap,
+	.status = etnaviv_gem_status,
 	.vm_ops = &vm_ops,
 };
 
-- 
2.47.0

