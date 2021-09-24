Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCFC416C24
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 08:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACBB6EE04;
	Fri, 24 Sep 2021 06:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 436 seconds by postgrey-1.36 at gabe;
 Fri, 24 Sep 2021 06:50:52 UTC
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C486EDF1;
 Fri, 24 Sep 2021 06:50:52 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4C667581073;
 Fri, 24 Sep 2021 02:44:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 24 Sep 2021 02:44:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=r21xTV04JhLQh
 FFcwkc0d4AVLdWU1vIuTxgVGoPXBxw=; b=M7ahpHCPB7321OXSbKVvrjkxlGxiv
 ssKom+46HIxjIovT9mByAOO4Z4xj6yTjt2ETbwIqZrHo2hxnWOpCTQVmjAdIHp/i
 ni8IfdFwjthv0vUiJQ3J19IAwF6TQTz65SSpEn4vdmswzJirYSBPvW2ZbtitDNal
 AoduoBTEcL4ca5REzpJBG5Nuv/CGIPEis1ub9dIV2y3T+VYb940fcxcTLn8Foq0z
 d6bT+M1kxV0AHip45O0DRxWYKaH4FxiZIqO1pD7bR/ho0sSXhHCP/E2+WOX6gzdM
 UFX2qfZ+rL2d9T1UqA1+XQwLIEyREFQHKUfD34PcsRN/tLSs5+1sEEh0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=r21xTV04JhLQhFFcwkc0d4AVLdWU1vIuTxgVGoPXBxw=; b=EfH71FX5
 /yTI3z7wTTcxOGH+JLGUH40I8oWztFOUdvGNz9cLweZTaNrDrUtY6PWYRmQfiLtj
 RAcvEL+Qbkt+epV5b8oR/9D8odJVtKIGq0TwgU7qcis2Ls3qP73O6hQA04LqgT8I
 cPFBld2PFvurjHdqGCZSR4qpw3pXjYODzorVLDiLE9xbcSGSmsdMgCtQeCNfi0qh
 rKXerajm5qYGMmjoCPP5TZUWTlH9qcW2Q2K01OKMjBzvYTIHHqGZ8dVbmnBkVDg9
 r9cT7WOv37O1b4jh79Krk/MpUNxH91pMxy+pu396DvAf5H2NtJR9wVR64BgcBST8
 YZiRcbt4cmKNZA==
X-ME-Sender: <xms:snNNYVWgJd9-Ru-GdwZUY4iPCrn9HkpF1f8FBEVCCofAq2nJ_X-BFQ>
 <xme:snNNYVm-Y53koYzrGOHVdJjKKhdB0KjMgW9QSFYkmpq9nn5U4d2QgqwzQl1v0sXxc
 8gQ4jWpCaCbQZ59Ng>
X-ME-Received: <xmr:snNNYRZa6D_--J_EIDD1EVSAHtmmB9zlfX-8Vi9mzdqAXIBKmdC9d3YoN0vMc-0ClTvB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedvnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:snNNYYWLCVzNetB6aLClQDs5RGRSHoTkoeoXA-pB0E-1wYwUcUpOgg>
 <xmx:snNNYfmpSfQTa4hoe4jP7J2oKANsRP4DnllLZ71kbwu9QUyPfE6uuA>
 <xmx:snNNYVexhVL3viV5f19LJd_Rqvgtk2448TSCn99QGJx4dmbLGWt-Qw>
 <xmx:snNNYYiX3KacXc4Mp2WcUi73IIR7R09dAKyTMP10X7fycvMbOuZw2A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 02:43:59 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v2 10/17] drm/nouveau: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Fri, 24 Sep 2021 08:43:17 +0200
Message-Id: <20210924064324.229457-11-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210924064324.229457-1-greenfoo@u92.eu>
References: <20210924064324.229457-1-greenfoo@u92.eu>
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

As requested in Documentation/gpu/todo.rst, replace driver calls to
drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
DRM_MODESET_LOCK_ALL_END()

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
Reviewed-by: Sean Paul <sean@poorly.run>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index d7b9f7f8c9e3..86e18a844953 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -42,6 +42,7 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_scdc_helper.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_drv.h>
 
 #include <nvif/push507c.h>
 
@@ -667,16 +668,18 @@ nv50_audio_component_bind(struct device *kdev, struct device *hda_kdev,
 	struct drm_device *drm_dev = dev_get_drvdata(kdev);
 	struct nouveau_drm *drm = nouveau_drm(drm_dev);
 	struct drm_audio_component *acomp = data;
+	struct drm_modeset_acquire_ctx ctx;
+	int ret;
 
 	if (WARN_ON(!device_link_add(hda_kdev, kdev, DL_FLAG_STATELESS)))
 		return -ENOMEM;
 
-	drm_modeset_lock_all(drm_dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(drm_dev, ctx, 0, ret);
 	acomp->ops = &nv50_audio_component_ops;
 	acomp->dev = kdev;
 	drm->audio.component = acomp;
-	drm_modeset_unlock_all(drm_dev);
-	return 0;
+	DRM_MODESET_LOCK_ALL_END(drm_dev, ctx, ret);
+	return ret;
 }
 
 static void
@@ -686,12 +689,14 @@ nv50_audio_component_unbind(struct device *kdev, struct device *hda_kdev,
 	struct drm_device *drm_dev = dev_get_drvdata(kdev);
 	struct nouveau_drm *drm = nouveau_drm(drm_dev);
 	struct drm_audio_component *acomp = data;
+	struct drm_modeset_acquire_ctx ctx;
+	int ret;
 
-	drm_modeset_lock_all(drm_dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(drm_dev, ctx, 0, ret);
 	drm->audio.component = NULL;
 	acomp->ops = NULL;
 	acomp->dev = NULL;
-	drm_modeset_unlock_all(drm_dev);
+	DRM_MODESET_LOCK_ALL_END(drm_dev, ctx, ret);
 }
 
 static const struct component_ops nv50_audio_component_bind_ops = {
-- 
2.33.0

