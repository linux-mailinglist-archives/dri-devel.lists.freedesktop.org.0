Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 739CF1FD254
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 18:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 746B36E972;
	Wed, 17 Jun 2020 16:40:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791926E96A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 16:40:44 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 08DFF331;
 Wed, 17 Jun 2020 18:40:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1592412042;
 bh=CKNnxVLVBf+wo96GkDFvnJDfSL8NnYLNEVkOrfGb/NQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rf+njVj4Bn/nLLwaZMJNQM1uG/wvsZ6kTEY/15w0ji4G379RkDlNkkWgOrMKoDAji
 2gDR524fZIcxydUvFeGmZkopPhZR31T6NmbeH5/MgmjIZKkNgsQpEv84s4SiKhnL+B
 mjfsOvjfXK3Q+i5jmhcp5V34Wt8BsRMAGbP4h2nE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 01/22] drm: mxsfb: Remove fbdev leftovers
Date: Wed, 17 Jun 2020 19:39:54 +0300
Message-Id: <20200617164015.30448-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200617164015.30448-1-laurent.pinchart@ideasonboard.com>
References: <20200617164015.30448-1-laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, robert.chiras@nxp.com, leonard.crestez@nxp.com,
 linux-imx@nxp.com, kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 8e93f1028d74 ("drm/mxsfb: Use drm_fbdev_generic_setup()")
replaced fbdev handling with drm_fbdev_generic_setup() but left
inclusion of the drm/drm_fb_cma_helper.h header. Remove it.

Fixes: 8e93f1028d74 ("drm/mxsfb: Use drm_fbdev_generic_setup()")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Stefan Agner <stefan@agner.ch>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 47c7dce03da4..96ee67ef9a13 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -24,7 +24,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
