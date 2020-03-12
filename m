Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D747F183555
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 16:46:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4389D6EAF1;
	Thu, 12 Mar 2020 15:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D706EAEF
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 15:46:32 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id z65so8071855ede.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 08:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5cTrrpEJFcic24XujNFhCjsMl+60VWq4PDTREg8h96A=;
 b=TYLYodTKe0dhiYfU9BavzBm/Gww+zTvaS3cbCaM1DeOKROStbKSllP8n/J5dDlig3Q
 XpjnWxLm82FVW1VeRnNk8FztNqV717pZ6t/GSyAW3ZNUbltoh/bs+lp2SPTkWo/vVHmw
 k9qsVi6GDRWikBcMYkkWPAqYnKxXw9IUPUsW7cWThHepsCX+iX4muhTxc7M4m8hwKmQY
 Xx/kC1DhqVddy0wxOj7USgaMp3aBW7aNhQT6OJqJkjKvyIhxp+a3OiRSg8hDl1N2erW5
 Vf3YkKeHhpPayz4+B40RqpOhRzp2lqf/9VxEF8eQeA9iTgfRolAaHxA/Zq87o0XuH7j0
 ZiVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5cTrrpEJFcic24XujNFhCjsMl+60VWq4PDTREg8h96A=;
 b=Jxj8omySH6FfewhrWSNyvZ+2LQzHVzgFfD0DKR6NdGnUZLw9Bf3oWcdQ0aDi9DWJub
 FAivqW4yCjnW3ZcMwvnqkWaTLsxzIqTSHIWhIppLS0za157VdASbpSbtHwaRSCuW1TBE
 HvStGNTFLPxGJKdhAsbNGuJ8x5IMy08KeSkk4JTkQoOZKjX+SLoBENm4NB7srGw+z08o
 GKnXZwq4fbG76OwFNwxHN4aqTRccQaCoi4oqhd6ArFMlhJschdWsvoSMJsQ5qwpO/hhj
 /BZ2pjNhOMxllul/5XP1Rw3gMiLzruIKj/nQ4Ol+l7YlvRNVdIGii+9QKcrUmLdBTyTs
 2GyA==
X-Gm-Message-State: ANhLgQ0FBxTIRevSQ/x0RthBbg7iyATMLOmbUsqohODUFgtg0s1VCDh6
 Q06TN8voZqgmP7oIBKh+EaseM9OeXU9JP4WnjdUMMw==
X-Google-Smtp-Source: ADFU+vtOmrV2cAZBkLwL59bH0e6wkoESkgo54aRn0jjCQKHn037BDREuV9Z9qkUa/KlbjY5gdH6LaCYwIfL8fr7E7lU=
X-Received: by 2002:aa7:d585:: with SMTP id r5mr4139922edq.241.1584027990906; 
 Thu, 12 Mar 2020 08:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <59bce0ac12d70810880f77d276571dc5d686a9f8.camel@redhat.com>
In-Reply-To: <59bce0ac12d70810880f77d276571dc5d686a9f8.camel@redhat.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 12 Mar 2020 10:46:19 -0500
Message-ID: <CAOFGe94LKyxOA-+cwvNRaqhtFQdjLDqUxgpYc87E0RmD0gFPqg@mail.gmail.com>
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
To: Adam Jackson <ajax@redhat.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, xorg-devel <xorg-devel@lists.x.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It seems I may have not set the tone I intended with this e-mail... My
intention was never to stomp on anyone's favorite window system (Adam,
isn't the only one who's seemed a bit miffed).  My intention was to
try and solve some very real problems that we have with Vulkan and I
had the hope that a solution there could be helpful for others.

The problem we have in Vulkan is that we have an inherently explicit
sync graphics API and we're trying to strap it onto some inherently
implicit sync window systems and kernel interfaces.  Our mechanisms
for doing so have evolved over the course of the last 4-5 years and
it's way better now than it was when we started but it's still pretty
bad and very invasive to the driver.  My objective is to completely
remove the concept of implicit sync from the Vulkan driver eventually.

Also (and this is going further down the rabbit hole), I would like to
begin cleaning up our i915 UAPI to better separate memory residency
handling, command submission, and synchronization.  Eventually (and
this may sound crazy to some), I'd like to get to the point where i915
doesn't own any of the synchronization primitives except what it needs
to handle memory management internally.  Linux graphics UAPI is about
10 years behind Windows in terms of design (roughly equivalent to
Win7) and I think it's costing us in terms of latency and CPU
overhead.  Some of that may just be implementation problems in i915;
some of it may be core API design.  It's a bit unclear.

Why am I bringing up kernel APIs?  Because one of the biggest problems
in evolving things is the fact that our kernel APIs are tied to
implicit sync on dma-buf.  We can't detangle that until we can remove
implicit dma-buf signaling from the command execution APIs.  This
means that we either need to get rid of ALL implicit synchronization
from window-system APIs far enough back in time that we don't run the
risk of "breaking userspace" or else we need a plan which lets the
kernel driver not support implicit sync but make implicit sync work
anyway.  What I'm proposing with dma-buf sync_file import/export is
one such plan.

So, while this may not solve any problems for Wayland compositors as I
previously thought (KMS/atomic supports sync_file.  Yay!), we still
have a very real problem in Vulkan.  It's great that Wayland has an
explicit sync API but until all compositors have supported it for at
least 2 years, I can't assume it's existence and start deleting my old
code paths.  Currently, it's only implemented in Weston and the
ChromeOS compositor; gnome-shell, kwin, and sway are all still 100%
implicit sync AFAIK.  We also have to deal with X11.

For those who are asking the question in the back of their minds:
Yes, I'm trying to solve a userspace problem with kernel code and, no,
I don't think that's necessarily the wrong way around.  Don't get me
wrong; I very much want to solve the problem "properly" but unless
we're very sure we can get it solved properly everywhere quickly, a
solution which lets us improve our driver kernel APIs independently of
misc. Wayland compositors seems advantageous.

On Wed, Mar 11, 2020 at 6:02 PM Adam Jackson <ajax@redhat.com> wrote:
>
> On Wed, 2020-03-11 at 12:31 -0500, Jason Ekstrand wrote:
>
> >  - X11: With present, it has these "explicit" fence objects but
> > they're always a shmfence which lets the X server and client do a
> > userspace CPU-side hand-off without going over the socket (and
> > round-tripping through the kernel).  However, the only thing that
> > fence does is order the OpenGL API calls in the client and server and
> > the real synchronization is still implicit.
>
> I'm pretty sure "the only thing that fence does" is an implementation
> detail.

So I've been told, many times.

> PresentPixmap blocks until the wait-fence signals, but when and
> how it signals are properties of the fence itself. You could have drm
> give the client back a fence fd, pass that to xserver to create a fence
> object, and name that in the PresentPixmap request, and then drm can do
> whatever it wants to signal the fence.

Poking around at things, X11 may not be quite as bad as I thought
here.  It's not really set up for sync_file for a couple reasons:

 1. It only passes the file descriptor in once at
xcb_dri3_fence_from_fd rather than re-creating every frame from a new
sync_file
 2. It only takes a fence on present and doesn't return one in the
PRESENT_COMPLETE event

That said, plumbing syncobj in as an extension looks like a real
possibility.  A syncobj is just a container that holds a pointer to a
dma_fence and it has roughly the same CPU signal/reset behavior that's
exposed by the SyncFenceFuncsRec struct.  There's a few things I'm not
sure how to handle:

 1. The Sync extension has these trigger funcs which get called when
the fence is signalled.  I'm not sure how to handle that with syncobj
without a thread polling on them somehow.
 2. Not all kernel GPU drivers support syncobj; currently it's just
i915, amdgpu, and maybe freedreno AFAIK.  How do we handle cases such
as Intel+Nvidia?
 3. I have no idea what kinds of issues we'd run into with plumbing it
all through.  Hopefully, X is sufficiently abstracted but I really
don't know.

Please excuse my trepidation but I've got a bit of PTSD from
modifiers.  That was the last time I tried to solve a problem with
someone writing X11 patches and it's been 2-3 years and it's still not
shipping in distros.  If said syncobj extension suffers the same fate,
it isn't a real solution.

> > From my perspective, as a Vulkan driver developer, I have to deal with
> > the fact that Vulkan is an explicit sync API but Wayland and X11
> > aren't.
>
> I'm quite sure we can give you an explicit-sync X11 API. I think you
> may already have one.

It looks like we at least have a bunch of pieces which can probably be
used to build one.

--Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
