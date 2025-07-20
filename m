Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF052B0B5AB
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 14:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D4410E206;
	Sun, 20 Jul 2025 12:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="KBOyZuH4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA50210E206
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:02:13 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 640D325DA1;
 Sun, 20 Jul 2025 14:02:12 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iwt8Xl3-yt6y; Sun, 20 Jul 2025 14:02:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1753012931; bh=z7UInY2V+5A/AzQtYe31EauuP8QWRTvlpkfW8x62dEQ=;
 h=From:Subject:Date:To:Cc;
 b=KBOyZuH4Ecm7kqnX0sWekVAqNY0FyqQUW4taiOQE4oMyYvIaH4xFtUSqp+ek1qJR7
 zerS1pzUw9BOXAZ7Jp+DCzsk+02ScTJpBdSS8VtTlgw1I2qlvW5gZV34UcYVGIrWu7
 8B62MZEKOPJ8N7bysML0txUqLajcGfxuZAVyNTTXwRUQn0UtEuRuaXR+AFZwroH9Z8
 F+/NapKFyhucBX3M5lOdZTGSWd8mLbTKD9zTAuqHKyTw7cj9lYdTV/YflzAY7egD4H
 W92uNkiv2+RqRjJQg2sz+KC5gvw/Ez+TXvKedGaM3VBrNZWCXi13/P3EYV2GHEq14g
 4DiLipCptdt8Q==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v3 0/2] Support for Synaptics TDDI series panels
Date: Sun, 20 Jul 2025 17:31:53 +0530
Message-Id: <20250720-panel-synaptics-tddi-v3-0-43a5957f4b24@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALHafGgC/3XNTQqDMBCG4atI1k1JJsZIV71H6SK/OlCMJCIV8
 e6NdtNCu3w/mGdWkn1Cn8mlWknyM2aMQwlxqojt9dB5iq40AQaSSRB01IN/0LwMepzQZjo5h5Q
 ZZkRgKrS8JuV0TD7g82Bv99I95imm5fgy8319gw2H3+DMKaMumFbXIINq7NVhTjFO55g6spMzf
 DAg/zBQGKUb0IY7Lqz6ZrZtewFjhD9kAQEAAA==
X-Change-ID: 20250523-panel-synaptics-tddi-0b0b3f07f814
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753012923; l=1952;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=z7UInY2V+5A/AzQtYe31EauuP8QWRTvlpkfW8x62dEQ=;
 b=g1zKgQ1Y+6w3mlITGjx3sHpmfGU82CJFK8NEX2y40l0Q//jEZpCURnKYU5h7da5MOQcFpGaES
 I7EzK91pmTmAy+jCDj0IJ5tdUBh4ZtQ7LDhtjvxi50ITvIN1CpgGW3M
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
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

Synaptics' Touch and Display Driver Integration (TDDI) technology [1]
employs a single chip for both touchscreen and display capabilities.
Such designs reportedly help reducing costs and power consumption.

Although the touchscreens, which are powered by Synaptics'
Register-Mapped Interface 4 (RMI4) touch protocol via I2C or SPI have
driver support in the kernel, the MIPI DSI display panels don't.

This series introduces a rudimentary driver for controlling said display
panels, which supports TD4101 and TD4300 panels.

[1] https://www.synaptics.com/technology/display-integration

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v3:
- fixed various dt_binding_check errors (robh's bot)
- adjusted commit description of [v2 1/2] (robh)
- utilized devm_drm_panel_alloc() and devm_regulator_bulk_get_const()
- Link to v2: https://lore.kernel.org/r/20250625-panel-synaptics-tddi-v2-0-7a62ab1d13c7@disroot.org

Changes in v2:
- fixed various dt_binding_check errors (conor)
- did s/tddi_update_brightness/tddi_update_status
- added check for panel enable in tddi_update_status()
- used backlight_get_brightness() in appropriate places
- Link to v1: https://lore.kernel.org/r/20250612-panel-synaptics-tddi-v1-0-dfb8a425f76c@disroot.org

---
Kaustabh Chakraborty (2):
      dt-bindings: display: panel: document Synaptics TDDI panel
      drm: panel: add support for Synaptics TDDI series DSI panels

 .../display/panel/synaptics,td4300-panel.yaml      |  89 +++++++
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-synaptics-tddi.c       | 289 +++++++++++++++++++++
 4 files changed, 390 insertions(+)
---
base-commit: d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
change-id: 20250523-panel-synaptics-tddi-0b0b3f07f814

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

