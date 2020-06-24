Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB0220762C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 16:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A0F6E0C9;
	Wed, 24 Jun 2020 14:56:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9184A6E0C9
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 14:55:59 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id r8so2066693oij.5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 07:55:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+sk9R2kZOJxwPKjhGy5eQURJ6u1u2IjgStnunJ+u8Vg=;
 b=FZP4uyJU2mtT5FdFmLH7hkxw9LvJV1svXgD9gZSWY2zipDlsN6NLvFD5fktZRTMs1j
 x3BxI52F1bbYZX6F9Xy+6Io6mGevHhqAnonyZIz5+UggGlVoLnJGua5/fC9lE8TIWsTp
 AgTXZaaeSFT1nIQQ8Pq7Gp2h0zLApQDu8mtiOpFQss1DfOPp0xK1jL6GtXA9VOjNDFhw
 hv7ID9vMupnogrxSl86M8/ZUZIhut6XYAl0Yo2p0dwC0AygpBvsCMZUIEWNy6Z36Q1UJ
 B7ud+sg4OL2NuuHlcSSPHoGDlkaUMCl/gkbm2NlrfoyXMD6PsAaZqHK/ocPV4QAQT3m+
 t2Jw==
X-Gm-Message-State: AOAM530fZ9JIlJ3mWcjzFrwLiCRkHtl8yVdfsYbMGLjc/FvMQH9sDz9G
 uxL/A8zvtLSvUrceT6G58nmZrVcMBx6HtVQgVJ0=
X-Google-Smtp-Source: ABdhPJzTeOBdPMvDRCz7RJI7KYiAeYGV5KLYB14SeNajPpHs7iz64SW8yis8WWbLDg2GfSHkl+OTc/iGJIpmOpN8/0g=
X-Received: by 2002:a05:6808:99b:: with SMTP id
 a27mr2709013oic.68.1593010558890; 
 Wed, 24 Jun 2020 07:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200624114136eucas1p1c84f81b1d78e2dbad7ac1b762f0a4b4f@eucas1p1.samsung.com>
 <20200624114127.3016-1-a.hajda@samsung.com>
 <20200624114127.3016-4-a.hajda@samsung.com>
 <CAJZ5v0i7mU3dGGZv3sUwG2_2OCRP3=bPB7a8sstj0qLwmiwhog@mail.gmail.com>
 <345c10ba-b047-3ef4-0129-0ef494c8f812@samsung.com>
In-Reply-To: <345c10ba-b047-3ef4-0129-0ef494c8f812@samsung.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 24 Jun 2020 16:55:47 +0200
Message-ID: <CAJZ5v0gGaAgjJ_xc6etE-e_ctOiWOmbE6=P4Sb80vS0VZi39pQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v5 3/5] drivers core: allow probe_err accept
 integer and pointer types
To: Andrzej Hajda <a.hajda@samsung.com>
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
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 24, 2020 at 4:44 PM Andrzej Hajda <a.hajda@samsung.com> wrote:
>
>
> On 24.06.2020 14:14, Rafael J. Wysocki wrote:
> > On Wed, Jun 24, 2020 at 1:41 PM Andrzej Hajda <a.hajda@samsung.com> wrote:
> >> Many resource acquisition functions return error value encapsulated in
> >> pointer instead of integer value. To simplify coding we can use macro
> >> which will accept both types of error.
> >> With this patch user can use:
> >>          probe_err(dev, ptr, ...)
> >> instead of:
> >>          probe_err(dev, PTR_ERR(ptr), ...)
> >> Without loosing old functionality:
> >>          probe_err(dev, err, ...)
> >>
> >> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> > The separation of this change from patch [1/5] looks kind of artificial to me.
> >
> > You are introducing a new function anyway, so why not to make it what
> > you want right away?
>
>
> Two reasons:
>
> 1.This patch is my recent idea, I didn't want to mix it with already
> reviewed code.
>
> 2. This patch could be treated hacky by some devs due to macro
> definition and type-casting.

Fair enough.

There is some opposition against the $subject one, so I guess it may
be dropped even.

Thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
