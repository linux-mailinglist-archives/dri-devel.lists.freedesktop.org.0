Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B5129FFAF
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:24:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16D16E99B;
	Fri, 30 Oct 2020 08:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6BB6E8CF
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 19:01:12 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 13F415807F5;
 Thu, 29 Oct 2020 15:01:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 29 Oct 2020 15:01:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=cMPDaJ4oVyrUZy8R8HffZFtzRz
 sRIdEpGx8cwftnZl0=; b=p+rzIW+e+DpaAI2UWHSIJseXOIw3kb90+gzk4fGUgF
 9DIEFgsE0FYlIKzJvfMf/xl3/yHL+zbsN3wj13+zxR1tU7HLpGtJzXaKwZZHymUx
 y/HvtbYgSI0aIn5cSt5PGHnK9w7eJscx1YrDLHo3p6tekWxImZbhv/H0/JWnyNRN
 gN+xkcyfDp0LHaJvgSQc5Gec7pX6hoOjw8vDzGX+dcmjjJHPxCPdkFYJoSUguNLh
 kY7HqbPG2bRF5x2A/ugf9rJYsJt/r5jXs83GONpbPU2o4e8EfnxgIHC3VdBSA/uk
 I2ICca7JAT50Ycvv9CcRG5og1qwQkJy2Ois5Y4oh+WjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=cMPDaJ4oVyrUZy8R8
 HffZFtzRzsRIdEpGx8cwftnZl0=; b=lwh1ofJdVIIR8/tqMH2UvvI7ej7NjLQ3o
 H+euqMrPn9TXbCQXMUkJuC0325/dpQxAt9tvXVn2MJYc9+v6VW8n+BEr0ebkvHJM
 rjFpAvjgZ0YGueAjakr+WgGFGbgzVTCpMBAE0mxliS1igZdLLSC+C71cpl0Z71BO
 a9vjOcgUEPjkX23MJkdR8dekkRPFAiLan4kjjGSabrxfW5BCp+FQE6yHaUyV3a+U
 xxfswRnousa0BsA7HiGhR/RMxCOP3AVKwlfyfXtha971cQ8N2MijZsdf91qPWghz
 6T6hsryPDajPo9u8DDuVyAfUmgvUp2McUNwBk9k7MoYP/4hR23nfA==
X-ME-Sender: <xms:cxGbX72vj4sYP7_xxOZOZ1PVKuABbJ3vloaIiJtTuFLVuc3r3fyGfA>
 <xme:cxGbX6G9Q7T29ONq8F7JYHU7rh6b3Tdt0f-XLiMj0LFbOah-Wnco8U-0LsTshHXES
 WTO3jlLUJQUueifyIk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleefgdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepjeffheduvddvvdelhfegleelfffgieejvdehgfeijedtieeuteejteefueekjeeg
 necukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:cxGbX767AgPeCgjsDRTeXoRMB187FvSRF1AZkaUPa2HCZr9LntcXGw>
 <xmx:cxGbXw0Q4tgczF0ToBFTByAjdmNfhs3QxJWcABJArcjpXz1xS4VEQw>
 <xmx:cxGbX-FH7MDJRVnaUbGVgq5nD2CrHbAuq_0hf5buuvm7wHs4eW4jcw>
 <xmx:dRGbX8YP8FINkQThkXvBQuyehCDQtHTue7JJusCdWBp2PndeBFF2oQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 487463280068;
 Thu, 29 Oct 2020 15:01:07 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 1/6] drm/vc4: bo: Add a managed action to cleanup the cache
Date: Thu, 29 Oct 2020 20:00:59 +0100
Message-Id: <20201029190104.2181730-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The BO cache needs to be cleaned up using vc4_bo_cache_destroy, but it's
not used consistently (vc4_drv's bind calls it in its error path, but
doesn't in unbind), and we can make that automatic through a managed
action. Let's remove the requirement to call vc4_bo_cache_destroy.

Fixes: c826a6e10644 ("drm/vc4: Add a BO cache.")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_bo.c  | 5 +++--
 drivers/gpu/drm/vc4/vc4_drv.c | 1 -
 drivers/gpu/drm/vc4/vc4_drv.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index f432278173cd..730d5775ab42 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -1024,6 +1024,7 @@ int vc4_get_tiling_ioctl(struct drm_device *dev, void *data,
 	return 0;
 }
 
+static void vc4_bo_cache_destroy(struct drm_device *dev, void *unused);
 int vc4_bo_cache_init(struct drm_device *dev)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
@@ -1052,10 +1053,10 @@ int vc4_bo_cache_init(struct drm_device *dev)
 	INIT_WORK(&vc4->bo_cache.time_work, vc4_bo_cache_time_work);
 	timer_setup(&vc4->bo_cache.time_timer, vc4_bo_cache_time_timer, 0);
 
-	return 0;
+	return drmm_add_action(dev, vc4_bo_cache_destroy, NULL);
 }
 
-void vc4_bo_cache_destroy(struct drm_device *dev)
+static void vc4_bo_cache_destroy(struct drm_device *dev, void *unused)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	int i;
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 8f10f609e4f8..eb3fcd8232b5 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -303,7 +303,6 @@ static int vc4_drm_bind(struct device *dev)
 gem_destroy:
 	vc4_gem_destroy(drm);
 	drm_mode_config_cleanup(drm);
-	vc4_bo_cache_destroy(drm);
 dev_put:
 	drm_dev_put(drm);
 	return ret;
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 836fdca5e643..3a989e8b39a2 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -14,6 +14,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_mm.h>
 #include <drm/drm_modeset_lock.h>
 
@@ -808,7 +809,6 @@ struct drm_gem_object *vc4_prime_import_sg_table(struct drm_device *dev,
 						 struct sg_table *sgt);
 void *vc4_prime_vmap(struct drm_gem_object *obj);
 int vc4_bo_cache_init(struct drm_device *dev);
-void vc4_bo_cache_destroy(struct drm_device *dev);
 int vc4_bo_inc_usecnt(struct vc4_bo *bo);
 void vc4_bo_dec_usecnt(struct vc4_bo *bo);
 void vc4_bo_add_to_purgeable_pool(struct vc4_bo *bo);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
