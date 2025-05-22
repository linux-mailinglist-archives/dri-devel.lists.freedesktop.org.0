Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD600AC09E9
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 12:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5EFA10E7EC;
	Thu, 22 May 2025 10:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CPInUPVN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B1A10E7EC
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 10:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding; s=k1; bh=D/oyArN3YPryZs
 93MERe3cOmBDWIWI3BWGgCTzOTB+E=; b=CPInUPVNBVXrCT3L3+hDOfNtS3Z6Lq
 01PPY966dLBPmR9OJRIfaFzoQ5zuf6i9QbqhfPywA6YoW0IOny0nEXAXzRmGOmp8
 LVyEPe/iClMNUaIp262Gb6VEjWJutYKAyclHG+yUQtXt+dPzlSop/cnNmjXqHJSS
 oeR4T1WupFtdx1FAb9KiMYyS5XEFoqhFDjuUKw98R70tFI0Y5RnnJBbMpQlBLjNe
 lZPS0yhaWNxRF5pOiLHr/N5VnkbD0iQNCZkcmZRPq2t4j09XJe7+oHNyd4DYDchv
 gwpuKKvrOE++ba3HlgBGQy6Z/C4XkUcarSkrgrzy/gHUhWg/g/WQGMSA==
Received: (qmail 3619225 invoked from network); 22 May 2025 12:35:35 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 22 May 2025 12:35:35 +0200
X-UD-Smtp-Session: l3s3148p1@0LCwCrc1uIggAwDPXwj7ADHm2wGe7qss
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Magnus Damm <magnus.damm@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND] drm: renesas: rcar-du: use proper naming for R-Car
Date: Thu, 22 May 2025 12:34:44 +0200
Message-ID: <20250522103530.51972-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Not RCAR, but R-Car.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h
index f9893d7d6dfc..e9e59c5e70d5 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h
@@ -16,7 +16,7 @@ struct rcar_du_format_info;
 struct rcar_du_group;
 
 /*
- * The RCAR DU has 8 hardware planes, shared between primary and overlay planes.
+ * The R-Car DU has 8 hardware planes, shared between primary and overlay planes.
  * As using overlay planes requires at least one of the CRTCs being enabled, no
  * more than 7 overlay planes can be available. We thus create 1 primary plane
  * per CRTC and 7 overlay planes, for a total of up to 9 KMS planes.
-- 
2.47.2

