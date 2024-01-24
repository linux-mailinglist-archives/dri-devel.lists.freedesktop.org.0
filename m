Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2577983A62E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 11:00:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A060310F6B9;
	Wed, 24 Jan 2024 10:00:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F7D10F6B9
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 10:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1706090439; x=1737626439;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Qcy7KASQpJcfi8VSdmUwGdH1p+9p1Q+pb+US7vRXCTw=;
 b=qRDoqB7jsyB5H3VXjUeCAsZlYhKL7XtUPKdPor02EdPXxmuMyRQkvtbw
 1tcC7IT1mjBMb3D01MmUo5rEUWk/b1ZQmSrdTTxDSQuvJkwm3tFXgIF8K
 OH26zWvAwxx3AN3kHOcERsEtxsp4dqREN/gEJmV7vtNyiLSVXa4fQ5yEb
 AmYeal5rPYVEH4U4aaX5J9jLLRyHH1i4Aga1bM8VD0hfu4/+kj5jOLoyw
 bV2Nkb4iZO4UmLmpkdfISSFMNvRAx7jGXXK27SUAT1pJph2CY2SNCDTgQ
 ZBkC/Q1GyhrQdWVKr3WhFiOHFjFcMhMZvonvj/ofHb1oyfoiw49tw4HCY g==;
X-CSE-ConnectionGUID: KW48kSavSe+zQ6q8gM/eDg==
X-CSE-MsgGUID: 1qPUaEYFTb6zPV2BNV9RQA==
X-IronPort-AV: E=Sophos;i="6.05,216,1701154800"; d="scan'208";a="16475526"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Jan 2024 03:00:38 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 03:00:31 -0700
Received: from che-lt-i70843lx.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 03:00:23 -0700
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
Subject: [PATCH v4 0/3] Convert Microchip's HLCDC Text based DT bindings to
 JSON schema
Date: Wed, 24 Jan 2024 15:30:16 +0530
Message-ID: <20240124100019.290120-1-dharma.b@microchip.com>
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
Cc: Dharma Balasubiramani <dharma.b@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Converted the text bindings to YAML and validated them individually using following commands

$ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/
$ make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/

changelogs are available in respective patches.

As Sam suggested I'm sending the PWM binding as it is in this patch series, clean up patch
will be sent as separate patch.

Dharma Balasubiramani (3):
  dt-bindings: display: convert Atmel's HLCDC to DT schema
  dt-bindings: atmel,hlcdc: convert pwm bindings to json-schema
  dt-bindings: mfd: atmel,hlcdc: Convert to DT schema format

 .../atmel/atmel,hlcdc-display-controller.yaml | 85 ++++++++++++++++
 .../bindings/display/atmel/hlcdc-dc.txt       | 75 --------------
 .../devicetree/bindings/mfd/atmel,hlcdc.yaml  | 97 +++++++++++++++++++
 .../devicetree/bindings/mfd/atmel-hlcdc.txt   | 56 -----------
 .../bindings/pwm/atmel,hlcdc-pwm.yaml         | 44 +++++++++
 .../bindings/pwm/atmel-hlcdc-pwm.txt          | 29 ------
 6 files changed, 226 insertions(+), 160 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/atmel/atmel,hlcdc-display-controller.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/atmel/hlcdc-dc.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
 create mode 100644 Documentation/devicetree/bindings/pwm/atmel,hlcdc-pwm.yaml
 delete mode 100644 Documentation/devicetree/bindings/pwm/atmel-hlcdc-pwm.txt

-- 
2.25.1

