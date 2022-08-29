Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D2E5A54FA
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 21:56:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112F510E5BB;
	Mon, 29 Aug 2022 19:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE7010E5CF;
 Mon, 29 Aug 2022 19:56:17 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-11dca1c9c01so11814199fac.2; 
 Mon, 29 Aug 2022 12:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=AunIincOW/llkkB3oHp4ZHdcx4kpGxMU+RJ3A3IG/tY=;
 b=HSu4dLwb350WGRFRnWbIusqWmoXIUOmJbHd4lamyBfCXo1UqoP54eMkDGt2dLvnoS4
 YgVCz3j4yAC/hXFMA5wVYcz2OsiN190CPNVZQvZ8d6KYpCll8+yg/ytkSeKQUpgzjskZ
 ncMt1oE0uN5QePQ2a0HAsDY5r1CWBepFfUWhUuKGy9AxFzE6SghVX7iRtj9qBvxOd83T
 pFoKMoFdUY29hqrpnXs5kE3xQi0G3WDI72ei2W3f5/XVqXLNOxi/oCjgxAFGIaCqF8ga
 IIlgWPElWtz5Aw7iYZmOn3YVX1gEZKtoG82pyv2/Py9xmh+me1YjnjpHJqeu14GHEsST
 3DIg==
X-Gm-Message-State: ACgBeo0W9Ej2U544S9TOPeZXH44mwpRG71RY9rb9I9iO42e4dQKjx5Lu
 aceI33xjyruHs1ofIrO0sw==
X-Google-Smtp-Source: AA6agR4J4SxUZcpWUufmTiU9b6O//wx6vi31SnOVg0aW3VqYwToyBsF+9clL+Z+qnxJfLRs+zeT25A==
X-Received: by 2002:a05:6870:c386:b0:102:fcb:86cd with SMTP id
 g6-20020a056870c38600b001020fcb86cdmr8685701oao.296.1661802976466; 
 Mon, 29 Aug 2022 12:56:16 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 s1-20020a4ac101000000b0044565e7ab41sm5473469oop.32.2022.08.29.12.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 12:56:15 -0700 (PDT)
Received: (nullmailer pid 2312686 invoked by uid 1000);
 Mon, 29 Aug 2022 19:56:13 -0000
Date: Mon, 29 Aug 2022 14:56:13 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 4/5] dt-bindings: crypto: drop minItems equal to maxItems
Message-ID: <20220829195613.GA2312632-robh@kernel.org>
References: <20220825113334.196908-1-krzysztof.kozlowski@linaro.org>
 <20220825113334.196908-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220825113334.196908-4-krzysztof.kozlowski@linaro.org>
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
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 David Airlie <airlied@linux.ie>, Tomasz Figa <tomasz.figa@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-ide@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-clk@vger.kernel.org,
 Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, devicetree@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, linux-renesas-soc@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 linux-crypto@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 25 Aug 2022 14:33:33 +0300, Krzysztof Kozlowski wrote:
> minItems, if missing, are implicitly equal to maxItems, so drop
> redundant piece to reduce size of code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/crypto/samsung-slimsss.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Applied, thanks!
