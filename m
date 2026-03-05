Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOW7HLDGqWmcEgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 19:08:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D43E216CE2
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 19:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06F910E0F8;
	Thu,  5 Mar 2026 18:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=hugovil.com header.i=@hugovil.com header.b="CxWr7cc6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDF110E2D5
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 18:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
 ; s=x;
 h=Subject:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Cc:To
 :From:subject:date:message-id:reply-to;
 bh=xlv9aSBDN9dBeajKyuHQxLmuBfwuhVHupzGXgcU9K58=; b=CxWr7cc6/pd/qdgtGA7o5nsQWP
 zGWH7xN3y7bhDNaKluN4rX2wMiLrJmL+Qz2ny8Yt1FzaNMj2VuM8K31ZgolY9h/Nf80b7++wFXGsd
 Rs9x2z9g/iRsoOSq0Sqgw01i4s3N+H9je+iuwu5+o1lmSxZfLEfH5jE6DXhR0HfjlLDo=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:37706
 helo=pettiford.lan) by mail.hugovil.com with esmtpa (Exim 4.92)
 (envelope-from <hugo@hugovil.com>)
 id 1vyD7T-0002aR-Vo; Thu, 05 Mar 2026 13:08:20 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
 laurent.pinchart+renesas@ideasonboard.com, antonin.godard@bootlin.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, hugo@hugovil.com,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>
Date: Thu,  5 Mar 2026 13:06:15 -0500
Message-ID: <20260305180651.1827087-1-hugo@hugovil.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.hugovil.com
X-Spam-Level: 
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
 *      [score: 0.0000]
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham autolearn_force=no version=3.4.2
Subject: [PATCH v2 00/15] var-som-6ul: improve support for variants
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 0D43E216CE2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[hugovil.com:s=x];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[hugovil.com];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:shawnguo@kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:antonin.godard@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:hugo@hugovil.com,m:hvilleneuve@dimonoff.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:laurent.pinchart@ideasonboard.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,nxp.com,pengutronix.de,bootlin.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER(0.00)[hugo@hugovil.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[hugovil.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[hugo@hugovil.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Hello,
this patch series improves support for Variscite VAR-SOM-6UL based boards.

The first two patches fix DT/dmesg warnings.

The next patches fix the incorrect use of VAR-SOM-MX6UL to refer to the
VAR-SOM-6UL.

The next patches add support for the imx6ull CPU variant of the VAR-SOM-6UL.

Then improves/fixes the following features/options that are currently not
working on the concerto EVK board:
  - ethernet ports ENET1
  - LVDS display panel
  - Wifi/Bt

Note that the previous configuration of the optional Wifi/Bluetooth module
was copied from the original Variscite kernel tree, and required custom
shell scripts to properly configure the Wifi/Bluetooth module.

Also factor out optional features into separate DTSI include files, so it will
be easier to support them for other boards, and to make sure they are not
unconditionnally enabled.

I have tested these changes on a Variscite concerto EVK board using a
VAR-SOM-6UL with the following options:
  - EC (ethernet phy on SOM)
  - LD (LVDS encoder assembled on SOM)
  - WBD (Wi-Fi 802.11 ac/a/b/g/n and Bluetooth 5.2/BLE on SOM)
Result of tests:
  - Both ethernet ports Ok
  - LVDS display panel Ok
  - Wifi/Bt Ok

Also tested on a custom board with a VAR-SOM-6UL SOM (will be submitted in
a future series).

Thank you.

Link: [v1] https://lore.kernel.org/all/20260302190953.669325-1-hugo@hugovil.com/

Changes for v2:
- Place imx6ull-var-som-concerto.dtb in alphabetical order (Frank)
- s/include/dtsi in commit msgs (Frank)
- Clarify and improve patches to change VAR-SOM-MX6UL (Krzysztof)
- Collect tags for some acked patches (Krzysztof)
- Reorder pinctrl_gpio_leds in separate patch (Frank)
- Improve git commit messages ((Frank)/Krzysztof)

Hugo Villeneuve (15):
  ARM: dts: imx6ul-var-som: fix warning for non-existent dc-supply
    property
  ARM: dts: imx6ul-var-som: fix warning for boolean property with a
    value
  ARM: dts: imx6ul-var-som: change incorrect VAR-SOM-MX6UL references
  dt-bindings: arm: fsl: change incorrect VAR-SOM-MX6UL references
  dt-bindings: arm: fsl: add variscite,var-som-imx6ull
  ARM: dts: imx6ul-var-som: Factor out common parts for all CPU variants
  ARM: dts: imx6ul-var-som-concerto: Factor out common parts for all CPU
    variants
  ARM: dts: imx6ul-var-som-concerto: order DT properties
  ARM: dts: imx6ul-var-som: factor out SD card support
  ARM: dts: imx6ul-var-som: add proper Wifi and Bluetooth support
  ARM: dts: imx6ul-var-som: factor out ENET2 ethernet support
  ARM: dts: imx6ul-var-som: add support for EC configuration option
    (ENET1)
  ARM: dts: imx6ul-var-som: factor out audio support
  dt-bindings: display/lvds-codec: add ti,sn65lvds93
  ARM: dts: imx6ul-var-som: add support for LVDS display panel

 .../devicetree/bindings/arm/fsl.yaml          |   8 +-
 .../bindings/display/bridge/lvds-codec.yaml   |   1 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   3 +
 .../dts/nxp/imx/imx6ul-var-som-audio.dtsi     |  30 ++
 ...ar-som.dtsi => imx6ul-var-som-common.dtsi} | 140 +++-----
 ...ts => imx6ul-var-som-concerto-common.dtsi} | 159 ++-------
 .../nxp/imx/imx6ul-var-som-concerto-full.dts  |  22 ++
 .../dts/nxp/imx/imx6ul-var-som-concerto.dts   | 318 +-----------------
 .../dts/nxp/imx/imx6ul-var-som-enet1.dtsi     |  44 +++
 .../dts/nxp/imx/imx6ul-var-som-enet2.dtsi     |  79 +++++
 .../nxp/imx/imx6ul-var-som-lvds-panel.dtsi    | 112 ++++++
 .../boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi   |  27 ++
 .../boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi |  75 +++++
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi | 219 +-----------
 .../nxp/imx/imx6ull-var-som-concerto-full.dts |  22 ++
 .../dts/nxp/imx/imx6ull-var-som-concerto.dts  |  21 ++
 .../arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi |  36 ++
 17 files changed, 575 insertions(+), 741 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-audio.dtsi
 copy arch/arm/boot/dts/nxp/imx/{imx6ul-var-som.dtsi => imx6ul-var-som-common.dtsi} (60%)
 copy arch/arm/boot/dts/nxp/imx/{imx6ul-var-som-concerto.dts => imx6ul-var-som-concerto-common.dtsi} (50%)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet1.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet2.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-lvds-panel.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi


base-commit: c107785c7e8dbabd1c18301a1c362544b5786282
-- 
2.47.3

