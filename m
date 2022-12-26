Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E42655F93
	for <lists+dri-devel@lfdr.de>; Mon, 26 Dec 2022 04:41:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB2010E14F;
	Mon, 26 Dec 2022 03:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C7C10E14F
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Dec 2022 03:41:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BD5FDB80BE7;
 Mon, 26 Dec 2022 03:41:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 725BFC433D2;
 Mon, 26 Dec 2022 03:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672026091;
 bh=zmtqhXQv7hiPZDJGmROKlujPmTGm2oRNxnDcUz2K1XA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=aFP63n6aR/0rsvyekq2AImCT+Ltsl9Jl7dPzbNYHhoyZYHDH6lK2bZrhlcgunmhld
 RgMVPID00zacoRWh6/2WcYeqqfuXii7bfwtJk5lxNcH9sYhs6uYZ65sHxjCjvHVJGC
 jU2sooTMKGRe+SFmEQSyRrM2Z5Ebr4Jv8ipoN7FtPVN5x7rUbCF4ahlzEUcQHuzwgS
 dPZnfjIrxijvQKXa4OnPsL5xX8faKU1LhwAeeoNrFyIvTCF3+ednhZDVur/h1/X3jD
 E41cCnOUXtPEk1kFVfqyh2f9D9ufm9IlqPIid1pjLmSc0vc0NcK4CEzAwGC3ktCoTG
 JD3TuvTuDV3ew==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 4CBF2E50D66; Mon, 26 Dec 2022 03:41:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: Extend name-prefix.yaml into common
 DAI properties
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <167202609130.9518.10337988666912704066.git-patchwork-notify@kernel.org>
Date: Mon, 26 Dec 2022 03:41:31 +0000
References: <20221203160442.69594-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221203160442.69594-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, perex@perex.cz, s.nawrocki@samsung.com,
 jonathanh@nvidia.com, peter.ujfalusi@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, cychiang@chromium.org,
 samuel@sholland.org, katsuhiro@katsuster.net, khilman@baylibre.com,
 joabreu@synopsys.com, derek.fang@realtek.com, olivier.moysan@foss.st.com,
 povik+lin@cutebit.org, linux-sunxi@lists.linux.dev, flatmax@flatmax.com,
 james.schulman@cirrus.com, vincent.knecht@mailoo.org,
 linux-kernel@vger.kernel.org, mhiramat@kernel.org, alsa-devel@alsa-project.org,
 tanureal@opensource.cirrus.com, david.rhodes@cirrus.com, cy_huang@richtek.com,
 thierry.reding@gmail.com, srinivas.kandagatla@linaro.org, groeck@chromium.org,
 chrome-platform@lists.linux.dev, fengzheng923@gmail.com,
 alexandre.belloni@bootlin.om, drake@endlessm.com,
 linux-rockchip@lists.infradead.org, jbrunet@baylibre.com,
 ckeepax@opensource.cirrus.com, martin.blumenstingl@googlemail.com,
 linux-arm-msm@vger.kernel.org, biju.das.jz@bp.renesas.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 neil.armstrong@linaro.org, mcoquelin.stm32@gmail.com,
 rriveram@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com,
 spujar@nvidia.com, nuno.sa@analog.com, hayashi.kunihiko@socionext.com,
 jernej.skrabec@gmail.com, wens@csie.org, bogdan.togorean@analog.com,
 arnaud.pouliquen@foss.st.com, stephan@gerhold.net, rf@opensource.cirrus.com,
 broonie@kernel.org, mkumard@nvidia.com, j-choudhary@ti.com,
 lgirdwood@gmail.com, konrad.dybcio@linaro.org, asahi@lists.linux.dev,
 rohitkr@codeaurora.org, shengjiu.wang@nxp.com, codrin.ciubotariu@microchip.com,
 alexandre.torgue@foss.st.com, paul@crapouillou.net, ricardw@axis.com,
 shifu0704@thundersoft.com, krzysztof.kozlowski+dt@linaro.org,
 frattaroli.nicolas@gmail.com, agross@kernel.org, devicetree@vger.kernel.org,
 bgoswami@quicinc.com, shenghao-ding@ti.com, lkundrak@v3.sk, robh+dt@kernel.org,
 tzungbi@kernel.org, linux-tegra@vger.kernel.org, patches@opensource.cirrus.com,
 andersson@kernel.org, tiwai@suse.com, jee.heng.sia@intel.com, afd@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello:

This series was applied to chrome-platform/linux.git (for-next)
by Mark Brown <broonie@kernel.org>:

On Sat,  3 Dec 2022 17:04:40 +0100 you wrote:
> Rename name-prefix.yaml into common DAI schema and document
> '#sound-dai-cells' for completeness.  The '#sound-dai-cells' cannot be
> really constrained, as there are users with value of 0, 1 and 2, but at
> least it brings definition to one common place.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> [...]

Here is the summary with links:
  - [1/3] ASoC: dt-bindings: Extend name-prefix.yaml into common DAI properties
    https://git.kernel.org/chrome-platform/c/3fda85324b8d
  - [2/3] ASoC: dt-bindings: Reference common DAI properties
    https://git.kernel.org/chrome-platform/c/58ae9a2aca6f
  - [3/3] ASoC: dt-bindings: maxim,max98357a: Convert to DT schema
    https://git.kernel.org/chrome-platform/c/8a5a05583a04

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


