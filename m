Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B9B2812E3
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 14:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E2A66E940;
	Fri,  2 Oct 2020 12:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB046E940
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 12:37:36 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id u25so1181049otq.6
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Oct 2020 05:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GveUq5veP43eq97ddcVPqDHTUR4l96sFthowC5AWHYo=;
 b=jUM/WdYBuKPz/04YTqikS4cpCkt9BfhA2RJVmUcBe3GvOmhF+1MichOZZBc7PRgKIz
 3XT7gcUif+WOqqMiAvu2Cy3JfCUqAZtMldLa9dTQv3L1bdLYkGP34Q5vOcniQpBITuZm
 yqv1cAuOEN673i7gzD04Pk6h92e/R4C5ugZYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GveUq5veP43eq97ddcVPqDHTUR4l96sFthowC5AWHYo=;
 b=NLw6j6HX04z7ihHMCnHPywnpbJ6V4gaDr/7SJuz8CbZh1Xvw3obVrfGgRrfXwalbjz
 gkqqEwBTAc1MgX5u2oi2tIahWdyvWzNCuaN3SB23tDbn4ZLlYJuHTzMXgd1hZiktUKts
 Q9aNAOrj9CXpYEsMisu2ON45XC6dGvjugXLxxpN2L/egFKbpVrhvnUuj33mddO6/NHg5
 twk9fGo/VAm0ZIdX8kgQtUATXbW+qapGvQbf40IX+7LW65DDoPpLM+gWIkGVkT/zk/C8
 we88QGp8dezhztKdbNUj2TN8uBguEs+5vbjYeBaE7xVv3QcaAbLa8IO+8xkYo1CL97hj
 T61Q==
X-Gm-Message-State: AOAM5331sqvm+gECHh8YJ0HMixLQdSoNsnMeKpYET65n8GdNqz/vzKm5
 bWKJ/c1z4BbtgUyznJnp8uNpum2nygTIK4BnLbkiNg==
X-Google-Smtp-Source: ABdhPJwEfaCDTLYMhVQ0v3jg5NqPhi2X9UkBbu1vdSzPPmONtyvu104qqNaZXq9hlCVffvjdWTuqyiC4Ng5gZgHw69c=
X-Received: by 2002:a9d:4b99:: with SMTP id k25mr1616104otf.281.1601642256090; 
 Fri, 02 Oct 2020 05:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <20201002075620.4157591-1-daniel.vetter@ffwll.ch>
 <20201002123112.uupaal7jed7xkmrf@gilmour.lan>
In-Reply-To: <20201002123112.uupaal7jed7xkmrf@gilmour.lan>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 2 Oct 2020 14:37:25 +0200
Message-ID: <CAKMK7uHZcY=T-eMHxDYsWgSBGGAcweUttX1B7_mEXVHgS0Qhnw@mail.gmail.com>
Subject: Re: [PATCH] drm/atomic: Make the kerneldoc a bit clearer
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 2, 2020 at 2:31 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> On Fri, Oct 02, 2020 at 09:56:20AM +0200, Daniel Vetter wrote:
> > Crank up the warning a notch and point at the right set of locking
> > functions for atomic drivers.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > ---
> >  drivers/gpu/drm/drm_atomic.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> > index aac9122f1da2..b2d20eb6c807 100644
> > --- a/drivers/gpu/drm/drm_atomic.c
> > +++ b/drivers/gpu/drm/drm_atomic.c
> > @@ -1642,11 +1642,11 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
> >   * to dmesg in case of error irq's.  (Hint, you probably want to
> >   * ratelimit this!)
> >   *
> > - * The caller must drm_modeset_lock_all(), or if this is called
> > - * from error irq handler, it should not be enabled by default.
> > - * (Ie. if you are debugging errors you might not care that this
> > - * is racey.  But calling this without all modeset locks held is
> > - * not inherently safe.)
> > + * The caller must wrap this drm_modeset_lock_all_ctx() and
> > + * drm_modeset_drop_locks(). If this is called from error irq handler, it should
> > + * not be enabled by default - if you are debugging errors you might
> > + * not care that this is racey, but calling this without all modeset locks held
> > + * is inherently unsafe.
> >   */
> >  void drm_state_dump(struct drm_device *dev, struct drm_printer *p)
> >  {
>
> For the comment itself:
> Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks for taking a look, will merge.

> But maybe we should add some lockdep assertion to make sure we can catch
> someone actually doing this?

I think it has some use for ad-hoc debugging in random places, or
maybe as a an opt-in "tains your kernel" debug option. And then you
really don't want your useful debug output burried in a few pages of
lockdep splat first :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
