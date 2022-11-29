Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD2663C704
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 19:06:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7D410E26A;
	Tue, 29 Nov 2022 18:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A7F10E162;
 Tue, 29 Nov 2022 18:06:01 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id l8so18164573ljh.13;
 Tue, 29 Nov 2022 10:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ktoCdLOEXvDeL8nI5kNqf7cn55qCyvAnCAeJvtAxnhg=;
 b=lv+oHwLjLv/d3xkHy6lru5Bw2/JyPSgOstOWzNGVJxQYJ8M1oPQ1Lg9iRdp/Glc2Jm
 bau41WOyLD0BAaCCZJ5SpO11pB7JGTQlq15cCiem4K80Psg3xxTKjtUeLHSO/p/qjrZa
 EZMrhwjJThD3YhVh1ohU2oUI1/Z1CiwmGuXhEAuZUe9Vy78PUCJDeVDZwkysuMTiXrub
 dlluxgWn46NasMyUzzHTNNFcV8t7rpkhKxtqGiJKlXNngQmvhX+oUMHCojn7FMaHqyPe
 x1LbSXBiRxeIXd1uyKKuFRne9pY4RzqfxoWDtjZRDRKdI4x3Zqv4ETlygzkXjOGtUgT4
 hunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ktoCdLOEXvDeL8nI5kNqf7cn55qCyvAnCAeJvtAxnhg=;
 b=PPUOheBNDfO/0N7He7P8B3WfpUbP2pMox3KM4mHtkRMgFDLqBsR7B9WdDazoyEoKlW
 oVMLrVYmld1CIwK6yLBVFZ/BgSZdybGaHDUI/sSbycnqJh4vBYbFhZ9ba6o2gLO/rRXF
 Gd0wCez0K+U9zxcmDwfpsay594OEI01KVhPiA0m6ijCg4TppTncubIUXVGGxlqE23dxc
 45luN0s+98KesMeFUWyDLMONGe6+tDcuLWbYPJNt/90GzAs0WhoCtsPL7AitZfq6tkaV
 iEj5+D1BsNBVCqjnLYXQzc0aL3pHdhcs3aJ9gmVfFEzDrm4Cs1u20dS7EON+xbHE1xBs
 vILw==
X-Gm-Message-State: ANoB5plYt2lsh8u/DJb/dadrSyE8JDDG1kFIfDZFY+lVLfhXA+zswc6A
 tBPPLscQ8Jrv+F3SkDHXbWdS/yHJkO8V4v5NebM=
X-Google-Smtp-Source: AA0mqf7RgfvwfKVQnEGeh/r2Yu4av5iPaS7DfCSB2DTdH6pPbqg3cUZi75LG0B5cpPLqENhd7M08I3H9MvceCn2YQEM=
X-Received: by 2002:a2e:8ecd:0:b0:277:6d79:8936 with SMTP id
 e13-20020a2e8ecd000000b002776d798936mr16434721ljl.362.1669745159235; Tue, 29
 Nov 2022 10:05:59 -0800 (PST)
MIME-Version: 1.0
References: <20221125102137.1801-1-christian.koenig@amd.com>
 <20221125102137.1801-7-christian.koenig@amd.com>
 <d92312af-3c84-8bd9-108b-719fb1ec3a6b@linux.intel.com>
In-Reply-To: <d92312af-3c84-8bd9-108b-719fb1ec3a6b@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 29 Nov 2022 18:05:32 +0000
Message-ID: <CAM0jSHMKBb3orp8Ez4sC8TNcjPZF9y-4e12Jy6SPqbJonhYVhw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 7/9] drm/i915: stop using ttm_bo_wait
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 25 Nov 2022 at 11:14, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> + Matt
>
> On 25/11/2022 10:21, Christian K=C3=B6nig wrote:
> > TTM is just wrapping core DMA functionality here, remove the mid-layer.
> > No functional change.
> >
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 9 ++++++---
> >   1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/=
i915/gem/i915_gem_ttm.c
> > index 5247d88b3c13..d409a77449a3 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > @@ -599,13 +599,16 @@ i915_ttm_resource_get_st(struct drm_i915_gem_obje=
ct *obj,
> >   static int i915_ttm_truncate(struct drm_i915_gem_object *obj)
> >   {
> >       struct ttm_buffer_object *bo =3D i915_gem_to_ttm(obj);
> > -     int err;
> > +     long err;
> >
> >       WARN_ON_ONCE(obj->mm.madv =3D=3D I915_MADV_WILLNEED);
> >
> > -     err =3D ttm_bo_wait(bo, true, false);
> > -     if (err)
> > +     err =3D dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_BOOKK=
EEP,
> > +                                 true, 15 * HZ);
>
> This 15 second stuck out a bit for me and then on a slightly deeper look
> it seems this timeout will "leak" into a few of i915 code paths. If we
> look at the difference between the legacy shmem and ttm backend I am not
> sure if the legacy one is blocking or not - but if it can block I don't
> think it would have an arbitrary timeout like this. Matt your thoughts?

Not sure what is meant by leak here, but the legacy shmem must also
wait/block when unbinding each VMA, before calling truncate. It's the
same story for the ttm backend, except slightly more complicated in
that there might be no currently bound VMA, and yet the GPU could
still be accessing the pages due to async unbinds, kernel moves etc,
which the wait here (and in i915_ttm_shrink) is meant to protect
against. If the wait times out it should just fail gracefully. I guess
we could just use MAX_SCHEDULE_TIMEOUT here? Not sure if it really
matters though.

>
> Regards,
>
> Tvrtko
>
> > +     if (err < 0)
> >               return err;
> > +     if (err =3D=3D 0)
> > +             return -EBUSY;
> >
> >       err =3D i915_ttm_move_notify(bo);
> >       if (err)
