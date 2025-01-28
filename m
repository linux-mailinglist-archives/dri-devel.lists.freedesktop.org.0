Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E47A20A64
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 13:15:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0AD110E137;
	Tue, 28 Jan 2025 12:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fAGJve4c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D210110E137
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 12:15:07 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E4EC74A;
 Tue, 28 Jan 2025 13:13:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1738066437;
 bh=Hop0izW+Kt9Tz4B7IQilI/1GVJfibdMMpYcYCjkEPqE=;
 h=From:Date:Subject:To:Cc:From;
 b=fAGJve4cC7aIC0Q4gC3MphJuprzDm8m3hm99U3tWnqzc+7dpSxQTjlWTWVN3V8AEM
 pVP6rlxVAdmvfWd+JlaDvNkQqG9D9VjH874hKBOIpi6swJ9FuNur5CxR+uHN6BIS2C
 jxsHrIMcJpT6hzJyD1S/8vLWTmekUgXOq/C70rLk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 28 Jan 2025 14:14:43 +0200
Subject: [PATCH v2] MAINTAINERS: Update drm/rcar-du maintainers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250128-rcar-du-maintainers-v2-1-4a3860a3e1ef@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIADPKmGcC/32NQQ6CMBBFr2Jm7Rg6FgKuvIdhUdtBZkFrpkg0h
 LtbOYCLv3g/+e+vkFmFM1wOKygvkiXFAnQ8gB9dfDBKKAxUUV0ZalG9UwwvnJzEuYQ149kyN01
 n26GyUJZP5UHeu/XWFx4lz0k/+8lifu1/32LQoLfUeWfJ+JquEtjlFO/JaTj5NEG/bdsXeG9l8
 r0AAAA=
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Maxime Ripard <mripard@redhat.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2111;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=Hop0izW+Kt9Tz4B7IQilI/1GVJfibdMMpYcYCjkEPqE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnmMpE9JxGTMokObP7/XhZHh6X8ff/WyteBRdiY
 cBFnlFWzSmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ5jKRAAKCRD6PaqMvJYe
 9ZfRD/4o9G++212IA6sUrk7hhbF7mjvX6bHBKw6gVTE3ZiqI/yUKHD6v3YrYarb2EJjAQn0cdRS
 koknLgh5i1Bh3zMZzQL+DX+8+LiSJY7Z93s4fHEMgtq6ej0kGXDdWdVGpYXzpipEK+IcXVV60Am
 z2yRJ1LUMVY1Av3JNE4OS/TTOzzyQDw4P6bwB9JLZrbf2mse8RyYflgHRQHRL1m1TkGLr2pCU3K
 Se4vhIlEhOoN2hXEkff7Asy3zgkVGV6QD4/n3BKxj19qbUSH0y63lc7iIf5lmbP256TK6yHWpq3
 rN+SjBe205X5eHEcnsY4kuz9EChE3VPLmpPx9qfjNHW3FUNyY/PGrlKQMVKDulWRYpMLoxgUc+N
 TgNfuHsnxP6kA14J2dK9S4OtC/b6SmZZeL/twEWxAiq8vVzD3yA9DcE+Ecfr4qcC2smP8q4deq/
 f6FxrP1PXUNlHX0oOnWIR0LA6Fny/5C4kappJhfZ5YSgsWsirpxkrGUIp7AIl20BjNsNMdxLcz6
 sXb23bzho/offG44lqe2J+Fk/jFfYA2nKaEp+rQpqfHDyyzupYbkawF1VoJvDuCPtP9MMTQGY8E
 lNBNIb99b/cMLq4KZzA8PgsktxOm4urx1nUqqSdRkGuNYa3AGSFulFVDCAVVb9whZPzKJ0dkpEs
 OnCsC64RBfrEMYw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

Update drm/rcar-du maintainer entries:

* Add myself as drm/rcar-du maintainer.
* Update Laurent's email to include +renesas.
* Switch Kieran from a maintainer to reviewer.
* Change rcar-du to be under drm-misc umbrella.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
Changes in v2:
- Switch to drm-misc umbrella
- Add +renesas to emails
- Link to v1: https://lore.kernel.org/r/20250128-rcar-du-maintainers-v1-1-c429ca421c52@ideasonboard.com
---
 MAINTAINERS | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ed86d884ee0d..b256bb4f6d3f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7604,7 +7604,6 @@ X:	drivers/gpu/drm/mediatek/
 X:	drivers/gpu/drm/msm/
 X:	drivers/gpu/drm/nouveau/
 X:	drivers/gpu/drm/radeon/
-X:	drivers/gpu/drm/renesas/rcar-du/
 X:	drivers/gpu/drm/tegra/
 
 DRM DRIVERS FOR ALLWINNER A10
@@ -7759,12 +7758,13 @@ F:	include/linux/host1x.h
 F:	include/uapi/drm/tegra_drm.h
 
 DRM DRIVERS FOR RENESAS R-CAR
-M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
+M:	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+M:	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
+R:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
 L:	dri-devel@lists.freedesktop.org
 L:	linux-renesas-soc@vger.kernel.org
 S:	Supported
-T:	git git://linuxtv.org/pinchartl/media drm/du/next
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
 F:	Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
 F:	Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml

---
base-commit: e2a81c0cd7de6cb063058be304b18f200c64802b
change-id: 20250128-rcar-du-maintainers-34ee66948f04

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

