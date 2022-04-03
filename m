Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 488D04F0A93
	for <lists+dri-devel@lfdr.de>; Sun,  3 Apr 2022 17:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 355CB10EBF2;
	Sun,  3 Apr 2022 15:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A40E10EBF1
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Apr 2022 15:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=V6sH+g86l/Gc0arpRwq9DTzlLgDsZvIIMYn0mNrAsdM=; b=sGdljc04ZPiKBo0uzq+te6hrUJ
 e3BVx3oEQjxmXHXyiFKZJ3QSQuJ0l1EaPhzatJ2zp0P3aWWxVOWM6uLlLOHyER1r6/CV7PEUQjsny
 R7mzEBT0Z6GXFqdoLd6JrGwLUu7dHvkF5LVNV1YNYJA0aDm0LPtWX8c1FMosoVSLSwvnFfgPWw3s2
 nwDuNeYmP/+jdDc7NI51x7Qgobwq4qoolb5r87ztoXJ+vEIyR7KXHJNgoYSw0vnsSkSZneP1+4b9n
 hUQWJs0AC4ot7xx891GQpjDTZlX5sZ0dHLco2zocDAcmUUrGHe8Dvp+oEj7T2Y0SkgvmtQWCfkTAy
 EG9rLPug==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nb1y3-00BgU9-Vh; Sun, 03 Apr 2022 15:16:40 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: fix it6505 Kconfig terms
Date: Sun,  3 Apr 2022 08:16:37 -0700
Message-Id: <20220403151637.15546-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 kernel test robot <lkp@intel.com>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Allen Chen <allen.chen@ite.com.tw>,
 dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Hermes Wu <hermes.wu@ite.com.tw>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix around 50 undefined references when DRM_ITE_IT6505=y while
DRM_DP_AUX_BUS=m and DRM_DP_HELPER=m.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Allen Chen <allen.chen@ite.com.tw>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Hermes Wu <hermes.wu@ite.com.tw>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/Kconfig |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20220401.orig/drivers/gpu/drm/bridge/Kconfig
+++ linux-next-20220401/drivers/gpu/drm/bridge/Kconfig
@@ -78,6 +78,8 @@ config DRM_ITE_IT6505
         tristate "ITE IT6505 DisplayPort bridge"
         depends on OF
         select DRM_KMS_HELPER
+	select DRM_DP_AUX_BUS
+	select DRM_DP_HELPER
         select EXTCON
         help
           ITE IT6505 DisplayPort bridge chip driver.
