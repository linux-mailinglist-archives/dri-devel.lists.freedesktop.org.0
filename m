Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 981131BCEB1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 23:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959766E566;
	Tue, 28 Apr 2020 21:31:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B396E566
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 21:31:22 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1M9WmQ-1jZ47l0nHo-005W2P; Tue, 28 Apr 2020 23:31:09 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH] drm/i915: avoid unused scale_user_to_hw() warning
Date: Tue, 28 Apr 2020 23:30:50 +0200
Message-Id: <20200428213106.3139170-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:rYIYDMxCYWRB2eFt+r4bXR0ojs6VRf8cssYFP45eloPQBq3kk1D
 38AbGpfXilhQ2jU3p6Hjd0QcD2HvV3U+BhpEpeAKZtbVB3ZQ/FfFecRn74a+7glEdjBtxhN
 mCtjym4QUZYwirc3/24PVfET6sA4U1JkY6ymVG2ainX3OdXVUT7FrO8C3wZUz7tT3mANQiP
 1CtPuSaxk0HHZM5ZPj5zQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DmNhM1LrliY=:AH8nBz5qg7//jHMk3FuG07
 G0DALaFRg/496pj0R3g9B8yEMsUsm1tdew0yojIFSWwldeLPjnIe2HxZQpbKnCZOoOx9ZHuzP
 VyIxzhMRF4falqztsfZMGV2K2nwiwdKpNqgAb89X3dBU8BTm2rAzVSchElOWeGYtRNzFRYe6a
 E+xBgEmfmuVo0QRBbaqnPz/mx23ORxpfd7Sd2OBQkI4vCbK4Ro7vfe9fwf4R58epq22aDkehB
 RGZ9W2KHhN+K6H7dkDw1tkcemaqMsca0bLEKk+Ub7kdOMW6lyvSXH3Oe5aCJ4Defd05xZvXZ/
 4HpPa02O3JOQ/D8CfiXMPD+I4Qf9UZseb5GhKxsn6JXwkzJk97xC6vG6fFYL2mTM27BFGyv+R
 sfsA7RAmpWxQnhLbXXlVD1EfhNx3xNHdcB8wOR86EjTbHht3RSyDf6eIw16ni7s3SAtH7wQ8v
 DuUKrhJ7JhRQ4vCj1+ST6H6SzxhGWOoFviaQxWJcQrjGf2tUj+wGYXtBP6IDzpYFha8ccwcKs
 jLKSSqD7PiYYb9exeWgp+JTrQG6A5cRq7N30YoYRSYm+vmiR3UFlrDpSLNEoJh5ys3/hXDhh7
 kb6N3jfYbxHKMq7TnEzc7n2Vja9dUpwFmTura/Qnq0cD3H06zTjCso1oDBOCa+Hn+qaqC9MUC
 OVPnc5G59IGUtsyj92V7FgODe+McbW+Wzs0Gtq6kNoJ4RDRfFQDAlW9b1xKjaEpqMuj6vxY4C
 fUhC3SJkzNA5JkCcsLeA2iHZfzp0JegX/dwe3DL3qz4oTTcqTvvBO8/awKE9ZVeB1aJGx7Tc5
 F6TnuV/kM5UlOls0MI5A8To+exth+rpDd1PSg+Y9CcbNTAoUSE=
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
Cc: Arnd Bergmann <arnd@arndb.de>, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Manasi Navare <manasi.d.navare@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After the function is no longer marked 'inline', there
is now a new warning pointing out that the only caller
is inside of an #ifdef:

drivers/gpu/drm/i915/display/intel_panel.c:493:12: warning: 'scale_user_to_hw' defined but not used [-Wunused-function]
  493 | static u32 scale_user_to_hw(struct intel_connector *connector,
      |            ^~~~~~~~~~~~~~~~

Move the function itself into that #ifdef as well.

Fixes: 81b55ef1f47b ("drm/i915: drop a bunch of superfluous inlines")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/i915/display/intel_panel.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index 4279d2bf884a..92ed67e21c60 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -489,16 +489,6 @@ static u32 scale(u32 source_val,
 	return target_val;
 }
 
-/* Scale user_level in range [0..user_max] to [hw_min..hw_max]. */
-static u32 scale_user_to_hw(struct intel_connector *connector,
-			    u32 user_level, u32 user_max)
-{
-	struct intel_panel *panel = &connector->panel;
-
-	return scale(user_level, 0, user_max,
-		     panel->backlight.min, panel->backlight.max);
-}
-
 /* Scale user_level in range [0..user_max] to [0..hw_max], clamping the result
  * to [hw_min..hw_max]. */
 static u32 clamp_user_to_hw(struct intel_connector *connector,
@@ -1255,6 +1245,16 @@ static u32 intel_panel_get_backlight(struct intel_connector *connector)
 	return val;
 }
 
+/* Scale user_level in range [0..user_max] to [hw_min..hw_max]. */
+static u32 scale_user_to_hw(struct intel_connector *connector,
+			    u32 user_level, u32 user_max)
+{
+	struct intel_panel *panel = &connector->panel;
+
+	return scale(user_level, 0, user_max,
+		     panel->backlight.min, panel->backlight.max);
+}
+
 /* set backlight brightness to level in range [0..max], scaling wrt hw min */
 static void intel_panel_set_backlight(const struct drm_connector_state *conn_state,
 				      u32 user_level, u32 user_max)
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
