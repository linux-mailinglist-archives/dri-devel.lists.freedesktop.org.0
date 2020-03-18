Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B8A18A791
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 23:06:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9CF789A5E;
	Wed, 18 Mar 2020 22:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6ECB897E3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 22:06:11 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id y24so163136ioa.8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 15:06:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4Xze8cFopLDbFOqjih69kfqww1TXWirDlONQxIRQG5o=;
 b=mIukPVfMQzO0BBR6KbUVKdevjxiivc4bALbhiLhOBD0XlKAFrSRrbIWrx3bY8FW7gm
 JKdMUt3WFuHKrLqyOfREua5OMqLCcIpXBl8hYq9DzE0h91cy7J4a0MShmqPC/zDa7DbV
 /i0zHC9Aa4/XS/n3CMcvFQVlSThl0GcHDIzSs7C89bv/mdsOufYZQqwgy69dU2EXZ0Ur
 CE5JMe+pRDItZiW26zZmsE1d9wSPOxA4KVnFHUUVYUQDgn2fkw/kwS8I7vvr7pJx5ruB
 Q/dTb1Nx92XpK7OQ0C9Xw8IuGfJYNP6DMUPZnBuAKgR3JTgy1flesq3CLWhv0m2Hx6FG
 yW4g==
X-Gm-Message-State: ANhLgQ1uG+OZmwWCCZ2D0Lju0lR8y8PNZKDAziQDkkYN3rW32Q+jFRZ8
 luCc1tFiDqBiWCwcJsI37QsBWsE=
X-Google-Smtp-Source: ADFU+vtzA6Dpinbv6sJfxyaBb8R5TiTF03H79zFRAVOl5zpT6M6xKMFpKk0gVF2+B7B9QBZD7gxILw==
X-Received: by 2002:a5d:84d0:: with SMTP id z16mr5584547ior.88.1584569171213; 
 Wed, 18 Mar 2020 15:06:11 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id n23sm63773ild.34.2020.03.18.15.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 15:06:10 -0700 (PDT)
Received: (nullmailer pid 18697 invoked by uid 1000);
 Wed, 18 Mar 2020 22:06:07 -0000
Date: Wed, 18 Mar 2020 16:06:07 -0600
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 07/36] dt-bindings: display: convert ilitek,ili9881c
 to DT Schema
Message-ID: <20200318220607.GA17902@bogus>
References: <20200315134416.16527-1-sam@ravnborg.org>
 <20200315134416.16527-8-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200315134416.16527-8-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Nikolaus Schaller <hns@goldelico.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Sandeep Panda <spanda@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Zhong <zyw@rock-chips.com>, Marco Franchi <marco.franchi@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>, Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, Tony Lindgren <tony@atomide.com>,
 Nickey Yang <nickey.yang@rock-chips.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Vinay Simha BN <simhavcs@gmail.com>, Marek Belisko <marek@goldelico.com>,
 Heiko Schocher <hs@denx.de>, Brian Masney <masneyb@onstation.org>,
 devicetree@vger.kernel.org, Guido Gunther <agx@sigxcpu.org>,
 Mark Brown <broonie@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Purism Kernel Team <kernel@puri.sm>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Lin Huang <hl@rock-chips.com>, Douglas Anderson <dianders@chromium.org>,
 linux-spi@vger.kernel.org, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 15 Mar 2020 14:43:47 +0100, Sam Ravnborg wrote:
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/ilitek,ili9881c.txt         | 20 --------
>  .../display/panel/ilitek,ili9881c.yaml        | 50 +++++++++++++++++++
>  2 files changed, 50 insertions(+), 20 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.example.dt.yaml: panel@0: 'power-gpios' does not match any of the regexes: 'pinctrl-[0-9]+'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.example.dt.yaml: panel@0: 'power-supply' is a required property

See https://patchwork.ozlabs.org/patch/1255018
Please check and re-submit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
