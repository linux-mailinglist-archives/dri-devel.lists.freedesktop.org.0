Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0725173574
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 11:39:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D916EF20;
	Fri, 28 Feb 2020 10:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C02C6EF20;
 Fri, 28 Feb 2020 10:39:18 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id c18so1622886vsq.7;
 Fri, 28 Feb 2020 02:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IVkeix1fcnYZXRBUxfNVTT56PIOklSoyZMm+hTUJTz0=;
 b=Ameog9Zplz9fAzkjb6NxOLgSMttnlM8uqXZaWcCJ1N+7pd6rAmQgf1NkyDX0hZOt3T
 wWV2Xrl+rAqWG8MwHYmsMGLU4pB4suuNd06Ev9ZeFjdo3oxqO40wHYIoR3qw2MNWRo/K
 UCFlIxe9qUeFjcFgfwUShKXmY8xiI0/srqeQ/W279OjO4bcsX7SpbqBh24dNwiDt++aL
 zmHJ6n7Th3+Eqfh2JJ5xVp0GS1UATfwzqohFkVaDFNsqV6591Eap7TtCPbvqwqeSMFhu
 8wxA/A2lAHK0xqRohlG4FBFOIRxWAtjchpgAso7x67VHxq8QpeHBqRnXNb80rchhR3uM
 BfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IVkeix1fcnYZXRBUxfNVTT56PIOklSoyZMm+hTUJTz0=;
 b=c5oV4+dYPavWVsq7BT5r7qlAC9XrGysr7mO86li6jDlqNR8LTrSPSvFdyhmaTiSzzi
 MJbEvuccfp+m5DgfoUHWOx1k7C/S/f701sBlStfhzGvJ/C/4tgxxoM+hhffeG35PLoVi
 jAGfhu2WVmfIUGE+zoqgaMoWhP6RCRlnMpHIaLAp6CuielULyERKASkRSmsl9fzqKMl/
 N6VxCHr0NdItZ4+b9AhdPX2fSjQHkfZRe4q/uCtaavJL0dpOYD/SjzIcUOlpUNTIQWDK
 ttxVm7Px2jHF7pmPZcWdkSDAjdhg0X/WiRfD321vQRfRFsGGEF74gm6A/OoQwEUf1ryw
 KWlQ==
X-Gm-Message-State: ANhLgQ2J+Rx5oR8K9iTuxpeN1QeVITGmFDnsKmCG4LU15tZAZdl+AhZi
 WuJKn7ki23aw4jHkgTLiC49jsMGQqmug3+u9b6Y=
X-Google-Smtp-Source: ADFU+vueeYEl9uMwIRv51UteUXQvmnDkMiNGIO2wkpX77fcl1BU/O4Ks+yfXVc+t5PicvqKK+dNtCRByY+iZ7df3CnA=
X-Received: by 2002:a67:e912:: with SMTP id c18mr2058699vso.72.1582886357500; 
 Fri, 28 Feb 2020 02:39:17 -0800 (PST)
MIME-Version: 1.0
References: <20200106104339.215511-1-christian.gmeiner@gmail.com>
 <78e5e739269ee8f7467284ad88d2097e2ad991ba.camel@pengutronix.de>
In-Reply-To: <78e5e739269ee8f7467284ad88d2097e2ad991ba.camel@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 28 Feb 2020 11:39:05 +0100
Message-ID: <CAH9NwWe85qELoLisKgVdZYeeBkngAk9qQVNDA3=cp4_uRwXsEw@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: rework perfmon query infrastructure
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>, stable@vger.kernel.org,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

Am Mi., 26. Feb. 2020 um 16:19 Uhr schrieb Lucas Stach <l.stach@pengutronix.de>:
>
> Hi Christian,
>
> sorry for taking so long to get around to this.
>

No problem...

> On Mo, 2020-01-06 at 11:43 +0100, Christian Gmeiner wrote:
> > Report the correct perfmon domains and signals depending
> > on the supported feature flags.
> >
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Fixes: 9e2c2e273012 ("drm/etnaviv: add infrastructure to query perf counter")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
> > ---
> >  drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 57 ++++++++++++++++++++---
> >  1 file changed, 50 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> > index 8adbf2861bff..7ae8f347ca06 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> > @@ -32,6 +32,7 @@ struct etnaviv_pm_domain {
> >  };
> >
> >  struct etnaviv_pm_domain_meta {
> > +     unsigned int feature;
> >       const struct etnaviv_pm_domain *domains;
> >       u32 nr_domains;
> >  };
> > @@ -410,36 +411,78 @@ static const struct etnaviv_pm_domain doms_vg[] = {
> >
> >  static const struct etnaviv_pm_domain_meta doms_meta[] = {
> >       {
> > +             .feature = chipFeatures_PIPE_3D,
> >               .nr_domains = ARRAY_SIZE(doms_3d),
> >               .domains = &doms_3d[0]
> >       },
> >       {
> > +             .feature = chipFeatures_PIPE_2D,
> >               .nr_domains = ARRAY_SIZE(doms_2d),
> >               .domains = &doms_2d[0]
> >       },
> >       {
> > +             .feature = chipFeatures_PIPE_VG,
> >               .nr_domains = ARRAY_SIZE(doms_vg),
> >               .domains = &doms_vg[0]
> >       }
> >  };
> >
> > +static unsigned int num_pm_domains(const struct etnaviv_gpu *gpu)
> > +{
> > +     unsigned int num = 0, i;
> > +
> > +     for (i = 0; i < ARRAY_SIZE(doms_meta); i++) {
> > +             const struct etnaviv_pm_domain_meta *meta = &doms_meta[i];
> > +
> > +             if (gpu->identity.features & meta->feature)
> > +                     num += meta->nr_domains;
> > +     }
> > +
> > +     return num;
> > +}
> > +
> > +static const struct etnaviv_pm_domain *pm_domain(const struct etnaviv_gpu *gpu,
> > +     unsigned int index)
> > +{
> > +     const struct etnaviv_pm_domain *domain = NULL;
> > +     unsigned int offset = 0, i;
> > +
> > +     for (i = 0; i < ARRAY_SIZE(doms_meta); i++) {
> > +             const struct etnaviv_pm_domain_meta *meta = &doms_meta[i];
> > +
> > +             if (!(gpu->identity.features & meta->feature))
> > +                     continue;
> > +
> > +             if (meta->nr_domains < (index - offset)) {
> > +                     offset += meta->nr_domains;
> > +                     continue;
> > +             }
> > +
> > +             domain = meta->domains + (index - offset);
> > +     }
> > +
> > +     BUG_ON(!domain);
>
> This is a no-go. BUG_ON is reserved for only the most severe kernel
> bugs where you can't possibly continue without risking a corruption of
> non-volatile state. This isn't the case here, please instead just make
> the callers handle a NULL return gracefully.
>

Fixed it in V2.

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
