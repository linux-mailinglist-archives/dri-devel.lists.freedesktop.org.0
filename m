Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DF21D7344
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 10:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB1016E126;
	Mon, 18 May 2020 08:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B676E126;
 Mon, 18 May 2020 08:49:18 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id m18so2186227vkk.9;
 Mon, 18 May 2020 01:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p8GaXNISpBU56tinwWEgmNwxx/8bwcx91Qa4//hCnFs=;
 b=Kph2ozsXLRPRu/dxLis1gDJmQZnJwAwLoC8AGDFvqAspAd55fLvrgyopC/YJwXexGO
 WZFLrskkt5/tormgb0wpKJP9O0JanDZ+XYw94xSKhjgRtSmtM98dhK1gMns+g9z6ecmI
 ddXDNmX89hRR11bx5uJYC52OO6sZTtSk3HpPOqw/AflsIAOoO3qBDYcTZZsZ3xjHCIPY
 vgGvvyEZ8bv2W3K/pH05Q+Z5XB5TE7ZiL8vv/m8NFrwJmNEgxje8q76l3iPx27X1d/i1
 Y3aX4gLXv1IF2JTmF466SLgWFIXDCjcy/BFcbR0vccGm6+57ELeMwwIw9m5EWwvEu7rv
 qjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p8GaXNISpBU56tinwWEgmNwxx/8bwcx91Qa4//hCnFs=;
 b=oPHdjoW9h56yG2VTfh42F95t+iAbvfW9gOdJPjyw3ymGdiMjLDRjAiecQP1tWn7oIN
 lyOAbsJxV69HMLQR1+nm2bIvsFAM75JLz5h0iXJgdf557lovlGZHzssOUpP8qtcAGFAT
 lSN9YncIZMqBf2av+x681eLcPycbCZH+t7Lj+xtYdtiy7dUi7lcUMCjvoDr14wayJjf8
 PP4mT1zCwzvLqdRYzUn5X+F/H6DmISjYW5q9/pZoIGe1ixS/LjF6XhgtY+pVGl3wI8Oe
 pX6eSPhdKl6hPRwCh4mn4nSFM4po62DUvN/EWmGOupZ5WF7JJk8o3UNou4TM8vAmb+HY
 75pw==
X-Gm-Message-State: AOAM530nymUo7trmvm60kW30UojxtlqAFNn8Tel3jcO9QGotCYP2rrso
 8xBAaQFgCwWX6NxSiMHI4LPwoku5zgf2dlBbP8I=
X-Google-Smtp-Source: ABdhPJw9/ty9sw1NZG3ECF+G8Anz7+Swnxt4WzKMd2QN8sUNskUcTmNMvE75R92q4PwRaGH3bTqKFFFDvBAcwkG/wVg=
X-Received: by 2002:a1f:24ce:: with SMTP id k197mr10159979vkk.13.1589791757909; 
 Mon, 18 May 2020 01:49:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200511123744.96246-1-christian.gmeiner@gmail.com>
 <79f9e841042bf1c0fca39366d95cfb6f74da07bd.camel@pengutronix.de>
In-Reply-To: <79f9e841042bf1c0fca39366d95cfb6f74da07bd.camel@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 18 May 2020 10:49:06 +0200
Message-ID: <CAH9NwWe=8AUBaR=05ZEZHDMrD1wW5wkpx85a=8UEmo24q8VTzg@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: fix perfmon domain interation
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: David Airlie <airlied@linux.ie>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

Am So., 17. Mai 2020 um 14:03 Uhr schrieb Lucas Stach <l.stach@pengutronix.de>:
>
> Hi Christian,
>
> Am Montag, den 11.05.2020, 14:37 +0200 schrieb Christian Gmeiner:
> > The GC860 has one GPU device which has a 2d and 3d core. In this case
> > we want to expose perfmon information for both cores.
> >
> > The driver has one array which contains all possible perfmon domains
> > with some meta data - doms_meta. Here we can see that for the GC860
> > two elements of that array are relevant:
> >
> >   doms_3d: is at index 0 in the doms_meta array with 8 perfmon domains
> >   doms_2d: is at index 1 in the doms_meta array with 1 perfmon domain
> >
> > The userspace driver wants to get a list of all perfmon domains and
> > their perfmon signals. This is done by iterating over all domains and
> > their signals. If the userspace driver wants to access the domain with
> > id 8 the kernel driver fails and returns invalid data from doms_3d with
> > and invalid offset.
> >
> > This results in:
> >   Unable to handle kernel paging request at virtual address 00000000
> >
> > On such a device it is not possible to use the userspace driver at all.
> >
> > The fix for this off-by-one error is quite simple.
> >
> > Reported-by: Paul Cercueil <paul@crapouillou.net>
> > Tested-by: Paul Cercueil <paul@crapouillou.net>
> > Fixes: ed1dd899baa3 ("drm/etnaviv: rework perfmon query infrastructure")
> > Cc: stable@vger.kernel.or
>
> Missing last letter of the TLD.
>
> > Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
> > ---
> >  drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> > index e6795bafcbb9..35f7171e779a 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> > @@ -453,7 +453,7 @@ static const struct etnaviv_pm_domain *pm_domain(const struct etnaviv_gpu *gpu,
> >               if (!(gpu->identity.features & meta->feature))
> >                       continue;
> >
> > -             if (meta->nr_domains < (index - offset)) {
> > +             if ((meta->nr_domains - 1) < (index - offset)) {
>
> While the logic is correct, I find this quite hard to read. A more
> idiomatic way to write this (which is much easier to grok when reading
> the code IMHO) would be:
>
> if (index - offset >= meta->nr_domains)
>
> If you agree, please send a v2 of this patch.
>

Works for me - will send a v2 in the evening.

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
