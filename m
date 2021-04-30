Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 204E036FF2F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 19:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAFAC6F570;
	Fri, 30 Apr 2021 17:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2950A6F572
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 17:08:14 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id e25so40679855oii.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 10:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gfr5lVaI0bCQzTUtkPp3EpnOpb/pstDHaEYjSd2cpb4=;
 b=FmSNaVu8p9lUNXuJg9uSm0S21EVx/AYi1+ThHQLbgDLpPBWNokcZouXSR4lgusDSU7
 BXmJj7LiC6vMqweSXsbBf1jxgcEJlwexxQ0/LVepV9T3TDY4nxJe5LEb50N40b9xu+XJ
 0ex4Nx8Wqkw9d8DoMzTWSIlpW3NnMY5a+T1A0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gfr5lVaI0bCQzTUtkPp3EpnOpb/pstDHaEYjSd2cpb4=;
 b=Y48LLXMUvF9zPaOOrTbyFTo2bZ4sicIN+fngXHgJi7bz9gEIr8i6pU+8GhT3yUBEVC
 51YTsvh8Z439+gonrcvPr5s6QGYxj8HRXkJfR5CZcruh/a7zYnYmcRIjG6T6pQ0e9o5x
 Or6JUddZWj93McHBocblgjFZjvVfxwDynYTBLT2gjVhLnBHh3bEZAEVLjDr1s1bXycV6
 5aBedJrX+F9n6DCgwGIB1Lg2Bxnkzp8AOED7elYSxjC7oaZQonpnBIseGqnHCXdaqjo2
 aSRAD4xWmTnmt+moIZibpYjMDsY8aps/ZfT3iB0RS4Wr7m72OUy6VJntLoP/T3N+iIsb
 jvsg==
X-Gm-Message-State: AOAM533EnAHEs2MO4hloHDYwReFBXzYwc30bvs1m2ymD3ZUSj5me9qTX
 WygHHyUnwXUoXZgJtTBVv6yMRK0xCchLZhVTUJt0F8c+5Ls=
X-Google-Smtp-Source: ABdhPJxxUYtkFx761unOTwxTUxor41KzlCnpQl8tEQRMqSWZ9XKACpDWNC6oRwYDolCfHXri1b9kQlHwc8rK6QrqDis=
X-Received: by 2002:aca:2219:: with SMTP id b25mr11130209oic.14.1619802493252; 
 Fri, 30 Apr 2021 10:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-17-jason@jlekstrand.net>
 <YIrWB3fX3TseroSh@phenom.ffwll.local>
 <CAOFGe97b_LSGfrLo3LBhBuvx8wduVJLf0ySC=gG7Z+L6v2dPzQ@mail.gmail.com>
 <YIsBSRwNGiiF/kxE@phenom.ffwll.local>
 <CAOFGe97qi=jB+MGPtJyX-QYmjvTe2QPeijsNCeJ2z+E19x6ZNg@mail.gmail.com>
 <YIsD8OSFdLnjz5cL@phenom.ffwll.local>
 <CAOFGe96DXzFVX77f5qVMrCzJq2Cuco1pOyCfYmo_1v6rmxpMKg@mail.gmail.com>
 <CAKMK7uGzAGDS97hoj0xjzw8EJoPZazsLF=wxUz90cswjPSHthQ@mail.gmail.com>
 <CAOFGe94EQ5Q61FPwJgnv8Y5DpMhvaDGSxTjBwm2T7mXHX9fkOQ@mail.gmail.com>
 <CAKMK7uEnoM5CpCA8x0RiBH2F3WJSBz6pANVdZFdWfejL1ARDvA@mail.gmail.com>
 <CAOFGe94m503Pz7JV_OqHaMkPxkED1ZB_p-hzDU9Zoe-_9r71ow@mail.gmail.com>
In-Reply-To: <CAOFGe94m503Pz7JV_OqHaMkPxkED1ZB_p-hzDU9Zoe-_9r71ow@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 30 Apr 2021 19:08:02 +0200
Message-ID: <CAKMK7uFSft5K73cqjA60FfmGz_c8Ch7b6i3+ZrzxCSYoFTv8Vw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 16/21] drm/i915/gem: Delay context creation
To: Jason Ekstrand <jason@jlekstrand.net>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 30, 2021 at 6:57 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> On Fri, Apr 30, 2021 at 11:33 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Fri, Apr 30, 2021 at 6:27 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
> > >
> > > On Fri, Apr 30, 2021 at 1:53 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Thu, Apr 29, 2021 at 11:35 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
> > > > >
> > > > > On Thu, Apr 29, 2021 at 2:07 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > >
> > > > > > On Thu, Apr 29, 2021 at 02:01:16PM -0500, Jason Ekstrand wrote:
> > > > > > > On Thu, Apr 29, 2021 at 1:56 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > > > > On Thu, Apr 29, 2021 at 01:16:04PM -0500, Jason Ekstrand wrote:
> > > > > > > > > On Thu, Apr 29, 2021 at 10:51 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > > > > > > > +     ret = set_proto_ctx_param(file_priv, pc, args);
> > > > > > > > > >
> > > > > > > > > > I think we should have a FIXME here of not allowing this on some future
> > > > > > > > > > platforms because just use CTX_CREATE_EXT.
> > > > > > > > >
> > > > > > > > > Done.
> > > > > > > > >
> > > > > > > > > > > +     if (ret == -ENOTSUPP) {
> > > > > > > > > > > +             /* Some params, specifically SSEU, can only be set on fully
> > > > > > > > > >
> > > > > > > > > > I think this needs a FIXME: that this only holds during the conversion?
> > > > > > > > > > Otherwise we kinda have a bit a problem me thinks ...
> > > > > > > > >
> > > > > > > > > I'm not sure what you mean by that.
> > > > > > > >
> > > > > > > > Well I'm at least assuming that we wont have this case anymore, i.e.
> > > > > > > > there's only two kinds of parameters:
> > > > > > > > - those which are valid only on proto context
> > > > > > > > - those which are valid on both (like priority)
> > > > > > > >
> > > > > > > > This SSEU thing looks like a 3rd parameter, which is only valid on
> > > > > > > > finalized context. That feels all kinds of wrong. Will it stay? If yes
> > > > > > > > *ugh* and why?
> > > > > > >
> > > > > > > Because I was being lazy.  The SSEU stuff is a fairly complex param to
> > > > > > > parse and it's always set live.  I can factor out the SSEU parsing
> > > > > > > code if you want and it shouldn't be too bad in the end.
> > > > > >
> > > > > > Yeah I think the special case here is a bit too jarring.
> > > > >
> > > > > I rolled a v5 that allows you to set SSEU as a create param.  I'm not
> > > > > a huge fan of that much code duplication for the SSEU set but I guess
> > > > > that's what we get for deciding to "unify" our context creation
> > > > > parameter path with our on-the-fly parameter path....
> > > > >
> > > > > You can look at it here:
> > > > >
> > > > > https://gitlab.freedesktop.org/jekstrand/linux/-/commit/c805f424a3374b2de405b7fc651eab551df2cdaf#474deb1194892a272db022ff175872d42004dfda_283_588
> > > >
> > > > Hm yeah the duplication of the render engine check is a bit annoying.
> > > > What's worse, if you tthrow another set_engines on top it's probably
> > > > all wrong then. The old thing solved that by just throwing that
> > > > intel_context away.
> > >
> > > I think that's already mostly taken care of.  When set_engines
> > > happens, we throw away the old array of engines and start with a new
> > > one where everything has been memset to 0.  The one remaining problem
> > > is that, if userspace resets the engine set, we need to memset
> > > legacy_rcs_sseu to 0.  I've added that.
> > >
> > > > You're also not keeping the engine id in the proto ctx for this, so
> > > > there's probably some gaps there. We'd need to clear the SSEU if
> > > > userspace puts another context there. But also no userspace does that.
> > >
> > > Again, I think that's handled.  See above.
> > >
> > > > Plus cursory review of userspace show
> > > > - mesa doesn't set this
> > > > - compute sets its right before running the batch
> > > > - media sets it as the last thing of context creation
> > > >
> > > > So it's kinda not needed. But also we're asking umd to switch over to
> > > > CTX_CREATE_EXT, and if sseu doesn't work for that media team will be
> > > > puzzled. And we've confused them enough already with our uapis.
> > > >
> > > > Another idea: proto_set_sseu just stores the uapi struct and a note
> > > > that it's set, and checks nothing. To validate sseu on proto context
> > > > we do (but only when an sseu parameter is set):
> > > > 1. finalize the context
> > > > 2. call the real set_sseu for validation
> > > > 3. throw the finalized context away again, it was just for validating
> > > > the overall thing
> > > >
> > > > That way we don't have to consider all the interactions of setting
> > > > sseu and engines in any order on proto context, validation code is
> > > > guaranteed shared. Only downside is that there's a slight chance in
> > > > behaviour: SSEU, then setting another engine in that slot will fail
> > > > instead of throwing the sseu parameters away. That's the right thing
> > > > for CTX_CREATE_EXT anyway, and current userspace doesn't care.
> > > >
> > > > Thoughts?
> > >
> > > I thought about that.  The problem is that they can set_sseu multiple
> > > times on different engines.  This means we'd have to effectively build
> > > up an arbitrary list of SSEU set operations and replay it.  I'm not
> > > sure how I feel about building up a big data structure.
> >
> > Hm, but how does this work with proto ctx then? I've only seen a
> > single sseu param set in the patch you linked.
>
> It works roughly the same as it works now:
>
>  - If set_sseu is called, it always overwrites whatever was there
> before.  If it's called for a legacy (no user-specified engines)
> context, it overwrites legacy_rcs_sseu.  If it's called on a user
> engine context, it overwrites the sseu on the given engine.
>  - When set_engines is called, it throws away all the user engine data
> (if any) and memsets legacy_rcu_sseu to 0.  The end result is that
> everything gets reset.

I think I need to review this carefully in the new version. Definitely
too much w/e here already for tricky stuff :-)

> > > > > I'm also going to send it to trybot.
> > > >
> > > > If you resend pls include all my r-b, I think some got lost in v4.
> > >
> > > I'll try and dig those up.
> > >
> > > > Also, in the kernel at least we expect minimal commit message with a
> > > > bit of context, there's no Part-of: link pointing at the entire MR
> > > > with overview and discussion, the patchwork Link: we add is a pretty
> > > > bad substitute. Some of the new patches in v4 are a bit too terse on
> > > > that.
> > >
> > > Yup.  I can try to expand things a bit more.
> > >
> > > > And finally I'm still not a big fan of the add/remove split over
> > > > patches, but oh well.
> > >
> > > I'm not either but working through all this reminded me of why I
> > > didn't do it more gradual.  The problem is ordering.  If add and
> > > remove at the same time and do it one param at a time, we'll end up
> > > with a situation in the middle where some params will only be allowed
> > > to be set on the proto-ctx and others will force a proto-ctx ->
> > > context conversion.  If, for instance, one UMD sets engines first and
> > > then VMs and another sets VMs first and then engines, there's no way
> > > to do a gradual transition without breaking one of them.  Also, we
> > > need to handle basically all the setparam complexity in order to
> > > handle creation structs and, again, those can come in any order.
> >
> > Yeah I know, but I considered that. I think compute-runtime uses
> > CTX_CREATE_EXT, it's only media.
>
> That doesn't really matter because both go through the same path.
> Anything that uses CONTEXT_CREATE_EXT is identical to something which
> creates the context and then calls SET_CONTEXT_PARAM in the same order
> as the structs in the extension chain.
>
> Incidentally, this also means that if we do it gradually, we have to
> handle finalizing the proto-ctx mid-way through handling the chain of
> create extensions.  That should be possible to handle if a bit tricky.
> It'll also mean we'll have a (small) range of kernels where the
> CONTEXT_CREATE_EXT method is broken if you get it in the wrong order.
>
> > So we need to order the patches in
> > exactly the order media calls setparam. And then we're good.
>
> Mesa only ever sets engines.  Upstream compute only ever sets the VM.
> Media always sets the VM first.  So, if we handle VM first, we should
> be good-to-go, I think.
>
> > Worst case it's exactly as useful in bisecting as your approach here
> > (you add dead code first, then use it,
>
> It's not dead.  At the time it's added, it's used for all
> CONTEXT_CREATE_EXT.  Then, later, it becomes used for everything.
>
> > so might as well just squash it
> > all down to one), but if we get the ordering right it's substantially
> > better.
>
> I can try to spin a v5 and see how bad it ends up being.  I don't
> really like breaking CONTEXT_CREATE_EXT in the middle, though.

Hm right, I forgot that we also de-proto in the middle of
CONTEXT_CREATE_EXT while the conversion is going on. This really is
annoying.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
