Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6713863CF
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 22:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25EF76E2D5;
	Mon, 17 May 2021 20:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501006E2D5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 20:00:26 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 69-20020a9d0a4b0000b02902ed42f141e1so6638103otg.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 13:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xtjdje62yD9oW3HEgHTuDl9DmMypEy/sRMCMoiLlyK8=;
 b=OzwnYrKYMaYFJamVY9o+1JtKgZTcpEFZ0w19j8y+zZR+QadYHkx37rbQAFSiq+sImx
 738pbcMQFtnVAsl7XPerLkJAIXvYQIhewaFsSrnFCJ03BJZ8A0zrkDW819tpu+IpPT78
 F0zglpq/SMPZM6qmf9X5F5DT0jyavkonPiySA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xtjdje62yD9oW3HEgHTuDl9DmMypEy/sRMCMoiLlyK8=;
 b=HKyb8XsiKivy0CipOjL6ZZYRYBRbCJqbewRCXPx9A/w2ra4Yww1sZt1XQY06XXqax6
 EIsmrEGs+eosDa48P6m6BUghJRJQb8lu2/aHTrPcKk//orFUim/VenalExaeg9+5VTw8
 7VZHv6u++lLxM4yuLnvKND4WM2uHnbIo6CbI7x7/6KXBnEHlPgpY8263wMxekvk1wbWs
 XntBjf8mS2JTn0/B+oI1bEEVCfmJAxECRotIFk8pqAZoviuMW1UjwXGYHBpmqnU4qcil
 R57enL1hYAraMVJbsCzy4celR2DlRHtdcpZ7+UDnJ6i9eZifqn//bS79eX9CqIMl3qoB
 F+EQ==
X-Gm-Message-State: AOAM532qd+4V0ucerXkbUSJK1oBxmK+BHAB+LkSgxGjgaZGboG5jd/UW
 vEu0WfnxXoiAQMfe5ug+R09TdXuRd81lircIxUu8yQ==
X-Google-Smtp-Source: ABdhPJzSRhLB+ZsKjK7Y9NOTBW/MdZUTUaNuuD/r7tN8j0vZd8wXbTlo3vlPKi44cglUPOYryfXV4DRE6LUN0LHgJ38=
X-Received: by 2002:a9d:4101:: with SMTP id o1mr1056732ote.281.1621281625633; 
 Mon, 17 May 2021 13:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210513110040.2268-1-maciej.kwapulinski@linux.intel.com>
 <YJ42MEgwDZrAEQLl@kroah.com>
 <CAK8P3a0pcBHfrwu9fHHRWim5WgQuCqpROpMM83yCCpjjwu1FJQ@mail.gmail.com>
 <YKIeBdwFb9Ng275X@phenom.ffwll.local>
 <503d101d-7273-757a-2809-e272db93c45d@suse.de>
 <CADnq5_NR+ysqmx6ftakGTjqjw0p6roiupa3sYTN8NuAMoGa6sQ@mail.gmail.com>
 <3aac3e39-4889-22dc-83dc-72fff63cb3d0@suse.de>
In-Reply-To: <3aac3e39-4889-22dc-83dc-72fff63cb3d0@suse.de>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 17 May 2021 22:00:14 +0200
Message-ID: <CAKMK7uFyTM9NQzhtOv-ABemYThLE2CnA=OYRiJwe7YwgotfLPA@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] Driver of Intel(R) Gaussian & Neural Accelerator
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 9:49 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 17.05.21 um 21:23 schrieb Alex Deucher:
> > On Mon, May 17, 2021 at 3:12 PM Thomas Zimmermann <tzimmermann@suse.de>
> wrote:
> >>
> >> Hi
> >>
> >> Am 17.05.21 um 09:40 schrieb Daniel Vetter:
> >>> On Fri, May 14, 2021 at 11:00:38AM +0200, Arnd Bergmann wrote:
> >>>> On Fri, May 14, 2021 at 10:34 AM Greg Kroah-Hartman
> >>>> <gregkh@linuxfoundation.org> wrote:
> >>>>> On Thu, May 13, 2021 at 01:00:26PM +0200, Maciej Kwapulinski wrote:
> >>>>>> Dear kernel maintainers,
> >>>>>>
> >>>>>> This submission is a kernel driver to support Intel(R) Gaussian & Neural
> >>>>>> Accelerator (Intel(R) GNA). Intel(R) GNA is a PCI-based neural co-processor
> >>>>>> available on multiple Intel platforms. AI developers and users can
> offload
> >>>>>> continuous inference workloads to an Intel(R) GNA device in order to
> >> free
> >>>>>> processor resources and save power. Noise reduction and speech recognition
> >>>>>> are the examples of the workloads Intel(R) GNA deals with while its usage
> >>>>>> is not limited to the two.
> >>>>>
> >>>>> How does this compare with the "nnpi" driver being proposed here:
> >>>>>           https://lore.kernel.org/r/20210513085725.45528-1-guy.zadicario@intel.com
> >>>>>
> >>>>> Please work with those developers to share code and userspace api and
> >>>>> tools.  Having the community review two totally different apis and
> >>>>> drivers for the same type of functionality from the same company is
> >>>>> totally wasteful of our time and energy.
> >>>>
> >>>> Agreed, but I think we should go further than this and work towards a
> >>>> subsystem across companies for machine learning and neural networks
> >>>> accelerators for both inferencing and training.
> >>>
> >>> We have, it's called drivers/gpu. Feel free to rename to drivers/xpu or
> >>> think G as in General, not Graphisc.
> >>
> >> I hope this was a joke.
> >>
> >> Just some thoughts:
> >>
> >> AFAICT AI first came as an application of GPUs, but has now
> >> evolved/specialized into something of its own. I can imagine sharing
> >> some code among the various subsystems, say GEM/TTM internals for memory
> >> management. Besides that there's probably little that can be shared in
> >> the userspace interfaces. A GPU is device that puts an image onto the
> >> screen and an AI accelerator isn't. Treating both as the same, even if
> >> they share similar chip architectures, seems like a stretch. They might
> >> evolve in different directions and fit less and less under the same
> >> umbrella.
> >
> > The putting something on the screen is just a tiny part of what GPUs
> > do these days.  Many GPUs don't even have display hardware anymore.
> > Even with drawing APIs, it's just some operation that you do with
> > memory.  The display may be another device entirely.  GPUs also do
> > video encode and decode, jpeg acceleration, etc.  drivers/gpu seems
> > like a logical place to me.  Call it drivers/accelerators if you like.
> > Other than modesetting most of the shared infrastructure in
> > drivers/gpu is around memory management and synchronization which are
> > all the hard parts.  Better to try and share that than to reinvent
> > that in some other subsystem.
>
> I'm not sure whether we're on the same page or not.
>
> I look at this from the UAPI perspective: the only interfaces that we
> really standardize among GPUs is modesetting, dumb buffers, GEM. The
> sophisticated rendering is done with per-driver interfaces. And
> modesetting is the thing that AI does not do.

Yeah, but the peole who know what should be standardized and what
should not be standardized for accel drivers are here. Because we've
done both models in the past, and pretty much everything in between.

Also like Daniel said, we support hw (and know how to drive it) for
anything from "kernel bashes register values" (gpus worked like that
20 years ago) to "mostly direct userspace submit (amdkfd and parts of
nouveau work like this).

There isn't any other subsystem with that much knowledge about how to
stand up the entire accelerator stack and not making it suck too
badly. That is the real value of dri-devel and the community we have
here, not the code sharing we occasionally tend to do.

> Sharing common code among subsystems is not a problem. Many of our
> more-sophisticated helpers are located in DRM because no other
> subsystems have the requirements yet. Maybe AI now has and we can move
> the rsp shareable code to a common location. But AI is still no GPU. To
> give a bad analogy: GPUs transmit audio these days. Yet we don't treat
> them as sound cards.

We actually do, there are full blown sound drivers for them over in
sound/ (ok I think they're all in sound/hda for pci gpus or in
sound/soc actually). There's some glue to tie it together because it
requires coordination between the gpu and sound side of things, but
that's it.

Also I think it would be extremely silly to remove all the drm_ stuff
just because it's originated from GPUs, and therefore absolutely
cannot be used by other accelarators. I'm not seeing the point in
that, but if someone has convincing technical argument for this we
could do it. A tree wide s/drm_/xpu_ might make some sense perhaps if
that makes people more comfortable with the idea of reusing code from
gpu origins for accelerators in general.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
