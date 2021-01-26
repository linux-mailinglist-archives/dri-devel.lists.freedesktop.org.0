Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BCC304409
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 17:56:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E39626E43B;
	Tue, 26 Jan 2021 16:56:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30DD6E43B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 16:56:00 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id f1so13812733lfu.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 08:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IUDDZRZxdmyV3zHbIgFV/f+pJvlpZPQNewiwbQaO6tE=;
 b=lW8J7gdCPRMweOQw8pwNhFi4aRG/l+tBBUD0aanYKeGqx5yQ1nLZ7amwTrNZHy6vU2
 V9wwSXUgUvgm4WHsgQysRp7Qdnkj7lv13RJkpJmXiHgv2vptiA6hb/h3zaYrFtGVwNnB
 wp0favvJMQzNKEyLe/ecQt4MU1Y4BDQ3+CCBSvfEouaXwPVNEjIMQaAm/INI0V4d4EYR
 Euctr81IITXkASr5McZpLWSUZxaj+GPouo/1cYqAlGbcxNNFf46cYkjGnSmBVeBb3I4t
 CHAgzgNNdr4nM29pWXKyRFzV2kGPi9FpD5hWu07RxVRd70ZvB5sgyWWcNPRMllyENxG9
 800Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IUDDZRZxdmyV3zHbIgFV/f+pJvlpZPQNewiwbQaO6tE=;
 b=X6rRFm2zKSO+tcTrOxsrI+vP11fdxGgR+VXUZs4lM5wbEF/Qss9L8qKRWIVG7THvP4
 n8AC3Tl8CBxGcKp9EhduZH9k+VETBsmFNjT1xhzOs9vL05hqoTQIdE61Wxv1KSOsBYQx
 kOVqlN6MvBNASUdmmhtxmp3e9WjwhvWdzCrRePo4/RGPtoxDDeEcSAAxfh6rYYoQZviI
 HkN47dv7ALduMeXjWQ14w2MpG221R7IXqQ4eOrbx9gnuKBHXnawjpZiP+5AFL1Ily9+K
 HYv+lhE5j/dthmQwMKOWzM+GJHevZL2XmdWICnGlXOdTEP3ahrlBzcev4vxhsto3LNO/
 nM5Q==
X-Gm-Message-State: AOAM532QsIt63nhns7/gQriA+tzkoQJfeiy5PJ8mbtzSe7acs8F2z5eh
 eAhk2JQrFDBT67G/dzODAXTyuDUGJ6H1ZepBtt8=
X-Google-Smtp-Source: ABdhPJy9dl1Tk9pVWPFcSjiX8vKJgMaCDnwogfliEKqUrmBFXH5j360/BhKOOcxo7U7KWVqbda7Zg9HYVSXc7AKyd7I=
X-Received: by 2002:ac2:515b:: with SMTP id q27mr2948208lfd.516.1611680158749; 
 Tue, 26 Jan 2021 08:55:58 -0800 (PST)
MIME-Version: 1.0
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
 <CAMeQTsbGBrTvfkz6BStwL240Kz-dbrQVKtXbYkRtbD3OoUKCcg@mail.gmail.com>
 <CAHp75Vc9RAHvTDAw1ryHq_CPRMtjqkzg9081nw0+RPY_yWPJgA@mail.gmail.com>
In-Reply-To: <CAHp75Vc9RAHvTDAw1ryHq_CPRMtjqkzg9081nw0+RPY_yWPJgA@mail.gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 26 Jan 2021 17:55:47 +0100
Message-ID: <CAMeQTsY6k64LUg3DYbi67W6-Gx6znOeJbDfKUhzGt-BxF2BgKA@mail.gmail.com>
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

On Tue, Jan 26, 2021 at 4:51 PM Andy Shevchenko
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
> Nope. It is related to only Medfield / Clovertrail platforms.
>
> There are other (MID) platforms that may / might utilize this driver
> in the future.

Right, there's still Oaktrail / Moorestown with hardware in the wild.

>
> I.o.w. we probably can remove the oldest stuff in the driver WRT above
> mentioned platforms, but leave the driver for the rest.
> I wouldn't be in a hurry with this though, display drivers are easy to
> remove, but really hard to get back on velocity after that.

Ok, I'll have a look at removing Medfield. That code should have been
removed a long time ago.

-Patrik
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
