Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3832242DDC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 19:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71036E129;
	Wed, 12 Aug 2020 17:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6997489009
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 17:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597252240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8yTYD4QQNNsvIzXXARoHTp+zeVoghR3P29kdDR4x2Qg=;
 b=FzKQedge5W9jGxWgCxkvN9W9gl6XDLOCZDyjIKTgwdOfqtvlMru5G+NmjIdvjLrs7N8QVJ
 sjVhB2vSwnHY1JdPD3KaNFtm6SvPhfrXyp2aKvx18qN2LD6d57bhqnP5S+OJnE9w8OoOGm
 OXZnaDfAojdiu3p08aTNUfXLyg0QDjI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-9hHtGTe8M3Go2WOLnYghAQ-1; Wed, 12 Aug 2020 13:10:36 -0400
X-MC-Unique: 9hHtGTe8M3Go2WOLnYghAQ-1
Received: by mail-qk1-f199.google.com with SMTP id k142so1929863qke.7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 10:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8yTYD4QQNNsvIzXXARoHTp+zeVoghR3P29kdDR4x2Qg=;
 b=c3x/IW7rnUTV12LXC9bv8K4prLTViCmCJppq2kPtp4akdWdTpPSuMiKS+m8XSZHawn
 RQQclgKE5BghEhUjOGEA+rMMI2XenTxDcdCTFf80W6xDFLfuhyhSJKgBUKJQ+FA4Fhpa
 7+gh6gLLPTxmo2GcB7xkNpSiqn6VwDpdpvbF6VJtZ6V2+QVhj4/mAkxva4FZJvqtzIg1
 ZjcnDyHVJ9Ji3M8c1tmt9w47dpkB7cWIk9cJoUet0+2wQitvMcY6zVkHmXBo6EvMPMCl
 lyEtNL0fTim+7nrdRrso6PBBYFFwukLW73V6eg/kqxWB7DpSj1qsbvHybYC/Zhq33Vw4
 5mFA==
X-Gm-Message-State: AOAM532BlWN0KuBgBMfO6+bIuX8wGK8dociVzH/v1a6/cWUPEOjnnogn
 DpB4NjuEQX4BFO1yntPV1iGdpAyZv33TpXqfc0svyEI3cXsLOaLzgQYz90E83mT6tFm6AsK+fHL
 puwX55Y2yc8ITbLUBiCCWjohVmAXGrLMBuSaKY/18kjBl
X-Received: by 2002:a37:90e:: with SMTP id 14mr955871qkj.102.1597252235551;
 Wed, 12 Aug 2020 10:10:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3Ug2mdvUEiXW7AKw4Wup6/g+2ftZpGSQpcRxcPiKeOBNh8eRiAGyI695A57Lj8G5vDQ7hzaoJ33PZ5wWEA6Y=
X-Received: by 2002:a37:90e:: with SMTP id 14mr955831qkj.102.1597252235002;
 Wed, 12 Aug 2020 10:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
 <20200701075719.p7h5zypdtlhqxtgv@box> <20200701075902.hhmaskxtjsm4bcx7@box>
 <77e744b9-b5e2-9e9b-44c1-98584d2ae2f3@nvidia.com>
 <CAPj87rOrUHBZZR3cw+iqUMtZL1ZQyjd=RoM2yHt5oUeRO5uDTA@mail.gmail.com>
 <5ffa32db-4383-80f6-c0cf-a9bb12e729aa@nvidia.com>
 <a3d331e9-d17e-9135-68c7-8e3e10df184d@nvidia.com>
 <CAKMK7uG8x4dHrRnzK9FFrJbtWsdLk+TTObK9r-nSncKowHVe3A@mail.gmail.com>
 <CAPM=9twK34VyR2kwiR1jzxqys1Bng2Vt8FY6aQTvCe2GL0Zopg@mail.gmail.com>
 <261cd7c9-6853-3d5f-3a3e-86b65c9dba71@nvidia.com>
 <CACO55ttJwjh2HZsygwqA7HUeF5UMuP0=Y9RyZU=UJsf-gWGagA@mail.gmail.com>
 <ad64c242-95f3-d346-87f3-a9ac149dc3a2@nvidia.com>
 <CACO55tt81q3VwpEmz9wxeUzWGPLXA1XPj8ZgxhuELUBPDpX1PA@mail.gmail.com>
 <CACO55ts2AHgDNZKBvoU8NZf26V8BJDGkKiapY=1xaUQ1DrC8SA@mail.gmail.com>
 <CACO55tvF0dOQ=myUpccmfHc+hCVQZoXQnCA0iHeXQo3B=UaD0Q@mail.gmail.com>
 <CAKb7UviVa32hWv+y+_kwbZzkJAxKcWr1RPCgkGt-mi=uayUKyw@mail.gmail.com>
 <0e882aa7-d0ea-19b0-a13d-4f7bc0d384aa@nvidia.com>
In-Reply-To: <0e882aa7-d0ea-19b0-a13d-4f7bc0d384aa@nvidia.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 12 Aug 2020 19:10:23 +0200
Message-ID: <CACO55ttP_J8riS_PhCG+-Br+AvsYKRTLg_+wn2pXF9kgXkmjeQ@mail.gmail.com>
Subject: Re: [git pull] drm for 5.8-rc1
To: James Jones <jajones@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Thierry Reding <treding@nvidia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 12, 2020 at 7:03 PM James Jones <jajones@nvidia.com> wrote:
>
> On 8/12/20 5:37 AM, Ilia Mirkin wrote:
> > On Wed, Aug 12, 2020 at 8:24 AM Karol Herbst <kherbst@redhat.com> wrote:
> >>
> >> On Wed, Aug 12, 2020 at 12:43 PM Karol Herbst <kherbst@redhat.com> wrote:
> >>>
> >>> On Wed, Aug 12, 2020 at 12:27 PM Karol Herbst <kherbst@redhat.com> wrote:
> >>>>
> >>>> On Wed, Aug 12, 2020 at 2:19 AM James Jones <jajones@nvidia.com> wrote:
> >>>>>
> >>>>> Sorry for the slow reply here as well.  I've been in the process of
> >>>>> rebasing and reworking the userspace patches.  I'm not clear my changes
> >>>>> will address the Jetson Nano issue, but if you'd like to try them, the
> >>>>> latest userspace changes are available here:
> >>>>>
> >>>>>     https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/3724
> >>>>>
> >>>>> And the tegra-drm kernel patches are here:
> >>>>>
> >>>>>
> >>>>> https://patchwork.ozlabs.org/project/linux-tegra/patch/20191217005205.2573-1-jajones@nvidia.com/
> >>>>>
> >>>>> Those + the kernel changes addressed in this thread are everything I had
> >>>>> outstanding.
> >>>>>
> >>>>
> >>>> I don't know if that's caused by your changes or not, but now the
> >>>> assert I hit is a different one pointing out that
> >>>> nvc0_miptree_select_best_modifier fails in a certain case and returns
> >>>> MOD_INVALID... anyway, it seems like with your patches applied it's
> >>>> now way easier to debug and figure out what's going wrong, so maybe I
> >>>> can figure it out now :)
> >>>>
> >>>
> >>> collected some information which might help to track it down.
> >>>
> >>> src/gallium/frontends/dri/dri2.c:648 is the assert hit: assert(*zsbuf)
> >>>
> >>> templ is {reference = {count = 0}, width0 = 300, height0 = 300, depth0
> >>> = 1, array_size = 1, format = PIPE_FORMAT_Z24X8_UNORM, target =
> >>> PIPE_TEXTURE_2D, last_level = 0, nr_samples = 0, nr_storage_samples =
> >>> 0, usage = 0, bind = 1, flags = 0, next = 0x0, screen = 0x0}
> >>>
> >>> inside tegra_screen_resource_create modifier says
> >>> DRM_FORMAT_MOD_INVALID as template->bind is 1
> >>>
> >>> and nvc0_miptree_select_best_modifier returns DRM_FORMAT_MOD_INVALID,
> >>> so the call just returns NULL leading to the assert.
> >>>
> >>> Btw, this is on Xorg-1.20.8-1.fc32.aarch64 with glxgears.
> >>>
> >>
> >> So I digged a bit deeper and here is what tripps it of:
> >>
> >> when the context gets made current, the normal framebuffer validation
> >> and render buffer allocation is done, but we end up inside
> >> tegra_screen_resource_create at some point with PIPE_BIND_SCANOUT set
> >> in template->bind. Now the tegra driver forces the
> >> DRM_FORMAT_MOD_LINEAR modifier and calls into
> >> resource_create_with_modifiers.
> >>
> >> If it wouldn't do that, nouveau would allocate a tiled buffer, with
> >> that it's linear and we at some point end up with an assert about a
> >> depth_stencil buffer being there even though it shouldn't. If I always
> >> use DRM_FORMAT_MOD_INVALID in tegra_screen_resource_create, things
> >> just work.
> >>
> >> That's kind of the cause I pinpointed the issue down to. But I have no
> >> idea what's supposed to happen and what the actual bug is.
> >
> > Yeah, the bug with tegra has always been "trying to render to linear
> > color + tiled depth", which the hardware plain doesn't support. (And
> > linear depth isn't a thing.)
> >
> > Question is whether what it's doing necessary. PIPE_BIND_SCANOUT
> > (/linear) requirements are needed for DRI2 to work (well, maybe not in
> > theory, but at least in practice the nouveau ddx expects linear
> > buffers). However tegra operates on a more DRI3-like basis, so with
> > "client" allocations, tiled should work OK as long as there's
> > something in tegra to copy it to linear when necessary?
>
> I can confirm the above: Our hardware can't render to linear depth
> buffers, nor can it mix linear color buffers with block linear depth
> buffers.
>
> I think there's a misunderstanding on expected behavior of
> resource_create_with_modifiers() here too:
> tegra_screen_resource_create() is passing DRM_FORMAT_MOD_INVALID as the
> only modifier in non-scanout cases.  Previously, I believe nouveau may
> have treated that as "no modifiers specified.  Fall back to internal
> layout selection logic", but in my patches I "fixed" it to match other
> drivers' behavior, in that allocation will fail if that is the only
> modifier in the list, since it is equivalent to passing in a list
> containing only unsupported modifiers.  To get fallback behavior,
> tegra_screen_resource_create() should pass in (NULL, 0) for (modifiers,
> count), or just call resource_create() on the underlying screen instead.
>
> Beyond that, I can only offer my thoughts based on analysis of the code
> referenced here so far:
>
> While I've learned from the origins of this thread applications/things
> external to Mesa in general shouldn't be querying format modifiers of
> buffers created without format modifiers, tegra is a Mesa internal
> component that already has some intimate knowledge of how the nouveau
> driver it sits on top of works.  Nouveau will always be able to
> construct and return a valid format modifier for unorm single sampled
> color buffers (and hopefully, anything that can scan out going forward),
> both before and after my patches I believe, regardless of how they were
> allocated.  After my patches, it should even work for things that can't
> scan out in theory.  Hence, looking at this without knowledge of what
> motivated the original changes, it seems like
> tegra_screen_resource_create should just naively forward the
> resource_create() call, relying on nouveau to select a layout and
> provide a valid modifier when queried for import.  As Karol notes, this
> works fine for at least this simple test case, and it's what nouveau
> itself would be doing with an equivalent callstack, excepting the
> modifier query, so I find it hard to believe it breaks some application
> behavior.  It'll also end up being equivalent (in end result, not quite
> semantically) to what dri3_alloc_render_buffer() was doing prior to the
> patch mentioned that broke things for Karol, so certainly for the DRI3
> usage it's the right behavior.
>
> Ilia, what in the nouveau DDX (As in Xfree86 DDX?) assumes linear
> buffers?  It sounds like you don't think it will interact poorly with
> this path regardless?  Thierry, do you recall what motivated the
> force-linear code here?
>
> As to why this works for Thierry and not Karol, that's confusing.  Are
> you both using the same X11 DDX (modesetting I assume?) and X server
> versions?  Could it be a difference in client-side DRI library code somehow?
>

it's X. 1.20.99.1 works, 1.20.8 is broken.

> Thanks,
> -James
>
> >    -ilia
> >
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
