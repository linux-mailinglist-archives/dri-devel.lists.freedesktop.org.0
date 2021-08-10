Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 627FE3E5501
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 10:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991F089ED3;
	Tue, 10 Aug 2021 08:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396F189E3F
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 08:21:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="202029626"
X-IronPort-AV: E=Sophos;i="5.84,309,1620716400"; d="scan'208";a="202029626"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 01:21:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,309,1620716400"; d="scan'208";a="671622695"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga006.fm.intel.com with ESMTP; 10 Aug 2021 01:21:11 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 10 Aug 2021 01:21:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 10 Aug 2021 01:21:10 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.010;
 Tue, 10 Aug 2021 01:21:09 -0700
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
Thread-Index: AQHXhFPnN1B4zkQxMkK/V9zRY5/TqKtbxyyAgABF0uCABEyGAIAAS7kwgAE7RYCAAd/fgP//+PQwgAGYgYCAAEZAwIAGJqyA///UVYA=
Date: Tue, 10 Aug 2021 08:21:09 +0000
Message-ID: <dfb19f81e9a04bfcadd1b010dfd67edc@intel.com>
References: <20210729081659.2255499-1-vivek.kasireddy@intel.com>
 <YQPTo0D5SZfX44dn@phenom.ffwll.local>
 <612fd31a51384cb28ac6da9db3e840ca@intel.com>
 <YQepZMFaCNLBNGx9@phenom.ffwll.local>
 <fa53f9db229e481784bfe3a61a195fd3@intel.com>
 <1b96e91f-d65c-a155-8c8c-8a4326733c4e@daenzer.net>
 <CAKMK7uH7gy7x-MrN7EWwwdsZKn-i5XB5Wie_ueRXXdnx5Yhefw@mail.gmail.com>
 <8722db11a6d245259c15ca2262a40d07@intel.com>
 <YQvUsYgKxPM/2KZm@phenom.ffwll.local>
 <47938a95ac0640cbb1b713ff1a48dd8d@intel.com>
 <YRE4jaQsOYNsLb+1@phenom.ffwll.local>
In-Reply-To: <YRE4jaQsOYNsLb+1@phenom.ffwll.local>
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

> On Fri, Aug 06, 2021 at 07:27:13AM +0000, Kasireddy, Vivek wrote:
> > Hi Daniel,
> >
> > > > > > >>> The solution:
> > > > > > >>> - To ensure full framerate, the Guest compositor has to sta=
rt it's repaint
> cycle
> > > > > (including
> > > > > > >>> the 9 ms wait) when the Host compositor sends the frame cal=
lback event to
> its
> > > > > clients.
> > > > > > >>> In order for this to happen, the dma-fence that the Guest K=
MS waits on --
> before
> > > > > sending
> > > > > > >>> pageflip completion -- cannot be tied to a wl_buffer.releas=
e event. This
> means
> > > that,
> > > > > the
> > > > > > >>> Guest compositor has to be forced to use a new buffer for i=
ts next repaint
> cycle
> > > > > when it
> > > > > > >>> gets a pageflip completion.
> > > > > > >>
> > > > > > >> Is that really the only solution?
> > > > > > > [Kasireddy, Vivek] There are a few others I mentioned here:
> > > > > > > https://gitlab.freedesktop.org/wayland/weston/-/issues/514#no=
te_986572
> > > > > > > But I think none of them are as compelling as this one.
> > > > > > >
> > > > > > >>
> > > > > > >> If we fix the event timestamps so that both guest and host u=
se the same
> > > > > > >> timestamp, but then the guest starts 5ms (or something like =
that) earlier,
> > > > > > >> then things should work too? I.e.
> > > > > > >> - host compositor starts at (previous_frametime + 9ms)
> > > > > > >> - guest compositor starts at (previous_frametime + 4ms)
> > > > > > >>
> > > > > > >> Ofc this only works if the frametimes we hand out to both ma=
tch _exactly_
> > > > > > >> and are as high-precision as the ones on the host side. Whic=
h for many gpu
> > > > > > >> drivers at least is the case, and all the ones you care abou=
t for sure :-)
> > > > > > >>
> > > > > > >> But if the frametimes the guest receives are the no_vblank f=
ake ones, then
> > > > > > >> they'll be all over the place and this carefully tuned low-l=
atency redraw
> > > > > > >> loop falls apart. Aside fromm the fact that without tuning t=
he guests to
> > > > > > >> be earlier than the hosts, you're guaranteed to miss every f=
rame (except
> > > > > > >> when the timing wobbliness in the guest is big enough by cha=
nce to make
> > > > > > >> the deadline on the oddball frame).
> > > > > > > [Kasireddy, Vivek] The Guest and Host use different event tim=
estamps as we
> don't
> > > > > > > share these between the Guest and the Host. It does not seem =
to be causing any
> > > other
> > > > > > > problems so far but we did try the experiment you mentioned (=
i.e., adjusting
> the
> > > > > delays)
> > > > > > > and it works. However, this patch series is meant to fix the =
issue without
> having to
> > > > > tweak
> > > > > > > anything (delays) because we can't do this for every composit=
or out there.
> > > > > >
> > > > > > Maybe there could be a mechanism which allows the compositor in=
 the guest to
> > > > > automatically adjust its repaint cycle as needed.
> > > > > >
> > > > > > This might even be possible without requiring changes in each c=
ompositor, by
> > > adjusting
> > > > > the vertical blank periods in the guest to be aligned with the ho=
st compositor
> repaint
> > > > > cycles. Not sure about that though.
> > > > > >
> > > > > > Even if not, both this series or making it possible to queue mu=
ltiple flips require
> > > > > corresponding changes in each compositor as well to have any effe=
ct.
> > > > >
> > > > > Yeah from all the discussions and tests done it sounds even with =
a
> > > > > deeper queue we have big coordination issues between the guest an=
d
> > > > > host compositor (like the example that the guest is now rendering=
 at
> > > > > 90fps instead of 60fps like the host).
> > > > [Kasireddy, Vivek] Oh, I think you are referring to my reply to Ger=
d. That 90 FPS vs
> > > > 60 FPS problem is a completely different issue that is associated w=
ith Qemu GTK UI
> > > > backend. With the GTK backend -- and also with SDL backend -- we Bl=
it the Guest
> > > > scanout FB onto one of the backbuffers managed by EGL.
> > > >
> > > > I am trying to add a new Qemu Wayland UI backend so that we can eli=
minate that
> Blit
> > > > and thereby have a truly zero-copy solution. And, this is there I a=
m running into the
> > > > halved frame-rate issue -- the current problem.
> > >
> > > Yes, that's what I referenced. But I disagree that it's a different
> > > problem. The underlying problem in both cases is that the guest and h=
ost
> > > compositor free-wheel instead of rendering in sync. It's just that
> > > depending upon how exactly the flip completion event on the gues side
> > > plays out you either get guest rendering that's faster than the host-=
side
> > > 60fps, or guest rendering that's much slower than the host-side 60fps=
.
> > [Kasireddy, Vivek] That used to be the case before we added a synchroni=
zation
> > mechanism to the GTK UI backend that uses a sync file. After adding thi=
s
> > and making the Guest wait until this sync file fd on the Host is signal=
ed, we
> > consistently get 60 FPS because the flip completion event for the Guest=
 is
> > directly tied to the signaling of the sync file in this particular case=
 (GTK UI).
> >
> > >
> > > The fundamental problem in both cases is that they don't run in locks=
tep.
> > > If you fix that, through fixing the timestamp and even reporting most
> > > likely, you should be able to fix both bugs.
> > [Kasireddy, Vivek] GTK UI is an EGL based solution that Blits the Guest=
 scanout
> > FB onto one of the backbuffers managed by EGL. Wayland UI is a zero-cop=
y
> > solution that just wraps the dmabuf associated with Guest scanout FB in=
 a
> > wl_buffer and submits it directly to the Host compositor. These backend=
s are
> > completely independent of each other and cannot be active at the same t=
ime.
> > In other words, we cannot have zero-copy and Blit based solutions runni=
ng
> > parallelly. And, this issue is only relevant for Wayland UI backend and=
 has
> > nothing to do with GTK UI.
> >
> > >
> > > > > Hence my gut feeling reaction that first we need to get these two
> > > > > compositors aligned in their timings, which propobably needs
> > > > > consistent vblank periods/timestamps across them (plus/minux
> > > > > guest/host clocksource fun ofc). Without this any of the next ste=
ps
> > > > > will simply not work because there's too much jitter by the time =
the
> > > > > guest compositor gets the flip completion events.
> > > > [Kasireddy, Vivek] Timings are not a problem and do not significant=
ly
> > > > affect the repaint cycles from what I have seen so far.
> > > >
> > > > >
> > > > > Once we have solid events I think we should look into statically
> > > > > tuning guest/host compositor deadlines (like you've suggested in =
a
> > > > > bunch of places) to consisently make that deadline and hit 60 fps=
.
> > > > > With that we can then look into tuning this automatically and wha=
t to
> > > > > do when e.g. switching between copying and zero-copy on the host =
side
> > > > > (which might be needed in some cases) and how to handle all that.
> > > > [Kasireddy, Vivek] As I confirm here:
> https://gitlab.freedesktop.org/wayland/weston/-
> > > /issues/514#note_984065
> > > > tweaking the deadlines works (i.e., we get 60 FPS) as we expect. Ho=
wever,
> > > > I feel that this zero-copy solution I am trying to create should be=
 independent
> > > > of compositors' deadlines, delays or other scheduling parameters.
> > >
> > > That's not how compositors work nowadays. Your problem is that you do=
n't
> > > have the guest/host compositor in sync. zero-copy only changes the ti=
ming,
> > > so it changes things from "rendering way too many frames" to "renderi=
ng
> > > way too few frames".
> > >
> > > We need to fix the timing/sync issue here first, not paper over it wi=
th
> > > hacks.
> > [Kasireddy, Vivek] What I really meant is that the zero-copy solution s=
hould be
> > independent of the scheduling policies to ensure that it works with all=
 compositors.
> >  IIUC, Weston for example uses the vblank/pageflip completion timestamp=
, the
> > configurable repaint-window value, refresh-rate, etc to determine when =
to start
> > its next repaint -- if there is any damage:
> > timespec_add_nsec(&output->next_repaint, stamp, refresh_nsec);
> > timespec_add_msec(&output->next_repaint, &output->next_repaint, -compos=
itor-
> >repaint_msec);
> >
> > And, in the case of VKMS, since there is no real hardware, the timestam=
p is always:
> > now =3D ktime_get();
> > send_vblank_event(dev, e, seq, now);
>=20
> vkms has been fixed since a while to fake high-precision timestamps like
> from a real display.
[Kasireddy, Vivek] IIUC, that might be one of the reasons why the Guest doe=
s not need=20
to have the same timestamp as that of the Host -- to work as expected.

>=20
> > When you say that the Guest/Host compositor need to stay in sync, are y=
ou
> > suggesting that we need to ensure that the vblank timestamp on the Host
> > needs to be shared and be the same on the Guest and a vblank/pageflip
> > completion for the Guest needs to be sent at exactly the same time it i=
s sent
> > on the Host? If yes, I'd say that we do send the pageflip completion to=
 Guest
> > around the same time a vblank is generated on the Host but it does not =
help
> > because the Guest compositor would only have 9 ms to submit a new frame
> > and if the Host is running Mutter, the Guest would only have 2 ms.
> > (https://gitlab.freedesktop.org/wayland/weston/-/issues/514#note_984341=
)
>=20
> Not at the same time, but the same timestamp. And yes there is some fun
> there, which is I think the fundamental issue. Or at least some of the
> compositor experts seem to think so, and it makes sense to me.
[Kasireddy, Vivek] It is definitely possible that if the timestamp is messe=
d up, then
the Guest repaint cycle would be affected. However, I do not believe that i=
s the case
here given the debug and instrumentation data we collected and scrutinized.=
 Hopefully,
compositor experts could chime in to shed some light on this matter.

>=20
> > >
> > > Only, and I really mean only, when that shows that it's simply imposs=
ible
> > > to hit 60fps with zero-copy and the guest/host fully aligned should w=
e
> > > look into making the overall pipeline deeper.
> > [Kasireddy, Vivek] From all the experiments conducted so far and given =
the
> > discussion associated with https://gitlab.freedesktop.org/wayland/westo=
n/-/issues/514
> > I think we have already established that in order for a zero-copy solut=
ion to work
> > reliably, the Guest compositor needs to start its repaint cycle when th=
e Host
> > compositor sends a frame callback event to its clients.
> >
> > >
> > > > > Only when that all shows that we just can't hit 60fps consistentl=
y and
> > > > > really need 3 buffers in flight should we look at deeper kms queu=
es.
> > > > > And then we really need to implement them properly and not with a
> > > > > mismatch between drm_event an out-fence signalling. These quick h=
acks
> > > > > are good for experiments, but there's a pile of other things we n=
eed
> > > > > to do first. At least that's how I understand the problem here ri=
ght
> > > > > now.
> > > > [Kasireddy, Vivek] Experiments done so far indicate that we can hit=
 59 FPS
> consistently
> > > > -- in a zero-copy way independent of compositors' delays/deadlines =
-- with this
> > > > patch series + the Weston MR I linked in the cover letter. The main=
 reason why this
> > > > works is because we relax the assumption that when the Guest compos=
itor gets a
> > > > pageflip completion event that it could reuse the old FB it submitt=
ed in the previous
> > > > atomic flip and instead force it to use a new one. And, we send the=
 pageflip
> completion
> > > > event to the Guest when the Host compositor sends a frame callback =
event. Lastly,
> > > > we use the (deferred) out_fence as just a mechanism to tell the Gue=
st compositor
> when
> > > > it can release references on old FBs so that they can be reused aga=
in.
> > > >
> > > > With that being said, the only question is how can we accomplish th=
e above in an
> > > upstream
> > > > acceptable way without regressing anything particularly on bare-met=
al. Its not clear
> if
> > > just
> > > > increasing the queue depth would work or not but I think the Guest =
compositor has to
> be
> > > told
> > > > when it can start its repaint cycle and when it can assume the old =
FB is no longer in
> use.
> > > > On bare-metal -- and also with VKMS as of today -- a pageflip compl=
etion indicates
> > > both.
> > > > In other words, Vblank event is the same as Flip done, which makes =
sense on bare-
> metal.
> > > > But if we were to have two events at-least for VKMS: vblank to indi=
cate to Guest to
> start
> > > > repaint and flip_done to indicate to drop references on old FBs, I =
think this problem
> can
> > > > be solved even without increasing the queue depth. Can this be acce=
ptable?
> > >
> > > That's just another flavour of your "increase queue depth without
> > > increasing the atomic queue depth" approach. I still think the underl=
ying
> > > fundamental issue is a timing confusion, and the fact that adjusting =
the
> > > timings fixes things too kinda proves that. So we need to fix that in=
 a
> > > clean way, not by shuffling things around semi-randomly until the spe=
cific
> > > config we tests works.
> > [Kasireddy, Vivek] This issue is not due to a timing or timestamp misma=
tch. We
> > have carefully instrumented both the Host and Guest compositors and mea=
sured
> > the latencies at each step. The relevant debug data only points to the =
scheduling
> > policy -- of both Host and Guest compositors -- playing a role in Guest=
 rendering
> > at 30 FPS.
>=20
> Hm but that essentially means that the events your passing around have an
> even more ad-hoc implementation specific meaning: Essentially it's the
> kick-off for the guest's repaint loop? That sounds even worse for a kms
> uapi extension.
[Kasireddy, Vivek] The pageflip completion event/vblank event indeed serves=
 as the
kick-off for a compositor's (both Guest and Host) repaint loop. AFAICT, Wes=
ton=20
works that way and even if we increase the queue depth to solve this proble=
m, I don't
think it'll help because the arrival of this event always indicates to a co=
mpositor to
start its repaint cycle again and assume that the previous buffers are all =
free.

>=20
> > > Iow I think we need a solution here which both slows down the 90fps t=
o
> > > 60fps for the blit case, and the 30fps speed up to 60fps for the zero=
copy
> > > case. Because the host might need to switch transparently between blt=
 and
> > > zerocopy for various reasons.
> > [Kasireddy, Vivek] As I mentioned above, the Host (Qemu) cannot switch =
UI
> > backends at runtime. In other words, with GTK UI backend, it is always =
Blit
> > whereas Wayland UI backend is always zero-copy.
>=20
> Hm ok, that at least makes things somewhat simpler. Another thing that I
> just realized: What happens when the host changes screen resolution and
> especially refresh rate?
[Kasireddy, Vivek] AFAICT, if the Host changes resolution or if the Qemu UI=
 window
is resized, then that'll trigger a Guest KMS modeset -- via drm_helper_hpd_=
irq_event().
As far as the refresh rate is concerned, if Qemu is launched with GTK UI ba=
ckend,
then the "render signal" GTK sends out to apps would reflect the new refres=
h rate.
And, since the internal dma-fence is tied to this "render signal", Guest up=
dates are
automatically synchronized to the new refresh rate.

If Qemu is launched with the Wayland UI backend, then the internal dma-fenc=
e would
be tied to the wl_buffer.release event. And, if Qemu UI's buffer is flipped=
 onto a
hardware plane, then the compositor sends this event out after it gets a pa=
geflip
completion. Therefore, the Guest would start its repaint cycle at Host vbla=
nk but=20
whether it would submit its frame in time would depend on the scheduling po=
licy --
of both Host and Guest compositors.

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
> > > > Thanks,
> > > > Vivek
> > > > >
> > > > > Cheers, Daniel
> > > > >
> > > > > >
> > > > > >
> > > > > > --
> > > > > > Earthling Michel D=E4nzer               |               https:/=
/redhat.com
> > > > > > Libre software enthusiast             |             Mesa and X =
developer
> > > > >
> > > > >
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
