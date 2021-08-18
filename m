Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7911D3F014F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 12:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45DDB8926F;
	Wed, 18 Aug 2021 10:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [IPv6:2607:f8b0:4864:20::e36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B05B8926F
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 10:09:26 +0000 (UTC)
Received: by mail-vs1-xe36.google.com with SMTP id f13so1386464vsl.13
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 03:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oSMbBaxj5kYnNMOz3HCW8c2GlUKNZpl4G8kt8vaDvcU=;
 b=NUh5EB/TshJuP06sY5queTXRGXqZEcl6UMqE3f6o4C7Yia1aQ7YYVwjSqato7REGKR
 ytMlzGxdm1dXPtaK5whOZ0H7rSbvF5peR2wviaOGrorE6BcPYImZyUzulxDwUsFPuWLL
 5meVhpkcaBkJDevWoxCSWZsvC5nJ7ZnpAY2bGN7+nkDxVClk3HURgKAukKwevldHPSBd
 uKsOCzfFz4fP/YbEiE46NuL+3ooaMnSQgmklXAz6fLHlvgEGNgwEPm1JpSu0mHG8iX+S
 G1rewHtqg4EDw2hrAD1fMBl1z5/lSpUx+/rIUDOZ+tcCTRi6DZjOeA44wsHIAFoqgBbV
 KNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oSMbBaxj5kYnNMOz3HCW8c2GlUKNZpl4G8kt8vaDvcU=;
 b=iochgD3raITH5BLdOf1bWE5fToNNn3mgaNKbiOLmRh3RXVEQQ1Zglo0xWbB5if7DRE
 xx3JhbDE9fXdOUgKlg1UOumVAs04SevE7+rxUfiqJlKzqbM1In/SLOZG4UMMg98RWqWD
 Zdf+3J9rzajlceSQmixn5Vyt3eGymYfQQjj+V3h2XxnlrUSkuP3KcDt48yYV1Is6tW0T
 nvR1rfgyFbKxYdb8FHCh49+dQg98OXlVnJkmkSMJFO3qoX6UcMQ9T7b2hl9KsnFOfMGa
 wER6pd7RLO1IpQvpA/qI5imVFvr6y8OttvzmoWvpcSvS9Ju7/CzdwqpmV91fRoCEZemC
 rtKg==
X-Gm-Message-State: AOAM533uHyav9OuM66c2lFgDJRs1jnHyRPPDXYGXIjUI/5DGHapjDz1+
 VSM9pN577o/HNE+NfW8vSe9T//mIt0YlF/TSL9IUNQ==
X-Google-Smtp-Source: ABdhPJxX5vUHiF4S9rKI8AwIyB37h/2agUjbKLWH1bKK7BdK0tRX0vp1siQiAlDeJWpHDBxGhS/HHDjvQsTJxQC3MTQ=
X-Received: by 2002:a05:6102:5f4:: with SMTP id
 w20mr6416911vsf.34.1629281364036; 
 Wed, 18 Aug 2021 03:09:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210818043131.7klajx6drvvkftoc@vireshk-i7>
 <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
 <20210818045307.4brb6cafkh3adjth@vireshk-i7>
 <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
 <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
 <f1c76f23-086d-ef36-54ea-0511b0ebe0e1@gmail.com>
 <20210818062723.dqamssfkf7lf7cf7@vireshk-i7>
 <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
 <20210818091417.dvlnsxlgybdsn76x@vireshk-i7>
 <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
 <20210818095044.e2ntsm45h5cddk7s@vireshk-i7>
In-Reply-To: <20210818095044.e2ntsm45h5cddk7s@vireshk-i7>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 18 Aug 2021 12:08:47 +0200
Message-ID: <CAPDyKFrFF00xGDWPCQnPwF0_QkG4TB2UqggpuBpp8LY_CMKP-A@mail.gmail.com>
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Viresh Kumar <vireshk@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Peter Chen <peter.chen@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>, 
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>, 
 Linux PM <linux-pm@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-mmc <linux-mmc@vger.kernel.org>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 18 Aug 2021 at 11:50, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 18-08-21, 11:41, Ulf Hansson wrote:
> > On Wed, 18 Aug 2021 at 11:14, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > What we need here is just configure. So something like this then:
> > >
> > > - genpd->get_performance_state()
> > >   -> dev_pm_opp_get_current_opp() //New API
> > >   -> dev_pm_genpd_set_performance_state(dev, current_opp->pstate);
> > >
> > > This can be done just once from probe() then.
> >
> > How would dev_pm_opp_get_current_opp() work? Do you have a suggestion?
>
> The opp core already has a way of finding current OPP, that's what
> Dmitry is trying to use here. It finds it using clk_get_rate(), if
> that is zero, it picks the lowest freq possible.
>
> > I am sure I understand the problem. When a device is getting probed,
> > it needs to consume power, how else can the corresponding driver
> > successfully probe it?
>
> Dmitry can answer that better, but a device doesn't necessarily need
> to consume energy in probe. It can consume bus clock, like APB we
> have, but the more energy consuming stuff can be left disabled until
> the time a user comes up. Probe will just end up registering the
> driver and initializing it.

That's perfectly fine, as then it's likely that it won't vote for an
OPP, but can postpone that as well.

Perhaps the problem is rather that the HW may already carry a non-zero
vote made from a bootloader. If the consumer driver tries to clear
that vote (calling dev_pm_opp_set_rate(dev, 0), for example), it would
still not lead to any updates of the performance state in genpd,
because genpd internally has initialized the performance-state to
zero.

Dmitry?

>
> --
> viresh

Kind regards
Uffe
