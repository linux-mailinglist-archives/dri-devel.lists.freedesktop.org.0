Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EF6836B94
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 17:48:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD5910F03F;
	Mon, 22 Jan 2024 16:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A95B810E6B7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 16:48:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.05,211,1701097200"; d="scan'208";a="195225900"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 23 Jan 2024 01:43:36 +0900
Received: from localhost.localdomain (unknown [10.226.92.211])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4DA8B400387B;
 Tue, 23 Jan 2024 01:43:31 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v16 5/5] MAINTAINERS: Create entry for Renesas RZ DRM drivers
Date: Mon, 22 Jan 2024 16:42:57 +0000
Message-Id: <20240122164257.56326-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240122164257.56326-1-biju.das.jz@bp.renesas.com>
References: <20240122164257.56326-1-biju.das.jz@bp.renesas.com>
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
Cc: Biju Das <biju.das.au@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Create entry for Renesas RZ DRM drivers and add my self as a maintainer.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v15->v16:
 * No change
v14->v15:
 * Added drm-misc tree entry.
 * Sorted the entry(Placed before SHMOBILE)
v13->v14:
 * Now SHMOBILE has maintainer entries. So dropped updating
   DRM DRIVERS FOR RENESAS RCAR AND SHMOBILE.
 * Updated comment header and description.
 * The above changes are trivial, so kept the Rb tag from Laurent.
v12->v13:
 * No change.
v11->v12:
 * No change.
v10->v11:
 * No change.
v9->v10:
 * No change.
v8->v9:
 * Added Rb tag from Laurent.
 * Updated entries for common parts(Makefile and Kconfig).
v8:
 * New patch
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bce9369002a1..09a96f1b8261 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7156,6 +7156,15 @@ F:	Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
 F:	Documentation/devicetree/bindings/display/renesas,du.yaml
 F:	drivers/gpu/drm/renesas/rcar-du/
 
+DRM DRIVERS FOR RENESAS RZ
+M:	Biju Das <biju.das.jz@bp.renesas.com>
+L:	dri-devel@lists.freedesktop.org
+L:	linux-renesas-soc@vger.kernel.org
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
+F:	drivers/gpu/drm/renesas/rz-du/
+
 DRM DRIVERS FOR RENESAS SHMOBILE
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 M:	Geert Uytterhoeven <geert+renesas@glider.be>
-- 
2.25.1

