Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DB04FBFF2
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 17:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6671610E023;
	Mon, 11 Apr 2022 15:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 803E610E074
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 15:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1649689883; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ESRvZFR2NbOXpMA5bjUrdXSBGzMnYd7kxLTC8a6OtyE=;
 b=CBA1SHarW75rkWVte39knKZfYJrKGDC7WhjGv2sMng1pkwhXaOn1Hstpne4OAWR9ttoDhv
 hdYAD9Ab5fD7xT5WdNjG/W/1tc0J7i857B/OMUXkxzkIsKjRlMOZmpvUXCQPCs8WokChxw
 E3Jcr4cfpfE4kBjXAafLV80Qh3ffbXo=
Date: Mon, 11 Apr 2022 16:10:49 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v18 0/3] MIPS: JZ4780 and CI20 HDMI
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <1UK6AR.1FH2Y9SIMKV81@crapouillou.net>
In-Reply-To: <cover.1649330170.git.hns@goldelico.com>
References: <cover.1649330170.git.hns@goldelico.com>
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
Cc: Paul Boddie <paul@boddie.org.uk>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-mips@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, letux-kernel@openphoenux.org,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Series applied to drm-misc-next.

Good job to Nikolaus and everyone involved!

Cheers,
-Paul


Le jeu., avril 7 2022 at 13:16:08 +0200, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> PATCH V18 2022-04-07 13:16:10:
> * removed CSC filter patches (3-5/6) by Neil Armstrong=20
> <narmstrong@baylibre.com> as they no longer seem to be required
> * added "Reviewed-by: Laurent Pinchart=20
> <laurent.pinchart@ideasonboard.com>" to ddc-en patch (6/6)
>=20
> PATCH V17 2022-04-06 18:26:08:
> * removed our local attempts to enable HPD because
>   "drm/bridge_connector: enable HPD by default if supported"
>   became available and solves the issue globally (by=20
> nikita.yoush@cogentembedded.com)
> * add new mechanism to disable Color Space Conversion (by=20
> narmstrong@baylibre.com)
> * rebased to v5.18-rc1 based drm-misc/drm-misc-next
>=20
> PATCH V16 2022-02-26 18:13:02:
> * fixed and renamed dw-hdmi bus negotiation patch (by=20
> narmstrong@baylibre.com)
> * reordered and merged HPD fix (suggested by paul@crapouillou.net)
> * fixed MODULE_ALIAS for dw-hdmi-ingenic (reported by=20
> paul@crapouillou.net)
> * dropped some already merged commits from the series
>=20
> PATCH V15 2022-02-12 16:50:54:
> * remove already (elsewhere) merged commits (suggested by=20
> paul@crapouillou.net)
> * clarify commit message for (now) 1/7 ((suggested by=20
> paul@crapouillou.net))
>=20
> PATCH V14 2022-02-12 15:19:25:
> * make compatible to c03d0b52ff71d5 ("drm/connector: Fix typo in=20
> output format")
> * move "dw-hdmi/ingenic-dw-hdmi: repair interworking with=20
> hdmi-connector" before
>   drm/ingenic: Add dw-hdmi driver specialization for jz4780 (by=20
> paul@crapouillou.net)
> * split introduction of dw_hdmi_enable_poll() into separate patch
> * explicitly mark plane f0 as not working in jz4780 (suggested by=20
> paul@crapouillou.net)
> * drop 1/9 since it is now in drm-misc/drm-misc-next
>=20
> PATCH V13 2022-02-02 17:31:22:
> * 7/9: remove call to gpiod_set_value() because of GPIOD_OUT_HIGH (by=20
> paul@crapouillou.net)
> * 4/9: replace ".." by "." (by paul@crapouillou.net)
> * 3/9: remove old hdmi-5v-power in the example (by=20
> paul@crapouillou.net)
> * 2/9: disable handling of plane f0 only for jz4780 (by=20
> paul@crapouillou.net)
>=20
> PATCH V12 2022-01-31 13:26:54:
> This version reworks how hdmi ddc power is controlled by connector=20
> and not
> by ddc/hdmi bridge driver.
>=20
> Also some patches of the previous version of this series have been=20
> removed
> since they are already applied to mips-next/linux/next/v5.17-rc1.
>=20
> Fixes and changes:
>=20
> - repair interworking of dw-hdmi with connector-hdmi (by=20
> hns@goldelico.com)
> - fix JZ_REG_LCD_OSDC setup for jz4780 (by hns@goldelico.com and=20
> paul@crapouillou.net)
> - adjustments for ci20.dts to use connector gpio for +5v (suggested=20
> by several)
> - to add control of "ddc-en-gpios" to hdmi-connector driver (by=20
> hns@goldelico.com)
> - regulator code removed because we now use the "ddc-en-gpios" of the=20
> connector
>   driver (suggested by paul@crapouillou.net)
> - bindings: addition of "ddc-i2c-bus" and "hdmi-5v-supply" removed=20
> (suggested by robh+dt@kernel.org)
> - rebase on v5.17-rc2
>=20
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
> H. Nikolaus Schaller (1):
>   drm/bridge: display-connector: add ddc-en gpio support
>=20
> Paul Boddie (1):
>   drm/ingenic: Add dw-hdmi driver specialization for jz4780
>=20
> Paul Cercueil (1):
>   drm/ingenic: Implement proper .atomic_get_input_bus_fmts
>=20
>  drivers/gpu/drm/bridge/display-connector.c |  15 +++
>  drivers/gpu/drm/ingenic/Kconfig            |   9 ++
>  drivers/gpu/drm/ingenic/Makefile           |   1 +
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c  |  28 +++++-
>  drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c  | 103=20
> +++++++++++++++++++++
>  5 files changed, 155 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
>=20
> --
> 2.33.0
>=20


