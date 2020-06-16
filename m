Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B92E91FA916
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 08:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A50E6E7EA;
	Tue, 16 Jun 2020 06:50:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2AE6E5D4
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 06:50:17 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id a3so18371929oid.4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 23:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p1UoLdKQMCzYoAZ/D8UrzFaEab44Bxka143HkowSuzw=;
 b=iyh1tyE9MrCkqjSMAA4FhoQonxxQ2zQlDDeTrqh7uoTXIBC2zy46JVLwRTvB20xfya
 bIVWLegmkirreqPEYVdswS8PAjTQbqmPqQrS1E6728sX+3zJOqEiVQW1KmUcVBlJ2NFJ
 qDUr/nzds9+Yf/EPW5mQFxEtxLmyPC4veUlig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p1UoLdKQMCzYoAZ/D8UrzFaEab44Bxka143HkowSuzw=;
 b=Fe4ynYA9iupatHyzhMQ/ydbJDZz6IItr74V86Bibuqi/scoEs00WFdIPAeyewoMLD/
 y7eAf4SaI9/18LPjvVe2ycBKQRar/rmwUVLiMfJYi0CKkpg0zHWdv+xilRco+UArCIjM
 j3ShiyMbnhTi/89MsNLoZqOX+PpkPOaN1XlnZd7kEESTTxxfU7TsXwjPDcZFig6yoW5B
 r52mPQZDltoGQz52KV/8mK0/r9WAMK9C512ndAiDAw2a3JK8rXqrcPJ9aHK4WDqA4bus
 WYCGqd10H7Xp0ttOhveUezvDLxn9vZz+DLg4DWDIJi0T+HKWt80eJR66+nxylQ2fmqv7
 Mjrg==
X-Gm-Message-State: AOAM533zItGxRkU7+xY2fVcfTamL/gutg9jUcsOfRiJuz/3qyifxw0N1
 mxnlj69v7aGYQpRIoocTSDUNqKoMex+h/gf8NUCDFQ==
X-Google-Smtp-Source: ABdhPJxk4LxI/qfTW71gXCau+MVPL/D4lFtFfgLCLJFzKN1XPmHFeIqmC0DTEiAAz+L8nIM8mdklP8z632xuBKzcXP4=
X-Received: by 2002:aca:ed42:: with SMTP id l63mr2119085oih.101.1592290217127; 
 Mon, 15 Jun 2020 23:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200612160056.2082681-1-daniel.vetter@ffwll.ch>
 <20200612160056.2082681-7-daniel.vetter@ffwll.ch>
 <CACvgo51AVVOxhGK2Uin=ZLgPpihJiEsnc6pvAyKqFKPvLdOzLA@mail.gmail.com>
In-Reply-To: <CACvgo51AVVOxhGK2Uin=ZLgPpihJiEsnc6pvAyKqFKPvLdOzLA@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 16 Jun 2020 08:50:06 +0200
Message-ID: <CAKMK7uEEkH+8BuFcFUVTv6p8swZZTwcho-HNx5GdZTO1vHDoeg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 7/8] drm/mipi-dbi: Remove ->enabled
To: Emil Velikov <emil.l.velikov@gmail.com>
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

On Mon, Jun 15, 2020 at 11:35 PM Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> Hi Daniel,
>
> On Fri, 12 Jun 2020 at 17:01, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > The atomic helpers try really hard to not lose track of things,
> > duplicating enabled tracking in the driver is at best confusing.
> > Double-enabling or disabling is a bug in atomic helpers.
> >
> > In the fb_dirty function we can just assume that the fb always exists,
> > simple display pipe helpers guarantee that the crtc is only enabled
> > together with the output, so we always have a primary plane around.
> >
> > Now in the update function we need to be a notch more careful, since
> > that can also get called when the crtc is off. And we don't want to
> > upload frames when that's the case, so filter that out too.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: David Lechner <david@lechnology.com>
> > ---
> >  drivers/gpu/drm/drm_mipi_dbi.c | 16 ++++++----------
> >  drivers/gpu/drm/tiny/ili9225.c | 12 +++---------
> >  drivers/gpu/drm/tiny/st7586.c  | 11 +++--------
> >  include/drm/drm_mipi_dbi.h     |  5 -----
> >  4 files changed, 12 insertions(+), 32 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> > index fd8d672972a9..79532b9a324a 100644
> > --- a/drivers/gpu/drm/drm_mipi_dbi.c
> > +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> > @@ -268,7 +268,7 @@ static void mipi_dbi_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
> >         bool full;
> >         void *tr;
> >
> > -       if (!dbidev->enabled)
> > +       if (WARN_ON(!fb))
> >                 return;
> >
> AFAICT no other driver has such WARN_ON. Let's drop that - it is
> pretty confusing and misleading as-is.

Yeah, this is a helper library which might be used wrongly by drivers.
That's why I put it in - if you don't put all the various calls
together correctly, this should at least catch one case. So really
would like to keep this, can I convince you?
-Daniel

> With that, patches 7/8 and 8/8 are:
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>
> -Emil



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
