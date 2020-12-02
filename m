Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAE02CD0E1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 09:15:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F4F36E0B6;
	Thu,  3 Dec 2020 08:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0029F6E955
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 08:18:40 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1kkNLI-0004hX-6I; Wed, 02 Dec 2020 09:18:28 +0100
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1kkNLH-0007h1-Hh; Wed, 02 Dec 2020 09:18:27 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v6 0/8] mainline Plymovent M2M and BAS board
Date: Wed,  2 Dec 2020 09:18:18 +0100
Message-Id: <20201202081826.29512-1-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 03 Dec 2020 08:14:41 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Oleksij Rempel <o.rempel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Jander <david@protonic.nl>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

changes v5:
- do more panel-simple.yaml related cleanups

changes v5:
- rebase against latest shawngup/for-next
- add patch to fix checkpatch warning on PLYM2M dts

changes v4:
- add PLYBAS board
- PLYM2M: add touchscreen node
- PLYM2M: add rename led nodes to led-x

changes v3:
- use old style copyright text

changes v2:
- fsl.yaml: reorder ply,plym2m
- imx6dl-plym2m.dts: use hyphen instead of underscore in phy-clock

Oleksij Rempel (8):
  dt-bindings: display: simple: fix alphabetical order for EDT
    compatibles
  dt-bindings: display: simple: add EDT compatibles already supported by
    the driver
  dt-bindings: display: simple: Add Kyocera tcg070wvlq panel
  dt-bindings: vendor-prefixes: Add an entry for Plymovent
  dt-bindings: arm: fsl: add Plymovent M2M board
  ARM: dts: add Plymovent M2M board
  dt-bindings: arm: fsl: add Plymovent BAS board
  ARM: dts: add Plymovent BAS board

 .../devicetree/bindings/arm/fsl.yaml          |   2 +
 .../bindings/display/panel/panel-simple.yaml  |  20 +-
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/Makefile                    |   2 +
 arch/arm/boot/dts/imx6dl-plybas.dts           | 394 ++++++++++++++++
 arch/arm/boot/dts/imx6dl-plym2m.dts           | 446 ++++++++++++++++++
 6 files changed, 857 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6dl-plybas.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-plym2m.dts

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
