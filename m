Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 831403DE699
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 08:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9845C6E3D8;
	Tue,  3 Aug 2021 06:12:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583F66E3D8
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 06:12:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10064"; a="200767139"
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; d="scan'208";a="200767139"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 23:11:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; d="scan'208";a="669834276"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 02 Aug 2021 23:11:55 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 2 Aug 2021 23:11:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 2 Aug 2021 23:11:54 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.010;
 Mon, 2 Aug 2021 23:11:54 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Gerd
 Hoffmann" <kraxel@redhat.com>, Pekka Paalanen <ppaalanen@gmail.com>, "Simon
 Ser" <contact@emersion.fr>, =?iso-8859-1?Q?Michel_D=E4nzer?=
 <michel@daenzer.net>, "Zhang, Tina" <tina.zhang@intel.com>, "Kim, Dongwon"
 <dongwon.kim@intel.com>, "Singh, Satyeshwar" <satyeshwar.singh@intel.com>
Subject: RE: [RFC v1 0/4] drm: Add support for DRM_CAP_DEFERRED_OUT_FENCE
 capability
Thread-Topic: [RFC v1 0/4] drm: Add support for DRM_CAP_DEFERRED_OUT_FENCE
 capability
Thread-Index: AQHXhFPnN1B4zkQxMkK/V9zRY5/TqKtbxyyAgABF0uCABEyGAIAAS7kw
Date: Tue, 3 Aug 2021 06:11:53 +0000
Message-ID: <fa53f9db229e481784bfe3a61a195fd3@intel.com>
References: <20210729081659.2255499-1-vivek.kasireddy@intel.com>
 <YQPTo0D5SZfX44dn@phenom.ffwll.local>
 <612fd31a51384cb28ac6da9db3e840ca@intel.com>
 <YQepZMFaCNLBNGx9@phenom.ffwll.local>
In-Reply-To: <YQepZMFaCNLBNGx9@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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

Hi Daniel,

> > > > By separating the OUT_FENCE signalling from pageflip completion all=
ows
> > > > a Guest compositor to start a new repaint cycle with a new buffer
> > > > instead of waiting for the old buffer to be free.
> > > >
> > > > This work is based on the idea/suggestion from Simon and Pekka.
> > > >
> > > > This capability can be a solution for this issue:
> > > > https://gitlab.freedesktop.org/wayland/weston/-/issues/514
> > > >
> > > > Corresponding Weston MR:
> > > > https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/668
> > >
> > > Uh I kinda wanted to discuss this a bit more before we jump into typi=
ng
> > > code, but well I guess not that much work yet.
> > [Kasireddy, Vivek] Right, it wasn't a lot of work :)
> >
> > >
> > > So maybe I'm not understanding the problem, but I think the fundament=
al
> > > underlying issue is that with KMS you can have at most 2 buffers
> > > in-flight, due to our queue depth limit of 1 pending flip.
> > [Kasireddy, Vivek] Let me summarize the problem again from the perspect=
ive of
> > both the Host (Weston) and Guest (Weston) compositors assuming a refres=
h-rate
> > of 60 -- which implies the Vblank/Vsync is generated every ~16.66 ms.
> > Host compositor:
> > - After a pageflip completion event, it starts its next repaint cycle b=
y waiting for 9 ms
> > and then submits the atomic commit and at the tail end of its cycle sen=
ds a frame
> callback
> > event to all its clients (who registered and submitted frames) indicati=
ng to them to
> > start their next redraw  -- giving them at-least ~16 ms to submit a new=
 frame to be
> > included in its next repaint. Why a configurable 9 ms delay is needed i=
s explained
> > in Pekka's blog post here:
> > https://ppaalanen.blogspot.com/2015/02/weston-repaint-scheduling.html
> >
> > - It'll send a wl_buffer.release event for a client submitted previous =
buffer only
> > when the client has submitted a new buffer and:
> > a) When it hasn't started its repaint cycle yet OR
> > b) When it clears its old state after it gets a pageflip completion eve=
nt -- if it had
> > flipped the client's buffer onto a hardware plane.
> >
> > Guest compositor:
> > - After a pageflip completion is sent by Guest KMS, it takes about 10-1=
2 ms for the
> > Guest compositor to submit a new atomic commit. This time of 10-12 ms i=
ncludes the
> > 9 ms wait -- just like the Host compositor -- for its clients to submit=
 new buffers.
> > - When it gets a pageflip completion, it assumes that the previously su=
bmitted buffer
> > is free for re-use and uses it again -- resulting in the usage of only =
2 out of a maximum
> > of 4 backbuffers included as part of the Mesa GBM surface implementatio=
n.
> >
> > Guest KMS/Virtio-gpu/Qemu Wayland UI:
> > - Because no_vblank=3Dtrue for Guest KMS and since the vblank event (wh=
ich also serves
> > as the pageflip completion event for user-space) is sent right away aft=
er atomic commit,
> > as Gerd said, we use an internal dma-fence to block/wait the Guest KMS =
until we know
> for
> > sure that the Host is completely done using the buffer. To ensure this,=
 we signal the
> dma-fence
> > only after the Host compositor sends a wl_buffer.release event or an eq=
uivalent signal.
> >
> > The goal:
> > - Maintain full framerate even when the Guest scanout FB is flipped ont=
o a hardware
> plane
> > on the Host -- regardless of either compositor's scheduling policy -- w=
ithout making any
> > copies and ensuring that both Host and Guest are not accessing the buff=
er at the same
> time.
> >
> > The problem:
> > - If the Host compositor flips the client's buffer (in this case Guest =
compositor's buffer)
> > onto a hardware plane, then it can send a wl_buffer.release event for t=
he previous buffer
> > only after it gets a pageflip completion. And, if the Guest compositor =
takes 10-12 ms to
> > submit a new buffer and given the fact that the Host compositor waits o=
nly for 9 ms, the
> > Guest compositor will miss the Host's repaint cycle resulting in halved=
 frame-rate.
> >
> > The solution:
> > - To ensure full framerate, the Guest compositor has to start it's repa=
int cycle (including
> > the 9 ms wait) when the Host compositor sends the frame callback event =
to its clients.
> > In order for this to happen, the dma-fence that the Guest KMS waits on =
-- before sending
> > pageflip completion -- cannot be tied to a wl_buffer.release event. Thi=
s means that, the
> > Guest compositor has to be forced to use a new buffer for its next repa=
int cycle when it
> > gets a pageflip completion.
>=20
> Is that really the only solution?
[Kasireddy, Vivek] There are a few others I mentioned here:
https://gitlab.freedesktop.org/wayland/weston/-/issues/514#note_986572
But I think none of them are as compelling as this one.

>=20
> If we fix the event timestamps so that both guest and host use the same
> timestamp, but then the guest starts 5ms (or something like that) earlier=
,
> then things should work too? I.e.
> - host compositor starts at (previous_frametime + 9ms)
> - guest compositor starts at (previous_frametime + 4ms)
>=20
> Ofc this only works if the frametimes we hand out to both match _exactly_
> and are as high-precision as the ones on the host side. Which for many gp=
u
> drivers at least is the case, and all the ones you care about for sure :-=
)
>=20
> But if the frametimes the guest receives are the no_vblank fake ones, the=
n
> they'll be all over the place and this carefully tuned low-latency redraw
> loop falls apart. Aside fromm the fact that without tuning the guests to
> be earlier than the hosts, you're guaranteed to miss every frame (except
> when the timing wobbliness in the guest is big enough by chance to make
> the deadline on the oddball frame).
[Kasireddy, Vivek] The Guest and Host use different event timestamps as we =
don't
share these between the Guest and the Host. It does not seem to be causing =
any other
problems so far but we did try the experiment you mentioned (i.e., adjustin=
g the delays)
and it works. However, this patch series is meant to fix the issue without =
having to tweak
anything (delays) because we can't do this for every compositor out there.

>=20
> > - The Weston MR I linked above does this by getting an out_fence fd and=
 taking a
> reference
> > on all the FBs included in the atomic commit forcing the compositor to =
use new FBs for
> its
> > next repaint cycle. It releases the references when the out_fence is si=
gnalled later when
> > the Host compositor sends a wl_buffer.release event.
> >
> > >
> > > Unfortunately that means for virtual hw where it takes a few more
> > > steps/vblanks until the framebuffer actually shows up on screen and i=
s
> > > scanned out, we suffer deeply. The usual fix for that is to drop the
> > > latency and increase throughput, and have more buffers in-flight. Whi=
ch
> > > this patch tries to do.
> > >
> > > Now I think where we go wrong here is that we're trying to hack this =
up by
> > > defining different semantics for the out-fence and for the drm-event.=
 Imo
> > > that's wrong, they're both meant to show eactly the same thing:
> > > - when is the new frame actually visible to the user (as in, eyeballs=
 in a
> > >   human head, preferrably, not the time when we've handed the buffer =
off
> > >   to the virtual hw)
> > > - when is the previous buffer no longer being used by the scanout hw
> > [Kasireddy, Vivek] Right, they both mean the same thing but I think usi=
ng both
> > at the same time would be redundant in the case of Weston. That's why I=
 am trying
> > to repurpose the usage of out_fence in this case by introducing a new c=
apability
> > that may not be relevant for bare-metal KMS drivers but would be useful=
 for
> > virtual KMS drivers.
> >
> > >
> > > We do cheat a bit right now in so far that we assume they're both the
> > > same, as in, panel-side latency is currently the compositor's problem=
 to
> > > figure out.
> > >
> > > So for virtual hw I think the timestamp and even completion really ne=
ed to
> > > happen only when the buffer has been pushed through the entire
> > > virtualization chain, i.e. ideally we get the timestamp from the kms
> > > driver from the host side. Currently that's not done, so this is most
> > > likely quite broken already (virtio relies on the no-vblank auto even=
t
> > > sending, which definitely doesn't wait for anything, or I'm completel=
y
> > > missing something).
> > [Kasireddy, Vivek] You are right; virtio_gpu does use the no_vblank aut=
o event but
> > as I mentioned above we do use an internal dma-fence to wait until the =
submitted
> > buffer is no longer used by the Host. In other words, we wait (in updat=
e_planes hook)
> > until we get an appropriate signal from the Host to proceed to make sur=
e that we are
> > not rendering faster than what the Host can display.
>=20
> Yeah that internal dma_fence really should be the flip completion event
> too. That's how this uapi is supposed to work.
>=20
> Once you have that then maybe weston magically works because it realizes
> that it misses the frames it's aiming for. Or at least there will be debu=
g
> output about that I hope (I'm not sure the auto-tuning works/exists).
[Kasireddy, Vivek] Even if we send the flip completion event from the drive=
r instead of
the DRM core, I don't think it'll make any difference. The only advantage I=
 can see is
that the driver would be in control of both the event and the out_fence and=
 can leverage
it for this specific use-case.

>=20
> > However, as you suggest below, we could set no_vblank=3Dfalse and send =
the vblank/
> > pageflip completion event from the virtio-gpu driver instead of having =
the DRM
> > core send it. This can prevent the DRM core from signalling the out_fen=
ce as well
> > which is my intended objective and what my first patch tries to do. I'd=
 still need the
> > new capability though to include the patch in Weston that deals with ou=
t_fence --
> > unless Weston upstream can accept the patch after reviewing it without =
this newly
> > added capability which would be redundant but it does solve my problem.=
 Would
> > this be acceptable?
>=20
> out fence and flip completion event are exactly the same thing
> semantically. Well, before your patch here at least. So if you fix up the
> internal crtc->event handling then you fix up both. That's very much by
> design, because otherwise we'd have a bunch of kms drivers that only work
> on Android (which uses out-fence), and the others only work on dekstop
> linux (which uses flip completion drm_event). And probably very few that
> support both.
[Kasireddy, Vivek] Hmm, I think I see your point. If a Guest exclusively us=
es=20
either out_fence or drm event, then this idea wont work because I am trying=
 to
create a distinction between the two to mean: repaint when you get pageflip=
=20
completion and just drop references when an out_fence is signalled. However=
,
looking at the code in drm_send_event_helper(), I see that the out_fence is
signaled only if the userspace subscribed for an event. Can the out_fence b=
e
signaled without a corresponding drm event?

>=20
> > > I think instead of hacking up some ill-defined 1.5 queue depth suppor=
t,
> > > what we should do is support queue depth > 1 properly. So:
> > >
> > > - Change atomic to support queue depth > 1, this needs to be a per-dr=
iver
> > >   thing due to a bunch of issues in driver code. Essentially drivers =
must
> > >   never look at obj->state pointers, and only ever look up state thro=
ugh
> > >   the passed-in drm_atomic_state * update container.
> > >
> > > - Aside: virtio should loose all it's empty hooks, there's no point i=
n
> > >   that.
> > >
> > > - We fix virtio to send out the completion event at the end of this e=
ntire
> > >   pipeline, i.e. virtio code needs to take care of sending out the
> > >   crtc_state->event correctly.
> > >
> > > - We probably also want some kind of (maybe per-crtc) recommended que=
ue
> > >   depth property so compositors know how many buffers to keep in flig=
ht.
> > >   Not sure about that.
> > >
> > > It's a bit more work, but also a lot less hacking around infrastructu=
re in
> > > dubious ways.
> > >
> > > Thoughts?
> > [Kasireddy, Vivek] IIUC, you are suggesting that we should make it poss=
ible to
> > submit a new atomic commit even though the completion event for the pre=
vious
> > one has not come in yet. This may potentially solve my problem but it s=
ounds very
> > disruptive and not very useful for bare-metal cases. It also means that=
 the compositors,
> > DRM core and the drivers need to keep track of multiple states -- as op=
posed to new and
> > old -- for all objects such as crtcs, planes, etc and account for multi=
ple completion
> events.
> > I guess it is doable but as you suggest it seems like a lot of work wit=
h many pitfalls
> ahead.
>=20
> Queue deeper than 1 has been an eventual goal for atomic since the start,
> we simply didn't get around to it.
>=20
> All the state handling and helpers are built to support that (but there
> could be more bugs). The only rule drivers must follow is that in their
> atomic_commit code they never look at the various obj->state pointers
> (like drm_crtc->state), since that might be the state of a subsequent
> commit. Instead they must only get the state through the drm_atomic_state
> structure. We've recently also updated all the helpers to pass that aroun=
d
> everywhere (for other reasons), so the challenge here is only to fix up
> individual drivers. And maybe come up with some debug checks to make the
> obj->state pointers aren't used in atomic_commit.
[Kasireddy, Vivek] Ok, if a significant amount of preparatory work has alre=
ady
been done, then your suggestion to increase the queue depth does not sound
that onerous though.

>=20
> From a design pov I think your approach of hacking up the event machinery
> to slip in 2 commits while not actually using the 2 deep queue stuff like
> it's meant to be is much worse.
>=20
> On the userspace side I'm not sure why you need to keep track of more
> state. All you need to keep track is of more buffers in your retire/reuse
> list, but you have to do that with your proposal here too. So no
> difference at all there.
>=20
> Anyway it sounds like if the guest compositor would adjust it's deadline
> so that the guest and host compositor interleave correctly, then we shoul=
d
> still be able to hit full refresh rate without a deeper queue. Has that
> been looked into?
[Kasireddy, Vivek] Yeah, as I mentioned above, that was the first thing we=
=20
tried and it worked (i.e., we get full frame-rate). But it obviously is not=
 a=20
solution that'll work for all Guest compositors as their scheduling policie=
s
may not be tweakable.

It sounds like you are recommending the queue depth increase as the only
viable solution. We'd look into that but I am unable to see a clear picture=
 in
terms of how it would play out with the Guest compositor. A Guest composito=
r
starts its repaint cycle after it gets a pageflip completion or an out_fenc=
e signal;
if it determines that the latency is high, then it can try to increase the =
queue depth
by submitting atomic commits without waiting for the pageflip completion/
out_fence. Once it starts doing this, I am wondering when it can repaint ag=
ain=20
given that there will be multiple completion events coming in. Should there=
 be=20
separate events for vblank (to mean start repaint with new buffer) and page=
flip=20
completion (to mean drop references to old FBs)? And, as I mentioned earlie=
r,=20
the Guest compositor has to start its repaint cycle when the Host composito=
r
sends a frame callback event otherwise it won't work.

Thanks,
Vivek

> -Daniel
>=20
> >
> > Thanks,
> > Vivek
> > >
> > > Cheers, Daniel
> > >
> > > >
> > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > > > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > > > Cc: Simon Ser <contact@emersion.fr>
> > > > Cc: Michel D=E4nzer <michel@daenzer.net>
> > > > Cc: Tina Zhang <tina.zhang@intel.com>
> > > > Cc: Dongwon Kim <dongwon.kim@intel.com>
> > > >
> > > > Vivek Kasireddy (4):
> > > >   drm: Add a capability flag to support deferred out_fence signalli=
ng
> > > >   virtio-gpu uapi: Add VIRTIO_GPU_F_OUT_FENCE feature
> > > >   drm/virtio: Add VIRTIO_GPU_CMD_RESOURCE_OUT_FENCE cmd
> > > >   drm/virtio: Probe and implement VIRTIO_GPU_F_OUT_FENCE feature
> > > >
> > > >  drivers/gpu/drm/drm_file.c               | 11 +++---
> > > >  drivers/gpu/drm/drm_ioctl.c              |  3 ++
> > > >  drivers/gpu/drm/virtio/virtgpu_debugfs.c |  1 +
> > > >  drivers/gpu/drm/virtio/virtgpu_drv.c     |  1 +
> > > >  drivers/gpu/drm/virtio/virtgpu_drv.h     |  6 ++++
> > > >  drivers/gpu/drm/virtio/virtgpu_fence.c   |  9 +++++
> > > >  drivers/gpu/drm/virtio/virtgpu_kms.c     | 10 ++++--
> > > >  drivers/gpu/drm/virtio/virtgpu_plane.c   | 44 ++++++++++++++++++++=
+++-
> > > >  drivers/gpu/drm/virtio/virtgpu_vq.c      | 17 +++++++++
> > > >  include/drm/drm_mode_config.h            |  9 +++++
> > > >  include/uapi/drm/drm.h                   |  1 +
> > > >  include/uapi/linux/virtio_gpu.h          | 12 +++++++
> > > >  12 files changed, 117 insertions(+), 7 deletions(-)
> > > >
> > > > --
> > > > 2.30.2
> > > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>=20
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
