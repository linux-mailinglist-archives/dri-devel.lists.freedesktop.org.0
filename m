Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 195F530D6C4
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 10:55:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395336EA39;
	Wed,  3 Feb 2021 09:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233536EA32
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 09:55:10 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id o63so16946342pgo.6
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 01:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+bo/zgaVjQeP7++vzeOAe4Vhz68x/IDfWUtflXKD340=;
 b=O6lYx4v2jphlo088w60X2hiEUW5E/zcyh633GTmFsfaT5i3JtT5bZGKEO+JmqgkcoR
 x16/HDNdVq6+5Y/pMS+FThkXRWulfkixEV51at1SueD+vP2OC4Oxo+jaGxyUvtSThho2
 0HkK4G3dYjHuD7wNvsRY7Fw9BNfgQvVfG/CsEhksnv0V4TmdpVZ/suKPOESKmapOxpFJ
 zdhOD7IKpo2pLYKFX5sZtx5HxpmrPTXNqQjtPp63C8/GZlC/AWx9b+91cHf7ZcOiSlk+
 pmqhd1YxamddduYVXrOogtItXuwa44siN0e2quXllFavSWH6bzIV/EaGKCvW3JkHg59k
 OgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+bo/zgaVjQeP7++vzeOAe4Vhz68x/IDfWUtflXKD340=;
 b=oRWsfpGkP4pfL7nDS5j66LUlgOHb1WLixoArwJ2926YWGwpWNpaQip75FXzQQNRFEu
 FWnJBMGgXxWjKRKxvNrqEJgsAePxSbKMrQd7dPi8Di3gRIxOM+U8m4s7YMTE6INc1WVb
 c0rRZY1EHCF4701BaJSV7TFG5PSyR9RaFMBrAy9raCMopA7Tc2DnlhPTmzT5PAzlP2Xb
 LzCwmFFjJIThahuEy0dSpfzVk7VtbYh2HW8CTsWJRxeCtZW8NC5YYP+jA3ZhZw0x55Zg
 qpFQR/mttQW9YNaBrygW5alVKAIllhmSq8BU2ggZPg202TI8Ev2OukX/xyK8u4FBFTF7
 rG5A==
X-Gm-Message-State: AOAM531jty2DInJvN6+4/eINGOA5JZFcR88KXmZHHd8xHQR+xzWOMzfG
 6d2bQYPgQJ0dI5azYx0JKKUV4pmZ29dFus+phWQ=
X-Google-Smtp-Source: ABdhPJxELw6TjyxQIIVK+eBpxR00dR7Zy9TYfwhTJoq2bK39kzfeWtfoP5QIJmXXcm7/0q3ZJfdqsSfEpedo/Np5TNw=
X-Received: by 2002:a63:e50:: with SMTP id 16mr2766950pgo.74.1612346109732;
 Wed, 03 Feb 2021 01:55:09 -0800 (PST)
MIME-Version: 1.0
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
 <886bbdc0-3391-2140-a2d4-1688b262966f@redhat.com>
In-Reply-To: <886bbdc0-3391-2140-a2d4-1688b262966f@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 3 Feb 2021 11:54:53 +0200
Message-ID: <CAHp75VeFvwE64zX8Wu8XvMMJ6vgxAaoYpvH2rJ_FD3CCnFZNHA@mail.gmail.com>
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
> On 1/26/21 1:38 PM, Andy Shevchenko wrote:
> > Hi guys,
> >
> > This is first part of Intel MID outdated platforms removal. It's collected into
> > immutable branch with a given tag, please pull to yours subsystems.
> >
> > (All changes are tagged by the respective maintainers)

> Erm, I already have this 2 in platform-drivers-x86/for-next since you said that
> these 2 could be merged independently.
>
> Anyways I just did a test-merge and there is no conflict, so everything is ok.
>
> From my pov this looks good and I plan to merge this into platform-drivers-x86/for-next
> before the merge-window.
>
> I'm going to hold off on doing that for a bit for now in case one of the other
> subsys maintainers has any objections.

Any news on this? Have you pulled it somewhere (I don't see it in Linux next)?

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
