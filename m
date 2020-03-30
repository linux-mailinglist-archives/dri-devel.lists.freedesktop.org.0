Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3341974E6
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB9C89EA9;
	Mon, 30 Mar 2020 07:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com
 [210.131.2.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4668C89EA9
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 07:10:14 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id 02U79x1g007463
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 16:09:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 02U79x1g007463
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1585552200;
 bh=ln1CQt+YaUVnJf/8SbMK3iPTVvG1KE5EE/FUul8MWQc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=1sthGaoHw8qoSp3F/D3eH8NqZjk++zLNoSrFExAge5M5k4o6izC7znUZmDsjrR95d
 3LRi45OyZDxUKTfu4A/3P4aV5+yY39DtCxwP5T2nox/GAPp7PJ3ZaF7u226D4E6kMs
 pxp3tchjSZY1dsGYXfpp7Fyf63ssOrWN+V8tr3iI8kkkZhdSc6hQrcCJehpowCH1tV
 t5Ybjs0wWAwMh0SzhZruoB9o66WBYJD1t+qP7ZqRNrr7efxFSXjCoLMubpsREjCj3w
 uh2OG10xugvGzdVuKY1o+FeM5bjbz3bVeCv27FcaCEJ6WsaSLhERu5H58t5BiMZ2Xi
 G3vbpTZyiHDew==
X-Nifty-SrcIP: [209.85.217.46]
Received: by mail-vs1-f46.google.com with SMTP id e138so10289142vsc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 00:09:59 -0700 (PDT)
X-Gm-Message-State: AGi0PuaZGeci8Lspm1rBbv3+SvUc3itAIf8l0RXwYsWQRX/WPWMe+g/j
 yZbTu2yF/1V1STZq7kcKQjGu7aHzJaZVy5+weUc=
X-Google-Smtp-Source: APiQypLmGnB9GmkGFIr7L8MQtdRTKDMNPR3ere0jKX6O5/r2adqpWFQ5TPcwWpLgYxRGXDf4dZ6YCv27RE8dCFz54+s=
X-Received: by 2002:a67:2d55:: with SMTP id t82mr7452280vst.215.1585552198446; 
 Mon, 30 Mar 2020 00:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200325220542.19189-1-robh@kernel.org>
 <20200325220542.19189-5-robh@kernel.org>
In-Reply-To: <20200325220542.19189-5-robh@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 30 Mar 2020 16:09:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNARJn4uugHxcjK+WOWBs0gPVZQsCu4y6M8hkNK1U5FehRA@mail.gmail.com>
Message-ID: <CAK7LNARJn4uugHxcjK+WOWBs0gPVZQsCu4y6M8hkNK1U5FehRA@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: Add missing 'additionalProperties: false'
To: Rob Herring <robh@kernel.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Lee Jones <lee.jones@linaro.org>,
 linux-clk <linux-clk@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Zhang Rui <rui.zhang@intel.com>, Brian Masney <masneyb@onstation.org>,
 DTML <devicetree@vger.kernel.org>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Linux PM mailing list <linux-pm@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Stephen Boyd <sboyd@kernel.org>, Networking <netdev@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 26, 2020 at 7:06 AM Rob Herring <robh@kernel.org> wrote:
>
> Setting 'additionalProperties: false' is frequently omitted, but is
> important in order to check that there aren't extra undocumented
> properties in a binding.
>
> Ideally, we'd just add this automatically and make this the default, but
> there's some cases where it doesn't work. For example, if a common
> schema is referenced, then properties in the common schema aren't part
> of what's considered for 'additionalProperties'. Also, sometimes there
> are bus specific properties such as 'spi-max-frequency' that go into
> bus child nodes, but aren't defined in the child node's schema.
>
> So let's stick with the json-schema defined default and add
> 'additionalProperties: false' where needed. This will be a continual
> review comment and game of wack-a-mole.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---


>  .../devicetree/bindings/gpio/socionext,uniphier-gpio.yaml      | 2 ++


You may have already queue this up, but just in case.

Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>

-- 
Best Regards
Masahiro Yamada
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
