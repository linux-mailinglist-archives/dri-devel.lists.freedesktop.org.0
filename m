Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AD31803A8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 17:37:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB7436E22B;
	Tue, 10 Mar 2020 16:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8146E22B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 16:37:48 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AFDCE5F;
 Tue, 10 Mar 2020 17:37:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583858267;
 bh=XvFSrWCnvdAu1xtK+sLllRjK0vyd2NlC1nMEw9/qLRg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CxTvF+ltwQkBWgSWBrcZmWcFa6mWTE1e7u6e719txKhuexxlzaA42WDHnmGGklm89
 zzquCQHtfCC3nTVDqqNDKxmc//tfLWhZ4LIaOWyDhoLwYUcWQbLtbIyKvrhkMRTkUB
 fYu0DpaJB5EjEcLJZ7mLUw3OkSTDU7uZHQSJEvvw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1.1 16/21] drm: mxsfb: Add i.MX7 to the list of supported
 SoCs in Kconfig
Date: Tue, 10 Mar 2020 18:37:39 +0200
Message-Id: <20200310163739.25018-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200310163200.GB4871@pendragon.ideasonboard.com>
References: <20200310163200.GB4871@pendragon.ideasonboard.com>
MIME-Version: 1.0
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
Cc: Marek Vasut <marex@denx.de>, linux-imx@nxp.com,
 Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Extend the Kconfig option description by listing the i.MX7 SoCs, as they
are supported by the same driver. Replace the list of SoCs in the short
description with just "(e)LCDIF LCD controller" to avoid expanding it
further in the future as support for more SoCs is added.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/mxsfb/Kconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
index 0dca8f27169e..0b407338dd46 100644
--- a/drivers/gpu/drm/mxsfb/Kconfig
+++ b/drivers/gpu/drm/mxsfb/Kconfig
@@ -5,7 +5,7 @@ config DRM_MXS
 	  Choose this option to select drivers for MXS FB devices
 
 config DRM_MXSFB
-	tristate "i.MX23/i.MX28/i.MX6SX MXSFB LCD controller"
+	tristate "i.MX (e)LCDIF LCD controller"
 	depends on DRM && OF
 	depends on COMMON_CLK
 	select DRM_MXS
@@ -14,7 +14,8 @@ config DRM_MXSFB
 	select DRM_KMS_CMA_HELPER
 	select DRM_PANEL
 	help
-	  Choose this option if you have an i.MX23/i.MX28/i.MX6SX MXSFB
-	  LCD controller.
+	  Choose this option if you have an LCDIF or eLCDIF LCD controller.
+	  Those devices are found in various i.MX SoC (including i.MX23,
+	  i.MX28, i.MX6SX and i.MX7).
 
 	  If M is selected the module will be called mxsfb.
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
