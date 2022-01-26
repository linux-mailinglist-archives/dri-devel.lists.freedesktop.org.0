Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DD649C706
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 11:03:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5868B10E5C3;
	Wed, 26 Jan 2022 10:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A98710E5C3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 10:03:14 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id w14so15235735edd.10
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 02:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=88bX5phc4QD5WEP/ZiuDpl6z06FPpsvQ8tmIbTmmvfM=;
 b=JOOHPlvVkJI+l+SLmq8YHGPbVPhSP3jpctav1+zJyTBAuPq51FLOHTC6iu25uqbpk1
 gZ8UPPYNfw73crMI36sEKutbnpdbV1g61rwjWNBVY9SZ5PRXhNz2IMQqIcUw4mOIaHCh
 mwiQbl8mGpViRBfEgExjk48q+7kftZCnX5g4JrcCwTk4KwDkiv5ZN+RoSdz0xCCFTivp
 WTxX/fc1xqEDI6EXkK8niYFj0CUFtj9xsSS0vYAWk7c7FC9FpOJ0g8e2ZVQWwnMO+80a
 GC0uDztgNMPagLsCnlVtvAWVXh/fsxIS3JswqES6Y1jwWtcAc/HuwC7Iarha0ZnNGrKo
 3mKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=88bX5phc4QD5WEP/ZiuDpl6z06FPpsvQ8tmIbTmmvfM=;
 b=dcWXOqDRYgP0nsJNrQAgNOhqxc6sVt6gGWxRQ80kbEhc2WMqxR6Epri9YOBPq3F5qK
 Kkoiobkl1EpKrobtvRG6mqr2h8klIqPd/cYhXPkaQAQXwaE54WvKoa/cc7fnzC/q/NXQ
 MumFSJ4ZQZ57OEUqwne1G9JQmt4WDN/YRzuwXymKtqciBapyqjvGqBmnkN4jqpmuUSER
 Kg8LrOzsVTMRzHccCk0qLcWkP0EhrCVOwP8BY9xuY5QdZS7kUMZaHULZwyixwKqnOGnQ
 NSQuONceJRh+YG+6r2DoPMlTif7pUcUNhLLWMIFqudvlRYTM1bric+kAbS0c0cZV4daV
 hgpw==
X-Gm-Message-State: AOAM5333u2X/4DFlkkRqvxma+e5S0Zhe8FOCgJ73bloDhoA+kvYxMBAS
 B0cJ9Zqvl1Jh3P9ANcbWfrcugEpnOgSaY0w9OAI=
X-Google-Smtp-Source: ABdhPJw72+G5oWbFGdfMsLrwcGS/NyTH58SB7avPo0MWV7s1x0/JTHE5M0LGJ1I+tXGIVrnFSz5eE4YPZHT8G6BfGm0=
X-Received: by 2002:aa7:cf0e:: with SMTP id a14mr24216028edy.296.1643191392761; 
 Wed, 26 Jan 2022 02:03:12 -0800 (PST)
MIME-Version: 1.0
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
In-Reply-To: <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 26 Jan 2022 12:02:36 +0200
Message-ID: <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>,
 Carlis <zhangxuezhi1@yulong.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 26, 2022 at 10:52 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 25.01.22 um 21:21 schrieb Andy Shevchenko:
> > Since we got a maintainer for fbdev, I would like to
> > unorphan fbtft (with the idea of sending PRs to Helge)
> > and move it out of staging since there is no more clean
> > up work expected and no more drivers either.
> >
> > Thoughts?

Thanks for sharing yours, my answers below.

> But why? We already have DRM drivers for some of these devices.

No, we do not (only a few are available).

> Porting
> the others to DRM is such a better long-term plan.  OTOH, as no one has
> shown up and converted them, maybe they should be left dead or removed
> entirely.

As I mentioned above there are devices that nobody will take time to
port to a way too complex DRM subsystem. But the devices are cheap and
quite widespread in the embedded world. I'm in possession of 3 or 4
different models and only 1 is supported by tiny DRM.

On top of that the subtle fact people forgot about FBTFT is that it
does support parallel interface (yes, I know that it's not performant,
but one of the displays I have is with that type of interface).

P.S. For the record, I will personally NAK any attempts to remove that
driver from the kernel. And this is another point why it's better not
to be under the staging.

-- 
With Best Regards,
Andy Shevchenko
