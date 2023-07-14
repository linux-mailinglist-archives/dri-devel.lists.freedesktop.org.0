Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7AD752EB7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 03:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0636010E7B1;
	Fri, 14 Jul 2023 01:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A9C10E094
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 01:38:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7171561BB3;
 Fri, 14 Jul 2023 01:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3ACCC433C8;
 Fri, 14 Jul 2023 01:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689298681;
 bh=VliKl8yRFl/vxHPSCbMcCRDElBFtRJGleu5OKQBvOiY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kgVwOrcINvGcwjIf2mECWMFJg6P/gWNuuZRLGQxB/xJYE76Sqo8bdcPi9FxasDtSh
 JjtiuQeRFj951kk7RXJfFBcPKkEKut5rRwP0qprsGB82sjPrWivTTdy6XUdGzcx0se
 GCsqPjF/OzktqndI4WUbBmqTpstc8Ur4vDQfL31B8XQlziOtyrXGBTbxuK/WomV/WO
 +LLzzwVLsNYiRnnZ8OvtRdQu8+4wN6ZC7sk7ZQ6Y+GdXXLu3dB+Esj9cyFu2b2ZmpR
 aStiUMWSfnw2/qXH8s72QaDxqw+ctMTHnZ5H5ksCxAH2P2DnR+8y9N953HgRcYg17h
 fQsAo0sTi2HTA==
Received: by mercury (Postfix, from userid 1000)
 id D2BB01067694; Fri, 14 Jul 2023 03:37:58 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v3 04/19] drm/panel: sitronix-st7789v: remove unused constants
Date: Fri, 14 Jul 2023 03:37:41 +0200
Message-Id: <20230714013756.1546769-5-sre@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230714013756.1546769-1-sre@kernel.org>
References: <20230714013756.1546769-1-sre@kernel.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ST7789V_COLMOD_RGB_FMT_18BITS and ST7789V_COLMOD_CTRL_FMT_18BITS
are unused in favour of MIPI_DCS_PIXEL_FMT_18BIT, remove them.

Reviewed-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index e4d8dea1db36..f7566551b5e2 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -15,9 +15,6 @@
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
 
-#define ST7789V_COLMOD_RGB_FMT_18BITS		(6 << 4)
-#define ST7789V_COLMOD_CTRL_FMT_18BITS		(6 << 0)
-
 #define ST7789V_RAMCTRL_CMD		0xb0
 #define ST7789V_RAMCTRL_RM_RGB			BIT(4)
 #define ST7789V_RAMCTRL_DM_RGB			BIT(0)
-- 
2.40.1

