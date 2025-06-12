Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AE1AD74A3
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF0310E29F;
	Thu, 12 Jun 2025 14:52:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="YzEhAtWk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195D610E29F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 14:52:58 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id ADADC26064;
 Thu, 12 Jun 2025 16:52:56 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3zxYttUun_bL; Thu, 12 Jun 2025 16:52:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1749739975; bh=BHs6em2IdPZtT/B9EW91eqWvHJ+mI9zvLDnVDmv0ZJw=;
 h=From:Subject:Date:To:Cc;
 b=YzEhAtWkELydVwtHUsUb6GmGaBzJ/4su5F9KfmHtUcTnk25hy2gUDKuH2Ob9+p6Ij
 bF5PtPfyiul5lBYRKZSWkxqTXPuY+Ftvrk39XXoip4q4BMCMDnuP9uayqj1+5DBX7u
 QiZG8M3r5DCvzKzljNTc5un/ofA2qEgGD78SIabV4s7RrKZTBt4/aAiE8Z6t7aZQrs
 GF+AQBKLq82Xr1xxxorWTum6yAkMdz+Qtc052t++B14KVUJIgzKWpSojAVql1ObEO+
 h1dkxPF4Wm6C+zlHHdVl3/ffKnkBrgZnYucst26bX81s9nVZnKRbThRRn2ubscOq67
 8XAf+CSjbtZCA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/2] Add driver for Samsung S6E8AA5X01 panel controller
Date: Thu, 12 Jun 2025 20:22:40 +0530
Message-Id: <20250612-panel-samsung-s6e8aa5x01-v1-0-06dcba071ea6@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALnpSmgC/x3MQQqDMBBG4avIrDsQo5HWqxQXg/7qgI2SQRHEu
 ze4/BbvXWRICqO2uCjhUNM1ZpSvgvpZ4gTWIZu888EFX/EmEQub/GyPE1uDt0g4XckQX38ayIh
 BKOdbwqjns/529/0HhI38EWoAAAA=
X-Change-ID: 20250523-panel-samsung-s6e8aa5x01-ea2496eafeda
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749739970; l=962;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=BHs6em2IdPZtT/B9EW91eqWvHJ+mI9zvLDnVDmv0ZJw=;
 b=FMYOVwgZYbs2u1TNKThh2/6iwy2E5OIkUYogzpc7A37V2edkpE/09hxm2GWU3bVUR6c5n+m5W
 m7z00i7fzYOCo54SdBL/JG1rNYOnP0y+0UqhLPhOj0go3uQQDxpOeRR
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

This patch series introduces a driver for Samsung S6E8AA5X01, which is
an AMOLED MIPI DSI panel controller. This panel is found in several
(mostly Samsung) phones, in at least two different sizes - 720x1280 and
720x1480.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Kaustabh Chakraborty (2):
      dt-bindings: display: panel: document Samsung S6E8AA5X01 panel driver
      drm: panel: add support for Samsung S6E8AA5X01 panel controller

 .../bindings/display/panel/samsung,s6e8aa5x01.yaml |  80 ++
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-samsung-s6e8aa5x01.c   | 922 +++++++++++++++++++++
 4 files changed, 1014 insertions(+)
---
base-commit: 0bb71d301869446810a0b13d3da290bd455d7c78
change-id: 20250523-panel-samsung-s6e8aa5x01-ea2496eafeda

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

