Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4251AE6BB
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 22:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197356EA56;
	Fri, 17 Apr 2020 20:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A939D6EA54
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 20:23:38 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id 198so2844982lfo.7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 13:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t7jDGAFTNBi+XjMSBhubcEwzn24cikxPJ+UJooGzTKo=;
 b=I6kWS6gjv4eTLRFLt+Q5HaMTN8cpgPrWfzLGfiKcjv10a/3iUwhTUGv/iC1g2+rIzn
 YIAxVvIpZWnW67zzjUz8V5s+vS/hrm4vQVPqTKUrHJ6dPrNT0V4B1W2DDd/niy/mcoV/
 ltnMemnRjiHuQlPvnGUzCZTO2FOTP/NQlbh94TcI0trkPJ6TUBSqLU9Rp5e5snxBEHiu
 /n5C9bZ2+3A/PlXU4ZAqSk6PFPJ8QrfUmxwbvhCCPIOq/Iz+jkOrB2GDUrG7q7JHD0Ym
 H2LSUBUM10gR+bvlNApQk9suHIEfKP3WuitwqA67D5eyfSAO51TDVgcoEvhW9358qpa3
 B03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t7jDGAFTNBi+XjMSBhubcEwzn24cikxPJ+UJooGzTKo=;
 b=TAzia/Kcmq2WP6ZSvo58RknG47cdKTTPtw9SxhT2Xol5+Cj26yoZf3oCVep4p8SPz1
 ocB75EWIMUM+vnsCTOtsWAaFw1R0JqkbG1ZHKLV0YSMXHljisUQn06AH0UCIDVK8Pcwe
 NAY3d/aNKlOqet+EPQa7GlGhnzCLBX6yr7yRU0bjsvXeh8VhjbQMNyTmqvwa9dGTPrnu
 jG/x1vrnUeuIpZyRYxdyOSw2jGOrYcKYxpHu/pAqWSYCftgAHzFkmIfWBnG556Qg3lBQ
 JQ1EddtDeOH4QzDpseX0eXoiva5wR/fU9onxcWx8a+tUIw6pw3tAEiDs6v4qgOAYQ/Fu
 xYOg==
X-Gm-Message-State: AGi0PuZBxPUA7MHjwo7CYOYxJyL7wqzbqx/pPVhju+Xq9Vv6r3u1r3iG
 x8f4Q5tuAB/TTCfLaAFwpwv4RjtGdWJxocVLqA2RTA==
X-Google-Smtp-Source: APiQypIOpsBb9Nvks6MpXKBJzURwDYZ9iwlmGzKQ+jEn7+oaciaM+RlGdAfEFl6NaN3A9RPaqL6UVJp80f/QOhijaBw=
X-Received: by 2002:a05:6512:685:: with SMTP id
 t5mr3081701lfe.47.1587155016742; 
 Fri, 17 Apr 2020 13:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200409013947.12667-1-robh@kernel.org>
 <20200409013947.12667-3-robh@kernel.org>
In-Reply-To: <20200409013947.12667-3-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 17 Apr 2020 22:23:25 +0200
Message-ID: <CACRpkdZ8U_EbmdpT-BnXWtz_MksCnf+0W3bKD3CMxq=R2d5oXA@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm: pl111: Simplify vexpress init
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
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 9, 2020 at 3:39 AM Rob Herring <robh@kernel.org> wrote:

> The init VExpress variants currently instantiates a 'muxfpga' driver for
> the sole purpose of getting a regmap for it. There's no reason to
> instantiate a driver and doing so just complicates things. The muxfpga
> driver also isn't unregistered properly on module unload. Let's
> just simplify all this this by just calling
> devm_regmap_init_vexpress_config() directly.
>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Rob Herring <robh@kernel.org>

OK... looking at this.

> +       if (IS_ENABLED(CONFIG_VEXPRESS_CONFIG) && versatile_clcd_type == VEXPRESS_CLCD_V2M) {
>                 struct platform_device *pdev;
> -
> -               /* Registers a driver for the muxfpga */
> -               ret = vexpress_muxfpga_init();
> -               if (ret) {
> -                       dev_err(dev, "unable to initialize muxfpga driver\n");
> -                       of_node_put(np);
> -                       return ret;
> -               }
> -
>                 /* Call into deep Vexpress configuration API */
>                 pdev = of_find_device_by_node(np);

So this finds the platform device for compatible  "arm,vexpress-muxfpga",
ha!

> +               map = devm_regmap_init_vexpress_config(&pdev->dev);
> +               platform_device_put(pdev);

So then you can just do it like that.

Clever! Hats off for digging through my (unnecessary complex) code.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
