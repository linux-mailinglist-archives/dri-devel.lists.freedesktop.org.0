Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D4019752F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A23456E02D;
	Mon, 30 Mar 2020 07:11:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D5B6E180
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 17:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1585503370;
 s=strato-dkim-0002; d=goldelico.com;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=o9cl3lo73IupocSaAB1N567LORTRk86aGdGAIUt50w4=;
 b=T13LVJZGfQHiKlsMCPbCkxYE9ZDIYDeM6cEtYQPqxbce+wscbTpoWR3+0fnLoalU1a
 lVc/ipzFtifwQW52h7Od4gtQqLOnqcrMns0TEn1lVuayOc9hXknqjQPKHsZDqyxsM1qR
 tX3S4KxZERZ7KGNXcNHzB5BsJZME24WSR50QxXTO0QU/+WCT1FXaNxjjXrpUPeMMbbjB
 ZXDyjOg4MIVBD8bMlXjA6VrY6ocGO2jVjC/7i2O9z738IOtQkjbetrXjK3YXOvI+yZ0N
 KCaJNmV8z0ELhUknqk50hk+6FJnCArDAU2kEKSNXvBrwLuJSCocvfiQx2llWspzTWu9c
 uStA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pDz2rsNxxv"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
 with ESMTPSA id m02241w2THZtBM7
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sun, 29 Mar 2020 19:35:55 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>, Paul Boddie <paul@boddie.org.uk>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Kees Cook <keescook@chromium.org>
Subject: [RFC v3 0/8] MIPS: CI20: add HDMI out support
Date: Sun, 29 Mar 2020 19:35:46 +0200
Message-Id: <cover.1585503354.git.hns@goldelico.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-gpio@vger.kernel.org, mips-creator-ci20-dev@googlegroups.com,
 letux-kernel@openphoenux.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+++ help is needed: driver is not completely working and shows no output signal on the HDMI data and clock lanes
+++ HPD is working and /dev/fb0 does appear
+++ but there is no trigger to initialize the lcdc

* add definition for second jz4780-lcdc
* diverse fixes for yaml schema
* make ingenic-drm driver compatible to ingenic,jz4780-lcd
* converted existing ingenic,lcd.txt to ingenic,lcd.yaml - suggested by Paul Cercueil <paul@crapouillou.net>
* removed blank line before MODULE_DEVICE_TABLE() macro - Paul Cercueil <paul@crapouillou.net>
* added some missing Signed-off:
* removed Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com> from the
  recipients list and Cc: since the address is no longer available.
* removed "pinctrl: ingenic: add hdmi-ddc pin control group" from this patch
  series since it is already applied elsewhere (by Linus Walleij <linus.walleij@linaro.org>)

RFC V2 2020-02-28 19:19:40:
* Converted .txt bindings to .yaml (by Sam Ravnborg <sam@ravnborg.org> - big THANKS)

RFC V1 2020-02-26 20:13:06:
This patch series adds HDMI output to the jz4780/CI20 board.

It is based on taking the old 3.18 vendor kernel as well as
an earlier submission from 2015:
https://lore.kernel.org/patchwork/patch/547872/
and trying to achieve the same with modern DTS setup and new/modified
drivers.

Unfortunately, in this first RFC, only EDID and creation of
/dev/fb0 are working. Also, HDMI hot plugging is detected.

But there is no HDMI output signal. So some tiny piece seems
to be missing to enable/configure the Synposys HDMI controller.

We need help from the community to fix this.

Original authors of most patches are
* Paul Boddie <paul@boddie.org.uk>
* Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>


H. Nikolaus Schaller (4):
  dt-bindings: display: convert ingenic,lcd.txt to ingenic,lcd.yaml
  drm: ingenic-drm: add MODULE_DEVICE_TABLE
  drm: ingenic-drm: add support for ingenic,jz4780-lcd
  MIPS: CI20: defconfig: configure for DRM_DW_HDMI_JZ4780

Paul Boddie (3):
  drm: ingenic: add jz4780 Synopsys HDMI driver
  MIPS: DTS: jz4780: account for Synopsys HDMI driver and LCD controller
  MIPS: DTS: CI20: add HDMI setup

Sam Ravnborg (1):
  dt-bindings: display: add ingenic-jz4780-hdmi DT Schema

 .../bindings/display/ingenic,lcd.txt          |  45 ------
 .../bindings/display/ingenic,lcd.yaml         | 128 ++++++++++++++++++
 .../bindings/display/ingenic-jz4780-hdmi.yaml |  82 +++++++++++
 arch/mips/boot/dts/ingenic/ci20.dts           |  64 +++++++++
 arch/mips/boot/dts/ingenic/jz4780.dtsi        |  46 +++++++
 arch/mips/configs/ci20_defconfig              |   3 +
 drivers/gpu/drm/ingenic/Kconfig               |   8 ++
 drivers/gpu/drm/ingenic/Makefile              |   1 +
 drivers/gpu/drm/ingenic/dw_hdmi-jz4780.c      | 120 ++++++++++++++++
 drivers/gpu/drm/ingenic/ingenic-drm.c         |   8 ++
 10 files changed, 460 insertions(+), 45 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/ingenic,lcd.txt
 create mode 100644 Documentation/devicetree/bindings/display/ingenic,lcd.yaml
 create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
 create mode 100644 drivers/gpu/drm/ingenic/dw_hdmi-jz4780.c

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
