Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8D25A54FD
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 21:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A393E10E5CF;
	Mon, 29 Aug 2022 19:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC24C10E5CF;
 Mon, 29 Aug 2022 19:56:50 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-11dca1c9c01so11817732fac.2; 
 Mon, 29 Aug 2022 12:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=/MOKxcoJc5kuHgE2PkdiTmIj2qZGQvjtgGW9C5gG2kA=;
 b=SWYIA2f0jxRkjaFgjPBPw0ezHEi885reUTgqKxAODJ4z8DMquTBc1YeevTYlvon3UE
 k7tu4WicFmD9kOpO1UmYKDcTvVZAP1msddD282xj9TbeBk+0Et2nLPRFl4My/AmwOB/P
 nyUK4sH9NbOHRVguQkWVFqjCEpyyeh4LSwzDwnMk6kMgH9ZrC3o10QpWCGfxhGHcNngt
 YjziyWQ6jbp3h+lKo9GE/JZSyxKUROemCfZpvQE+NmoyCCCkEk2QvVFlABttY+Qd13xO
 Tk306FVvtUzRtn/ro84kIg2wwmV0KqeMjjjfNbjC4juyIHBp33pCPxe0aeoRk8lUKA+1
 IJWQ==
X-Gm-Message-State: ACgBeo0F3vsVmtWBpn3/jWI02DztC2/i01AMg3Zo/c4M9wx6BMwMkMVK
 35SxhcbibTg11uJKaXMarw==
X-Google-Smtp-Source: AA6agR4LCIMUE0t2pFGD5lbI+Ix6tCYdL75rhybEI6Ep3uRgE81TTWzgA53lYeHyjkHiC/kweLtZ1w==
X-Received: by 2002:a05:6870:c884:b0:118:ae35:e200 with SMTP id
 er4-20020a056870c88400b00118ae35e200mr8851020oab.244.1661803009819; 
 Mon, 29 Aug 2022 12:56:49 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 eo33-20020a056870eca100b0011cd9d8a4b7sm6671148oab.19.2022.08.29.12.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 12:56:49 -0700 (PDT)
Received: (nullmailer pid 2313735 invoked by uid 1000);
 Mon, 29 Aug 2022 19:56:47 -0000
Date: Mon, 29 Aug 2022 14:56:47 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 5/5] dt-bindings: display: drop minItems equal to maxItems
Message-ID: <20220829195647.GA2313625-robh@kernel.org>
References: <20220825113334.196908-1-krzysztof.kozlowski@linaro.org>
 <20220825113334.196908-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220825113334.196908-5-krzysztof.kozlowski@linaro.org>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-ide@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-clk@vger.kernel.org,
 Marek Vasut <marex@denx.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-samsung-soc@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 linux-arm-msm@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, Andre Przywara <andre.przywara@arm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-tegra@vger.kernel.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 25 Aug 2022 14:33:34 +0300, Krzysztof Kozlowski wrote:
> minItems, if missing, are implicitly equal to maxItems, so drop
> redundant piece to reduce size of code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml   | 1 -
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 --
>  Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml | 2 --
>  .../bindings/display/samsung/samsung,exynos5433-decon.yaml      | 2 --
>  .../bindings/display/samsung/samsung,exynos5433-mic.yaml        | 1 -
>  .../bindings/display/samsung/samsung,exynos7-decon.yaml         | 1 -
>  .../devicetree/bindings/display/samsung/samsung,fimd.yaml       | 1 -
>  .../devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.yaml  | 1 -
>  .../devicetree/bindings/display/tegra/nvidia,tegra20-mpe.yaml   | 2 --
>  9 files changed, 13 deletions(-)
> 

Applied, thanks!
