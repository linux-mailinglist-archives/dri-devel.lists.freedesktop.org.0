Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCEE6D5D0D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 12:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C57BF10E07A;
	Tue,  4 Apr 2023 10:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE1510E07A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 10:21:59 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 55040582041;
 Tue,  4 Apr 2023 06:21:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 04 Apr 2023 06:21:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:message-id:mime-version:reply-to
 :sender:subject:subject:to:to; s=fm3; t=1680603717; x=
 1680610917; bh=HfFAtQpE7BaTkEYQ0u2Ynx4ouaJzSTjkYPluvZNu8hE=; b=h
 Pa6w32LG6ZGsw9w5HpvU1X8+s70WJVZqSVEeb0w9tGcqObzCwt/9vsQNmLbZI/hh
 UHt52yWqIoA1S0AYq+9IyjAB0URJghQU7n2sTmfMyVFA/mkE5/QdO6oNXNPgaRwU
 wDtHV44+nyu6r17tzpkIMMv/ieCrmFtoHZhQjQmteldfZ+fZHQpWBwDUN1ao9lyn
 /pAqBV9TECC9lN7jEGVlPLDYiHuZK7OJcglDkJqhy8S7YtLi8+24FSwiPDEe18A0
 Ym6cEe1NEXDnOVKILQVY50myqzVXGZCYdAdDNmFlW/3JjfnJfTa5fwlrtMohI599
 2Y4Ow0fgwiBgGIc810prQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; t=1680603717; x=1680610917; bh=H
 fFAtQpE7BaTkEYQ0u2Ynx4ouaJzSTjkYPluvZNu8hE=; b=u+sXLZ7CZSUuVdx1E
 fHxv9w0Der3HiA1daXyY5iSuv0hQabFzJkwFELrXWZfnmbwKQPrnGYCQiaYv44cs
 xuMLUpt9g+8massfJIi/9xCB4mwfSP0PP1ZBAMkca+BZoul68F3wX2d4snWi+D74
 s+5lpznGNfnPJVUsnnmVGHDBn6YuvJjkRhtIxqGzIfjJwrdZflIZSffRRQh+Y+Cu
 5eSVp+o7H7X6ojmF4t8J2Va11g9QYB8S0YRR+CF/T2n9AhTIhkCxpH34320JD0BM
 roe02fONC6XwwYHEj2ho5wtveGI29hnVQ7FqQjbRNqiGodIJZeIRXgJhS/+/wk4v
 nyZAg==
X-ME-Sender: <xms:QvorZPY6zLvt0o6cXhzQ23zP4TAe4cJCsSMKFfdK2IiCVudBlYOQgQ>
 <xme:QvorZOY6rGks4FqL41YSYj74tg-ZhId6cm5IcUaxjYPkrqzMqvUlxa0vEEDb0Vg4D
 S6ruEAxTkMmv4PcMCs>
X-ME-Received: <xmr:QvorZB8QqHLdBnfYJTsRU9U-asZkFWoEcpC-bp8uSZmm6kvKELwpQnuEIS18eFO0IeGU8XD9qsUtRE1RaIezyXk-8iaqiJU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgfeutdejvdeiheffveetieejtdfhleekleffheejtdfhkeehfeekgedvgeei
 tddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:QvorZFojgtNbJTHiiXYEfZp3V-_TIESjBO6qvXjEX1jNP-dSHfSlXA>
 <xmx:QvorZKqtZ9nRAOzsdNv3bcZ8wUb3HJFn5NMv2JbgGkCYmrC3ESxpFw>
 <xmx:QvorZLRJyrzEISGAaDVyAwY6JiqEEqER-iGGR122q-s0osVhP8eKug>
 <xmx:RforZPOqyIjBbuy21MUJCgJlCjRtc3KcBxXm8jWkbKOVuzrWCcu7wA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 06:21:53 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 00/65] clk: Make determine_rate mandatory for muxes
Date: Tue, 04 Apr 2023 12:10:50 +0200
Message-Id: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKr3K2QC/43NzQ7CIAwH8FdZOFsDZZvoyfcwHjZWhGxhCUyiM
 Xt3626e9NT8+/HrS2RKgbI4VS+RqIQc5shB7yphfRdvBGHgLFAiKqkM2GmEtA2sJztmcOFBGVD
 qo9MNaqyl4OO+ywQ9L1rP5/E+Tdz0IS9zem7PiuJy+ekWBRKcJmdko4yq5dlSivN+IYavbBb8z
 8GP0x50O5BV2tCXs67rGzN7xKMKAQAA
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Lechner <david@lechnology.com>, Sekhar Nori <nsekhar@ti.com>,
 Abel Vesa <abelvesa@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 David Airlie <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,
 Paul Cercueil <paul@crapouillou.net>,  Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8407; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=f/Knn1kk7vVUXORQfxa+QfreHaZSdTArsNS+gG1C4RA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37eIXJ9r9bU2NZTxI2e6xOUNZ4zyD2zen+fTxNDRKd7e
 xnGso5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABMRMmb4Z5Yqmp38+lxyluzpNf9ry4
 Vn/r3nLZd4auNprhVG3+VvzmH472xmvN/z4eEzPa3WC+9ftpz8f1fMw1z3nz2TjQQWz7Ll5wIA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: linux-rtc@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 linux-phy@lists.infradead.org, Liam Beguin <liambeguin@gmail.com>,
 linux-mediatek@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>,
 linux-tegra@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This is a follow-up to a previous series that was printing a warning
when a mux has a set_parent implementation but is missing
determine_rate().

The rationale is that set_parent() is very likely to be useful when
changing the rate, but it's determine_rate() that takes the parenting
decision. If we're missing it, then the current parent is always going
to be used, and thus set_parent() will not be used. The only exception
being a direct call to clk_set_parent(), but those are fairly rare
compared to clk_set_rate().

Stephen then asked to promote the warning to an error, and to fix up all
the muxes that are in that situation first. So here it is :)

It was build-tested on x86, arm and arm64.

Affected drivers have been tracked down by the following coccinelle
script:

virtual report 

@ clk_ops @
identifier ops;
position p;
@@

 struct clk_ops ops@p = {
   ...
 };

@ has_set_parent @
identifier clk_ops.ops;
identifier set_parent_f;
@@

  struct clk_ops ops = {
	.set_parent = set_parent_f,
  };

@ has_determine_rate @
identifier clk_ops.ops;
identifier determine_rate_f;
@@

  struct clk_ops ops = {
	.determine_rate = determine_rate_f,
  };

@ script:python depends on report && has_set_parent && !has_determine_rate @
ops << clk_ops.ops;
set_parent_f << has_set_parent.set_parent_f;
p << clk_ops.p;
@@

coccilib.report.print_report(p[0], "ERROR: %s has set_parent (%s)" % (ops, set_parent_f))

Berlin is the only user still matching after this series has been
applied, but it's because it uses a composite clock which throws the
script off. The driver has been converted and shouldn't be a problem. 

Let me know what you think,
Maxime

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
Changes in v3:
- Rebased on top of next-20230404
- Link to v2: https://lore.kernel.org/r/20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech

Changes in v2:
- Drop all the patches already applied
- Promote the clk registration warning to an error
- Make all muxes use determine_rate
- Link to v1: https://lore.kernel.org/r/20221018-clk-range-checks-fixes-v1-0-f3ef80518140@cerno.tech

---
Maxime Ripard (65):
      clk: Export clk_hw_forward_rate_request()
      clk: lan966x: Remove unused round_rate hook
      clk: nodrv: Add a determine_rate hook
      clk: test: Add a determine_rate hook
      clk: actions: composite: Add a determine_rate hook for pass clk
      clk: at91: main: Add a determine_rate hook
      clk: at91: sckc: Add a determine_rate hook
      clk: berlin: div: Add a determine_rate hook
      clk: cdce706: Add a determine_rate hook
      clk: k210: pll: Add a determine_rate hook
      clk: k210: aclk: Add a determine_rate hook
      clk: k210: mux: Add a determine_rate hook
      clk: lmk04832: clkout: Add a determine_rate hook
      clk: lochnagar: Add a determine_rate hook
      clk: qoriq: Add a determine_rate hook
      clk: si5341: Add a determine_rate hook
      clk: stm32f4: mux: Add a determine_rate hook
      clk: vc5: mux: Add a determine_rate hook
      clk: vc5: clkout: Add a determine_rate hook
      clk: wm831x: clkout: Add a determine_rate hook
      clk: davinci: da8xx-cfgchip: Add a determine_rate hook
      clk: davinci: da8xx-cfgchip: Add a determine_rate hook
      clk: imx: busy: Add a determine_rate hook
      clk: imx: fixup-mux: Add a determine_rate hook
      clk: imx: scu: Add a determine_rate hook
      clk: mediatek: cpumux: Add a determine_rate hook
      clk: pxa: Add a determine_rate hook
      clk: renesas: r9a06g032: Add a determine_rate hook
      clk: socfpga: gate: Add a determine_rate hook
      clk: stm32: core: Add a determine_rate hook
      clk: tegra: bpmp: Add a determine_rate hook
      clk: tegra: super: Add a determine_rate hook
      clk: tegra: periph: Add a determine_rate hook
      clk: ux500: prcmu: Add a determine_rate hook
      clk: ux500: sysctrl: Add a determine_rate hook
      clk: versatile: sp810: Add a determine_rate hook
      drm/tegra: sor: Add a determine_rate hook
      phy: cadence: sierra: Add a determine_rate hook
      phy: cadence: torrent: Add a determine_rate hook
      phy: ti: am654-serdes: Add a determine_rate hook
      phy: ti: j721e-wiz: Add a determine_rate hook
      rtc: sun6i: Add a determine_rate hook
      ASoC: tlv320aic32x4: Add a determine_rate hook
      clk: actions: composite: div: Switch to determine_rate
      clk: actions: composite: fact: Switch to determine_rate
      clk: at91: smd: Switch to determine_rate
      clk: axi-clkgen: Switch to determine_rate
      clk: cdce706: divider: Switch to determine_rate
      clk: cdce706: clkout: Switch to determine_rate
      clk: si5341: Switch to determine_rate
      clk: si5351: pll: Switch to determine_rate
      clk: si5351: msynth: Switch to determine_rate
      clk: si5351: clkout: Switch to determine_rate
      clk: da8xx: clk48: Switch to determine_rate
      clk: imx: scu: Switch to determine_rate
      clk: ingenic: cgu: Switch to determine_rate
      clk: ingenic: tcu: Switch to determine_rate
      clk: sprd: composite: Switch to determine_rate
      clk: st: flexgen: Switch to determine_rate
      clk: stm32: composite: Switch to determine_rate
      clk: tegra: periph: Switch to determine_rate
      clk: tegra: super: Switch to determine_rate
      ASoC: tlv320aic32x4: pll: Switch to determine_rate
      ASoC: tlv320aic32x4: div: Switch to determine_rate
      clk: Forbid to register a mux without determine_rate

 drivers/clk/actions/owl-composite.c       | 35 +++++++++++-----
 drivers/clk/actions/owl-composite.h       |  2 +-
 drivers/clk/at91/clk-main.c               |  3 +-
 drivers/clk/at91/clk-smd.c                | 29 +++++++------
 drivers/clk/at91/sckc.c                   |  3 +-
 drivers/clk/berlin/berlin2-div.c          |  3 +-
 drivers/clk/clk-axi-clkgen.c              | 14 ++++---
 drivers/clk/clk-cdce706.c                 | 31 ++++++++------
 drivers/clk/clk-k210.c                    | 17 +++++---
 drivers/clk/clk-lan966x.c                 | 17 --------
 drivers/clk/clk-lmk04832.c                |  1 +
 drivers/clk/clk-lochnagar.c               |  2 +
 drivers/clk/clk-qoriq.c                   | 10 +++--
 drivers/clk/clk-si5341.c                  | 21 +++++-----
 drivers/clk/clk-si5351.c                  | 67 +++++++++++++++++--------------
 drivers/clk/clk-stm32f4.c                 |  3 +-
 drivers/clk/clk-versaclock5.c             |  8 ++--
 drivers/clk/clk-wm831x.c                  |  3 +-
 drivers/clk/clk.c                         | 15 +++++++
 drivers/clk/clk_test.c                    |  1 +
 drivers/clk/davinci/da8xx-cfgchip.c       | 15 ++++---
 drivers/clk/imx/clk-busy.c                |  3 +-
 drivers/clk/imx/clk-fixup-mux.c           |  3 +-
 drivers/clk/imx/clk-scu.c                 | 27 +++++++++++--
 drivers/clk/ingenic/cgu.c                 | 15 +++----
 drivers/clk/ingenic/tcu.c                 | 19 +++++----
 drivers/clk/mediatek/clk-cpumux.c         |  3 +-
 drivers/clk/pxa/clk-pxa.c                 |  3 +-
 drivers/clk/renesas/r9a06g032-clocks.c    |  3 +-
 drivers/clk/socfpga/clk-gate.c            |  3 +-
 drivers/clk/sprd/composite.c              | 16 +++++---
 drivers/clk/st/clk-flexgen.c              | 15 +++----
 drivers/clk/stm32/clk-stm32-core.c        | 33 ++++++++++-----
 drivers/clk/tegra/clk-bpmp.c              |  7 +++-
 drivers/clk/tegra/clk-periph.c            | 19 ++++++---
 drivers/clk/tegra/clk-super.c             | 18 ++++++---
 drivers/clk/ux500/clk-prcmu.c             |  3 +-
 drivers/clk/ux500/clk-sysctrl.c           |  4 +-
 drivers/clk/versatile/clk-sp810.c         |  3 +-
 drivers/gpu/drm/tegra/sor.c               |  3 +-
 drivers/phy/cadence/phy-cadence-sierra.c  |  1 +
 drivers/phy/cadence/phy-cadence-torrent.c |  1 +
 drivers/phy/ti/phy-am654-serdes.c         |  1 +
 drivers/phy/ti/phy-j721e-wiz.c            |  1 +
 drivers/rtc/rtc-sun6i.c                   |  2 +
 sound/soc/codecs/tlv320aic32x4-clk.c      | 37 ++++++++++-------
 46 files changed, 343 insertions(+), 200 deletions(-)
---
base-commit: 6a53bda3aaf3de5edeea27d0b1d8781d067640b6
change-id: 20221018-clk-range-checks-fixes-2039f3523240

Best regards,
-- 
Maxime Ripard <maxime@cerno.tech>

