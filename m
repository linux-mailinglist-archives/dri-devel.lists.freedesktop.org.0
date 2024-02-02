Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F198464FD
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 01:18:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B2D10ECA7;
	Fri,  2 Feb 2024 00:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="KkQWEYMw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B7B10EC87
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 00:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1706833099; x=1738369099;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6lCpe1JWBv0gIutmOVn15+H+ejUjuih0/bmRqdymfH0=;
 b=KkQWEYMwJZTDr8dc/K+oE0lrlSLa2x22T49eBxn/3roWFr9+SUB99qok
 5ne2eQeIbm2yL2WQXP6lieMWIoTbVr8IONhNMjPZdSlhJMFkNlxyQK9iJ
 uYOwOcTDBvlAPfaFPdhfSz+WzOhyJgQUIIbWU/o+QqfdOHLoJjLH9aKBf
 urQODbmxIGmTrCLDAw9+5cNpzs7V2woe33eM/liVEW23C+XIppy61ebKs
 APsWdpVAXKEKse9WyX2NNU8VjZkAhyOFzhHLpTmgdj7YOPvf6hHsuFISF
 cOAZ5T1DCPaT687J0dwy6XsDQH8tZwEkCqMFn52912LNEDhdducdX0YbY Q==;
X-CSE-ConnectionGUID: q2aqr2bnSse6ZnRLstrm9A==
X-CSE-MsgGUID: ZMDnp1A7QAq47c0BW+chNg==
X-IronPort-AV: E=Sophos;i="6.05,236,1701154800"; d="scan'208";a="15650200"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Feb 2024 17:18:18 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 17:17:45 -0700
Received: from che-lt-i70843lx.amer.actel.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 17:17:37 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
To: <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <lee@kernel.org>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <linux-pwm@vger.kernel.org>
CC: <hari.prasathge@microchip.com>, <manikandan.m@microchip.com>, "Dharma
 Balasubiramani" <dharma.b@microchip.com>
Subject: [linux][PATCH v6 0/3] Convert Microchip's HLCDC Text based DT
 bindings to JSON schema
Date: Fri, 2 Feb 2024 05:47:30 +0530
Message-ID: <20240202001733.91455-1-dharma.b@microchip.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Converted the text bindings to YAML and validated them individually using following commands

$ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/
$ make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/

changelogs are available in respective patches.

Dharma Balasubiramani (3):
  dt-bindings: display: convert Atmel's HLCDC to DT schema
  dt-bindings: atmel,hlcdc: convert pwm bindings to json-schema
  dt-bindings: mfd: atmel,hlcdc: Convert to DT schema format

 .../atmel/atmel,hlcdc-display-controller.yaml | 63 ++++++++++++
 .../bindings/display/atmel/hlcdc-dc.txt       | 75 --------------
 .../devicetree/bindings/mfd/atmel,hlcdc.yaml  | 99 +++++++++++++++++++
 .../devicetree/bindings/mfd/atmel-hlcdc.txt   | 56 -----------
 .../bindings/pwm/atmel,hlcdc-pwm.yaml         | 35 +++++++
 .../bindings/pwm/atmel-hlcdc-pwm.txt          | 29 ------
 6 files changed, 197 insertions(+), 160 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/atmel/atmel,hlcdc-display-controller.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/atmel/hlcdc-dc.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
 create mode 100644 Documentation/devicetree/bindings/pwm/atmel,hlcdc-pwm.yaml
 delete mode 100644 Documentation/devicetree/bindings/pwm/atmel-hlcdc-pwm.txt

-- 
2.25.1

