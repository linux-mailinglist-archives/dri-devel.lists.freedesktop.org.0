Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8817DE6BA
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 21:23:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD3210E790;
	Wed,  1 Nov 2023 20:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 358 seconds by postgrey-1.36 at gabe;
 Wed, 01 Nov 2023 20:23:39 UTC
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1441010E790
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 20:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1698869858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=IoK/DWTc/F2oNroTlg8YVK4rpr4uwrYEr8RTRWYORG8=;
 b=pTrlUS5G7n8G6OlGCg4lOP6rgfng255bcKTAZRh9QqcKabyJ8QoitHTCLt0M1JV4odCO2v
 oTZGN4QXHf43wWDvCF6kT8Ah8W9vjDUICO+n0ZpV1v4KXb45vsW1RqYAwW3V+eNB4ndx6p
 ZzKElgmcDKb0oWX6aIwNNvdzXZgiBSM=
From: Paul Cercueil <paul@crapouillou.net>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: [PATCH] drm/exynos: dpi: Change connector type to DPI
Date: Wed,  1 Nov 2023 21:17:31 +0100
Message-ID: <20231101201731.46192-1-paul@crapouillou.net>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When exynos_drm_dpi.c was written, DRM_MODE_CONNECTOR_DPI did not exist
yet and I guess that's the reason why DRM_MODE_CONNECTOR_VGA was used as
the connector type.

However, now it makes more sense to use DRM_MODE_CONNECTOR_DPI as the
connector type.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/exynos/exynos_drm_dpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 378e5381978f..0dc36df6ada3 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -101,7 +101,7 @@ static int exynos_dpi_create_connector(struct drm_encoder *encoder)
 
 	ret = drm_connector_init(encoder->dev, connector,
 				 &exynos_dpi_connector_funcs,
-				 DRM_MODE_CONNECTOR_VGA);
+				 DRM_MODE_CONNECTOR_DPI);
 	if (ret) {
 		DRM_DEV_ERROR(ctx->dev,
 			      "failed to initialize connector with drm\n");
-- 
2.42.0

