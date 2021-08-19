Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8A13F1C0A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 16:56:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0946E8F6;
	Thu, 19 Aug 2021 14:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED506E999
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 14:55:54 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id k24so4177961vsg.9
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 07:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mm8paTdT0zaztfhC5Y4WPaOBPl8kLHQHgl7pXYxX3h4=;
 b=qeDfX1TvtXFpaue7XSJcQGoXvoEPk6keQ3SefhHQYD/RQYSwXL/h7/nJ1tE1n2ZgGf
 hgNQdBuev8q9YdqAn31QqEn+hl0Fw8o/I7j+pKewMg7BSKDExUMcgAG5ffW6TnVBaweA
 awPBlmbVNdD0YyJLl/fecYVhU7UH2GjQaH+G3BKTeEFH67xcFXuuVoODzKyHu4OljnuW
 y3YyyagNQ7/VVdr8UoQMvH7lyjCnnH9zaDfJmZrMJYrsb5yu8bZTEWP6ZCkq4ndYtqKT
 KiXhZrvSOf9kLkVqOyobXMYfdScN3zuV6Y2fafpateAUvd8nG8k5/FLAhRgrUffP4ZSX
 UqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mm8paTdT0zaztfhC5Y4WPaOBPl8kLHQHgl7pXYxX3h4=;
 b=sDtBPl3CLSTsBTtqHzZWimhBjE+qhCbNkNgIHFM3KKuw5iNgKpl4Fjs6QM+XfKCEm/
 zMCq2ks9iLspzAjQuVlQGgpFBDvbY0TBPIv5Ou40Afbf6fFQ2SBLFdHqccM5Owe5c3y4
 9bzY2TT9D1VpQYGtEKl7TnDbDRDr/ydawk4Z1qBpbpj7z5N7zEq45cHrNVg9HUOC5hV9
 G86CQNXyX95Ka2gBJc5h4amn7fcL3cr6+HmCinQmaG9Dp8ezMmHUZllYORxfP5UhTM+g
 rxFUUeCQZKfJaqUA+CIsZdQHWtPOhPb3ay6lMYUHQlsvYpimTGfinpA7UczOayymcfcp
 vT0g==
X-Gm-Message-State: AOAM533kOWCLI3ieX6CgfdKflZ/moAH/bCQ0zuLyL5D0KBchoNyoOWCs
 DCKCukCADt0Vw26Ht2lqj/AjmV3GmQSnEaA7nlATyw==
X-Google-Smtp-Source: ABdhPJy9lhlHe3ZkjkK69gRHTqfsYZUpyU/u1QO9GNutRCvh27kC0oDOl0UN2vIh0G0BbPGuh3RFsxVqGIQ9yFmBme8=
X-Received: by 2002:a67:f6d8:: with SMTP id v24mr12929204vso.48.1629384953702; 
 Thu, 19 Aug 2021 07:55:53 -0700 (PDT)
MIME-Version: 1.0
References: <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
 <20210818045307.4brb6cafkh3adjth@vireshk-i7>
 <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
 <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
 <f1c76f23-086d-ef36-54ea-0511b0ebe0e1@gmail.com>
 <20210818062723.dqamssfkf7lf7cf7@vireshk-i7>
 <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
 <20210818091417.dvlnsxlgybdsn76x@vireshk-i7>
 <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
 <f1314a47-9e8b-58e1-7c3f-0afb1ec8e70a@gmail.com>
 <20210819061617.r4kuqxafjstrv3kt@vireshk-i7>
In-Reply-To: <20210819061617.r4kuqxafjstrv3kt@vireshk-i7>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 19 Aug 2021 16:55:16 +0200
Message-ID: <CAPDyKFpg8ixT4AEjzVLTwQR7Nn9CctjnLCDS5GwkOrAERquyxw@mail.gmail.com>
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

On Thu, 19 Aug 2021 at 08:17, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 18-08-21, 18:55, Dmitry Osipenko wrote:
> > 18.08.2021 12:41, Ulf Hansson =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >
> > Either way gives the equal result. The new callback allows to remove th=
e
> > boilerplate dev_pm_opp_set_rate(clk_get_rate() code from the rpm-resume
> > of consumer devices, that's it.
>
> It may not be equal, as dev_pm_opp_set_rate() may do additional stuff,
> now or in a later implementation. Currently it only does
> regulator_enable() as a special case, but it can be clk_enable() as
> well. Also, this tries to solve the problem in a tricky/hacky way,
> while all you wanted was to make the genpd aware of what the
> performance state should be.
>
> Your driver can break tomorrow if we started to do more stuff from
> this API at another time.
>
> > > dev_pm_opp_set_rate() is best called from consumer drivers, as they
> > > need to be in control.
> > >> What we need here is just configure. So something like this then:
> > The intent wasn't to use dev_pm_opp_set_rate() from
> > __genpd_dev_pm_attach(), but to set genpd->rpm_pstate in accordance to
> > the h/w configuration.
>
> Right.
>
> > On Tegra we have a chain of PDs and it's not trivial to convert the
> > device's OPP into pstate because only the parent domain can translate
> > the required OPP.
>
> The driver should just be required to make a call, and OPP/genpd core
> should return it a value. This is already done today while setting the
> pstate for a device. The same frameworks must be able to supply a
> value to be used for the device.

Right, that sounds reasonable.

We already have pm_genpd_opp_to_performance_state() which translates
an OPP to a performance state. This function invokes the
->opp_to_performance_state() for a genpd. Maybe we need to allow a
genpd to not have ->opp_to_performance_state() callback assigned
though, but continue up in the hierarchy to see if the parent has the
callback assigned, to make this work for Tegra?

Perhaps we should add an API dev_pm_genpd_opp_to_performance_state(),
allowing us to pass the device instead of the genpd. But that's a
minor thing.

Finally, the precondition to use the above, is to first get a handle
to an OPP table. This is where I am struggling to find a generic
solution, because I guess that would be platform or even consumer
driver specific for how to do this. And at what point should we do
this?

>
> > Viresh, please take a look at what I did in [1]. Maybe it could be done
> > in another way.
>
> I looked into this and looked like too much trouble. The
> implementation needs to be simple. I am not sure I understand all the
> problems you faced while doing that, would be better to start with a
> simpler implementation of get_performance_state() kind of API for
> genpd, after the domain is attached and its OPP table is initialized.
>
> Note, that the OPP table isn't required to be fully initialized for
> the device at this point, we can parse the DT as well if needed be.

Sure, but as I indicated above, you need some kind of input data to
figure out what OPP table to pick, before you can translate that into
a performance state. Is that always the clock rate, for example?

Perhaps, we should start with adding a dev_pm_opp_get_from_rate() or
what do you think? Do you have other suggestions?

>
> --
> viresh

Kind regards
Uffe
