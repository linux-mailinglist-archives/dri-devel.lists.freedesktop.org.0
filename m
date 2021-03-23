Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A87345E39
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 13:35:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B3B6E8D8;
	Tue, 23 Mar 2021 12:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402676E8D8;
 Tue, 23 Mar 2021 12:34:59 +0000 (UTC)
IronPort-SDR: JrrUsb+zhVb0LHqRnL+mjbWIcvXK9AxuDizLgEHzeVPRP285QgCmUMsrZK5IiLhCf0TLnuJKXJ
 xXUVd9PYJd1Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="170431300"
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; d="scan'208";a="170431300"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 05:34:59 -0700
IronPort-SDR: XHfFORp879d1Rt4d98lP3YSEXuM7e5i+W61xUUVb7SrZIrCMYtREJvGT/K7rg7yQpTzD4GZDxt
 UdR86WrsgLYA==
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; d="scan'208";a="524816622"
Received: from abdulla1-mobl1.gar.corp.intel.com (HELO intel.com)
 ([10.251.23.100])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 05:34:57 -0700
Date: Tue, 23 Mar 2021 08:34:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/2] drm/i915: add gem/gt TODO
Message-ID: <YFngbxt0KbZPXKll@intel.com>
References: <20210323084453.366863-1-daniel.vetter@ffwll.ch>
 <874kh25gaw.fsf@intel.com> <YFnXszc5lZ/omk2V@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YFnXszc5lZ/omk2V@phenom.ffwll.local>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@intel.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 12:57:39PM +0100, Daniel Vetter wrote:
> On Tue, Mar 23, 2021 at 12:13:11PM +0200, Jani Nikula wrote:
> > On Tue, 23 Mar 2021, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > We've discussed a bit how to get the gem/gt team better integrated
> > > and collaborate more with the wider community and agreed to the
> > > following:
> > >
> > > - all gem/gt patches are reviewed on dri-devel for now. That's
> > >   overkill, but in the past there was definitely too little of that.
> > >
> > > - i915-gem folks are encouraged to cross review core patches from
> > >   other teams
> > >
> > > - big features (especially uapi changes) need to be discussed in an
> > >   rfc patch that documents the interface and big picture design,
> > >   before we get lost in the details of the code
> > >
> > > - Also a rough TODO (can be refined as we go ofc) to get gem/gt back
> > >   on track, like we've e.g. done with DAL/DC to get that in shape.
> > 
> > I personally think there should be a lower bar for discussing and
> > editing the TODO items than via patches on the mailing list. Granted,
> > the TODO file enforces the discussion happens at a large enough
> > audience, but for at least some of the items I'd suggest filing gitlab
> > issues [1], with todo label, and tracking there.

I also don't like the todo list in files and I agree that gitlab issues
section should be better...

> In general yes, and I'd go even further: it's up to each team/contributor
> how they track review feedback and further work, whether that's gitlab or
> some notes or just in their heads.
> 
> This is a different situation here, and the "changes require big audience"
> is a feature, not a bug. But it is a very exceptional situation, I think
> this is only the 2nd time we're using a formal TODO for a gpu driver. If
> we ignore gma500 in staging, which for me only showed that the separate
> staging tree doesn't work so well for complex drivers like we have.

... but I understand the motivation, so

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

However... what about:

1. moving the smaller items to gitlab at least?
2. having both, all the entries in the todo file have gitlab issue
associated and the number-id is also here in the todo file?

> -Daniel
> 
> > 
> > BR,
> > Jani.
> > 
> > 
> > [1] https://gitlab.freedesktop.org/drm/intel/-/issues
> > 
> > 
> > 
> > >
> > > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > > Cc: Dave Airlie <airlied@redhat.com>
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/TODO.txt | 36 +++++++++++++++++++++++++++++++++++
> > >  1 file changed, 36 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/i915/TODO.txt
> > >
> > > diff --git a/drivers/gpu/drm/i915/TODO.txt b/drivers/gpu/drm/i915/TODO.txt
> > > new file mode 100644
> > > index 000000000000..d2e5bbb6339d
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/i915/TODO.txt
> > > @@ -0,0 +1,36 @@
> > > +gem/gt TODO items
> > > +-----------------
> > > +
> > > +- For discrete memory manager, merge enough dg1 to be able to refactor it to
> > > +  TTM. Then land pci ids (just in case that turns up an uapi problem). TTM has
> > > +  improved a lot the past 2 years, there's no reason anymore not to use it.
> > > +
> > > +- Come up with a plan what to do with drm/scheduler and how to get there.
> > > +
> > > +- There's a lot of complexity added past few years to make relocations faster.
> > > +  That doesn't make sense given hw and gpu apis moved away from this model years
> > > +  ago:
> > > +  1. Land a modern pre-bound uapi like VM_BIND
> > > +  2. Any complexity added in this area past few years which can't be justified
> > > +  with VM_BIND using userspace should be removed. Looking at amdgpu dma_resv on
> > > +  the bo and vm, plus some lru locks is all that needed. No complex rcu,
> > > +  refcounts, caching, ... on everything.
> > > +  This is the matching task on the vm side compared to ttm/dma_resv on the
> > > +  backing storage side.
> > > +
> > > +- i915_sw_fence seems to be the main structure for the i915-gem dma_fence model.
> > > +  How-to-dma_fence is core and drivers really shouldn't build their own world
> > > +  here, treating everything else as a fixed platform. i915_sw_fence concepts
> > > +  should be moved to dma_fence, drm/scheduler or atomic commit helpers. Or
> > > +  removed if dri-devel consensus is that it's not a good idea. Once that's done
> > > +  maybe even remove it if there's nothing left.
> > > +
> > > +Smaller things:
> > > +- i915_utils.h needs to be moved to the right places.
> > > +
> > > +- dma_fence_work should be in drivers/dma-buf
> > > +
> > > +- i915_mm.c should be moved to the right places. Some of the helpers also look a
> > > +  bit fishy:
> > > +
> > > +  https://lore.kernel.org/linux-mm/20210301083320.943079-1-hch@lst.de/
> > 
> > -- 
> > Jani Nikula, Intel Open Source Graphics Center
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
