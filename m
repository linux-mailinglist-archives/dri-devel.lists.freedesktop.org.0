Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 129FC5A54E5
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 21:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F8210E59D;
	Mon, 29 Aug 2022 19:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5EB110E59D;
 Mon, 29 Aug 2022 19:55:47 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-11f0fa892aeso3508942fac.7; 
 Mon, 29 Aug 2022 12:55:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=022FZqEM+NZk/+qjcdGcVImONgP3k7o4bYGRw++11q0=;
 b=UIhf5zkkhgdPuj2Va8P2ENry5rhbJSeVAE0myyDyDwiQmY0e12AniQGTVWORo/to9B
 TGu1p155sr1kDEiRLjmZbpQS3+7VLlUaOO0lxgjHs+9H05pPYJwaAxYb2WnN1HdSmmIe
 NXgGxD+7XVgG0yARxDipDyEx5pzbtr8qE3jyzuT8iGV2UWNQPaX2WWdLB2KIuoyAh8hH
 jzJNJ2P57MN8nUTfZ2IZLRRvMiU3RCu5jDPGTryFlJSMyl/Q8raT33np0G8tIWht6a9a
 YDf3wHphLYPXOJz9kdUkvZKthuTmQhUXMGSZ64fQVPW4jiOvdhXdjsskRVYZZZdMrC1V
 Ah3A==
X-Gm-Message-State: ACgBeo1raZUhzrOiNKq29SRAMLMoD/3pIOjpFTdt2N1Q0uqgaihqHzw2
 GUnb+AlNfE5mM7u/YJGriw==
X-Google-Smtp-Source: AA6agR4HrxNsAlmaBU/KnvvfB3vzL2uHFpEExor1t4Jl8og9mSVI0Y1aS92n6CWLoQsobrsXrw2Zdw==
X-Received: by 2002:a05:6870:c68a:b0:11d:124c:5d37 with SMTP id
 cv10-20020a056870c68a00b0011d124c5d37mr8209083oab.64.1661802946957; 
 Mon, 29 Aug 2022 12:55:46 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 t7-20020a05683014c700b00616e2d2204csm6236948otq.21.2022.08.29.12.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 12:55:46 -0700 (PDT)
Received: (nullmailer pid 2311548 invoked by uid 1000);
 Mon, 29 Aug 2022 19:55:43 -0000
Date: Mon, 29 Aug 2022 14:55:43 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/5] dt-bindings: socionext,uniphier-system-cache: drop
 minItems equal to maxItems
Message-ID: <20220829195543.GA2311490-robh@kernel.org>
References: <20220825113334.196908-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220825113334.196908-1-krzysztof.kozlowski@linaro.org>
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
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-ide@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-clk@vger.kernel.org,
 Marek Vasut <marex@denx.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 linux-arm-msm@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, Andre Przywara <andre.przywara@arm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, Sean Paul <sean@poorly.run>,
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

On Thu, 25 Aug 2022 14:33:30 +0300, Krzysztof Kozlowski wrote:
> minItems, if missing, are implicitly equal to maxItems, so drop
> redundant piece to reduce size of code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/arm/socionext/socionext,uniphier-system-cache.yaml  | 1 -
>  1 file changed, 1 deletion(-)
> 

Applied, thanks!
