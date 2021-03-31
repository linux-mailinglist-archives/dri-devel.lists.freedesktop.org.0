Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8226B350AE5
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 01:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CB86EBA6;
	Wed, 31 Mar 2021 23:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9706EBA5
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 23:39:56 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id c3so559741qkc.5
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 16:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KRXtd75gIM8o6NO9GrD5QaBIhsBoZKHXbOsv1GkYlzc=;
 b=icAxVtUz2hwviiFNsnHwXEnvvtgXHS05bFOuzxBj120Eg5qITOkW4TAP4+E4/U0UMz
 d7A3ZJ0+Y4PUBnaUNcXYjLti0rW3kwnyl8P5KQXebXzrO+mttpJ0a6fqoIYgezQHVNRl
 4QQ7s0RIkQMiWoukQ36T0c2QeLGBfIfCyH4Q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KRXtd75gIM8o6NO9GrD5QaBIhsBoZKHXbOsv1GkYlzc=;
 b=doX6r+pAEvuJhg/NPr2prlQyVUD65/sNoJiFkhXyLAhONxFLl6HvNbCbLnjyQv8RIg
 S3+/ZiGc7icjZRfitFipZiZIDvOp4aIW3wpv1j1bzrkFNRm9qigiKo54pzZMcHcOP24u
 KG5+3/FNw8dnBLmWVfEDWXrtTacZpd4heJMz8lfurAFNx1FLEoAKB2O2Sm7dsXBZsZN5
 HFP6yEMmgS9dzs8kEnXC1BlJ4gcfDF0KN5A8DUVa1jNDXaRk7GZWFNpKj5HG6i8WKvw8
 eg4wrLgvLKHkVjFmz+Knp0bg/Vp+Uhhgm6puu62dlWdM/9xkixXSUzSaE+nV1ux2BpiV
 pEFQ==
X-Gm-Message-State: AOAM530LMqg04OGn1cq29kjJ6AHCSM8SElGcFvPpAHBX4ckfxlA7Rifn
 ncFeG19sojgOBaUwcgpacHAN2dx9j1FzyQ==
X-Google-Smtp-Source: ABdhPJzKrziQ7UJj6WQQINqWOj485Cz8Wu7Pg0lKC4/8ErOFGh3CHLZ1h/3cjXd68nMcdtIzC8MsMg==
X-Received: by 2002:a37:43cc:: with SMTP id q195mr5824239qka.455.1617233995578; 
 Wed, 31 Mar 2021 16:39:55 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171])
 by smtp.gmail.com with ESMTPSA id c73sm2803423qkg.6.2021.03.31.16.39.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 16:39:55 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id x189so22998101ybg.5
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 16:39:54 -0700 (PDT)
X-Received: by 2002:a5b:54a:: with SMTP id r10mr8216760ybp.476.1617233994289; 
 Wed, 31 Mar 2021 16:39:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210331221630.488498-1-robdclark@gmail.com>
 <20210331221630.488498-3-robdclark@gmail.com>
 <CAD=FV=USXBm-ZLafNWbUK=Ny7_vwtyG164mQFs87SkXqim-Vpw@mail.gmail.com>
 <CAF6AEGutvjUQ-bQMsAYDLq5kdRo7rQ5XwWjGSRV27VT_UOuMTw@mail.gmail.com>
In-Reply-To: <CAF6AEGutvjUQ-bQMsAYDLq5kdRo7rQ5XwWjGSRV27VT_UOuMTw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 31 Mar 2021 16:39:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VLzDW93COWPALyin3N-wM=a7uKG7WgttmMCncf7qRmKQ@mail.gmail.com>
Message-ID: <CAD=FV=VLzDW93COWPALyin3N-wM=a7uKG7WgttmMCncf7qRmKQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/msm: Avoid mutex in shrinker_count()
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 31, 2021 at 4:23 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Wed, Mar 31, 2021 at 3:44 PM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Wed, Mar 31, 2021 at 3:14 PM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > @@ -818,11 +820,19 @@ static void update_inactive(struct msm_gem_object *msm_obj)
> > >         mutex_lock(&priv->mm_lock);
> > >         WARN_ON(msm_obj->active_count != 0);
> > >
> > > +       if (msm_obj->dontneed)
> > > +               mark_unpurgable(msm_obj);
> > > +
> > >         list_del_init(&msm_obj->mm_list);
> > > -       if (msm_obj->madv == MSM_MADV_WILLNEED)
> > > +       if (msm_obj->madv == MSM_MADV_WILLNEED) {
> > >                 list_add_tail(&msm_obj->mm_list, &priv->inactive_willneed);
> > > -       else
> > > +       } else if (msm_obj->madv == MSM_MADV_DONTNEED) {
> > >                 list_add_tail(&msm_obj->mm_list, &priv->inactive_dontneed);
> > > +               mark_purgable(msm_obj);
> > > +       } else {
> > > +               WARN_ON(msm_obj->madv != __MSM_MADV_PURGED);
> > > +               list_add_tail(&msm_obj->mm_list, &priv->inactive_purged);
> >
> > I'm probably being dense, but what's the point of adding it to the
> > "inactive_purged" list here? You never look at that list, right? You
> > already did a list_del_init() on this object's list pointer
> > ("mm_list"). I don't see how adding it to a bogus list helps with
> > anything.
>
> It preserves the "every bo is in one of these lists" statement, but
> other than that you are right we aren't otherwise doing anything with
> that list.  (Or we could replace the list_del_init() with list_del()..
> I tend to instinctively go for list_del_init())

If you really want this list, it wouldn't hurt to at least have a
comment saying that it's not used for anything so people like me doing
go trying to figure out what it's used for. ;-)


> > > @@ -198,6 +203,33 @@ static inline bool is_vunmapable(struct msm_gem_object *msm_obj)
> > >         return (msm_obj->vmap_count == 0) && msm_obj->vaddr;
> > >  }
> > >
> > > +static inline void mark_purgable(struct msm_gem_object *msm_obj)
> > > +{
> > > +       struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
> > > +
> > > +       WARN_ON(!mutex_is_locked(&priv->mm_lock));
> > > +
> > > +       if (WARN_ON(msm_obj->dontneed))
> > > +               return;
> >
> > The is_purgeable() function also checks other things besides just
> > "MSM_MADV_DONTNEED". Do we need to check those too? Specifically:
> >
> >  msm_obj->sgt && !msm_obj->base.dma_buf && !msm_obj->base.import_attach
> >
> > ...or is it just being paranoid?
> >
> > I guess I'm just worried that if any of those might be important then
> > we'll consistently report back that we have a count of things that can
> > be purged but then scan() won't find anything to do. That wouldn't be
> > great.
>
> Hmm, I thought msm_gem_madvise() returned an error instead of allowing
> MSM_MADV_DONTNEED to be set on imported/exported dma-bufs.. it
> probably should to be complete (but userspace already knows not to
> madvise an imported/exported buffer for other reasons.. ie. we can't
> let a shared buffer end up in the bo cache).  I'll re-work that a bit.
>
> The msm_obj->sgt case is a bit more tricky.. that will be the case of
> a freshly allocated obj that does not have backing patches yet.  But
> it seems like enough of a corner case, that I'm happy to live with
> it.. ie. the tricky thing is not leaking decrements of
> priv->shrinkable_count or underflowing priv->shrinkable_count, and
> caring about the !msm_obj->sgt case doubles the number of states an
> object can be in, and the shrinker->count() return value is just an
> estimate.

I think it's equally important to make sure that we don't constantly
have a non-zero count and then have scan() do nothing.  If there's a
transitory blip then it's fine, but it's not OK if it can be steady
state. Then you end up with:

1. How many objects do you have to free? 10
2. OK, free some. How many did you free? 0
3. Oh. You got more to do, I'll call you again.
4. Goto #1

...and it just keeps looping, right?

As long as you're confident that this case can't happen then we're
probably fine, but good to be careful. Is there any way we can make
sure that a "freshly allocated object" isn't ever in the "DONTNEED"
state?


> > > +       priv->shrinkable_count += msm_obj->base.size >> PAGE_SHIFT;
> > > +       msm_obj->dontneed = true;
> > > +}
> > > +
> > > +static inline void mark_unpurgable(struct msm_gem_object *msm_obj)
> > > +{
> > > +       struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
> > > +
> > > +       WARN_ON(!mutex_is_locked(&priv->mm_lock));
> > > +
> > > +       if (WARN_ON(!msm_obj->dontneed))
> > > +               return;
> > > +
> > > +       priv->shrinkable_count -= msm_obj->base.size >> PAGE_SHIFT;
> > > +       WARN_ON(priv->shrinkable_count < 0);
> >
> > If you changed the order maybe you could make shrinkable_count
> > "unsigned long" to match the shrinker API?
> >
> >  new_shrinkable = msm_obj->base.size >> PAGE_SHIFT;
> >  WARN_ON(new_shrinkable > priv->shrinkable_count);
> >  priv->shrinkable_count -= new_shrinkable
> >
>
> True, although I've developed a preference for signed integers in
> cases where it can underflow if you mess up

Yeah, I guess it's fine since it's a count of pages and we really
can't have _that_ many pages worth of stuff to purge. It might not
hurt to at least declare it as a "long" instead of an "int" though to
match the shrinker API.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
