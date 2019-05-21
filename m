Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2372487A
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 08:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475E4891A0;
	Tue, 21 May 2019 06:55:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5672891A0;
 Tue, 21 May 2019 06:55:18 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id y10so12190704lfl.3;
 Mon, 20 May 2019 23:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=DqyiY8wtLT0EcPhKsm1D6X9mrDlfr7Pcv8QbK0RtkQo=;
 b=WOUtv5wIHVCOeqQOvx5c/5GEyWdoYw1eyW2JAatB/MvDederEDZGnW9wWcZg2h5uYn
 3Pw1r2Ujj8c8V5lR4NF7IxNvYm69QD+cqzTscIEc1GTGtqkBFTrOuMJYFy6cKeGUO+HB
 ZOMUwUYBF7BxvogoXB9rE07yqvMNgikYX/N0erF21XQz20PVoZyzoADlL1K8+cLQNauF
 TNLh1muEbcmwh5zTb6hTcJrtTEC8RrGM168EuEiqgFdkeDNYB9kL8J59ZlCSA41Dt5mp
 Kn3qVqKHsV8QcM0+kCzCFtpqtNfdV8NvE3rhsqYnzch+OQ42GSMN1kh0uXEBCKSLAKrj
 iJ1A==
X-Gm-Message-State: APjAAAUYR3VSYkEitC08ZcYezUmvu5XrNCuve9tT3n+HdA0N3E11Whk+
 xlcsiU0NP/1/Qjj1kGRFFgw=
X-Google-Smtp-Source: APXvYqy1F7FJIU78wglWp3p+82mfvFIDdJGHwavAqU+pyhw3fqARRWeboAF8X/P0v1Sen0yr3wGTeA==
X-Received: by 2002:ac2:59c7:: with SMTP id x7mr1282058lfn.75.1558421717049;
 Mon, 20 May 2019 23:55:17 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id n8sm4485022lfe.15.2019.05.20.23.55.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 May 2019 23:55:16 -0700 (PDT)
Date: Tue, 21 May 2019 09:55:05 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v7 09/11] drm: uevent for connector status change
Message-ID: <20190521095505.7ef1cbdf@eldfell.localdomain>
In-Reply-To: <20190520161107.GA21222@phenom.ffwll.local>
References: <20190514110242.6f6ba4b0@eldfell.localdomain>
 <9b6386239ecae396fc4f5cc4467f8e76721f2c83.camel@intel.com>
 <CAKMK7uHJPugRWJx32oWVF94jBf28P0nBirZNbSBRMS1SbUaS9A@mail.gmail.com>
 <20190514163602.7d252b12@eldfell.localdomain>
 <CAKMK7uGMJMZiOP4rhhiu=Obu6sO0oav5se-vy8bNLu8dfoZmvA@mail.gmail.com>
 <20190515103731.16855195@eldfell.localdomain>
 <20190515082449.GA17751@phenom.ffwll.local>
 <20190516112211.1cd5a8c6@eldfell.localdomain>
 <20190516122455.GA3851@phenom.ffwll.local>
 <20190517130824.17372663@eldfell.localdomain>
 <20190520161107.GA21222@phenom.ffwll.local>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=DqyiY8wtLT0EcPhKsm1D6X9mrDlfr7Pcv8QbK0RtkQo=;
 b=kf6VuThoSyyPet0TW89H6BQHwFcXSP0HIsBk9EUb2R6dl/knTtfHq8w4ZTmYMoQ21J
 ZkmyYPOBDxOAfVV1zx+aVGMS/21/VWZgTUCaYI5vHvRZ2ErL1rbab3H1uVwNPQS/QdR/
 hJcL5ptDORQ0IQtgBiP1CaQeWYgvTTNonFho4tckee/gf2qb7rr/i8nrNi7mGXe3E/J9
 rYAA6SRrXz9YPVSzo4midVsOmiQHY/WVKjiBz47y4O0QsQ9uEfd5au32lz+DYcRo9pLZ
 jcOfQde5KHJdTFauQQworKaqlPqGWonQ7Gp8qLLbufmEJtTzd/orvCxdBWp0Og312pQs
 hk8Q==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "Ser, Simon" <simon.ser@intel.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Mun,
 Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
 "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, "sean@poorly.run" <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1126940957=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1126940957==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/lwH/F=R9sKzsOwGnaVjqIzL"; protocol="application/pgp-signature"

--Sig_/lwH/F=R9sKzsOwGnaVjqIzL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 20 May 2019 18:11:07 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Fri, May 17, 2019 at 01:08:24PM +0300, Pekka Paalanen wrote:
> > On Thu, 16 May 2019 14:24:55 +0200
> > Daniel Vetter <daniel@ffwll.ch> wrote:
> >  =20
> > > On Thu, May 16, 2019 at 11:22:11AM +0300, Pekka Paalanen wrote: =20
> > > > On Wed, 15 May 2019 10:24:49 +0200
> > > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >    =20
> > > > > On Wed, May 15, 2019 at 10:37:31AM +0300, Pekka Paalanen wrote:  =
 =20
> > > > > > On Tue, 14 May 2019 16:34:01 +0200
> > > > > > Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > > > >      =20
> > > > > > > On Tue, May 14, 2019 at 3:36 PM Pekka Paalanen <ppaalanen@gma=
il.com> wrote:     =20
> > > > > > > >
> > > > > > > > On Tue, 14 May 2019 13:02:09 +0200
> > > > > > > > Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > > > > > >       =20
> > > > > > > > > On Tue, May 14, 2019 at 10:18 AM Ser, Simon <simon.ser@in=
tel.com> wrote:       =20
> > > > > > > > > >
> > > > > > > > > > On Tue, 2019-05-14 at 11:02 +0300, Pekka Paalanen wrote=
:       =20
> > > > > >=20
> > > > > > ...
> > > > > >      =20
> > > > > > > > > > > Hi Daniel,
> > > > > > > > > > >
> > > > > > > > > > > just to clarify the first case, specific to one very =
particular
> > > > > > > > > > > property:
> > > > > > > > > > >
> > > > > > > > > > > With HDCP, there is a property that may change dynami=
cally at runtime
> > > > > > > > > > > (the undesired/desired/enabled tristate). Userspace m=
ust be notified
> > > > > > > > > > > when it changes, I do not want userspace have to poll=
 that property
> > > > > > > > > > > with a timer.
> > > > > > > > > > >
> > > > > > > > > > > When that property alone changes, and userspace is pr=
epared to handle
> > > > > > > > > > > that property changing alone, it must not trigger a r=
eprobe of the
> > > > > > > > > > > connector. There is no reason to reprobe at that poin=
t AFAIU.
> > > > > > > > > > >
> > > > > > > > > > > How do you ensure that userspace can avoid triggering=
 a reprobe with the
> > > > > > > > > > > epoch approach or with any alternate uevent design?
> > > > > > > > > > >
> > > > > > > > > > > We need an event to userspace that indicates that re-=
reading the
> > > > > > > > > > > properties is enough and reprobe of the connector is =
not necessary.
> > > > > > > > > > > This is complementary to indicating to userspace that=
 only some
> > > > > > > > > > > connectors need to be reprobed instead of everything.=
       =20
> > > > > > > > > >
> > > > > > > > > > Can't you use the PROPERTY hint? If PROPERTY is the HDC=
P one, skip the
> > > > > > > > > > reprobing. Would that work?       =20
> > > > > > > >
> > > > > > > > Hi,
> > > > > > > >
> > > > > > > > yes, that would work, if it was acceptable to DRM upstream.=
 The replies
> > > > > > > > to Paul seemed to be going south so fast that I thought we =
wouldn't get
> > > > > > > > any new uevent fields in favour of "epoch counters".
> > > > > > > >       =20
> > > > > > > > > Yes that's the idea, depending upon which property you ge=
t you know
> > > > > > > > > it's a sink change (needs full reprobe) or something else=
 like hdcp
> > > > > > > > > state machinery update.       =20
> > > > > > > >
> > > > > > > > Right.
> > > > > > > >       =20
> > > > > > > > > Wrt avoiding the full reprobe for sink changes: I think w=
e should
> > > > > > > > > indeed decouple that from the per-connector event for sin=
k changes.
> > > > > > > > > That along is a good win already, since you know for whic=
h connector
> > > > > > > > > you need to call drmGetConnector (which forces the reprob=
e). It would
> > > > > > > > > be nice to only call drmGetConnectorCurrent (avoids the r=
eprobe), but
> > > > > > > > > historically speaking every time we tried to rely on this=
 we ended up
> > > > > > > > > regretting things.       =20
> > > > > > > >
> > > > > > > > What changed? This sounds very much what Paul suggested. Lo=
oking at it
> > > > > > > > from userspace side:       =20
> > > > > > >=20
> > > > > > > This sounds solid, some refinements below:
> > > > > > >      =20
> > > > > > > > HOTPLUG=3D1 CONNECTOR=3Dxx PROPERTY=3Dyy
> > > > > > > >
> > > > > > > > - If yy is "Content Protection", no need to drmModeGetConne=
ctor(), just
> > > > > > > >   re-get the connector properties.
> > > > > > > >
> > > > > > > > - Kernel probably shouldn't bother sending this for propert=
ies where
> > > > > > > >   re-probe could be necessary, and send the below instead. =
      =20
> > > > > > >=20
> > > > > > >=20
> > > > > > > I think we should assert that the kernel can get the new prop=
erty
> > > > > > > values using drmModeGetConnectorCurrent for this case, i.e. t=
he kernel
> > > > > > > does not expect a full reprobe. I.e. upgrade your idea from "=
should"
> > > > > > > to "must"     =20
> > > > > >=20
> > > > > > Hi Daniel,
> > > > > >=20
> > > > > > ok, that's good.
> > > > > >      =20
> > > > > > > Furthermore different property can indicate different kind of=
 updates,
> > > > > > > e.g. hdcp vs general sink change vs. whatever else might come=
 in the
> > > > > > > future.     =20
> > > > > >=20
> > > > > > What do you mean by different kinds of updates?     =20
> > > > >=20
> > > > > Atm we're discussing two:
> > > > >=20
> > > > > - "Content Protection"
> > > > > - "sink changed, but you don't need to reprobe" this would be qui=
te a bit
> > > > >   a catch all from the output detection. Paul thinks differently,=
 but I'm
> > > > >   not sold on splitting this up more, at least not right now. Thi=
s would
> > > > >   include connector status (and related things returned by drmGet=
Connector
> > > > >   which currently aren't a property), EDID, the mst path id, that=
 kind of
> > > > >   stuff.
> > > > >=20
> > > > > Ime once we have 2, there's more bound to come :-)   =20
> > > >=20
> > > > Hi Daniel,
> > > >=20
> > > > I don't understand what the "sink changed" thing could be, but sure,
> > > > there can be more.   =20
> > >=20
> > > So if you have a repeater (hdmi or dp) and you change the thing you p=
lug
> > > into that, then on the computer you don't get a full hotplug, because=
 the
> > > repeater was always connected. Instead you get a short pulse hotplug,
> > > indicating that something with the sink has changed. This could be a
> > > slightly adjusted EDID (e.g. different eld in the audio section), or
> > > something else. That's what I mean with "sink changed". Similar thing=
 can
> > > happen if you unplug and then plug in something else real quick (usua=
lly
> > > over suspend/resume), where connector->status stays the same, but the
> > > actual thing plugged in is different. I think for hdmi this is just t=
he
> > > EDID, but we do parse a bunch of things out of the EDID that have fur=
ther
> > > effects (color space, max clock). With DP there's also dp aux stuff, =
e.g.
> > > if you switch from a 2 lane to a 4 lane cable then with same screen m=
ore
> > > modes can work.
> > >=20
> > > Clearer?
> > >=20
> > > I guess for the documentation for this new uapi we need to make an
> > > exhaustive list of all the things that might have changed for a "sink
> > > changed" event, whatever we actually agree on what that should look l=
ike.
> > > Or the PROPERTY=3D0 fallback you mention below as a fallback idea. =20
> >=20
> > Hi Daniel,
> >=20
> > to me all that sounds like userspace would better do a probe and start
> > from scratch with that one connector. Therefore it would fall into the
> > 'HOTPLUG=3D1 CONNECTOR=3Dxx' case, no PROPERTY.
> >=20
> > I suppose I'm missing something? =20
>=20
> Doing a full probe is hella expensive. Atm you always have to do this, but
> we're talking about the brave new future where the kernel sucks less, and
> the kernel would have done the expensive probing for you already.
>=20
> > But also I don't mind, I have always expected there might be more
> > properties whose change does not require a probe.
> >=20
> > So, the kernel does sometimes do the probe on its own as well, right?
> > Is that completely invisible to userspace, or could it stall some
> > userspace operations that are not a probe of the same connector? =20
>=20
> Major stall because the locking design isn't pretty. If the kernel is
> probing right now even your GetConnectorCurrent or GetProperties (on a
> connector) will stall for whatever long it takes to read the EDID. Or
> whatever else the kernel is doing in the probe paths right now. We could
> probably improve this, and make sure that at least GetConnectorCurrent and
> GetProperties stop sucking. But needs some serious locking-fu to make that
> work.

Hi Daniel,

ok. I was assuming the kernel locking was unfixable, due to e.g.
hardware interfaces that are, well, hardware.

It seems the locking would be the first thing needing to be fixed
before anyone goes adding more automatic probing into the kernel,
because otherwise you risk introducing random timing hickups for
userspace, leading to someone screaming "kernel regression".

> Aside: Just realized this is another important reason why we need to batch
> up property updates. If we don't, then userspace will simply get held up
> until the kernel is done anyway.
>=20
> > I really think the design of the uAPI must start with how userspace is
> > expected to react to the events. For that there are three cases:
> > re-deiscover and probe everyting, re-probe one connector, re-read
> > properties of one connector without probe. Userspace can then discover
> > what exactly changed, just like it already does. =20
>=20
> Yup, I think on this we all agree.
>=20

...

> > > > > > > > --------
> > > > > > > >
> > > > > > > > When discussing this in IRC, I had the concern about how ue=
vents are
> > > > > > > > delivered in userspace. Is there a possibility that they mi=
ght be
> > > > > > > > overwritten, contain stale attributes, or get squashed toge=
ther?
> > > > > > > >
> > > > > > > > Particularly if a display server is current on the VT and a=
ctive and
> > > > > > > > monitoring udev, but stuck doing something and cannot servi=
ce uevents
> > > > > > > > very fast, and the kernel sends more than one event before =
the process
> > > > > > > > gets back to dispatching. The terminology in libudev API co=
nfused me as
> > > > > > > > an event is a device. Squashing together would make sense i=
f the
> > > > > > > > uevent were just updating a device attribute list. Previous=
ly when we
> > > > > > > > had just a single kind of uevent, that would not have made a
> > > > > > > > difference, but if we gain different kinds of uevents like =
here, it
> > > > > > > > starts to matter.
> > > > > > > >
> > > > > > > > However, Paul came to the conclusion that we will be ok as =
long as the
> > > > > > > > events come via netlink.       =20
> > > > > > >=20
> > > > > > > Yeah netlink shouldn't drop events on the floor I think. It m=
ight
> > > > > > > still happen, but then I think you should get an indication o=
f that
> > > > > > > error, and you just treat it as a general hotplug event like =
on older
> > > > > > > kernels.     =20
> > > > > >=20
> > > > > > Alright, although reading Paul it sounds like there is another
> > > > > > (fallback?) method as well that wouldn't work. Should userspace=
 worry
> > > > > > about that?
> > > > > >=20
> > > > > > Hmm, get an indication of an error... I don't know how that wou=
ld be
> > > > > > presented in libudev API and I can't point to any code in Westo=
n that
> > > > > > would deal with it. Does anyone have a clue about that?
> > > > > >=20
> > > > > > Userspace cannot really start taking advantage of any new fine-=
grained
> > > > > > hotplug events until it can rely on the event delivery. Granted=
, this
> > > > > > seems purely a userspace issue, but I bet it could be formulate=
d as a
> > > > > > kernel regression: things stop working after upgrading the kern=
el while
> > > > > > having always used new userspace which was ready for detailed h=
otplug
> > > > > > events but didn't ensure the delivery in userspace.     =20
> > > > >=20
> > > > > You have this already (if it's really an issue with netlink relia=
bility,
> > > > > tbh no idea), you can already miss a global uevent. It's easier t=
o catch
> > > > > up if you do miss it, since you're forcing a reprobe on everythin=
g. That's
> > > > > why I think the EPOCH thing would be good, userspace could be def=
ensive
> > > > > and always call GetConnectorCurrent on all connectors if it gets =
any
> > > > > hotplug uevent, and if it gets an EPOCH change, force a reprobe. =
But I'm
> > > > > not sure that's really required (aside from VT switching).   =20
> > > >=20
> > > > No, my concern is not an issue with netlink reliability. It is a
> > > > potential issue when userspace chooses to not use netlink, and uses
> > > > something else instead. I'm not sure what that else is but Paul says
> > > > there is code in libudev and that is completely outside the control=
 of
> > > > KMS apps like display servers.   =20
> > >=20
> > > afaik this other path only exists because it's the older one, for uapi
> > > backwards compatibility with older userspace. Shouldn't be used for
> > > anything. =20
> >=20
> > "Shouldn't be used" and someone screaming "kernel regression"... are you
> > sure that path won't matter?
> >=20
> > Like some home-brewn distribution that happens to configure their
> > libudev and kernel to use the old method, uses already new userspace,
> > and then upgrades the kernel that starts sending fine-grained hotplug
> > events, resulting the display server randomly handling hotplug wrong.
> >=20
> > Reading Airlie's recent rant about kernel regression handling make this
> > a scary scenario where you would have no other choice than to rip all
> > the fine-grained uevents out again.
> >=20
> > Is there any difference in the kernel code between the old method and
> > the netlink method? Would it be possible to send fine-grained hotplug
> > events only through netlink, and fall back to the old 'HOTPLUG=3D1' for
> > the old method? =20
>=20
> There's a lot of grey in kernel regressions, and for fringe setups used by
> few people I wouldn't worry about this. If they expect their shit to keep
> working when using new stuff and crappy old interfaces, they get to keep
> all the pieces.

It didn't sound gray at all, reading Dave Airlie's email about it. If
someone updates the kernel, and something works worse after that, then
it is by definition a kernel regression. Period. And the earliest
regression wins, i.e. if a revert breaks other things, the revert will
be done regardless.

> Dave's recent rant was a bit special, since userspace is clearly smoking
> some strong stuff (-modesetting's atomic is seriously not using atomic
> correctly), but it was also affecting too many people, and changing the
> boot setup meant you'd get a black screen on boot-up already. Instead of
> just on the first modeset with more than 1 screen.

Then I think I missed the context of Dave's email. Reading it again, I
still do not see that context.

Btw. how do you determine "not using atomic correctly"? Has some uAPI
specification for atomic appeared? I wasn't aware there was any uAPI
specs, so there is no "incorrect use" if it happened to work once.

I don't personally really like these rules, but if these are the rules,
then so be it. In my opinion it would be a huge step forward to get and
require uAPI specifications, that people could verify both kernel and
userspace against. Verifying against kernel code with no spec is what
leads to the -modesetting issue by the sounds of it.

Documenting kernel internal interfaces is not it. People reading
DRM internal interface docs would need to know how DRM works internally
before they could map that information into uAPI, which makes it less
useful if not even useless for userspace developers.

> There's also a fairly easy fix for that -modesetting issue: We don't
> expose atomic if the compositor has a process name of "Xserver". Brutal,
> but gets the job done. Once X is fixed, we can give a new "I'm not totally
> broken anymore" interface to get back at atomic.

You mean "Xorg". Or maybe "X". Or maybe the setuid helper? Wait, do you
check against the process issuing ioctl by ioctl, or the process that
opened the device? Which would be logind? What about DRM leasing? ...

> tldr; I'm not worried at all, at least not more than with anything uapi.
> Very rarely we'll have regrets.

If you say so, ok. I'm a pessimist. I will certainly be happy if people
can make progress with fine-grained uevents.


Thanks,
pq

--Sig_/lwH/F=R9sKzsOwGnaVjqIzL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAlzjoMkACgkQI1/ltBGq
qqd3Yg//VVC9OfxyYbi6SSshaJPnoM5za9yKD0HZZ3Ysm/K2PT3UUtt0wI6PS35K
seENH5DUTL84RlVWtBJ9ulI8cujM1goXjy3t9w3rUw8CoQrD91tCGu+xqHbCKSEg
L2VA9G9+fd3TAJsYkrYw+GVbUSm+l/5zAHAUd6LtLvx1fkzZxZmSLYfcq9FvplQJ
d3y9XWy8sQb378Q9xMqU+pgboj9O+C0rpF7R0wubdOKCrbsSWmGCAy3HbEit98sl
p3DSArDC4zpD3ghXMsmuZ8wPweoyJ8Kj2fJSceoYH5QGDYlhjAt+QZaoAaRnJMCp
28PM3kfNqZeD9ezqP/NP9HNcRPZYuWC5H+hIId5eKtI9awup3eqomNvDGuMBYX47
zGQUfwcPnm8lNqXsU+Wq+qhxw75yXU4cX2rLqdExHlypwDn4jd28X1UzhUkUeG7X
NTcG6y51w6RxAZzhaIMiKGipqa7QusVApwONfXfNATLtpLocygY/8ncPcMm9DEg1
DXd6lTXjh9DMyCZB0Tx22lp4ZXgmn5YIwqFb+1RBE9EJ3dqTbooritpOKlrV/V6P
U2PI2jnXCyO1DTJo8kWNENqqML4Fn/ApdxQi7v2QmTFQyD4YGLylpSbwgenmH5Yp
PXylyeDvG+scODh4Ak0dxoDLaP1/rDoaPSrVwm+zMgZq7bUfKPo=
=D7Kp
-----END PGP SIGNATURE-----

--Sig_/lwH/F=R9sKzsOwGnaVjqIzL--

--===============1126940957==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1126940957==--
