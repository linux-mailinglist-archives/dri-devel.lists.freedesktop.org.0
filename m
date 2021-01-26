Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E138330448C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 18:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 534246E466;
	Tue, 26 Jan 2021 17:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8738B6E48D
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 17:13:46 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id my11so1569311pjb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 09:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t5TtFJJmGGXnlkPzRkZI964XfU9tnGtrVx8sJ+nhhgg=;
 b=C3EzaIXBST8Cm9Ao23YPKGZNoi53AvO8DVjjAwPROAIXUYs1VE82+8vfqjXNnqjdzD
 liqtV8Y1DERtPWo1nyvHfJ0dIM/8zl2g2OV+IH1gVcjgZEzRSEwCDurFQdLYTY8HnEN1
 0fEepFjeJDCr3qWqSlfUjxky/XAISoB3hBYR8DzKKdH2NMCPGUGAbfnSuwrsbFq96NSW
 FlpZ22yilEbZ4sX0iNjxessv0r3jc76/3YCmf9c62Vft0I82Rgw+V8YLURrimjjWJIAj
 1uTnO8ujuLiPhWVT8RByXB8RRIBu5vPkxq1srzRNiDQBiGg7xvbsiV//h51SSHrX+7L6
 Zmsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t5TtFJJmGGXnlkPzRkZI964XfU9tnGtrVx8sJ+nhhgg=;
 b=FB3XK9shsJEJeI9lBR7chuas7byF1rc5WSPhu3sCvXPrCle6inmVPDJPEGOLWnNlCJ
 rIjnewEJgKHfgkLgdLu9i5pFXIoGz998kbn4ZMC5n1vcgPHQOQ1eOrmFsYV3xv7mcyNt
 eQeD/B2JXUIpyktieHzH0KjoLWfRJwH2wUq+UnfI86hBRzC3SnTzOCh21VJ3tZjZITXX
 bLZp+gH8X5ba4NJhueE/zXUDn6LaXyHLsONGdJJO11DFRU5mcgQmRJmLj3iB4sKIeeAF
 EYsg0yHEfKYEDwyuMdNfCVTPlgddDMwwCNqMXxs5vd0XkfKWAUE63axInJSazDM3Mhhl
 BC6A==
X-Gm-Message-State: AOAM530oT2QpHZ+kCrL83/c2qzwW3K6uXhp9MTV02Q+IkIZg0daVuleZ
 4GYAc1cHJfJnbP+0Wmfmv3xNDUfy2N2MXmc5744=
X-Google-Smtp-Source: ABdhPJx92R0qs5/XdlRo/afRbr8RCC/r8mWGIZcmtX5Tb/02Z6ZBjPok93oodD57c37HChymbSyI5sp/7oQ9C8Xpisw=
X-Received: by 2002:a17:90a:644a:: with SMTP id
 y10mr797421pjm.129.1611681226049; 
 Tue, 26 Jan 2021 09:13:46 -0800 (PST)
MIME-Version: 1.0
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
 <CAMeQTsbGBrTvfkz6BStwL240Kz-dbrQVKtXbYkRtbD3OoUKCcg@mail.gmail.com>
 <CAHp75Vc9RAHvTDAw1ryHq_CPRMtjqkzg9081nw0+RPY_yWPJgA@mail.gmail.com>
 <CAMeQTsY6k64LUg3DYbi67W6-Gx6znOeJbDfKUhzGt-BxF2BgKA@mail.gmail.com>
In-Reply-To: <CAMeQTsY6k64LUg3DYbi67W6-Gx6znOeJbDfKUhzGt-BxF2BgKA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 26 Jan 2021 19:14:35 +0200
Message-ID: <CAHp75VdKxARQAyyTd=ZcaoER1iF6Mk4AS1Dn6U9VCjt_D_+q8A@mail.gmail.com>
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

On Tue, Jan 26, 2021 at 6:55 PM Patrik Jakobsson
<patrik.r.jakobsson@gmail.com> wrote:
> On Tue, Jan 26, 2021 at 4:51 PM Andy Shevchenko
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
> > Nope. It is related to only Medfield / Clovertrail platforms.
> >
> > There are other (MID) platforms that may / might utilize this driver
> > in the future.
>
> Right, there's still Oaktrail / Moorestown with hardware in the wild.

Actually Moorestown had to be removed a few years ago (kernel won't
boot on them anyway from that date when Alan removed support under
arch/x86 for it).

I'm talking about Merrifield and Moorefield that can utilize it and
also some other platforms that are not SFI based (Cedar something...
IIRC).

> > I.o.w. we probably can remove the oldest stuff in the driver WRT above
> > mentioned platforms, but leave the driver for the rest.
> > I wouldn't be in a hurry with this though, display drivers are easy to
> > remove, but really hard to get back on velocity after that.
>
> Ok, I'll have a look at removing Medfield. That code should have been
> removed a long time ago.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
