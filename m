Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 487AA5B8ACB
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 16:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F57910E944;
	Wed, 14 Sep 2022 14:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Wed, 14 Sep 2022 14:38:57 UTC
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC3B10E942
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 14:38:57 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:e925:8cbe:2e99:b03b])
 by xavier.telenet-ops.be with bizsmtp
 id KqZi280123vs4GX01qZiFR; Wed, 14 Sep 2022 16:33:53 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oYTSQ-005B5L-24; Wed, 14 Sep 2022 16:33:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oYTS6-000zWz-Vs; Wed, 14 Sep 2022 16:33:22 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Tony Lindgren <tony@atomide.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v2 0/3] dt-bindings: display: bridge: nxp,
 tda998x: Json-schema conversion and fixes
Date: Wed, 14 Sep 2022 16:33:19 +0200
Message-Id: <cover.1663165552.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

	Hi all,

This patch series converts the NXP TDA998x HDMI transmitter Device Tree
binding documentation to json-schema, after a few customary fixes.

Changes compared to v1:
  - Add maximum to video-ports,
  - Drop unneeded maxItems for audio-ports,
  - Complete port descriptions.

Thanks for your comments!

[1] "[PATCH 0/3] dt-bindings: display: bridge: nxp,tda998x: Json-schema
    conversion and fixes"
    https://lore.kernel.org/r/cover.1634822085.git.geert+renesas@glider.be/

Geert Uytterhoeven (3):
  ARM: dts: am335x: Fix TDA998x ports addressing
  [RFC] arm64: dts: renesas: cat874: Drop bogus clocks property
  dt-bindings: display: bridge: nxp,tda998x: Convert to json-schema

 .../bindings/display/bridge/nxp,tda998x.yaml  | 109 ++++++++++++++++++
 .../bindings/display/bridge/tda998x.txt       |  54 ---------
 arch/arm/boot/dts/am335x-boneblack-hdmi.dtsi  |   7 +-
 arch/arm/boot/dts/am335x-myirtech-myd.dts     |   7 +-
 .../boot/dts/renesas/r8a774c0-cat874.dts      |   1 -
 5 files changed, 121 insertions(+), 57 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/tda998x.txt

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
