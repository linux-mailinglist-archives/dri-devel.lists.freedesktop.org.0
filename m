Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 997C230F0D8
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 11:36:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 191476E040;
	Thu,  4 Feb 2021 10:36:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CDE96E040
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 10:36:36 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id j25so3242985oii.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 02:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VwdkegGeppc78dF2PFU6pSDmQfAtNSqd3Duj9DFoqr8=;
 b=f5k5VV21T0eHtIsE/JIjtzqo9tONCWAK9IKXqDwemmArJ4XNMjmiBMcQawzbRrnw0K
 YTiI8dvTWlk7wqWJ0idBIFmZiYOqtJiomc1CLXd7d+Vfpt3lfOTZ/Fgmk6npx6SDl6z4
 xgBDZACVLLFmvyZS2d2UTScH/IrGlFlvMZH60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VwdkegGeppc78dF2PFU6pSDmQfAtNSqd3Duj9DFoqr8=;
 b=NWbsRse/DWYNBTGvs1hYjSwLmCMtOpSCP+SiPuJ67DL+saZBUGC3ZXOEhOLVh4gLqJ
 ZwGxw2OJWmwaisTnd2Dq3gjNH0tRqkAAUo7ej8+AWOrxruzHjtrTRWm2rO+YIniGqA4k
 8CGFZg5qA6VwmiweDknYmJRXAZMbaR4wRfq9aRBz7vg+EZuG1ZBJqW4Bgc1TwC6mqnCy
 TW4wdmvdSxaH1L38xxh6tX9NMI9G+PGOBBEIj04mOIn4MFbXDzOcT1Mk8l/eZg6wtxRc
 hW7gLJ8CsM3kCZ/p4rxYsNgCqNCo09po2TS/yEVX5Ni1GIA3LdVcv5rVJjK1wge/nmav
 A47g==
X-Gm-Message-State: AOAM5308j7zimb3YiW85u9jmtqqk+TCZxIkifj9BkcyysvZUR9RPpbER
 tUL6Gmzx/J13NlfGMo3NBdNwcusZVmc4tqghzBWmWA==
X-Google-Smtp-Source: ABdhPJwgzZ9kTem2s5DLPzCB4a5HVBFtTEcRM0YmzS/9yA8rya4DMJj9dUJa7RU7vqMUj0nMDTxqlj1goL3lY4CWp+g=
X-Received: by 2002:aca:df42:: with SMTP id w63mr4831731oig.128.1612434995408; 
 Thu, 04 Feb 2021 02:36:35 -0800 (PST)
MIME-Version: 1.0
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
 <CAMeQTsbGBrTvfkz6BStwL240Kz-dbrQVKtXbYkRtbD3OoUKCcg@mail.gmail.com>
 <CAHp75VeYroY5uG38NrsqwbHnjT0j_LMMD3JmNmRED3OY5ff7xA@mail.gmail.com>
 <CAMeQTsZRng0UWkO5fXUmZW=-gnKWiigwO0BwMY9p1T2D-hoMNA@mail.gmail.com>
In-Reply-To: <CAMeQTsZRng0UWkO5fXUmZW=-gnKWiigwO0BwMY9p1T2D-hoMNA@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 4 Feb 2021 11:36:24 +0100
Message-ID: <CAKMK7uEBaWMz-AjuJO3vvUBvacqMHuevOhMhQ0a+r5TtyDpwuQ@mail.gmail.com>
Subject: Re: [GIT PULL] ib-drm-gpio-pdx86-rtc-wdt-v5.12-1
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
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
Cc: "open list:REAL TIME CLOCK \(RTC\) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Gross <mgross@linux.intel.com>,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 4, 2021 at 11:19 AM Patrik Jakobsson
<patrik.r.jakobsson@gmail.com> wrote:
>
> On Wed, Feb 3, 2021 at 1:00 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Tue, Jan 26, 2021 at 5:25 PM Patrik Jakobsson
> > <patrik.r.jakobsson@gmail.com> wrote:
> > > On Tue, Jan 26, 2021 at 1:37 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > >
> > > > Hi guys,
> > > >
> > > > This is first part of Intel MID outdated platforms removal. It's collected into
> > > > immutable branch with a given tag, please pull to yours subsystems.
> > >
> > > Hi Andy,
> > > Do you plan on eventually removing X86_INTEL_MID completely? If so,
> > > then I should probably start looking at removing the corresponding
> > > parts in GMA500.
> >
> > I have noticed new commits in DRM against GMA500 and it seems now in a
> > conflict with my immutable branch. Are you sure you don't forget to
> > pull it?
>
> Hi Andy, sorry I missed pulling the immutable branch before taking the
> gma500 medfield removal. I was unsure how to do that through drm-misc
> and it's tools so I got sidetracked. What would be the correct way to
> fix this?

Imo Linus can resolve this, it's pretty trivial, as long as both pull
requests point it out to him.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
