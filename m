Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC3B423DF0
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 14:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12CB06EDC5;
	Wed,  6 Oct 2021 12:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65696EDC5
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 12:44:19 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id x27so9878056lfa.9
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 05:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZKqaWxUs3sgD4tdQBsKfjQHFZ50A1AY57zWO3HzEaz0=;
 b=p7O7r3g85OL9vVkRCa3Pfl3C5X1Jfj9eXjPMKWVLsEhkWogxYEcClklxYGVWQq8A2P
 lEHLpYxRHgQW4uXVDoPHoUArsfuteRAt1b6CIA3FJ+EjNOe5zUT+AAgMFYGSzljSZ6TO
 KoFs69gM6EHycwixuzD1lK9+dV8Me5UuqmZ9rtY57gAwYRrE057gkoCf0Uoi9LCBgyR9
 7atsGho2QXhE+dDu8BmXr5Ur/SWTeiQD4sTYuNaaOKKOVXapsZOBOVO1z6VNsE4WUUbL
 lGzoNXh0xJAquXu3k8a0vYJYpOb6yc9cyGw4+SDPKUnM/cHV804+EyEdWXyu6r4B41NO
 0G0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZKqaWxUs3sgD4tdQBsKfjQHFZ50A1AY57zWO3HzEaz0=;
 b=k0UKuRFirmh3JB9YpvoZmqVxMW5tf63mpviaq9JxNmBkWKqB47Vs87aGe8c3i8f+mX
 FxpQWqCFine8L7xU2qlRKAx47AWgtI4DAHs9eGbr0g1jenF/i231IHo7a9rQu6LjSgFk
 oEaY9Vd2EIT8omqTIO0Js/pxxNa9QhPMU53hHLWYsbgPR8odPlTqYaXg7pZhdBsnZliO
 jgZujzrr3IqJSrcnzxHkvilbNgjeBQOn5B6QgFfIdpK50VNgyWfmvRDjsaUsJOwedC8u
 LguExGOga6rjj2pnhcxMB1FZkz07Xbw2w2yPVCWXTuYFj/QvwehqoKbMO1yXLgDnmzLc
 WRFw==
X-Gm-Message-State: AOAM533fltc+l190iASjOB9Gf7kKbIrliXbR1LJKpNYWqXFMX6bhhURo
 AMz8iHyRJO8S8/O13+vuphhtW8nJp7THJoiXJsVF3w==
X-Google-Smtp-Source: ABdhPJyXxeHpfLtxmaaabzboN40a7mbS25hsa4pgTQ9RD1C7UcaYr5BpIOQmIiI1EQ4OQX0iO/sLUK+eeOQGXFL/ZtE=
X-Received: by 2002:ac2:4157:: with SMTP id c23mr9458293lfi.184.1633524257867; 
 Wed, 06 Oct 2021 05:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210926224058.1252-1-digetx@gmail.com>
 <20210926224058.1252-7-digetx@gmail.com>
 <CAPDyKFq+LS4Jr1GyC-a-tGWPzGH0JxfJ9wKY=uQEBGYm952azw@mail.gmail.com>
 <24101cd6-d3f5-1e74-db39-145ecd30418b@gmail.com>
 <CAPDyKFreK7976PJL-1zySoza_yXM7rMQ64aODWUZ+U3L-uCa0w@mail.gmail.com>
 <4bdba8a2-4b9b-ed7d-e6ca-9218d8200a85@gmail.com>
 <74a47158-e2e4-5fd0-3f37-0b50d4ead4d9@gmail.com>
In-Reply-To: <74a47158-e2e4-5fd0-3f37-0b50d4ead4d9@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 6 Oct 2021 14:43:41 +0200
Message-ID: <CAPDyKFr2-f1wM+6jF9vWJ-Nq80Zg1Z3qFP6saULOrBi1270HGw@mail.gmail.com>
Subject: Re: [PATCH v13 06/35] clk: tegra: Support runtime PM and power domain
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Peter Chen <peter.chen@kernel.org>, Lee Jones <lee.jones@linaro.org>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>, 
 Linux PM <linux-pm@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>,
 linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org, 
 linux-mmc <linux-mmc@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
 Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Lucas Stach <dev@lynxeye.de>, 
 Stefan Agner <stefan@agner.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 David Heidelberg <david@ixit.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, 6 Oct 2021 at 00:43, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 06.10.2021 01:19, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> > I reproduced the OFF problem by removing the clk prepare/unprepare from
> > the suspend/resume of the clk driver and making some extra changes to
> > clock tree topology and etc to trigger the problem on Nexus 7.
> >
> > tegra-pmc 7000e400.pmc: failed to turn off PM domain heg: -13
> >
> > It happens from genpd_suspend_noirq() -> tegra_genpd_power_off() -> clk
> > -> GENPD -> I2C -> runtime-pm.
> >
> > -13 is EACCES, it comes from the runtime PM of I2C device. RPM is
> > prohibited/disabled during late (NOIRQ) suspend by the drivers core.
>
> My bad, I double-checked and it's not I2C RPM that is failing now, but
> the clock's RPM [1], which is also unavailable during NOIRQ.

Yes, that sounds reasonable.

You would then need a similar patch for the tegra clock driver as I
suggested for tegra I2C driver. That should solve the problem, I
think.

>
> [1]
> https://elixir.free-electrons.com/linux/v5.15-rc4/source/drivers/clk/clk.=
c#L116
>
> Previously it was I2C RPM that was failing in a similar way, but code
> changed a tad since that time.

Alright. In any case, as long as the devices gets suspended in the
correct order, I think it should be fine to cook a patch along the
lines of what I suggest for the I2C driver as well.

It should work, I think. Although, maybe you want to avoid runtime
resuming the I2C device, unless it's the device belonging to the PMIC
interface, if there is a way to distinguish that for the driver.

Kind regards
Uffe
