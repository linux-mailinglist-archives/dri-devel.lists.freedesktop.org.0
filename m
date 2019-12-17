Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6CB124137
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 09:13:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805876E233;
	Wed, 18 Dec 2019 08:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2FD6E0F1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 18:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1576605753;
 s=strato-dkim-0002; d=goldelico.com;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=E41u3NSIeHGMOgXDLzty+HWrhO7ZjL4x/137ZGXUXA8=;
 b=MzXyZRf6OZRlT+GTtbV05EqLpDsJZWQUBBzAH1WVRvE3K9NrOLst6ZhvgcggMvoW5Z
 RVO+gu0eT4K8SajTELqAArai1B/5dTBXQkNPbUxrP5clTCOjGSGCQp63iEyJfpVyd5x4
 e65ymzC0TOmTAkMFlnXZwekoVlO1TWjqL6kcvs05hGIjkBPNE3PgveOO5FGpwv4TVSbm
 U33g88ag74h6PRU5TrP9582GEkBbuGr/FYsBizvG6mjO/oP1PeFEzPUpdJmAEdtv1ce3
 OP8yL1OEM6DfomOah9kCblDk1a9Yqfuk463tV+AS7NO1Ef/Oco9D0CaqNe3vvgyQoSR1
 w57g==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH5Hd8HaSCa"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 46.0.7 DYNA|AUTH)
 with ESMTPSA id q020e2vBHI272dT
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 17 Dec 2019 19:02:07 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Paul Cercueil <paul@crapouillou.net>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 James Hogan <jhogan@kernel.org>
Subject: [PATCH v4 0/8] ARM/MIPS: DTS: add child nodes describing the PVRSGX
 GPU present in some OMAP SoC and JZ4780 (and many more)
Date: Tue, 17 Dec 2019 19:01:58 +0100
Message-Id: <cover.1576605726.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 18 Dec 2019 08:13:03 +0000
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
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
 "H. Nikolaus Schaller" <hns@goldelico.com>, openpvrsgx-devgroup@letux.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, kernel@pyra-handheld.com,
 letux-kernel@openphoenux.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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
  ARM: DTS: omap3: add sgx gpu child node
  ARM: DTS: omap36xx: add sgx gpu child node
  ARM: DTS: omap4: add sgx gpu child node
  ARM: DTS: omap5: add sgx gpu child node
  MIPS: DTS: jz4780: add sgx gpu node

 .../devicetree/bindings/gpu/img,pvrsgx.yaml   | 80 +++++++++++++++++++
 arch/arm/boot/dts/am33xx.dtsi                 |  9 ++-
 arch/arm/boot/dts/am3517.dtsi                 | 11 +--
 arch/arm/boot/dts/omap34xx.dtsi               | 11 +--
 arch/arm/boot/dts/omap36xx.dtsi               | 11 +--
 arch/arm/boot/dts/omap4.dtsi                  |  9 ++-
 arch/arm/boot/dts/omap4470.dts                | 15 ++++
 arch/arm/boot/dts/omap5.dtsi                  |  9 ++-
 arch/mips/boot/dts/ingenic/jz4780.dtsi        | 11 +++
 9 files changed, 139 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
 create mode 100644 arch/arm/boot/dts/omap4470.dts

-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
