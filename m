Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8674F64D2
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 18:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B1610E506;
	Wed,  6 Apr 2022 16:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE81D10E529
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 16:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1649262372;
 s=strato-dkim-0002; d=goldelico.com;
 h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=AnMX7TkbQsYZjujSesbm1e03nqe/vrMABVeFbmvE/gQ=;
 b=CzqlyCzSNamrGN9xtyvCgjPYpFLZ6SAcyGAnSf2BbkPE2lKoJdoMfwDwMeFkl5MkYV
 hTm7X3dqLMwHBIlV5WGy6tyNwFNDyiXZf3/5BGTB+YVNXgPnBMMmYhlepsq7VqpxrL6Z
 BwrIaWtq6J0fsCB5ysmWGrE80Nmh0RiF1joD0mv58tRfTHiznKovSc3CAJq8aTqkeg0p
 M/WjuIfrPaPfiZD++a4AJtHwjagHKbNS0xEuN2F5HA31b6dJJaptx35d6aG3Zp+XdnlX
 vdX/RWwLGrN5bNGTHfszOF02/e7gyqBd38oJtYA1yEYsM9AV4AMV2Y1KIXPXDmROPZsQ
 gHrQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UMf2MwPVbgcbPa"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 47.42.2 DYNA|AUTH)
 with ESMTPSA id k708cfy36GQAgVL
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 6 Apr 2022 18:26:10 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Paul Boddie <paul@boddie.org.uk>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Paul Cercueil <paul@crapouillou.net>,
 Maxime Ripard <maxime@cerno.tech>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v17 0/6] MIPS: JZ4780 and CI20 HDMI
Date: Wed,  6 Apr 2022 18:26:02 +0200
Message-Id: <cover.1649262368.git.hns@goldelico.com>
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
Cc: letux-kernel@openphoenux.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PATCH V17 2022-04-06 18:26:08:
* removed our local attempts to enable HPD because
  "drm/bridge_connector: enable HPD by default if supported"
  became available and solves the issue globally (by nikita.yoush@cogentembedded.com)
* add new mechanism to disable Color Space Conversion (by narmstrong@baylibre.com)
* rebased to v5.18-rc1 based drm-misc/drm-misc-next 

PATCH V16 2022-02-26 18:13:02:
* fixed and renamed dw-hdmi bus negotiation patch (by narmstrong@baylibre.com)
* reordered and merged HPD fix (suggested by paul@crapouillou.net)
* fixed MODULE_ALIAS for dw-hdmi-ingenic (reported by paul@crapouillou.net)
* dropped some already merged commits from the series

PATCH V15 2022-02-12 16:50:54:
* remove already (elsewhere) merged commits (suggested by paul@crapouillou.net)
* clarify commit message for (now) 1/7 ((suggested by paul@crapouillou.net))

PATCH V14 2022-02-12 15:19:25:
* make compatible to c03d0b52ff71d5 ("drm/connector: Fix typo in output format")
* move "dw-hdmi/ingenic-dw-hdmi: repair interworking with hdmi-connector" before
  drm/ingenic: Add dw-hdmi driver specialization for jz4780 (by paul@crapouillou.net)
* split introduction of dw_hdmi_enable_poll() into separate patch
* explicitly mark plane f0 as not working in jz4780 (suggested by paul@crapouillou.net)
* drop 1/9 since it is now in drm-misc/drm-misc-next

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



H. Nikolaus Schaller (2):
  drm/bridge: dw-hdmi: add YCBCR formats only if CSC is available
  drm/bridge: display-connector: add ddc-en gpio support

Neil Armstrong (2):
  drm/bridge: dw-hdmi: filter out YUV output formats when DVI
  drm/bridge: dw-hdmi: handle unusable or non-configured CSC module

Paul Boddie (1):
  drm/ingenic: Add dw-hdmi driver specialization for jz4780

Paul Cercueil (1):
  drm/ingenic: Implement proper .atomic_get_input_bus_fmts

 drivers/gpu/drm/bridge/display-connector.c |  15 +++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c  | 119 ++++++++++++++-------
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.h  |   1 +
 drivers/gpu/drm/ingenic/Kconfig            |   9 ++
 drivers/gpu/drm/ingenic/Makefile           |   1 +
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c  |  28 ++++-
 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c  | 104 ++++++++++++++++++
 include/drm/bridge/dw_hdmi.h               |   1 +
 8 files changed, 238 insertions(+), 40 deletions(-)
 create mode 100644 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c

-- 
2.33.0

