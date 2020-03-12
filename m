Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBDE182B81
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:41:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68B76E0A8;
	Thu, 12 Mar 2020 08:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E056E0A8
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 08:40:54 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id f15so2268505pjq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 01:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B66v4eXPQ7K83ouJ2mPSLQXCELI/fDI8PZuRhUCkLnE=;
 b=TYU7Fc2fKR+lYRhdC12JYyZExBYrzc3NrCl6ugsTHfm8MzFBfhvhUw+s6jbUgTo+R+
 fDraAnZ+8JGEkVg+ImFpwiwiewaq+qaHw0CrmmgNCR8VyNfrVwQ/CQYEhIp493bdEoYP
 m2F/HdSYgp9LccmIbihcO6NjIJ+omW9sm28hz+JjxXEBJerHu6L2FRWNID1pepwD5AYM
 dIsldxeMszGF09fsj3Vc0AE+MZGMTmO6NQApXPZ2zaQrEo0mZ7Us6GxQa7p004K0mwkZ
 xTnixzieTBUen4tV/j0C2YQM/sbdrtSc9S0NMMKAraw/NkxTB84MvcAqRD7AmOUJKAaS
 d3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B66v4eXPQ7K83ouJ2mPSLQXCELI/fDI8PZuRhUCkLnE=;
 b=BcPq3Qj7nmLQ9RimPYlFsZhE/3ZC23F2uNpv7cCMoOfb+yNiAQRCPB2PA/4vN+IsqX
 1rCHGHNkRv8NftC7sIz3icaE0dGNNMzqbqzN3NZGv6Te3V1vk8VzC9aTb767yt96SSDh
 /hRBLmAG6dhNzdBMzhEEGyjCyRL+CB1bpS3pRwUJ0Sr1EIX3VtM20mfxSOmvXtLimbNl
 AcCp11m6LHQ8ICMsagyRC0Fw6GADUCGa/8cxDhkDdddLtitpEBuuWJU2BaXNZwDnz+FU
 mJL+59/7tWizt4cAG29lFhchwElVSZqumcehVFBbgBRsY6aUIDFI2ujnx/Kj91YR5Ee7
 KQ1w==
X-Gm-Message-State: ANhLgQ1Chb9cpCBFjm+MiQh/rNmEeTDr+IIfGViYwLvGxH+tIRun2M5E
 xgNP5DDtSxLZdkF/VgjB03aH4F6NtZhYfSRqQ1I=
X-Google-Smtp-Source: ADFU+vuCKsscjSBeYXkw3i4mhPJxhdDEyr6X9XyMUb7h5TIyA/i3v2HoTj6+Kfbm9VvcmM/QGsM3gb/gwmJ8NJ7ImUc=
X-Received: by 2002:a17:90a:77c3:: with SMTP id
 e3mr2939586pjs.143.1584002454410; 
 Thu, 12 Mar 2020 01:40:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200311125135.30832-1-ple@baylibre.com>
 <20200311125135.30832-4-ple@baylibre.com>
 <20200311135535.GQ1922688@smile.fi.intel.com>
 <20200312005333.GH1639@pendragon.ideasonboard.com>
In-Reply-To: <20200312005333.GH1639@pendragon.ideasonboard.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 12 Mar 2020 10:40:46 +0200
Message-ID: <CAHp75Vc8oREKpiz6pR_QiTDHbymh-KKEP5ZzcT8iDJhZs=0bMw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm: bridge: add it66121 driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, narmstrong@baylibre.com,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, heiko.stuebner@theobroma-systems.com,
 icenowy@aosc.io, devicetree <devicetree@vger.kernel.org>,
 Stephan Gerhold <stephan@gerhold.net>, jonas@kwiboo.se,
 Rob Herring <robh+dt@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jernej.skrabec@siol.net,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Phong LE <ple@baylibre.com>, Mark Brown <broonie@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 12, 2020 at 2:56 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Mar 11, 2020 at 03:55:35PM +0200, Andy Shevchenko wrote:
> > On Wed, Mar 11, 2020 at 01:51:34PM +0100, Phong LE wrote:
> > > This commit is a simple driver for bridge HMDI it66121.
> > > The input format is RBG and there is no color conversion.
> > > Audio, HDCP and CEC are not supported yet.
> >
> > I guess you should have been told in your company how to use get_maintainer.pl
> > to avoid spamming people.
> >
> > Hint:
> >       scripts/get_maintainer.pl --git --git-min-percent=67 ...

> I didn't even know about those options...

Doesn't one usually look at the help of the tool they are using?
How does one know what it does by default?

> I don't think we can't expect
> contributors to know about this if it's not even documented in
> Documentation/process/.

This is indeed not good and there is room for improvement.

> And even in that case, if this is what every
> contribution should use by default, then those options should become the
> default for the get_maintainer.pl script.

I don't think so. There is a common sense rule in play.
By default get_maintainer.pl shows the roles of the people, so, when
one puts the name at least they may read what the role of the
recipient in question. If I see too many people in the list (let's say
4+), I definitely will start looking for the explanation why.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
