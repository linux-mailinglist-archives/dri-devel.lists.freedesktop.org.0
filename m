Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E3A244AF0
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 15:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B791F6EB5E;
	Fri, 14 Aug 2020 13:57:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10E66EB5D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 13:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597413418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1HxAsydoJPxCvfzoncUk062WCY8tUpPY4sZKwCXhUH4=;
 b=QIfMifgVm7Ceh1KVQTCQTr5idPw+oPsCNL0pXLL5/06B5IddxmAjWHXdq1Jb3QiiUOEhif
 1YD1O2Xx9rTLyc6wgkoK+IwWBWm8HTks98EJPDrXjfcQXqKfMLmnXj9XWQB4buHO/HvJ10
 oJlwInvdLKrkxa/g8nop4nGU1pMINPU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-NL36fwvwPFGy4AKq2gqh0A-1; Fri, 14 Aug 2020 09:56:52 -0400
X-MC-Unique: NL36fwvwPFGy4AKq2gqh0A-1
Received: by mail-qv1-f72.google.com with SMTP id h6so6153683qvz.14
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 06:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1HxAsydoJPxCvfzoncUk062WCY8tUpPY4sZKwCXhUH4=;
 b=eUWu7eNICgUQ8+y1LmSmX3GicnbI4qPtobusxR/OXxkNCgpWcxHLTiAQN7vIrQR+VQ
 8HtHJelgNM1srol3VvP/m1ZwSqoCDHhMVqun9VjN1FF24TYLtGKj2qNPXG31UNdAtSX2
 FykIlHuSZFQAXTx5lZy28muqQzuGr6OrdX+YieEryp2qV+6imhBOmOHteI7ksokGZC76
 4PWgAb62eZACpvJoAPAN/to8dZtLv7nhAaIAyfpjD7yW6/Aucp07sRvGqljdW4/lsfM+
 ermVmgSfE5nqzPfanuhuhUFyqIx5XVJsLUVy83byN9W/3qEnth71dA0Hv8rC1XYnM1Kn
 uTRw==
X-Gm-Message-State: AOAM5336ef1vrDDQxzRE5i46OQFyoxE3bPeGc6vNV8rS0Ca4tac0IuG7
 Lw8kQhy2ddtoluHsres9zrGSCNjmaPpdpG9dqippX0UUAbbF0DvXNirnutFb67GyhwUB/q/YrSc
 3xloMHxnFIrGxeBDiqTvWmXmG+8Jv9VOH1LY0/tQCUr5D
X-Received: by 2002:a0c:9cc4:: with SMTP id j4mr2658633qvf.230.1597413412240; 
 Fri, 14 Aug 2020 06:56:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+tQF6lvxG5NyfNqlPs9Vx0wTR7aIEgho5TDTu9Mf9bpilEDSWxOWv7oIUhJ5dkQFkDVtCAYfBvxgGGv/Ss9g=
X-Received: by 2002:a0c:9cc4:: with SMTP id j4mr2658609qvf.230.1597413411842; 
 Fri, 14 Aug 2020 06:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAKMK7uG8x4dHrRnzK9FFrJbtWsdLk+TTObK9r-nSncKowHVe3A@mail.gmail.com>
 <CAPM=9twK34VyR2kwiR1jzxqys1Bng2Vt8FY6aQTvCe2GL0Zopg@mail.gmail.com>
 <261cd7c9-6853-3d5f-3a3e-86b65c9dba71@nvidia.com>
 <CACO55ttJwjh2HZsygwqA7HUeF5UMuP0=Y9RyZU=UJsf-gWGagA@mail.gmail.com>
 <ad64c242-95f3-d346-87f3-a9ac149dc3a2@nvidia.com>
 <CACO55tt81q3VwpEmz9wxeUzWGPLXA1XPj8ZgxhuELUBPDpX1PA@mail.gmail.com>
 <CACO55ts2AHgDNZKBvoU8NZf26V8BJDGkKiapY=1xaUQ1DrC8SA@mail.gmail.com>
 <CACO55tvF0dOQ=myUpccmfHc+hCVQZoXQnCA0iHeXQo3B=UaD0Q@mail.gmail.com>
 <CAKb7UviVa32hWv+y+_kwbZzkJAxKcWr1RPCgkGt-mi=uayUKyw@mail.gmail.com>
 <0e882aa7-d0ea-19b0-a13d-4f7bc0d384aa@nvidia.com>
 <20200814134038.GA556087@ulmo>
In-Reply-To: <20200814134038.GA556087@ulmo>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 14 Aug 2020 15:56:40 +0200
Message-ID: <CACO55tt=xvSxy34h0-6hrL9-YW0GCGH=oWLQZE6mEL2Yf5u8Ew@mail.gmail.com>
Subject: Re: [git pull] drm for 5.8-rc1
To: Thierry Reding <thierry.reding@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0.002
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
Cc: James Jones <jajones@nvidia.com>, Thierry Reding <treding@nvidia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 14, 2020 at 3:40 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Wed, Aug 12, 2020 at 10:03:46AM -0700, James Jones wrote:
> > On 8/12/20 5:37 AM, Ilia Mirkin wrote:
> > > On Wed, Aug 12, 2020 at 8:24 AM Karol Herbst <kherbst@redhat.com> wrote:
> > > >
> > > > On Wed, Aug 12, 2020 at 12:43 PM Karol Herbst <kherbst@redhat.com> wrote:
> > > > >
> > > > > On Wed, Aug 12, 2020 at 12:27 PM Karol Herbst <kherbst@redhat.com> wrote:
> > > > > >
> > > > > > On Wed, Aug 12, 2020 at 2:19 AM James Jones <jajones@nvidia.com> wrote:
> > > > > > >
> > > > > > > Sorry for the slow reply here as well.  I've been in the process of
> > > > > > > rebasing and reworking the userspace patches.  I'm not clear my changes
> > > > > > > will address the Jetson Nano issue, but if you'd like to try them, the
> > > > > > > latest userspace changes are available here:
> > > > > > >
> > > > > > >     https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/3724
> > > > > > >
> > > > > > > And the tegra-drm kernel patches are here:
> > > > > > >
> > > > > > >
> > > > > > > https://patchwork.ozlabs.org/project/linux-tegra/patch/20191217005205.2573-1-jajones@nvidia.com/
> > > > > > >
> > > > > > > Those + the kernel changes addressed in this thread are everything I had
> > > > > > > outstanding.
> > > > > > >
> > > > > >
> > > > > > I don't know if that's caused by your changes or not, but now the
> > > > > > assert I hit is a different one pointing out that
> > > > > > nvc0_miptree_select_best_modifier fails in a certain case and returns
> > > > > > MOD_INVALID... anyway, it seems like with your patches applied it's
> > > > > > now way easier to debug and figure out what's going wrong, so maybe I
> > > > > > can figure it out now :)
> > > > > >
> > > > >
> > > > > collected some information which might help to track it down.
> > > > >
> > > > > src/gallium/frontends/dri/dri2.c:648 is the assert hit: assert(*zsbuf)
> > > > >
> > > > > templ is {reference = {count = 0}, width0 = 300, height0 = 300, depth0
> > > > > = 1, array_size = 1, format = PIPE_FORMAT_Z24X8_UNORM, target =
> > > > > PIPE_TEXTURE_2D, last_level = 0, nr_samples = 0, nr_storage_samples =
> > > > > 0, usage = 0, bind = 1, flags = 0, next = 0x0, screen = 0x0}
> > > > >
> > > > > inside tegra_screen_resource_create modifier says
> > > > > DRM_FORMAT_MOD_INVALID as template->bind is 1
> > > > >
> > > > > and nvc0_miptree_select_best_modifier returns DRM_FORMAT_MOD_INVALID,
> > > > > so the call just returns NULL leading to the assert.
> > > > >
> > > > > Btw, this is on Xorg-1.20.8-1.fc32.aarch64 with glxgears.
> > > > >
> > > >
> > > > So I digged a bit deeper and here is what tripps it of:
> > > >
> > > > when the context gets made current, the normal framebuffer validation
> > > > and render buffer allocation is done, but we end up inside
> > > > tegra_screen_resource_create at some point with PIPE_BIND_SCANOUT set
> > > > in template->bind. Now the tegra driver forces the
> > > > DRM_FORMAT_MOD_LINEAR modifier and calls into
> > > > resource_create_with_modifiers.
> > > >
> > > > If it wouldn't do that, nouveau would allocate a tiled buffer, with
> > > > that it's linear and we at some point end up with an assert about a
> > > > depth_stencil buffer being there even though it shouldn't. If I always
> > > > use DRM_FORMAT_MOD_INVALID in tegra_screen_resource_create, things
> > > > just work.
> > > >
> > > > That's kind of the cause I pinpointed the issue down to. But I have no
> > > > idea what's supposed to happen and what the actual bug is.
> > >
> > > Yeah, the bug with tegra has always been "trying to render to linear
> > > color + tiled depth", which the hardware plain doesn't support. (And
> > > linear depth isn't a thing.)
> > >
> > > Question is whether what it's doing necessary. PIPE_BIND_SCANOUT
> > > (/linear) requirements are needed for DRI2 to work (well, maybe not in
> > > theory, but at least in practice the nouveau ddx expects linear
> > > buffers). However tegra operates on a more DRI3-like basis, so with
> > > "client" allocations, tiled should work OK as long as there's
> > > something in tegra to copy it to linear when necessary?
> >
> > I can confirm the above: Our hardware can't render to linear depth buffers,
> > nor can it mix linear color buffers with block linear depth buffers.
> >
> > I think there's a misunderstanding on expected behavior of
> > resource_create_with_modifiers() here too: tegra_screen_resource_create() is
> > passing DRM_FORMAT_MOD_INVALID as the only modifier in non-scanout cases.
> > Previously, I believe nouveau may have treated that as "no modifiers
> > specified.  Fall back to internal layout selection logic", but in my patches
> > I "fixed" it to match other drivers' behavior, in that allocation will fail
> > if that is the only modifier in the list, since it is equivalent to passing
> > in a list containing only unsupported modifiers.  To get fallback behavior,
> > tegra_screen_resource_create() should pass in (NULL, 0) for (modifiers,
> > count), or just call resource_create() on the underlying screen instead.
> >
> > Beyond that, I can only offer my thoughts based on analysis of the code
> > referenced here so far:
> >
> > While I've learned from the origins of this thread applications/things
> > external to Mesa in general shouldn't be querying format modifiers of
> > buffers created without format modifiers, tegra is a Mesa internal component
> > that already has some intimate knowledge of how the nouveau driver it sits
> > on top of works.  Nouveau will always be able to construct and return a
> > valid format modifier for unorm single sampled color buffers (and hopefully,
> > anything that can scan out going forward), both before and after my patches
> > I believe, regardless of how they were allocated.  After my patches, it
> > should even work for things that can't scan out in theory.  Hence, looking
> > at this without knowledge of what motivated the original changes, it seems
> > like tegra_screen_resource_create should just naively forward the
> > resource_create() call, relying on nouveau to select a layout and provide a
> > valid modifier when queried for import.  As Karol notes, this works fine for
> > at least this simple test case, and it's what nouveau itself would be doing
> > with an equivalent callstack, excepting the modifier query, so I find it
> > hard to believe it breaks some application behavior.  It'll also end up
> > being equivalent (in end result, not quite semantically) to what
> > dri3_alloc_render_buffer() was doing prior to the patch mentioned that broke
> > things for Karol, so certainly for the DRI3 usage it's the right behavior.
> >
> > Ilia, what in the nouveau DDX (As in Xfree86 DDX?) assumes linear buffers?
> > It sounds like you don't think it will interact poorly with this path
> > regardless?  Thierry, do you recall what motivated the force-linear code
> > here?
>
> This would've clearly been a good opportunity to leave a comment as to
> why this was, but the one that's in place in
> tegra_screen_resource_create() doesn't do a good job of conveying what
> I was thinking at the time.
>
> This is now all a very long time ago, so I don't recall the exact
> details. However the intention at the time was to pass the invalid
> modifier in the default case because I wanted Nouveau to pick whatever
> it wanted, assuming that we could deal with all modifiers that it could
> throw at us for display. At least at the time that was true, and I do
> think you're correct that Nouveau used to treat DRM_FORMAT_MOD_INVALID
> as "don't care" and then tegra_screen_import_resource() would query the
> modifier from Nouveau. I don't think I ever ran into the situation where
> Nouveau would use a modifier that we couldn't deal with (i.e. one of the
> "legacy" modifiers after your patch).
>
> I /think/ the linear requirement, judging by the comment, was to support
> certain cases that I was running into that didn't support modifiers at
> all, so I think the assumption was that they wouldn't be able to create
> the framebuffer with DRM_IOCTL_MODE_ADDFB2 and hence pitch-linear would
> have to be assumed.
>
> I vaguely recall that this might have been with kmscube and/or certain
> versions of the X server (I also seem to have a vague memory that glamor
> being used might have been responsible for this happening or not).
>
> Given that many things have now changed it might be worth rerunning all
> of those use-cases again and trace what types of resources are being
> created in the process and maybe make this a little saner.
>
> > As to why this works for Thierry and not Karol, that's confusing.  Are you
> > both using the same X11 DDX (modesetting I assume?) and X server versions?
> > Could it be a difference in client-side DRI library code somehow?
>
> It looks like Karol might have found a commit that fixes this in the X
> server git. I'll run a couple of tests to see if I can reproduce with a
> version prior to that "fix".
>

before spending too much time on that, Xorg that old usually does not
build anymore, but any 1.20.z release should trigger the issue, so you
can just go with the newest release.

> Thierry

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
