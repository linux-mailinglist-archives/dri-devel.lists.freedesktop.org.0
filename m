Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B93C63E23FE
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 09:29:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245D16E8ED;
	Fri,  6 Aug 2021 07:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0216EAC9
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 07:27:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10067"; a="236301120"
X-IronPort-AV: E=Sophos;i="5.84,299,1620716400"; d="scan'208";a="236301120"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2021 00:27:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,299,1620716400"; d="scan'208";a="442821503"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 06 Aug 2021 00:27:14 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 6 Aug 2021 00:27:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 6 Aug 2021 00:27:13 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.010;
 Fri, 6 Aug 2021 00:27:13 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
CC: =?iso-8859-1?Q?Michel_D=E4nzer?= <michel@daenzer.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Gerd
 Hoffmann" <kraxel@redhat.com>, Pekka Paalanen <ppaalanen@gmail.com>, "Simon
 Ser" <contact@emersion.fr>, "Zhang, Tina" <tina.zhang@intel.com>, "Kim,
 Dongwon" <dongwon.kim@intel.com>, "Singh, Satyeshwar"
 <satyeshwar.singh@intel.com>
Subject: RE: [RFC v1 0/4] drm: Add support for DRM_CAP_DEFERRED_OUT_FENCE
 capability
Thread-Topic: [RFC v1 0/4] drm: Add support for DRM_CAP_DEFERRED_OUT_FENCE
 capability
Thread-Index: AQHXhFPnN1B4zkQxMkK/V9zRY5/TqKtbxyyAgABF0uCABEyGAIAAS7kwgAE7RYCAAd/fgP//+PQwgAGYgYCAAEZAwA==
Date: Fri, 6 Aug 2021 07:27:13 +0000
Message-ID: <47938a95ac0640cbb1b713ff1a48dd8d@intel.com>
References: <20210729081659.2255499-1-vivek.kasireddy@intel.com>
 <YQPTo0D5SZfX44dn@phenom.ffwll.local>
 <612fd31a51384cb28ac6da9db3e840ca@intel.com>
 <YQepZMFaCNLBNGx9@phenom.ffwll.local>
 <fa53f9db229e481784bfe3a61a195fd3@intel.com>
 <1b96e91f-d65c-a155-8c8c-8a4326733c4e@daenzer.net>
 <CAKMK7uH7gy7x-MrN7EWwwdsZKn-i5XB5Wie_ueRXXdnx5Yhefw@mail.gmail.com>
 <8722db11a6d245259c15ca2262a40d07@intel.com>
 <YQvUsYgKxPM/2KZm@phenom.ffwll.local>
In-Reply-To: <YQvUsYgKxPM/2KZm@phenom.ffwll.local>
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

> > > > >>> The solution:
> > > > >>> - To ensure full framerate, the Guest compositor has to start i=
t's repaint cycle
> > > (including
> > > > >>> the 9 ms wait) when the Host compositor sends the frame callbac=
k event to its
> > > clients.
> > > > >>> In order for this to happen, the dma-fence that the Guest KMS w=
aits on -- before
> > > sending
> > > > >>> pageflip completion -- cannot be tied to a wl_buffer.release ev=
ent. This means
> that,
> > > the
> > > > >>> Guest compositor has to be forced to use a new buffer for its n=
ext repaint cycle
> > > when it
> > > > >>> gets a pageflip completion.
> > > > >>
> > > > >> Is that really the only solution?
> > > > > [Kasireddy, Vivek] There are a few others I mentioned here:
> > > > > https://gitlab.freedesktop.org/wayland/weston/-/issues/514#note_9=
86572
> > > > > But I think none of them are as compelling as this one.
> > > > >
> > > > >>
> > > > >> If we fix the event timestamps so that both guest and host use t=
he same
> > > > >> timestamp, but then the guest starts 5ms (or something like that=
) earlier,
> > > > >> then things should work too? I.e.
> > > > >> - host compositor starts at (previous_frametime + 9ms)
> > > > >> - guest compositor starts at (previous_frametime + 4ms)
> > > > >>
> > > > >> Ofc this only works if the frametimes we hand out to both match =
_exactly_
> > > > >> and are as high-precision as the ones on the host side. Which fo=
r many gpu
> > > > >> drivers at least is the case, and all the ones you care about fo=
r sure :-)
> > > > >>
> > > > >> But if the frametimes the guest receives are the no_vblank fake =
ones, then
> > > > >> they'll be all over the place and this carefully tuned low-laten=
cy redraw
> > > > >> loop falls apart. Aside fromm the fact that without tuning the g=
uests to
> > > > >> be earlier than the hosts, you're guaranteed to miss every frame=
 (except
> > > > >> when the timing wobbliness in the guest is big enough by chance =
to make
> > > > >> the deadline on the oddball frame).
> > > > > [Kasireddy, Vivek] The Guest and Host use different event timesta=
mps as we don't
> > > > > share these between the Guest and the Host. It does not seem to b=
e causing any
> other
> > > > > problems so far but we did try the experiment you mentioned (i.e.=
, adjusting the
> > > delays)
> > > > > and it works. However, this patch series is meant to fix the issu=
e without having to
> > > tweak
> > > > > anything (delays) because we can't do this for every compositor o=
ut there.
> > > >
> > > > Maybe there could be a mechanism which allows the compositor in the=
 guest to
> > > automatically adjust its repaint cycle as needed.
> > > >
> > > > This might even be possible without requiring changes in each compo=
sitor, by
> adjusting
> > > the vertical blank periods in the guest to be aligned with the host c=
ompositor repaint
> > > cycles. Not sure about that though.
> > > >
> > > > Even if not, both this series or making it possible to queue multip=
le flips require
> > > corresponding changes in each compositor as well to have any effect.
> > >
> > > Yeah from all the discussions and tests done it sounds even with a
> > > deeper queue we have big coordination issues between the guest and
> > > host compositor (like the example that the guest is now rendering at
> > > 90fps instead of 60fps like the host).
> > [Kasireddy, Vivek] Oh, I think you are referring to my reply to Gerd. T=
hat 90 FPS vs
> > 60 FPS problem is a completely different issue that is associated with =
Qemu GTK UI
> > backend. With the GTK backend -- and also with SDL backend -- we Blit t=
he Guest
> > scanout FB onto one of the backbuffers managed by EGL.
> >
> > I am trying to add a new Qemu Wayland UI backend so that we can elimina=
te that Blit
> > and thereby have a truly zero-copy solution. And, this is there I am ru=
nning into the
> > halved frame-rate issue -- the current problem.
>=20
> Yes, that's what I referenced. But I disagree that it's a different
> problem. The underlying problem in both cases is that the guest and host
> compositor free-wheel instead of rendering in sync. It's just that
> depending upon how exactly the flip completion event on the gues side
> plays out you either get guest rendering that's faster than the host-side
> 60fps, or guest rendering that's much slower than the host-side 60fps.
[Kasireddy, Vivek] That used to be the case before we added a synchronizati=
on
mechanism to the GTK UI backend that uses a sync file. After adding this
and making the Guest wait until this sync file fd on the Host is signaled, =
we
consistently get 60 FPS because the flip completion event for the Guest is
directly tied to the signaling of the sync file in this particular case (GT=
K UI).

>=20
> The fundamental problem in both cases is that they don't run in lockstep.
> If you fix that, through fixing the timestamp and even reporting most
> likely, you should be able to fix both bugs.
[Kasireddy, Vivek] GTK UI is an EGL based solution that Blits the Guest sca=
nout
FB onto one of the backbuffers managed by EGL. Wayland UI is a zero-copy
solution that just wraps the dmabuf associated with Guest scanout FB in a=20
wl_buffer and submits it directly to the Host compositor. These backends ar=
e
completely independent of each other and cannot be active at the same time.
In other words, we cannot have zero-copy and Blit based solutions running
parallelly. And, this issue is only relevant for Wayland UI backend and has=
=20
nothing to do with GTK UI.=20

>=20
> > > Hence my gut feeling reaction that first we need to get these two
> > > compositors aligned in their timings, which propobably needs
> > > consistent vblank periods/timestamps across them (plus/minux
> > > guest/host clocksource fun ofc). Without this any of the next steps
> > > will simply not work because there's too much jitter by the time the
> > > guest compositor gets the flip completion events.
> > [Kasireddy, Vivek] Timings are not a problem and do not significantly
> > affect the repaint cycles from what I have seen so far.
> >
> > >
> > > Once we have solid events I think we should look into statically
> > > tuning guest/host compositor deadlines (like you've suggested in a
> > > bunch of places) to consisently make that deadline and hit 60 fps.
> > > With that we can then look into tuning this automatically and what to
> > > do when e.g. switching between copying and zero-copy on the host side
> > > (which might be needed in some cases) and how to handle all that.
> > [Kasireddy, Vivek] As I confirm here: https://gitlab.freedesktop.org/wa=
yland/weston/-
> /issues/514#note_984065
> > tweaking the deadlines works (i.e., we get 60 FPS) as we expect. Howeve=
r,
> > I feel that this zero-copy solution I am trying to create should be ind=
ependent
> > of compositors' deadlines, delays or other scheduling parameters.
>=20
> That's not how compositors work nowadays. Your problem is that you don't
> have the guest/host compositor in sync. zero-copy only changes the timing=
,
> so it changes things from "rendering way too many frames" to "rendering
> way too few frames".
>=20
> We need to fix the timing/sync issue here first, not paper over it with
> hacks.
[Kasireddy, Vivek] What I really meant is that the zero-copy solution shoul=
d be
independent of the scheduling policies to ensure that it works with all com=
positors.
 IIUC, Weston for example uses the vblank/pageflip completion timestamp, th=
e
configurable repaint-window value, refresh-rate, etc to determine when to s=
tart
its next repaint -- if there is any damage:
timespec_add_nsec(&output->next_repaint, stamp, refresh_nsec);
timespec_add_msec(&output->next_repaint, &output->next_repaint, -compositor=
->repaint_msec);

And, in the case of VKMS, since there is no real hardware, the timestamp is=
 always:
now =3D ktime_get();
send_vblank_event(dev, e, seq, now);

When you say that the Guest/Host compositor need to stay in sync, are you=20
suggesting that we need to ensure that the vblank timestamp on the Host=20
needs to be shared and be the same on the Guest and a vblank/pageflip
completion for the Guest needs to be sent at exactly the same time it is se=
nt
on the Host? If yes, I'd say that we do send the pageflip completion to Gue=
st
around the same time a vblank is generated on the Host but it does not help
because the Guest compositor would only have 9 ms to submit a new frame
and if the Host is running Mutter, the Guest would only have 2 ms.
(https://gitlab.freedesktop.org/wayland/weston/-/issues/514#note_984341)

>=20
> Only, and I really mean only, when that shows that it's simply impossible
> to hit 60fps with zero-copy and the guest/host fully aligned should we
> look into making the overall pipeline deeper.
[Kasireddy, Vivek] From all the experiments conducted so far and given the
discussion associated with https://gitlab.freedesktop.org/wayland/weston/-/=
issues/514
I think we have already established that in order for a zero-copy solution =
to work=20
reliably, the Guest compositor needs to start its repaint cycle when the Ho=
st
compositor sends a frame callback event to its clients.

>=20
> > > Only when that all shows that we just can't hit 60fps consistently an=
d
> > > really need 3 buffers in flight should we look at deeper kms queues.
> > > And then we really need to implement them properly and not with a
> > > mismatch between drm_event an out-fence signalling. These quick hacks
> > > are good for experiments, but there's a pile of other things we need
> > > to do first. At least that's how I understand the problem here right
> > > now.
> > [Kasireddy, Vivek] Experiments done so far indicate that we can hit 59 =
FPS consistently
> > -- in a zero-copy way independent of compositors' delays/deadlines -- w=
ith this
> > patch series + the Weston MR I linked in the cover letter. The main rea=
son why this
> > works is because we relax the assumption that when the Guest compositor=
 gets a
> > pageflip completion event that it could reuse the old FB it submitted i=
n the previous
> > atomic flip and instead force it to use a new one. And, we send the pag=
eflip completion
> > event to the Guest when the Host compositor sends a frame callback even=
t. Lastly,
> > we use the (deferred) out_fence as just a mechanism to tell the Guest c=
ompositor when
> > it can release references on old FBs so that they can be reused again.
> >
> > With that being said, the only question is how can we accomplish the ab=
ove in an
> upstream
> > acceptable way without regressing anything particularly on bare-metal. =
Its not clear if
> just
> > increasing the queue depth would work or not but I think the Guest comp=
ositor has to be
> told
> > when it can start its repaint cycle and when it can assume the old FB i=
s no longer in use.
> > On bare-metal -- and also with VKMS as of today -- a pageflip completio=
n indicates
> both.
> > In other words, Vblank event is the same as Flip done, which makes sens=
e on bare-metal.
> > But if we were to have two events at-least for VKMS: vblank to indicate=
 to Guest to start
> > repaint and flip_done to indicate to drop references on old FBs, I thin=
k this problem can
> > be solved even without increasing the queue depth. Can this be acceptab=
le?
>=20
> That's just another flavour of your "increase queue depth without
> increasing the atomic queue depth" approach. I still think the underlying
> fundamental issue is a timing confusion, and the fact that adjusting the
> timings fixes things too kinda proves that. So we need to fix that in a
> clean way, not by shuffling things around semi-randomly until the specifi=
c
> config we tests works.
[Kasireddy, Vivek] This issue is not due to a timing or timestamp mismatch.=
 We
have carefully instrumented both the Host and Guest compositors and measure=
d
the latencies at each step. The relevant debug data only points to the sche=
duling
policy -- of both Host and Guest compositors -- playing a role in Guest ren=
dering=20
at 30 FPS.

>=20
> Iow I think we need a solution here which both slows down the 90fps to
> 60fps for the blit case, and the 30fps speed up to 60fps for the zerocopy
> case. Because the host might need to switch transparently between blt and
> zerocopy for various reasons.
[Kasireddy, Vivek] As I mentioned above, the Host (Qemu) cannot switch UI
backends at runtime. In other words, with GTK UI backend, it is always Blit
whereas Wayland UI backend is always zero-copy.

Thanks,
Vivek

> -Daniel
>=20
> > Thanks,
> > Vivek
> > >
> > > Cheers, Daniel
> > >
> > > >
> > > >
> > > > --
> > > > Earthling Michel D=E4nzer               |               https://red=
hat.com
> > > > Libre software enthusiast             |             Mesa and X deve=
loper
> > >
> > >
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
