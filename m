Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D16A20887
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 11:29:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB2D10E63D;
	Tue, 28 Jan 2025 10:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tI6z1UZR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CFE10E63D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 10:29:44 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D7EF6DF;
 Tue, 28 Jan 2025 11:28:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1738060115;
 bh=rL8FKfV3Pod0E0E7aepQ18LDsh1zfYypzBS53AHUp84=;
 h=From:Date:Subject:To:Cc:From;
 b=tI6z1UZRQ3JqYEAR1gfuNmuQPhpnTcD1Mz4o+fWTTHIUy58QMobI19bfMGJGGeCne
 KTiSQf8ygBFv7JJAy8Wege2qxYfi3t6eM/FrwOIQEAgVhlTTOX0dTqnxh543CSMOqT
 TzhP+f3SqORf3zWg33/u2nhh1hRafZ97rogKqYIM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 28 Jan 2025 12:28:48 +0200
Subject: [PATCH] MAINTAINERS: Update drm/rcar-du maintainers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250128-rcar-du-maintainers-v1-1-c429ca421c52@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAF+xmGcC/x2MQQ5AMBAAv9Ls2SZVJfiKODS12IOSLSKR/l3jM
 Ic5zLwQSZgi9OoFoZsj7yFLWSjwqwsLIU/ZwWhT69K0KN4JThdujsOZIYlYWaKm6Ww7awu5PIR
 mfv7rMKb0AXGBUDBlAAAA
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=rL8FKfV3Pod0E0E7aepQ18LDsh1zfYypzBS53AHUp84=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnmLGRv1GsTc1BTIsQ7yl2Jj2FOg+6FU/jZCe0I
 V5l3BdwOsKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ5ixkQAKCRD6PaqMvJYe
 9TuxD/9zenXKDrFB567IQO1+KiUA5BOjqRbPZ8PDQOXqU1XxavCA6/3NpVaoGyjVnaagDjoI1Ez
 oly/OzIahmGcGy1SqBBxcL/04RaLwsV7YsjxbmSP24/yEDjTcDremVAYcjBCT4G1bYejyvf45m8
 tUwF3P6JK2MFosvmSBfB7mLCwDsiu+aHqT1IJck54YMc863KEOIhLhzI/fi4IoxzKG/wnPSxfBE
 6ODpNcA7Y9SrEb5efcIRs8hzzJsyYPbH3qgYr9CoNBLW84VtNJJewQVyrNm+6+BeoW7EWjAEMr0
 yf6NWicSyLwnYtSSu4L41GCBRE2Mbgn3UHONq1YxuBCe8C4ZxkPDiyqhvBUX/vuKmMU2e0eOTDs
 6fk3LWtUO9OdSmCM0lTOp6yEHqxImZi4JL6uXxz/Is333bXK2McviMr9ZGEXNtOJAf67YdP7zxO
 fPulVCR2ibl70WB0lbMsMSFTImTFNGGahIAKQ6+DJpYspjOL2cye7Fohdnt8N9ifqUUNWkB0ba4
 3o67qW3mNd1g2cK9TTFpAkTr65FCDiXV30zGgPkXMU7C3WB+S2pcgQH8o9qhPlkPUi2huEcn7gy
 QDbGpjGNRDhDLdVJUiJoE29wnfYtbbj8vqvojEIcus0sw2bPN/a9zA6Fws0vow+2z0EIQZWAVJ3
 yl2NeEGJniwghtw==
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

Add myself as drm/rcar-du maintainer. Switch Kieran from a maintainer to
reviewer.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Cc: Krzysztof Kozlowski <krzk@kernel.org>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ed86d884ee0d..5b1bf5fd56fd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7760,7 +7760,8 @@ F:	include/uapi/drm/tegra_drm.h
 
 DRM DRIVERS FOR RENESAS R-CAR
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
+M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+R:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
 L:	dri-devel@lists.freedesktop.org
 L:	linux-renesas-soc@vger.kernel.org
 S:	Supported

---
base-commit: e2a81c0cd7de6cb063058be304b18f200c64802b
change-id: 20250128-rcar-du-maintainers-34ee66948f04

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

