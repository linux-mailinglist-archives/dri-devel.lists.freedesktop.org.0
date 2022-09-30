Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6889E5F06BA
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 10:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 841CC10EBE8;
	Fri, 30 Sep 2022 08:40:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F6C10EBD4
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 08:40:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA8576BE;
 Fri, 30 Sep 2022 10:39:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664527198;
 bh=gFWqkG9ijhylw+d0v/kHt0us/9BVVcqi6PwKUSowQyI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JaWzfxMNZGFNoVaaUgkhOpmCucs/W86cJk5/Dd9GuZFPZ9ijzduHh9nqCpDaIeevC
 UCiQYyhd8luGg3gBOpwCZdTKE2XlVmTDgTMSR/YbdagE4RHp3yJLzm2aL5Aze+s+2P
 L7lYxPNx2D38ELGXlQKa02ajElo0khPT0X5aWE18=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/4] drm: lcdif: Fix indentation in lcdif_regs.h
Date: Fri, 30 Sep 2022 11:39:52 +0300
Message-Id: <20220930083955.31580-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930083955.31580-1-laurent.pinchart@ideasonboard.com>
References: <20220930083955.31580-1-laurent.pinchart@ideasonboard.com>
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
index c70220651e3a..99171d0190eb 100644
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

