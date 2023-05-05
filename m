Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CFA6F80A8
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 12:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55A110E1F9;
	Fri,  5 May 2023 10:17:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A41EE10E1F9
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 10:17:00 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-50bcd46bf47so379446a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 03:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1683281818; x=1685873818;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SJhD0NmOWseF0MtaH9M080/UXk40KKNAXGYDpGgWCCw=;
 b=SF6+/Z2NwGzbaqFL5GH1HbpVZAPCooJ6j+Orn665LuDebhfunOA+CNdN5aQ+gdJF4V
 KaJul2miwpTi23jmEaF2FsT4sUXFENzbGBpCcV0gqucj9v8k9HYCDHZV0Mce8mL1WY9q
 22tfpSUkVK+No0iM7Q1oE+B2Edh4OPHLHjMOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683281818; x=1685873818;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SJhD0NmOWseF0MtaH9M080/UXk40KKNAXGYDpGgWCCw=;
 b=Gqa5+93JgtT1gZpev9rDlMSbjyXpRf9ch8vFLl4buXtvlRe5H1Y7VAmw/jlZzKD1LU
 wlsXeRvqoCXP5kF3iGv3DIfVDgu2kc555rTxE3WUg1L3ycUHZvK1GbJ/FL8sGM9zgRYE
 RdsTK5Hvre5Mf69ebl8rZmrjDzMnP3uUrARCIwn+MR8i5cm5aS4+Z6ys/JKrQx62NVDY
 UxYvk1e2BeBsgwlgozn+8Vwo/qVQHwhVSJ1VtMPFd6PjQ+Dn8Iq9MJsUINM03RT4EZHk
 z6bMLDwWdZg2W/QQXdKeUUft+8RCfoIPpSC/M2OjYC1P0BUxTHAR33ZXDCmAOF4/hswi
 IxiA==
X-Gm-Message-State: AC+VfDyTEyD54kybuRm1zJV7lD35pUYVLrRxNb1dLsxdA3plVf/iWlCi
 CV85osqWb54ropUD0hbMemYE75GpHCSbUuy9Z+I=
X-Google-Smtp-Source: ACHHUZ4l5ilJrkISYfS5zNgV2hxP4gHhLitIpOFJTa1jOz4CRhdkEA/UXnjT28QGbBx0RGqLBSix3A==
X-Received: by 2002:a05:6402:524e:b0:500:3fd0:25a8 with SMTP id
 t14-20020a056402524e00b005003fd025a8mr956877edd.0.1683281818211; 
 Fri, 05 May 2023 03:16:58 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 p18-20020a05640210d200b0050bc1e916f8sm2762327edu.66.2023.05.05.03.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 03:16:57 -0700 (PDT)
Date: Fri, 5 May 2023 12:16:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH] Documentation/gpu: Requirements for driver-specific KMS
 uAPIs
Message-ID: <ZFTXl3qPn7E0pQWO@phenom.ffwll.local>
References: <20230504212557.61049-1-harry.wentland@amd.com>
 <20230505114320.1eb77237.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230505114320.1eb77237.pekka.paalanen@collabora.com>
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
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 dri-devel@lists.freedesktop.org, Xaver Hugl <xaver.hugl@gmail.com>,
 Melissa Wen <mwen@igalia.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <mdaenzer@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 05, 2023 at 11:43:20AM +0300, Pekka Paalanen wrote:
> On Thu, 4 May 2023 17:25:57 -0400
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
> > We have steered away for a long time now from driver-specific KMS APIs
> > for good reasons but never codified our stance. With the proposal of
> > new, driver-specific color management uAPIs [1] it is important to
> > outline the requirements for the rare times when driver-specific KMS
> > uAPIs are desired in order to move complex topics along.
> > 
> > [1] https://patchwork.freedesktop.org/series/116862/
> > 
> > Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> > Cc: Simon Ser <contact@emersion.fr>
> > Cc: Joshua Ashton <joshua@froggi.es>
> > Cc: Michel Dänzer <mdaenzer@redhat.com>
> > Cc: Sebastian Wick <sebastian.wick@redhat.com>
> > Cc: Jonas Ådahl <jadahl@redhat.com>
> > Cc: Alex Goins <agoins@nvidia.com>
> > Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> > Cc: Melissa Wen <mwen@igalia.com>
> > Cc: Aleix Pol <aleixpol@kde.org>
> > Cc: Xaver Hugl <xaver.hugl@gmail.com>
> > Cc: Victoria Brekenfeld <victoria@system76.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Dave Airlie <airlied@gmail.com>
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Uma Shankar <uma.shankar@intel.com>
> > To: dri-devel@lists.freedesktop.org
> > ---
> >  Documentation/gpu/drm-uapi.rst | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> > 
> > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> > index ce47b4292481..eaefc3ed980c 100644
> > --- a/Documentation/gpu/drm-uapi.rst
> > +++ b/Documentation/gpu/drm-uapi.rst
> > @@ -118,6 +118,38 @@ is already rather painful for the DRM subsystem, with multiple different uAPIs
> >  for the same thing co-existing. If we add a few more complete mistakes into the
> >  mix every year it would be entirely unmanageable.
> >  
> > +.. _driver_specific:
> > +
> > +Driver-Specific DRM/KMS uAPI
> > +============================
> > +
> > +Driver-specific interfaces are strongly discouraged for DRM/KMS interfaces.
> > +Kernel-modesetting (KMS) functionality does in principle apply to all drivers.
> > +Driver-specific uAPIs tends to lead to unique implementations in userspace and
> > +are often hard to maintain, especially when different drivers implement similar
> > +but subtly different uAPIs.
> > +
> > +At times arriving at a consensus uAPI can be a difficult and lengthy process and
> > +might benefit from experimentation. This experimentation might warrant
> > +introducing driver specific APIs in order to move the eosystem forward. If a
> > +driver decides to go down this path we ask for the following:

I don't like this for two fairly fundamental reasons, neither of which are
that sometimes merging stuff that's not great is the right thing to do to
move the community and ecosystem forward.

> Hi,
> 
> should it be "require" instead of "ask"?
> 
> > +
> > +- An agreement within the community that introducing driver-specific uAPIs is
> > +  warranted in this case;
> > +
> > +- The new uAPI is behind a CONFIG option that is clearly marked EXPERIMENTAL and
> > +  is disabled by default;
> > +
> > +- The new uAPI is enabled when a module parameter for the driver is set, and
> > +  defaults to 'off' otherwise;
> > +
> > +- The new uAPI follows all open-source userspace requirements outlined above;
> > +
> > +- The focus is maintained on development of a vendor-neutral uAPI and progress
> > +  toward such an uAPI needs to be apparent on public forums. If no such progress
> > +  is visible within a reasonable timeframe (1-2 years) anybody is within their
> > +  right to send, review, and merge patches that remove the driver-specific uAPI.
> > +
> >  .. _drm_render_node:
> >  
> >  Render nodes
> 
> Seems fine to me. I have another addition to suggest:
> 
> When such UAPI is introduced, require that it comes with an expiration
> date. This date should be unmissable, not just documented. The kernel
> module parameter name to enable the UAPI could contain the expiry date,
> for example.
> 
> After all, the most important thing to get through to users is that
> this *will* go away and not just theoretically.

There's no taking-backsies with uapi. If there is a regression report,
we'll have to keep it around, for the usual approximation of "forever"

And this is the first reason I don't like this, from other write-ups and
talking with people it seems like there's the assumption that if we just
hide this behind enough knobs, we can remove the uapi again.

We can't.

The times we've hidden uapi behind knobs was _not_ for uapi we
fundamentally didn't want, at least for the long term. But for the cases
where the overall scope was simply too big, and we needed some time
in-tree to shake out all the bugs (across both kernel and userspace), and
fill out any of the details. Some examples:

- intel hiding new hw enabling behind the alpha support is not about
  hiding that uapi so we can change it. It's about the fact that not yet
  all enabling has landed in upstream, and not yet all full stack
  validation on production silicon has completed. It's about not shipping
  buggy code to users that we can't support.

- atomic kms was simply too big, there was a lot of work in compositors
  needed, testing corner cases, and details like adding the blob support
  for the display mode so that modesets would work too with atomic. We
  never landed a preliminary uabi version of atomic (there were plenty
  floating around) that wasn't deemed ready as the long term solution, we
  were simply not sure we got it right until all the pieces where in
  place.

  And viz Xorg-modesetting, in at least one case we still got it wrong and
  had to disable atomic for that userspace.

- nouveau pony years back tried this entire "oh the uapi is just
  experimental" thing, and it resulted in the by far worst flameware
  between Dave and Linus on dri-devel

So _if_ we do this we need to be clear that uapi is forever, and not have
docs that suggest otherwise.

> If that date needs to be moved forward, it should be possible to do so
> with a simple patch gathering enough acks. The main thing is to set the
> date from the start, so there can be no confusion about when its going
> to the chopping block.
> 
> I do not suggest that the kernel would automatically runtime disable
> the UAPI after that date.
> 
> Does any of the big idea fly with upper maintainers and Linus?

The other reason, and maybe even more fundamental one, is that I think the
uncertainty of not documenting how pragmatic we are is beneficial.

We should definitely document the gold standard aspirations, to make sure
everyone knows where to aim for. And I'm definitely all for pragmatic
merging where it makes sense, we've had tons of that, and happily carry
the costs to this day for some of them:

- a lot of the early soc drivers are kinda meh, and will stay that way
  forever since they're not maintained anymore

- we've had very much free-for-all vendor kms properties, and I expect the
  hall of shame witht he big table of vendor props with barely any docs
  will never go away

- we're taking all the compute runtimes despite that mesa on the 3d/gl/vk
  side shows how much better collaboration would be (and I think soon will
  show the same for media) because having a compute ecosystem that's
  substantially weaker than the sum of all its parts is still better than
  nothing. And the situation is still that collaboration even with a
  company is often impossible, aiming for better is not very realistic :-/

But the goal is still to have solid code, cross-vendor infrastructure and
collaboration and all that stuff, because that's why upstream is strong.
And the uncertainty is helping us for a lot of reasons:

- it makes vendors vary of going with vendor solutions. Minimally they ask
  in private, which gives Dave, me and all the others doing vendor
  outreach or working as some ambassador rule at a vendor an opportunity
  to steer things in a better direction. And often do the steering
  _before_ code gets written.

- it allows Dave&me to more freely decide when to be pragmatic, without
  being bound by rules. The point of pragmatic merging is to bend the
  short term principles for a better long term outcome, splattering that
  entire space full with rules makes rule-bending a lot harder when
  needed.

- most of all I really don't want to be in a discussion with vendors where
  they try to laywer-argue that we must merge their patches because they
  strictly followed the wording of some pragmatic merge rules while
  entirely tossing the spirit of what we aim for. I already have more than
  enough of that, this will result in more.

In all the past examples of pragmatic merging we never documented the
pragmatic approach, but instead if we documented something, we wrote down
the ideal standards to aim for. That makes it easier for everyone to do
the right thing, and harder (and more expensive due to the inherit
uncertainty) to try to bend them towards the least amount of collaboration
a vendor can get away with.

That's why I really want to keep the undocumented and hence uncertain
rules in this space.

For the actual case at hand of plane color handling, I think the pragmatic
aproach is roughly:

1. land the amdgpu code, but without uapi

2. use that (and any other driver code that's been floating around in this
space) to build up the kernel-internal infrastructure - the proposed graph
of color transformation blocks will need quite a few things

3. land the uapi on top in it's hopeful final form, maybe hidden if it's
not yet complete or ready for prime time as we sometimes do with bigger
projects

Obviously compositor work, igts, docs and all that too, and most of all
this can happen in parallel too once we have a rough consensus on where to
aim for.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
