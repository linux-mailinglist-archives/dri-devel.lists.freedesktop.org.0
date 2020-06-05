Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F9B1EF200
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 09:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6876E6E870;
	Fri,  5 Jun 2020 07:32:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0964F6E86D
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 07:32:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4F8ADB143;
 Fri,  5 Jun 2020 07:32:55 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: abrodkin@synopsys.com, airlied@linux.ie, daniel@ffwll.ch,
 james.qian.wang@arm.com, liviu.dudau@arm.com, mihail.atanassov@arm.com,
 brian.starkey@arm.com, joel@jms.id.au, andrew@aj.id.au, sam@ravnborg.org,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, stefan@agner.ch,
 alison.wang@nxp.com, xinliang.liu@linaro.org, zourongrong@gmail.com,
 john.stultz@linaro.org, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, p.zabel@pengutronix.de, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, paul@crapouillou.net, linus.walleij@linaro.org,
 narmstrong@baylibre.com, khilman@baylibre.com, marex@denx.de,
 laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 benjamin.gaignard@linaro.org, vincent.abriou@st.com, yannick.fertre@st.com,
 philippe.cornu@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 wens@csie.org, jsarha@ti.com, tomi.valkeinen@ti.com, noralf@tronnes.org
Subject: [PATCH v3 01/43] drm/cma-helper: Rename symbols from drm_cma_gem_ to
 drm_gem_cma_
Date: Fri,  5 Jun 2020 09:32:05 +0200
Message-Id: <20200605073247.4057-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200605073247.4057-1-tzimmermann@suse.de>
References: <20200605073247.4057-1-tzimmermann@suse.de>
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
Cc: linux-arm-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-aspeed@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This fixes the naming of several symbols within CMA helpers. No functional
changes are made.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c |  2 +-
 drivers/gpu/drm/drm_gem_cma_helper.c    | 10 +++++-----
 include/drm/drm_gem_cma_helper.h        |  4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index 6b27242b9ee3c..5e7ea0459d018 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -188,7 +188,7 @@ DEFINE_DRM_GEM_CMA_FOPS(fops);
 
 static struct drm_driver aspeed_gfx_driver = {
 	.driver_features        = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
-	.gem_create_object	= drm_cma_gem_create_object_default_funcs,
+	.gem_create_object	= drm_gem_cma_create_object_default_funcs,
 	.dumb_create		= drm_gem_cma_dumb_create,
 	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index b3db3ca7bd7a7..842e2fa332354 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -572,7 +572,7 @@ void drm_gem_cma_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
 }
 EXPORT_SYMBOL_GPL(drm_gem_cma_prime_vunmap);
 
-static const struct drm_gem_object_funcs drm_cma_gem_default_funcs = {
+static const struct drm_gem_object_funcs drm_gem_cma_default_funcs = {
 	.free = drm_gem_cma_free_object,
 	.print_info = drm_gem_cma_print_info,
 	.get_sg_table = drm_gem_cma_prime_get_sg_table,
@@ -581,7 +581,7 @@ static const struct drm_gem_object_funcs drm_cma_gem_default_funcs = {
 };
 
 /**
- * drm_cma_gem_create_object_default_funcs - Create a CMA GEM object with a
+ * drm_gem_cma_create_object_default_funcs - Create a CMA GEM object with a
  *                                           default function table
  * @dev: DRM device
  * @size: Size of the object to allocate
@@ -593,7 +593,7 @@ static const struct drm_gem_object_funcs drm_cma_gem_default_funcs = {
  * A pointer to a allocated GEM object or an error pointer on failure.
  */
 struct drm_gem_object *
-drm_cma_gem_create_object_default_funcs(struct drm_device *dev, size_t size)
+drm_gem_cma_create_object_default_funcs(struct drm_device *dev, size_t size)
 {
 	struct drm_gem_cma_object *cma_obj;
 
@@ -601,11 +601,11 @@ drm_cma_gem_create_object_default_funcs(struct drm_device *dev, size_t size)
 	if (!cma_obj)
 		return NULL;
 
-	cma_obj->base.funcs = &drm_cma_gem_default_funcs;
+	cma_obj->base.funcs = &drm_gem_cma_default_funcs;
 
 	return &cma_obj->base;
 }
-EXPORT_SYMBOL(drm_cma_gem_create_object_default_funcs);
+EXPORT_SYMBOL(drm_gem_cma_create_object_default_funcs);
 
 /**
  * drm_gem_cma_prime_import_sg_table_vmap - PRIME import another driver's
diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
index 947ac95eb24a9..64b7e9d42129a 100644
--- a/include/drm/drm_gem_cma_helper.h
+++ b/include/drm/drm_gem_cma_helper.h
@@ -107,7 +107,7 @@ void *drm_gem_cma_prime_vmap(struct drm_gem_object *obj);
 void drm_gem_cma_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
 
 struct drm_gem_object *
-drm_cma_gem_create_object_default_funcs(struct drm_device *dev, size_t size);
+drm_gem_cma_create_object_default_funcs(struct drm_device *dev, size_t size);
 
 /**
  * DRM_GEM_CMA_VMAP_DRIVER_OPS - CMA GEM driver operations ensuring a virtual
@@ -118,7 +118,7 @@ drm_cma_gem_create_object_default_funcs(struct drm_device *dev, size_t size);
  * imported buffers.
  */
 #define DRM_GEM_CMA_VMAP_DRIVER_OPS \
-	.gem_create_object	= drm_cma_gem_create_object_default_funcs, \
+	.gem_create_object	= drm_gem_cma_create_object_default_funcs, \
 	.dumb_create		= drm_gem_cma_dumb_create, \
 	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd, \
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle, \
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
