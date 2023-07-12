Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C5B74FFBA
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 08:51:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB9410E497;
	Wed, 12 Jul 2023 06:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E138910E497
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 06:50:59 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-76728ae3162so571710385a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 23:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1689144658; x=1691736658;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ikjp8bXOr9w+1zAFDDrD/xtGyBZP1yYzO0vDJOIDmiY=;
 b=oRfKsJ28pU7X/VXGOIWXuIohz/jy3PtnVwxE1tJl+2WoTIRrsSiGyxhk0ztXNgkLS3
 LWmWQ3IuCt55Gf7Nrf3+rInkoIVVctwDPrApYDWUyUXr7AD/zXgZJgtzWZLUMhkMeSNZ
 MldWZiSScORaun1iv/LI/tKwl+0nO+tPtI/q0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689144658; x=1691736658;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ikjp8bXOr9w+1zAFDDrD/xtGyBZP1yYzO0vDJOIDmiY=;
 b=OHKlUdlWhYPyFaVpvYixcTWfzKo4t+gfoM5p1mJG1zmWE81R8FAkWz6rfEuhoZafTb
 5z+79w/8FIx/HYsTlZ9wtpoA7FACKRFv6tFE5WTjfqZ0joHRx8BdInA4vM4ZXfUrKSJ7
 8P+vywb+/WmmvS0FURvOG3j1dLSDhVjNQiz84RDpf75nCGM5+wc0PJzgVfv3tv21+PwJ
 FilvK5aBgeZldsm3vjywiHrYS1d3zPzEEAkti/Bv0VbFMD4PhemyHeaNVDcVSr3y2DqF
 Izf1TD+HgcKE6Nexx+nwcxbF/v8RDgaoAkwbU21mqeW2utdUQxcpQPJ64jX4o7Svk+GM
 M+aw==
X-Gm-Message-State: ABy/qLZ/Y+TIkYmk44zUzXpmFCCzwAflbPLikQ7oRDFjZ8NIyUBtYzv6
 oFih5P7FIFyhnqD+EheEseExmQ==
X-Google-Smtp-Source: APBJJlFNN4hfmssZAwCqbgmaoduWlCOkP5fkqpM7evtL79kHVgTQd+I270rF3FRQnqsRRRkxA3Mg0A==
X-Received: by 2002:a05:620a:47b0:b0:765:a58f:d080 with SMTP id
 dt48-20020a05620a47b000b00765a58fd080mr16800084qkb.47.1689144658577; 
 Tue, 11 Jul 2023 23:50:58 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:99a0:b85a:11e5:45aa])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a63ae07000000b004fab4455748sm2717499pgf.75.2023.07.11.23.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 23:50:58 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Xin Ji <xji@analogixsemi.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH RESEND v11] drm/bridge: it6505: Fix Kconfig indentation
Date: Wed, 12 Jul 2023 14:50:53 +0800
Message-ID: <20230712065054.2377278-1-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.390.g38632f3daf-goog
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pin-yen Lin <treapking@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Pin-yen Lin <treapking@chromium.org>

Replace the spaces with tab characters in the Kconfig file.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Splitting this patch out of its original type-C mux patch series [1] to
get it merged. This is a cleanup that is not strictly related to the
rest of the series, and that series is still undergoing dicussions about
the design.

[1] https://lore.kernel.org/r/20230331091145.737305-10-treapking@chromium.org
 drivers/gpu/drm/bridge/Kconfig | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 82c68b042444..44a660a4bdbf 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -74,19 +74,19 @@ config DRM_FSL_LDB
 	  Support for i.MX8MP DPI-to-LVDS on-SoC encoder.
 
 config DRM_ITE_IT6505
-        tristate "ITE IT6505 DisplayPort bridge"
-        depends on OF
+	tristate "ITE IT6505 DisplayPort bridge"
+	depends on OF
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HELPER
-        select DRM_DP_AUX_BUS
-        select DRM_KMS_HELPER
-        select DRM_DP_HELPER
-        select EXTCON
-        select CRYPTO
-        select CRYPTO_HASH
-        help
-          ITE IT6505 DisplayPort bridge chip driver.
+	select DRM_DP_AUX_BUS
+	select DRM_KMS_HELPER
+	select DRM_DP_HELPER
+	select EXTCON
+	select CRYPTO
+	select CRYPTO_HASH
+	help
+	  ITE IT6505 DisplayPort bridge chip driver.
 
 config DRM_LONTIUM_LT8912B
 	tristate "Lontium LT8912B DSI/HDMI bridge"
-- 
2.41.0.390.g38632f3daf-goog

