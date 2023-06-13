Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEDA72DA7D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 09:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F8E10E32A;
	Tue, 13 Jun 2023 07:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Tue, 13 Jun 2023 07:12:07 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47DE10E32A
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 07:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1686640328; x=1718176328;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2AtW6y3EN8O+q/fnZWh+rQwVGxKOSUVLNaK9VlQDLHg=;
 b=th2NFI9H4icdK4f/C0TJQQ3KjQJsmARMwuju7A0pz7DswrNxlfmb1mJr
 OGKPItdX5kwj2Xas5k+a25g6ijXHpRrCON0t/WvGSDsdboaOGnN8IeSEF
 AXq/pUQoKOV4kUQi8Hot5mhzU4CzcZRur0dE+v/WHN18ddi0Mi6GiApvk
 9SDB3YXLeAfEhndvXZ4K8OAcuYPV1fgylNb8XpIbEPW94WMBc+ZIzHnD8
 2i3VZx9//qQiUY/6s+3u4NAPMWzwrCxkC/VD30DulMZLhUdw+l3Vp9wvx
 VuXO1qIrAOxPra0lavNE0HjWXpeFfWJasJQApCyv2BBwAnN2r9yqGLApP w==;
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; d="scan'208";a="215783313"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Jun 2023 00:04:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 13 Jun 2023 00:04:55 -0700
Received: from che-lt-i67131.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Tue, 13 Jun 2023 00:04:47 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <lee@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@microchip.com>, <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/9] Add support for XLCDC to sam9x7 SoC family.
Date: Tue, 13 Jun 2023 12:34:17 +0530
Message-ID: <20230613070426.467389-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: Balakrishnan.S@microchip.com, Nayabbasha.Sayed@microchip.com,
 Balamanikandan.Gunasundar@microchip.com,
 Manikandan <manikandan.m@microchip.com>, Varshini.Rajendran@microchip.com,
 Dharma.B@microchip.com, Durai.ManickamKR@microchip.com,
 Hari.PrasathGE@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Manikandan <manikandan.m@microchip.com>

This patch series aims to add support for XLCDC IP of sam9x7 SoC family
to the DRM subsystem.XLCDC IP has additional registers and new
configuration bits compared to the existing register set of HLCDC IP.
The compatible string "microchip,sam9x7-xlcdc", defined for sam9x7 SoC
family helps to differentiate the XLCDC and existing HLCDC code
within the same driver.

Durai Manickam KR (2):
  drm: atmel-hlcdc: Define SAM9X7 XLCDC specific registers
  drm: atmel-hlcdc: add compatible string check for XLCDC and HLCDC

Manikandan Muralidharan (7):
  dt-bindings: mfd: Add bindings for SAM9X7 LCD controller
  mfd: atmel-hlcdc: Add compatible for SAM9X7 HLCD controller
  drm: atmel-hlcdc: add LCD controller layer definition for SAM9X7
  drm: atmel_hlcdc: Add support for XLCDC in atmel LCD driver
  drm: atmel-hlcdc: add DPI mode support for XLCDC
  drm: atmel-hlcdc: add vertical and horizontal scaling support for
    XLCDC
  drm: atmel-hlcdc: add support for DSI output formats

 .../devicetree/bindings/mfd/atmel-hlcdc.txt   |   1 +
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 167 ++++++++--
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  | 105 ++++++
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h  | 113 +++++++
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   | 315 ++++++++++++++----
 drivers/mfd/atmel-hlcdc.c                     |   1 +
 include/linux/mfd/atmel-hlcdc.h               |  10 +
 7 files changed, 609 insertions(+), 103 deletions(-)

-- 
2.25.1

