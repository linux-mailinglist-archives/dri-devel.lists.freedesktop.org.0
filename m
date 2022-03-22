Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 632BF4E3F55
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 14:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D62810E5BA;
	Tue, 22 Mar 2022 13:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F7F10E5B3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 13:17:53 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 k124-20020a1ca182000000b0038c9cf6e2a6so1704769wme.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 06:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WuA13UJX7JG/zpqCJnhINZRKEHiIbSLl0nUVh3JZ9Vg=;
 b=O5nFKWZDr8uMRGKs95BFJ6Cx95qmw1WCnaAS8RotZ95rYV3Uh8NOFzM24MqtzFOo9x
 JmkiuMHrQisI6sxWIsQScoWEe2A412ykmRY+wLyXbMvIStgkBqQN7bJQGRkNjVTN08Mr
 hjlwaV9hxjrkimklnTliyCqvELrzR1vfq4vsksOrhOHpb9WzPlldvt3Vqfbi11Nvr8Ww
 C2JQWpb9ZiNtHAAGWrw9eTcIRwVNxzwV+sGVTEYspIojpHxJhrQ7bfvT420HwQyarqRC
 ReG3AZ24lnFrABd+QV7nb1EWoARK7DhgEnqPynP2o4XS5WP39d7xceFKwNG7KdBiRQbX
 o9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WuA13UJX7JG/zpqCJnhINZRKEHiIbSLl0nUVh3JZ9Vg=;
 b=6RVhtCHE67U3n8h3hW/o4G7I4695lg2p7hLNPOFxMLUtfydZL/eqBHkQXes8RXuAqg
 E0hccJirCcIzCp7ord5f2uoFieolA4j8K+R/ZUdxjrDgFmuikPPYBs6PFGQdierU8rpN
 37PLZVXghbKzcAueUjb+vf5byRmEKvdKmrTVuIXxuyeV0VZVw0cSsVtJneW7KAIodQ05
 QHGU2rVHe/BB8GLWM33qljcqG42EwrNy0/0Jy7r4TIMvkUtF5/nnwpCstVHZPo52+xEC
 u58GWEDZiSbwWdzEksBmf5Vnt09KBO6T5opcZy4YPS0efhOD5k5f5jO4Aoz5dPIwZYRX
 ntvA==
X-Gm-Message-State: AOAM532f0PJKgdzjHXivTCPOpp0AeeAEfW/ozc+FhhD6d2kG9SbS1G4K
 LqZuv/61wKZVFdgbkdO4sJ5ZTamziaw=
X-Google-Smtp-Source: ABdhPJxi2MRemdor3dSx2SQigQ76ZthHVyqQFixFzhTQJKFde3vFnY5Et+rowX0VOeAOQPw0RrDGJQ==
X-Received: by 2002:a7b:c383:0:b0:381:1b50:a9d with SMTP id
 s3-20020a7bc383000000b003811b500a9dmr3929741wmj.90.1647955071544; 
 Tue, 22 Mar 2022 06:17:51 -0700 (PDT)
Received: from workstation.suse.de (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 l13-20020a05600002ad00b00203d64c5289sm17978437wry.112.2022.03.22.06.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 06:17:51 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/7] drm/gma500: Add crtc prefix to vblank functions
Date: Tue, 22 Mar 2022 14:17:42 +0100
Message-Id: <20220322131742.11566-7-patrik.r.jakobsson@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220322131742.11566-1-patrik.r.jakobsson@gmail.com>
References: <20220322131742.11566-1-patrik.r.jakobsson@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These functions operate on a crtc and should be prefixed properly.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/gma_display.c | 6 +++---
 drivers/gpu/drm/gma500/psb_irq.c     | 6 +++---
 drivers/gpu/drm/gma500/psb_irq.h     | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma500/gma_display.c
index 369bc1f751cb..34ec3fca09ba 100644
--- a/drivers/gpu/drm/gma500/gma_display.c
+++ b/drivers/gpu/drm/gma500/gma_display.c
@@ -575,9 +575,9 @@ const struct drm_crtc_funcs gma_crtc_funcs = {
 	.set_config = gma_crtc_set_config,
 	.destroy = gma_crtc_destroy,
 	.page_flip = gma_crtc_page_flip,
-	.enable_vblank = gma_enable_vblank,
-	.disable_vblank = gma_disable_vblank,
-	.get_vblank_counter = gma_get_vblank_counter,
+	.enable_vblank = gma_crtc_enable_vblank,
+	.disable_vblank = gma_crtc_disable_vblank,
+	.get_vblank_counter = gma_crtc_get_vblank_counter,
 };
 
 /*
diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/psb_irq.c
index 2e8ded532930..e6e6d61bbeab 100644
--- a/drivers/gpu/drm/gma500/psb_irq.c
+++ b/drivers/gpu/drm/gma500/psb_irq.c
@@ -371,7 +371,7 @@ void gma_irq_uninstall(struct drm_device *dev)
 	free_irq(pdev->irq, dev);
 }
 
-int gma_enable_vblank(struct drm_crtc *crtc)
+int gma_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
 	unsigned int pipe = crtc->index;
@@ -404,7 +404,7 @@ int gma_enable_vblank(struct drm_crtc *crtc)
 	return 0;
 }
 
-void gma_disable_vblank(struct drm_crtc *crtc)
+void gma_crtc_disable_vblank(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
 	unsigned int pipe = crtc->index;
@@ -428,7 +428,7 @@ void gma_disable_vblank(struct drm_crtc *crtc)
 /* Called from drm generic code, passed a 'crtc', which
  * we use as a pipe index
  */
-u32 gma_get_vblank_counter(struct drm_crtc *crtc)
+u32 gma_crtc_get_vblank_counter(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
 	unsigned int pipe = crtc->index;
diff --git a/drivers/gpu/drm/gma500/psb_irq.h b/drivers/gpu/drm/gma500/psb_irq.h
index c22878914f5b..b51e395194ff 100644
--- a/drivers/gpu/drm/gma500/psb_irq.h
+++ b/drivers/gpu/drm/gma500/psb_irq.h
@@ -20,9 +20,9 @@ void gma_irq_postinstall(struct drm_device *dev);
 int  gma_irq_install(struct drm_device *dev, unsigned int irq);
 void gma_irq_uninstall(struct drm_device *dev);
 
-int  gma_enable_vblank(struct drm_crtc *crtc);
-void gma_disable_vblank(struct drm_crtc *crtc);
-u32  gma_get_vblank_counter(struct drm_crtc *crtc);
+int  gma_crtc_enable_vblank(struct drm_crtc *crtc);
+void gma_crtc_disable_vblank(struct drm_crtc *crtc);
+u32  gma_crtc_get_vblank_counter(struct drm_crtc *crtc);
 void gma_enable_pipestat(struct drm_psb_private *dev_priv, int pipe, u32 mask);
 void gma_disable_pipestat(struct drm_psb_private *dev_priv, int pipe, u32 mask);
 
-- 
2.35.1

