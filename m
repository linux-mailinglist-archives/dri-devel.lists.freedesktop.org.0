Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD2145EB20
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 11:15:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E716EAD3;
	Fri, 26 Nov 2021 10:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E1C6EACD
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 10:15:24 +0000 (UTC)
Received: from Monstersaurus.local
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1D3FE2C;
 Fri, 26 Nov 2021 11:15:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1637921722;
 bh=OfttgS/xTaJk42xnYb6koDiIyJnqo0L8BOT6eZE1OgQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VZyFt9FCi9zKXqrILKVXyodaEYAj8d20xeYEKHgPaiK2Xz73/JPCtqNH2tdGA5JYk
 VelPUCSheUNNAWvP8TlYD1EfZ2aNZQZxutM23hRwrIgstuSIRtHSeuupde6pe/71Gc
 kBXCrSmgdA54f9ZfSZEteMdzAPBti9D5HtwO9d/4=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/4] drm: rcar-du: Fix Makefile indentation for DSI
Date: Fri, 26 Nov 2021 10:15:15 +0000
Message-Id: <20211126101518.938783-2-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211126101518.938783-1-kieran.bingham+renesas@ideasonboard.com>
References: <20211126101518.938783-1-kieran.bingham+renesas@ideasonboard.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
index adc1b49d02cf..286bc81b3e7c 100644
--- a/drivers/gpu/drm/rcar-du/Makefile
+++ b/drivers/gpu/drm/rcar-du/Makefile
@@ -19,7 +19,7 @@ obj-$(CONFIG_DRM_RCAR_CMM)		+= rcar_cmm.o
 obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
 obj-$(CONFIG_DRM_RCAR_DW_HDMI)		+= rcar_dw_hdmi.o
 obj-$(CONFIG_DRM_RCAR_LVDS)		+= rcar_lvds.o
-obj-$(CONFIG_DRM_RCAR_MIPI_DSI)	+= rcar_mipi_dsi.o
+obj-$(CONFIG_DRM_RCAR_MIPI_DSI)		+= rcar_mipi_dsi.o
 
 # 'remote-endpoint' is fixed up at run-time
 DTC_FLAGS_rcar_du_of_lvds_r8a7790 += -Wno-graph_endpoint
-- 
2.30.2

