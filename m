Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DC117E956
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 20:53:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918D76E53C;
	Mon,  9 Mar 2020 19:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A846E53C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 19:53:12 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16DF44101;
 Mon,  9 Mar 2020 20:53:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583783590;
 bh=OyEnW2j1lKun821n1lRVGyidUrADYXi/DUpdNkfttkQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a1jd+yspp52uTQDcXc+Q6Uzd++W2J7+hoAyawmTObxvnRLL0vZq3NVHn5aaZ7K4al
 3R6dzemPrKxa8q5VMWMlydKtokrFC12NjQa+AFmI5AmatjEtttQq6kNgUy+tPErCFU
 xFjJGrKqrcgnpHHjkg2m6WKuSVcYCwxvkCcX+5sI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/21] drm: mxsfb: Rename mxsfb_crtc.c to mxsfb_kms.c
Date: Mon,  9 Mar 2020 21:52:06 +0200
Message-Id: <20200309195216.31042-12-laurent.pinchart@ideasonboard.com>
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

The mxsfb_crtc.c file doesn't handle just the CRTC, but also the other
KMS objects. Rename it accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
