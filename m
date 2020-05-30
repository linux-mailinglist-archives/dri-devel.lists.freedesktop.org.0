Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FE91E8D6A
	for <lists+dri-devel@lfdr.de>; Sat, 30 May 2020 05:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC846E9AD;
	Sat, 30 May 2020 03:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0046F6E99F
 for <dri-devel@lists.freedesktop.org>; Sat, 30 May 2020 03:10:49 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D9C82E5B;
 Sat, 30 May 2020 05:10:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590808248;
 bh=3wcVQwjZfgKj0JznvrCIYbXX0Q7FqaPT8FZjksalDr8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QD2L+J05g/XElxmzUUJiRzakUGdOj5RmY7reS/D+NFaRp1JL+qWHOKlnJlLamEpoC
 2sN/cAYwUnpWGVrkKyUo7wicfHGQOWYJDZwwQMT1ypaPHzaKpXbWV5ath3tgpho1me
 FZz/AzVgzTJDskmbsQL3HbOXmFVexn3ZPMX01FFI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 15/22] drm: mxsfb: Remove mxsfb_devdata unused fields
Date: Sat, 30 May 2020 06:10:08 +0300
Message-Id: <20200530031015.15492-16-laurent.pinchart@ideasonboard.com>
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

The debug0 and ipversion fields of the mxsfb_devdata structure are
unused. Remove them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Stefan Agner <stefan@agner.ch>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 4 ----
 drivers/gpu/drm/mxsfb/mxsfb_drv.h | 2 --
 2 files changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 72b4f6a947a4..7c9a041f5f6d 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -42,19 +42,15 @@ static const struct mxsfb_devdata mxsfb_devdata[] = {
 		.transfer_count	= LCDC_V3_TRANSFER_COUNT,
 		.cur_buf	= LCDC_V3_CUR_BUF,
 		.next_buf	= LCDC_V3_NEXT_BUF,
-		.debug0		= LCDC_V3_DEBUG0,
 		.hs_wdth_mask	= 0xff,
 		.hs_wdth_shift	= 24,
-		.ipversion	= 3,
 	},
 	[MXSFB_V4] = {
 		.transfer_count	= LCDC_V4_TRANSFER_COUNT,
 		.cur_buf	= LCDC_V4_CUR_BUF,
 		.next_buf	= LCDC_V4_NEXT_BUF,
-		.debug0		= LCDC_V4_DEBUG0,
 		.hs_wdth_mask	= 0x3fff,
 		.hs_wdth_shift	= 18,
-		.ipversion	= 4,
 	},
 };
 
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
index edd766ad254f..607a6a5e6be3 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
@@ -19,10 +19,8 @@ struct mxsfb_devdata {
 	unsigned int	 transfer_count;
 	unsigned int	 cur_buf;
 	unsigned int	 next_buf;
-	unsigned int	 debug0;
 	unsigned int	 hs_wdth_mask;
 	unsigned int	 hs_wdth_shift;
-	unsigned int	 ipversion;
 };
 
 struct mxsfb_drm_private {
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
