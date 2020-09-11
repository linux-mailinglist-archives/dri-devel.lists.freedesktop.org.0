Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92217268566
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19286E1F5;
	Mon, 14 Sep 2020 07:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C19346E99B
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 10:07:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.76,414,1592838000"; d="scan'208";a="56813791"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 11 Sep 2020 19:07:48 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4762C4240D3B;
 Fri, 11 Sep 2020 19:07:46 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Kconfig: Update description for DRM_RCAR_DW_HDMI config
Date: Fri, 11 Sep 2020 11:07:41 +0100
Message-Id: <20200911100741.20013-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 14 Sep 2020 07:03:05 +0000
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
Cc: linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 linux-kernel@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

rcar_dw_hdmi driver is also used on Renesas RZ/G2 SoC's, update the
same to reflect the description for DRM_RCAR_DW_HDMI config.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
---
 drivers/gpu/drm/rcar-du/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index f65d1489dc50..bd8b43fb9753 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -22,11 +22,11 @@ config DRM_RCAR_CMM
 	  Enable support for R-Car Color Management Module (CMM).
 
 config DRM_RCAR_DW_HDMI
-	tristate "R-Car DU Gen3 HDMI Encoder Support"
+	tristate "R-Car Gen3 and RZ/G2 DU HDMI Encoder Support"
 	depends on DRM && OF
 	select DRM_DW_HDMI
 	help
-	  Enable support for R-Car Gen3 internal HDMI encoder.
+	  Enable support for R-Car Gen3 or RZ/G2 internal HDMI encoder.
 
 config DRM_RCAR_LVDS
 	tristate "R-Car DU LVDS Encoder Support"
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
