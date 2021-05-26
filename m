Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AE639193A
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 15:53:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B2C6E4D0;
	Wed, 26 May 2021 13:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDBF86E4D0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 13:52:59 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 u4-20020a05600c00c4b02901774b80945cso554983wmm.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 06:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ei1X4AwhvdzAP+mkHmnxgQFLfSinDNqVWxLWTKXV2TQ=;
 b=OakzYC3zU482JiOahGE7nDHyQO8K6RZIyRFdbMNn3+JBgFdZqFclHvWI3x0KJE3i0p
 F66LAEv8QVDmwGEVWLCQDC1jm2+xwEQxa0a7UqsEeuFcAjoFJwjegokgI4U+2tytjx8/
 KOnPApzCHu9C6Y+OuGUw9oSXlR3Bs4dvRzVQp9dcug8mntxOUERVUTcfNUdJk38bbIQr
 CLTfcPAZgLMExiSlqRNAM1ozCr6qKxYytFUOdcLH1JjXYKp63UJy7hsxkTYbugqgIFqx
 hjo4AVjmTqV4qwHdMcqpY2Ao0VDbhEbWOwQUV15fDkpdcNr0MnwPlNyF4yaz0UCo6uKk
 UjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ei1X4AwhvdzAP+mkHmnxgQFLfSinDNqVWxLWTKXV2TQ=;
 b=jD/75WjVEd1PhqYxcJ2S8LF0GMOOIZoZ+SDPQeoxPqaAjm5hTevQuBfiQtvE4e08My
 5wOXyHpSmErcj1ZRG+nhhxYq4hWBIcl5TOQhDrDzJNvQodh16aUYNEdIKaB0T9ff6oR5
 3rltqPfZFoOskz0Fgo5Nr+X8oD3+IOpR8Wt3OcmD2roZMoFApz3sFfvZEhKsd3J8wkS5
 zOkWaT8KgXeVzfBYZgiga2VpKxRljXvNyPLZu5IJPGQFpaaKLJAhRt2SEN8yGfmzWSk+
 4ABj/juf+8jHwtneCgeHQFpzvDOwB8y0R+EqB2SLPRWFCAYed5wyJ0CKqlMIGLguEEph
 zTfQ==
X-Gm-Message-State: AOAM533yqrE1V9IgxXcoVVT4gBxr6hnU7xWgkf/85QMt5o757NbEJx09
 yBmdutfBqjuJIpQyxpzd8HpgU6qxyptpPmXEgkrcucSt0humcL2f
X-Google-Smtp-Source: ABdhPJzCvXgnpk28op42FqDlgfmnkPe2vvqwdCev7X3mqDS0w3/H0jN1eJFNbIUE5BvqaFtG5TzxZhFZO9qFuwX7CEg=
X-Received: by 2002:a1c:7c03:: with SMTP id x3mr3570400wmc.168.1622037178164; 
 Wed, 26 May 2021 06:52:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210520190007.534046-1-jason@jlekstrand.net>
 <20210520190007.534046-5-jason@jlekstrand.net>
 <CAPj87rPW2xmOLKg6OgQST6QrH9u5-qmdRJrNDug+rWa=Uv6ZBQ@mail.gmail.com>
 <CAOFGe97b-djqwV95Y91xe9-ZVUyeGqjdPE8vj7MoSfV0Kcrp1Q@mail.gmail.com>
 <CAPj87rNJTHNKkdiZREVb8v6iiwUhYLXW10pjVOdV=zttd+tG3Q@mail.gmail.com>
In-Reply-To: <CAPj87rNJTHNKkdiZREVb8v6iiwUhYLXW10pjVOdV=zttd+tG3Q@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 26 May 2021 14:52:46 +0100
Message-ID: <CAPj87rPSU65qz=0E4SV9dR5Nz_KteuYC+RiW=qX868CzuVPwTQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] RFC: dma-buf: Add an API for importing sync files (v6)
To: Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
Just making sure this thread doesn't get too short ...

On Wed, 26 May 2021 at 12:08, Daniel Stone <daniel@fooishbar.org> wrote:
> On Mon, 24 May 2021 at 18:11, Jason Ekstrand <jason@jlekstrand.net> wrote:
> > I'd like to address this one as it's a comment you've made several
> > times.  Once you've fixed raw X11 (not just XWayland) and a new
> > release has been made (hah!) and is shipping in distros with said
> > support, then we can talk.  Sorry if that comes off as overly snarky
> > but that's reality that we (driver devs) are living with.  To make
> > things even worse, when we're in Vulkan land (as opposed to GL), we
> > can't tell up-front whether or not our window-system supports foo
> > fences and adjust accordingly.  We have to start up, begin rendering,
> > and only later figure out "oops, this one goes to X11".  We really
> > can't say things like "when running on modern Wayland, do things the
> > new way" because Vulkan doesn't have a concept of "running on" a
> > window system.
>
> Hey, no offence taken, and even if there was, there's no point denying
> the reality that we don't still have Wayland absolutely everywhere,
> and even when we do, there's still a Streams-sized elephant in the
> room that no-one wants to talk about.
>
> Ultimately though, there will always be two codepaths. Xorg (as
> opposed to Xwayland) is currently unmaintained, and I expect it to
> remain so forever. The last times we tried to plumb synchronisation
> through to native-Xorg, it collapsed in conflicting requests for
> rewriting the presentation mechanism (which very few people understand
> and even fewer people can make work reliably), and I don't see that
> changing any time soon. Plus the single biggest remaining use for
> native-Xorg is that it implements tearflips by blitting to a single
> internal frontbuffer which is currently being scanned out, which is
> going to be ... difficult ... to square with the goal of actually
> synchronising things.
>
> What I mean though is that I don't think it makes sense to have three
> design points.
>
> Previously, the only effort put into explicit synchronisation on the
> winsys side was using it was a means to surface the timings for both
> tracing and being able to calibrate compositor repaints. Given that we
> need to support interop with the implicit world forever, and given
> that there was no explicit interaction with the implicit resv slots
> (solved by this new uAPI), and given that the sync_file vs.
> drm_syncobj vs. ?? userspace fence story wasn't clear, it didn't seem
> like a practical benefit to sink time into supporting it, just that it
> ticked a 'yep we're doing things explicitly' box, which was not
> practically useful since EGL doesn't let you opt out of implicit
> semantics anyway.
>
> Now with the details having come out of AMD/Arm/Intel about future
> gens, and the driver-side pain being properly understood, as well as
> the new uAPI actually giving us clear benefit, there's a good reason
> to work on it. So we'll do that on the winsys side, and support the
> new explicitly-managed-implicit-slot world, and everyone's lives will
> be better. Which gives us two design points: unaware implicit-only
> users (Xorg, old Wayland, old GPU, media), and fully-aware
> extremely-explicit users (Mutter, Weston, wlroots, new GPU).

So I said why I think X11 is totally fine (sync on client, let the
server stay dumb and unsynchronised) for the new world, but not why
I'm so confident that it's totally fine for Wayland and we can do it
quickly, despite previously banging on about how much work it was and
why it was so difficult. You already know this Jason, but for the rest
of the class ...

All Wayland compositors I've ever seen have a strong separation
between the protocol-visible objects, and per-output repaint loops,
not least because this is strongly encoded into the protocol. Creating
a surface, attaching a buffer to it, and committing the surface state,
will only update a compositor list of the current state of the
protocol-visible objects.

At 'a good time' for each output (often next vblank minus a few
milliseconds), the compositor will effectively snapshot that state,
generate a scene graph from it, and go through repaint for that output
(GPU composition and/or KMS planes and/or media encode and/or RDP etc)
to turn that to light. This is unlike X11 where you can post rendering
commands and then call XGetImage to pull the pixel result back. We
also explicitly chose not to follow the X11 window of a global
co-ordinate space with windows explicitly treed down from a shared
root window: inter-surface operations are very much disconnected from
each other with no ordering guarantee, and since clients are totally
isolated from each other, there are no inter-client operations.

So that already gives us a clean break between clients posting state
and visible effect, with a lot of latitude on timing: you post some
updates, and a compositor which users actually want will make those
updates real at some point, but nothing is guaranteed.

There is one cut-out from inter-surface operations, which is our
subsurface protocol. An example of this is having your browser UI as
the primary window, which embeds a separate rendered window for each
tab, which further embeds a window with your pop-over ad^W^Wmedia
content. To make resizing and scrolling work without being all
Flash-on-Navigator jank, subsurfaces have a 'synchronised' mode, where
clients can make protocol-visible updates to their surfaces, but the
updates will not be recorded into the visible scene graph until
explicitly released by the topmost parent - think of it like a display
controller's 'go bit' or updating the tail pointer on a ring buffer,
where we record updates but they're stashed away until everything has
become coherent.

Every useful compositor already implements this subsurface protocol as
well, which gives us a _further_ gap between protocol-visible
client-recorded state and the scene graph which is used for painting
outputs. Handling wait-before-sync is still a lot of typing, and
difficult for corner cases, and will need experimentation in the real
world before we can all land on useful common semantics, but we've
already done the most conceptually difficult work, which was to
separate client/protocol-visible object state from the scene graph
that gets generated/snapshotted on every output update.

So that's why I'm bullish on how quickly we can move on the Wayland
side. It's a lot of typing, but we already have two clean breaks from
recorded client surface state -> scene graph -> pixels lit up, with
each break already handling fragmentation between different surface
groups rather than being a global freeze/thaw.

(Having typed all of that, I'm reminded that we never finished up the
EGL extension to opt out of implicit sync on a per-EGLImage basis,
which was mostly blocked on explicit sync being pretty immature in
drivers and none of the uAPI fitting together e.g. per-CS vs. per-BO
... now seems like a pretty apt time to revive that too.)

Cheers,
Daniel
