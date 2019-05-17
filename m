Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 597EA216BB
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 12:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B29B8987A;
	Fri, 17 May 2019 10:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24F789872;
 Fri, 17 May 2019 10:08:37 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id y10so4934640lfl.3;
 Fri, 17 May 2019 03:08:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=B+vrL7fqXEK4GuyBjgddV/Ub9wjLQJ4YBaul0Bw9O5Q=;
 b=hBO13K+ZxLG1Kt17Y62k993f2rTdomEYUG8u1MnyewTS2vBeGBw2s8YpuuqHtKWmZI
 zoWzUGmYzQjszQTPPfFn7wM47WWbESKuLR4emK83MnvJj+Tbf0gwrRicTcugiVkAdN+2
 U2rG6jSBmWeUOHxyF3geJSuKB0uDS5obxgIKj0/hiS2qJLdL2GjpkwnWfS540szr58xe
 5bif9PVAhVZ5Cwoz0AGEL5CI3iUFNW7c3g3/Uu2P0dNt20LIqU3WyNst8E4Pp1S3YJME
 Q7X7t24ffAhn8OcjzZrdpihBcSGUA3k7muzM42TSly7WMKWA5aL1a5m4I8bpJynZ9R46
 am+A==
X-Gm-Message-State: APjAAAUfxuEH7IihonUtModoNtnJkEsSuv596/OYrHEi0CaecZ92+oyS
 ortdR4yt5nRPjb2+kX5j2hcFiW2C
X-Google-Smtp-Source: APXvYqwHQl1R2VWCE4H/+DJtIl1MrCRpxMWkWCp7TxgfldwHzcipaAiJ/HQe9TZB+5QUwVumj/wzGA==
X-Received: by 2002:a19:a5ca:: with SMTP id o193mr2418611lfe.89.1558087715986; 
 Fri, 17 May 2019 03:08:35 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id p16sm845034lfp.2.2019.05.17.03.08.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 May 2019 03:08:35 -0700 (PDT)
Date: Fri, 17 May 2019 13:08:24 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v7 09/11] drm: uevent for connector status change
Message-ID: <20190517130824.17372663@eldfell.localdomain>
In-Reply-To: <20190516122455.GA3851@phenom.ffwll.local>
References: <8aa3980a6948b9b2b989c237f8453ca54e72ad95.camel@bootlin.com>
 <CAKMK7uFaEPm+kqYdc=vkb_iRRXDf=P6D98VTMMKtCMQHCixhLg@mail.gmail.com>
 <20190514110242.6f6ba4b0@eldfell.localdomain>
 <9b6386239ecae396fc4f5cc4467f8e76721f2c83.camel@intel.com>
 <CAKMK7uHJPugRWJx32oWVF94jBf28P0nBirZNbSBRMS1SbUaS9A@mail.gmail.com>
 <20190514163602.7d252b12@eldfell.localdomain>
 <CAKMK7uGMJMZiOP4rhhiu=Obu6sO0oav5se-vy8bNLu8dfoZmvA@mail.gmail.com>
 <20190515103731.16855195@eldfell.localdomain>
 <20190515082449.GA17751@phenom.ffwll.local>
 <20190516112211.1cd5a8c6@eldfell.localdomain>
 <20190516122455.GA3851@phenom.ffwll.local>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=B+vrL7fqXEK4GuyBjgddV/Ub9wjLQJ4YBaul0Bw9O5Q=;
 b=fXHpERkutGO+rhPmK26nIwjmFY32H8C9UPXZfhueHVA+OoaB7yv1/IhQEzGbKEP4YU
 SxgJYBqHz6fZ690cjSNuzog411Unun8+FEoEDkyu5yk/bLxfk41iXHm/dXtUfbLL2kgj
 8QrAkS1mJ48d33hMEqZgpvV6eCp7rz8ZOAYJX8mINYoRumg4BNUgTIryAeXWaIJKyBJK
 XWDrtoARKPaQJX9iQxOV6VHtwRwysvtDWSf152ux5hvh1KjHqFv8JTlOoxhHBjnxBxnw
 R8tQgFMSf9/+WBx+lW+xCOz53P+w5zWDc81wMHNT5h+VYhhL2/mesoGVeXEM3KYOwQFb
 Y2gw==
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
Content-Type: multipart/mixed; boundary="===============1129988730=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1129988730==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/LPgghaT/yhC2U/1P=C84I_K"; protocol="application/pgp-signature"

--Sig_/LPgghaT/yhC2U/1P=C84I_K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 16 May 2019 14:24:55 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Thu, May 16, 2019 at 11:22:11AM +0300, Pekka Paalanen wrote:
> > On Wed, 15 May 2019 10:24:49 +0200
> > Daniel Vetter <daniel@ffwll.ch> wrote:
> >  =20
> > > On Wed, May 15, 2019 at 10:37:31AM +0300, Pekka Paalanen wrote: =20
> > > > On Tue, 14 May 2019 16:34:01 +0200
> > > > Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > >    =20
> > > > > On Tue, May 14, 2019 at 3:36 PM Pekka Paalanen <ppaalanen@gmail.c=
om> wrote:   =20
> > > > > >
> > > > > > On Tue, 14 May 2019 13:02:09 +0200
> > > > > > Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > > > >     =20
> > > > > > > On Tue, May 14, 2019 at 10:18 AM Ser, Simon <simon.ser@intel.=
com> wrote:     =20
> > > > > > > >
> > > > > > > > On Tue, 2019-05-14 at 11:02 +0300, Pekka Paalanen wrote:   =
  =20
> > > >=20
> > > > ...
> > > >    =20
> > > > > > > > > Hi Daniel,
> > > > > > > > >
> > > > > > > > > just to clarify the first case, specific to one very part=
icular
> > > > > > > > > property:
> > > > > > > > >
> > > > > > > > > With HDCP, there is a property that may change dynamicall=
y at runtime
> > > > > > > > > (the undesired/desired/enabled tristate). Userspace must =
be notified
> > > > > > > > > when it changes, I do not want userspace have to poll tha=
t property
> > > > > > > > > with a timer.
> > > > > > > > >
> > > > > > > > > When that property alone changes, and userspace is prepar=
ed to handle
> > > > > > > > > that property changing alone, it must not trigger a repro=
be of the
> > > > > > > > > connector. There is no reason to reprobe at that point AF=
AIU.
> > > > > > > > >
> > > > > > > > > How do you ensure that userspace can avoid triggering a r=
eprobe with the
> > > > > > > > > epoch approach or with any alternate uevent design?
> > > > > > > > >
> > > > > > > > > We need an event to userspace that indicates that re-read=
ing the
> > > > > > > > > properties is enough and reprobe of the connector is not =
necessary.
> > > > > > > > > This is complementary to indicating to userspace that onl=
y some
> > > > > > > > > connectors need to be reprobed instead of everything.    =
 =20
> > > > > > > >
> > > > > > > > Can't you use the PROPERTY hint? If PROPERTY is the HDCP on=
e, skip the
> > > > > > > > reprobing. Would that work?     =20
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > yes, that would work, if it was acceptable to DRM upstream. The=
 replies
> > > > > > to Paul seemed to be going south so fast that I thought we woul=
dn't get
> > > > > > any new uevent fields in favour of "epoch counters".
> > > > > >     =20
> > > > > > > Yes that's the idea, depending upon which property you get yo=
u know
> > > > > > > it's a sink change (needs full reprobe) or something else lik=
e hdcp
> > > > > > > state machinery update.     =20
> > > > > >
> > > > > > Right.
> > > > > >     =20
> > > > > > > Wrt avoiding the full reprobe for sink changes: I think we sh=
ould
> > > > > > > indeed decouple that from the per-connector event for sink ch=
anges.
> > > > > > > That along is a good win already, since you know for which co=
nnector
> > > > > > > you need to call drmGetConnector (which forces the reprobe). =
It would
> > > > > > > be nice to only call drmGetConnectorCurrent (avoids the repro=
be), but
> > > > > > > historically speaking every time we tried to rely on this we =
ended up
> > > > > > > regretting things.     =20
> > > > > >
> > > > > > What changed? This sounds very much what Paul suggested. Lookin=
g at it
> > > > > > from userspace side:     =20
> > > > >=20
> > > > > This sounds solid, some refinements below:
> > > > >    =20
> > > > > > HOTPLUG=3D1 CONNECTOR=3Dxx PROPERTY=3Dyy
> > > > > >
> > > > > > - If yy is "Content Protection", no need to drmModeGetConnector=
(), just
> > > > > >   re-get the connector properties.
> > > > > >
> > > > > > - Kernel probably shouldn't bother sending this for properties =
where
> > > > > >   re-probe could be necessary, and send the below instead.     =
=20
> > > > >=20
> > > > >=20
> > > > > I think we should assert that the kernel can get the new property
> > > > > values using drmModeGetConnectorCurrent for this case, i.e. the k=
ernel
> > > > > does not expect a full reprobe. I.e. upgrade your idea from "shou=
ld"
> > > > > to "must"   =20
> > > >=20
> > > > Hi Daniel,
> > > >=20
> > > > ok, that's good.
> > > >    =20
> > > > > Furthermore different property can indicate different kind of upd=
ates,
> > > > > e.g. hdcp vs general sink change vs. whatever else might come in =
the
> > > > > future.   =20
> > > >=20
> > > > What do you mean by different kinds of updates?   =20
> > >=20
> > > Atm we're discussing two:
> > >=20
> > > - "Content Protection"
> > > - "sink changed, but you don't need to reprobe" this would be quite a=
 bit
> > >   a catch all from the output detection. Paul thinks differently, but=
 I'm
> > >   not sold on splitting this up more, at least not right now. This wo=
uld
> > >   include connector status (and related things returned by drmGetConn=
ector
> > >   which currently aren't a property), EDID, the mst path id, that kin=
d of
> > >   stuff.
> > >=20
> > > Ime once we have 2, there's more bound to come :-) =20
> >=20
> > Hi Daniel,
> >=20
> > I don't understand what the "sink changed" thing could be, but sure,
> > there can be more. =20
>=20
> So if you have a repeater (hdmi or dp) and you change the thing you plug
> into that, then on the computer you don't get a full hotplug, because the
> repeater was always connected. Instead you get a short pulse hotplug,
> indicating that something with the sink has changed. This could be a
> slightly adjusted EDID (e.g. different eld in the audio section), or
> something else. That's what I mean with "sink changed". Similar thing can
> happen if you unplug and then plug in something else real quick (usually
> over suspend/resume), where connector->status stays the same, but the
> actual thing plugged in is different. I think for hdmi this is just the
> EDID, but we do parse a bunch of things out of the EDID that have further
> effects (color space, max clock). With DP there's also dp aux stuff, e.g.
> if you switch from a 2 lane to a 4 lane cable then with same screen more
> modes can work.
>=20
> Clearer?
>=20
> I guess for the documentation for this new uapi we need to make an
> exhaustive list of all the things that might have changed for a "sink
> changed" event, whatever we actually agree on what that should look like.
> Or the PROPERTY=3D0 fallback you mention below as a fallback idea.

Hi Daniel,

to me all that sounds like userspace would better do a probe and start
from scratch with that one connector. Therefore it would fall into the
'HOTPLUG=3D1 CONNECTOR=3Dxx' case, no PROPERTY.

I suppose I'm missing something?

But also I don't mind, I have always expected there might be more
properties whose change does not require a probe.

So, the kernel does sometimes do the probe on its own as well, right?
Is that completely invisible to userspace, or could it stall some
userspace operations that are not a probe of the same connector?

I really think the design of the uAPI must start with how userspace is
expected to react to the events. For that there are three cases:
re-deiscover and probe everyting, re-probe one connector, re-read
properties of one connector without probe. Userspace can then discover
what exactly changed, just like it already does.

> > > > Btw. I started thinking, maybe we should completely leave out the "=
If
> > > > yy is "Content Protection"" and require the kernel to guarantee, th=
at
> > > > if PROPERTY is set, then drmModeGetConnector() (probing) must not be
> > > > necessary based on this event alone.
> > > >=20
> > > > Writing it down again:
> > > >=20
> > > > HOTPLUG=3D1 CONNECTOR=3Dxx PROPERTY=3Dyy
> > > >=20
> > > > - yy denotes which connector xx property changed.   =20
> > >=20
> > > Maybe yy denotes which group of properties changed, and part of the u=
api
> > > is picking the canonical one. E.g. content protection might also gain=
 more
> > > properties in the future (there's patches, but the userspace won't be=
 open
> > > sourced). And for that case I don't think we should then send an even=
 for
> > > every single individual property, but just for the lead property.
> > >=20
> > > Maybe we should change it to UPDATE_TYPE=3D<some-unique-string>, but =
it felt
> > > better to use the property id we already have for this. =20
> >=20
> > Indeed, it is not really necessary to identify the exact property.
> >=20
> > We could even just use PROPERTY=3D0 to indicate "something may have
> > changed, you should re-get the properties, but no need to probe I
> > promise".
> >=20
> > Or like you said, whatever. I don't really care as long as the
> > semantics are the same.
> >  =20
> > > > - Userspace does not need to do drmModeGetConnector(), it only need=
s to
> > > >   drmModeObjectGetProperties() on the connector to receive the new
> > > >   updated property values.   =20
> > >=20
> > > drmModeGetConnector(Current) also supplies all the properties already.
> > > This is special with connectors, since the predate the "properties on
> > > everything" design. I'd just mention this function here, and ignore
> > > drmModeObjectGetProperties. =20
> >=20
> > To avoid confusion, it would be best to mention all three functions
> > then. It is very easy to forget about legacy uAPI like properties
> > through GetConnector.
> >  =20
> > > > - Kernel must not send this event for changes that may require prob=
ing
> > > >   for correct results, exceptional conditions (buggy hardware, etc.)
> > > >   included. Instead, the kernel must send one of the below events.
> > > >=20
> > > > Is there actually anything interesting that
> > > > drmModeGetConnectorCurrent() could guaranteed correctly return that=
 is
> > > > not a property already? I'd probably leave this consideration out
> > > > completely, and just say do one of the needs-probing events if anyt=
hing
> > > > there changed.   =20
> > >=20
> > > That's why I'm suggesting the PROPERTY=3D<epoch_prop_id> would indica=
te all
> > > sink related stuff, including the not-properperty-fied stuff is updat=
ed,
> > > and will be reported correctly by GetConnectorCurrent. =20
> >=20
> > Just because GetConnectorCurrent returns the same properties as
> > drmModeObjectGetProperties? Ok then. Personally I'm quite firmly in the
> > land where drmModeObjectGetProperties exists, so don't really care
> > about the legacy stuff. =20
>=20
> So from a quick skimming GetConnectorCurrent =3D=3D GetProperties, except=
 you
> don't get the non-propertified stuff like mode list, ->status, and a few
> other things we parse out from various sources. So for connectors you need
> to use GetConnector/Current anyway I think, if you rely on GetProperties
> only, you're missing stuff.

That was part of my question: the stuff I would be missing, does it
matter?

Most of the stuff I would be missing are things that require a probe to
be up-to-date, which means I will not be missing them, because I will
be calling drmModeGetConnector instead (and not GetConnectorCurrent),
because the kernel driver sent an uevent to tell me to do exactly that.

Is there anything in the set of connector parameters which a) do not
require a probe to be up-to-date, and b) are not actual properties too?

If there are, we have two options: complicate userspace to use a third
function to get some bits (drmModeGetConnectorCurrent), or make the
kernel driver just send the uevent that makes userspace probe anyway.

> Agreed that we need to spell this all out.
>=20
> > > > > > HOTPLUG=3D1 CONNECTOR=3Dxx
> > > > > >
> > > > > > - Needs to drmModeGetConnector() on the one connector, no need =
to probe
> > > > > >   others. Implies that one needs to re-get the connector proper=
ties as
> > > > > >   well.     =20
> > > > >=20
> > > > > Sounds good.
> > > > >    =20
> > > > > > HOTPLUG=3D1
> > > > > >
> > > > > > - Need to do drmM odeGetResouces() to discover new/disappeared
> > > > > >   connectors, and need to drmModeGetConnector to re-probe every
> > > > > >   connector. (As always.)     =20

...

> > > > > > --------
> > > > > >
> > > > > > When discussing this in IRC, I had the concern about how uevent=
s are
> > > > > > delivered in userspace. Is there a possibility that they might =
be
> > > > > > overwritten, contain stale attributes, or get squashed together?
> > > > > >
> > > > > > Particularly if a display server is current on the VT and activ=
e and
> > > > > > monitoring udev, but stuck doing something and cannot service u=
events
> > > > > > very fast, and the kernel sends more than one event before the =
process
> > > > > > gets back to dispatching. The terminology in libudev API confus=
ed me as
> > > > > > an event is a device. Squashing together would make sense if the
> > > > > > uevent were just updating a device attribute list. Previously w=
hen we
> > > > > > had just a single kind of uevent, that would not have made a
> > > > > > difference, but if we gain different kinds of uevents like here=
, it
> > > > > > starts to matter.
> > > > > >
> > > > > > However, Paul came to the conclusion that we will be ok as long=
 as the
> > > > > > events come via netlink.     =20
> > > > >=20
> > > > > Yeah netlink shouldn't drop events on the floor I think. It might
> > > > > still happen, but then I think you should get an indication of th=
at
> > > > > error, and you just treat it as a general hotplug event like on o=
lder
> > > > > kernels.   =20
> > > >=20
> > > > Alright, although reading Paul it sounds like there is another
> > > > (fallback?) method as well that wouldn't work. Should userspace wor=
ry
> > > > about that?
> > > >=20
> > > > Hmm, get an indication of an error... I don't know how that would be
> > > > presented in libudev API and I can't point to any code in Weston th=
at
> > > > would deal with it. Does anyone have a clue about that?
> > > >=20
> > > > Userspace cannot really start taking advantage of any new fine-grai=
ned
> > > > hotplug events until it can rely on the event delivery. Granted, th=
is
> > > > seems purely a userspace issue, but I bet it could be formulated as=
 a
> > > > kernel regression: things stop working after upgrading the kernel w=
hile
> > > > having always used new userspace which was ready for detailed hotpl=
ug
> > > > events but didn't ensure the delivery in userspace.   =20
> > >=20
> > > You have this already (if it's really an issue with netlink reliabili=
ty,
> > > tbh no idea), you can already miss a global uevent. It's easier to ca=
tch
> > > up if you do miss it, since you're forcing a reprobe on everything. T=
hat's
> > > why I think the EPOCH thing would be good, userspace could be defensi=
ve
> > > and always call GetConnectorCurrent on all connectors if it gets any
> > > hotplug uevent, and if it gets an EPOCH change, force a reprobe. But =
I'm
> > > not sure that's really required (aside from VT switching). =20
> >=20
> > No, my concern is not an issue with netlink reliability. It is a
> > potential issue when userspace chooses to not use netlink, and uses
> > something else instead. I'm not sure what that else is but Paul says
> > there is code in libudev and that is completely outside the control of
> > KMS apps like display servers. =20
>=20
> afaik this other path only exists because it's the older one, for uapi
> backwards compatibility with older userspace. Shouldn't be used for
> anything.

"Shouldn't be used" and someone screaming "kernel regression"... are you
sure that path won't matter?

Like some home-brewn distribution that happens to configure their
libudev and kernel to use the old method, uses already new userspace,
and then upgrades the kernel that starts sending fine-grained hotplug
events, resulting the display server randomly handling hotplug wrong.

Reading Airlie's recent rant about kernel regression handling make this
a scary scenario where you would have no other choice than to rip all
the fine-grained uevents out again.

Is there any difference in the kernel code between the old method and
the netlink method? Would it be possible to send fine-grained hotplug
events only through netlink, and fall back to the old 'HOTPLUG=3D1' for
the old method?

> > Can you explain how one could miss a global hotplug event when
> > userspace is using netlink to watch for events? I thought the netlink
> > path through libudev was reliable. And how does userspace realize it
> > missed an event? =20
>=20
> I thought netlink is supposed to be reliable, but then if you send
> bazillion of events and userspace is stuck, eventually you will run out of
> memory. I have no idea how netlink signals that, and how that's forwarded
> or not in libudev. Also not sure whether we should actually care about
> this.

Ok. Let's try to keep the number of events low then, e.g. in the case of

	HOTPLUG=3D1 CONNECTOR=3Dxx PROPERTY=3Dyy

revert to sending just a single uevent with PROPERTY set to 0 instead
if there are more than one such no-probe property changes for the same
connector.


Thanks,
pq

--Sig_/LPgghaT/yhC2U/1P=C84I_K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAlzeiBgACgkQI1/ltBGq
qqc9ZQ//S0rEVMV0P71UtsrwcR8N5X7BdMm5U+lfto67jNzU1fDDMXX/CRmjl2d7
7dF3ZXvp1Wmy6mOhbLwQmXGToufGWYdbN9CAbFzwkCKMzpfFBtke0j3BKV9zIjyN
CgJcJrkVs82K1uuuOAGmUcCAkbsn4m7FsTY7czRtNSRs3g8uoD222lBoRC/dCPDe
EKS//7RRWNv6R1eYeq/Xrs1AaZmWge5FCz66vojwDzOvfde3RZmJdooXRfAJPk1o
MET7FvGLNMq8vgRNpIFvThFZ4l3+/SrahA5XUxAQYbOiHDPCo8WDbPrk5uiso/vW
xPbZnnEFztIi4pZqAYUNr59n8nIz67aYg7Pw5ocpPKuZbnC2taXofVQ7uyr+OlQE
uw0ZVR0stk0EuwvyTzCCCQUcKo1rcniFousAQmJiuF6YCPqM0CqtJ9K0GHV83kJs
AWgWkSpNmKZm3oVoFwHNp6JAE7mA7DcjKAaUZYhZ2nvwp3L2q/Xubrxvl0BPZqqk
yjp4oNQbHrLDTZ2oKvl0GrYf7fJal+y+wEPn9a/Zet71zGRThF950D5txOv7el61
Kw5nFqO8cmdBruUj2MXhB6T7aZkxhpbSxKsXM974tZyQe71j7a6F6YMhVuh/Y1fi
wlnWc5QpX03KnW5kJcjVRSasdp7jXJyW9n0Q9LBiVpGvP5csh6M=
=aGyt
-----END PGP SIGNATURE-----

--Sig_/LPgghaT/yhC2U/1P=C84I_K--

--===============1129988730==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1129988730==--
