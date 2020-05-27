Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A02B51E43B8
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 15:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB686E2F3;
	Wed, 27 May 2020 13:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D576E2F3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 13:32:16 +0000 (UTC)
Received: from localhost.localdomain ([149.172.98.151]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MmUDf-1jDuoj0QoT-00iQ43; Wed, 27 May 2020 15:32:00 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] drm: pl111: add CONFIG_VEXPRESS_CONFIG dependency
Date: Wed, 27 May 2020 15:31:42 +0200
Message-Id: <20200527133158.462057-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:ldUeL/J8FW2oKcDogEl4FpPKkgKJzAP0nAa0Qp3NE/6Sp3ehAUK
 dkLxyyfABqgYzO9oQ2WwoarPv95MN2CkN2lCnhr63qu5mIUoJLMO5CerOu4QFzNttpk+IIg
 rDJVYuGto8DuSA+qtd2bymO1x+B9nhmIl0Qfu73WN1tEz9sy4XZcxiiHDgXP2E9yipr2dbJ
 AM6MqWeFGEXA4kTDlK8Aw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qaVK8ksw8ZY=:+BK2LBxQSOejB4O1cySgpZ
 08ntmG637DghcP7N1jm096g10EjOUZlu6PkwFCYK5P+JAowP0QLlIjdIACmQDpaRFSguSkgGZ
 g+7YO+Sb+cX2ICd845JNHdo29ZWe8sPDE4sQ6G3Gnvq2tMnR4kCatmrgGw6a5VgDkG2dfEeLT
 y0HUiMw8TpwFkZ1bXyU0vZva/NYTT+qAIS761NETu0hrP1nRu2brTkMU9oEO1gPhGvMI9GJyi
 rs1qLBPqEhY9ywfhIxCC/6KMU+07OM1HVm8f6b2LNhg5Rv7i2SpymSMH0sqitiMjeDrzbT1Ct
 lmPX7yVGJbTTrSz4NMzrsncsGHyqaY1dehwD6hmPx3fdsiPMd9KJ8ljwk4QWI1Hfg2qpottxt
 8q5Xjzhj9tlkJ7QSSHd6FLUlMwXtLBW/9yaj9/pyRhw5IufW0IcvGYH+8Z/OmHrq58nz7B8rX
 yKpR1tjYVPPgDdbtAOQ0dhDxUnX9gF28YMx7kpm3Y/BImDJQvKzRR5gmADwq+T9vaKMcWbrqX
 XImlpZCXqbNTu21RYe624IM4DDI1kmtPZX27fZNrZZkamJcD2RbohaQ0rGSlvfPtEzRnzZis0
 20Qxq4hHlSuGQXQs3XFgZ8WZ9UagA3iPJc/k7zjw0BG4eS3EDmZcVI/qDZ0VrzR/w9lAnLLRQ
 uzZo6TcYUZ/YgEHgX8G9gsMZIxs66y7Rv7qEV+TKRFKzKiOEqTJTn4t/9l+sJb5ggeD5JqTex
 s/WCILNzoM35lvR4Nj7cicaR77pmnGvEaZKg4i+pgvJdQw3UoFH6wn6uYfl4lYipnNFXqExwx
 y7jJXkJOn7qpnUBGLL+BNUYQodYiMb4NwUl4oWjigAoX1E/7dA=
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vexpress_config code fails to link in some configurations:

drivers/gpu/drm/pl111/pl111_versatile.o: in function `pl111_versatile_init':
(.text+0x1f0): undefined reference to `devm_regmap_init_vexpress_config'

Add a dependency that links to this only if the dependency is there,
and prevent the configuration where the drm driver is built-in but
the config is a loadable module.

Fixes: 826fc86b5903 ("drm: pl111: Move VExpress setup into versatile init")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/pl111/Kconfig           | 1 +
 drivers/gpu/drm/pl111/pl111_versatile.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/pl111/Kconfig b/drivers/gpu/drm/pl111/Kconfig
index 80f6748055e3..33a005816fdd 100644
--- a/drivers/gpu/drm/pl111/Kconfig
+++ b/drivers/gpu/drm/pl111/Kconfig
@@ -3,6 +3,7 @@ config DRM_PL111
 	tristate "DRM Support for PL111 CLCD Controller"
 	depends on DRM
 	depends on ARM || ARM64 || COMPILE_TEST
+	depends on VEXPRESS_CONFIG || !VEXPRESS_CONFIG
 	depends on COMMON_CLK
 	select DRM_KMS_HELPER
 	select DRM_KMS_CMA_HELPER
diff --git a/drivers/gpu/drm/pl111/pl111_versatile.c b/drivers/gpu/drm/pl111/pl111_versatile.c
index 64f01a4e6767..451d74205108 100644
--- a/drivers/gpu/drm/pl111/pl111_versatile.c
+++ b/drivers/gpu/drm/pl111/pl111_versatile.c
@@ -476,7 +476,8 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
 	versatile_clcd_type = (enum versatile_clcd)clcd_id->data;
 
 	/* Versatile Express special handling */
-	if (versatile_clcd_type == VEXPRESS_CLCD_V2M) {
+	if (IS_ENABLED(CONFIG_VEXPRESS_CONFIG) &&
+	    versatile_clcd_type == VEXPRESS_CLCD_V2M) {
 		int ret = pl111_vexpress_clcd_init(dev, np, priv);
 		of_node_put(np);
 		if (ret)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
