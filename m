Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59987AD747F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D2410E8A2;
	Thu, 12 Jun 2025 14:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="VXQ0RaMO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E5710E888
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 14:48:45 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id D5BFF25FD8;
 Thu, 12 Jun 2025 16:40:03 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D0I0sQscU69L; Thu, 12 Jun 2025 16:40:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1749739203; bh=kgCWCtFdri3esltkaVO3k5udDgP7TdzXf8myfDMfKO0=;
 h=From:Subject:Date:To:Cc;
 b=VXQ0RaMOVgPSkTnZsqrBGEwGYdnCNeYJ57cZWusWn+VCedxGRB+eOe4M7hEZgyVZb
 io72nq5m+2V3Nr4Ab3qzIud9z5EaccXAAKJ/Mja8+rGopprEL3zTX8FtCPGHTVp0zJ
 J5Vq19EdfzNG1ZQf1azMqeVjtJoeqP9HmC/IzdroG1SPnOfi03L6cPHyPXeWlMZM7G
 XcwLdAq9gKsmzgNSM+KEsSDaCZrZaFhW9RyHHKHOkjBGJMKBdhZc95pqTbUaLbr13M
 AAstUmBWLk+LWbOnCdUZMryr9ypb9H14OXvziRio3jdJkMibe8tmlV3M+ZrXiMXLpm
 sHtGGvqJ3XVTQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/2] Support for Synaptics TDDI series panels
Date: Thu, 12 Jun 2025 20:09:39 +0530
Message-Id: <20250612-panel-synaptics-tddi-v1-0-dfb8a425f76c@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKvmSmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyNj3YLEvNQc3eLKvMSCkszkYt2SlJRMXYMkgyTjNAPzNAtDEyWg1oK
 i1LTMCrCx0bG1tQAmEp4yZgAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749739197; l=1328;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=kgCWCtFdri3esltkaVO3k5udDgP7TdzXf8myfDMfKO0=;
 b=NvDmcVt9Cyid6fOiJp/Xqyeew53Mwq032aYZSHo1xiCWCdMGd5GC5QrHIogK4r2eBjNyQzObI
 FjMEdXSNz38AqeizorhTnDgYMIdvDQFE0AqbxIkqzfGe7/th0xFZSVx
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
Kaustabh Chakraborty (2):
      dt-bindings: display: panel: document Synaptics TDDI panel driver
      drm: panel: add support for Synaptics TDDI series DSI panels

 .../bindings/display/panel/synaptics,tddi.yaml     |  92 +++++++
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-synaptics-tddi.c       | 284 +++++++++++++++++++++
 4 files changed, 388 insertions(+)
---
base-commit: 0bb71d301869446810a0b13d3da290bd455d7c78
change-id: 20250523-panel-synaptics-tddi-0b0b3f07f814

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

