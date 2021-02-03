Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D5E30D95F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 13:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870DD6EA60;
	Wed,  3 Feb 2021 12:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5076EA60
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 12:00:10 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id q131so16484046pfq.10
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 04:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8Q1P72jDkAiYrJpjzWAvpbntKoausolrxBiuy4JKYsU=;
 b=fDrx5Or5VRpfg0J7QHIKpfwG6BvxR2ERJWWHPjDfAaUejJVu1+Lphwm60HsVkuikLe
 e1sHT1hZMPRRZ3ovKgUGew1dkaqdw4pBNiPnmB8yen/BctrP7HnMPXz/SbdK+Dp9x7vW
 uPEYy2kznc4sybpKeRDjxyxaQgKUyb1Th9jiUpN7xJz2FGsasLJTXsT/vwA1NLWNzLJ+
 KAcSG8Q5GXuMvXhOcivvt2fglEyHG2Ld6dZ1ym2InitH+U9vX2IJhgtkpeBWVRZsOpOO
 dIpO0eQT9n283bMo/cN/iky+WD/FJi9DKoYX4aVStwDqZBZGFD3PCKQU9hsDwSdU36Ya
 L01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Q1P72jDkAiYrJpjzWAvpbntKoausolrxBiuy4JKYsU=;
 b=KvS2PjouliYf4fGZnA+hvQUAbahIlIblGXASeijNudZ9OtPFIYoO19FOjwo7neuj6q
 JX2PjG3F65yWjSclmrJYoD3WWkp/007xPgy9HzQku1XLAhzBV2X29jLNqAopoQf5H4HR
 pymxkAK5u410tOwM4y5szlVMDuVIRW5Q6d7ZYcEOUBV2GPFa14SCFR2KJu+lmHqWktkH
 EWAnV0Rq6yO6eZ+Ku+PDSbF7i8RvUwP9cZ21h59j3lvO9D7irlomyVgZCokJ7aqji0Xc
 KNPF728pGaME4b72D/c+fwz3WmbeNIoy3RdroCI5yna3drmf+Lf8Ih8IP9Ib1xLgKXZX
 G+cg==
X-Gm-Message-State: AOAM53383fAbTUQ5+IzBkp4qJfL78Leou/pXRpweHRTfZqnZkfI5DMBK
 7hva2aMbqJagUcuoMv5q5HOGrMuAfBCQcRjc74s=
X-Google-Smtp-Source: ABdhPJwMYgHV+Be/xu9zUBwCMnm5ihAYrPPMqvnQFLvWfX6DEWf/Ni/nWT3r+LTx0J8aXQZzhafNyDhVWll2iLr9nUU=
X-Received: by 2002:a62:5a86:0:b029:1ae:6b45:b6a9 with SMTP id
 o128-20020a625a860000b02901ae6b45b6a9mr2753818pfb.7.1612353610466; Wed, 03
 Feb 2021 04:00:10 -0800 (PST)
MIME-Version: 1.0
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
 <CAMeQTsbGBrTvfkz6BStwL240Kz-dbrQVKtXbYkRtbD3OoUKCcg@mail.gmail.com>
In-Reply-To: <CAMeQTsbGBrTvfkz6BStwL240Kz-dbrQVKtXbYkRtbD3OoUKCcg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 3 Feb 2021 13:59:54 +0200
Message-ID: <CAHp75VeYroY5uG38NrsqwbHnjT0j_LMMD3JmNmRED3OY5ff7xA@mail.gmail.com>
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

I have noticed new commits in DRM against GMA500 and it seems now in a
conflict with my immutable branch. Are you sure you don't forget to
pull it?

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
