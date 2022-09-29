Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C7F5EFECD
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 22:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE90510EB1D;
	Thu, 29 Sep 2022 20:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9067B10E075
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 20:42:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E0016505;
 Thu, 29 Sep 2022 22:42:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664484159;
 bh=U8hKV8AsxFxCjC6Q5xZvqjox7qkgS0CBTHm5+Ra59oQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JPDBwlvSa578u9H3DyaszoOnfmOdYQ3ZOoNcZVIq8VunDT9pvKFetL3Ws9Pj8sKEV
 zzDSHCqOoHPLMy1cP9zSRJn8hMdcDep/CNt7VeLyw4rqwuAEpyaqvlmR8qxvqo2i7R
 ofaSiE5NMTrUBj2p0GOgg+m3RMR+U1OkhLVT5Zxw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/4] drm: lcdif: Fix indentation in lcdif_regs.h
Date: Thu, 29 Sep 2022 23:42:32 +0300
Message-Id: <20220929204235.773-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220929204235.773-1-laurent.pinchart@ideasonboard.com>
References: <20220929204235.773-1-laurent.pinchart@ideasonboard.com>
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
 Liu Ying <victor.liu@nxp.com>, Daniel Scally <dan.scally@ideasonboard.com>,
 Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A couple of the register macro values are incorrectly indented. Fix
them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Marek Vasut <marex@denx.de>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Reviewed-by: Liu Ying <victor.liu@nxp.com>
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

