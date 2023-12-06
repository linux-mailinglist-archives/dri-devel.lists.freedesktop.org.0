Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF781807B43
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 23:18:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9700810E7D0;
	Wed,  6 Dec 2023 22:18:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B0910E7BF
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 22:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1701901130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=IoK/DWTc/F2oNroTlg8YVK4rpr4uwrYEr8RTRWYORG8=;
 b=tO1XerVK4nfhQMK8rp5eGZJq4vHoJocvfCQUy0pDRql5npwiYj+3dwX79SR9l7ObAfrgoh
 ObUWbHQI9xPDv8DKQfdvX4tHgvHiM7dO6/wxlVXg4LGVRuhIZGPhNryoE3fZ7JWb+qZ78i
 apfWXtDUih6gjo9P9Vyclr9MuetwzpM=
From: Paul Cercueil <paul@crapouillou.net>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH RESEND] drm/exynos: dpi: Change connector type to DPI
Date: Wed,  6 Dec 2023 23:18:41 +0100
Message-ID: <20231206221841.15685-1-paul@crapouillou.net>
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
 linux-arm-kernel@lists.infradead.org
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

