Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA12642EBB
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 18:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718D810E25F;
	Mon,  5 Dec 2022 17:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 241FB10E25A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 17:29:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 27744B81147;
 Mon,  5 Dec 2022 17:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D01C433D6;
 Mon,  5 Dec 2022 17:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670261360;
 bh=9d2J8LPcLpZa1jj5Cgn2rDMLtkYnsdFIg2tKpX86qeY=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=B0LXS8/gyek+8hlLKsm9IjaIYf/0pFfbI2pNsXBHzqjnPIM8h3ww4pOYnuM14nXKw
 UBWu1MJkJwIaGe3JL+twjWh8I56KLFz2GLThRH0BJPynb7Gk58dSvTeTDvDJJGB3iv
 NoDs7UPlskIPQ1kxd3LCMypuJU5e3wbgPjNbY0HABqughPGJ8cQCWovZkYkccfUG7y
 zMIFHFMg+6etqtkmant212Sds7h6lpBMsTN4wkQjJ0AWOtid5n0v6fyqdfZ5Dyv6Ln
 +HaH8yaYOkpYvVkzdvV3hRmidQ8X/qrD8rbWHqzaES4XRJGdFv8b+ImSVysA7u4Rik
 LzPrPqjBGL7ow==
From: Mark Brown <broonie@kernel.org>
To: Derek Fang <derek.fang@realtek.com>, Sameer Pujar <spujar@nvidia.com>, Heiko Stuebner <heiko@sntech.de>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Bjorn Andersson <andersson@kernel.org>, asahi@lists.linux.dev,
 Daniel Drake <drake@endlessm.com>, Martin Povišer <povik+lin@cutebit.org>, linux-kernel@vger.kernel.org,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Banajit Goswami <bgoswami@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>, Masami Hiramatsu <mhiramat@kernel.org>,
 Andrew Davis <afd@ti.com>, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, - <patches@opensource.cirrus.com>, Matt Flax <flatmax@flatmax.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Mohan Kumar <mkumard@nvidia.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bogdan Togorean <bogdan.togorean@analog.com>, Takashi Iwai <tiwai@suse.com>, Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 David Airlie <airlied@gmail.com>, chrome-platform@lists.linux.dev, linux-sunxi@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-rockchip@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Ban Tao <fengzheng923@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.om>, Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Jee Heng <jee.heng.sia@intel.com>, Rob Herring <robh+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Olivier Moysan <olivier.moysan@foss.st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 James Schulman <james.schulman@cirrus.com>, alsa-devel@alsa-project.org, Paul Cercueil <paul@crapouillou.net>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, linux-tegra@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 Stephan Gerhold <stephan@gerhold.net>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Vincent Knecht <vincent.knecht@mailoo.org>, Jerome Brunet <jbrunet@baylibre.com>, ChiYuan Huang <cy_huang@richtek.com>,
 linux-arm-msm@vger.kernel.org, Nuno Sá <nuno.sa@analog.com>, Chen-Yu Tsai <wens@csie.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Andy Gross <agross@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, Ricard Wanderlof <ricardw@axis.com>,
 Maxime Ripard <mripard@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 David Rhodes <david.rhodes@cirrus.com>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Shi Fu <shifu0704@thundersoft.com>, Jaroslav Kysela <perex@perex.cz>,
 Neil Armstrong <neil.armstrong@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Jose Abreu <joabreu@synopsys.com>, devicetree@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>
In-Reply-To: <20221203160442.69594-1-krzysztof.kozlowski@linaro.org>
References: <20221203160442.69594-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: Extend name-prefix.yaml into
 common DAI properties
Message-Id: <167026134462.536379.12661875208007412738.b4-ty@kernel.org>
Date: Mon, 05 Dec 2022 17:29:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
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

On Sat, 3 Dec 2022 17:04:40 +0100, Krzysztof Kozlowski wrote:
> Rename name-prefix.yaml into common DAI schema and document
> '#sound-dai-cells' for completeness.  The '#sound-dai-cells' cannot be
> really constrained, as there are users with value of 0, 1 and 2, but at
> least it brings definition to one common place.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: Extend name-prefix.yaml into common DAI properties
      commit: 3fda85324b8d7aa01ccfa1bb82c46befc6af518f
[2/3] ASoC: dt-bindings: Reference common DAI properties
      commit: 58ae9a2aca6f883dd6fd7b8bfc2e1b1b21a2f03e
[3/3] ASoC: dt-bindings: maxim,max98357a: Convert to DT schema
      commit: 8a5a05583a04fcfa094072147eb8f6c9bb2af852

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
