Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C44122E3DC
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 04:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D9A6E14C;
	Mon, 27 Jul 2020 02:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389766E0E5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 02:07:14 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A9DA4A1B;
 Mon, 27 Jul 2020 04:07:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595815628;
 bh=/U4eNL71cHcJ7WT+/AsaOdgjp3WvSCKAjl40JEac+pA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Qg5sCHxlFP94MWsEtDdV/nNmSYhl8QGYnomkOH26e9+m/JrT0pbo1npmZlYgIvxHD
 bDvnzP6GIDgVu5YCsBPXzXdBryR5Vmln/Jghx4ztEwpVcYzj4tJR2/gakPtoY1AJRw
 1HW0KhMXQqvEYH9nw9fcW8ZKBwbEGuY0OruC+b0I=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 04/22] drm: mxsfb: Remove unused macros from mxsfb_regs.h
Date: Mon, 27 Jul 2020 05:06:36 +0300
Message-Id: <20200727020654.8231-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200727020654.8231-1-laurent.pinchart@ideasonboard.com>
References: <20200727020654.8231-1-laurent.pinchart@ideasonboard.com>
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

mxsfb_regs.h defines macros related to register bits. Some of them are
not used and don't clearly map to any particular register, so their
purpose isn't known. Remove them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Stefan Agner <stefan@agner.ch>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_regs.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_regs.h b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
index 713d8f830135..78e6cb754712 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_regs.h
+++ b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
@@ -91,17 +91,9 @@
 #define MXSFB_MAX_XRES			0xffff
 #define MXSFB_MAX_YRES			0xffff
 
-#define RED 0
-#define GREEN 1
-#define BLUE 2
-#define TRANSP 3
-
 #define STMLCDIF_8BIT  1 /* pixel data bus to the display is of 8 bit width */
 #define STMLCDIF_16BIT 0 /* pixel data bus to the display is of 16 bit width */
 #define STMLCDIF_18BIT 2 /* pixel data bus to the display is of 18 bit width */
 #define STMLCDIF_24BIT 3 /* pixel data bus to the display is of 24 bit width */
 
-#define MXSFB_SYNC_DATA_ENABLE_HIGH_ACT	(1 << 6)
-#define MXSFB_SYNC_DOTCLK_FALLING_ACT	(1 << 7) /* negative edge sampling */
-
 #endif /* __MXSFB_REGS_H__ */
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
