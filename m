Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8476114C741
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 09:11:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4EE26E1F9;
	Wed, 29 Jan 2020 08:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D956E1F9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 08:11:28 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y17so19040641wrh.5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 00:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=4qV3MsVy3b4w295STka7Lcn6U1xW0j/oFTkyyvAlKsE=;
 b=Oz9uUuao4LClkchd5GHdY/FDKVQozHcV0dIcbjsQDGe7UDtCDd9b8+AwbpSBeeLT0M
 FInaHARxlbJnSPsXmxpeQj7zDVZFHhg8l7h4JAqzuFE/Z5NRP9nvjmSP7hCDkSOA3XZn
 Pn7bJ0An9NQndyR+zbDdudkXXGiG7NVKCaAqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4qV3MsVy3b4w295STka7Lcn6U1xW0j/oFTkyyvAlKsE=;
 b=e/OeZR6BOz76ZNF2uHLeRywi8q82hAba+2vH7U+KK9jy/i/GVaVmOqiA97ICOR1a3I
 Yle43QBWjkCvcyhqaQKAvNHprPaLtYdF+WgmOo102DYLXMnME6XzlRiqQNjlVku+ubAt
 TYvwZMs5QtccMPeUQejjIaQ31OkYQOmxHfzHEAXv0Pk4yPdbqWk4c0K1sbne11MEPtIV
 FZcbkkWMJ4hp38IveKw0LLeuZpcCbm69LqDRHJCZOo1ioKoA5bWmjXLMoCbO4okaIc4T
 EHMx9TGqEQwBG0vXzvuSE86htxrL7TkngQcJw4SE4ESTZ1zTg6sZ42l3ZNppJ6hhEgKP
 nRyw==
X-Gm-Message-State: APjAAAWKVCPpwOYXOrJoGGF28N75/eSW+DZ4F07N6W0bZNpCB/PV6l8l
 KHnoUV2LhNnfmEYUBoCNckrCxpAH5Wt3Gw==
X-Google-Smtp-Source: APXvYqyOo390410W6Ksm9xv3s4NqnG6a7iuSbhgQXztZRhKoNYl6fHbAa8nD3LKrJZ1ZJdCf6CbsVw==
X-Received: by 2002:adf:fd0d:: with SMTP id e13mr34066084wrr.421.1580285486780; 
 Wed, 29 Jan 2020 00:11:26 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f1sm1776189wro.85.2020.01.29.00.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 00:11:26 -0800 (PST)
Date: Wed, 29 Jan 2020 09:11:24 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH] drm: shrinker: Add a prefix on purging logs
Message-ID: <20200129081124.GK43062@phenom.ffwll.local>
References: <20191214162049.10997-1-ezequiel@collabora.com>
 <20200122080413.GL43062@phenom.ffwll.local>
 <f15ac21ab733e094fff4ed5f129a519113b75cc8.camel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f15ac21ab733e094fff4ed5f129a519113b75cc8.camel@collabora.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 28, 2020 at 04:58:07PM -0300, Ezequiel Garcia wrote:
> On Wed, 2020-01-22 at 09:04 +0100, Daniel Vetter wrote:
> > On Sat, Dec 14, 2019 at 01:20:49PM -0300, Ezequiel Garcia wrote:
> > > It's not entirely obvious why these messages have
> > > "info" severity. In any case, add a proper driver prefix
> > > to give the user a bit of context of where they are coming from.
> > =

> > So the i915 one makes some sense, it's for oom. Which shouldn't happen
> > often. Then panfrost/msm ones are imo dubious and should be changed to =
one
> > of the drm debug ones. Looks like copypasta fail, we might want to chan=
ge
> > all of them to drm debugging ones (well maybe keep the i915 one as a drm
> > info output).
> =

> Sounds good. I can submit follow up patches for that.
> Meanwhile, this patch seems good to go, right?

First adding the prefix to then remove it (at least for panfrost/msm)
seems like unecessary detour to me. But up to respective maintainers.
-Daniel

> =

> Thanks,
> Ezequiel
> =

> > -Daniel
> > =

> > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > ---
> > >  drivers/gpu/drm/i915/gem/i915_gem_shrinker.c     | 2 ++
> > >  drivers/gpu/drm/msm/msm_gem_shrinker.c           | 2 ++
> > >  drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c | 2 ++
> > >  3 files changed, 6 insertions(+)
> > > =

> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/g=
pu/drm/i915/gem/i915_gem_shrinker.c
> > > index 3a926a8755c6..cd0372a1d936 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> > > @@ -4,6 +4,8 @@
> > >   * Copyright =A9 2008-2015 Intel Corporation
> > >   */
> > >  =

> > > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > > +
> > >  #include <linux/oom.h>
> > >  #include <linux/sched/mm.h>
> > >  #include <linux/shmem_fs.h>
> > > diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm=
/msm/msm_gem_shrinker.c
> > > index 722d61668a97..0620d441a2cc 100644
> > > --- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
> > > +++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> > > @@ -4,6 +4,8 @@
> > >   * Author: Rob Clark <robdclark@gmail.com>
> > >   */
> > >  =

> > > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > > +
> > >  #include "msm_drv.h"
> > >  #include "msm_gem.h"
> > >  =

> > > diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drive=
rs/gpu/drm/panfrost/panfrost_gem_shrinker.c
> > > index 458f0fa68111..b9d0e821c3f6 100644
> > > --- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
> > > +++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
> > > @@ -6,6 +6,8 @@
> > >   * Author: Rob Clark <robdclark@gmail.com>
> > >   */
> > >  =

> > > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > > +
> > >  #include <linux/list.h>
> > >  =

> > >  #include <drm/drm_device.h>
> > > -- =

> > > 2.22.0
> > > =

> =

> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
