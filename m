Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDEA3E8AF8
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 09:20:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D54C6E0C6;
	Wed, 11 Aug 2021 07:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA846E0C6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 07:20:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="278819036"
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; d="scan'208";a="278819036"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2021 00:20:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; d="scan'208";a="675928051"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga005.fm.intel.com with ESMTP; 11 Aug 2021 00:20:48 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 11 Aug 2021 00:20:48 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 11 Aug 2021 00:20:47 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.010;
 Wed, 11 Aug 2021 00:20:47 -0700
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
Thread-Index: AQHXhFPnN1B4zkQxMkK/V9zRY5/TqKtbxyyAgABF0uCABEyGAIAAS7kwgAE7RYCAAd/fgP//+PQwgAGYgYCAAEZAwIAGJqyA///UVYCAAV2qgIAAYyHw
Date: Wed, 11 Aug 2021 07:20:47 +0000
Message-ID: <0fda5b001fc64746b780d2e7e2bca120@intel.com>
References: <612fd31a51384cb28ac6da9db3e840ca@intel.com>
 <YQepZMFaCNLBNGx9@phenom.ffwll.local>
 <fa53f9db229e481784bfe3a61a195fd3@intel.com>
 <1b96e91f-d65c-a155-8c8c-8a4326733c4e@daenzer.net>
 <CAKMK7uH7gy7x-MrN7EWwwdsZKn-i5XB5Wie_ueRXXdnx5Yhefw@mail.gmail.com>
 <8722db11a6d245259c15ca2262a40d07@intel.com>
 <YQvUsYgKxPM/2KZm@phenom.ffwll.local>
 <47938a95ac0640cbb1b713ff1a48dd8d@intel.com>
 <YRE4jaQsOYNsLb+1@phenom.ffwll.local>
 <dfb19f81e9a04bfcadd1b010dfd67edc@intel.com>
 <YRI5PZiGXjbjlBO2@phenom.ffwll.local>
In-Reply-To: <YRI5PZiGXjbjlBO2@phenom.ffwll.local>
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

> On Tue, Aug 10, 2021 at 08:21:09AM +0000, Kasireddy, Vivek wrote:
> > Hi Daniel,
> >
> > > On Fri, Aug 06, 2021 at 07:27:13AM +0000, Kasireddy, Vivek wrote:
> > > > Hi Daniel,
> > > >
> > > > > > > > >>> The solution:
> > > > > > > > >>> - To ensure full framerate, the Guest compositor has to=
 start it's repaint
> > > cycle
> > > > > > > (including
> > > > > > > > >>> the 9 ms wait) when the Host compositor sends the frame=
 callback event
> to
> > > its
> > > > > > > clients.
> > > > > > > > >>> In order for this to happen, the dma-fence that the Gue=
st KMS waits on -
> -
> > > before
> > > > > > > sending
> > > > > > > > >>> pageflip completion -- cannot be tied to a wl_buffer.re=
lease event. This
> > > means
> > > > > that,
> > > > > > > the
> > > > > > > > >>> Guest compositor has to be forced to use a new buffer f=
or its next
> repaint
> > > cycle
> > > > > > > when it
> > > > > > > > >>> gets a pageflip completion.
> > > > > > > > >>
> > > > > > > > >> Is that really the only solution?
> > > > > > > > > [Kasireddy, Vivek] There are a few others I mentioned her=
e:
> > > > > > > > > https://gitlab.freedesktop.org/wayland/weston/-/issues/51=
4#note_986572
> > > > > > > > > But I think none of them are as compelling as this one.
> > > > > > > > >
> > > > > > > > >>
> > > > > > > > >> If we fix the event timestamps so that both guest and ho=
st use the same
> > > > > > > > >> timestamp, but then the guest starts 5ms (or something l=
ike that) earlier,
> > > > > > > > >> then things should work too? I.e.
> > > > > > > > >> - host compositor starts at (previous_frametime + 9ms)
> > > > > > > > >> - guest compositor starts at (previous_frametime + 4ms)
> > > > > > > > >>
> > > > > > > > >> Ofc this only works if the frametimes we hand out to bot=
h match
> _exactly_
> > > > > > > > >> and are as high-precision as the ones on the host side. =
Which for many
> gpu
> > > > > > > > >> drivers at least is the case, and all the ones you care =
about for sure :-)
> > > > > > > > >>
> > > > > > > > >> But if the frametimes the guest receives are the no_vbla=
nk fake ones,
> then
> > > > > > > > >> they'll be all over the place and this carefully tuned l=
ow-latency redraw
> > > > > > > > >> loop falls apart. Aside fromm the fact that without tuni=
ng the guests to
> > > > > > > > >> be earlier than the hosts, you're guaranteed to miss eve=
ry frame (except
> > > > > > > > >> when the timing wobbliness in the guest is big enough by=
 chance to make
> > > > > > > > >> the deadline on the oddball frame).
> > > > > > > > > [Kasireddy, Vivek] The Guest and Host use different event=
 timestamps as
> we
> > > don't
> > > > > > > > > share these between the Guest and the Host. It does not s=
eem to be causing
> any
> > > > > other
> > > > > > > > > problems so far but we did try the experiment you mention=
ed (i.e.,
> adjusting
> > > the
> > > > > > > delays)
> > > > > > > > > and it works. However, this patch series is meant to fix =
the issue without
> > > having to
> > > > > > > tweak
> > > > > > > > > anything (delays) because we can't do this for every comp=
ositor out there.
> > > > > > > >
> > > > > > > > Maybe there could be a mechanism which allows the composito=
r in the guest
> to
> > > > > > > automatically adjust its repaint cycle as needed.
> > > > > > > >
> > > > > > > > This might even be possible without requiring changes in ea=
ch compositor,
> by
> > > > > adjusting
> > > > > > > the vertical blank periods in the guest to be aligned with th=
e host compositor
> > > repaint
> > > > > > > cycles. Not sure about that though.
> > > > > > > >
> > > > > > > > Even if not, both this series or making it possible to queu=
e multiple flips
> require
> > > > > > > corresponding changes in each compositor as well to have any =
effect.
> > > > > > >
> > > > > > > Yeah from all the discussions and tests done it sounds even w=
ith a
> > > > > > > deeper queue we have big coordination issues between the gues=
t and
> > > > > > > host compositor (like the example that the guest is now rende=
ring at
> > > > > > > 90fps instead of 60fps like the host).
> > > > > > [Kasireddy, Vivek] Oh, I think you are referring to my reply to=
 Gerd. That 90
> FPS vs
> > > > > > 60 FPS problem is a completely different issue that is associat=
ed with Qemu
> GTK UI
> > > > > > backend. With the GTK backend -- and also with SDL backend -- w=
e Blit the
> Guest
> > > > > > scanout FB onto one of the backbuffers managed by EGL.
> > > > > >
> > > > > > I am trying to add a new Qemu Wayland UI backend so that we can=
 eliminate
> that
> > > Blit
> > > > > > and thereby have a truly zero-copy solution. And, this is there=
 I am running into
> the
> > > > > > halved frame-rate issue -- the current problem.
> > > > >
> > > > > Yes, that's what I referenced. But I disagree that it's a differe=
nt
> > > > > problem. The underlying problem in both cases is that the guest a=
nd host
> > > > > compositor free-wheel instead of rendering in sync. It's just tha=
t
> > > > > depending upon how exactly the flip completion event on the gues =
side
> > > > > plays out you either get guest rendering that's faster than the h=
ost-side
> > > > > 60fps, or guest rendering that's much slower than the host-side 6=
0fps.
> > > > [Kasireddy, Vivek] That used to be the case before we added a synch=
ronization
> > > > mechanism to the GTK UI backend that uses a sync file. After adding=
 this
> > > > and making the Guest wait until this sync file fd on the Host is si=
gnaled, we
> > > > consistently get 60 FPS because the flip completion event for the G=
uest is
> > > > directly tied to the signaling of the sync file in this particular =
case (GTK UI).
> > > >
> > > > >
> > > > > The fundamental problem in both cases is that they don't run in l=
ockstep.
> > > > > If you fix that, through fixing the timestamp and even reporting =
most
> > > > > likely, you should be able to fix both bugs.
> > > > [Kasireddy, Vivek] GTK UI is an EGL based solution that Blits the G=
uest scanout
> > > > FB onto one of the backbuffers managed by EGL. Wayland UI is a zero=
-copy
> > > > solution that just wraps the dmabuf associated with Guest scanout F=
B in a
> > > > wl_buffer and submits it directly to the Host compositor. These bac=
kends are
> > > > completely independent of each other and cannot be active at the sa=
me time.
> > > > In other words, we cannot have zero-copy and Blit based solutions r=
unning
> > > > parallelly. And, this issue is only relevant for Wayland UI backend=
 and has
> > > > nothing to do with GTK UI.
> > > >
> > > > >
> > > > > > > Hence my gut feeling reaction that first we need to get these=
 two
> > > > > > > compositors aligned in their timings, which propobably needs
> > > > > > > consistent vblank periods/timestamps across them (plus/minux
> > > > > > > guest/host clocksource fun ofc). Without this any of the next=
 steps
> > > > > > > will simply not work because there's too much jitter by the t=
ime the
> > > > > > > guest compositor gets the flip completion events.
> > > > > > [Kasireddy, Vivek] Timings are not a problem and do not signifi=
cantly
> > > > > > affect the repaint cycles from what I have seen so far.
> > > > > >
> > > > > > >
> > > > > > > Once we have solid events I think we should look into statica=
lly
> > > > > > > tuning guest/host compositor deadlines (like you've suggested=
 in a
> > > > > > > bunch of places) to consisently make that deadline and hit 60=
 fps.
> > > > > > > With that we can then look into tuning this automatically and=
 what to
> > > > > > > do when e.g. switching between copying and zero-copy on the h=
ost side
> > > > > > > (which might be needed in some cases) and how to handle all t=
hat.
> > > > > > [Kasireddy, Vivek] As I confirm here:
> > > https://gitlab.freedesktop.org/wayland/weston/-
> > > > > /issues/514#note_984065
> > > > > > tweaking the deadlines works (i.e., we get 60 FPS) as we expect=
. However,
> > > > > > I feel that this zero-copy solution I am trying to create shoul=
d be independent
> > > > > > of compositors' deadlines, delays or other scheduling parameter=
s.
> > > > >
> > > > > That's not how compositors work nowadays. Your problem is that yo=
u don't
> > > > > have the guest/host compositor in sync. zero-copy only changes th=
e timing,
> > > > > so it changes things from "rendering way too many frames" to "ren=
dering
> > > > > way too few frames".
> > > > >
> > > > > We need to fix the timing/sync issue here first, not paper over i=
t with
> > > > > hacks.
> > > > [Kasireddy, Vivek] What I really meant is that the zero-copy soluti=
on should be
> > > > independent of the scheduling policies to ensure that it works with=
 all compositors.
> > > >  IIUC, Weston for example uses the vblank/pageflip completion times=
tamp, the
> > > > configurable repaint-window value, refresh-rate, etc to determine w=
hen to start
> > > > its next repaint -- if there is any damage:
> > > > timespec_add_nsec(&output->next_repaint, stamp, refresh_nsec);
> > > > timespec_add_msec(&output->next_repaint, &output->next_repaint, -co=
mpositor-
> > > >repaint_msec);
> > > >
> > > > And, in the case of VKMS, since there is no real hardware, the time=
stamp is always:
> > > > now =3D ktime_get();
> > > > send_vblank_event(dev, e, seq, now);
> > >
> > > vkms has been fixed since a while to fake high-precision timestamps l=
ike
> > > from a real display.
> > [Kasireddy, Vivek] IIUC, that might be one of the reasons why the Guest=
 does not need
> > to have the same timestamp as that of the Host -- to work as expected.
> >
> > >
> > > > When you say that the Guest/Host compositor need to stay in sync, a=
re you
> > > > suggesting that we need to ensure that the vblank timestamp on the =
Host
> > > > needs to be shared and be the same on the Guest and a vblank/pagefl=
ip
> > > > completion for the Guest needs to be sent at exactly the same time =
it is sent
> > > > on the Host? If yes, I'd say that we do send the pageflip completio=
n to Guest
> > > > around the same time a vblank is generated on the Host but it does =
not help
> > > > because the Guest compositor would only have 9 ms to submit a new f=
rame
> > > > and if the Host is running Mutter, the Guest would only have 2 ms.
> > > > (https://gitlab.freedesktop.org/wayland/weston/-/issues/514#note_98=
4341)
> > >
> > > Not at the same time, but the same timestamp. And yes there is some f=
un
> > > there, which is I think the fundamental issue. Or at least some of th=
e
> > > compositor experts seem to think so, and it makes sense to me.
> > [Kasireddy, Vivek] It is definitely possible that if the timestamp is m=
essed up, then
> > the Guest repaint cycle would be affected. However, I do not believe th=
at is the case
> > here given the debug and instrumentation data we collected and scrutini=
zed. Hopefully,
> > compositor experts could chime in to shed some light on this matter.
> >
> > >
> > > > >
> > > > > Only, and I really mean only, when that shows that it's simply im=
possible
> > > > > to hit 60fps with zero-copy and the guest/host fully aligned shou=
ld we
> > > > > look into making the overall pipeline deeper.
> > > > [Kasireddy, Vivek] From all the experiments conducted so far and gi=
ven the
> > > > discussion associated with https://gitlab.freedesktop.org/wayland/w=
eston/-
> /issues/514
> > > > I think we have already established that in order for a zero-copy s=
olution to work
> > > > reliably, the Guest compositor needs to start its repaint cycle whe=
n the Host
> > > > compositor sends a frame callback event to its clients.
> > > >
> > > > >
> > > > > > > Only when that all shows that we just can't hit 60fps consist=
ently and
> > > > > > > really need 3 buffers in flight should we look at deeper kms =
queues.
> > > > > > > And then we really need to implement them properly and not wi=
th a
> > > > > > > mismatch between drm_event an out-fence signalling. These qui=
ck hacks
> > > > > > > are good for experiments, but there's a pile of other things =
we need
> > > > > > > to do first. At least that's how I understand the problem her=
e right
> > > > > > > now.
> > > > > > [Kasireddy, Vivek] Experiments done so far indicate that we can=
 hit 59 FPS
> > > consistently
> > > > > > -- in a zero-copy way independent of compositors' delays/deadli=
nes -- with this
> > > > > > patch series + the Weston MR I linked in the cover letter. The =
main reason why
> this
> > > > > > works is because we relax the assumption that when the Guest co=
mpositor gets a
> > > > > > pageflip completion event that it could reuse the old FB it sub=
mitted in the
> previous
> > > > > > atomic flip and instead force it to use a new one. And, we send=
 the pageflip
> > > completion
> > > > > > event to the Guest when the Host compositor sends a frame callb=
ack event.
> Lastly,
> > > > > > we use the (deferred) out_fence as just a mechanism to tell the=
 Guest compositor
> > > when
> > > > > > it can release references on old FBs so that they can be reused=
 again.
> > > > > >
> > > > > > With that being said, the only question is how can we accomplis=
h the above in an
> > > > > upstream
> > > > > > acceptable way without regressing anything particularly on bare=
-metal. Its not
> clear
> > > if
> > > > > just
> > > > > > increasing the queue depth would work or not but I think the Gu=
est compositor
> has to
> > > be
> > > > > told
> > > > > > when it can start its repaint cycle and when it can assume the =
old FB is no longer
> in
> > > use.
> > > > > > On bare-metal -- and also with VKMS as of today -- a pageflip c=
ompletion
> indicates
> > > > > both.
> > > > > > In other words, Vblank event is the same as Flip done, which ma=
kes sense on
> bare-
> > > metal.
> > > > > > But if we were to have two events at-least for VKMS: vblank to =
indicate to
> Guest to
> > > start
> > > > > > repaint and flip_done to indicate to drop references on old FBs=
, I think this
> problem
> > > can
> > > > > > be solved even without increasing the queue depth. Can this be =
acceptable?
> > > > >
> > > > > That's just another flavour of your "increase queue depth without
> > > > > increasing the atomic queue depth" approach. I still think the un=
derlying
> > > > > fundamental issue is a timing confusion, and the fact that adjust=
ing the
> > > > > timings fixes things too kinda proves that. So we need to fix tha=
t in a
> > > > > clean way, not by shuffling things around semi-randomly until the=
 specific
> > > > > config we tests works.
> > > > [Kasireddy, Vivek] This issue is not due to a timing or timestamp m=
ismatch. We
> > > > have carefully instrumented both the Host and Guest compositors and=
 measured
> > > > the latencies at each step. The relevant debug data only points to =
the scheduling
> > > > policy -- of both Host and Guest compositors -- playing a role in G=
uest rendering
> > > > at 30 FPS.
> > >
> > > Hm but that essentially means that the events your passing around hav=
e an
> > > even more ad-hoc implementation specific meaning: Essentially it's th=
e
> > > kick-off for the guest's repaint loop? That sounds even worse for a k=
ms
> > > uapi extension.
> > [Kasireddy, Vivek] The pageflip completion event/vblank event indeed se=
rves as the
> > kick-off for a compositor's (both Guest and Host) repaint loop. AFAICT,=
 Weston
> > works that way and even if we increase the queue depth to solve this pr=
oblem, I don't
> > think it'll help because the arrival of this event always indicates to =
a compositor to
> > start its repaint cycle again and assume that the previous buffers are =
all free.
>=20
> I thought this is how simple compositors work, and weston has since a
> while it's own timer, which is based on the timestamp it gets (at on
> drivers with vblank support), so that it starts the repaint loop a few ms
> before the next vblank. And not immediately when it receives the old page
> flip completion event.
[Kasireddy, Vivek] Right, Weston does use a timer (named repaint_timer) to =
determine
when to start its next repaint cycle. And, IIUC, the way it works is it use=
s the Vblank
timestamp and refresh rate to calculate the cycle length and then deduct th=
e configurable
"repaint-window" to calculate the delay. So, for a refresh rate of 60 Hz, w=
hich implies
a cycle length of ~16.66 ms, and a default repaint-window value of 7 ms, th=
e delay would
be ~9 ms. Therefore, from the current vblank timestamp, it waits for ~9 ms =
before starting
repaint again.

The above behavior is identical for both bare-metal and also with virtual K=
MS Guest
drivers that use fake vblank events. However, it does all the above things =
only after
getting a pageflip completion event.

>=20
> Ofc if the flip completion event is late, it needs to delay the repaint
> cycle.
>=20
> > > > > Iow I think we need a solution here which both slows down the 90f=
ps to
> > > > > 60fps for the blit case, and the 30fps speed up to 60fps for the =
zerocopy
> > > > > case. Because the host might need to switch transparently between=
 blt and
> > > > > zerocopy for various reasons.
> > > > [Kasireddy, Vivek] As I mentioned above, the Host (Qemu) cannot swi=
tch UI
> > > > backends at runtime. In other words, with GTK UI backend, it is alw=
ays Blit
> > > > whereas Wayland UI backend is always zero-copy.
> > >
> > > Hm ok, that at least makes things somewhat simpler. Another thing tha=
t I
> > > just realized: What happens when the host changes screen resolution a=
nd
> > > especially refresh rate?
> > [Kasireddy, Vivek] AFAICT, if the Host changes resolution or if the Qem=
u UI window
> > is resized, then that'll trigger a Guest KMS modeset -- via drm_helper_=
hpd_irq_event().
> > As far as the refresh rate is concerned, if Qemu is launched with GTK U=
I backend,
> > then the "render signal" GTK sends out to apps would reflect the new re=
fresh rate.
> > And, since the internal dma-fence is tied to this "render signal", Gues=
t updates are
> > automatically synchronized to the new refresh rate.
>=20
> Yeah, the problem is that right now kms uapi assumes that the refresh rat=
e
> doesn't just randomly change underneath the compositor. Which with kvm it
> does, which is a bit annoying. And without the refresh rate the guest
> compositor can't really time it's repaint loop properly.
[Kasireddy, Vivek] The Guest compositor would get notified via UDEV if the =
Host does
a modeset because Guest KMS would trigger a hotplug. However, I think havin=
g a
refresh rate that is different between Guest and Host compositors is not de=
sirable.

>=20
> > If Qemu is launched with the Wayland UI backend, then the internal dma-=
fence would
> > be tied to the wl_buffer.release event. And, if Qemu UI's buffer is fli=
pped onto a
> > hardware plane, then the compositor sends this event out after it gets =
a pageflip
> > completion. Therefore, the Guest would start its repaint cycle at Host =
vblank but
> > whether it would submit its frame in time would depend on the schedulin=
g policy --
> > of both Host and Guest compositors.
>=20
> Yeah this is all very tightly tied together, which is why I think we need
> something that looks at the entire picture. And not so much a quick chang=
e
> somewhere with badly defined semantics that happens to work in specific
> cases. Which I think is what we have here.
[Kasireddy, Vivek] I think it is time to discuss and come up with correct s=
emantics in order
to ensure that this solution works without being affected by the scheduling=
 policy of either
compositors. AFAICT, for this to work, the Guest compositor needs two signa=
ls/fences --
or events: one to tell it to start repaint cycle (vblank event) and the oth=
er to tell it to release
references on old FBs (flip done event) instead of just pageflip completion=
 event. And, we
might want to limit this to only virtual KMS drivers.

Thanks,
Vivek

> -Daniel
>=20
> >
> > Thanks,
> > Vivek
> >
> > > -Daniel
> > >
> > > >
> > > > Thanks,
> > > > Vivek
> > > >
> > > > > -Daniel
> > > > >
> > > > > > Thanks,
> > > > > > Vivek
> > > > > > >
> > > > > > > Cheers, Daniel
> > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > > --
> > > > > > > > Earthling Michel D=E4nzer               |               htt=
ps://redhat.com
> > > > > > > > Libre software enthusiast             |             Mesa an=
d X developer
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > --
> > > > > > > Daniel Vetter
> > > > > > > Software Engineer, Intel Corporation
> > > > > > > http://blog.ffwll.ch
> > > > >
> > > > > --
> > > > > Daniel Vetter
> > > > > Software Engineer, Intel Corporation
> > > > > http://blog.ffwll.ch
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
