Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B38B346729
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 19:07:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74FF89CF9;
	Tue, 23 Mar 2021 18:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6BE6E921
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 18:07:23 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id a8so17957237oic.11
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 11:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e3B+59LKFePNVjHdMLcwFqvVHM4VPFbGxXZU5IK7OQ8=;
 b=HVeVJBNYKC3tUFHU285N0IEjcrD5Njwr4l7AGXN/aNo0r5qppErYPJMdF4L7qR4K6b
 a/6HaqnSUoGGgkDcvR0rfkIe6hf5UH6eGdYtyYvVkQu/Otum1VIJGCWPhBQ2ujjRvfLj
 997yu1ragdfdEYBcEIVVuTzPwlRAwEG8DmftRaBI0gAKQ9/sC+KjmhqBUjTvjw7FM2b1
 LYTLAgi8la/A3Wnl9dnnLFeV7TWiegbzTXUm9hjhCfDyWbOlhG27OljhFXfY6rviiE6O
 50J6mycfV8t/JukN7DLMW2CJDgqie7Lo3NrmSaxiGrPpOQQWrW92KxY5FsIcRMmAwcjj
 Bihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e3B+59LKFePNVjHdMLcwFqvVHM4VPFbGxXZU5IK7OQ8=;
 b=mLuvJmAqvAuLM7Vt+uJ+9UhObQVtaz6G8DAA8OTNQUIRTS3DDPuEiETrxVcni94Zsf
 OlocPfyTVaBtFm+aisf+tBClylxj9swvzXwJrKuE5qTbG7amCcyakNEVpRddx/A8Q43+
 fdJGSQKyIaCs7MfBv5AAU5cQI2n1nkJSJmitSknN5/hEIvqw7rwFENpvGdvJgol1pbLt
 Q0fltMWOC11aM7uya8u3fQRTPA53uaJl28ohtFysflF5utcFOCRdlecuq9/4qJHDhL06
 rC9iSFNFYv26sGqlVp+R+Xs9XsqDkh7ap/pZCwJZG00bdMiP1v1F/3dsPFQSJIPAMhVO
 MjDw==
X-Gm-Message-State: AOAM531CapSxwSJSTRH23kyPh1i+3tJ/9NO/8djn1CJWyJdrJ3xqoNHy
 0VAyMDIbKAzqDw9DR53k11+VA++nNhskf1btpaPflA==
X-Google-Smtp-Source: ABdhPJwzYKARMuXCB+e8ID2we7xc2Ro/TWKW1n8HjNlMHoy4QXSd+/6Di3TErIG0ErdYG9ghh/Tx2vGVVYLHCZhVKHg=
X-Received: by 2002:aca:4d55:: with SMTP id a82mr4192505oib.23.1616522842373; 
 Tue, 23 Mar 2021 11:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210323084453.366863-1-daniel.vetter@ffwll.ch>
 <874kh25gaw.fsf@intel.com> <YFnXszc5lZ/omk2V@phenom.ffwll.local>
 <YFngbxt0KbZPXKll@intel.com> <YFnqmRkNdpljN30g@phenom.ffwll.local>
In-Reply-To: <YFnqmRkNdpljN30g@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue, 23 Mar 2021 13:07:11 -0500
Message-ID: <CAOFGe95_rEvLP9dhBwrwr=31jPmAsmTNTauRfiFQxbx+QHiPFw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/i915: add gem/gt TODO
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 8:18 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Mar 23, 2021 at 08:34:55AM -0400, Rodrigo Vivi wrote:
> > On Tue, Mar 23, 2021 at 12:57:39PM +0100, Daniel Vetter wrote:
> > > On Tue, Mar 23, 2021 at 12:13:11PM +0200, Jani Nikula wrote:
> > > > On Tue, 23 Mar 2021, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > > > We've discussed a bit how to get the gem/gt team better integrated
> > > > > and collaborate more with the wider community and agreed to the
> > > > > following:
> > > > >
> > > > > - all gem/gt patches are reviewed on dri-devel for now. That's
> > > > >   overkill, but in the past there was definitely too little of that.
> > > > >
> > > > > - i915-gem folks are encouraged to cross review core patches from
> > > > >   other teams
> > > > >
> > > > > - big features (especially uapi changes) need to be discussed in an
> > > > >   rfc patch that documents the interface and big picture design,
> > > > >   before we get lost in the details of the code
> > > > >
> > > > > - Also a rough TODO (can be refined as we go ofc) to get gem/gt back
> > > > >   on track, like we've e.g. done with DAL/DC to get that in shape.
> > > >
> > > > I personally think there should be a lower bar for discussing and
> > > > editing the TODO items than via patches on the mailing list. Granted,
> > > > the TODO file enforces the discussion happens at a large enough
> > > > audience, but for at least some of the items I'd suggest filing gitlab
> > > > issues [1], with todo label, and tracking there.
> >
> > I also don't like the todo list in files and I agree that gitlab issues
> > section should be better...
> >
> > > In general yes, and I'd go even further: it's up to each team/contributor
> > > how they track review feedback and further work, whether that's gitlab or
> > > some notes or just in their heads.
> > >
> > > This is a different situation here, and the "changes require big audience"
> > > is a feature, not a bug. But it is a very exceptional situation, I think
> > > this is only the 2nd time we're using a formal TODO for a gpu driver. If
> > > we ignore gma500 in staging, which for me only showed that the separate
> > > staging tree doesn't work so well for complex drivers like we have.
> >
> > ... but I understand the motivation, so
> >
> > Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >
> > However... what about:
> >
> > 1. moving the smaller items to gitlab at least?
> > 2. having both, all the entries in the todo file have gitlab issue
> > associated and the number-id is also here in the todo file?
>
> Yeah that sounds reasonable. tbh we haven't started any of the
> intel-internal planning on most of these (ttm and scheduler are started),
> so none of these tracking things exist yet at all ...

I'm a fan of this.  GitLab issues provide a good place to organize the
chatter on any particular ToDo item.  I'd also rather see people
chattering about this stuff on public GitLab than JIRA, when possible.
The last patch in the series closing out a ToDo can be a patch to this
file to remove the bullet point.

--Jason

> -Daniel
>
> >
> > > -Daniel
> > >
> > > >
> > > > BR,
> > > > Jani.
> > > >
> > > >
> > > > [1] https://gitlab.freedesktop.org/drm/intel/-/issues
> > > >
> > > >
> > > >
> > > > >
> > > > > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > > > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > > > > Cc: Dave Airlie <airlied@redhat.com>
> > > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/i915/TODO.txt | 36 +++++++++++++++++++++++++++++++++++
> > > > >  1 file changed, 36 insertions(+)
> > > > >  create mode 100644 drivers/gpu/drm/i915/TODO.txt
> > > > >
> > > > > diff --git a/drivers/gpu/drm/i915/TODO.txt b/drivers/gpu/drm/i915/TODO.txt
> > > > > new file mode 100644
> > > > > index 000000000000..d2e5bbb6339d
> > > > > --- /dev/null
> > > > > +++ b/drivers/gpu/drm/i915/TODO.txt
> > > > > @@ -0,0 +1,36 @@
> > > > > +gem/gt TODO items
> > > > > +-----------------
> > > > > +
> > > > > +- For discrete memory manager, merge enough dg1 to be able to refactor it to
> > > > > +  TTM. Then land pci ids (just in case that turns up an uapi problem). TTM has
> > > > > +  improved a lot the past 2 years, there's no reason anymore not to use it.
> > > > > +
> > > > > +- Come up with a plan what to do with drm/scheduler and how to get there.
> > > > > +
> > > > > +- There's a lot of complexity added past few years to make relocations faster.
> > > > > +  That doesn't make sense given hw and gpu apis moved away from this model years
> > > > > +  ago:
> > > > > +  1. Land a modern pre-bound uapi like VM_BIND
> > > > > +  2. Any complexity added in this area past few years which can't be justified
> > > > > +  with VM_BIND using userspace should be removed. Looking at amdgpu dma_resv on
> > > > > +  the bo and vm, plus some lru locks is all that needed. No complex rcu,
> > > > > +  refcounts, caching, ... on everything.
> > > > > +  This is the matching task on the vm side compared to ttm/dma_resv on the
> > > > > +  backing storage side.
> > > > > +
> > > > > +- i915_sw_fence seems to be the main structure for the i915-gem dma_fence model.
> > > > > +  How-to-dma_fence is core and drivers really shouldn't build their own world
> > > > > +  here, treating everything else as a fixed platform. i915_sw_fence concepts
> > > > > +  should be moved to dma_fence, drm/scheduler or atomic commit helpers. Or
> > > > > +  removed if dri-devel consensus is that it's not a good idea. Once that's done
> > > > > +  maybe even remove it if there's nothing left.
> > > > > +
> > > > > +Smaller things:
> > > > > +- i915_utils.h needs to be moved to the right places.
> > > > > +
> > > > > +- dma_fence_work should be in drivers/dma-buf
> > > > > +
> > > > > +- i915_mm.c should be moved to the right places. Some of the helpers also look a
> > > > > +  bit fishy:
> > > > > +
> > > > > +  https://lore.kernel.org/linux-mm/20210301083320.943079-1-hch@lst.de/
> > > >
> > > > --
> > > > Jani Nikula, Intel Open Source Graphics Center
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
