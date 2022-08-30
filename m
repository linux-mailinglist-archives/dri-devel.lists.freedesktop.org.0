Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 572905A7060
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 00:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95CD10E1ED;
	Tue, 30 Aug 2022 22:08:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3927910E1ED;
 Tue, 30 Aug 2022 22:07:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3A399B81DF5;
 Tue, 30 Aug 2022 22:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D815FC433B5;
 Tue, 30 Aug 2022 22:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661897276;
 bh=L+0C7TtIOD/Ef/B4ShCL80VUG/4ow+VLTmcSoy58e0k=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=TVIS9TKtjJ9v8EdZhy5Q+N1KnYNao6GXnWRgDYhzBwzkO4ViD2u/da9POwLXSWPUI
 UCIkDApwWkz3Mp3AdBWenXAeL/bU9bP2y9YifaGsHoE03CXCP025g2/6FCzEpjXuwL
 SzQped21zTr9R06pceC4sq36Mn5qLx4mLj+UJTqpO4xDfvq9suZ7fUpee6wvDa93la
 W3cO0m5sFx394Ha0zShNd/6bm/0aa6cwZZ+5D456wGVspZsfEqboPvWsly9SSq527g
 RLMlgMzp68rp/tBiiJcoS9fhzz377kUFMfr1/l1Qn93jDGFqLr+DfWutNu2Fmxqmpd
 0hAawc+EdHdcQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220825113334.196908-3-krzysztof.kozlowski@linaro.org>
References: <20220825113334.196908-1-krzysztof.kozlowski@linaro.org>
 <20220825113334.196908-3-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 3/5] dt-bindings: clock: drop minItems equal to maxItems
From: Stephen Boyd <sboyd@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Andre Przywara <andre.przywara@arm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 David S. Miller <davem@davemloft.net>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Herbert Xu <herbert@gondor.apana.org.au>, Inki Dae <inki.dae@samsung.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Laur
 ent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Marek Vasut <marex@denx.de>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Sean Paul <sean@poorly.run>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Tomasz Figa <tomasz.figa@gmail.com>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
 , linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Date: Tue, 30 Aug 2022 15:07:54 -0700
User-Agent: alot/0.10
Message-Id: <20220830220755.D815FC433B5@smtp.kernel.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Krzysztof Kozlowski (2022-08-25 04:33:32)
> minItems, if missing, are implicitly equal to maxItems, so drop
> redundant piece to reduce size of code.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to clk-next
