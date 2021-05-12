Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D257937B889
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 10:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F246E135;
	Wed, 12 May 2021 08:50:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969716E135
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 08:50:04 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id g14so26135962edy.6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 01:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=tvZdri4YY1VGCyz1KxJ8O+CjrSTNxyfH/Sl+XqkNaqw=;
 b=DJAMQ8qYg3NQ288F5jQhPHumPlfKt8U9CeREzB17TqABHKVIMGAl22u3K1ZhHbHaOT
 ezCMbC9XNmm1/ErRH6hIDE6dDKG5seyR2EdAflRpt4XWa/GOGCvrY9/9j7fLQNe0eb6K
 qOljW+6lPN/m/Ep8Of4Mup58P+Ut/zj5pzb0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=tvZdri4YY1VGCyz1KxJ8O+CjrSTNxyfH/Sl+XqkNaqw=;
 b=jJ+Bk1gUYe7h/vL03T+EglCBFROlFqAzm0Mq6r2s7hYt7WXBvxBLD7errPsAw+tTUD
 5ky3/8oa+dljqsKY6tj0GcqZ0R0a4gLYEp3nFB6+ChhMOl6YARQ7hf9UtDT7GumnLL/d
 in3C/3aCPIICwOcLT4A6HnceSt3yNEjqXXhywW/MPxxAT+lftcvtNNafSXxdmbhSFGvS
 ENSB0v5Vt0wn1hDz08tkuSsRk1evliYvc7BT3WxO2nw9Ag3u9MLedaJ14MM6Ff7285oE
 Y66VnuyUeBf8I5IIuGwcvMnZpWEYGO+L5kHKn3qDFLwKua9xBxCYqWJDEEzqut8+k9iW
 //xQ==
X-Gm-Message-State: AOAM533lltVJxKu+Ux4YFRfij7JX/h8VtCm+P0VIzyqsMDvlkMG74ZJ3
 Whphj0e3wAgCBdgENJSrMJg1Pg==
X-Google-Smtp-Source: ABdhPJyNaLA2fAhDBri5AXhHy3r8Qf6yEnXZZGo46MRCk53embWlTzLwl7SaU5wuyfekE5A6iaWoMg==
X-Received: by 2002:aa7:d90d:: with SMTP id a13mr40806650edr.76.1620809403206; 
 Wed, 12 May 2021 01:50:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y17sm9691605ejc.79.2021.05.12.01.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 01:50:02 -0700 (PDT)
Date: Wed, 12 May 2021 10:50:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [RFC] Implicit vs explicit user fence sync
Message-ID: <YJuWufxlbYuD2gpd@phenom.ffwll.local>
References: <YJFkN/bgN6UCXdvA@phenom.ffwll.local>
 <f1616be5-a8cb-076d-a63d-9554a76b0b0a@gmail.com>
 <YJoy6oI34tQZMt6/@phenom.ffwll.local>
 <0128750d-56bf-7697-0fda-0342c7b7df17@gmail.com>
 <YJqTeQAjsr1Tn9CZ@phenom.ffwll.local>
 <a08a4b30-5ae5-49ac-bad0-c77a5cabbecd@gmail.com>
 <YJq1T8yWXSW6TRjW@phenom.ffwll.local>
 <d91f5635-9f03-d1ea-4bc5-594b42402eaa@gmail.com>
 <YJuOOVSayHwz2ug7@phenom.ffwll.local>
 <fd8dc2ec-9d05-e645-759a-0426e31bd202@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd8dc2ec-9d05-e645-759a-0426e31bd202@gmail.com>
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

On Wed, May 12, 2021 at 10:23:04AM +0200, Christian König wrote:
> Am 12.05.21 um 10:13 schrieb Daniel Vetter:
> > On Tue, May 11, 2021 at 09:34:11PM +0200, Christian König wrote:
> > > Am 11.05.21 um 18:48 schrieb Daniel Vetter:
> > > > [SNIP]
> > > > > Why?
> > > > If you allow implicit fencing then you can end up with
> > > > - an implicit userspace fence as the in-fence
> > > > - but an explicit dma_fence as the out fence
> > > > 
> > > > Which is not allowed. So there's really no way to make this work, except
> > > > if you stall in the ioctl, which also doesn't work.
> > > Ok, wait a second. I really don't understand what's going on here.
> > > 
> > > The out fence is just to let the userspace know when the frame is displayed.
> > > Or rather when the old frame is no longer displayed so that it can be
> > > reused, right?
> > > 
> > > Then why does that need to be a dma_fence? We don't use that for memory
> > > management anywhere, don't we?
> > It can be a sync_file, so you can queue up the next rendering targeting
> > the old backbuffer right away. On memory constraint devices where
> > triple-buffering is prohibitive this is apparently a pretty cool trick or
> > something like that.
> 
> Yeah, I'm aware of that.
> 
> But we don't really need that for device we want to interop with userspace
> queues, don't we?
> 
> > > > So you have to do an uapi change here. At that point we might as well do
> > > > it right.
> > > I mean in the worst case we might need to allow user fences with sync_files
> > > as well when that is really used outside of Android.
> > > 
> > > But I still don't see the fundamental problem here.
> > Making sync_file use implicit is more pain, it becomes sprawling pretty
> > quickly.
> 
> Agreed, but I don't see supporting sync_file and out fences as something
> necessarily.
> 
> As far as I can see we don't need to support that burden for the use cases
> we have for implicit sync.
> 
> And even if we have to it is possible to implement.
> 
> > Anyway I think we're just turning in circles. My take is that your patch
> > series here demonstrates nothing beyond "adding function calls that do
> > nothing is easy", the real deal is in making it work. And I think it's
> > easier to make this all work with explicit userspace fencing first and
> > then worry about how we maybe make this work implicitly. Instead of what
> > you propose, which is rig up a lot of scaffolding without having any idea
> > whether it's even in the right place. That seems very backwards to me.
> 
> And that's what I disagree on.
> 
> Supporting implicit sync in the kernel for the functionality we need to
> amdgpu is relatively easily.
> 
> Change all of userspace to not rely on implicit sync any more is really hard
> compared to that.
> 
> Dropping implicit sync in userspace has a lot of advantage and should be
> pushed for, but not because it is a prerequisite of user fences.

Yeah but if we support userspace fences with implicit sync only, because
that's right now the only thing amdgpu needs, then we make really, really
sure the transition to explicit sync will never happen.

Also if the goal really is to only do the minimal thing to keep amdgpu
working on existing compositors, then imo the right solution is to just do
the kernel-augmented userspace submit I've proposed. Not this.

The kernel augmented userspace submit keeps all dma_fence stuff working
_exactly_ like it currently does, including drm/scheduler sorting
depenendencies and everything. So from a "will it work" point of view a
much more solid solution.

And it doesn't require us to create an extremely warty uapi where if you
happen to use implicit userspace fences alot of things kinda stop working,
for no reason.

So if youre overall goal is to just not touch any compositor/winsys
protocol at all, there _is_ a very clean solution imo.
-Daniel

> Regards,
> Christian.
> 
> > 
> > Plus I really don't like retro-fitting userspace fences into implicit sync
> > and sync_file and everything. But that's not the main issue I have here.
> > -Daniel
> > 
> > > Regards,
> > > Christian.
> > > 
> > > > Of course if you only care about some specific compositors (or maybe only
> > > > the -amdgpu Xorg driver even) then this isn't a concern, but atomic is
> > > > cross-driver so we can't do that. Or at least I don't see a way how to do
> > > > this without causing endless amounts of fun down the road.
> > > > 
> > > > > > So I have a plan here, what was yours?
> > > > > As far as I see that should still work perfectly fine and I have the strong
> > > > > feeling I'm missing something here.
> > > > > 
> > > > > > > Transporting fences between processes is not the fundamental problem here,
> > > > > > > but rather the question how we represent all this in the kernel?
> > > > > > > 
> > > > > > > In other words I think what you outlined above is just approaching it from
> > > > > > > the wrong side again. Instead of looking what the kernel needs to support
> > > > > > > this you take a look at userspace and the requirements there.
> > > > > > Uh ... that was my idea here? That's why I put "build userspace fences in
> > > > > > userspace only" as the very first thing. Then extend to winsys and
> > > > > > atomic/display and all these cases where things get more tricky.
> > > > > > 
> > > > > > I agree that transporting the fences is easy, which is why it's not
> > > > > > interesting trying to solve that problem first. Which is kinda what you're
> > > > > > trying to do here by adding implicit userspace fences (well not even that,
> > > > > > just a bunch of function calls without any semantics attached to them).
> > > > > > 
> > > > > > So if there's more here, you need to flesh it out more or I just dont get
> > > > > > what you're actually trying to demonstrate.
> > > > > Well I'm trying to figure out why you see it as such a problem to keep
> > > > > implicit sync around.
> > > > > 
> > > > > As far as I can tell it is completely octagonal if we use implicit/explicit
> > > > > and dma_fence/user_fence.
> > > > > 
> > > > > It's just a different implementation inside the kernel.
> > > > See above. It falls apart with the atomic ioctl.
> > > > -Daniel
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
