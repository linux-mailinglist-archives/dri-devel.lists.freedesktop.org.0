Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FECAE7E97
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 12:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CEA410E213;
	Wed, 25 Jun 2025 10:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="QynfdMMn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 368CC10E213
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 10:09:07 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 7B3822609A;
 Wed, 25 Jun 2025 12:09:03 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XcpVnPu1ntrc; Wed, 25 Jun 2025 12:09:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1750846142; bh=hjJkA7oFAzYjbGdayYCi8BOgbIBdaazZmbsyFQXc0kY=;
 h=From:Subject:Date:To:Cc;
 b=QynfdMMnnEWy4LmP7h1NpFYQrOzNGFg1/fo6ZNn4qEf20zeqqvWJBv4iMzIVis1kb
 GJnhaXYAKTJMXQPlSe2B4xhXsemJcq8BD3DngaWNnIvIm2N+6ZgrVEOS9uYf9T8p7v
 YYCPW1DedeCSBrPJFxzsox822OldWStBce41QWxxzBbNh9c4qUjRks3LfWQUlWKoPA
 5pTUXXRQ0spIsbmdLNM8q92SnSk7TiEgzrhrgTT68k10rkxyW0XIBbvAwBxNE96Nlh
 HgaORMf5We0K/BpkrPGLy/gM8K3dnj4BvyBkqS6VLdMkeL+R2FlRdPIokZfxLZaT4p
 1u5fI67164E2A==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v2 0/2] Support for Synaptics TDDI series panels
Date: Wed, 25 Jun 2025 15:38:43 +0530
Message-Id: <20250625-panel-synaptics-tddi-v2-0-7a62ab1d13c7@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKvKW2gC/22NywqDMBBFf0Vm3SlJfNKV/1FcRJPoQEkkE6Qi/
 ntTu+3yHLjnHsA2kmV4FAdEuxFT8BnUrYBp0X62SCYzKKFqUasSV+3tC3n3ek00MSZjCMUoxtK
 J1nWygjxdo3X0vrLPIfNCnELcr5dNfu0v2Ej1P7hJFGjc2OlK1a5tpt4QxxDSPcQZhvM8Px6Hq
 eC6AAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750846137; l=1665;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=hjJkA7oFAzYjbGdayYCi8BOgbIBdaazZmbsyFQXc0kY=;
 b=i47/lAM2LOwTqd49rCoZONdX2gAZm0z02eIyQHO9e7Ku0i6I9GGwZ+aCUYFzqBAt8o0edpRAi
 ngKaUTKfOnmBfID9AqR/VbE+Q/tRawWGDvgRJQWKbYgBAAhqGGoblk1
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
Changes in v2:
- fixed various dt_binding_check errors (conor)
- did s/tddi_update_brightness/tddi_update_status
- added check for panel enable in tddi_update_status()
- used backlight_get_brightness() in appropriate places
- Link to v1: https://lore.kernel.org/r/20250612-panel-synaptics-tddi-v1-0-dfb8a425f76c@disroot.org

---
Kaustabh Chakraborty (2):
      dt-bindings: display: panel: document Synaptics TDDI panel driver
      drm: panel: add support for Synaptics TDDI series DSI panels

 .../display/panel/synaptics,td4300-panel.yaml      |  89 +++++++
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-synaptics-tddi.c       | 288 +++++++++++++++++++++
 4 files changed, 389 insertions(+)
---
base-commit: 1b152eeca84a02bdb648f16b82ef3394007a9dcf
change-id: 20250523-panel-synaptics-tddi-0b0b3f07f814

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

