Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AECD645AD85
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 21:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57CC96E433;
	Tue, 23 Nov 2021 20:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8024C6E433
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 20:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637700250;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=lx2cJbI8GrOX2KSveTwWrflXhk1U0xk/ZzWu+iZs7Ak=;
 b=PjW1E4lbGzoW6qeYk56MrIQ0PpOEOGMHjrbKJYHUGWu+DlyLcK737iHE1lo8lEIdhD
 VeOiyhOnrpPxyaOhMDFVH+/orjnkoXmkg5wq49Qz05ZjYWA2v1ek+kPE/42zYOyaUhC2
 fXcbj4YaRs97LQys/LKPxsDLwBhYB3A6R0qW4vzRzbOA5yyGg45JpaN7pHWRB9W9Ohm7
 Vp79ba+a8doCEXiAvwBRGe3j8yQFAtyTJJ9i2ZuLLtWuK6dKQitQ/CMGx9IMdl+TuO9N
 y3X4eF2hpkrxsQ9SCDh5+ubraDN3agE5WprNjf/9/czCav/IDAhAu9aLhgqSvcTdmXR/
 6Vxw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw43u3mM="
X-RZG-CLASS-ID: mo00
Received: from mbp-13-nikolaus.fritz.box
 by smtp.strato.de (RZmta 47.34.6 DYNA|AUTH)
 with ESMTPSA id g09b5fxANKi885e
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Tue, 23 Nov 2021 21:44:08 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v8 0/8] MIPS: JZ4780 and CI20 HDMI
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <J4K13R.CGVJ0IY95LC51@crapouillou.net>
Date: Tue, 23 Nov 2021 21:44:07 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <B6B358E8-4395-442F-A353-396D8DC54C66@goldelico.com>
References: <cover.1637691240.git.hns@goldelico.com>
 <J4K13R.CGVJ0IY95LC51@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3445.104.21)
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
 letux-kernel@openphoenux.org, Ezequiel Garcia <ezequiel@collabora.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

> Am 23.11.2021 um 21:12 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> I think if you can fix the last few things I commented on, and I get =
an ACK from Rob for the Device Tree related patches, then it will be =
ready to merge.

Fine! Especially for finding the NULL regulator risk.

Will do in the next days.
For the unwedge pinmux I have to check if we need it at all.

BR and thanks,
Nikolaus

>=20
> Cheers,
> -Paul
>=20
>=20
> Le mar., nov. 23 2021 at 19:13:53 +0100, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>> PATCH V8 2021-11-23 19:14:00:
>> - fix a bad editing result from patch 2/8 (found by =
paul@crapouillou.net)
>> PATCH V7 2021-11-23 18:46:23:
>> - changed gpio polarity of hdmi_power to 0 (suggested by =
paul@crapouillou.net)
>> - fixed LCD1 irq number (bug found by paul@crapouillou.net)
>> - removed "- 4" for calculating max_register (suggested by =
paul@crapouillou.net)
>> - use unevaluatedPropertes instead of additionalProperties (suggested =
by robh@kernel.org)
>> - moved and renamed ingenic,jz4780-hdmi.yaml (suggested by =
robh@kernel.org)
>> - adjusted assigned-clocks changes to upstream which added some for =
SSI (by hns@goldelico.com)
>> - rebased and tested with v5.16-rc2 + patch set drm/ingenic by =
paul@crapouillou.net (by hns@goldelico.com)
>> PATCH V6 2021-11-10 20:43:33:
>> - changed CONFIG_DRM_INGENIC_DW_HDMI to "m" (by hns@goldelico.com)
>> - made ingenic-dw-hdmi an independent platform driver which can be =
compiled as module
>>  and removed error patch fixes for IPU (suggested by =
paul@crapouillou.net)
>> - moved assigned-clocks from jz4780.dtsi to ci20.dts (suggested by =
paul@crapouillou.net)
>> - fixed reg property in jz4780.dtsi to cover all registers incl. =
gamma and vee (by hns@goldelico.com)
>> - added a base patch to calculate regmap size from DTS reg property =
(requested by paul@crapouillou.net)
>> - restored resetting all bits except one in LCDOSDC (requested by =
paul@crapouillou.net)
>> - clarified setting of cpos (suggested by paul@crapouillou.net)
>> - moved bindings definition for ddc-i2c-bus (suggested by =
paul@crapouillou.net)
>> - simplified mask definitions for JZ_LCD_DESSIZE (requested by =
paul@crapouillou.net)
>> - removed setting alpha premultiplication (suggested by =
paul@crapouillou.net)
>> - removed some comments (suggested by paul@crapouillou.net)
>> PATCH V5 2021-10-05 14:28:44:
>> - dropped mode_fixup and timings support in dw-hdmi as it is no =
longer needed in this V5 (by hns@goldelico.com)
>> - dropped "drm/ingenic: add some jz4780 specific features" =
(stimulated by paul@crapouillou.net)
>> - fixed typo in commit subject: "synopsis" -> "synopsys" (by =
hns@goldelico.com)
>> - swapped clocks in jz4780.dtsi to match synopsys,dw-hdmi.yaml (by =
hns@goldelico.com)
>> - improved, simplified, fixed, dtbschecked ingenic-jz4780-hdmi.yaml =
and made dependent of bridge/synopsys,dw-hdmi.yaml (based on suggestions =
by maxime@cerno.tech)
>> - fixed binding vs. driver&DTS use of hdmi-5v regulator (suggested by =
maxime@cerno.tech)
>> - dropped "drm/bridge: synopsis: Fix to properly handle HPD" - was a =
no longer needed workaround for a previous version
>>  (suggested by maxime@cerno.tech)
>> PATCH V4 2021-09-27 18:44:38:
>> - fix setting output_port =3D 1 (issue found by paul@crapouillou.net)
>> - ci20.dts: convert to use hdmi-connector (by hns@goldelico.com)
>> - add a hdmi-regulator to control +5V power (by hns@goldelico.com)
>> - added a fix to dw-hdmi to call drm_kms_helper_hotplug_event on =
plugin event detection (by hns@goldelico.com)
>> - always allocate extended descriptor but initialize only for jz4780 =
(by hns@goldelico.com)
>> - updated to work on top of "[PATCH v3 0/6] drm/ingenic: Various =
improvements v3" (by paul@crapouillou.net)
>> - rebased to v5.13-rc3
>> PATCH V3 2021-08-08 07:10:50:
>> This series adds HDMI support for JZ4780 and CI20 board (and fixes =
one IPU related issue in registration error path)
>> - [patch 1/8] switched from mode_fixup to atomic_check (suggested by =
robert.foss@linaro.org)
>>  - the call to the dw-hdmi specialization is still called mode_fixup
>> - [patch 3/8] diverse fixes for ingenic-drm-drv (suggested by =
paul@crapouillou.net)
>>  - factor out some non-HDMI features of the jz4780 into a separate =
patch
>>  - multiple fixes around max height
>>  - do not change regmap config but a copy on stack
>>  - define some constants
>>  - factor out fixing of drm_init error path for IPU into separate =
patch
>>  - use FIELD_PREP()
>> - [patch 8/8] conversion to component framework dropped (suggested by =
Laurent.pinchart@ideasonboard.com and paul@crapouillou.net)
>> PATCH V2 2021-08-05 16:08:05:
>> - code and commit messages revisited for checkpatch warnings
>> - rebased on v5.14-rc4
>> - include (failed, hence RFC 8/8) attempt to convert to component =
framework
>>  (was suggested by Paul Cercueil <paul@crapouillou.net> a while ago)
>> This series adds HDMI support for JZ4780 and CI20 board
>> H. Nikolaus Schaller (3):
>>  drm/ingenic: prepare ingenic drm for later addition of JZ4780
>>  MIPS: defconfig: CI20: configure for DRM_DW_HDMI_JZ4780
>>  [RFC] MIPS: DTS: Ingenic: adjust register size to available =
registers
>> Paul Boddie (4):
>>  drm/ingenic: Add support for JZ4780 and HDMI output
>>  drm/ingenic: Add dw-hdmi driver for jz4780
>>  MIPS: DTS: jz4780: Account for Synopsys HDMI driver and LCD
>>    controllers
>>  MIPS: DTS: CI20: Add DT nodes for HDMI setup
>> Sam Ravnborg (1):
>>  dt-bindings: display: Add ingenic,jz4780-dw-hdmi DT Schema
>> .../display/bridge/ingenic,jz4780-hdmi.yaml   |  76 +++++++++++
>> .../display/bridge/synopsys,dw-hdmi.yaml      |   3 +
>> arch/mips/boot/dts/ingenic/ci20.dts           |  83 ++++++++++-
>> arch/mips/boot/dts/ingenic/jz4725b.dtsi       |   2 +-
>> arch/mips/boot/dts/ingenic/jz4740.dtsi        |   2 +-
>> arch/mips/boot/dts/ingenic/jz4770.dtsi        |   2 +-
>> arch/mips/boot/dts/ingenic/jz4780.dtsi        |  40 ++++++
>> arch/mips/configs/ci20_defconfig              |   6 +
>> drivers/gpu/drm/ingenic/Kconfig               |   9 ++
>> drivers/gpu/drm/ingenic/Makefile              |   1 +
>> drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  62 ++++++++-
>> drivers/gpu/drm/ingenic/ingenic-drm.h         |  38 ++++++
>> drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c     | 129 =
++++++++++++++++++
>> 13 files changed, 444 insertions(+), 9 deletions(-)
>> create mode 100644 =
Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
>> create mode 100644 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
>> --
>> 2.33.0
>=20
>=20

