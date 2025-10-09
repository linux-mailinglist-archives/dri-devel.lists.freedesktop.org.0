Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38316BCA297
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 18:25:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE9910EAB1;
	Thu,  9 Oct 2025 16:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="GjyqaBta";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30BD10EAA7
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 16:24:59 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id CBE2925E07;
 Thu,  9 Oct 2025 18:24:57 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KpWwws5WmY3q; Thu,  9 Oct 2025 18:24:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1760027096; bh=+fmM1LXL5j8cHsgbj61uU+OuNanXHVoMioQvqNc3PKg=;
 h=From:Subject:Date:To:Cc;
 b=GjyqaBtanIGyo2bxuPk+X4E98uNUOwdiYPKQ/Ds4Q7n+I6gqghFxQiatF3wGPoq9c
 znHWxdKRtj6muYTO6++i78gaYG1MzXyp6qJJX7T/DG4Nv3SFYPspRLpI5FWwcFIcXi
 opqw+pJdIhg12AOKXr8X6u9XIoJeEwH02YegYyLldMxSHKPaCyjlKDcIIyMc+LdEik
 qVQ6E/m6AFmnEIu5bbh+KzmFQ4jULyW9twhNFaj43C25LIlNPrzdxT1zEp36KCokOI
 8a3Eejal2OWimrBqV4lKp+EiGNvTYMcPiNKzOYJK6mkI6+2n3U36/whbphuahXwQqT
 rvRp5tETXMa1A==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH RESEND v5 0/2] Support for Synaptics TDDI series panels
Date: Thu, 09 Oct 2025 21:52:09 +0530
Message-Id: <20251009-panel-synaptics-tddi-v5-0-59390997644e@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760027068; l=2374;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=+fmM1LXL5j8cHsgbj61uU+OuNanXHVoMioQvqNc3PKg=;
 b=CjIhkvVXri8z127/rTuGYE1IvsAcweFcRWglC+cSNhXB20PUtF9TYbL/km6zJf2ls8U+kVAzh
 20+kBgR9m9rB0PLIPwTA0QMEMB/BmFWMUKVetRfI/r1LqnR9hE5LmRB
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
Changes in v5:
- added missing Reviewed-by tag from Krzysztof in [v3 1/2]
- Link to v4: https://lore.kernel.org/r/20250819-panel-synaptics-tddi-v4-0-448f466d16a6@disroot.org

Changes in v4:
- utilized drm_connector_helper_get_modes_fixed() (dmitry.baryshkov)
- constified backlight properties (dmitry.baryshkov)
- Link to v3: https://lore.kernel.org/r/20250720-panel-synaptics-tddi-v3-0-43a5957f4b24@disroot.org

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
 drivers/gpu/drm/panel/panel-synaptics-tddi.c       | 276 +++++++++++++++++++++
 4 files changed, 377 insertions(+)
---
base-commit: 5303936d609e09665deda94eaedf26a0e5c3a087
change-id: 20250523-panel-synaptics-tddi-0b0b3f07f814

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

