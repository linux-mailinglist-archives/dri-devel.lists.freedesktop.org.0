Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 060973C7DAC
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 06:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387EA6E15A;
	Wed, 14 Jul 2021 04:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21EB6E15A
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 04:54:17 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1m3Wu8-0001DR-DG; Wed, 14 Jul 2021 06:53:52 +0200
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1m3Wu6-0002rl-HT; Wed, 14 Jul 2021 06:53:50 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Olof Johansson <olof@lixom.net>,
 Rob Herring <robh+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, soc@kernel.org,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 0/4] Mainline imx6 based SKOV boards
Date: Wed, 14 Jul 2021 06:53:45 +0200
Message-Id: <20210714045349.10963-1-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

changes v2:
- remove unnecessary newlines.
- change linux,wakeup to wakeup-source
- change switch@3 unit-address to @0
- sort aliases alphabetically

Mainline imx6 based DTs for SKOV A/S boards

Oleksij Rempel (3):
  dt-bindings: display: simple: add some Logic Technologies and
    Multi-Inno panels
  dt-bindings: vendor-prefixes: Add an entry for SKOV A/S
  dt-bindings: arm: fsl: add SKOV imx6q and imx6dl based boards

Sam Ravnborg (1):
  ARM: dts: add SKOV imx6q and imx6dl based boards

 .../devicetree/bindings/arm/fsl.yaml          |   5 +
 .../bindings/display/panel/panel-simple.yaml  |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/Makefile                    |   5 +
 arch/arm/boot/dts/imx6dl-skov-revc-lt2.dts    |  13 +
 arch/arm/boot/dts/imx6dl-skov-revc-lt6.dts    | 108 ++++
 arch/arm/boot/dts/imx6q-skov-revc-lt2.dts     |  36 ++
 arch/arm/boot/dts/imx6q-skov-revc-lt6.dts     | 128 +++++
 .../dts/imx6q-skov-reve-mi1010ait-1cp1.dts    | 127 +++++
 arch/arm/boot/dts/imx6qdl-skov-cpu-revc.dtsi  |  54 ++
 arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi       | 475 ++++++++++++++++++
 11 files changed, 959 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6dl-skov-revc-lt2.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-skov-revc-lt6.dts
 create mode 100644 arch/arm/boot/dts/imx6q-skov-revc-lt2.dts
 create mode 100644 arch/arm/boot/dts/imx6q-skov-revc-lt6.dts
 create mode 100644 arch/arm/boot/dts/imx6q-skov-reve-mi1010ait-1cp1.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-skov-cpu-revc.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi

-- 
2.30.2

