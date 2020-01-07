Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 251B1133095
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 21:33:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3316E136;
	Tue,  7 Jan 2020 20:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 103506E130
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 20:33:03 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1N8GhM-1jjtnH2mDQ-014Clh; Tue, 07 Jan 2020 21:32:35 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH] drm/drm_panel: fix export of drm_panel_of_backlight, try #3
Date: Tue,  7 Jan 2020 21:32:19 +0100
Message-Id: <20200107203231.920256-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:/NhLrxqpg6XKvAA2QlCXou9wFzS/QEKD9R22jKCGu83ingNmFkN
 8MKJzffFKDqvRIrsAPk+c1QSho9DtI86Ndl/BtKD+qRSvZjghtRLKzMid8BkN6Yls7VdoNV
 zAmpNGWH3fEMQN2DuipIjGicyuruC2NiPTCCXC6CNomfbcKXkpQa2iOCj8LI4ZCbS00CRo6
 2pHcQsagbx8cdNUjBi32Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PEMphTNeLWo=:mweMGnIlw93YdAYqxBZoQu
 7H2EeQ4t3AUCa8WHL3++FS0s6CJY7X2UnWl9g7eTvCjiqn/FB67KDtRvP4Q5xTmiZcOImAoih
 o1hXGbxgljwuCuRCXclzum+bMm6SuUY7ANoIQejfdTxKQriLLFMzG+C+VjRx9c23Fzk1O7NDO
 BmtiPqER+q/xyB+p8dEBm8rZeNEflN+l7pji2XRJaafocGfvHA6QawsH924SGJz6IouqJtPEa
 cFhYpNuUTBUCVQmN1v/9ieNuM95hHBQVZ0wcQl63RojxoSewN9+izIJyQp2W4eOJUBYx/7+dk
 Fun2yYNPSZ6WutvLqwP1Mg496/PTRU2hzsq+XtM01QNrL8dwByQviVewb0VuYJgTYWrZ5QhTW
 fS7ddL+1l1ZpfEHlrD2jfCfUMT+lcHIhdAyf7MxlZaijFBepm84O6bYXSflzAp4Yz8M66u00p
 C7u4883CF9OV7r75hZXxELrAIWKGLpWe/qJ0oFC4BnULiAW+QZ6vd0VkZnZFV1F4Y1KzMwxkf
 AZgT2gu3vL6IHC5e3BIcz5GGBHyG1vBEklExqXXfJpO2r3gXZ8iqcIXptrsQuntER0AiWEzVs
 TRBNmGY3UvYfaU9PfYCu4f4bAxGhfplLsWUxKTI92DV2WabM6lv6YSDhkQarHLeYdcvH/GbPV
 Mxpe4fxRKnblva+5ZN+19zUxTmVH/poabY7f1VGR+Inkq5JCkRyKO5JwK0Wph2MHNaDQe3zWj
 r6rtr3+3xFzBB3wwE1MG7YY0Vt7fcQZOOu+BplGWLrk6HTz9nO818HGDNIdMBQqbjlkBYXkg0
 o/1xJm8WQH1jPch7Kjd9F6ym5y3JfV/RrHHRhzznzNOdvi4MwWmODvAiFHhxRphjbuICNGnSM
 d+4mfVH7phEBahBH4CaQ==
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
Cc: Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Sean Paul <sean@poorly.run>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Making this IS_REACHABLE() was still wrong, as that just determines
whether the lower-level backlight code would be reachable from the panel
driver. However, with CONFIG_DRM=y and CONFIG_BACKLIGHT_CLASS_DEVICE=m,
the drm_panel_of_backlight is left out of drm_panel.o but the condition
tells the driver that it is there, leading to multiple link errors such as

ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-sitronix-st7701.ko] undefined!
ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-sharp-ls043t1le01.ko] undefined!
ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-seiko-43wvf1g.ko] undefined!
ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-ronbo-rb070d30.ko] undefined!
ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-rocktech-jh057n00900.ko] undefined!
ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.ko] undefined!
ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.ko] undefined!

Change the condition to check for whether the function was actually part
of the drm module. This version of the patch survived a few hundred
randconfig builds, so I have a good feeling this might be the last
one for the export.

Fixes: 4a34a9dcec94 ("drm/drm_panel: Fix EXPORT of drm_panel_of_backlight() one more time")
Fixes: 907aa265fde6 ("drm/drm_panel: fix EXPORT of drm_panel_of_backlight")
Fixes: 152dbdeab1b2 ("drm/panel: add backlight support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/drm/drm_panel.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 121f7aabccd1..6193cb555acc 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -198,7 +198,8 @@ static inline struct drm_panel *of_drm_find_panel(const struct device_node *np)
 }
 #endif
 
-#if IS_REACHABLE(CONFIG_BACKLIGHT_CLASS_DEVICE)
+#if IS_ENABLED(CONFIG_DRM_PANEL) && (IS_BUILTIN(CONFIG_BACKLIGHT_CLASS_DEVICE) || \
+	(IS_MODULE(CONFIG_DRM) && IS_MODULE(CONFIG_BACKLIGHT_CLASS_DEVICE)))
 int drm_panel_of_backlight(struct drm_panel *panel);
 #else
 static inline int drm_panel_of_backlight(struct drm_panel *panel)
-- 
2.20.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
