Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 987551BC1E8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 16:52:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EAEC6E7D3;
	Tue, 28 Apr 2020 14:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F216E7D3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 14:52:02 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id y24so3189227wma.4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 07:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=G2UtXPSBaBSuQDmNryXvkig4zo/VMBwvFN3blnW6Rjg=;
 b=NRhdTs7B2i1rhxIjaEMj46idWaRDMunQHaPOQJivSqrw7tsscr6AHoAF40ZFSsMwBp
 j7vHG7F4WddrVXRVsmcF1lxFS2RHS0QMZ+pd8wW5GwZjNr5WBTmLjcyGdJ5smIzHewYi
 ME87WqMpak7okl/wf30wXBayd3bSo9BJ7R5iA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G2UtXPSBaBSuQDmNryXvkig4zo/VMBwvFN3blnW6Rjg=;
 b=ke6MMbenEvAG6oeAJfFwOIpLPfcCx2hkPgxmPBcii05RjDKTaIkUawsCgB2OAEQRek
 OSvFMo37W95Gdhl0SpjPnDjxTuUnjx9+bQBWtRkFzxmfzRnR99BYb+HkP9Q+nKWKiR6V
 xWcl4NjMW7goldfuf2EuVlwMf+94RD5BqpuV9KA8e2QGGXgWWaYeZq+ygMkg9lNitf54
 1Anh20bHzFaS4nKzXeH1o7L4rs8safYrcVPI+k3wsGdRj9ExS7rGZXKHzhiN+Cy+MF9Q
 zjUjgG65ho6faTdlWYLooJuEtysuAwRbCHfqascZMwUovLeE0k4NBsVTlTOU2NYoP001
 3+AQ==
X-Gm-Message-State: AGi0PuY/XVLqlyTdOZflPpc3+uuP8GlkF8YnmdfGyPZFIsLlSCotlw7X
 EcJl2Y0WKjdaO+adVTcqocEiUA==
X-Google-Smtp-Source: APiQypJvSrGQJjx56jnNugSHRNJ8z+NVyha1AnEJ2PBDMFhrCNNzjUBKFm+sQAD6K9JL++zQ8CIsaQ==
X-Received: by 2002:a7b:c250:: with SMTP id b16mr5233617wmj.100.1588085520574; 
 Tue, 28 Apr 2020 07:52:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w12sm25201241wrk.56.2020.04.28.07.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 07:51:59 -0700 (PDT)
Date: Tue, 28 Apr 2020 16:51:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: Operating KMS UAPI (Re: RFC: Drm-connector properties managed by
 another driver / privacy screen support)
Message-ID: <20200428145157.GP3456981@phenom.ffwll.local>
References: <87tv1k4vl6.fsf@intel.com>
 <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
 <20200417120226.0cd6bc21@eldfell.localdomain>
 <CAKMK7uEv_khNFC=JUyuQgDZp1p5eudDCrH0we+UdEdTV3H=Tsg@mail.gmail.com>
 <20200420112704.68d02472@eldfell.localdomain>
 <20200420130420.1a24197e@eldfell.localdomain>
 <20200421121552.GT3456981@phenom.ffwll.local>
 <20200421173300.3cd078f4@eldfell.localdomain>
 <CAKMK7uEr6eHfEuGfLU_JTk=fbo=FBcU_aasGwUTRACny7WeojQ@mail.gmail.com>
 <20200424113216.3b5d4e90@eldfell.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200424113216.3b5d4e90@eldfell.localdomain>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Christian Kellner <ckellner@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Hans de Goede <hdegoede@redhat.com>, Nitin Joshi1 <njoshi1@lenovo.com>,
 Rajat Jain <rajatja@google.com>, Mark Pearson <mpearson@lenovo.com>,
 Benjamin Berg <bberg@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 24, 2020 at 11:32:16AM +0300, Pekka Paalanen wrote:
> On Thu, 23 Apr 2020 17:01:49 +0200
> Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > On Tue, Apr 21, 2020 at 4:33 PM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > >
> > > On Tue, 21 Apr 2020 14:15:52 +0200
> > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > >  
> 
> ...
> 
> > > > Note that the kernel isn't entire consistent on this. I've looked a bit
> > > > more closely at stuff. Ignoring content protection I've found following
> > > > approaches things:
> > > >
> > > > - self refresh helpers, which are entirely transparent. Therefore we do a
> > > >   hack to set allow_modeset when the self-refresh helpers need to do a
> > > >   modeset, to avoid total surprise for userspace. I think this is only ok
> > > >   for these kind of behind-the-scenes helpers like self-refresh.
> > > >
> > > > - link-status is always reset to "good" when you include any connector,
> > > >   which might force a modeset. Even when allow_modeset isn't set by
> > > >   userspace. Maybe we should fix that, but we've discussed forever how to
> > > >   make sure a bad link isn't ever stuck at "bad" for old userspace, so
> > > >   we've gone with this. But maybe limiting to only allow_modeset cases
> > > >   would also work.  
> > >
> > > Wait, what do you mean "include any connector"?
> > >
> > > What exactly could cause a modeset instead of failure when
> > > ALLOW_MODESET is not set?  
> > 
> > If you do an atomic commit with the connector included that has the
> > bad link status, then it'll reset it to Good to try to get a full
> > modeset to restore stuff. If you don't also have ALLOW_MODESET set,
> > it'll fail and userspace might be sad and not understand what's going
> > on. We can easily fix this by only forcing the link training to be
> > fixed if userspace has set ALLOW_MODESET.
> 
> Hi,
> 
> oh, that's ok, the fail case is there like it should.
> 
> It sounded like even if userspace does not set ALLOW_MODESET, the
> kernel would still do a modeset in come cases. I'm happy to have
> misunderstood.

Well currently that can go wrong, if you include a connector and a
link-status is bad. But could be fixed fairly easily.

> > > Does that mean that I'll never need to implement link-status handling
> > > in Weston, because the kernel will recover the link anyway? If the
> > > kernel does that, then what's the point of having a link-status
> > > property to begin with?  
> > 
> > Well generally all your compositor does all day long is flip buffers.
> > So you'll never get the kernel into restoring the link. Hence the
> > uevent, so that the compositor can a) update the mode list, which
> > might have changed b) do the modeset to restore stuff. The
> > auto-fallback is so that stuff like users manually
> > disabling/re-enabling an output actually helps with fixing stuff.
> 
> Ok, that's fine.
> 
> If link goes bad while Weston does not implement link-status, I'm
> totally happy to degree any fallout from that to be a Weston bug. It
> has never worked (right?), so it cannot be a kernel regression. It is
> quite important to me to be able to say to that a failure is a Weston
> bug, not a kernel regression, to not piss on the kernel devs.
> 
> > > > - I guess we could do stuff that only fires off when allow_modeset is set,
> > > >   but I haven't found some examples. I thought we've had some outside of
> > > >   self-refresh helpers already. The closest I've found is again
> > > >   link-status, which never allows userspace to set BAD, and silently
> > > >   upgrades to GOOD. So that userspace doing a blind safe/restore can't
> > > >   wreak stuff permanently.  
> > >
> > > Sounds like link-status was designed with a blind save/restore in mind.  
> > 
> > Yeah that part we didn't screw up.
> > 
> > > > It's all a bit nasty :-/
> > > >
> > > > I think we should at least allow userspace to do a blind restore with
> > > > allow_modeset and not expect bad side-effects. That would mean fixing at
> > > > least the content protection stuff.
> > > >
> > > > Plus documenting this in the kernel somewhere. As the official thing to
> > > > do. But maybe we want some actual userspace doing this before we enshrine
> > > > it as official policy. The content protection fix is a one-liner and can
> > > > be cc'ed stable.  
> > >
> > > I'd probably not go there, a blind save does not guarantee a good
> > > state. The fix to "Content Protection" is not necessary (as long as
> > > userspace does not do a blind save/restore) if we can get the default
> > > state from the kernel. If we get the default state from the kernel,
> > > then userspace would be doing a blind restore but not save, meaning
> > > that the state actually is sane and writable.
> > >
> > > I'd love to volunteer for writing the Weston code to make use of "get me
> > > sane default state" UAPI, but I'm afraid I'm not in that much control
> > > of my time.  
> > 
> > The problem is, what is your default state? Driver defaults (generally
> > fairly random and mostly everything is off)? After fbcon has done
> > it's, which might never happen when you've disabling fbdev/fbcon?
> > Boot-up state from the firmware for drivers like i915 that support
> > fastboot (and what if that's garbage)? These can all be different too.
> 
> I believe what I want is more or less the driver defaults, or DRM core
> defaults for common KMS properties. It does not matter if they are
> arbitrary, as long as they remain the same across kernel versions. They
> need to be constants, so that I can rely on always getting to the same
> state on the same piece of hardware when I use the "default state"
> regardless of what might be happening software wise.
> 
> But of course the defaults must be legal values and they should make
> some sense. I'd consider "neutral", "identity", and "off" to be
> sensible values, but what that means for each property depends on the
> exact property. So there may be work to be done to unify the default
> values across drivers for driver-specific properties.
> 
> Having stuff off by default is ok. If that makes things not work, then
> we'll fix userspace to understand the new properties that are
> necessary. At no point it can be said to be a kernel regression - at
> least I very much hope and intend so.
> 
> There is always the problem of someone using new userspace first on old
> kernel that does not expose "default state" so userspace doesn't use
> "default state". Then upgrading to new kernel that has "default state"
> that is not good for making things work, but userspace starts using it
> because it becomes available and fails. Is there any way we can stop
> that from being seen as a kernel regression?

If you upgrade the kernel and existing userspace breaks, it's a
regression.

There's no wiggle room in this, the only wiggle room is that sometimes
people don't report issues, and eventually all affected hw is dead.

> Fbcon has exactly the problem that fbcon might not exist, so we cannot
> rely on that. Is fbcon even reliable enough to offer constant defaults
> that could be relied upon to stay the same across kernel versions and
> software configurations?

It's getting hacked on quite a bit, in a fairly ad-hoc fashion. So
"defaults as fbcon sets them" is something that's under fair bit of
change.

> State from firmware I would not trust at all, who knows when a firmware
> upgrade changes things.
> 
> What I'm saying is, the "default state" would very much be UABI. Not
> just how to access it, but the exact values of it for all existing
> properties. The important invariant is: for the same piece of hardware,
> I always get the same defaults (if any), regardless of any software or
> firmware versions.

Yup, that's why default state exposed by the kernel is such a pain: It's
uapi. If we change it, we can break something somewhere. And the problem
is complex enough that there's going to be lots of opinions about what
the default should be.

fbcon is a lot easier here, since there there's at least some agreement
that a working console should be visible and preferrably right side up and
all that.

> This invariant should guarantee that e.g. measured monitor color
> profiles stay valid across kernel upgrades. I know, people who actually
> care about color do not trust even reboots, but if we can let them get
> away with just verifying the profile instead of wasting hours in
> re-measuring the profile, that would be good.
> 
> When a driver starts supporting a new property, it must set the default
> value of the property to the value it has been using implicitly before.
> But if that implicit value was not hardcoded and depends on variable
> factors, then we probably cannot avoid a change in behaviour when
> introducing the property or "default values".

The problem is in figuring out that implicit value. In some cases I think
it's even "whatever the hw booted with", but I've tried to handle these
kinds of issues with atomic at least.

> > The hard part isn't the uapi, it's the implementation and defining
> > what you mean. Generally everyone wants their own version of default
> > value semantics, so this a) encodes policy, which we try to avoid in
> > the kernel and b) will be epic amounts of endless bikeshedding and
> > fighting between use-cases.
> 
> It's a policy, yes. But we need a single source of arbitrary default
> values, so that we have a strategy for achieving the same hardware
> state even when userspace does not understand all KMS properties:
> 
> - after losing and re-gaining DRM master status (e.g. temporary
>   VT-switch to another KMS program that modifies state I don't
>   understand), and
> 
> - across changes in the software stack.
> 
> The former is the most important point, the latter would be good to
> have.

But you can fix the above use-case also with save&restore. Which we're
trying to support (but even that has bugs).

> We already have a policy in the kernel: fbcon KMS state. If everyone
> can agree to that state, it's fine by me, but it also needs to be
> available when fbcon support is disabled. Maybe this could be a path
> forward? Expose what state fbcon would use, regardless of whether fbcon
> exists. It would probably miss the latter point, though, but that could
> be acceptable.
> 
> If we could trust that the KMS state is "sane" when any KMS program
> starts, then this problem doesn't exist: just read out the KMS state on
> start-up and use that. But since we don't know where the existing KMS
> state comes from, it could be anything. And for smooth hand-off between
> display servers, we can't have per DRM file description KMS state
> either.

You can assume that boot-up state is about as "sane" as it gets. So a
system compositor (in logind or whatever, it already deals with this
stuff) can reset the screen.

For everything else I'm not sure kernel defaults actually fixes anything.
It just gives everyont the illusion that now the problem is fixed, except
the fix is now kernel uapi, which means we can never change it.

The upshot of doing the exact same as a logind request along the lines of
"pls reset display to sane state, thx" is that logind can be changed much
easier than kernel uapi in case we get this wrong. Which we will.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
