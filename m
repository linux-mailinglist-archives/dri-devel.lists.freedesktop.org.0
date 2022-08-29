Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 992D75A54ED
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 21:56:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0639010E5D4;
	Mon, 29 Aug 2022 19:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6F810E5CF;
 Mon, 29 Aug 2022 19:56:05 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-11c4d7d4683so11767251fac.8; 
 Mon, 29 Aug 2022 12:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=B6L6A2/pK+teiP71Bwj1SsdHvDI4k1BUKvthZehztGQ=;
 b=C0WcbxYsPWMrFeoUP2iG/VUlXkBTkqKB+WsVWouhBJCqcjSemviKr/mwdlcs4UdE13
 6ziVUNIsJ27YZJvRGIhYEpd0fa3h8e8krbPGc/oCu6wmGvD4yhiIZoTcDwP6TqQ2FvGI
 4zvLi/Sf3gF5NunILYvlTkBWO7LrgJZCb0QPrE2n39K3rJbYUocq7SQPlxHZIWAlM1b3
 HEj79e9GIEXnNlhLvZLoVnSNg+z3PyEJZ+GYqYiAOoYaDUa7eOrQ4uZEqgxffHljm8q+
 dFWUbvj/Ko8by0lA8xTe5C0DnuX5L05eIUePlITmfc/zwtWFxl9Nz5b3p66wj8mzxAnL
 9haA==
X-Gm-Message-State: ACgBeo3QFNhA2r5U+3reICbBdRdral5EMJNE3PSh9030isMNx7niYtI3
 XJbLeDgAekYOgM5BsKgWOw==
X-Google-Smtp-Source: AA6agR4fXlibwEVQQMGUT+dnMLOu+YjkGVEXao/w1QADh4csqcyyouO8sQd4eDsDOErVz7tCaEb3HA==
X-Received: by 2002:a05:6870:f608:b0:11c:26a8:467f with SMTP id
 ek8-20020a056870f60800b0011c26a8467fmr8414068oab.258.1661802964344; 
 Mon, 29 Aug 2022 12:56:04 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 t28-20020a056870f21c00b000f5e89a9c60sm6557080oao.3.2022.08.29.12.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 12:56:04 -0700 (PDT)
Received: (nullmailer pid 2312221 invoked by uid 1000);
 Mon, 29 Aug 2022 19:56:01 -0000
Date: Mon, 29 Aug 2022 14:56:01 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/5] dt-bindings: ata: drop minItems equal to maxItems
Message-ID: <20220829195601.GA2312165-robh@kernel.org>
References: <20220825113334.196908-1-krzysztof.kozlowski@linaro.org>
 <20220825113334.196908-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220825113334.196908-2-krzysztof.kozlowski@linaro.org>
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
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 David Airlie <airlied@linux.ie>, Tomasz Figa <tomasz.figa@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org, Marek Vasut <marex@denx.de>,
 linux-samsung-soc@vger.kernel.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-ide@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, linux-renesas-soc@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 25 Aug 2022 14:33:31 +0300, Krzysztof Kozlowski wrote:
> minItems, if missing, are implicitly equal to maxItems, so drop
> redundant piece to reduce size of code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml       | 1 -
>  .../devicetree/bindings/ata/cortina,gemini-sata-bridge.yaml     | 2 --
>  Documentation/devicetree/bindings/ata/sata_highbank.yaml        | 1 -
>  3 files changed, 4 deletions(-)
> 

Applied, thanks!
