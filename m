Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5CD3E13ED
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 13:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3DC6E9DE;
	Thu,  5 Aug 2021 11:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744B46E9DE
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 11:31:15 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 s22-20020a17090a1c16b0290177caeba067so14039079pjs.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 04:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1EBdlg+wpGirHMmu5NpOXKP/wpVDNvTG7/9oMG8+2TA=;
 b=T79QxJMtJoS/ivMj3isDIYFd3/N4RCbbexFX0t1h5SX7XCPJG6tVru285TppZwWOPr
 eLuiWgak/SzvfxCMeG4cPfdLrPhJqkei5DRf6ZfGgL9tMjJQUU38jij0zr3xLU9j28GH
 wxfrOOBirApBfwqn3CSRucedRnCy4DrbFvNCcuCVWrZTZGGI0aVTm2TaHqUgjtJ+3/B2
 o31M0RBmSU/3x1RSNNGpOTtPvljeBXNQA+T3C1RHfEAJiEwBKlcRs9swRZXo1g/mYEAb
 0E8+4cxeJ9g6UfZ3uLjnb3l6p4N2oyMhLblsE4yoUBW/dejL05N4IYqb4X0fwpxGMZhh
 CqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1EBdlg+wpGirHMmu5NpOXKP/wpVDNvTG7/9oMG8+2TA=;
 b=JNAbkxEQX1X5JlOE+P2gwfjkUSeUrNRj+uGugEgNFcKhp1QYiM4omSnR4bXrhYEtP3
 c4Z5FexoqPwmJ16/8py5COMZbEgPYWyAdZxyMZWcdyUiUKNZ2tA5Dw+8ra61qAbMHNXv
 D/5+XVxkb7IdVXb69PyJvtxfqLjLCMmSgZh6S6V+aTgZW2xY5c7MftBXk6+08ToCTPDo
 4y4scbZVlIrra/yXpdRInmzOwqLeS7/uRIOiB0Ye3QZ/OjHIa+ejqMXIGQZng6JAiPcY
 /T8gOqkLnZOBNTCf7PeROtuDge+MBVsMfBqx/zbhMfTzGOtqYNqGutS2g3ChrtOJk7iP
 mRZA==
X-Gm-Message-State: AOAM533txY1Z1lK3A6tPIAnsQs83VwBng+OjSF7q07j/fpm5YFc64MdW
 +Q/s3e4RiQRHss5R2eaum3+YSR5X5HreLlpACUg=
X-Google-Smtp-Source: ABdhPJycCBqrY8XWLy+kVBb39vmiLH0ofV3jMCfOLQaWBv1ztWFo31bVO/8lk7CARMZbV+WTkAuumbYsSupxETjz690=
X-Received: by 2002:a17:90a:b10b:: with SMTP id
 z11mr14989609pjq.181.1628163074988; 
 Thu, 05 Aug 2021 04:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210801085155.3170-1-len.baker@gmx.com>
 <CAHp75VcD_Kqedpkw-Pj+uQbWqdu_9FhXqJS5TuGUPoVv2x45-Q@mail.gmail.com>
 <YQvJB5s1zY2yO87D@kroah.com>
In-Reply-To: <YQvJB5s1zY2yO87D@kroah.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 5 Aug 2021 14:30:35 +0300
Message-ID: <CAHp75VeUH3+dZ6scREA-sZz8-7AF_MLobde+2-eZJz=MsxaW0Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Remove all strcpy() uses
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Len Baker <len.baker@gmx.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Phil Reid <preid@electromag.com.au>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 linux-staging@lists.linux.dev, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 5, 2021 at 2:18 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Sun, Aug 01, 2021 at 02:40:40PM +0300, Andy Shevchenko wrote:
> > On Sun, Aug 1, 2021 at 11:53 AM Len Baker <len.baker@gmx.com> wrote:
> > >
> > > strcpy() performs no bounds checking on the destination buffer. This
> > > could result in linear overflows beyond the end of the buffer, leading
> > > to all kinds of misbehaviors. So, this serie removes all strcpy uses
> > > from the "staging/fbtft" subsystem.
> > >
> > > Also, refactor the code a bit to follow the kernel coding-style and
> > > avoid unnecessary variable initialization.
> >
> > I don't see patch 3 (even on lore.kernel.org).
> >
> > Greg, Geert, does it make sense to move this driver outside of staging?
>
> If you clean up everything that needs to be done, yes, please do.

Do we have a clear TODO for that?

The current one has the item which is not feasible to achieve in
reasonable time. Some of those drivers won't be converted to tiny DRM.
So the idea is to keep this out of staging in the maintenance phase
(as it currently states, i.e. no new drivers accepted).  For the rest
I'm not sure what else can be done (checkpatch? coccinelle?).
Actually the first sentence in this paragraph is a motivation for
moving out of staging.

-- 
With Best Regards,
Andy Shevchenko
