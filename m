Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2AE1E8D6D
	for <lists+dri-devel@lfdr.de>; Sat, 30 May 2020 05:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2A26E9B2;
	Sat, 30 May 2020 03:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2824E6E9A1
 for <dri-devel@lists.freedesktop.org>; Sat, 30 May 2020 03:10:44 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 731B925DA;
 Sat, 30 May 2020 05:10:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590808241;
 bh=ZSt5WF/TrxQhaSBdPFX4TUo14nu+fWvKilHnFQC2EJk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qzs1GFjWv5+wlZw2NE+vUihr3ura8gquKA03gNV1OSGu2+1ESbAU97V/9/V+jXoXU
 6mSie+t0uid919RuuxN3iV7B/vTxE2JnsfKKK+wsY5i0/KE1ecE2GrQwvEFvFQ2WJJ
 kVDMML32Oz4ZYQkzyQmjRubUdpvZzZ7b4ZXAc60o=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 10/22] drm: mxsfb: Rename mxsfb_crtc.c to mxsfb_kms.c
Date: Sat, 30 May 2020 06:10:03 +0300
Message-Id: <20200530031015.15492-11-laurent.pinchart@ideasonboard.com>
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

The mxsfb_crtc.c file doesn't handle just the CRTC, but also the other
KMS objects. Rename it accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Stefan Agner <stefan@agner.ch>
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
