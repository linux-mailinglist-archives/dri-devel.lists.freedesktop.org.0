Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6F56C5191
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 18:02:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F9C410E99E;
	Wed, 22 Mar 2023 17:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8350D10E107
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 17:02:30 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pf1r1-0000PS-Rp; Wed, 22 Mar 2023 18:02:27 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pf1r1-005xjt-2M; Wed, 22 Mar 2023 18:02:27 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pf1r0-0075pQ-6p; Wed, 22 Mar 2023 18:02:26 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH 02/12] drm/tegra: rgb: Make tegra_dc_rgb_remove() return void
Date: Wed, 22 Mar 2023 18:02:13 +0100
Message-Id: <20230322170223.410376-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322170223.410376-1-u.kleine-koenig@pengutronix.de>
References: <20230322170223.410376-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2271;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=R2c12RCoAJNB1Ym1Z8XA0LNnWuyRmRWf7LRJ15IB9g8=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkGzSQ18dFEVstJRUWcrKwK/J/YtT8BBUd69Trh
 TBUl1RWQMWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBs0kAAKCRCPgPtYfRL+
 ToPLB/9u0yBthwpWsinaC30eGwPtXx21a6i9MH8gDfIel05tReXHehmN72rmghXYtwsMwZGgUvY
 7PCOJq3Ft1piC1WBJXr6GQEqogWK8Wsb1QVBjrpyxdtY0i3H+u1kI8qkfVSz2dfzEfgPwH5yi3z
 W/D3Nef9hELh18sVkUnX9ZsWml+dAoUgMMJ7TvI7gEIi2GOXTWPZllWbRXV8EWzHKNTLsDhHKsR
 UY9qk5U/KIuzh/2z9tRpLPtR8+hrJb5U7WgR3+arxLQ5XXCqd3boo+SdaoszmdnHSyLMsDQXR0P
 ESCwCytCkU6VC8RZFFEaUaIkO7CVGO4hjxYf0mAsSTXUt3O0
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: linux-tegra@vger.kernel.org, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function returned zero unconditionally. Make it return no value and
simplify all callers accordingly.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/tegra/dc.c  | 7 +------
 drivers/gpu/drm/tegra/dc.h  | 2 +-
 drivers/gpu/drm/tegra/rgb.c | 6 ++----
 3 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index bd108159fc2c..6bf1b2bc43b1 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -3266,15 +3266,10 @@ static int tegra_dc_probe(struct platform_device *pdev)
 static int tegra_dc_remove(struct platform_device *pdev)
 {
 	struct tegra_dc *dc = platform_get_drvdata(pdev);
-	int err;
 
 	host1x_client_unregister(&dc->client);
 
-	err = tegra_dc_rgb_remove(dc);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to remove RGB output: %d\n", err);
-		return err;
-	}
+	tegra_dc_rgb_remove(dc);
 
 	pm_runtime_disable(&pdev->dev);
 
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index f902794d42cc..0559fa6b1bf7 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -169,7 +169,7 @@ void tegra_crtc_atomic_post_commit(struct drm_crtc *crtc,
 
 /* from rgb.c */
 int tegra_dc_rgb_probe(struct tegra_dc *dc);
-int tegra_dc_rgb_remove(struct tegra_dc *dc);
+void tegra_dc_rgb_remove(struct tegra_dc *dc);
 int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc);
 int tegra_dc_rgb_exit(struct tegra_dc *dc);
 
diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index ff8fce36d2aa..da2d9baca214 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -250,12 +250,12 @@ int tegra_dc_rgb_probe(struct tegra_dc *dc)
 	return 0;
 }
 
-int tegra_dc_rgb_remove(struct tegra_dc *dc)
+void tegra_dc_rgb_remove(struct tegra_dc *dc)
 {
 	struct tegra_rgb *rgb;
 
 	if (!dc->rgb)
-		return 0;
+		return;
 
 	rgb = to_rgb(dc->rgb);
 	clk_put(rgb->pll_d2_out0);
@@ -263,8 +263,6 @@ int tegra_dc_rgb_remove(struct tegra_dc *dc)
 
 	tegra_output_remove(dc->rgb);
 	dc->rgb = NULL;
-
-	return 0;
 }
 
 int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc)
-- 
2.39.2

