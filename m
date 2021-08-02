Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AEB3DD1CA
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 10:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013836E1E8;
	Mon,  2 Aug 2021 08:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02BC86E1E8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 08:14:31 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id gs8so29454733ejc.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Aug 2021 01:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=PE4RYbJZOWZUBJDVeq0Rz16NnEWFmQCTiwuGf8uQPJU=;
 b=EK6ayXbXDxEXln5cqtNWlUXo2+2jdIwli15TPNlMQRocw7YqFiP3TwZ6WL16N/0gXg
 5Nso5DyT5Nk7oBVxGjILIQv2ibwO04hxX4mM18MOz+p6nj2k4V2grEG3n5AY8fBfESeO
 mlSewur6XsVS5CgqZI6iWdWlpblYnYnbV2O7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PE4RYbJZOWZUBJDVeq0Rz16NnEWFmQCTiwuGf8uQPJU=;
 b=idyGadduucCKw8tuK1EfCVxZnyNiur+1YLXKuOTiQqLqcqF9GNBhZrzzwwgE6dVUQp
 jz65Rr5SWUgneu3thtX9mLesz6KjXyQJnVS54gSi7tU81jX3Yy0PXeZnufKQi1A8j6Xj
 pXGN/9QVPyEy5tlVCxwKGnhpgup9xRS0XHeqGj1C+y5D98qPMbdjkUbiN3lHagTHZs38
 ulf4GL71vwwvmt3KkbMAf00bPTZtfioty19uk4oL06n8wjiwvme/rT+aCvlUaNJB0efF
 JYFAUReEVmM/fSZhX5UgfyhPzLNx/ny9edHLiUx235PbEL3dUkmGBExq3g4ippqHyxQ3
 QEIg==
X-Gm-Message-State: AOAM532dYKooicKXcqvE0sLPfOE3TufvZhCmYWGXZqCg6z9RJ2XscyYZ
 ZawBoL59+C8DsaVI8dNJ1rjQDw==
X-Google-Smtp-Source: ABdhPJx33TJ0GKIWrjddlYvuBww/fS3tLJPhvVAfTtUMn+nndqYhcrAvO6FngcqJfxepd6ypgESdqA==
X-Received: by 2002:a17:907:20f2:: with SMTP id
 rh18mr14569578ejb.136.1627892070404; 
 Mon, 02 Aug 2021 01:14:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z16sm5513462edr.51.2021.08.02.01.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 01:14:29 -0700 (PDT)
Date: Mon, 2 Aug 2021 10:14:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Simon Ser <contact@emersion.fr>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 "Zhang, Tina" <tina.zhang@intel.com>,
 "Kim, Dongwon" <dongwon.kim@intel.com>,
 "Singh, Satyeshwar" <satyeshwar.singh@intel.com>
Subject: Re: [RFC v1 0/4] drm: Add support for DRM_CAP_DEFERRED_OUT_FENCE
 capability
Message-ID: <YQepZMFaCNLBNGx9@phenom.ffwll.local>
References: <20210729081659.2255499-1-vivek.kasireddy@intel.com>
 <YQPTo0D5SZfX44dn@phenom.ffwll.local>
 <612fd31a51384cb28ac6da9db3e840ca@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <612fd31a51384cb28ac6da9db3e840ca@intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 02, 2021 at 06:51:33AM +0000, Kasireddy, Vivek wrote:
> Hi Daniel,
> 
> > 
> > On Thu, Jul 29, 2021 at 01:16:55AM -0700, Vivek Kasireddy wrote:
> > > By separating the OUT_FENCE signalling from pageflip completion allows
> > > a Guest compositor to start a new repaint cycle with a new buffer
> > > instead of waiting for the old buffer to be free.
> > >
> > > This work is based on the idea/suggestion from Simon and Pekka.
> > >
> > > This capability can be a solution for this issue:
> > > https://gitlab.freedesktop.org/wayland/weston/-/issues/514
> > >
> > > Corresponding Weston MR:
> > > https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/668
> > 
> > Uh I kinda wanted to discuss this a bit more before we jump into typing
> > code, but well I guess not that much work yet.
> [Kasireddy, Vivek] Right, it wasn't a lot of work :)
> 
> > 
> > So maybe I'm not understanding the problem, but I think the fundamental
> > underlying issue is that with KMS you can have at most 2 buffers
> > in-flight, due to our queue depth limit of 1 pending flip.
> [Kasireddy, Vivek] Let me summarize the problem again from the perspective of
> both the Host (Weston) and Guest (Weston) compositors assuming a refresh-rate
> of 60 -- which implies the Vblank/Vsync is generated every ~16.66 ms.
> Host compositor:
> - After a pageflip completion event, it starts its next repaint cycle by waiting for 9 ms
> and then submits the atomic commit and at the tail end of its cycle sends a frame callback
> event to all its clients (who registered and submitted frames) indicating to them to 
> start their next redraw  -- giving them at-least ~16 ms to submit a new frame to be
> included in its next repaint. Why a configurable 9 ms delay is needed is explained
> in Pekka's blog post here:
> https://ppaalanen.blogspot.com/2015/02/weston-repaint-scheduling.html
> 
> - It'll send a wl_buffer.release event for a client submitted previous buffer only
> when the client has submitted a new buffer and:
> a) When it hasn't started its repaint cycle yet OR
> b) When it clears its old state after it gets a pageflip completion event -- if it had
> flipped the client's buffer onto a hardware plane.
> 
> Guest compositor:
> - After a pageflip completion is sent by Guest KMS, it takes about 10-12 ms for the 
> Guest compositor to submit a new atomic commit. This time of 10-12 ms includes the
> 9 ms wait -- just like the Host compositor -- for its clients to submit new buffers.
> - When it gets a pageflip completion, it assumes that the previously submitted buffer
> is free for re-use and uses it again -- resulting in the usage of only 2 out of a maximum
> of 4 backbuffers included as part of the Mesa GBM surface implementation.
> 
> Guest KMS/Virtio-gpu/Qemu Wayland UI:
> - Because no_vblank=true for Guest KMS and since the vblank event (which also serves
> as the pageflip completion event for user-space) is sent right away after atomic commit,
> as Gerd said, we use an internal dma-fence to block/wait the Guest KMS until we know for
> sure that the Host is completely done using the buffer. To ensure this, we signal the dma-fence
> only after the Host compositor sends a wl_buffer.release event or an equivalent signal.
> 
> The goal:
> - Maintain full framerate even when the Guest scanout FB is flipped onto a hardware plane
> on the Host -- regardless of either compositor's scheduling policy -- without making any
> copies and ensuring that both Host and Guest are not accessing the buffer at the same time.
> 
> The problem:
> - If the Host compositor flips the client's buffer (in this case Guest compositor's buffer) 
> onto a hardware plane, then it can send a wl_buffer.release event for the previous buffer
> only after it gets a pageflip completion. And, if the Guest compositor takes 10-12 ms to
> submit a new buffer and given the fact that the Host compositor waits only for 9 ms, the
> Guest compositor will miss the Host's repaint cycle resulting in halved frame-rate.
> 
> The solution:
> - To ensure full framerate, the Guest compositor has to start it's repaint cycle (including
> the 9 ms wait) when the Host compositor sends the frame callback event to its clients.
> In order for this to happen, the dma-fence that the Guest KMS waits on -- before sending
> pageflip completion -- cannot be tied to a wl_buffer.release event. This means that, the
> Guest compositor has to be forced to use a new buffer for its next repaint cycle when it
> gets a pageflip completion.

Is that really the only solution?

If we fix the event timestamps so that both guest and host use the same
timestamp, but then the guest starts 5ms (or something like that) earlier,
then things should work too? I.e.
- host compositor starts at (previous_frametime + 9ms)
- guest compositor starts at (previous_frametime + 4ms)

Ofc this only works if the frametimes we hand out to both match _exactly_
and are as high-precision as the ones on the host side. Which for many gpu
drivers at least is the case, and all the ones you care about for sure :-)

But if the frametimes the guest receives are the no_vblank fake ones, then
they'll be all over the place and this carefully tuned low-latency redraw
loop falls apart. Aside fromm the fact that without tuning the guests to
be earlier than the hosts, you're guaranteed to miss every frame (except
when the timing wobbliness in the guest is big enough by chance to make
the deadline on the oddball frame).

> - The Weston MR I linked above does this by getting an out_fence fd and taking a reference
> on all the FBs included in the atomic commit forcing the compositor to use new FBs for its
> next repaint cycle. It releases the references when the out_fence is signalled later when
> the Host compositor sends a wl_buffer.release event.
> 
> > 
> > Unfortunately that means for virtual hw where it takes a few more
> > steps/vblanks until the framebuffer actually shows up on screen and is
> > scanned out, we suffer deeply. The usual fix for that is to drop the
> > latency and increase throughput, and have more buffers in-flight. Which
> > this patch tries to do.
> > 
> > Now I think where we go wrong here is that we're trying to hack this up by
> > defining different semantics for the out-fence and for the drm-event. Imo
> > that's wrong, they're both meant to show eactly the same thing:
> > - when is the new frame actually visible to the user (as in, eyeballs in a
> >   human head, preferrably, not the time when we've handed the buffer off
> >   to the virtual hw)
> > - when is the previous buffer no longer being used by the scanout hw
> [Kasireddy, Vivek] Right, they both mean the same thing but I think using both
> at the same time would be redundant in the case of Weston. That's why I am trying
> to repurpose the usage of out_fence in this case by introducing a new capability
> that may not be relevant for bare-metal KMS drivers but would be useful for
> virtual KMS drivers.
> 
> > 
> > We do cheat a bit right now in so far that we assume they're both the
> > same, as in, panel-side latency is currently the compositor's problem to
> > figure out.
> > 
> > So for virtual hw I think the timestamp and even completion really need to
> > happen only when the buffer has been pushed through the entire
> > virtualization chain, i.e. ideally we get the timestamp from the kms
> > driver from the host side. Currently that's not done, so this is most
> > likely quite broken already (virtio relies on the no-vblank auto event
> > sending, which definitely doesn't wait for anything, or I'm completely
> > missing something).
> [Kasireddy, Vivek] You are right; virtio_gpu does use the no_vblank auto event but
> as I mentioned above we do use an internal dma-fence to wait until the submitted
> buffer is no longer used by the Host. In other words, we wait (in update_planes hook)
> until we get an appropriate signal from the Host to proceed to make sure that we are
> not rendering faster than what the Host can display.

Yeah that internal dma_fence really should be the flip completion event
too. That's how this uapi is supposed to work.

Once you have that then maybe weston magically works because it realizes
that it misses the frames it's aiming for. Or at least there will be debug
output about that I hope (I'm not sure the auto-tuning works/exists).

> However, as you suggest below, we could set no_vblank=false and send the vblank/
> pageflip completion event from the virtio-gpu driver instead of having the DRM
> core send it. This can prevent the DRM core from signalling the out_fence as well
> which is my intended objective and what my first patch tries to do. I'd still need the
> new capability though to include the patch in Weston that deals with out_fence --
> unless Weston upstream can accept the patch after reviewing it without this newly
> added capability which would be redundant but it does solve my problem. Would
> this be acceptable?

out fence and flip completion event are exactly the same thing
semantically. Well, before your patch here at least. So if you fix up the
internal crtc->event handling then you fix up both. That's very much by
design, because otherwise we'd have a bunch of kms drivers that only work
on Android (which uses out-fence), and the others only work on dekstop
linux (which uses flip completion drm_event). And probably very few that
support both.

> > I think instead of hacking up some ill-defined 1.5 queue depth support,
> > what we should do is support queue depth > 1 properly. So:
> > 
> > - Change atomic to support queue depth > 1, this needs to be a per-driver
> >   thing due to a bunch of issues in driver code. Essentially drivers must
> >   never look at obj->state pointers, and only ever look up state through
> >   the passed-in drm_atomic_state * update container.
> > 
> > - Aside: virtio should loose all it's empty hooks, there's no point in
> >   that.
> > 
> > - We fix virtio to send out the completion event at the end of this entire
> >   pipeline, i.e. virtio code needs to take care of sending out the
> >   crtc_state->event correctly.
> > 
> > - We probably also want some kind of (maybe per-crtc) recommended queue
> >   depth property so compositors know how many buffers to keep in flight.
> >   Not sure about that.
> > 
> > It's a bit more work, but also a lot less hacking around infrastructure in
> > dubious ways.
> > 
> > Thoughts?
> [Kasireddy, Vivek] IIUC, you are suggesting that we should make it possible to
> submit a new atomic commit even though the completion event for the previous
> one has not come in yet. This may potentially solve my problem but it sounds very
> disruptive and not very useful for bare-metal cases. It also means that the compositors,
> DRM core and the drivers need to keep track of multiple states -- as opposed to new and
> old -- for all objects such as crtcs, planes, etc and account for multiple completion events.
> I guess it is doable but as you suggest it seems like a lot of work with many pitfalls ahead.

Queue deeper than 1 has been an eventual goal for atomic since the start,
we simply didn't get around to it.

All the state handling and helpers are built to support that (but there
could be more bugs). The only rule drivers must follow is that in their
atomic_commit code they never look at the various obj->state pointers
(like drm_crtc->state), since that might be the state of a subsequent
commit. Instead they must only get the state through the drm_atomic_state
structure. We've recently also updated all the helpers to pass that around
everywhere (for other reasons), so the challenge here is only to fix up
individual drivers. And maybe come up with some debug checks to make the
obj->state pointers aren't used in atomic_commit.

From a design pov I think your approach of hacking up the event machinery
to slip in 2 commits while not actually using the 2 deep queue stuff like
it's meant to be is much worse.

On the userspace side I'm not sure why you need to keep track of more
state. All you need to keep track is of more buffers in your retire/reuse
list, but you have to do that with your proposal here too. So no
difference at all there.

Anyway it sounds like if the guest compositor would adjust it's deadline
so that the guest and host compositor interleave correctly, then we should
still be able to hit full refresh rate without a deeper queue. Has that
been looked into?
-Daniel

> 
> Thanks,
> Vivek
> > 
> > Cheers, Daniel
> > 
> > >
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > > Cc: Simon Ser <contact@emersion.fr>
> > > Cc: Michel Dänzer <michel@daenzer.net>
> > > Cc: Tina Zhang <tina.zhang@intel.com>
> > > Cc: Dongwon Kim <dongwon.kim@intel.com>
> > >
> > > Vivek Kasireddy (4):
> > >   drm: Add a capability flag to support deferred out_fence signalling
> > >   virtio-gpu uapi: Add VIRTIO_GPU_F_OUT_FENCE feature
> > >   drm/virtio: Add VIRTIO_GPU_CMD_RESOURCE_OUT_FENCE cmd
> > >   drm/virtio: Probe and implement VIRTIO_GPU_F_OUT_FENCE feature
> > >
> > >  drivers/gpu/drm/drm_file.c               | 11 +++---
> > >  drivers/gpu/drm/drm_ioctl.c              |  3 ++
> > >  drivers/gpu/drm/virtio/virtgpu_debugfs.c |  1 +
> > >  drivers/gpu/drm/virtio/virtgpu_drv.c     |  1 +
> > >  drivers/gpu/drm/virtio/virtgpu_drv.h     |  6 ++++
> > >  drivers/gpu/drm/virtio/virtgpu_fence.c   |  9 +++++
> > >  drivers/gpu/drm/virtio/virtgpu_kms.c     | 10 ++++--
> > >  drivers/gpu/drm/virtio/virtgpu_plane.c   | 44 +++++++++++++++++++++++-
> > >  drivers/gpu/drm/virtio/virtgpu_vq.c      | 17 +++++++++
> > >  include/drm/drm_mode_config.h            |  9 +++++
> > >  include/uapi/drm/drm.h                   |  1 +
> > >  include/uapi/linux/virtio_gpu.h          | 12 +++++++
> > >  12 files changed, 117 insertions(+), 7 deletions(-)
> > >
> > > --
> > > 2.30.2
> > >
> > 
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
