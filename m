Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7E137A0D5
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 09:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B12D6E062;
	Tue, 11 May 2021 07:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398FE6E062
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 07:31:58 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso612973wmh.4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 00:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=hS+TZAPzm65DmdnskEvA29RTGiwubRIICS+ol94MGKw=;
 b=PaHP8mkOR7wUs1ldPqYZBuwzW538jl4bleaNoV5+xeHZ1n9EA/A1Uq8cIVmeFMOT4g
 XeFaaWP+4/qnIpl1B5z5uUpBuX7NDPlQqnjZ32JyA2YaTpmOPJZuyD/fAibQ45gxQxee
 mYOrrsV+gJatVfDNsZOE/KX7f8lG6b1y7uEek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hS+TZAPzm65DmdnskEvA29RTGiwubRIICS+ol94MGKw=;
 b=mCsL2lQhWgCjHcLJiulwEn+HxkQ8pAqmj166Rd5kYozq45XTnIxXG7SlzRf6Nuxhwp
 Hit1qI9VNOQUjsVFqtYlkEzw3XWjO/cxkQOcSnlwRMJO4XoPdrb8KwYy2w+mOv/67l3S
 EJbgqjWSlhTm2k0j5/RQR2rkPDkhVdfVkamhRy5DoGcxpgpx6XezBah0WBfwqZDAdPIy
 jbjd4jzhstI/xkWJb9R2Sx0iJf+yqSAqCOX7C2+Tgg9N0o3cIr0s5kZ/Wc4Tv4Wor5vF
 fIx9bmyp0i4IwxLc1NyKoDBPWYqfGdMo6DVojeQR3NZnKBPEJk4kgZ7IG6U5FAUX01Zn
 czCA==
X-Gm-Message-State: AOAM530WSihi2qBO+9tratesSy7Gy22qFzPXehX72cSPp5jtxGNAerOf
 TD9eccg835DCMdUp6lCCXgwJGg==
X-Google-Smtp-Source: ABdhPJw+3GZS9zfPGNL5uDi+0JrJTnq7/37NNW7dShmVBXEvKuR1JOY2622rkSOqoCswBY1uCOveKg==
X-Received: by 2002:a05:600c:3205:: with SMTP id
 r5mr30949630wmp.78.1620718316804; 
 Tue, 11 May 2021 00:31:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r17sm2607835wmh.25.2021.05.11.00.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 00:31:56 -0700 (PDT)
Date: Tue, 11 May 2021 09:31:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [RFC] Implicit vs explicit user fence sync
Message-ID: <YJoy6oI34tQZMt6/@phenom.ffwll.local>
References: <20210504132729.2046-1-christian.koenig@amd.com>
 <YJFXG/THrjXqQjyN@phenom.ffwll.local>
 <d266ccd2-3259-99ce-5fd6-b8ae81ac14e9@gmail.com>
 <YJFkN/bgN6UCXdvA@phenom.ffwll.local>
 <f1616be5-a8cb-076d-a63d-9554a76b0b0a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1616be5-a8cb-076d-a63d-9554a76b0b0a@gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 10, 2021 at 08:12:31PM +0200, Christian König wrote:
> Am 04.05.21 um 17:11 schrieb Daniel Vetter:
> > On Tue, May 04, 2021 at 04:26:42PM +0200, Christian König wrote:
> > > Hi Daniel,
> > > 
> > > Am 04.05.21 um 16:15 schrieb Daniel Vetter:
> > > > Hi Christian,
> > > > 
> > > > On Tue, May 04, 2021 at 03:27:17PM +0200, Christian König wrote:
> > > > > Hi guys,
> > > > > 
> > > > > with this patch set I want to look into how much more additional work it
> > > > > would be to support implicit sync compared to only explicit sync.
> > > > > 
> > > > > Turned out that this is much simpler than expected since the only
> > > > > addition is that before a command submission or flip the kernel and
> > > > > classic drivers would need to wait for the user fence to signal before
> > > > > taking any locks.
> > > > It's a lot more I think
> > > > - sync_file/drm_syncobj still need to be supported somehow
> > > You need that with explicit fences as well.
> > > 
> > > I'm just concentrating on what extra burden implicit sync would get us.
> > It's not just implicit sync. Currently the best approach we have for
> > explicit sync is hiding them in drm_syncobj. Because for that all the work
> > with intentional stall points and userspace submit thread already exists.
> > 
> > None of this work has been done for sync_file. And looking at how much
> > work it was to get drm_syncobj going, that will be anything but easy.
> 
> I don't think we will want this for sync_file in the first place.
> 
> > > > - we need userspace to handle the stall in a submit thread at least
> > > > - there's nothing here that sets the sync object
> > > > - implicit sync isn't just execbuf, it's everything. E.g. the various
> > > >     wait_bo ioctl also need to keep working, including timeout and
> > > >     everything
> > > Good point, but that should be relatively easily to add as well.
> > > 
> > > > - we can't stall in atomic kms where you're currently stalling, that's for
> > > >     sure. The uapi says "we're not stalling for fences in there", and you're
> > > >     breaking that.
> > > Again as far as I can see we run into the same problem with explicit sync.
> > > 
> > > So the question is where could we block for atomic modeset for user fences
> > > in general?
> > Nah, I have an idea. But it only works if userspace is aware, because the
> > rules are essentialyl:
> > 
> > - when you supply a userspace in-fence, then you only get a userspace
> >    out-fence
> > - mixing in fences between dma-fence and user fence is ok
> > - mixing out fences isn't
> > 
> > And we currently do have sync_file out fence. So it's not possible to
> > support implicit user fence in atomic in a way which doesn't break the
> > uapi somewhere.
> > 
> > Doing the explicit user fence support first will make that very obvious.
> > 
> > And that's just the one ioctl I know is big trouble, I'm sure we'll find
> > more funny corner cases when we roll out explicit user fencing.
> 
> I think we can just ignore sync_file. As far as it concerns me that UAPI is
> pretty much dead.

Uh that's rather bold. Android is built on it. Currently atomic kms is
built on it.

> What we should support is drm_syncobj, but that also only as an in-fence
> since that's what our hardware supports.

Convince Android folks, minimally. Probably a lot more. Yes with hindsight
we should have just gone for drm_syncobj instead of the sync_file thing,
but hindsight and all that.

This is kinda why I don't think trying to support the existing uapi with
userspace fences underneath with some magic tricks is a good idea. It's
just a pile of work, plus it's not really architecturally clean.

> > Anotherone that looks very sketchy right now is buffer sharing between
> > different userspace drivers, like compute <-> media (if you have some
> > fancy AI pipeline in your media workload, as an example).
> 
> Yeah, we are certainly going to get that. But only inside the same driver,
> so not much of a problem.

Why is this not much of a problem if it's just within one driver?

> > > > - ... at this point I stopped pondering but there's definitely more
> > > > 
> > > > Imo the only way we'll even get the complete is if we do the following:
> > > > 1. roll out implicit sync with userspace fences on a driver-by-driver basis
> > 		s/implicit/explicit/
> > 
> > But I think you got that.
> > 
> > > >      1a. including all the winsys/modeset stuff
> > > Completely agree, that's why I've split that up into individual patches.
> > > 
> > > I'm also fine if drivers can just opt out of user fence based
> > > synchronization and we return an error from dma_buf_dynamic_attach() if some
> > > driver says it can't handle that.
> > Yeah, but that boils down to us just breaking those use-cases. Which is
> > exactly what you're trying to avoid by rolling out implicit user fence I
> > think.
> 
> But we can add support to all drivers as necessary.
> 
> > 
> > > > 2. roll out support for userspace fences to drm_syncobj timeline for
> > > >      interop, both across process/userspace and across drivers
> > > >      2a. including all the winsys/modeset stuff, but hopefully that's
> > > >          largely solved with 1. already.
> > > Correct, but again we need this for explicit fencing as well.
> > > 
> > > > 3. only then try to figure out how to retroshoehorn this into implicit
> > > >      sync, and whether that even makes sense.
> > > > 
> > > > Because doing 3 before we've done 1&2 for at least 2 drivers (2 because
> > > > interop fun across drivers) is just praying that this time around we're
> > > > not collectively idiots and can correctly predict the future. That never
> > > > worked :-)
> > > > 
> > > > > For this prototype this patch set doesn't implement any user fence
> > > > > synchronization at all, but just assumes that faulting user pages is
> > > > > sufficient to make sure that we can wait for user space to finish
> > > > > submitting the work. If necessary this can be made even more strict, the
> > > > > only use case I could find which blocks this is the radeon driver and
> > > > > that should be handle able.
> > > > > 
> > > > > This of course doesn't give you the same semantic as the classic
> > > > > implicit sync to guarantee that you have exclusive access to a buffers,
> > > > > but this is also not necessary.
> > > > > 
> > > > > So I think the conclusion should be that we don't need to concentrate on
> > > > > implicit vs. explicit sync, but rather how to get the synchronization
> > > > > and timeout signalling figured out in general.
> > > > I'm not sure what exactly you're proving here aside from "it's possible to
> > > > roll out a function with ill-defined semantics to all drivers". This
> > > > really is a lot harder than just this one function and just this one patch
> > > > set.
> > > No it isn't. The hard part is getting the user sync stuff up in general.
> > > 
> > > Adding implicit synchronization on top of that is then rather trivial.
> > Well that's what I disagree with, since I already see some problems that I
> > don't think we can overcome (the atomic ioctl is one). And that's with us
> > only having a fairly theoretical understanding of the overall situation.
> 
> But how should we then ever support user fences with the atomic IOCTL?
> 
> We can't wait in user space since that will disable the support for waiting
> in the hardware.

Well, figure it out :-)

This is exactly why I'm not seeing anything solved with just rolling a
function call to a bunch of places, because it's pretending all things are
solved when clearly that's not the case.

I really think what we need is to first figure out how to support
userspace fences as explicit entities across the stack, maybe with
something like this order:
1. enable them purely within a single userspace driver (like vk with
winsys disabled, or something else like that except not amd because
there's this amdkfd split for "real" compute)
1a. including atomic ioctl, e.g. for vk direct display support this can be
used without cross-process sharing, new winsys protocols and all that fun
2. figure out how to transport these userspace fences with something like
drm_syncobj
2a. figure out the compat story for drivers which dont do userspace fences
2b. figure out how to absorb the overhead if the winsys/compositor doesn't
support explicit sync
3. maybe figure out how to make this all happen magically with implicit
sync, if we really, really care

If we do 3 before we've nailed all these problems, we're just guaranteeing
we'll get the wrong solutions and so we'll then have 3 ways of doing
userspace fences
- the butchered implicit one that didn't quite work
- the explicit one
- the not-so-butchered implicit one with the lessons from the properly
  done explicit one

The thing is, if you have no idea how to integrate userspace fences
explicitly into atomic ioctl, then you definitely have no idea how to do
it implicitly :-)

And "just block" might be good enough for a quick demo, it still breaks
the contract. Same holds for a bunch of the winsys problems we'll have to
deal with here.
-Daniel

> Regards,
> Christian.
> 
> > 
> > Like here at intel we have internal code for compute, and we're starting
> > to hit some interesting cases with interop with media already, but that's
> > it. Nothing even close to desktop/winsys/kms, and that's where I expect
> > will all the pain be at.
> > 
> > Cheers, Daniel
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
