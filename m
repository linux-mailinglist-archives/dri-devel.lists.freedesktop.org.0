Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0E24775D8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 16:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8C410E4BF;
	Thu, 16 Dec 2021 15:25:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E1E10E559
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 15:25:09 +0000 (UTC)
Date: Thu, 16 Dec 2021 15:24:53 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v11 0/8] MIPS: JZ4780 and CI20 HDMI
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <H5S74R.5BG9EDZORI63@crapouillou.net>
In-Reply-To: <cover.1638470392.git.hns@goldelico.com>
References: <cover.1638470392.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 letux-kernel@openphoenux.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Patches 1 and 2 added to drm-misc-next.

I'll pick the rest when the regulator situation is sorted out.

Cheers,
-Paul


Le jeu., d=E9c. 2 2021 at 19:39:45 +0100, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> PATCH V11 2021-12-02 19:39:52:
> - patch 4/8: change devm_regulator_get_optional to devm_regulator_get=20
> and
>              remove NULL check (requested by broonie@kernel.org)
> - patch 3/8: make hdmi-5v-supply required (requested by=20
> broonie@kernel.org)
>=20
> PATCH V10 2021-11-30 22:26:41:
> - patch 3/8: fix $id and $ref paths (found by robh@kernel.org)
>=20
> PATCH V9 2021-11-24 22:29:14:
> - patch 6/8: remove optional <0> for assigned-clocks and=20
> unintentionally included "unwedge" setup (found by=20
> paul@crapouillou.net)
> - patch 4/8: some cosmetics
>              make regulator enable/disable only if not NULL (found by=20
> paul@crapouillou.net)
>              simplify/fix error handling and driver cleanup on remove=20
> (proposed by paul@crapouillou.net)
> - patch 3/8: fix #include path in example (found by=20
> paul@crapouillou.net)
>              fix missing "i" in unevaluatedProperties (found by=20
> robh@kernel.org)
>              fix 4 spaces indentation for required: property (found=20
> by robh@kernel.org)
>=20
> PATCH V8 2021-11-23 19:14:00:
> - fix a bad editing result from patch 2/8 (found by=20
> paul@crapouillou.net)
>=20
> PATCH V7 2021-11-23 18:46:23:
> - changed gpio polarity of hdmi_power to 0 (suggested by=20
> paul@crapouillou.net)
> - fixed LCD1 irq number (bug found by paul@crapouillou.net)
> - removed "- 4" for calculating max_register (suggested by=20
> paul@crapouillou.net)
> - use unevaluatedPropertes instead of additionalProperties (suggested=20
> by robh@kernel.org)
> - moved and renamed ingenic,jz4780-hdmi.yaml (suggested by=20
> robh@kernel.org)
> - adjusted assigned-clocks changes to upstream which added some for=20
> SSI (by hns@goldelico.com)
> - rebased and tested with v5.16-rc2 + patch set drm/ingenic by=20
> paul@crapouillou.net (by hns@goldelico.com)
>=20
> PATCH V6 2021-11-10 20:43:33:
> - changed CONFIG_DRM_INGENIC_DW_HDMI to "m" (by hns@goldelico.com)
> - made ingenic-dw-hdmi an independent platform driver which can be=20
> compiled as module
>   and removed error patch fixes for IPU (suggested by=20
> paul@crapouillou.net)
> - moved assigned-clocks from jz4780.dtsi to ci20.dts (suggested by=20
> paul@crapouillou.net)
> - fixed reg property in jz4780.dtsi to cover all registers incl.=20
> gamma and vee (by hns@goldelico.com)
> - added a base patch to calculate regmap size from DTS reg property=20
> (requested by paul@crapouillou.net)
> - restored resetting all bits except one in LCDOSDC (requested by=20
> paul@crapouillou.net)
> - clarified setting of cpos (suggested by paul@crapouillou.net)
> - moved bindings definition for ddc-i2c-bus (suggested by=20
> paul@crapouillou.net)
> - simplified mask definitions for JZ_LCD_DESSIZE (requested by=20
> paul@crapouillou.net)
> - removed setting alpha premultiplication (suggested by=20
> paul@crapouillou.net)
> - removed some comments (suggested by paul@crapouillou.net)
>=20
> PATCH V5 2021-10-05 14:28:44:
> - dropped mode_fixup and timings support in dw-hdmi as it is no=20
> longer needed in this V5 (by hns@goldelico.com)
> - dropped "drm/ingenic: add some jz4780 specific features"=20
> (stimulated by paul@crapouillou.net)
> - fixed typo in commit subject: "synopsis" -> "synopsys" (by=20
> hns@goldelico.com)
> - swapped clocks in jz4780.dtsi to match synopsys,dw-hdmi.yaml (by=20
> hns@goldelico.com)
> - improved, simplified, fixed, dtbschecked ingenic-jz4780-hdmi.yaml=20
> and made dependent of bridge/synopsys,dw-hdmi.yaml (based on=20
> suggestions by maxime@cerno.tech)
> - fixed binding vs. driver&DTS use of hdmi-5v regulator (suggested by=20
> maxime@cerno.tech)
> - dropped "drm/bridge: synopsis: Fix to properly handle HPD" - was a=20
> no longer needed workaround for a previous version
>   (suggested by maxime@cerno.tech)
>=20
> PATCH V4 2021-09-27 18:44:38:
> - fix setting output_port =3D 1 (issue found by paul@crapouillou.net)
> - ci20.dts: convert to use hdmi-connector (by hns@goldelico.com)
> - add a hdmi-regulator to control +5V power (by hns@goldelico.com)
> - added a fix to dw-hdmi to call drm_kms_helper_hotplug_event on=20
> plugin event detection (by hns@goldelico.com)
> - always allocate extended descriptor but initialize only for jz4780=20
> (by hns@goldelico.com)
> - updated to work on top of "[PATCH v3 0/6] drm/ingenic: Various=20
> improvements v3" (by paul@crapouillou.net)
> - rebased to v5.13-rc3
>=20
> PATCH V3 2021-08-08 07:10:50:
> This series adds HDMI support for JZ4780 and CI20 board (and fixes=20
> one IPU related issue in registration error path)
> - [patch 1/8] switched from mode_fixup to atomic_check (suggested by=20
> robert.foss@linaro.org)
>   - the call to the dw-hdmi specialization is still called mode_fixup
> - [patch 3/8] diverse fixes for ingenic-drm-drv (suggested by=20
> paul@crapouillou.net)
>   - factor out some non-HDMI features of the jz4780 into a separate=20
> patch
>   - multiple fixes around max height
>   - do not change regmap config but a copy on stack
>   - define some constants
>   - factor out fixing of drm_init error path for IPU into separate=20
> patch
>   - use FIELD_PREP()
> - [patch 8/8] conversion to component framework dropped (suggested by=20
> Laurent.pinchart@ideasonboard.com and paul@crapouillou.net)
>=20
> PATCH V2 2021-08-05 16:08:05:
> - code and commit messages revisited for checkpatch warnings
> - rebased on v5.14-rc4
> - include (failed, hence RFC 8/8) attempt to convert to component=20
> framework
>   (was suggested by Paul Cercueil <paul@crapouillou.net> a while ago)
>=20
> This series adds HDMI support for JZ4780 and CI20 board
>=20
>=20
>=20
> H. Nikolaus Schaller (3):
>   drm/ingenic: prepare ingenic drm for later addition of JZ4780
>   MIPS: defconfig: CI20: configure for DRM_DW_HDMI_JZ4780
>   [RFC] MIPS: DTS: Ingenic: adjust register size to available=20
> registers
>=20
> Paul Boddie (4):
>   drm/ingenic: Add support for JZ4780 and HDMI output
>   drm/ingenic: Add dw-hdmi driver for jz4780
>   MIPS: DTS: jz4780: Account for Synopsys HDMI driver and LCD
>     controllers
>   MIPS: DTS: CI20: Add DT nodes for HDMI setup
>=20
> Sam Ravnborg (1):
>   dt-bindings: display: Add ingenic,jz4780-dw-hdmi DT Schema
>=20
>  .../display/bridge/ingenic,jz4780-hdmi.yaml   |  78 ++++++++++
>  .../display/bridge/synopsys,dw-hdmi.yaml      |   3 +
>  arch/mips/boot/dts/ingenic/ci20.dts           |  72 +++++++++-
>  arch/mips/boot/dts/ingenic/jz4725b.dtsi       |   2 +-
>  arch/mips/boot/dts/ingenic/jz4740.dtsi        |   2 +-
>  arch/mips/boot/dts/ingenic/jz4770.dtsi        |   2 +-
>  arch/mips/boot/dts/ingenic/jz4780.dtsi        |  40 ++++++
>  arch/mips/configs/ci20_defconfig              |   6 +
>  drivers/gpu/drm/ingenic/Kconfig               |   9 ++
>  drivers/gpu/drm/ingenic/Makefile              |   1 +
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  62 +++++++-
>  drivers/gpu/drm/ingenic/ingenic-drm.h         |  38 +++++
>  drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c     | 136=20
> ++++++++++++++++++
>  13 files changed, 443 insertions(+), 8 deletions(-)
>  create mode 100644=20
> Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
>  create mode 100644 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
>=20
> --
> 2.33.0
>=20


