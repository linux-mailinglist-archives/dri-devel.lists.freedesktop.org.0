Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F05DC619761
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:18:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38EC310E04A;
	Fri,  4 Nov 2022 13:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8321D88EA1
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:17:50 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id D56B458015C;
 Fri,  4 Nov 2022 09:17:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 04 Nov 2022 09:17:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1667567867; x=1667575067; bh=KPwqkl2vpD
 BtwBLoB8eq6xZ2Di1LH++AWXPTJ/wIA9c=; b=b2aF5Lr0bJbq+06c5UzpQ5vWar
 5YdgzGGfADrKDv3YknXn9XWwOsrdcju0YHhQ2YwpZQ1dwVG7kYK1wSIuFThCSNFN
 sbrWxxaaZ80AH99x+f7TDdm2zvtOtwqY7pZnJU1vm44MU+7bvKw3O0GhLoNwKrKW
 cFj+06/QAOFs6rCTbOzgOL53nEPuBQySdxiK5xnDfJQZV211lb14mew1qhhNQkoV
 wYdTX93TIcqT0nfCuEr1mNqebN3OSjV/XPjG576h92A9iyHPwEWJNzb7TBuhjFF5
 QW6/ZIe7ueGRb/hj+4FW7eaL/UF5CRnvfi9ppaBEhYSr4Y1nC+dNoXQVU0tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1667567867; x=1667575067; bh=KPwqkl2vpDBtw
 BLoB8eq6xZ2Di1LH++AWXPTJ/wIA9c=; b=eercXXVi+IB6LvsaHFsKYwHVKZvgs
 kciHa25A7rBSHM5hE6HWNqy/U8TwTx9k+B+d4SmV8wR1B8x5SJoUQCV8Jkyk8Pmd
 GAIu5c650ufD6Yg1rfRp8B/jcEg1bQdZa/y822OA2n61aXC38x5+aDbr553ds7Bh
 BWE4a1+Egl0DulqX35vyRvxYNhsnjZuSU6w0z2or3COeCzTkf0G1h+lTS4XXOHnu
 2mgbG8ZjaP3X/uV50N6dOBd/8q6tXT8lvPwERTYNLQP6+G557ptKDIhghNnDznor
 s3zaHr5JK94KcRawZXd9xRsKdzlMpLQUOw3gjX2P0SYgwrEn6qlL5+k0w==
X-ME-Sender: <xms:-RBlY_EJgYVGp_NfDItKSfXt9X3yzShbcSBvk_GYWp2a0WkGkSvXGQ>
 <xme:-RBlY8XdATe3U-Fyu2bc8WiN6AnGeUbBIyXXKmebIk6TL_kKO54L2A4rR3fclkjhD
 hZB6r4iFZ38HKBHO6o>
X-ME-Received: <xmr:-RBlYxLDBljuBoReDFzd1Pz9akpBx5YEStVR3u9xtFtEXAoWqmcK5kt5XuD29pf3wGhlt4TxWzsC7QtmQ15CBni6u42TrZPCsjJfeS7MTYsDFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefugggtgffhfffkvfevofesthekredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelueevteetffdvveelgfffleegudeufeelveefvddugeehkeefkeehjeeikeeg
 udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:-RBlY9GmnkNLuIyl1KYxn5VFBpf9jZ8JTevo37LZEpV4RD8ZXVpaZA>
 <xmx:-RBlY1WRXJcfIMUn2TePq-Dwv-AB9Efom47uXHmg9ifSsMRNJRIGpQ>
 <xmx:-RBlY4PbPs5SF_bhBAYze0-2gkCeUT1MsVILLSLjvhkKqy9KjfYv1g>
 <xmx:-xBlY2WrtDUYcxhtd5pbuoWdKreVLLygj6ptGyJQC0hDgj8YROxNag>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:17:44 -0400 (EDT)
Subject: [PATCH v2 00/65] clk: Make determine_rate mandatory for muxes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAN0QZWMC/4VNSwrCMBC9SsnakcmkherKe4iLNk5MaEkhU4tScneHXsDV4/13I1wSi7k2uym8JU
 lLVkKnxvg45BdDeio3hEQWbQ9+nqAcho/sJ4GQPixA6C7BdeSoRaPlcRCGUYM+aj2/51nFmGRdyvc4
 26zC/e/uZgEhOA49dra3Ld48l7ycV9bhR631Bw8tb5bCAAAA
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:17 +0100
Message-Id: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel@ffwll.ch>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Andreas Färber <afaerber@suse.de>,
 Jonathan Hunter <jonathanh@nvidia.com>, Abel Vesa <abelvesa@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Orson Zhai <orsonzhai@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Samuel Holland <samuel@sholland.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Sekhar Nori <nsekhar@ti.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Takashi Iwai <tiwai@suse.com>,
 David Airlie <airlied@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Lechner <david@lechnology.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=9861; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=uVPwoAhcCeA1k6hOPHNYL6DLP/vXoIhUhGuZL9xnTuc=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAp8C17tqxB6LudC3tPGVUOQlvWfOBXV2953rNRkK/ick
 XS/sKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwEQsZzH8s8n50zxjwV6W3F3vvl2yDD
 sQZCy4fo212edfB1++/9w+T4vhD7ftS651O3c6scfGctyLy9Bcq372vLdUa/ixvPzgdecZGAE=
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
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 linux-actions@lists.infradead.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>,
 linux-phy@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
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

Let me know what you think,
Maxime

To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Andreas Färber <afaerber@suse.de>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
To: Max Filippov <jcmvbkbc@gmail.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: David Lechner <david@lechnology.com>
To: Sekhar Nori <nsekhar@ti.com>
To: Abel Vesa <abelvesa@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: NXP Linux Team <linux-imx@nxp.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
To: Dinh Nguyen <dinguyen@kernel.org>
To: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>
To: Jonathan Hunter <jonathanh@nvidia.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>
To: Alessandro Zummo <a.zummo@towertech.it>
To: Chen-Yu Tsai <wens@csie.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Paul Cercueil <paul@crapouillou.net>
To: Orson Zhai <orsonzhai@gmail.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
To: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-actions@lists.infradead.org
Cc: patches@opensource.cirrus.com
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-mediatek@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-phy@lists.infradead.org
Cc: linux-rtc@vger.kernel.org
Cc: linux-sunxi@lists.linux.dev
Cc: alsa-devel@alsa-project.org
Cc: linux-mips@vger.kernel.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
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
      clk: Warn if we register a mux without determine_rate

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
 drivers/clk/stm32/clk-stm32-core.c        | 32 ++++++++++-----
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
 46 files changed, 343 insertions(+), 199 deletions(-)
---
base-commit: 61c3426aca2c71052ddcd06c32e29d92304990fd
change-id: 20221018-clk-range-checks-fixes-2039f3523240

Best regards,
-- 
Maxime Ripard <maxime@cerno.tech>
