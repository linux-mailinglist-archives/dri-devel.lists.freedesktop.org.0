Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 681B496A321
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 17:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67A410E5D8;
	Tue,  3 Sep 2024 15:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rxw9fGt3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C511010E5DA
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 15:46:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AD1F05C5A0A;
 Tue,  3 Sep 2024 15:46:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C305BC4CEC4;
 Tue,  3 Sep 2024 15:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725378363;
 bh=yN+RhFZSIEOJ9C+PU+5cpb5357Ghgx/Jlz8Obkfok6M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rxw9fGt3jMtxXk6k9kuJiVLBaeGsFeXLKOrZjbhm7j3BYzRM5XGHo7jreaH6UrU9N
 3Pj7izz177HKQHjdcn1qq4deS5UH/t4qhu8Nwh6aIiAbRCm7PN5vIxyYYwxA3c3OlQ
 wep2uijizDG+6KDzZSeS/0uef/sdcUr0wvS/H0682Ml4RyAXl6T9RFMu8BT/DxQLuE
 Q8bdpwEz4boehe8ljww1cfBsB2ut5rjAbuclyNZI/8WNo4QUbTahjEvDFYWvAvS7Rg
 1LeX0SVp6fEBVOG25ecFZyKrFWxJptzjHXIEfXP4hxmeeWkXBlPKQ+ZTLvDXAx1s6H
 k/QKY8w7cwrAQ==
Date: Tue, 3 Sep 2024 17:46:00 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Chris Morgan <macromorgan@hotmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Tim Lunn <tim@feathertop.org>,
 Andy Yan <andyshrk@163.com>, 
 Muhammed Efe Cetin <efectn@protonmail.com>, Jagan Teki <jagan@edgeble.ai>,
 Dragan Simic <dsimic@manjaro.org>, 
 Ondrej Jirman <megi@xff.cz>, Michael Riesch <michael.riesch@wolfvision.net>, 
 Jimmy Hon <honyuenkwun@gmail.com>, Elon Zhang <zhangzj@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, Elaine Zhang <zhangqing@rock-chips.com>, 
 Yifeng Zhao <yifeng.zhao@rock-chips.com>,
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Liang Chen <cl@rock-chips.com>, Jamie Iles <jamie@jamieiles.com>,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org, kernel@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 3/9] dt-bindings: i2c: i2c-rk3x: Add rk3576 compatible
Message-ID: <bnpwnuhikwkqyf3jos67qwywhfge3vm6tfmlfitypd5k62jzdn@fri4swkl2zbq>
References: <20240903152308.13565-1-detlev.casanova@collabora.com>
 <20240903152308.13565-4-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903152308.13565-4-detlev.casanova@collabora.com>
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

Hi,

On Tue, Sep 03, 2024 at 11:22:33AM GMT, Detlev Casanova wrote:
> Just like RK356x and RK3588, RK3576 is compatible to the existing
> rk3399 binding.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Heiko Stuebner <heiko@sntech.de>

I will apply this after 1 and 2 have been merged.

BTW, who is maintaining rockchip.yaml?

Thanks,
Andi

> ---
>  Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
> index 82b9d6682297..a9dae5b52f28 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
> @@ -38,6 +38,7 @@ properties:
>                - rockchip,rk3308-i2c
>                - rockchip,rk3328-i2c
>                - rockchip,rk3568-i2c
> +              - rockchip,rk3576-i2c
>                - rockchip,rk3588-i2c
>                - rockchip,rv1126-i2c
>            - const: rockchip,rk3399-i2c
> -- 
> 2.46.0
> 
