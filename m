Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D829C30D6D8
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 10:58:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFDEA6EA3D;
	Wed,  3 Feb 2021 09:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651E66EA3D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 09:58:05 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id o63so16952121pgo.6
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 01:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l85f2Tlq2B/Iy2lfM9r3CyfdQrQrcedoJnaBPXo1e1w=;
 b=E2bD/+ZDle0PQTNoiFpVV6f+OFfr0P9L9Th5H54NE9g/GLE8HvdZlM/hfY5g6dMhAM
 zKH0jsMSn8Ajl/BdThXcjmRBt0HyUHstJF0LjfHD8NPnjDN7VolH7Fr2l83Zi2UMWA1Y
 zMjQ2eOvHJnYSt6Q/nkYK3D5dzPrUJBDXjWKz8zj9EIlKAZnGcQn5d/rV2wtmUybw5tH
 l6wsaOIsAGh/tKvhLrF8GOttlDO7TL7EHfAHtEfze2FM0V6e7HfXrpyHLN0ZJBkL+NOm
 5mpEwEstUzBY9aof7hPajJ7sJgroPIdTZCWgUfQAPy177uT21KflTmGAWvLjwa1eF4b1
 qKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l85f2Tlq2B/Iy2lfM9r3CyfdQrQrcedoJnaBPXo1e1w=;
 b=t1MMiij0uF+DrH+6Qic/7DIGLFbAMkSoNJJfte1XAI2FVTjnTSdkmk6q0qPwmDLkrU
 VIWfGXKLB9E+A8AZVqWdPcoZPfFpYTCnFtmbQKL4gf9jIgrs6UJRTNbaYkGkIJJDtBIY
 bUQbFuoj63brcBNR0Q7qd+vxVVXQbaIBgRm8nkNUzuO2u1jK68NT6/4FXXSC2ft5bPAA
 t6UKqHEVZ0ncWX9jE3prHyIDnWUkd2BhpNKSZaLozXI0ShWO+i0aUos4NWG8rDhLHD8u
 +TpMrKkRojCDkLUmQJGaOEnEimV3Ni7uQoZMXDoFxqr2LaMAB6I25sr8nfYdNywvm1su
 KKBA==
X-Gm-Message-State: AOAM532M96pTCbRF+6ecgmQlOdxjcjCiCnLisFg+Gg/hYmB0Oyuim+KA
 bMW4HcVCgKDSQ4RlQkg/boekZP+yKIdTzQeDQGE=
X-Google-Smtp-Source: ABdhPJz8yEMUE2yG9b6/wKdjHnk/Qb62s0Dv2BhCXf9OUrlR2B+OV175zl9NDQj43DHJJBhcrX1VZOeuwQYPucNqtug=
X-Received: by 2002:a63:e50:: with SMTP id 16mr2776546pgo.74.1612346285136;
 Wed, 03 Feb 2021 01:58:05 -0800 (PST)
MIME-Version: 1.0
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
In-Reply-To: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 3 Feb 2021 11:57:49 +0200
Message-ID: <CAHp75VeK1spj4=Zo0xKa4JyhnDkd6aAVPTEPucM6878yoj3ZVQ@mail.gmail.com>
Subject: Re: [GIT PULL] ib-drm-gpio-pdx86-rtc-wdt-v5.12-1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
 Mark Gross <mgross@linux.intel.com>, linux-watchdog@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 26, 2021 at 2:41 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Hi guys,
>
> This is first part of Intel MID outdated platforms removal. It's collected into
> immutable branch with a given tag, please pull to yours subsystems.
>
> (All changes are tagged by the respective maintainers)

Bart, can you pull this into GPIO for-next, please? I would like to
base my PR on top of your for-next with this one included.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
