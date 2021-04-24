Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC79369DA5
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 02:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE85F6ECCD;
	Sat, 24 Apr 2021 00:09:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18AA6ECCD
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Apr 2021 00:09:08 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id b10so50464066iot.4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 17:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mUIgi8gr2tgzWKj4+8JDnT/+2+iJBvHpF1dlGi1xl7U=;
 b=eIVk3kWDGLkxI6e7AjS74LPf7mENaT1FX8HKi8JueWU4UuoHBig3oizGT1ntPq+hbt
 tFqvOi88/997OlaQMY6hKHbHb0cP7bLW4A31KySs7OgfFqPrP7xXw3Tf7xOvwuYRO7tN
 U8wMXMyT/rmbqquvTLIWV2Pge5r3gtI6p3XlGqMcqM2ZOvKqFNIWyPTRNYFA3jw9elb/
 gf/6N2VDaCiDyEDSBJooEq657o73WG9pD3kV8rb3dmsK5x3luSueweF7aDA6t2mKfM4Y
 c79p1OBa/DJdJCA0N+cTn4qi7jZkVZhOoj/bdrMrHAxn6wt7+lo8xhY/GJiJ6EsvOGfp
 TK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mUIgi8gr2tgzWKj4+8JDnT/+2+iJBvHpF1dlGi1xl7U=;
 b=p1d/eFDLhFauSSEoAIUGRAQeSuIfPGCRjufzPmu4crdVKWsmBGG43g7iKCRPn/ToXk
 gdfk5h4XXGJ0bvECKWgM7kwMYqBbxLH62FftQr+lee+MWifBbPgAu4pOfAyikQjSQSH5
 miuX3OluwKNFnUMjtPdIW7xs0Ejvy0GIEutaQfrPhRiaon2wV8rZ2KPS8LdYwwA4zsF6
 WSgeu8Dj6dIDNlUjqjpZpHk1jjlmAg7ePtHj4xXiX5kHcW6fph0l7cPLep6k2lBQWm1A
 fAeo8P/J8bYGFSU5dtv/9TqGSnUGHOWuFV5gBarpakDnMWIVhqV9sviPt4DtREW7CQ3A
 R4xg==
X-Gm-Message-State: AOAM532VFOTuOMQ8dbRTJQtMP4Uz/hTyekp8ejVRJ/Oai58812uECN5T
 Kc8yAhUO/x9mn8eCnmevsE/L715lFxUCiTzDEBlPmNH9qVMHnGNM
X-Google-Smtp-Source: ABdhPJzpqEKzOQAznBrk9weKRq/P/QY2iIQeqtxS3bPY6W15AZaVS8+fIA29w7CgKa8lN9Gg4oFBEDPlkNfMCTJh7/8=
X-Received: by 2002:a05:6602:22c9:: with SMTP id
 e9mr5125249ioe.73.1619222948139; 
 Fri, 23 Apr 2021 17:09:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210423034247.992052-1-art@khadas.com>
 <20210423114735.GA5507@sirena.org.uk>
In-Reply-To: <20210423114735.GA5507@sirena.org.uk>
From: Art Nikpal <email2tema@gmail.com>
Date: Sat, 24 Apr 2021 08:08:57 +0800
Message-ID: <CAKaHn9LC19cduyrwxkDRAdM5pjgSPBCdZUjsEMgGqS7yVQS1-g@mail.gmail.com>
Subject: Re: [PATCH] SPI: meson-spifc add missed calls to remove function
To: Mark Brown <broonie@kernel.org>
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
Cc: Gouwa Wang <gouwa@khadas.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, Artem Lapkin <art@khadas.com>,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> I would expect the driver to unregister the controller at the start of
> the remove function, suspend doesn't really make sense here

It's strange - But without spi_master_suspend i have randomly stucks
when i try unload this module - as was written before
i was test it (load/unload module in loop) and for me suspend make sense here

If anybody has another solution - or real problem not here - please
help to find the right way!

PS: i have another way for solve this problem (may be it can help us
fix problem in kernel)

# before unload module need
echo -n spi0.0 > /sys/bus/spi/drivers/spi-nor/unbind
# after unbind driver we can unload module without problem
rmmod spi_meson_spifc # can stuck without unbind driver before ...


On Fri, Apr 23, 2021 at 7:48 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Apr 23, 2021 at 11:42:47AM +0800, Artem Lapkin wrote:
> > Problem: rmmod meson_gx_mmc - not stable without spi_master_suspend call
> > and we can get stuck when try unload this module
>
> > +++ b/drivers/spi/spi-meson-spifc.c
> > @@ -359,6 +359,7 @@ static int meson_spifc_remove(struct platform_device *pdev)
> >       struct spi_master *master = platform_get_drvdata(pdev);
> >       struct meson_spifc *spifc = spi_master_get_devdata(master);
> >
> > +     spi_master_suspend(master);
> >       pm_runtime_get_sync(&pdev->dev);
> >       clk_disable_unprepare(spifc->clk);
> >       pm_runtime_disable(&pdev->dev);
>
> I would expect the driver to unregister the controller at the start of
> the remove function, suspend doesn't really make sense here.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
