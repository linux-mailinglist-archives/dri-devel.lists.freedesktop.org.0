Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A31206D67
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 09:18:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E676EA5D;
	Wed, 24 Jun 2020 07:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39ED16EAB8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 07:18:06 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q5so1171385wru.6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 00:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oL5SMm0ZGiw+7IqOBcYrZIkHYKsXsmYVUuSVlCwddhE=;
 b=c4onjB4WDxwMuApOMg9g14R4znxPeBll7P+AYRpkzDya5RX0asQXBnlEIr+i/wyK/D
 pTbexFmymVVPXxVf5y/26IlhL7U+BV6/7hj/ffRevC0cCuud6ssjjdu/b/Vy9365B0Ik
 MA3izHfQbChTir5Zyk4KnANS+L0FeXKzl9qFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oL5SMm0ZGiw+7IqOBcYrZIkHYKsXsmYVUuSVlCwddhE=;
 b=n6h8OI9Tj8jbJAvZu6Mjo77EMRV2tjqGGhQ8LAscmh1rALMNbjG+xZeRDwUWZskJ8B
 xlhie5uRYOmclfhN8AsFatBs1oDVUN8swkIfuj0TDFvzs2xVEUKirPbv2UaZN4cEvVdk
 9ncvh4HZb6Mw5Wo83yr5//EUNJNusSlK0Df2YrRZpy1H4NakOgXmUQym88vUxIexINY4
 0/fHrUrhRLcbzBVPQl1ZzZ7EXlBTDWubBmyqyr1d/vGfLRHFh7tg4nCtgfldOodIWpc+
 7U30qN/BztqpVzKUqk9DjCP1awF4Q6lk8/LKrlVqZwE+yiiVh/hm4u/8WBqjtb3L3kaH
 h9fg==
X-Gm-Message-State: AOAM530Tt+IaEeflkbNN3QXRFUA9CDwh/3ZwVLleShtBM3ReijYQJbjQ
 7Am7wA2PslZ9h21K2JPRFCVv4w==
X-Google-Smtp-Source: ABdhPJyOUzI/TsP2QXvwl9/eNA4Hh5E8T5CruZbTkxmhTh6G68mXDQ2A/vEV2tyVIhb0I5ec3vR+rw==
X-Received: by 2002:adf:c6c5:: with SMTP id c5mr28372863wrh.13.1592983084443; 
 Wed, 24 Jun 2020 00:18:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z132sm979445wmb.21.2020.06.24.00.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 00:18:03 -0700 (PDT)
Date: Wed, 24 Jun 2020 09:18:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [Intel-gfx] [PATCH 7/8] drm/mipi-dbi: Remove ->enabled
Message-ID: <20200624071801.GR20149@phenom.ffwll.local>
References: <20200612160056.2082681-1-daniel.vetter@ffwll.ch>
 <20200612160056.2082681-7-daniel.vetter@ffwll.ch>
 <CACvgo51AVVOxhGK2Uin=ZLgPpihJiEsnc6pvAyKqFKPvLdOzLA@mail.gmail.com>
 <CAKMK7uEEkH+8BuFcFUVTv6p8swZZTwcho-HNx5GdZTO1vHDoeg@mail.gmail.com>
 <CACvgo51ZObyCiOeV+cdJo6xJ3ahuvBUxx1DrK+emDHTOfmVA_g@mail.gmail.com>
 <CAKMK7uFkXzMMWqaS52K6_tdi-xbsqWTySQATpJewLDL_ebXiMA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFkXzMMWqaS52K6_tdi-xbsqWTySQATpJewLDL_ebXiMA@mail.gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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

On Tue, Jun 16, 2020 at 07:16:45PM +0200, Daniel Vetter wrote:
> On Tue, Jun 16, 2020 at 3:57 PM Emil Velikov <emil.l.velikov@gmail.com> wrote:
> >
> > On Tue, 16 Jun 2020 at 07:50, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > >
> > > On Mon, Jun 15, 2020 at 11:35 PM Emil Velikov <emil.l.velikov@gmail.com> wrote:
> > > >
> > > > Hi Daniel,
> > > >
> > > > On Fri, 12 Jun 2020 at 17:01, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > > >
> > > > > The atomic helpers try really hard to not lose track of things,
> > > > > duplicating enabled tracking in the driver is at best confusing.
> > > > > Double-enabling or disabling is a bug in atomic helpers.
> > > > >
> > > > > In the fb_dirty function we can just assume that the fb always exists,
> > > > > simple display pipe helpers guarantee that the crtc is only enabled
> > > > > together with the output, so we always have a primary plane around.
> > > > >
> > > > > Now in the update function we need to be a notch more careful, since
> > > > > that can also get called when the crtc is off. And we don't want to
> > > > > upload frames when that's the case, so filter that out too.
> > > > >
> > > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > Cc: David Airlie <airlied@linux.ie>
> > > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > > Cc: David Lechner <david@lechnology.com>
> > > > > ---
> > > > >  drivers/gpu/drm/drm_mipi_dbi.c | 16 ++++++----------
> > > > >  drivers/gpu/drm/tiny/ili9225.c | 12 +++---------
> > > > >  drivers/gpu/drm/tiny/st7586.c  | 11 +++--------
> > > > >  include/drm/drm_mipi_dbi.h     |  5 -----
> > > > >  4 files changed, 12 insertions(+), 32 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> > > > > index fd8d672972a9..79532b9a324a 100644
> > > > > --- a/drivers/gpu/drm/drm_mipi_dbi.c
> > > > > +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> > > > > @@ -268,7 +268,7 @@ static void mipi_dbi_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
> > > > >         bool full;
> > > > >         void *tr;
> > > > >
> > > > > -       if (!dbidev->enabled)
> > > > > +       if (WARN_ON(!fb))
> > > > >                 return;
> > > > >
> > > > AFAICT no other driver has such WARN_ON. Let's drop that - it is
> > > > pretty confusing and misleading as-is.
> > >
> > > Yeah, this is a helper library which might be used wrongly by drivers.
> > > That's why I put it in - if you don't put all the various calls
> > > together correctly, this should at least catch one case. So really
> > > would like to keep this, can I convince you?
> >
> > There are plenty of similar places where a drm library/helper can be
> > misused, lacking a WARN. Nevertheless - sure feel free to keep it.
> 
> Yeah I agree, we can't check for everything. Personally I think a
> check is warranted in two conditions:
> - drivers got it wrong, and the WARNING helps catch driver-bugs we've
> seen in the wild. Not really the case here
> - drivers do check something as defensive programming, but it's an
> invariant enforced by higher levels or helpers. Those I like to
> convert to WARNING so that other driver authors learn that this should
> never happen. This is such a case imo, I removed a bunch of fb checks
> from drivers here.
> 
> But yeah I think we should only add WARNING checks if this is actually
> something people have gotten wrong, otherwise there's just too many of
> them, distracting from the code.

Merged this patch here too, thanks everyone for reviewing.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
