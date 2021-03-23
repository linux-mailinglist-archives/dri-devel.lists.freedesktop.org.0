Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAA2345F71
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 14:18:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27276E8F8;
	Tue, 23 Mar 2021 13:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE79F6E8F8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 13:18:20 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id c8so7831247wrq.11
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 06:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=d31tAy4LHdJGKZG/7KvKbLGdDszUDjOkGzIleuY1jbg=;
 b=Zh0tcVj/dUje61OND1Rzx+r4Tie3fG7fisa+9jojAjwYkap3v71R41rdfWtgaQoRha
 gkY1mE29YYvdHoAIc7KEdBIsYSAAdCsP/SdzUgc7iG8GkXIWGI6tmsQ0Un1btwG/Jodg
 ufV45Fi1jnB5wi4Xrp02/knSb7BBnYhP5Ocqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=d31tAy4LHdJGKZG/7KvKbLGdDszUDjOkGzIleuY1jbg=;
 b=CDNXJBPm/1pU/Y8YprEsNbkfcOJkxBdYAuzZKoEEZmCBYSupuPXao90PBS+KS5VDJj
 9q8FvtFK5OwgrNPAJLt3oxnWr6U6jt6vp78YCKAp1irsI/2jniUZ+wcFXvMXBRWLuT3a
 z0IieAuk/Sz9k9EmfGcjaeW2tjr7ljwEyQN2292j17tDHharUaL8KMAnlSa6lrzN0JOv
 cyMqvLMaCBRHwek4Mzl1YngLeSazk026NNRiC9VI6pWkfPaW9zIL7HySjm5Z6O7tHDJE
 Bd2klzNsP57tpegAiHicGKqZo9sjXL4K8fmAgrOlDmmihb/oEIcOR0xDHmTfxD905kOl
 bzhA==
X-Gm-Message-State: AOAM532X6O0118ySN7+B5w1yk3wsGbwsI42z53iI8ZWpulm5ld5pY0Xb
 Xh4fmWIUgpEK+84tN95FeFluUw==
X-Google-Smtp-Source: ABdhPJwRgxcq3jhl8GRG8kQOZaKFgxSWV4EsDlE71AJ/RWJXWJqmAJyXZbCReernz99gTv8tjL3IMg==
X-Received: by 2002:adf:e482:: with SMTP id i2mr3948008wrm.392.1616505499625; 
 Tue, 23 Mar 2021 06:18:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m5sm3201702wrq.15.2021.03.23.06.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 06:18:18 -0700 (PDT)
Date: Tue, 23 Mar 2021 14:18:17 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/2] drm/i915: add gem/gt TODO
Message-ID: <YFnqmRkNdpljN30g@phenom.ffwll.local>
References: <20210323084453.366863-1-daniel.vetter@ffwll.ch>
 <874kh25gaw.fsf@intel.com> <YFnXszc5lZ/omk2V@phenom.ffwll.local>
 <YFngbxt0KbZPXKll@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YFngbxt0KbZPXKll@intel.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 08:34:55AM -0400, Rodrigo Vivi wrote:
> On Tue, Mar 23, 2021 at 12:57:39PM +0100, Daniel Vetter wrote:
> > On Tue, Mar 23, 2021 at 12:13:11PM +0200, Jani Nikula wrote:
> > > On Tue, 23 Mar 2021, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > > We've discussed a bit how to get the gem/gt team better integrated
> > > > and collaborate more with the wider community and agreed to the
> > > > following:
> > > >
> > > > - all gem/gt patches are reviewed on dri-devel for now. That's
> > > >   overkill, but in the past there was definitely too little of that.
> > > >
> > > > - i915-gem folks are encouraged to cross review core patches from
> > > >   other teams
> > > >
> > > > - big features (especially uapi changes) need to be discussed in an
> > > >   rfc patch that documents the interface and big picture design,
> > > >   before we get lost in the details of the code
> > > >
> > > > - Also a rough TODO (can be refined as we go ofc) to get gem/gt back
> > > >   on track, like we've e.g. done with DAL/DC to get that in shape.
> > > 
> > > I personally think there should be a lower bar for discussing and
> > > editing the TODO items than via patches on the mailing list. Granted,
> > > the TODO file enforces the discussion happens at a large enough
> > > audience, but for at least some of the items I'd suggest filing gitlab
> > > issues [1], with todo label, and tracking there.
> 
> I also don't like the todo list in files and I agree that gitlab issues
> section should be better...
> 
> > In general yes, and I'd go even further: it's up to each team/contributor
> > how they track review feedback and further work, whether that's gitlab or
> > some notes or just in their heads.
> > 
> > This is a different situation here, and the "changes require big audience"
> > is a feature, not a bug. But it is a very exceptional situation, I think
> > this is only the 2nd time we're using a formal TODO for a gpu driver. If
> > we ignore gma500 in staging, which for me only showed that the separate
> > staging tree doesn't work so well for complex drivers like we have.
> 
> ... but I understand the motivation, so
> 
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> However... what about:
> 
> 1. moving the smaller items to gitlab at least?
> 2. having both, all the entries in the todo file have gitlab issue
> associated and the number-id is also here in the todo file?

Yeah that sounds reasonable. tbh we haven't started any of the
intel-internal planning on most of these (ttm and scheduler are started),
so none of these tracking things exist yet at all ...
-Daniel

> 
> > -Daniel
> > 
> > > 
> > > BR,
> > > Jani.
> > > 
> > > 
> > > [1] https://gitlab.freedesktop.org/drm/intel/-/issues
> > > 
> > > 
> > > 
> > > >
> > > > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > > > Cc: Dave Airlie <airlied@redhat.com>
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/i915/TODO.txt | 36 +++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 36 insertions(+)
> > > >  create mode 100644 drivers/gpu/drm/i915/TODO.txt
> > > >
> > > > diff --git a/drivers/gpu/drm/i915/TODO.txt b/drivers/gpu/drm/i915/TODO.txt
> > > > new file mode 100644
> > > > index 000000000000..d2e5bbb6339d
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/i915/TODO.txt
> > > > @@ -0,0 +1,36 @@
> > > > +gem/gt TODO items
> > > > +-----------------
> > > > +
> > > > +- For discrete memory manager, merge enough dg1 to be able to refactor it to
> > > > +  TTM. Then land pci ids (just in case that turns up an uapi problem). TTM has
> > > > +  improved a lot the past 2 years, there's no reason anymore not to use it.
> > > > +
> > > > +- Come up with a plan what to do with drm/scheduler and how to get there.
> > > > +
> > > > +- There's a lot of complexity added past few years to make relocations faster.
> > > > +  That doesn't make sense given hw and gpu apis moved away from this model years
> > > > +  ago:
> > > > +  1. Land a modern pre-bound uapi like VM_BIND
> > > > +  2. Any complexity added in this area past few years which can't be justified
> > > > +  with VM_BIND using userspace should be removed. Looking at amdgpu dma_resv on
> > > > +  the bo and vm, plus some lru locks is all that needed. No complex rcu,
> > > > +  refcounts, caching, ... on everything.
> > > > +  This is the matching task on the vm side compared to ttm/dma_resv on the
> > > > +  backing storage side.
> > > > +
> > > > +- i915_sw_fence seems to be the main structure for the i915-gem dma_fence model.
> > > > +  How-to-dma_fence is core and drivers really shouldn't build their own world
> > > > +  here, treating everything else as a fixed platform. i915_sw_fence concepts
> > > > +  should be moved to dma_fence, drm/scheduler or atomic commit helpers. Or
> > > > +  removed if dri-devel consensus is that it's not a good idea. Once that's done
> > > > +  maybe even remove it if there's nothing left.
> > > > +
> > > > +Smaller things:
> > > > +- i915_utils.h needs to be moved to the right places.
> > > > +
> > > > +- dma_fence_work should be in drivers/dma-buf
> > > > +
> > > > +- i915_mm.c should be moved to the right places. Some of the helpers also look a
> > > > +  bit fishy:
> > > > +
> > > > +  https://lore.kernel.org/linux-mm/20210301083320.943079-1-hch@lst.de/
> > > 
> > > -- 
> > > Jani Nikula, Intel Open Source Graphics Center
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
