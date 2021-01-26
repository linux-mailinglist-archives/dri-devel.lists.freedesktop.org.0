Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D91304D4E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 00:19:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77816E454;
	Tue, 26 Jan 2021 23:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2DCB6E454
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 23:19:32 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id i141so256608yba.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 15:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yG8TN3kSOy/r5C1fLciwDAgyrhAMN8G3ZSfNxn4LKwI=;
 b=JGn9UVd1WL6oLaAIgsVyZFefcVBcfaNKnNmOKOUyzbrJVYPNvDflHiTqTCWbm08KKm
 cHN3UA9Qctcy/zocpr/AYU08cR4RovIIz4JlaEWXZxBMFL7ThTcs/Xw7vAn5YKV9F6bS
 Ovrxi5Oqb0xAcSldXg7BPjJ7e8IrIwVj7lashPMbLmBoH+ir0sIVOOgNZRTTXJMWihA5
 aBH8+0LeIHQz5MZkI5ksYuuMbyMEKaAIyhlG64IipkZUPMFKbeYo+0C5IyD9IBsL+mgu
 NXmYmPsFaDDfqufP8ivVnzJswuQdVImtIfytTHJaKUTtTMsOam8GbSNJKsqKsz3Wlfh9
 WIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yG8TN3kSOy/r5C1fLciwDAgyrhAMN8G3ZSfNxn4LKwI=;
 b=MkuaEdmyRiUhH7LHDsphk4Xn6zvLAxcLAKkEEre9cw9+oWu5osuvVmj1ymD7NviAjl
 l1osAo615USt6iCo2+d76XFrhYZYsVpf4Xd0iPqyyO7BZtHMlhd8ribiqgjR1kACmMo6
 mVCJ5hQbQldR2HSSB58hqFHP7oz89vwyIpAzhElZaEKdly9DNYydZFP1itfbsM6DQEBU
 Po+I+ek5LFMlDhxgkCRp9ljwfu4cTC/2yGtYRBcAWrK2w2ghZfm07+VSBgmmg5QXp9E9
 /iH3g87+DNK0LLcSIbOsl4txL65vUKcoFvEUQWrxc8A2SJJvrVSDZ40TAGsFGV5KY/Ih
 g83w==
X-Gm-Message-State: AOAM533h61Mz6N4kYX/Zcibm41ny2bwwVE+5KDd4YWoIrAlQDHXSsgP5
 IEJQ9Q5o4wW2wmdAWNr/xhU5fWmUsNranZLt2Cc=
X-Google-Smtp-Source: ABdhPJzBIh/uw8fHMxIPrq4i5pm0L5Jnoe2iN2FtZdlZzW9R7RDH1coLX0c8arxTOhBav4i1zaEHR/zAQGpitgryc7o=
X-Received: by 2002:a25:9b81:: with SMTP id v1mr10594112ybo.168.1611703172052; 
 Tue, 26 Jan 2021 15:19:32 -0800 (PST)
MIME-Version: 1.0
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
 <CAMeQTsbGBrTvfkz6BStwL240Kz-dbrQVKtXbYkRtbD3OoUKCcg@mail.gmail.com>
 <CAHp75Vc9RAHvTDAw1ryHq_CPRMtjqkzg9081nw0+RPY_yWPJgA@mail.gmail.com>
 <CAMeQTsY6k64LUg3DYbi67W6-Gx6znOeJbDfKUhzGt-BxF2BgKA@mail.gmail.com>
 <CAHp75VdKxARQAyyTd=ZcaoER1iF6Mk4AS1Dn6U9VCjt_D_+q8A@mail.gmail.com>
 <3b4c2f63-14e6-5041-3c15-c2d65b229269@redhat.com>
 <CAHp75VcEq4thOub+k5rDR61KZX4jCZj2zJr2OqsdedmpSB64KA@mail.gmail.com>
In-Reply-To: <CAHp75VcEq4thOub+k5rDR61KZX4jCZj2zJr2OqsdedmpSB64KA@mail.gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Wed, 27 Jan 2021 00:19:17 +0100
Message-ID: <CAMeQTsZMK9E4=qB-Kxnt9i4RGDFRkVMAgyYSck_tmk7C7yTH2A@mail.gmail.com>
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

On Tue, Jan 26, 2021 at 9:53 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Jan 26, 2021 at 8:33 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > On 1/26/21 6:14 PM, Andy Shevchenko wrote:
> > > On Tue, Jan 26, 2021 at 6:55 PM Patrik Jakobsson
> > > <patrik.r.jakobsson@gmail.com> wrote:
> > >> On Tue, Jan 26, 2021 at 4:51 PM Andy Shevchenko
> > >> <andy.shevchenko@gmail.com> wrote:
> > >>> On Tue, Jan 26, 2021 at 5:25 PM Patrik Jakobsson
> > >>> <patrik.r.jakobsson@gmail.com> wrote:
> > >>>> On Tue, Jan 26, 2021 at 1:37 PM Andy Shevchenko
> > >>>> <andriy.shevchenko@linux.intel.com> wrote:
> > >>>>>
> > >>>>> Hi guys,
> > >>>>>
> > >>>>> This is first part of Intel MID outdated platforms removal. It's collected into
> > >>>>> immutable branch with a given tag, please pull to yours subsystems.
> > >>>>
> > >>>> Hi Andy,
> > >>>> Do you plan on eventually removing X86_INTEL_MID completely? If so,
> > >>>> then I should probably start looking at removing the corresponding
> > >>>> parts in GMA500.
> > >>>
> > >>> Nope. It is related to only Medfield / Clovertrail platforms.
> > >>>
> > >>> There are other (MID) platforms that may / might utilize this driver
> > >>> in the future.
> > >>
> > >> Right, there's still Oaktrail / Moorestown with hardware in the wild.
> > >
> > > Actually Moorestown had to be removed a few years ago (kernel won't
> > > boot on them anyway from that date when Alan removed support under
> > > arch/x86 for it).

Ok. I lump Moorestown and Oaktrail together since they have the same
Z6xx series CPU/GPU (GMA600). I still have a working Oaktrail device
so that support should stay in gma500.

> > >
> > > I'm talking about Merrifield and Moorefield that can utilize it and
> > > also some other platforms that are not SFI based (Cedar something...
> > > IIRC).
> >
> > Yes at least there are some 64 bit capable SoCs with GMA500 which were
> > used in NAS like devices. These NAS-es actually have a VGA output
> > (and maybe also DVI?) which is attached to the GMA500.

Yes these should be Cedarview/Cedartrail. Some of them are 64-bit and
some are 32-bit. I think it came down to if bios enabled it or not.
Cedarview comes with VGA, DVI and eDP/DP. Quite a few Cedarview
devices exist in the wild.

>
> Since you are talking about 64-bit, definitely they are *not*
> Moorestown, Medfield, Clovertrail since the mentioned never were
> 64-bit. But it would be nice to see the CPU model number to be sure.
>
> > I know people are running Fedora on these, so we should at least keep
> > these supported.
>
> Is it possible to gather the CPU model number from them? (Or at least
> the exact device/box name)

Yes, it would be interesting to know more about Clovertrail. gma500
only supports up to the Cedarview GPUs but Clovertrail might also use
a Cedarview GPU.

-Patrik
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
