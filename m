Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 829346F842B
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 15:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B7F10E601;
	Fri,  5 May 2023 13:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A2D10E605
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 13:35:45 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5068638856dso421473a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 06:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1683293743; x=1685885743;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=n1nxkPMgUhJEfnlIrs+EREvmcGALDoMe5M5Yy7MyVoQ=;
 b=AMJrwsp4asJe2akvlfwSNkcD5XQc9w/boRrHkQX4cX8dE00oEE3Pu7HpCDMV32wI9r
 JOUZyzqOMccS8dKpTnbSSuQPX44SITORXZtCjzDpEY6xnQz2ufKV8QV+eImxIMcEXZeo
 4ikFj/DkgBW4ASLKkSqNru/wP2x7dwxrTzL/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683293743; x=1685885743;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n1nxkPMgUhJEfnlIrs+EREvmcGALDoMe5M5Yy7MyVoQ=;
 b=fjduN4jizdQtZTGTNVScoSLvzDTULGfmfhYnLDWgACWRViVKmDDgqfd3O+mYJJfNWL
 kTf+VMokjxCNsjRnuSipCsDFBiBiJXk0HML3aZWkfFAm4FaQSYjhZ4kjcF4B473NsfFb
 fjDMbuAAcP3a8aCGd02BpYYk3ovLNgM4xKFsr3WLCQoE3sMo07w6YYIUbTYr4EbFhKTq
 hBBobrK4iPIvvglsZRAgdhEu95RSqBfw/JJaPlb0u+cWniaqBW1Tqmfi9kNj98dFJqFs
 uZqHQ60Qm0UwYr4UnwhUeZ9KOG4oSxktvA1w+oUcxh6NITBjo9nUsV3V876T2r0bppfc
 GW1Q==
X-Gm-Message-State: AC+VfDzsZ0uK4ecsG606yR49ruH7oSTMmz6MuIyu8k3OHtSu0D4ASTmF
 Rpgzh7xKKTwG60mjbrsE6TuqnQ==
X-Google-Smtp-Source: ACHHUZ5gJz9/dNCbU13aO8mCy0nuEY9XJoABWayh49evvnOJoNcjNYb9sM4gexk+F9+XyM7J1cC5hg==
X-Received: by 2002:a17:906:7498:b0:963:2f13:8808 with SMTP id
 e24-20020a170906749800b009632f138808mr1179600ejl.3.1683293743424; 
 Fri, 05 May 2023 06:35:43 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 de38-20020a1709069be600b0094e1344ddfdsm958058ejc.34.2023.05.05.06.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 06:35:42 -0700 (PDT)
Date: Fri, 5 May 2023 15:35:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH] Documentation/gpu: Requirements for driver-specific KMS
 uAPIs
Message-ID: <ZFUGLT0fnFT6ffhA@phenom.ffwll.local>
References: <20230504212557.61049-1-harry.wentland@amd.com>
 <20230505114320.1eb77237.pekka.paalanen@collabora.com>
 <ZFTXl3qPn7E0pQWO@phenom.ffwll.local>
 <da677863-3039-86e5-0ccc-10d1085fa962@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da677863-3039-86e5-0ccc-10d1085fa962@amd.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 dri-devel@lists.freedesktop.org, Xaver Hugl <xaver.hugl@gmail.com>,
 Melissa Wen <mwen@igalia.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <mdaenzer@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 05, 2023 at 09:20:26AM -0400, Harry Wentland wrote:
> 
> 
> On 5/5/23 06:16, Daniel Vetter wrote:
> > On Fri, May 05, 2023 at 11:43:20AM +0300, Pekka Paalanen wrote:
> >> On Thu, 4 May 2023 17:25:57 -0400
> >> Harry Wentland <harry.wentland@amd.com> wrote:
> >>
> >>> We have steered away for a long time now from driver-specific KMS APIs
> >>> for good reasons but never codified our stance. With the proposal of
> >>> new, driver-specific color management uAPIs [1] it is important to
> >>> outline the requirements for the rare times when driver-specific KMS
> >>> uAPIs are desired in order to move complex topics along.
> >>>
> >>> [1] https://patchwork.freedesktop.org/series/116862/
> >>>
> >>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> >>> Cc: Simon Ser <contact@emersion.fr>
> >>> Cc: Joshua Ashton <joshua@froggi.es>
> >>> Cc: Michel Dänzer <mdaenzer@redhat.com>
> >>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> >>> Cc: Jonas Ådahl <jadahl@redhat.com>
> >>> Cc: Alex Goins <agoins@nvidia.com>
> >>> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> >>> Cc: Melissa Wen <mwen@igalia.com>
> >>> Cc: Aleix Pol <aleixpol@kde.org>
> >>> Cc: Xaver Hugl <xaver.hugl@gmail.com>
> >>> Cc: Victoria Brekenfeld <victoria@system76.com>
> >>> Cc: Daniel Vetter <daniel@ffwll.ch>
> >>> Cc: Dave Airlie <airlied@gmail.com>
> >>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >>> Cc: Uma Shankar <uma.shankar@intel.com>
> >>> To: dri-devel@lists.freedesktop.org
> >>> ---
> >>>  Documentation/gpu/drm-uapi.rst | 32 ++++++++++++++++++++++++++++++++
> >>>  1 file changed, 32 insertions(+)
> >>>
> >>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> >>> index ce47b4292481..eaefc3ed980c 100644
> >>> --- a/Documentation/gpu/drm-uapi.rst
> >>> +++ b/Documentation/gpu/drm-uapi.rst
> >>> @@ -118,6 +118,38 @@ is already rather painful for the DRM subsystem, with multiple different uAPIs
> >>>  for the same thing co-existing. If we add a few more complete mistakes into the
> >>>  mix every year it would be entirely unmanageable.
> >>>  
> >>> +.. _driver_specific:
> >>> +
> >>> +Driver-Specific DRM/KMS uAPI
> >>> +============================
> >>> +
> >>> +Driver-specific interfaces are strongly discouraged for DRM/KMS interfaces.
> >>> +Kernel-modesetting (KMS) functionality does in principle apply to all drivers.
> >>> +Driver-specific uAPIs tends to lead to unique implementations in userspace and
> >>> +are often hard to maintain, especially when different drivers implement similar
> >>> +but subtly different uAPIs.
> >>> +
> >>> +At times arriving at a consensus uAPI can be a difficult and lengthy process and
> >>> +might benefit from experimentation. This experimentation might warrant
> >>> +introducing driver specific APIs in order to move the eosystem forward. If a
> >>> +driver decides to go down this path we ask for the following:
> > 
> > I don't like this for two fairly fundamental reasons, neither of which are
> > that sometimes merging stuff that's not great is the right thing to do to
> > move the community and ecosystem forward.
> > 
> >> Hi,
> >>
> >> should it be "require" instead of "ask"?
> >>
> >>> +
> >>> +- An agreement within the community that introducing driver-specific uAPIs is
> >>> +  warranted in this case;
> >>> +
> >>> +- The new uAPI is behind a CONFIG option that is clearly marked EXPERIMENTAL and
> >>> +  is disabled by default;
> >>> +
> >>> +- The new uAPI is enabled when a module parameter for the driver is set, and
> >>> +  defaults to 'off' otherwise;
> >>> +
> >>> +- The new uAPI follows all open-source userspace requirements outlined above;
> >>> +
> >>> +- The focus is maintained on development of a vendor-neutral uAPI and progress
> >>> +  toward such an uAPI needs to be apparent on public forums. If no such progress
> >>> +  is visible within a reasonable timeframe (1-2 years) anybody is within their
> >>> +  right to send, review, and merge patches that remove the driver-specific uAPI.
> >>> +
> >>>  .. _drm_render_node:
> >>>  
> >>>  Render nodes
> >>
> >> Seems fine to me. I have another addition to suggest:
> >>
> >> When such UAPI is introduced, require that it comes with an expiration
> >> date. This date should be unmissable, not just documented. The kernel
> >> module parameter name to enable the UAPI could contain the expiry date,
> >> for example.
> >>
> >> After all, the most important thing to get through to users is that
> >> this *will* go away and not just theoretically.
> > 
> > There's no taking-backsies with uapi. If there is a regression report,
> > we'll have to keep it around, for the usual approximation of "forever"
> > 
> > And this is the first reason I don't like this, from other write-ups and
> > talking with people it seems like there's the assumption that if we just
> > hide this behind enough knobs, we can remove the uapi again.
> > 
> > We can't.
> > 
> 
> Yeah, that last bullet was least sure about. FWIW, I'm prepared to maintain
> AMD driver-specific properties for this "forever."

I guess a middle ground would be to up-front limit this to one generation
only.

And then accept reality that the generic solution takes a bit longer and
end up supporting this on two.

The other approach would be to make sure you can remap the amd properties
onto the generic pipeline, and essentially use that to proof the generic
approach. This would exactly match how all the legacy kms ioctl remapping
to atomic helped proof the atomic infrastructure and driver
implementations.

> > The times we've hidden uapi behind knobs was _not_ for uapi we
> > fundamentally didn't want, at least for the long term. But for the cases
> > where the overall scope was simply too big, and we needed some time
> > in-tree to shake out all the bugs (across both kernel and userspace), and
> > fill out any of the details. Some examples:
> > 
> > - intel hiding new hw enabling behind the alpha support is not about
> >   hiding that uapi so we can change it. It's about the fact that not yet
> >   all enabling has landed in upstream, and not yet all full stack
> >   validation on production silicon has completed. It's about not shipping
> >   buggy code to users that we can't support.
> > 
> > - atomic kms was simply too big, there was a lot of work in compositors
> >   needed, testing corner cases, and details like adding the blob support
> >   for the display mode so that modesets would work too with atomic. We
> >   never landed a preliminary uabi version of atomic (there were plenty
> >   floating around) that wasn't deemed ready as the long term solution, we
> >   were simply not sure we got it right until all the pieces where in
> >   place.
> > 
> >   And viz Xorg-modesetting, in at least one case we still got it wrong and
> >   had to disable atomic for that userspace.
> > 
> > - nouveau pony years back tried this entire "oh the uapi is just
> >   experimental" thing, and it resulted in the by far worst flameware
> >   between Dave and Linus on dri-devel
> > 
> > So _if_ we do this we need to be clear that uapi is forever, and not have
> > docs that suggest otherwise.
> > 
> >> If that date needs to be moved forward, it should be possible to do so
> >> with a simple patch gathering enough acks. The main thing is to set the
> >> date from the start, so there can be no confusion about when its going
> >> to the chopping block.
> >>
> >> I do not suggest that the kernel would automatically runtime disable
> >> the UAPI after that date.
> >>
> >> Does any of the big idea fly with upper maintainers and Linus?
> > 
> > The other reason, and maybe even more fundamental one, is that I think the
> > uncertainty of not documenting how pragmatic we are is beneficial.
> > 
> > We should definitely document the gold standard aspirations, to make sure
> > everyone knows where to aim for. And I'm definitely all for pragmatic
> 
> So if I read you correctly you'd prefer just a short paragraph along the
> lines of: avoid driver-specific uAPIs and instead define vendor neutral
> uAPIs in core DRM?

Yeah, but I also thought we've had this as at least the aspirational goal
already? After the free-for-all driver-specific kms property mess at
least:

https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#requirements

So we have all this already I think. Might just need to link it more so
it's not lost :-)

> > merging where it makes sense, we've had tons of that, and happily carry
> > the costs to this day for some of them:
> > 
> > - a lot of the early soc drivers are kinda meh, and will stay that way
> >   forever since they're not maintained anymore
> > 
> > - we've had very much free-for-all vendor kms properties, and I expect the
> >   hall of shame witht he big table of vendor props with barely any docs
> >   will never go away
> > 
> > - we're taking all the compute runtimes despite that mesa on the 3d/gl/vk
> >   side shows how much better collaboration would be (and I think soon will
> >   show the same for media) because having a compute ecosystem that's
> >   substantially weaker than the sum of all its parts is still better than
> >   nothing. And the situation is still that collaboration even with a
> >   company is often impossible, aiming for better is not very realistic :-/
> > 
> > But the goal is still to have solid code, cross-vendor infrastructure and
> > collaboration and all that stuff, because that's why upstream is strong.
> > And the uncertainty is helping us for a lot of reasons:
> > 
> > - it makes vendors vary of going with vendor solutions. Minimally they ask
> >   in private, which gives Dave, me and all the others doing vendor
> >   outreach or working as some ambassador rule at a vendor an opportunity
> >   to steer things in a better direction. And often do the steering
> >   _before_ code gets written.
> > 
> > - it allows Dave&me to more freely decide when to be pragmatic, without
> >   being bound by rules. The point of pragmatic merging is to bend the
> >   short term principles for a better long term outcome, splattering that
> >   entire space full with rules makes rule-bending a lot harder when
> >   needed.
> > 
> > - most of all I really don't want to be in a discussion with vendors where
> >   they try to laywer-argue that we must merge their patches because they
> >   strictly followed the wording of some pragmatic merge rules while
> >   entirely tossing the spirit of what we aim for. I already have more than
> >   enough of that, this will result in more.
> > 
> > In all the past examples of pragmatic merging we never documented the
> > pragmatic approach, but instead if we documented something, we wrote down
> > the ideal standards to aim for. That makes it easier for everyone to do
> > the right thing, and harder (and more expensive due to the inherit
> > uncertainty) to try to bend them towards the least amount of collaboration
> > a vendor can get away with.
> > 
> 
> That makes a lot of sense.
> 
> > That's why I really want to keep the undocumented and hence uncertain
> > rules in this space.
> > 
> > For the actual case at hand of plane color handling, I think the pragmatic
> > aproach is roughly:
> > 
> > 1. land the amdgpu code, but without uapi
> > 
> 
> Would it be acceptable to guard uAPI bits behind #ifdef AMD_PLANE_COLOR
> so anyone who wants it needs to do -DAMD_PLANE_COLOR or should we leave
> those bits out completely so someone who wants a kernel with them needs
> to apply a patch to add them?

Yeah I guess #ifdef is fine. But if you merge it all including structures
then really the only code left out is the one that registers the
properties against the planes (since the idea is to keep everything else,
especially all the state structure scaffolding), and that shouldn't be
much of a patch really.

> > 2. use that (and any other driver code that's been floating around in this
> > space) to build up the kernel-internal infrastructure - the proposed graph
> > of color transformation blocks will need quite a few things
> > 
> > 3. land the uapi on top in it's hopeful final form, maybe hidden if it's
> > not yet complete or ready for prime time as we sometimes do with bigger
> > projects
> > 
> 
> This would be the vendor neutral uAPI, so something like the RFC Simon
> sent out, right?

Yeah.

And see my comments about about the vendor uapi, depending upon how this
all pans out you might consider the option of doing the amdgpu props on
top of the new graph node color pipeline proposal, to proof that out. Like
we've done with atomic.

Cheers, Daniel

> 
> Harry
> 
> > Obviously compositor work, igts, docs and all that too, and most of all
> > this can happen in parallel too once we have a rough consensus on where to
> > aim for.
> > 
> > Cheers, Daniel
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
