Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88535829ECD
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 17:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2267310E768;
	Wed, 10 Jan 2024 16:53:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Wed, 10 Jan 2024 10:33:34 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E12010E599
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 10:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1704882814; x=1736418814;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1E6SGPMyspfxdGXcr6MF97yBDgvECpeTUGECKTrub6g=;
 b=n2MegLZDHXzLaYidJDLfD3k+lFicstFFUWaJ4pqSnwxmy+V3XrSp+jbb
 NDFk3AcoV3o66ucur/aH+1O0Y6bScoIwX35mRtF3F6uQeOrx2vCXfiQWP
 TpvrDpCW6OUEnTPp4FMUJU4j65dA4gIaYf9J3ZKy7LUT5j7ojEb7g41sP
 hFX2PiyZ/3tOSTXNN//AU/2XuEX9L92IJ7zeTti7GldXSaK5p923OJWIW
 7pdA2Z9dVngdNTiZh4M6JvoYdunmSp8oxqhkkM2uXmCLKJGpWpKzG3NK4
 bVfNao6cYpvBNu/U3/K9xbZBGgNkBh16vLLrDNyPWLyAkdIUkbyRXyByg g==;
X-CSE-ConnectionGUID: 4FLeVdXIRtGRQjBQXLr/AA==
X-CSE-MsgGUID: t5Eg5YbQRdCgP9shtgUuhw==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="181745210"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Jan 2024 03:26:24 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Jan 2024 03:26:00 -0700
Received: from che-lt-i70843lx.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 10 Jan 2024 03:25:53 -0700
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
Subject: [PATCH 0/3] Convert Microchip's HLCDC Text based DT bindings to JSON
 schema
Date: Wed, 10 Jan 2024 15:55:32 +0530
Message-ID: <20240110102535.246177-1-dharma.b@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Wed, 10 Jan 2024 16:53:43 +0000
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

Converted the text bindings to YAML and validated them using following commands

$ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/
$ make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/

Dharma Balasubiramani (3):
  dt-bindings: display: convert Atmel's HLCDC to DT schema
  dt-bindings: mfd: atmel,hlcdc: Convert to DT schema format
  dt-bindings: atmel,hlcdc: convert pwm bindings to json-schema

 .../display/atmel/atmel,hlcdc-dc.yaml         | 133 ++++++++++++++++++
 .../bindings/display/atmel/hlcdc-dc.txt       |  75 ----------
 .../devicetree/bindings/mfd/atmel,hlcdc.yaml  | 106 ++++++++++++++
 .../devicetree/bindings/mfd/atmel-hlcdc.txt   |  56 --------
 .../bindings/pwm/atmel,hlcdc-pwm.yaml         |  62 ++++++++
 .../bindings/pwm/atmel-hlcdc-pwm.txt          |  29 ----
 6 files changed, 301 insertions(+), 160 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/atmel/atmel,hlcdc-dc.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/atmel/hlcdc-dc.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
 create mode 100644 Documentation/devicetree/bindings/pwm/atmel,hlcdc-pwm.yaml
 delete mode 100644 Documentation/devicetree/bindings/pwm/atmel-hlcdc-pwm.txt

-- 
2.25.1

