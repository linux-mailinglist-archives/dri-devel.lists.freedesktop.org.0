Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC444A75CF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 17:31:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C82310E339;
	Wed,  2 Feb 2022 16:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1497110E339
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 16:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1643819485;
 s=strato-dkim-0002; d=goldelico.com;
 h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=99p0ifqV7U4RV4YuFoRRcCCspsekSCK8BjeDPuvaFdA=;
 b=KrWNOz/eZN+Q/HuDNMbFs+mv1GRK66dZUl4+hloj5nrr3AXBXDCVD+N0t+DSFjSf7Q
 wQTKTvUKlSZTkkAjO656Y0lRAPzrZlpGg8FL+O9DCbENCEN3Ni2H0nEuOFrl3JfRn20I
 6q9iLwoMRVcEKkGRRCNZd98krU274+CrAH3Qb8O1oxivvgcd17WRt/l3LAfi8hsVY7lg
 h/CHsJQYwyqkCnzqpmu2yEzBPBCF7F7mLevkq+tZZKHkOaN7cVj0J2lSlpZIaE8aCH9y
 WptzzXEnmt5A9JfK9s0gvajfqo4E7qyMIjMdsjrvnpfYVM36lQUi0GVJsA6+e9qlzdD5
 t+BA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UMf2MwPVbjc9Y="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 47.39.0 DYNA|AUTH)
 with ESMTPSA id L29417y12GVNBmi
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 2 Feb 2022 17:31:23 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Paul Boddie <paul@boddie.org.uk>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v13 0/9] MIPS: JZ4780 and CI20 HDMI
Date: Wed,  2 Feb 2022 17:31:14 +0100
Message-Id: <cover.1643819482.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PATCH V13 2022-02-02 17:31:22:
* 7/9: remove call to gpiod_set_value() because of GPIOD_OUT_HIGH (by paul@crapouillou.net)
* 4/9: replace ".." by "." (by paul@crapouillou.net)
* 3/9: remove old hdmi-5v-power in the example (by paul@crapouillou.net)
* 2/9: disable handling of plane f0 only for jz4780 (by paul@crapouillou.net)

PATCH V12 2022-01-31 13:26:54:
This version reworks how hdmi ddc power is controlled by connector and not
by ddc/hdmi bridge driver.

Also some patches of the previous version of this series have been removed
since they are already applied to mips-next/linux/next/v5.17-rc1.

Fixes and changes:

- repair interworking of dw-hdmi with connector-hdmi (by hns@goldelico.com)
- fix JZ_REG_LCD_OSDC setup for jz4780 (by hns@goldelico.com and paul@crapouillou.net)
- adjustments for ci20.dts to use connector gpio for +5v (suggested by several)
- to add control of "ddc-en-gpios" to hdmi-connector driver (by hns@goldelico.com)
- regulator code removed because we now use the "ddc-en-gpios" of the connector
  driver (suggested by paul@crapouillou.net)
- bindings: addition of "ddc-i2c-bus" and "hdmi-5v-supply" removed (suggested by robh+dt@kernel.org)
- rebase on v5.17-rc2

PATCH V11 2021-12-02 19:39:52:
- patch 4/8: change devm_regulator_get_optional to devm_regulator_get and
             remove NULL check (requested by broonie@kernel.org)
- patch 3/8: make hdmi-5v-supply required (requested by broonie@kernel.org)

PATCH V10 2021-11-30 22:26:41:
- patch 3/8: fix $id and $ref paths (found by robh@kernel.org)

PATCH V9 2021-11-24 22:29:14:
- patch 6/8: remove optional <0> for assigned-clocks and unintentionally included "unwedge" setup (found by paul@crapouillou.net)
- patch 4/8: some cosmetics
             make regulator enable/disable only if not NULL (found by paul@crapouillou.net)
             simplify/fix error handling and driver cleanup on remove (proposed by paul@crapouillou.net)
- patch 3/8: fix #include path in example (found by paul@crapouillou.net)
             fix missing "i" in unevaluatedProperties (found by robh@kernel.org)
             fix 4 spaces indentation for required: property (found by robh@kernel.org)

PATCH V8 2021-11-23 19:14:00:
- fix a bad editing result from patch 2/8 (found by paul@crapouillou.net)

PATCH V7 2021-11-23 18:46:23:
- changed gpio polarity of hdmi_power to 0 (suggested by paul@crapouillou.net)
- fixed LCD1 irq number (bug found by paul@crapouillou.net)
- removed "- 4" for calculating max_register (suggested by paul@crapouillou.net)
- use unevaluatedPropertes instead of additionalProperties (suggested by robh@kernel.org)
- moved and renamed ingenic,jz4780-hdmi.yaml (suggested by robh@kernel.org)
- adjusted assigned-clocks changes to upstream which added some for SSI (by hns@goldelico.com)
- rebased and tested with v5.16-rc2 + patch set drm/ingenic by paul@crapouillou.net (by hns@goldelico.com)

PATCH V6 2021-11-10 20:43:33:
- changed CONFIG_DRM_INGENIC_DW_HDMI to "m" (by hns@goldelico.com)
- made ingenic-dw-hdmi an independent platform driver which can be compiled as module
  and removed error patch fixes for IPU (suggested by paul@crapouillou.net)
- moved assigned-clocks from jz4780.dtsi to ci20.dts (suggested by paul@crapouillou.net)
- fixed reg property in jz4780.dtsi to cover all registers incl. gamma and vee (by hns@goldelico.com)
- added a base patch to calculate regmap size from DTS reg property (requested by paul@crapouillou.net)
- restored resetting all bits except one in LCDOSDC (requested by paul@crapouillou.net)
- clarified setting of cpos (suggested by paul@crapouillou.net)
- moved bindings definition for ddc-i2c-bus (suggested by paul@crapouillou.net)
- simplified mask definitions for JZ_LCD_DESSIZE (requested by paul@crapouillou.net)
- removed setting alpha premultiplication (suggested by paul@crapouillou.net)
- removed some comments (suggested by paul@crapouillou.net)

PATCH V5 2021-10-05 14:28:44:
- dropped mode_fixup and timings support in dw-hdmi as it is no longer needed in this V5 (by hns@goldelico.com)
- dropped "drm/ingenic: add some jz4780 specific features" (stimulated by paul@crapouillou.net)
- fixed typo in commit subject: "synopsis" -> "synopsys" (by hns@goldelico.com)
- swapped clocks in jz4780.dtsi to match synopsys,dw-hdmi.yaml (by hns@goldelico.com)
- improved, simplified, fixed, dtbschecked ingenic-jz4780-hdmi.yaml and made dependent of bridge/synopsys,dw-hdmi.yaml (based on suggestions by maxime@cerno.tech)
- fixed binding vs. driver&DTS use of hdmi-5v regulator (suggested by maxime@cerno.tech)
- dropped "drm/bridge: synopsis: Fix to properly handle HPD" - was a no longer needed workaround for a previous version
  (suggested by maxime@cerno.tech)

PATCH V4 2021-09-27 18:44:38:
- fix setting output_port = 1 (issue found by paul@crapouillou.net)
- ci20.dts: convert to use hdmi-connector (by hns@goldelico.com)
- add a hdmi-regulator to control +5V power (by hns@goldelico.com)
- added a fix to dw-hdmi to call drm_kms_helper_hotplug_event on plugin event detection (by hns@goldelico.com)
- always allocate extended descriptor but initialize only for jz4780 (by hns@goldelico.com)
- updated to work on top of "[PATCH v3 0/6] drm/ingenic: Various improvements v3" (by paul@crapouillou.net)
- rebased to v5.13-rc3

PATCH V3 2021-08-08 07:10:50:
This series adds HDMI support for JZ4780 and CI20 board (and fixes one IPU related issue in registration error path)
- [patch 1/8] switched from mode_fixup to atomic_check (suggested by robert.foss@linaro.org)
  - the call to the dw-hdmi specialization is still called mode_fixup
- [patch 3/8] diverse fixes for ingenic-drm-drv (suggested by paul@crapouillou.net)
  - factor out some non-HDMI features of the jz4780 into a separate patch
  - multiple fixes around max height
  - do not change regmap config but a copy on stack
  - define some constants
  - factor out fixing of drm_init error path for IPU into separate patch
  - use FIELD_PREP()
- [patch 8/8] conversion to component framework dropped (suggested by Laurent.pinchart@ideasonboard.com and paul@crapouillou.net)

PATCH V2 2021-08-05 16:08:05:
- code and commit messages revisited for checkpatch warnings
- rebased on v5.14-rc4
- include (failed, hence RFC 8/8) attempt to convert to component framework
  (was suggested by Paul Cercueil <paul@crapouillou.net> a while ago)

This series adds HDMI support for JZ4780 and CI20 board



H. Nikolaus Schaller (5):
  drm/ingenic: prepare ingenic drm for later addition of JZ4780
  drm/synopsys+ingenic: repair hot plug detection
  dw-hdmi/ingenic-dw-hdmi: repair interworking with hdmi-connector
  drm/bridge: display-connector: add ddc-en gpio support
  MIPS: DTS: CI20: fix how ddc power is enabled

Paul Boddie (3):
  drm/ingenic: Add support for JZ4780 and HDMI output
  drm/ingenic: Add dw-hdmi driver specialization for jz4780
  [RFC] drm/ingenic: add some more features specific to jz4780

Sam Ravnborg (1):
  dt-bindings: display: Add ingenic,jz4780-dw-hdmi DT Schema

 .../display/bridge/ingenic,jz4780-hdmi.yaml   |  82 ++++++++++++++
 arch/mips/boot/dts/ingenic/ci20.dts           |  15 +--
 drivers/gpu/drm/bridge/display-connector.c    |  15 +++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  13 ++-
 drivers/gpu/drm/ingenic/Kconfig               |   9 ++
 drivers/gpu/drm/ingenic/Makefile              |   1 +
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     | 106 +++++++++++++++++-
 drivers/gpu/drm/ingenic/ingenic-drm.h         |  38 +++++++
 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c     | 106 ++++++++++++++++++
 include/drm/bridge/dw_hdmi.h                  |   1 +
 10 files changed, 367 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
 create mode 100644 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c

-- 
2.33.0

