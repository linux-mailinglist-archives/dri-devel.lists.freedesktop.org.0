Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 109EF5A5540
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 22:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BD610E568;
	Mon, 29 Aug 2022 20:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FBE510EAE3;
 Mon, 29 Aug 2022 20:01:50 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-11e7e0a63e2so10978526fac.4; 
 Mon, 29 Aug 2022 13:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=ogC4r+k0mr20QhnHahw3ccg4AiV6JfA8GAM67/NqzeE=;
 b=SDI26SyEMgtGzJoJxOP0tHruhpOeULvKVPfySYZpTuk3hLwHKlma/uDTuNLUHXKotK
 lAs7mSemTXRpZbpbE5n42jz459RYNJ70E4fWZ3dh81v7C0o9l3RnxTeN+I00PpntHh71
 lDO80LWUsd9/ieLdD/jyi5JXFnw1fre4IG0TqP/iLCVZieVZSsylW22oByYknW/5a+dR
 8rpaMjguFOXpMioFMXNEpr/Wzthf/NL1dxeFkFqzNEHGr5AQ/AWv01SzQwlKyUOjXrEV
 4YSYFVqblK1sxMd9g0wPCFkiYx0Sm7gtT/4dABtx5a8R9HK4y5Vj70NgOi/LjYL0G7+l
 91ug==
X-Gm-Message-State: ACgBeo1KrGIPPv7+khIt/Vz0huniEKkiukp8w3gjVvhwQjKXcNQau0Wb
 sepNXaxsrsZw7vULwE/JlA==
X-Google-Smtp-Source: AA6agR7DOp+A6RsB1UmGlV9+oiTISpjy2cXXh0pVgvB2TxU3TV9Wi95VNYVNWNoPW19nH+WEFqwQsw==
X-Received: by 2002:a05:6870:ac09:b0:11d:ca1b:d752 with SMTP id
 kw9-20020a056870ac0900b0011dca1bd752mr8164695oab.93.1661803309253; 
 Mon, 29 Aug 2022 13:01:49 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm6316858oti.45.2022.08.29.13.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 13:01:48 -0700 (PDT)
Received: (nullmailer pid 2322815 invoked by uid 1000);
 Mon, 29 Aug 2022 20:01:47 -0000
Date: Mon, 29 Aug 2022 15:01:47 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 3/5] dt-bindings: clock: drop minItems equal to maxItems
Message-ID: <20220829200147.GA2322759-robh@kernel.org>
References: <20220825113334.196908-1-krzysztof.kozlowski@linaro.org>
 <20220825113334.196908-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220825113334.196908-3-krzysztof.kozlowski@linaro.org>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 David Airlie <airlied@linux.ie>, Tomasz Figa <tomasz.figa@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-clk@vger.kernel.org,
 Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 linux-arm-msm@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Andre Przywara <andre.przywara@arm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-ide@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, linux-renesas-soc@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 25 Aug 2022 14:33:32 +0300, Krzysztof Kozlowski wrote:
> minItems, if missing, are implicitly equal to maxItems, so drop
> redundant piece to reduce size of code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml   | 1 -
>  .../devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml  | 2 --
>  Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml    | 1 -
>  3 files changed, 4 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
