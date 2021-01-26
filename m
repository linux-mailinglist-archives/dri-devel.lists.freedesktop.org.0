Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6AD304AA9
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 21:53:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434D56E441;
	Tue, 26 Jan 2021 20:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0D36E441
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 20:53:25 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id g3so10464455plp.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 12:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rbiGPK10hMkVPDroKMLJ5oV5M7XFgnNXGS2BK8hWuOo=;
 b=rn/iGPtlK1tCt3ZcyGP0CCdw67MmANd7aV9K8V8aeKMW0OCHolf5rM2iIe3r4DjsNZ
 F2fnJ6AdLLZDovpjn78dQoAwggG434OjHr5DX8MOMH7+Vl/IPf5JiUKCtosaapLQlE5Y
 woQ/JsbLBBtAD/Q5HH6Xv3+NbWnByvdyZYrTsvi3vOD9YvZpTS7ffThCt9h0I79+HV+r
 b/uEZSTH2DnvGIsEOObtjToqzcJZUUYNqmjR4Yt0w2cR9OdaBdi4O9fNBq7dohr/2tLW
 zM6jUprpc/hFKn6hHnZiyRKWcD6SprVWgRYGxGKRTAmGJxOlkCdfcAsr1j89x+5wiViQ
 Khcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rbiGPK10hMkVPDroKMLJ5oV5M7XFgnNXGS2BK8hWuOo=;
 b=qyDWbezC/hV2UDFEDLoEUfKYZ3CnWFfUxcVnZlBBTJjFLfjK3oh8uu/MB9a36KgOtz
 o046k9IOWARdJOxAUM4inUjnLj6CpU+QEpeOI0/NDmYIO47Y0ccTAZRUd5PyU3RosVDv
 s9+EcwumiKzJ/AEKXoY4TPeKpV9WI5IshWXOK4Q26qg/wl1wk9FIbuw0+HJUx/cWlX2L
 clNBiX8imKmYeOAJNLAr2x6/qBhi6QWxKlhXKrUTir/1oPXW+vmUqPFGLOb4rs3u6yTe
 4UduO0RcqeYNST4FWJhmfk6LZbDDhilHIKkxZMRySSDN28MCjcL4DH6rJXK+xLXGogwk
 kAfw==
X-Gm-Message-State: AOAM533OTnFNyDLfhtWe5UHU3eEGfM3jc1nLbQ65wgv9l9KLeBywZI7m
 XSHMtov2Mgb5I8MFJybwidB9dbd9PrU3P0HS73k=
X-Google-Smtp-Source: ABdhPJwJydNn/+NYM8T4H1FZKTUZv+sFSaTn9sxHcmr1VIRqWPJz3yxipJEpIX89bzwIqva5/GylV4FLSr9ScI9Y40k=
X-Received: by 2002:a17:90a:ca98:: with SMTP id
 y24mr1713563pjt.181.1611694405124; 
 Tue, 26 Jan 2021 12:53:25 -0800 (PST)
MIME-Version: 1.0
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
 <CAMeQTsbGBrTvfkz6BStwL240Kz-dbrQVKtXbYkRtbD3OoUKCcg@mail.gmail.com>
 <CAHp75Vc9RAHvTDAw1ryHq_CPRMtjqkzg9081nw0+RPY_yWPJgA@mail.gmail.com>
 <CAMeQTsY6k64LUg3DYbi67W6-Gx6znOeJbDfKUhzGt-BxF2BgKA@mail.gmail.com>
 <CAHp75VdKxARQAyyTd=ZcaoER1iF6Mk4AS1Dn6U9VCjt_D_+q8A@mail.gmail.com>
 <3b4c2f63-14e6-5041-3c15-c2d65b229269@redhat.com>
In-Reply-To: <3b4c2f63-14e6-5041-3c15-c2d65b229269@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 26 Jan 2021 22:54:14 +0200
Message-ID: <CAHp75VcEq4thOub+k5rDR61KZX4jCZj2zJr2OqsdedmpSB64KA@mail.gmail.com>
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

On Tue, Jan 26, 2021 at 8:33 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 1/26/21 6:14 PM, Andy Shevchenko wrote:
> > On Tue, Jan 26, 2021 at 6:55 PM Patrik Jakobsson
> > <patrik.r.jakobsson@gmail.com> wrote:
> >> On Tue, Jan 26, 2021 at 4:51 PM Andy Shevchenko
> >> <andy.shevchenko@gmail.com> wrote:
> >>> On Tue, Jan 26, 2021 at 5:25 PM Patrik Jakobsson
> >>> <patrik.r.jakobsson@gmail.com> wrote:
> >>>> On Tue, Jan 26, 2021 at 1:37 PM Andy Shevchenko
> >>>> <andriy.shevchenko@linux.intel.com> wrote:
> >>>>>
> >>>>> Hi guys,
> >>>>>
> >>>>> This is first part of Intel MID outdated platforms removal. It's collected into
> >>>>> immutable branch with a given tag, please pull to yours subsystems.
> >>>>
> >>>> Hi Andy,
> >>>> Do you plan on eventually removing X86_INTEL_MID completely? If so,
> >>>> then I should probably start looking at removing the corresponding
> >>>> parts in GMA500.
> >>>
> >>> Nope. It is related to only Medfield / Clovertrail platforms.
> >>>
> >>> There are other (MID) platforms that may / might utilize this driver
> >>> in the future.
> >>
> >> Right, there's still Oaktrail / Moorestown with hardware in the wild.
> >
> > Actually Moorestown had to be removed a few years ago (kernel won't
> > boot on them anyway from that date when Alan removed support under
> > arch/x86 for it).
> >
> > I'm talking about Merrifield and Moorefield that can utilize it and
> > also some other platforms that are not SFI based (Cedar something...
> > IIRC).
>
> Yes at least there are some 64 bit capable SoCs with GMA500 which were
> used in NAS like devices. These NAS-es actually have a VGA output
> (and maybe also DVI?) which is attached to the GMA500.

Since you are talking about 64-bit, definitely they are *not*
Moorestown, Medfield, Clovertrail since the mentioned never were
64-bit. But it would be nice to see the CPU model number to be sure.

> I know people are running Fedora on these, so we should at least keep
> these supported.

Is it possible to gather the CPU model number from them? (Or at least
the exact device/box name)

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
