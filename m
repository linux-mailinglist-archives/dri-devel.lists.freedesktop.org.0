Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D372073D6
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 14:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9636EB31;
	Wed, 24 Jun 2020 12:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35136EB31
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 12:56:10 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id d10so1033780pls.5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 05:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BudWo05ArRmRePLjA5xBNrNmyyzvRBGhzbvJwLCnkH0=;
 b=VovrAuXblBSTzq/6/XfemWZFoVjtapdBL6Wz1qU3Phgj++1U+GZ/hPAjZJP47h5hUi
 YQ/jkQ4l++Nn5DV1sG3GyQ/cxt37cIN49uMWF3Q0AFZpiHGMrUdmEnDK7DDcuKj4y2xA
 zM/tKFhuy/DLuPAj0FBsgEt4P9Po08dQxDQvTwUN+OzfAcGuW2GlVNzOkUbAlE5wqHij
 WdCzPRHrwIjOwaeA+n06Na5N/FyaVipSNKG+gG18MtoC4490gFP5fa/UYsnf9ydXTcpi
 IL78By7AvuimCTAqJ/f39CPa9CJXlp96nEtVQNCpYR9cHuG2/HCdx4C2FcqJ9SG5w248
 gvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BudWo05ArRmRePLjA5xBNrNmyyzvRBGhzbvJwLCnkH0=;
 b=NUIfVDxzxY2lPhhxoGr7UPXuGtZTo98TAK3q7VrEhUSR2WxDU4fXEizuuvO9jjPWQo
 1O+QNJxF1h6V/zzt4N9EXMRLZeFKkZbTf884y/4/3mDXZhfHUYzir9t/EUeJYNkYGWCF
 khm9sZMvhi1u+VsyKoXWYqJddc3/iuzGKHLSkBbJ5KKIJrSZfOYd1j9bP82grKN5cwx5
 jtFVxQ24hPQsXN4qnywkyqpaB2b+WzKLVjEsOokwSesnQJeUZH4+8RxrsGfP5MqN6LRh
 +me+guKkqUhU9b38Fgi2Ni7bskrbmlyIvGu4M8wJ/Cz0bfTYlOjV41LjEOw7OgYiM9gN
 h4Qg==
X-Gm-Message-State: AOAM532WyOZI6y2RRHHAPVM2qRF8rI5TNQ/3M+/0HErksDOf/adn5EKa
 +lUzWeohHmkjxh+LOoJT7S0gzCUvah25aJuT4IQ=
X-Google-Smtp-Source: ABdhPJzRZKLEpWyeo/NoFUWrW4UU840RrPrJNsza9FDRmLTNMxPJHwy89VbbjHRpQ0HUrfYBNXlqYSSKeR87YQva7nE=
X-Received: by 2002:a17:902:b206:: with SMTP id
 t6mr27559277plr.262.1593003370435; 
 Wed, 24 Jun 2020 05:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200624114127.3016-1-a.hajda@samsung.com>
 <CGME20200624114136eucas1p1c84f81b1d78e2dbad7ac1b762f0a4b4f@eucas1p1.samsung.com>
 <20200624114127.3016-4-a.hajda@samsung.com>
 <2203e0c2-016b-4dbe-452d-63c857f06dd1@arm.com>
In-Reply-To: <2203e0c2-016b-4dbe-452d-63c857f06dd1@arm.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 24 Jun 2020 15:55:57 +0300
Message-ID: <CAHp75VfpP1cGK3FvTL0hBudRY2N_7GpXYRuUHUCipz7X2sMLmQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v5 3/5] drivers core: allow probe_err accept
 integer and pointer types
To: Robin Murphy <robin.murphy@arm.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Jonas Karlman <jonas@kwiboo.se>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 24, 2020 at 3:37 PM Robin Murphy <robin.murphy@arm.com> wrote:
> On 2020-06-24 12:41, Andrzej Hajda wrote:
> > Many resource acquisition functions return error value encapsulated in
> > pointer instead of integer value. To simplify coding we can use macro
> > which will accept both types of error.
> > With this patch user can use:
> >       probe_err(dev, ptr, ...)
> > instead of:
> >       probe_err(dev, PTR_ERR(ptr), ...)
> > Without loosing old functionality:
> >       probe_err(dev, err, ...)
>
> Personally I'm not convinced that simplification has much value, and I'd
> say it *does* have a significant downside. This:
>
>         if (IS_ERR(x))
>                 do_something_with(PTR_ERR(x));
>
> is a familiar and expected pattern when reading/reviewing code, and at a
> glance is almost certainly doing the right thing. If I see this, on the
> other hand:
>
>         if (IS_ERR(x))
>                 do_something_with(x);

I don't consider your arguments strong enough. You are appealing to
one pattern vs. new coming *pattern* just with a different name and
actually much less characters to parse. We have a lot of clean ups
like this, have you protested against them? JFYI: they are now
*established patterns* and saved a ton of LOCs in some of which even
were typos.

> my immediate instinct is to be suspicious, and now I've got to go off
> and double-check that if do_something_with() really expects a pointer
> it's also robust against PTR_ERR values. Off-hand I can't think of any
> APIs that work that way in the areas with which I'm familiar, so it
> would be a pretty unusual and non-obvious thing.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
