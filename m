Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7548717E95F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 20:53:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E0E6E570;
	Mon,  9 Mar 2020 19:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B5BD6E55C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 19:53:17 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0CB5A4295;
 Mon,  9 Mar 2020 20:53:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583783593;
 bh=e34hkX1gk+ly2wn0Z7oWr44czMR2Pb0PCe/PMWJYOYM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UfggA4vlFFyMPff7xbWosH8GMBoKCa9w/vwpzTdFdHt+sJBEW7Lod3R9JHpbtjLpA
 K+Or4FS3BrDfOGTMRdw0rjzAQhMnJttzcp1jXyKDPJwzyNn6JfXFNj/U37HZlVoCe3
 RqNeuv4TDazmAOyKlLBLWAZ2hd9IQy6oVVoYWcYI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 16/21] drm: mxsfb: Add i.MX7 to the list of supported SoCs in
 Kconfig
Date: Mon,  9 Mar 2020 21:52:11 +0200
Message-Id: <20200309195216.31042-17-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
References: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, kernel@pengutronix.de, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Extend the Kconfig option description by listing the i.MX7 SoCs, as they
are supported by the same driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/mxsfb/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
index 0dca8f27169e..e91841f8f8a2 100644
--- a/drivers/gpu/drm/mxsfb/Kconfig
+++ b/drivers/gpu/drm/mxsfb/Kconfig
@@ -5,7 +5,7 @@ config DRM_MXS
 	  Choose this option to select drivers for MXS FB devices
 
 config DRM_MXSFB
-	tristate "i.MX23/i.MX28/i.MX6SX MXSFB LCD controller"
+	tristate "i.MX23/i.MX28/i.MX6SX/i.MX7 MXSFB LCD controller"
 	depends on DRM && OF
 	depends on COMMON_CLK
 	select DRM_MXS
@@ -14,7 +14,7 @@ config DRM_MXSFB
 	select DRM_KMS_CMA_HELPER
 	select DRM_PANEL
 	help
-	  Choose this option if you have an i.MX23/i.MX28/i.MX6SX MXSFB
+	  Choose this option if you have an i.MX23/i.MX28/i.MX6SX/i.MX7 MXSFB
 	  LCD controller.
 
 	  If M is selected the module will be called mxsfb.
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
