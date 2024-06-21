Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E9A912777
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 16:20:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B4410F1B2;
	Fri, 21 Jun 2024 14:20:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MwXVhScY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5393410F1B2;
 Fri, 21 Jun 2024 14:20:42 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-7955af79812so119536085a.1; 
 Fri, 21 Jun 2024 07:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718979641; x=1719584441; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1Ax3V0PI9lRLt/9wOMCnz0yGt/ejGnQ/7v+NQM5ooHU=;
 b=MwXVhScYAaLBJJIxXIOboe/ju0CfO+DJ5dPVWsEU6svb50JFDmcbxh+H+TPeHjbEUX
 uefU54TIM7YYPDmj5FpGfJfTtCdt8n7EzmAE3LB+a1VYxuj0RXOHwZEfcaFwjf9+f+xz
 Mau7j4b6p3Rl2GwWsOb60D2CX0PGG5W9vCe0au3mUlK3nl5ZEuulCIm2rsf+TNZGVuJO
 52sYJDg4NP5d48sxlVB8KPmc8xHSvoyHseP9NDm++s6zmexjxrQL4PC10vnOT5XvXrwu
 PChY8MF28Hb+zyIk7pm94ZsgiOe9KrX7k5WTLS5YERsh9ji85GXga68ZqUu4nre1sika
 1NFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718979641; x=1719584441;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1Ax3V0PI9lRLt/9wOMCnz0yGt/ejGnQ/7v+NQM5ooHU=;
 b=nA4epd3h3JUPdiJcLaVah0J8v4JQrwLoNPp3su+s4upqPyIB41wvuUCO0wBwo/Afet
 N/kqCXiI2XAVT4qghe+Dl5ttI4o/RNI0FLnitU23h5f+TCCRVmdYSDcPgQ3tX+ylnMhm
 x6RwW6GC6vtSbBuy8Uc41Ehq8ko3/X+YSHzCz4DAXRaO9lbjOM57ZRY1cpxsmoXv+CEO
 SLdr49l1bDwNJ9QOv/aObSb5TaNg0dsdcBdFJnFfOFD8CqDuDEI7HOQ77gZbeNkZ9xsN
 63mavRPdiBWrNIy6V5eibglMS0marcqo60ZTAsN5ythnyDue/1sD/+AHjB3sx9xbKYvO
 j+cA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh18A73/HGTQ9KKF7cgIc4GCB/W4cU+eroPbBPh+evZj0Rb3MymyYY7F6KuYsfoHaXoZz+Ybxkw8IKDcp4ljUN7ym+ouGOraYjs436mJ9Lw6ZJX9rCWqQR4dt66cjPfiQpSr52ggFqCgmLvd1NsQ==
X-Gm-Message-State: AOJu0Yyq0OH6QWMAXo8jJDG6llxfp2c49EyJx+Bp6xmmmIZhR0n4d1in
 QDS7pA0VQLkHFC6rBE4oQAjaKFDgWZstB1QMls8tPcv+Xhrpyytu
X-Google-Smtp-Source: AGHT+IHh5zA581fCnYb2a44l7zRgNJB06hnRAG7t/AwEA69COzAOb1erZse9jMyqwB0pJNn8gzk1KA==
X-Received: by 2002:a05:620a:2485:b0:798:dabc:a669 with SMTP id
 af79cd13be357-79bb3ebdadfmr979067385a.59.1718979641024; 
 Fri, 21 Jun 2024 07:20:41 -0700 (PDT)
Received: from localhost.localdomain ([142.198.217.108])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-444c2b47ce3sm11698261cf.1.2024.06.21.07.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 07:20:40 -0700 (PDT)
From: Wu Hoi Pok <wuhoipok@gmail.com>
To: 
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Wu Hoi Pok <wuhoipok@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 6/7] drm/radeon: rdev->ddev to rdev_to_drm(rdev) 5
Date: Fri, 21 Jun 2024 10:20:15 -0400
Message-ID: <20240621142018.20117-1-wuhoipok@gmail.com>
X-Mailer: git-send-email 2.45.2
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

Please see Patch v2 1/7 for details.

Signed-off-by: Wu Hoi Pok <wuhoipok@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_ib.c      |  2 +-
 drivers/gpu/drm/radeon/radeon_irq_kms.c | 12 ++++++------
 drivers/gpu/drm/radeon/radeon_object.c  |  2 +-
 drivers/gpu/drm/radeon/radeon_pm.c      | 20 ++++++++++----------
 drivers/gpu/drm/radeon/radeon_ring.c    |  2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c     |  6 +++---
 6 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ib.c b/drivers/gpu/drm/radeon/radeon_ib.c
index 63d914f3414d..1aa41cc3f991 100644
--- a/drivers/gpu/drm/radeon/radeon_ib.c
+++ b/drivers/gpu/drm/radeon/radeon_ib.c
@@ -309,7 +309,7 @@ DEFINE_SHOW_ATTRIBUTE(radeon_debugfs_sa_info);
 static void radeon_debugfs_sa_init(struct radeon_device *rdev)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct dentry *root = rdev->ddev->primary->debugfs_root;
+	struct dentry *root = rdev_to_drm(rdev)->primary->debugfs_root;
 
 	debugfs_create_file("radeon_sa_info", 0444, root, rdev,
 			    &radeon_debugfs_sa_info_fops);
diff --git a/drivers/gpu/drm/radeon/radeon_irq_kms.c b/drivers/gpu/drm/radeon/radeon_irq_kms.c
index c4dda908666c..9961251b44ba 100644
--- a/drivers/gpu/drm/radeon/radeon_irq_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_irq_kms.c
@@ -80,7 +80,7 @@ static void radeon_hotplug_work_func(struct work_struct *work)
 {
 	struct radeon_device *rdev = container_of(work, struct radeon_device,
 						  hotplug_work.work);
-	struct drm_device *dev = rdev->ddev;
+	struct drm_device *dev = rdev_to_drm(rdev);
 	struct drm_mode_config *mode_config = &dev->mode_config;
 	struct drm_connector *connector;
 
@@ -101,7 +101,7 @@ static void radeon_dp_work_func(struct work_struct *work)
 {
 	struct radeon_device *rdev = container_of(work, struct radeon_device,
 						  dp_work);
-	struct drm_device *dev = rdev->ddev;
+	struct drm_device *dev = rdev_to_drm(rdev);
 	struct drm_mode_config *mode_config = &dev->mode_config;
 	struct drm_connector *connector;
 
@@ -197,7 +197,7 @@ static void radeon_driver_irq_uninstall_kms(struct drm_device *dev)
 
 static int radeon_irq_install(struct radeon_device *rdev, int irq)
 {
-	struct drm_device *dev = rdev->ddev;
+	struct drm_device *dev = rdev_to_drm(rdev);
 	int ret;
 
 	if (irq == IRQ_NOTCONNECTED)
@@ -218,7 +218,7 @@ static int radeon_irq_install(struct radeon_device *rdev, int irq)
 
 static void radeon_irq_uninstall(struct radeon_device *rdev)
 {
-	struct drm_device *dev = rdev->ddev;
+	struct drm_device *dev = rdev_to_drm(rdev);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 
 	radeon_driver_irq_uninstall_kms(dev);
@@ -322,9 +322,9 @@ int radeon_irq_kms_init(struct radeon_device *rdev)
 	spin_lock_init(&rdev->irq.lock);
 
 	/* Disable vblank irqs aggressively for power-saving */
-	rdev->ddev->vblank_disable_immediate = true;
+	rdev_to_drm(rdev)->vblank_disable_immediate = true;
 
-	r = drm_vblank_init(rdev->ddev, rdev->num_crtc);
+	r = drm_vblank_init(rdev_to_drm(rdev), rdev->num_crtc);
 	if (r) {
 		return r;
 	}
diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index a955f8a2f7fe..450ff7daa46c 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -150,7 +150,7 @@ int radeon_bo_create(struct radeon_device *rdev,
 	bo = kzalloc(sizeof(struct radeon_bo), GFP_KERNEL);
 	if (bo == NULL)
 		return -ENOMEM;
-	drm_gem_private_object_init(rdev->ddev, &bo->tbo.base, size);
+	drm_gem_private_object_init(rdev_to_drm(rdev), &bo->tbo.base, size);
 	bo->rdev = rdev;
 	bo->surface_reg = -1;
 	INIT_LIST_HEAD(&bo->list);
diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
index 2d9d9f46f243..b4fb7e70320b 100644
--- a/drivers/gpu/drm/radeon/radeon_pm.c
+++ b/drivers/gpu/drm/radeon/radeon_pm.c
@@ -282,7 +282,7 @@ static void radeon_pm_set_clocks(struct radeon_device *rdev)
 
 	if (rdev->irq.installed) {
 		i = 0;
-		drm_for_each_crtc(crtc, rdev->ddev) {
+		drm_for_each_crtc(crtc, rdev_to_drm(rdev)) {
 			if (rdev->pm.active_crtcs & (1 << i)) {
 				/* This can fail if a modeset is in progress */
 				if (drm_crtc_vblank_get(crtc) == 0)
@@ -299,7 +299,7 @@ static void radeon_pm_set_clocks(struct radeon_device *rdev)
 
 	if (rdev->irq.installed) {
 		i = 0;
-		drm_for_each_crtc(crtc, rdev->ddev) {
+		drm_for_each_crtc(crtc, rdev_to_drm(rdev)) {
 			if (rdev->pm.req_vblank & (1 << i)) {
 				rdev->pm.req_vblank &= ~(1 << i);
 				drm_crtc_vblank_put(crtc);
@@ -671,7 +671,7 @@ static ssize_t radeon_hwmon_show_temp(struct device *dev,
 				      char *buf)
 {
 	struct radeon_device *rdev = dev_get_drvdata(dev);
-	struct drm_device *ddev = rdev->ddev;
+	struct drm_device *ddev = rdev_to_drm(rdev);
 	int temp;
 
 	/* Can't get temperature when the card is off */
@@ -715,7 +715,7 @@ static ssize_t radeon_hwmon_show_sclk(struct device *dev,
 				      struct device_attribute *attr, char *buf)
 {
 	struct radeon_device *rdev = dev_get_drvdata(dev);
-	struct drm_device *ddev = rdev->ddev;
+	struct drm_device *ddev = rdev_to_drm(rdev);
 	u32 sclk = 0;
 
 	/* Can't get clock frequency when the card is off */
@@ -740,7 +740,7 @@ static ssize_t radeon_hwmon_show_vddc(struct device *dev,
 				      struct device_attribute *attr, char *buf)
 {
 	struct radeon_device *rdev = dev_get_drvdata(dev);
-	struct drm_device *ddev = rdev->ddev;
+	struct drm_device *ddev = rdev_to_drm(rdev);
 	u16 vddc = 0;
 
 	/* Can't get vddc when the card is off */
@@ -1692,7 +1692,7 @@ void radeon_pm_fini(struct radeon_device *rdev)
 
 static void radeon_pm_compute_clocks_old(struct radeon_device *rdev)
 {
-	struct drm_device *ddev = rdev->ddev;
+	struct drm_device *ddev = rdev_to_drm(rdev);
 	struct drm_crtc *crtc;
 	struct radeon_crtc *radeon_crtc;
 
@@ -1765,7 +1765,7 @@ static void radeon_pm_compute_clocks_old(struct radeon_device *rdev)
 
 static void radeon_pm_compute_clocks_dpm(struct radeon_device *rdev)
 {
-	struct drm_device *ddev = rdev->ddev;
+	struct drm_device *ddev = rdev_to_drm(rdev);
 	struct drm_crtc *crtc;
 	struct radeon_crtc *radeon_crtc;
 	struct radeon_connector *radeon_connector;
@@ -1826,7 +1826,7 @@ static bool radeon_pm_in_vbl(struct radeon_device *rdev)
 	 */
 	for (crtc = 0; (crtc < rdev->num_crtc) && in_vbl; crtc++) {
 		if (rdev->pm.active_crtcs & (1 << crtc)) {
-			vbl_status = radeon_get_crtc_scanoutpos(rdev->ddev,
+			vbl_status = radeon_get_crtc_scanoutpos(rdev_to_drm(rdev),
 								crtc,
 								USE_REAL_VBLANKSTART,
 								&vpos, &hpos, NULL, NULL,
@@ -1918,7 +1918,7 @@ static void radeon_dynpm_idle_work_handler(struct work_struct *work)
 static int radeon_debugfs_pm_info_show(struct seq_file *m, void *unused)
 {
 	struct radeon_device *rdev = m->private;
-	struct drm_device *ddev = rdev->ddev;
+	struct drm_device *ddev = rdev_to_drm(rdev);
 
 	if  ((rdev->flags & RADEON_IS_PX) &&
 	     (ddev->switch_power_state != DRM_SWITCH_POWER_ON)) {
@@ -1955,7 +1955,7 @@ DEFINE_SHOW_ATTRIBUTE(radeon_debugfs_pm_info);
 static void radeon_debugfs_pm_init(struct radeon_device *rdev)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct dentry *root = rdev->ddev->primary->debugfs_root;
+	struct dentry *root = rdev_to_drm(rdev)->primary->debugfs_root;
 
 	debugfs_create_file("radeon_pm_info", 0444, root, rdev,
 			    &radeon_debugfs_pm_info_fops);
diff --git a/drivers/gpu/drm/radeon/radeon_ring.c b/drivers/gpu/drm/radeon/radeon_ring.c
index 8d1d458286a8..581ae20c46e4 100644
--- a/drivers/gpu/drm/radeon/radeon_ring.c
+++ b/drivers/gpu/drm/radeon/radeon_ring.c
@@ -550,7 +550,7 @@ static void radeon_debugfs_ring_init(struct radeon_device *rdev, struct radeon_r
 {
 #if defined(CONFIG_DEBUG_FS)
 	const char *ring_name = radeon_debugfs_ring_idx_to_name(ring->idx);
-	struct dentry *root = rdev->ddev->primary->debugfs_root;
+	struct dentry *root = rdev_to_drm(rdev)->primary->debugfs_root;
 
 	if (ring_name)
 		debugfs_create_file(ring_name, 0444, root, ring,
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 5c65b6dfb99a..69d0c12fa419 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -682,8 +682,8 @@ int radeon_ttm_init(struct radeon_device *rdev)
 
 	/* No others user of address space so set it to 0 */
 	r = ttm_device_init(&rdev->mman.bdev, &radeon_bo_driver, rdev->dev,
-			       rdev->ddev->anon_inode->i_mapping,
-			       rdev->ddev->vma_offset_manager,
+			       rdev_to_drm(rdev)->anon_inode->i_mapping,
+			       rdev_to_drm(rdev)->vma_offset_manager,
 			       rdev->need_swiotlb,
 			       dma_addressing_limited(&rdev->pdev->dev));
 	if (r) {
@@ -890,7 +890,7 @@ static const struct file_operations radeon_ttm_gtt_fops = {
 static void radeon_ttm_debugfs_init(struct radeon_device *rdev)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct drm_minor *minor = rdev->ddev->primary;
+	struct drm_minor *minor = rdev_to_drm(rdev)->primary;
 	struct dentry *root = minor->debugfs_root;
 
 	debugfs_create_file("radeon_vram", 0444, root, rdev,
-- 
2.45.2

