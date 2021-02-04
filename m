Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D4F30F057
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 11:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4796EA9E;
	Thu,  4 Feb 2021 10:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08AD26EA9E
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 10:19:22 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id v5so1517209lft.13
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 02:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DmOf9Q9nv5yl458FD7khePN/mPl2hnaoJzy3oYiWP5E=;
 b=OmVLmitCu9F1SW5JMwZRspF1QF1JIqsVOL0Q1m51m3mx4equeobKFLtoOmm4eH8qwF
 i3KL3ekO2yiAt9ojoOvQ94Jx+okdT+8R8EF8YlJZwcZ/vzoxbtfFks83EKrJxkTHqqZP
 ic0IBVNuShhmWZvszxoVYhNy3kvmpJYivtlbk99dEE85LP35UPzyJ+kUPtD/EHCeTcBf
 7gbb6V51rLK07n6J3HPw3p80YYirVjeuGT8Vxd8TYCV9rOLnOCYE2g3l+rLAhBmKQYbz
 DD8Vk4phNomq+f0944uQjuz/jhmMpmlVy9g8wCnDrGvDnXbMLE3p9cYKwEo1B//xnHhV
 uDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DmOf9Q9nv5yl458FD7khePN/mPl2hnaoJzy3oYiWP5E=;
 b=AF0bhu/8MXM6ZbUej4xNpJh8tvU/NeHGb3AYni8KapmHsAIX6GhGMTWF6+VB/P9Agq
 sBneFIo9VpxZRpBEiQ4w1w0NMu9vREUIWJvnGKY5N+3LpULPz3HfyxRnX8HSYTghwk6S
 3/9RTthSi3adeX010Rg+LwwB7TZA2l8lGtZzugFGvXSdPumVga/IhDkTFY3RwpTAPcbd
 mU4/ZUPd+az2girzLzk2nGibbPnzUtqOSz5DjTBOu38E3NQjAsPbRxTcHt3vjollVwpl
 HUgvpxEsEaROrtAe1g1uK6GSku/X9QKGSr8hulh0X4yHc+WgtbH3wnzUL+Rqk0z1ybYG
 JKUw==
X-Gm-Message-State: AOAM530kCJpas25V45v3XSi2rBHXzBv2xnFTq/2SOPUE5pbawUh6EFjB
 cfbGXAbhLVcSZNf7f2zIbPRAXRDwVFb44GyVVUo=
X-Google-Smtp-Source: ABdhPJw5OSPGCNncHxl6YjwckXPWxFeIbjOxGRJyfwUxKFr43c9oUoW+HvVFoYSnBrGyBTyq8+ax001vRqwXhsyfNIg=
X-Received: by 2002:a19:c56:: with SMTP id 83mr4507061lfm.325.1612433960442;
 Thu, 04 Feb 2021 02:19:20 -0800 (PST)
MIME-Version: 1.0
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
 <CAMeQTsbGBrTvfkz6BStwL240Kz-dbrQVKtXbYkRtbD3OoUKCcg@mail.gmail.com>
 <CAHp75VeYroY5uG38NrsqwbHnjT0j_LMMD3JmNmRED3OY5ff7xA@mail.gmail.com>
In-Reply-To: <CAHp75VeYroY5uG38NrsqwbHnjT0j_LMMD3JmNmRED3OY5ff7xA@mail.gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 4 Feb 2021 11:19:09 +0100
Message-ID: <CAMeQTsZRng0UWkO5fXUmZW=-gnKWiigwO0BwMY9p1T2D-hoMNA@mail.gmail.com>
Subject: Re: [GIT PULL] ib-drm-gpio-pdx86-rtc-wdt-v5.12-1
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
 Wim Van Sebroeck <wim@linux-watchdog.org>, Mark Gross <mgross@linux.intel.com>,
 linux-watchdog@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 3, 2021 at 1:00 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Jan 26, 2021 at 5:25 PM Patrik Jakobsson
> <patrik.r.jakobsson@gmail.com> wrote:
> > On Tue, Jan 26, 2021 at 1:37 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > Hi guys,
> > >
> > > This is first part of Intel MID outdated platforms removal. It's collected into
> > > immutable branch with a given tag, please pull to yours subsystems.
> >
> > Hi Andy,
> > Do you plan on eventually removing X86_INTEL_MID completely? If so,
> > then I should probably start looking at removing the corresponding
> > parts in GMA500.
>
> I have noticed new commits in DRM against GMA500 and it seems now in a
> conflict with my immutable branch. Are you sure you don't forget to
> pull it?

Hi Andy, sorry I missed pulling the immutable branch before taking the
gma500 medfield removal. I was unsure how to do that through drm-misc
and it's tools so I got sidetracked. What would be the correct way to
fix this?

-Patrik


>
> --
> With Best Regards,
> Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
