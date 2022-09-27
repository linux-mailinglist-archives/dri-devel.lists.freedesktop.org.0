Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9EB5ED122
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 01:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E63310E19E;
	Tue, 27 Sep 2022 23:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A5510E199
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 23:38:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6B9CF4F7;
 Wed, 28 Sep 2022 01:38:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664321904;
 bh=8/Ehul/SusWcC18WGUjh/xS0rQilyT78KsMBptGoQlc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dBdK67VahbBgAifwGgQfl61ilAksK7z8veZdOuWOpDpM32UfgKL6zMzu4Yaq7BKIO
 psvVLAB5iv1BztiIY8VokCFLoRXAI+Ne+0+WTJAkgA/CaZLTZcAUMEsDHxgyD52GrU
 gFQKY5Z/16idtjqiZb18WiO2Ei/josnN6b4eEMns=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm: lcdif: Fix indentation in lcdif_regs.h
Date: Wed, 28 Sep 2022 02:38:18 +0300
Message-Id: <20220927233821.8007-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220927233821.8007-1-laurent.pinchart@ideasonboard.com>
References: <20220927233821.8007-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A couple of the register macro values are incorrectly indented. Fix
them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/mxsfb/lcdif_regs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_regs.h b/drivers/gpu/drm/mxsfb/lcdif_regs.h
index 8e8bef175bf2..013f2cace2a0 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_regs.h
+++ b/drivers/gpu/drm/mxsfb/lcdif_regs.h
@@ -130,7 +130,7 @@
 #define CTRL_FETCH_START_OPTION_BPV	BIT(9)
 #define CTRL_FETCH_START_OPTION_RESV	GENMASK(9, 8)
 #define CTRL_FETCH_START_OPTION_MASK	GENMASK(9, 8)
-#define CTRL_NEG				BIT(4)
+#define CTRL_NEG			BIT(4)
 #define CTRL_INV_PXCK			BIT(3)
 #define CTRL_INV_DE			BIT(2)
 #define CTRL_INV_VS			BIT(1)
@@ -186,7 +186,7 @@
 #define INT_ENABLE_D1_PLANE_PANIC_EN	BIT(0)
 
 #define CTRLDESCL0_1_HEIGHT(n)		(((n) & 0xffff) << 16)
-#define CTRLDESCL0_1_HEIGHT_MASK		GENMASK(31, 16)
+#define CTRLDESCL0_1_HEIGHT_MASK	GENMASK(31, 16)
 #define CTRLDESCL0_1_WIDTH(n)		((n) & 0xffff)
 #define CTRLDESCL0_1_WIDTH_MASK		GENMASK(15, 0)
 
-- 
Regards,

Laurent Pinchart

