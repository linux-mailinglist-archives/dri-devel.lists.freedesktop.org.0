Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C845B0B468
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 11:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1BE10E179;
	Sun, 20 Jul 2025 09:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="L6mJtI9u";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="RbJxu4Aj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b3-smtp.messagingengine.com
 (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF0C10E179
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 09:01:10 +0000 (UTC)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfout.stl.internal (Postfix) with ESMTP id 058F01D00127;
 Sun, 20 Jul 2025 04:51:08 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Sun, 20 Jul 2025 04:51:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to; s=fm2; t=1753001468; x=1753087868; bh=gQV59Aievl
 /LHsII52zjTNCqSuGz5fExZsMExKq04hU=; b=L6mJtI9u0DIJzIFzES6RUxC6QM
 nOXOwy892BeOgiSBCkNqfsHBWKukdfgnfdkT1EVFc2ZCi41DtWTyJ1aTGIXe/EJe
 n/mTi4JhMAAvxnE4716Tl4enwxvyA0V7XrP9hM2vV0sEiTnLHCpD3wpsJPhnWq4Z
 D9hA+OxZEwEOkNNoLAq+ZTE5paeOKtlTEkTd/2+uPh6odv8iKUP6Ut7SOyV5eNyj
 JLFhN/hrRUvYSdPMmBQdfDNNABgCqx8hhhVdNrmtOuLeFccHvvuZodhrSA+xaVgF
 1Z4FF7Gpya1BGYEhiomDHJDSKvq2qTGIdOVdRc1gZM6DZko8CyKP4Do+wRgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1753001468; x=1753087868; bh=gQV59Aievl/LHsII52zjTNCqSuGz5fExZsM
 ExKq04hU=; b=RbJxu4AjYWHWGO4Xti0Kan6IjgghWZpt5gx/58ZxJg40ok4PHXz
 QgPcpy+D7eCLdrpVIEpknRBLD8YvR1069xlCM3mGkvgOtCbzCPN6QAZ+Qc8eE+BA
 Ce8+Uct8z+eRYvbf3fiLVXe4/rZjj3c1L4W5adxnKt4eCbpsM8N4g2Py4c/EE41Y
 U3UjmgSmpdoCVYd8/ceO78lQ8LUaMFIsEB7SCeYriEMEpby5eAC4/c9Pc5zzdSmJ
 MresWbmCc9CmafExSzDnxdpGtabn8qLpL7shBa0HL/8scbLrWNuwJQMEUCuN8JsS
 swVDCsFXgxx8GZnnsyq7xkol2/55/djxnjA==
X-ME-Sender: <xms:-618aNAwOZt92zal1_CFhaLA1qzd89iBE_WfT7Zo_8Ft96EEEnY42A>
 <xme:-618aMIY2DmpguQqvbYoOzN4asaZ4Yvh8S1biHv_-BGd40b3cY5FLKzHU0jIGgvh4
 1APrvrZWBYNKLlnhw>
X-ME-Received: <xmr:-618aDumqiz37U_wXkz9mL1dksN5UiD28M5bcvXe-S2OmHYe9FhGXEtGf3fh99OJm-gTApSUWnhd6JedgxBHzuLFWDx9aQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeikeejjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcuhggrlhhk
 lhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrthhtvghrnh
 epfeejjefhjefhgfeitdellefhueekfeetueektdejvdeuueegudehudffkeevudeunecu
 ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgs
 pghrtghpthhtohepudehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehrohgshh
 eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdho
 rhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtth
 hopeifvghnshestghsihgvrdhorhhgpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggs
 vggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnug
 drohhrghdprhgtphhtthhopegrnhgurhgvrdhprhiihiifrghrrgesrghrmhdrtghomhdp
 rhgtphhtthhopehmrggtrhhorghlphhhrgekvdesghhmrghilhdrtghomhdprhgtphhtth
 hopehkihhkuhgthhgrnhelkeesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:-618aMXTENndXGA_6xrbCkrXOv3WPuZabdw3SfGnJrqDJ31BPnTG3Q>
 <xmx:-618aGKIvE3F3HpGJatCw5N-_DS3ZcBIxP-49rTD8VoIv4IBLSAElw>
 <xmx:-618aJ-ld0ahDCW-UIPPoySWYcnZmtn3M4n8V8J2Aq6v092xt4orRw>
 <xmx:-618aMOc2O_9EoAc2MbWzdlSFG7NEbm24S9oWQWmrnNyJ06_Si4swQ>
 <xmx:_K18aELd15twgm1QngICr-FB1pgniyT_ZH2OxV46XAUzztVOO4y_YRjY>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Jul 2025 04:51:03 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 00/12] arm64: dts: allwinner: h616: add LCD timing
 controller and display engine support
Date: Sun, 20 Jul 2025 20:48:38 +1200
Message-ID: <20250720085047.5340-1-ryan@testtoast.com>
X-Mailer: git-send-email 2.50.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

V2 of this patch adding display engine and timing controller support for the H616 and related SoCs, and enabling LCD output for the RG35XX series of handheld gaming devices using this SoC. V2 updates with feedback and Acks from the previous v1, with changes largely improving consistency of DT compatible and fallback strings, and removing the temporary GPIO switched backlight from v1 in favour of waiting for proper PWM support.

Regards,

Ryan

Original blurb below:

The H616 series of SoCs has an LCD timing controller as part of its display pipeline, capable of outputting to an LCD display, as well as HDMI and (depending on the SoC) composite TV signals. The pins are not exposed on all die variants, but the H700 variant is exposes RGB and LVDS pins. Building on the DE33 display engine patches on the list (https://lore.kernel.org/linux-sunxi/20250216085432.6373-2-ryan@testtoast.com), this patch series:

- adds the required device tree configuration for the display pipeline to the H616 (bus, display engine, mixer and timing controller)
- adds a quirk to the sun4i TCON driver for the Allwinner R40 (compatible with the H616/H618/H700/T507)
- describes the H616 RGB and LVDS GPIO pins
- adds the required pipeline endpoints to the device tree for the Anbernic RG35XX devices featuring this SoC
- adds LCD panel description, and required power supply configuration for the panel, backlight and GPIO pins for the RG35XX

Thanks to Jernej Skrabec for the initial out-of-tree patch for the T507.

Regards,

Ryan

Chris Morgan (1):
  dt-bindings: allwinner: add H616 DE33 bus binding

Jernej Skrabec (1):
  drm/sun4i: tcon: add support for R40

Ryan Walklin (10):
  dt-bindings: allwinner: Add TCON_TOP_LCD clock defines
  dt-bindings: display: sun4i: Add compatible strings for H616 DE
  dt-bindings: display: sun4i: Add compatible strings for H616 TCON TOP
  dt-bindings: display: sun4i: add allwinner R40 and H616 tcon
    compatible strings
  dt-bindings: sram: sunxi-sram: Add H616 SRAM C compatible
  drm: sun4i: add compatible for h616 display engine
  arm64: dts: allwinner: h616: add display engine, bus and mixer nodes
  arm64: dts: allwinner: h616: Add LCD timing controller nodes
  arm64: dts: allwinner: h616: add LCD and LVDS pins
  arm64: dts: allwinner: rg35xx: Enable LCD output

 .../bus/allwinner,sun50i-a64-de2.yaml         |   7 +-
 .../allwinner,sun4i-a10-display-engine.yaml   |   1 +
 .../display/allwinner,sun4i-a10-tcon.yaml     |  10 +
 .../display/allwinner,sun8i-r40-tcon-top.yaml |  13 +-
 .../allwinner,sun4i-a10-system-control.yaml   |   4 +-
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 225 ++++++++++++++++++
 .../sun50i-h700-anbernic-rg35xx-2024.dts      |  56 +++++
 drivers/gpu/drm/sun4i/sun4i_drv.c             |   1 +
 drivers/gpu/drm/sun4i/sun4i_tcon.c            |   9 +
 include/dt-bindings/clock/sun8i-tcon-top.h    |   2 +
 10 files changed, 319 insertions(+), 9 deletions(-)

-- 
2.50.1

