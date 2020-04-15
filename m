Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5481AB90E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 09:00:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094376EAFB;
	Thu, 16 Apr 2020 06:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157E46E91A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 08:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586939754;
 s=strato-dkim-0002; d=goldelico.com;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=CAfnoN4m17go8Dw967b1uy/r86HBAZtFzBXJuBT/KA0=;
 b=U1lt0Z8FXpToLqyGoQH1jMaA/gyL/3U1ahInGXSrxIVzfKsRihvfD59cKd4J+bC/PJ
 EgeRm4xIMjrkqxrDOHIRyEqvv1cm+vPwf0c7eikqp5+K9ObbKDTghFwYHZLWC7ncS0t5
 PoSYM4FPvSqNtnRTVuMJ8SVRauEBUPGj7Udv/d/a4XUPkudLQPaXWJuDilvF9+ZHjolZ
 lpVf+mxSBZDrgQt5+OT3v/7++HwWGy46gHXnGTJmeFBP6IgrX+bDM4adTA2hQ9+Sm5UP
 DwBgI2flLd3wIFGsKMsMRQninb9uAIxaTG3Xre14FiDraYpS1AFgXA3e+L9YEM43HO4j
 LOBQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7O2CKN9ej"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 46.4.0 DYNA|AUTH)
 with ESMTPSA id 6028a2w3F8ZJ0Ih
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 15 Apr 2020 10:35:19 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Paul Cercueil <paul@crapouillou.net>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH v6 00/12] ARM/MIPS: DTS: add child nodes describing the PVRSGX
 GPU present in some OMAP SoC and JZ4780 (and many more)
Date: Wed, 15 Apr 2020 10:35:07 +0200
Message-Id: <cover.1586939718.git.hns@goldelico.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 16 Apr 2020 06:59:07 +0000
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
Cc: devicetree@vger.kernel.org, letux-kernel@openphoenux.org,
 Philipp Rossak <embed3d@gmail.com>, "H. Nikolaus Schaller" <hns@goldelico.com>,
 openpvrsgx-devgroup@letux.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, kernel@pyra-handheld.com,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* rebased to v5.7-rc1
* added DTS for for a31, a31s, a83t - by Philipp Rossak <embed3d@gmail.com>
* added DTS for "samsung,s5pv210-sgx540-120" - by Jonathan Bakker <xc-racer2@live.ca>
* bindings.yaml fixes:
  - added a31, a31
  - fixes for omap4470
  - jz4780 contains an sgx540-130 and not -120
  - a83t contains an sgx544-115 and not -116
  - removed "additionalProperties: false" because some SoC may need additional properties

PATCH V5 2020-03-29 19:38:32:
* reworked YAML bindings to pass dt_binding_check and be better grouped
* rename all nodes to "gpu: gpu@<address>"
* removed "img,sgx5" from example - suggested by Rob Herring <robh+dt@kernel.org>

PATCH V4 2019-12-17 19:02:11:
* MIPS: DTS: jz4780: removed "img,sgx5" from bindings
* YAML bindings: updated according to suggestions by Rob Herring
* MIPS: DTS: jz4780: insert-sorted gpu node by register address - suggested by Paul Cercueil

PATCH V3 2019-11-24 12:40:33:
* reworked YAML format with help by Rob Herring
* removed .txt binding document
* change compatible "ti,am335x-sgx" to "ti,am3352-sgx" - suggested by Tony Lindgren

PATCH V2 2019-11-07 12:06:17:
* tried to convert bindings to YAML format - suggested by Rob Herring
* added JZ4780 DTS node (proven to load the driver)
* removed timer and img,cores properties until we know we really need them - suggested by Rob Herring

PATCH V1 2019-10-18 20:46:35:

This patch series defines child nodes for the SGX5xx interface inside
different SoC so that a driver can be found and probed by the
compatible strings and can retrieve information about the SGX revision
that is included in a specific SoC. It also defines the interrupt number
to be used by the SGX driver.

There is currently no mainline driver for these GPUs, but a project [1]
is ongoing with the goal to get the open-source part as provided by TI/IMG
and others into drivers/gpu/drm/pvrsgx.

The kernel modules built from this project have successfully demonstrated
to work with the DTS definitions from this patch set on AM335x BeagleBone
Black, DM3730 and OMAP5 Pyra and Droid 4. They partially work on OMAP3530 and
PandaBoard ES but that is likely a problem in the kernel driver or the
(non-free) user-space libraries and binaries.

Wotk for JZ4780 (CI20 board) is in progress and there is potential to extend
this work to e.g. BananaPi-M3 (A83) and  some Intel Poulsbo and CedarView
devices.

[1]: https://github.com/openpvrsgx-devgroup


H. Nikolaus Schaller (8):
  dt-bindings: add img,pvrsgx.yaml for Imagination GPUs
  ARM: DTS: am33xx: add sgx gpu child node
  ARM: DTS: am3517: add sgx gpu child node
  ARM: DTS: omap34xx: add sgx gpu child node
  ARM: DTS: omap36xx: add sgx gpu child node
  ARM: DTS: omap4: add sgx gpu child node
  ARM: DTS: omap5: add sgx gpu child node
  MIPS: DTS: jz4780: add sgx gpu node

Jonathan Bakker (1):
  arm: dts: s5pv210: Add G3D node

Philipp Rossak (3):
  ARM: dts: sun6i: a31: add sgx gpu child node
  ARM: dts: sun6i: a31s: add sgx gpu child node
  ARM: dts: sun8i: a83t: add sgx gpu child node

 .../devicetree/bindings/gpu/img,pvrsgx.yaml   | 122 ++++++++++++++++++
 arch/arm/boot/dts/am33xx.dtsi                 |  11 +-
 arch/arm/boot/dts/am3517.dtsi                 |   9 +-
 arch/arm/boot/dts/omap34xx.dtsi               |  11 +-
 arch/arm/boot/dts/omap36xx.dtsi               |   9 +-
 arch/arm/boot/dts/omap4.dtsi                  |  11 +-
 arch/arm/boot/dts/omap4470.dts                |  15 +++
 arch/arm/boot/dts/omap5.dtsi                  |  11 +-
 arch/arm/boot/dts/s5pv210.dtsi                |  15 +++
 arch/arm/boot/dts/sun6i-a31.dtsi              |  11 ++
 arch/arm/boot/dts/sun6i-a31s.dtsi             |  10 ++
 arch/arm/boot/dts/sun8i-a83t.dtsi             |  11 ++
 arch/mips/boot/dts/ingenic/jz4780.dtsi        |  11 ++
 13 files changed, 229 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
 create mode 100644 arch/arm/boot/dts/omap4470.dts

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
