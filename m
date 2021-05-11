Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D007C37AC51
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 18:48:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F5A89FCC;
	Tue, 11 May 2021 16:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF196EA99
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 16:48:19 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id m12so30787444eja.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 09:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=6Uu6LdzLdr1Fz83vh+k4vSbVeuGZtQz1kTtPqlNFurQ=;
 b=SXcHSMGuUHrxr1iFjg98CXr/XQp1hLdL+ZNj4S34cIEGlEV2i8R4+aVs0MCbJ7PnbU
 Ucpl+Ntxpiu+F6NFfnpf//ThulxnYaL7t6WPkFJ6pww8vSsDNTdyOrPukCZZUBfjmbIx
 7w1suRc6yXPTCV7g1tMYJxHy8MKfs4XZuCX24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6Uu6LdzLdr1Fz83vh+k4vSbVeuGZtQz1kTtPqlNFurQ=;
 b=TdaM8SJ7zLxTlgCu5HTVJCjNsU6+v3xIfIGIn2Fc5XpqKpbbYM/yNQ9TGvRjwVJVJh
 Ql/Yee9ICq3dHSQ7mQaiszP9U46ev1UF5vafyotgT6r+jUjITqTCR2D6Es2K5K2Cd6Fn
 tc7h1hLts8trL+52EuzeFvWJbUy728Zhcpp2o6iqIDHgQ68hyVFQqyZzPqGpeOVHyj/C
 HgUgSlqra0k4OSwF/OpO0KU5lpZlHiQuuRtsscH91sk3CmjINHgCxmWfdi6s2k4MLDl1
 yxCPE9QqO4Bi11r8fxPfscvcdZdw31YLc0pQPk6vcOT+gIxDaC2djuBaGF8Ezcs+N5gz
 8JzA==
X-Gm-Message-State: AOAM530wiDNMvG1MB5tl2J96jFnQC3yb1rn4JQdDz2XkWThjJbnPVqtb
 LVJ+AQDkd3H+s7sBS0yzkOqVNA==
X-Google-Smtp-Source: ABdhPJy9XhgW7HdW2UTgpjJ58uu5oFwDCCQ0Ne+15o1nSJckyFOyzcXgXXEZorR5xqNGikDX8XGXcw==
X-Received: by 2002:a17:906:640c:: with SMTP id
 d12mr4411072ejm.70.1620751697953; 
 Tue, 11 May 2021 09:48:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y21sm14145834edv.77.2021.05.11.09.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 09:48:17 -0700 (PDT)
Date: Tue, 11 May 2021 18:48:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [RFC] Implicit vs explicit user fence sync
Message-ID: <YJq1T8yWXSW6TRjW@phenom.ffwll.local>
References: <20210504132729.2046-1-christian.koenig@amd.com>
 <YJFXG/THrjXqQjyN@phenom.ffwll.local>
 <d266ccd2-3259-99ce-5fd6-b8ae81ac14e9@gmail.com>
 <YJFkN/bgN6UCXdvA@phenom.ffwll.local>
 <f1616be5-a8cb-076d-a63d-9554a76b0b0a@gmail.com>
 <YJoy6oI34tQZMt6/@phenom.ffwll.local>
 <0128750d-56bf-7697-0fda-0342c7b7df17@gmail.com>
 <YJqTeQAjsr1Tn9CZ@phenom.ffwll.local>
 <a08a4b30-5ae5-49ac-bad0-c77a5cabbecd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a08a4b30-5ae5-49ac-bad0-c77a5cabbecd@gmail.com>
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

On Tue, May 11, 2021 at 05:32:29PM +0200, Christian König wrote:
> Am 11.05.21 um 16:23 schrieb Daniel Vetter:
> > On Tue, May 11, 2021 at 09:47:56AM +0200, Christian König wrote:
> > > Am 11.05.21 um 09:31 schrieb Daniel Vetter:
> > > > [SNIP]
> > > > > > And that's just the one ioctl I know is big trouble, I'm sure we'll find
> > > > > > more funny corner cases when we roll out explicit user fencing.
> > > > > I think we can just ignore sync_file. As far as it concerns me that UAPI is
> > > > > pretty much dead.
> > > > Uh that's rather bold. Android is built on it. Currently atomic kms is
> > > > built on it.
> > > To be honest I don't think we care about Android at all.
> > we = amd or we = upstream here?
> 
> we = amd, for everybody else that is certainly a different topic.
> 
> But for now AMD is the only one running into this problem.
> 
> Could be that Nouveau sees this as well with the next hw generation, but who
> knows?
> 
> > > > Why is this not much of a problem if it's just within one driver?
> > > Because inside the same driver I can easily add the waits before submitting
> > > the MM work as necessary.
> > What is MM work here now?
> 
> MM=multimedia, e.g. UVD, VCE, VCN engines on AMD hardware.
> 
> > > > > > > Adding implicit synchronization on top of that is then rather trivial.
> > > > > > Well that's what I disagree with, since I already see some problems that I
> > > > > > don't think we can overcome (the atomic ioctl is one). And that's with us
> > > > > > only having a fairly theoretical understanding of the overall situation.
> > > > > But how should we then ever support user fences with the atomic IOCTL?
> > > > > 
> > > > > We can't wait in user space since that will disable the support for waiting
> > > > > in the hardware.
> > > > Well, figure it out :-)
> > > > 
> > > > This is exactly why I'm not seeing anything solved with just rolling a
> > > > function call to a bunch of places, because it's pretending all things are
> > > > solved when clearly that's not the case.
> > > > 
> > > > I really think what we need is to first figure out how to support
> > > > userspace fences as explicit entities across the stack, maybe with
> > > > something like this order:
> > > > 1. enable them purely within a single userspace driver (like vk with
> > > > winsys disabled, or something else like that except not amd because
> > > > there's this amdkfd split for "real" compute)
> > > > 1a. including atomic ioctl, e.g. for vk direct display support this can be
> > > > used without cross-process sharing, new winsys protocols and all that fun
> > > > 2. figure out how to transport these userspace fences with something like
> > > > drm_syncobj
> > > > 2a. figure out the compat story for drivers which dont do userspace fences
> > > > 2b. figure out how to absorb the overhead if the winsys/compositor doesn't
> > > > support explicit sync
> > > > 3. maybe figure out how to make this all happen magically with implicit
> > > > sync, if we really, really care
> > > > 
> > > > If we do 3 before we've nailed all these problems, we're just guaranteeing
> > > > we'll get the wrong solutions and so we'll then have 3 ways of doing
> > > > userspace fences
> > > > - the butchered implicit one that didn't quite work
> > > > - the explicit one
> > > > - the not-so-butchered implicit one with the lessons from the properly
> > > >     done explicit one
> > > > 
> > > > The thing is, if you have no idea how to integrate userspace fences
> > > > explicitly into atomic ioctl, then you definitely have no idea how to do
> > > > it implicitly :-)
> > > Well I agree on that. But the question is still how would you do explicit
> > > with atomic?
> > If you supply an userpace fence (is that what we call them now) as
> > in-fence, then your only allowed to get a userspace fence as out-fence.
> 
> Yeah, that part makes perfectly sense. But I don't see the problem with
> that?
> 
> > That way we
> > - don't block anywhere we shouldn't
> > - don't create a dma_fence out of a userspace fence
> > 
> > The problem is this completely breaks your "magically make implicit
> > fencing with userspace fences" plan.
> 
> Why?

If you allow implicit fencing then you can end up with
- an implicit userspace fence as the in-fence
- but an explicit dma_fence as the out fence

Which is not allowed. So there's really no way to make this work, except
if you stall in the ioctl, which also doesn't work.

So you have to do an uapi change here. At that point we might as well do
it right.

Of course if you only care about some specific compositors (or maybe only
the -amdgpu Xorg driver even) then this isn't a concern, but atomic is
cross-driver so we can't do that. Or at least I don't see a way how to do
this without causing endless amounts of fun down the road.

> > So I have a plan here, what was yours?
> 
> As far as I see that should still work perfectly fine and I have the strong
> feeling I'm missing something here.
> 
> > > Transporting fences between processes is not the fundamental problem here,
> > > but rather the question how we represent all this in the kernel?
> > > 
> > > In other words I think what you outlined above is just approaching it from
> > > the wrong side again. Instead of looking what the kernel needs to support
> > > this you take a look at userspace and the requirements there.
> > Uh ... that was my idea here? That's why I put "build userspace fences in
> > userspace only" as the very first thing. Then extend to winsys and
> > atomic/display and all these cases where things get more tricky.
> > 
> > I agree that transporting the fences is easy, which is why it's not
> > interesting trying to solve that problem first. Which is kinda what you're
> > trying to do here by adding implicit userspace fences (well not even that,
> > just a bunch of function calls without any semantics attached to them).
> > 
> > So if there's more here, you need to flesh it out more or I just dont get
> > what you're actually trying to demonstrate.
> 
> Well I'm trying to figure out why you see it as such a problem to keep
> implicit sync around.
> 
> As far as I can tell it is completely octagonal if we use implicit/explicit
> and dma_fence/user_fence.
> 
> It's just a different implementation inside the kernel.

See above. It falls apart with the atomic ioctl.
-Daniel

> 
> Christian.
> 
> > -Daniel
> > 
> > > Regards,
> > > Christian.
> > > 
> > > > And "just block" might be good enough for a quick demo, it still breaks
> > > > the contract. Same holds for a bunch of the winsys problems we'll have to
> > > > deal with here.
> > > > -Daniel
> > > > 
> > > > > Regards,
> > > > > Christian.
> > > > > 
> > > > > > Like here at intel we have internal code for compute, and we're starting
> > > > > > to hit some interesting cases with interop with media already, but that's
> > > > > > it. Nothing even close to desktop/winsys/kms, and that's where I expect
> > > > > > will all the pain be at.
> > > > > > 
> > > > > > Cheers, Daniel
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
