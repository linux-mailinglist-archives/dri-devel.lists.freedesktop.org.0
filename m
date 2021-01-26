Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F87C3042FA
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 16:51:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F098A6E0A6;
	Tue, 26 Jan 2021 15:51:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B163E6E0A6
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 15:51:02 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id u4so2444384pjn.4
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 07:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e1wIxfZ2pa94U6ERVc2TBu1sPL7/ZYPSJAmu9tbJ7iw=;
 b=fInUUBW/u2yZkKQ9i4u1tJ4c+stOkTJCJtSFcDLZ7m/xs9cZT542Eb2J5XlAOl8xPv
 DtHadV5tMMfxNK6aBMVjHNggIwvNKjBxXQJORTHKRarKVjBMRj4aZ2ZFbdCSu6m/QBiJ
 8WEOou3Sj7ixxzifYtQN/LX5gb98Of28SIfvk8keig14TyEK02m0ZM9sX5KjF+raFYRX
 i9zNWhK5pY/8Qa/Ywd0D5gQzpd6FaQMM6bM69oPwHXiDxOmf7yaNaO9ibFdCQIUWeb70
 PLaqHLpZ9cFYa9GvvdBBgHTZw2e6bySE0pNTApwJTaDkDEd/egu/gBGsb12p/44eYqRY
 gXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e1wIxfZ2pa94U6ERVc2TBu1sPL7/ZYPSJAmu9tbJ7iw=;
 b=U2MMpgBZ3wH98+535ttQ6vvftgoSeB63nyk9+bnbcjNqE23wIcgpxorU3usHgwjNGZ
 DbenMo0F8p5zhLAdfzcXwAPfszTCjG2Le67QV+WmSpExOTz5JfQWWFAk2R6Z1gaD4PZD
 50cjMajMuc23aw9lK/oRfG0FrXAPY8oT64k9aciRLxK9djyY4FE+Od2wSEqOtvtdRwTy
 T4zMVdfvIVhoF19XaIa0lLwlU3+tcgpvlgl4O6RPlcTAEIoY1Q9KpTM3F9JyuRYGaBT5
 8NR6gWEqrHx1LUtjjk/uBnqUMePrCTdYJMJmBPvgpNdb7DlRwe5NRrXqU9WxOVkGFklH
 LAvQ==
X-Gm-Message-State: AOAM533K/yDe5Sw7zpLHGfCe9VysdfRnkDnv5HwOZ9n0EyDY6pBmOMVf
 eqfPQVWs2/6gv/e73oW/ai45aSBCPDss29o/tTY=
X-Google-Smtp-Source: ABdhPJx5glss0sqleRtDBlXmNqPnxXWh5zBE4ZdTKEjL+tUMNHRV8Ts7oKcmyySbHPNP8WfNZVvgavGou2cpAroNDx4=
X-Received: by 2002:a17:90a:c84:: with SMTP id v4mr423673pja.228.1611676262312; 
 Tue, 26 Jan 2021 07:51:02 -0800 (PST)
MIME-Version: 1.0
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
 <CAMeQTsbGBrTvfkz6BStwL240Kz-dbrQVKtXbYkRtbD3OoUKCcg@mail.gmail.com>
In-Reply-To: <CAMeQTsbGBrTvfkz6BStwL240Kz-dbrQVKtXbYkRtbD3OoUKCcg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 26 Jan 2021 17:51:51 +0200
Message-ID: <CAHp75Vc9RAHvTDAw1ryHq_CPRMtjqkzg9081nw0+RPY_yWPJgA@mail.gmail.com>
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

On Tue, Jan 26, 2021 at 5:25 PM Patrik Jakobsson
<patrik.r.jakobsson@gmail.com> wrote:
> On Tue, Jan 26, 2021 at 1:37 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > Hi guys,
> >
> > This is first part of Intel MID outdated platforms removal. It's collected into
> > immutable branch with a given tag, please pull to yours subsystems.
>
> Hi Andy,
> Do you plan on eventually removing X86_INTEL_MID completely? If so,
> then I should probably start looking at removing the corresponding
> parts in GMA500.

Nope. It is related to only Medfield / Clovertrail platforms.

There are other (MID) platforms that may / might utilize this driver
in the future.

I.o.w. we probably can remove the oldest stuff in the driver WRT above
mentioned platforms, but leave the driver for the rest.
I wouldn't be in a hurry with this though, display drivers are easy to
remove, but really hard to get back on velocity after that.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
