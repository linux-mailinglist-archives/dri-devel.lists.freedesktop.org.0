Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B11F1B8FDB
	for <lists+dri-devel@lfdr.de>; Sun, 26 Apr 2020 14:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32336E2A9;
	Sun, 26 Apr 2020 12:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17613.qiye.163.com (mail-m17613.qiye.163.com
 [59.111.176.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E13B6E029
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Apr 2020 09:01:55 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [157.0.31.122])
 by mail-m17613.qiye.163.com (Hmail) with ESMTPA id 89EBD48263D;
 Sun, 26 Apr 2020 17:01:48 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/exynos: make pointer to const data const type
Date: Sun, 26 Apr 2020 02:01:42 -0700
Message-Id: <20200426090142.21251-1-bernard@vivo.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZT1VLTEhCQkJDQ0pMT09IQ1lXWShZQU
 hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ODI6Aww4ITg#LEkeKRwqLgwO
 NREaFBFVSlVKTkNMQ0JKTEtDQ01DVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSUlZV1kIAVlBSUNDSTcG
X-HM-Tid: 0a71b5b8a36f93bakuws89ebd48263d
X-Mailman-Approved-At: Sun, 26 Apr 2020 12:35:16 +0000
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
Cc: opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maybe keep pointer which points to global const string data
in const type is better, make sure not change const data.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_mic.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index e080aa92338c..f60d99c85ac9 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -211,7 +211,7 @@
 
 #define OLD_SCLK_MIPI_CLK_NAME "pll_clk"
 
-static char *clk_names[5] = { "bus_clk", "sclk_mipi",
+static const char *const clk_names[5] = { "bus_clk", "sclk_mipi",
 	"phyclk_mipidphy0_bitclkdiv8", "phyclk_mipidphy0_rxclkesc0",
 	"sclk_rgb_vclk_to_dsim0" };
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
index f41d75923557..a86abc173605 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
@@ -88,7 +88,7 @@
 
 #define MIC_BS_SIZE_2D(x)	((x) & 0x3fff)
 
-static char *clk_names[] = { "pclk_mic0", "sclk_rgb_vclk_to_mic0" };
+static const char *const clk_names[] = { "pclk_mic0", "sclk_rgb_vclk_to_mic0" };
 #define NUM_CLKS		ARRAY_SIZE(clk_names)
 static DEFINE_MUTEX(mic_mutex);
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
