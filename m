Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C3E71FD61
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 11:14:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8003510E642;
	Fri,  2 Jun 2023 09:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-119.freemail.mail.aliyun.com
 (out30-119.freemail.mail.aliyun.com [115.124.30.119])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C4BC10E642
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 09:14:24 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R331e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
 TI=SMTPD_---0Vk9MjkN_1685697257; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0Vk9MjkN_1685697257) by smtp.aliyun-inc.com;
 Fri, 02 Jun 2023 17:14:18 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: airlied@gmail.com
Subject: [PATCH -next] drm/meson: Remove unneeded semicolon
Date: Fri,  2 Jun 2023 17:14:16 +0800
Message-Id: <20230602091416.107850-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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
Cc: neil.armstrong@linaro.org, martin.blumenstingl@googlemail.com,
 khilman@baylibre.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yang Li <yang.lee@linux.alibaba.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

./drivers/gpu/drm/meson/meson_dw_mipi_dsi.c:117:2-3: Unneeded semicolon
./drivers/gpu/drm/meson/meson_dw_mipi_dsi.c:231:2-3: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=5392
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
index dd505ac37976..57447abf1a29 100644
--- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
+++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
@@ -114,7 +114,7 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
 	case MIPI_DSI_FMT_RGB666_PACKED:
 	case MIPI_DSI_FMT_RGB565:
 		return -EINVAL;
-	};
+	}
 
 	/* Configure color format for DPI register */
 	writel_relaxed(FIELD_PREP(MIPI_DSI_TOP_DPI_COLOR_MODE, dpi_data_format) |
@@ -228,7 +228,7 @@ static int meson_dw_mipi_dsi_host_attach(void *priv_data,
 	case MIPI_DSI_FMT_RGB565:
 		dev_err(mipi_dsi->dev, "invalid pixel format %d\n", device->format);
 		return -EINVAL;
-	};
+	}
 
 	ret = phy_init(mipi_dsi->phy);
 	if (ret)
-- 
2.20.1.7.g153144c

