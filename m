Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3971FB308
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 15:57:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41846E8C3;
	Tue, 16 Jun 2020 13:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B50026E8C0;
 Tue, 16 Jun 2020 13:57:43 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id o15so1708966vsp.12;
 Tue, 16 Jun 2020 06:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=in6M8A0CH5OKf+Nbo1oBHvJHNYxt4ZeUCEay6OgPJEk=;
 b=Beje5QC/d81tgkTUxui/haFJxMK8ytQrTnfhFBwIk3g9I0x4+lImg9hxuyJ4GqiRZo
 ZB8ODmgx9UWbvUU1H4NWxHekOfhLTrEdUZ92RogTYRFTPB/WKsD4r+aZK9UOeRBLdnko
 D1lJApvjGKw1GedlrKvjmhtejI2CuzL2roGoTVepD20r6g08W25LNMU2nsfup2PqEpaJ
 oi8ttXs96bIOiJ+64XbwDovn0LAAsYtSb9T9m/CCfXwwXpFRO2PnJFQduO1EufgUUFBd
 UrfCttEk53VcE2uzIr4lNSGd+K4T0xCjgwWi8OfKs1FPgcNHAZLn3IGw4mwZvCYVJMJS
 gblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=in6M8A0CH5OKf+Nbo1oBHvJHNYxt4ZeUCEay6OgPJEk=;
 b=Oi/4FgvbU+3/Dvdrt99yZfrW5obrEN15TyvY5Y+G0DTltXUkbyJulFM9ZxleP0n4w+
 yA+46LG6OEKsZBqv77tne+xcmBIEYd+F7TVTprrbRv3DiHoTEEMoLHwX5WxiycH0KBJF
 yDSP05/Qe85HX3fTvLExBlThG5Puff6nuao/hQhE4p0Ltwwm6aGM85EjtkYtQqsqhhnl
 aLToERkcx12MURnCv2inupVAHMV1/H8SLFdt91qqWNRwmtF1CrU/HYR1hUos3F1YEkMN
 yue/3zJqMI5VJAn60rzeGgyEaNZHJByIr0AKPq60C9sgN5j3TZ7EbMjErvhfdatIZ8og
 AUMQ==
X-Gm-Message-State: AOAM533WEbqCL7ncnGWxwS9Ab/Ytf5fExQ00nwtMPAG3ogxSQ677MBwD
 WsK3Zai1f85g0w0eXqJf6x0WXGUZjzqmxSR74RE=
X-Google-Smtp-Source: ABdhPJwc3voHSHU4RcDs+eBXMYsKfwrpWnk2uxrQZw7zn7uDDKBSaKyJe3BlzxCDRQ7xv7KLRrD+MAOeqUXncV5yI4I=
X-Received: by 2002:a67:b149:: with SMTP id z9mr1632846vsl.85.1592315862902;
 Tue, 16 Jun 2020 06:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200612160056.2082681-1-daniel.vetter@ffwll.ch>
 <20200612160056.2082681-7-daniel.vetter@ffwll.ch>
 <CACvgo51AVVOxhGK2Uin=ZLgPpihJiEsnc6pvAyKqFKPvLdOzLA@mail.gmail.com>
 <CAKMK7uEEkH+8BuFcFUVTv6p8swZZTwcho-HNx5GdZTO1vHDoeg@mail.gmail.com>
In-Reply-To: <CAKMK7uEEkH+8BuFcFUVTv6p8swZZTwcho-HNx5GdZTO1vHDoeg@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 16 Jun 2020 14:54:01 +0100
Message-ID: <CACvgo51ZObyCiOeV+cdJo6xJ3ahuvBUxx1DrK+emDHTOfmVA_g@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 7/8] drm/mipi-dbi: Remove ->enabled
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: David Lechner <david@lechnology.com>, David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 16 Jun 2020 at 07:50, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Mon, Jun 15, 2020 at 11:35 PM Emil Velikov <emil.l.velikov@gmail.com> wrote:
> >
> > Hi Daniel,
> >
> > On Fri, 12 Jun 2020 at 17:01, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > >
> > > The atomic helpers try really hard to not lose track of things,
> > > duplicating enabled tracking in the driver is at best confusing.
> > > Double-enabling or disabling is a bug in atomic helpers.
> > >
> > > In the fb_dirty function we can just assume that the fb always exists,
> > > simple display pipe helpers guarantee that the crtc is only enabled
> > > together with the output, so we always have a primary plane around.
> > >
> > > Now in the update function we need to be a notch more careful, since
> > > that can also get called when the crtc is off. And we don't want to
> > > upload frames when that's the case, so filter that out too.
> > >
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: David Airlie <airlied@linux.ie>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: David Lechner <david@lechnology.com>
> > > ---
> > >  drivers/gpu/drm/drm_mipi_dbi.c | 16 ++++++----------
> > >  drivers/gpu/drm/tiny/ili9225.c | 12 +++---------
> > >  drivers/gpu/drm/tiny/st7586.c  | 11 +++--------
> > >  include/drm/drm_mipi_dbi.h     |  5 -----
> > >  4 files changed, 12 insertions(+), 32 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> > > index fd8d672972a9..79532b9a324a 100644
> > > --- a/drivers/gpu/drm/drm_mipi_dbi.c
> > > +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> > > @@ -268,7 +268,7 @@ static void mipi_dbi_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
> > >         bool full;
> > >         void *tr;
> > >
> > > -       if (!dbidev->enabled)
> > > +       if (WARN_ON(!fb))
> > >                 return;
> > >
> > AFAICT no other driver has such WARN_ON. Let's drop that - it is
> > pretty confusing and misleading as-is.
>
> Yeah, this is a helper library which might be used wrongly by drivers.
> That's why I put it in - if you don't put all the various calls
> together correctly, this should at least catch one case. So really
> would like to keep this, can I convince you?

There are plenty of similar places where a drm library/helper can be
misused, lacking a WARN. Nevertheless - sure feel free to keep it.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
