Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 619E7304035
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 15:25:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 848D06E44B;
	Tue, 26 Jan 2021 14:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD81D6E44B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 14:25:53 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id g15so11514201pgu.9
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 06:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NPSOH8Y62ukMN0OaTHNJQcHEYySsxlPH5TqLsLYLoQg=;
 b=SkFBEQRuNzx7oNacOenVNqjxOYIRojAVRIrMayGeOAl0djFSeR8oH6C199qfpE2FEG
 Ol9dnrqkN29SpK2qgA9Lc27eNLNVTDTm7wsLeBGrfoVgQ2mPQOESMbwkojG+H87p6Sw+
 BBNjxJCkN1b5aIBYXTRaAgzHHgotUpU/LQ1qqf89ihNcqH6MbBn3ldQ50AhAgf4dhF6+
 atpiPndRtmVrHzUhY2rYPoKph+N3GpQeKnyUkd12t7jHWKQ5EEXm4x+FI8XR25U++nrh
 PKtAVBXkOOA8UF5YNs/k0QMDaIqaK+nEN/YZVzewMomb4Wf/OSidoT1ppzR1f8U1d2Es
 evZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NPSOH8Y62ukMN0OaTHNJQcHEYySsxlPH5TqLsLYLoQg=;
 b=Q6o3NJMKWlyp+tnv9ZRIdM5eI1fIC9Z9VEKO1RZrFDTjDSJ9PqW4ZG7pBeht4AWAbi
 MrDxPXwk+MZ8e/GKybnHh37Lt/62XvVM0e+qqftEsZ20bPgKhoQoU/BM8CNms4dw+HUD
 1xzuVgCrZOuHBO8GH7aE/uLoPWPqwFDaza76eWYzpBeD3A3d7pJf/YyFj+yRcK7GA20e
 Rs99XWac9RB+yb4/+1LV70NVEnDkRmpRaI6Qw5ch7G7O/KRKJiNQKmnsvdMWB62YcTv4
 tm3rxts/9plJk+b/nBpqx9j8IgPPilnTZqtesq8JUJ8z9nJo+F9UIrbuF4VM6SXv5a9A
 2fVw==
X-Gm-Message-State: AOAM5329PHr2Kx0pHjgMLvlL8Zz35gjrmdIr2i7CnTdUPIWythoVecRB
 EpzqVw7snDDu+sYaa+MDB6Q4Oi4HQGxJBWDSYoM=
X-Google-Smtp-Source: ABdhPJyqWaX+Pth+W5prJc8n9EUN7utWiThsOSD+IU9DjuKJij5MhYt+nVXG/9mfOEsVcVWVJZY13r0DrIoqdfte8f8=
X-Received: by 2002:a63:e50:: with SMTP id 16mr5867228pgo.74.1611671153433;
 Tue, 26 Jan 2021 06:25:53 -0800 (PST)
MIME-Version: 1.0
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
 <886bbdc0-3391-2140-a2d4-1688b262966f@redhat.com>
In-Reply-To: <886bbdc0-3391-2140-a2d4-1688b262966f@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 26 Jan 2021 16:26:42 +0200
Message-ID: <CAHp75Vde=dN-9dj2d9pxNeg1ODzp6tV0truHPtHJycbjWA=akQ@mail.gmail.com>
Subject: Re: [GIT PULL] ib-drm-gpio-pdx86-rtc-wdt-v5.12-1
To: Hans de Goede <hdegoede@redhat.com>
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
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 26, 2021 at 4:23 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 1/26/21 1:38 PM, Andy Shevchenko wrote:
> > Hi guys,
> >
> > This is first part of Intel MID outdated platforms removal. It's collected into
> > immutable branch with a given tag, please pull to yours subsystems.
> >
> > (All changes are tagged by the respective maintainers)

...

> >       platform/x86: intel_mid_thermal: Remove driver for deprecated platform
> >       platform/x86: intel_mid_powerbtn: Remove driver for deprecated platform
>
> Erm, I already have this 2 in platform-drivers-x86/for-next since you said that
> these 2 could be merged independently.

Yes, you may merge this on top, shouldn't be any conflicts.
But this mail originally was sent a couple of days ago, I had a
problem with my email setup.

> Anyways I just did a test-merge and there is no conflict, so everything is ok.

Yep. That's how it works :)

> From my pov this looks good and I plan to merge this into platform-drivers-x86/for-next
> before the merge-window.
>
> I'm going to hold off on doing that for a bit for now in case one of the other
> subsys maintainers has any objections.

Noted and thanks!

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
