Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F08D41FD25A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 18:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581DD6E978;
	Wed, 17 Jun 2020 16:40:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC636E978
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 16:40:51 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 644A7B23;
 Wed, 17 Jun 2020 18:40:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1592412047;
 bh=gtaHvQiR2UQyr2lxj67EbhhgMHSkct2VA25esCQyG+4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zy2UzStG6yL4e1ZmFgIdsbnJsDS7k77EqLOHYC9KTlt13ZvEuRtn0A1F0EkM8RgLt
 YllJFNCQOMwplMP5GVO9K9uXvgtusefAQU/7Eb7hQy+y00HDLof14uqDUtGty7scpP
 B/lwOIYo6/REw60QzcC3V5quxhWMwCHdFv43PTso=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 10/22] drm: mxsfb: Rename mxsfb_crtc.c to mxsfb_kms.c
Date: Wed, 17 Jun 2020 19:40:03 +0300
Message-Id: <20200617164015.30448-11-laurent.pinchart@ideasonboard.com>
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

The mxsfb_crtc.c file doesn't handle just the CRTC, but also the other
KMS objects. Rename it accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Stefan Agner <stefan@agner.ch>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 drivers/gpu/drm/mxsfb/Makefile                      | 2 +-
 drivers/gpu/drm/mxsfb/{mxsfb_crtc.c => mxsfb_kms.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/gpu/drm/mxsfb/{mxsfb_crtc.c => mxsfb_kms.c} (100%)

diff --git a/drivers/gpu/drm/mxsfb/Makefile b/drivers/gpu/drm/mxsfb/Makefile
index 811584e54ad1..26d153896d72 100644
--- a/drivers/gpu/drm/mxsfb/Makefile
+++ b/drivers/gpu/drm/mxsfb/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-mxsfb-y := mxsfb_drv.o mxsfb_crtc.o
+mxsfb-y := mxsfb_drv.o mxsfb_kms.o
 obj-$(CONFIG_DRM_MXSFB)	+= mxsfb.o
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
similarity index 100%
rename from drivers/gpu/drm/mxsfb/mxsfb_crtc.c
rename to drivers/gpu/drm/mxsfb/mxsfb_kms.c
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
