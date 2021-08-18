Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB4B3F00D1
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 11:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C936D6E50C;
	Wed, 18 Aug 2021 09:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B486E50C
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 09:43:12 +0000 (UTC)
Received: by mail-vs1-xe2a.google.com with SMTP id f13so1350069vsl.13
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 02:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FWBxn1z3ekg3JNnkDjY46sh+PpWR/RlGELWeBu4tA3E=;
 b=FFftuENs27XO7ikAVlt9sNRrRCsBTJZ805lZ/o142pXQXR8nF52pmq8IvezPLEiFO+
 Gjq2WoPiQzk8jZ4uYInc1khmBed8qd46T4LWYngy8i354Jfy5RYYZeNPcPQwV7Hi+puI
 QZhCeWMwHzHrHaXIuivtbzApdiybJQ4pVhpGU7feoyKgCWA/npF/0W2iJeG8VztzaEt+
 ZJsxwI7r8+xAuOc7l8/VyUsTvFlBfoIdxOUMdDlAHZYFe7MoAJNwUSTgdHCwo6ucQZJA
 BERjK6oUxjMO7UroxyK/oZD8pD+R5orBQwvbmOc6wkXjZrFZ4z5k2EAhTN/3qtONaHMN
 ycCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FWBxn1z3ekg3JNnkDjY46sh+PpWR/RlGELWeBu4tA3E=;
 b=J1f6r64UMfILngt8DXlGMV+mmB1t6RBmH5o8lD0RFH8cDvF1PKeeKd/0L0jXiV5nac
 fyiVLoVYfSJTi4HM0TaK8y1RrUUOUluIvaGYF1gCePUEGzxg49jrsJTDVK67x6QTqkoi
 YR09lP5APC1NkCYw9EkkHY8C5A0ulYtbgLoCUYKbQ2Cw/xuw2ABfYjnOj0O2OU3mnx14
 e2DaoOAZDdz8TEdd9w7fgSZT5MLkXGnSAuUwaENQM9ZZ9CoXBec2YYNvw4hzxv1v6HaA
 Ig6EJcbzng21uBchCtw5LZyg9mUuQ9zdMxU4CyFe91s5fVoWy3qc/bC2FjsEJlh0gTY6
 DkQg==
X-Gm-Message-State: AOAM533/D8idEoGciTMJpNywjHlzDgt8CP6FfdGSxmv24wEgj2BY6+sS
 3M2S1U+v8pGgcOd0t3O9Ymd+91TzjocXbGT5DAamFQ==
X-Google-Smtp-Source: ABdhPJy9niDJz5mgkUvErbKV42Yn+Ms0EJBjGcIKiTYQBlrHgHjEZyzYRmP0dMsZPekoMsC63913LnT1iekm3nfsXZM=
X-Received: by 2002:a67:7949:: with SMTP id u70mr6382807vsc.55.1629279791962; 
 Wed, 18 Aug 2021 02:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210818035533.ieqkexltfvvf2p4n@vireshk-i7>
 <5b2a80c1-9743-e633-6257-ede94c8a274c@gmail.com>
 <20210818043131.7klajx6drvvkftoc@vireshk-i7>
 <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
 <20210818045307.4brb6cafkh3adjth@vireshk-i7>
 <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
 <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
 <f1c76f23-086d-ef36-54ea-0511b0ebe0e1@gmail.com>
 <20210818062723.dqamssfkf7lf7cf7@vireshk-i7>
 <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
 <20210818091417.dvlnsxlgybdsn76x@vireshk-i7>
 <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
In-Reply-To: <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 18 Aug 2021 11:42:35 +0200
Message-ID: <CAPDyKFrgGEOEFsqah3sQfPbjeRySPfFxokpO-BcMcPmEMrv-kg@mail.gmail.com>
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

On Wed, 18 Aug 2021 at 11:41, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Wed, 18 Aug 2021 at 11:14, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 18-08-21, 10:29, Ulf Hansson wrote:
> > > Me and Dmitry discussed adding a new genpd callback for this. I agreed
> > > that it seems like a reasonable thing to add, if he insists.
> > >
> > > The intent was to invoke the new callback from __genpd_dev_pm_attach()
> > > when the device has been attached to its genpd. This allows the
> > > callback, to invoke clk_get_rate() and then dev_pm_opp_set_rate(), to
> > > update the vote according to the current state of the HW.
> >
> > I wouldn't call dev_pm_opp_set_rate() from there, since it means
> > configure and enable (both) for different resources, clk, regulator,
> > genpd, etc..
>
> Right, good point!
>
> dev_pm_opp_set_rate() is best called from consumer drivers, as they
> need to be in control.
>
> >
> > What we need here is just configure. So something like this then:
> >
> > - genpd->get_performance_state()
> >   -> dev_pm_opp_get_current_opp() //New API
> >   -> dev_pm_genpd_set_performance_state(dev, current_opp->pstate);
> >
> > This can be done just once from probe() then.
>
> How would dev_pm_opp_get_current_opp() work? Do you have a suggestion?
>
> >
> > > I am not sure if/why that approach seemed insufficient?
> > >
> > > Another option to solve the problem, I think, is simply to patch
> > > drivers to let them call dev_pm_opp_set_rate() during ->probe(), this
> > > should synchronize the HW state too.
> >
> > Dmitry already mentioned that this will make the device start
> > consuming power, and he doesn't want that, else we need an explicit
> > disble call as well.
>
> I am sure I understand the problem. When a device is getting probed,

/s/I am sure/I am not sure

> it needs to consume power, how else can the corresponding driver
> successfully probe it?
>
> >
> > --
> > viresh
>
> Kind regards
> Uffe
