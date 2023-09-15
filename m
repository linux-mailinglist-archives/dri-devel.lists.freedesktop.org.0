Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BED47A1CB0
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 12:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DFE910E60A;
	Fri, 15 Sep 2023 10:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44F410E60A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 10:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1694774935; x=1726310935;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kOVTLNWDqfOVwrIwey7uiqf1pGWo1Bl1GlH5YpX1HbE=;
 b=lq3xgEWePW+0CxEsEVtNLjcHFz8yl3EcEyqy82YJxJ9O+AR+b30ZWI4T
 YBsm/r2yVJpnu6nFj0dkoMng6k8vszyqjcFSFk+YdFjVHA9tGWvU7FOrS
 u51VVlGwPlo3/EwqzWTM++WncZqyS+NFWvcqR72EgjI6rcTUW5fquL5yn
 /Hn4uu+z8b1yGcyTaDz5i8kdQTMhgojSI1wl2YHgSd0O43Qm3OX+50H1q
 xKi2LtEMO8yHa9AHHMgLo7WgKFFdxATtmmwQhwpMtnIpjwuQ+QNZqhfCd
 oht+pzKTJVg65QO7FHc1rFhaZ2+T4W2Y7gb94v6eqDS8dI0YQ3OSDLIGM g==;
X-CSE-ConnectionGUID: U0ykML+bTMil71KHYckU0A==
X-CSE-MsgGUID: v+Z4ELqZQaGG6Gasb00Nng==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="4711949"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Sep 2023 03:48:52 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 15 Sep 2023 03:48:52 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 15 Sep 2023 03:48:45 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <sam@ravnborg.org>, <bbrezillon@kernel.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <lee@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 0/8] Add support for XLCDC to sam9x7 SoC family.
Date: Fri, 15 Sep 2023 16:18:41 +0530
Message-ID: <20230915104849.187146-1-manikandan.m@microchip.com>
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
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Varshini.Rajendran@microchip.com, Dharma.B@microchip.com,
 Durai.ManickamKR@microchip.com, Hari.PrasathGE@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series aims to add support for XLCDC IP of sam9x7 SoC family
to the DRM subsystem.XLCDC IP has additional registers and new
configuration bits compared to the existing register set of HLCDC IP.
The new compatible string "microchip,sam9x75-xlcdc" is defined for sam9x75
variant of the sam9x7 SoC family.The is_xlcdc flag under driver data and
IP specific driver ops helps to differentiate the XLCDC and existing HLCDC
code within the same driver.

changes in v5:
* return value of regmap_read_poll_timeout is checked in failure
case.
* HLCDC and XLCDC specific driver functions are now invoked
using its IP specific driver ops w/o the need of checking is_xlcdc flag.
* Removed empty spaces and blank lines.

changes in v4:
* fixed kernel warnings reported by kernel test robot.

changes in v3:
* Removed de-referencing the value of is_xlcdc flag multiple times in
a single function.
* Removed cpu_relax() call when using regmap_read_poll_timeout.
* Updated xfactor and yfactor equations using shift operators
* Defined CSC co-efficients in an array for code readability.

changes in v2:
* Change the driver compatible name from "microchip,sam9x7-xlcdc" to
"microchip,sam9x75-xlcdc".
* Move is_xlcdc flag to driver data.
* Remove unsed Macro definitions.
* Add co-developed-bys tags
* Replace regmap_read() with regmap_read_poll_timeout() call
* Split code into two helpers for code readablitity.

Durai Manickam KR (1):
  drm: atmel-hlcdc: Define SAM9X7 SoC XLCDC specific registers

Manikandan Muralidharan (7):
  mfd: atmel-hlcdc: Add compatible for sam9x75 XLCD controller
  drm: atmel-hlcdc: add flag and driver ops to differentiate XLCDC and
    HLCDC IP
  drm: atmel-hlcdc: add LCD controller layer definition for sam9x75
  drm: atmel_hlcdc: Add support for XLCDC in atmel LCD driver
  drm: atmel-hlcdc: add DPI mode support for XLCDC
  drm: atmel-hlcdc: add vertical and horizontal scaling support for
    XLCDC
  drm: atmel-hlcdc: add support for DSI output formats

 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 176 +++++++--
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  | 125 +++++++
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h  | 114 ++++++
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   | 337 +++++++++++++++---
 drivers/mfd/atmel-hlcdc.c                     |   1 +
 include/linux/mfd/atmel-hlcdc.h               |  10 +
 6 files changed, 665 insertions(+), 98 deletions(-)

-- 
2.25.1

