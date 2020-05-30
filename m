Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EB61E8D65
	for <lists+dri-devel@lfdr.de>; Sat, 30 May 2020 05:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38026E9A7;
	Sat, 30 May 2020 03:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90FE76E99F
 for <dri-devel@lists.freedesktop.org>; Sat, 30 May 2020 03:10:50 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8E4C2E5E;
 Sat, 30 May 2020 05:10:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590808249;
 bh=SOM/bipu5kQPyWeIgueuDfC85FDPl1TPkI1L9oNcmq4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QJ420oFQVzG/IbWLhhY+45lW6czsTk2+V1YWcqYyDxDczQtiLV4pufc6eLOUsVnOl
 8e8BRPsQZUVHfeaAUWh46cmpbOh4cgfQvjrtomxAQy8M6qGZZzHWxx7G1FXxB9wcAF
 Tu2JlM5dc8KYRk4Pby0kcQOlXIUavOSFAqWWf7jc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 16/22] drm: mxsfb: Add i.MX7 and i.MX8M to the list of
 supported SoCs in Kconfig
Date: Sat, 30 May 2020 06:10:09 +0300
Message-Id: <20200530031015.15492-17-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200530031015.15492-1-laurent.pinchart@ideasonboard.com>
References: <20200530031015.15492-1-laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, linux-imx@nxp.com, kernel@pengutronix.de,
 robert.chiras@nxp.com, leonard.crestez@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Extend the Kconfig option description by listing the i.MX7 and i.MX8M
SoCs, as they are supported by the same driver. Replace the list of SoCs
in the short description with just "(e)LCDIF LCD controller" to avoid
expanding it further in the future as support for more SoCs is added.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Make description more explicit by mentioning LCDIF and eLCDIF
- Add i.MX8M
---
 drivers/gpu/drm/mxsfb/Kconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
index e43b326e9147..0143d539f8f8 100644
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
@@ -15,7 +15,8 @@ config DRM_MXSFB
 	select DRM_PANEL
 	select DRM_PANEL_BRIDGE
 	help
-	  Choose this option if you have an i.MX23/i.MX28/i.MX6SX MXSFB
-	  LCD controller.
+	  Choose this option if you have an LCDIF or eLCDIF LCD controller.
+	  Those devices are found in various i.MX SoC (including i.MX23,
+	  i.MX28, i.MX6SX, i.MX7 and i.MX8M).
 
 	  If M is selected the module will be called mxsfb.
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
