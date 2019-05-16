Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA5220131
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 10:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F359892EF;
	Thu, 16 May 2019 08:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C863892E2;
 Thu, 16 May 2019 08:22:24 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id n134so1889841lfn.11;
 Thu, 16 May 2019 01:22:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=KRkTD8N89gc5ZqRlfDNtz54amyFSgwDJjOU0nehSfWk=;
 b=G6/FHG7Tc+tEsn0ZhnmwBBv9MLqPpPPieA8cSPQUN0RLIrtKk8z/SBkf/f+RzLPy+Y
 JRgJp/PUUSFIKzN7hMe2u5f5J4IZhH89SqNEDIv4WPgTlxXxGFtdywp6TmGk6E0FsIe3
 /lWzCkbPqFQJMarbOtPl7/NFL+a4JZgM7mOe7W4aIcJvpQwE6zyF5nJbjn899Rl8EGeF
 RqK/jW66xNjCB5WWjl5C+3b02sKk6LwP9bpRpAcPLcAKN4zTvV1210gw1Pk1q4IQN9MZ
 TMfl0JI85IsrEUdf5vz0iDrWKTZ3TsgQuScTtGHAKYf0XocP4VacVcr/g13quIoYuR8O
 X4Ew==
X-Gm-Message-State: APjAAAXXmiIQzPS+rGN1+sXttoW0svfrViHAied1hJM1gLg2OiTjAbyU
 pxMdzHnMaj4RxSFL3qMVLKCmyIHt
X-Google-Smtp-Source: APXvYqzs80n1iClByM1nxn5p14XWLwyzPLM/SUmfKCcRy44LCabhJBQrsfuCYFo3LaCdaY4sJrG3ng==
X-Received: by 2002:a19:ec12:: with SMTP id b18mr22809437lfa.149.1557994942887; 
 Thu, 16 May 2019 01:22:22 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id h23sm769085ljf.28.2019.05.16.01.22.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 16 May 2019 01:22:22 -0700 (PDT)
Date: Thu, 16 May 2019 11:22:11 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v7 09/11] drm: uevent for connector status change
Message-ID: <20190516112211.1cd5a8c6@eldfell.localdomain>
In-Reply-To: <20190515082449.GA17751@phenom.ffwll.local>
References: <31dad9a323382628911c5301a6eec179855aa815.camel@bootlin.com>
 <CAKMK7uEwHZ=As3B4z+WZ1fyd2yP5Krg3hVzfCcCAtv3jOxmTrA@mail.gmail.com>
 <8aa3980a6948b9b2b989c237f8453ca54e72ad95.camel@bootlin.com>
 <CAKMK7uFaEPm+kqYdc=vkb_iRRXDf=P6D98VTMMKtCMQHCixhLg@mail.gmail.com>
 <20190514110242.6f6ba4b0@eldfell.localdomain>
 <9b6386239ecae396fc4f5cc4467f8e76721f2c83.camel@intel.com>
 <CAKMK7uHJPugRWJx32oWVF94jBf28P0nBirZNbSBRMS1SbUaS9A@mail.gmail.com>
 <20190514163602.7d252b12@eldfell.localdomain>
 <CAKMK7uGMJMZiOP4rhhiu=Obu6sO0oav5se-vy8bNLu8dfoZmvA@mail.gmail.com>
 <20190515103731.16855195@eldfell.localdomain>
 <20190515082449.GA17751@phenom.ffwll.local>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=KRkTD8N89gc5ZqRlfDNtz54amyFSgwDJjOU0nehSfWk=;
 b=B3uiOOO6AbBdApA1x3TkmPoOMfDBAue2pWLNIVcDegJUHEgC8dSfqzVlfOC3/G4IOu
 w64GR9GXJ4AqMXo6SkyAEpGspYQ0atZsER8akDzLGM52J/epkipt/6x7zIWtNfTV/89d
 9EaN9TbDBctc1KZOrntAG0W2Z3h+ZONi7chrEALaHcrdYBs37BnVPZHEoHOcsIXD2zRf
 FYJRPKw1pMZI8oOLiLdZqaM2gJWDRvTmC3eca9+/VV829AuUE5zo8naFNk11GtrOreiO
 4nm17Sn7WuB19UOXifqbfmOKSep2mAsIuXJ9ZhUDzuVR734y63SKbFEWRoypXAzpGAWA
 O+7g==
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
Content-Type: multipart/mixed; boundary="===============1066511850=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1066511850==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/P=uaEOag9KX+VtJdEd=htfB"; protocol="application/pgp-signature"

--Sig_/P=uaEOag9KX+VtJdEd=htfB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 15 May 2019 10:24:49 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Wed, May 15, 2019 at 10:37:31AM +0300, Pekka Paalanen wrote:
> > On Tue, 14 May 2019 16:34:01 +0200
> > Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >  =20
> > > On Tue, May 14, 2019 at 3:36 PM Pekka Paalanen <ppaalanen@gmail.com> =
wrote: =20
> > > >
> > > > On Tue, 14 May 2019 13:02:09 +0200
> > > > Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > >   =20
> > > > > On Tue, May 14, 2019 at 10:18 AM Ser, Simon <simon.ser@intel.com>=
 wrote:   =20
> > > > > >
> > > > > > On Tue, 2019-05-14 at 11:02 +0300, Pekka Paalanen wrote:   =20
> >=20
> > ...
> >  =20
> > > > > > > Hi Daniel,
> > > > > > >
> > > > > > > just to clarify the first case, specific to one very particul=
ar
> > > > > > > property:
> > > > > > >
> > > > > > > With HDCP, there is a property that may change dynamically at=
 runtime
> > > > > > > (the undesired/desired/enabled tristate). Userspace must be n=
otified
> > > > > > > when it changes, I do not want userspace have to poll that pr=
operty
> > > > > > > with a timer.
> > > > > > >
> > > > > > > When that property alone changes, and userspace is prepared t=
o handle
> > > > > > > that property changing alone, it must not trigger a reprobe o=
f the
> > > > > > > connector. There is no reason to reprobe at that point AFAIU.
> > > > > > >
> > > > > > > How do you ensure that userspace can avoid triggering a repro=
be with the
> > > > > > > epoch approach or with any alternate uevent design?
> > > > > > >
> > > > > > > We need an event to userspace that indicates that re-reading =
the
> > > > > > > properties is enough and reprobe of the connector is not nece=
ssary.
> > > > > > > This is complementary to indicating to userspace that only so=
me
> > > > > > > connectors need to be reprobed instead of everything.   =20
> > > > > >
> > > > > > Can't you use the PROPERTY hint? If PROPERTY is the HDCP one, s=
kip the
> > > > > > reprobing. Would that work?   =20
> > > >
> > > > Hi,
> > > >
> > > > yes, that would work, if it was acceptable to DRM upstream. The rep=
lies
> > > > to Paul seemed to be going south so fast that I thought we wouldn't=
 get
> > > > any new uevent fields in favour of "epoch counters".
> > > >   =20
> > > > > Yes that's the idea, depending upon which property you get you kn=
ow
> > > > > it's a sink change (needs full reprobe) or something else like hd=
cp
> > > > > state machinery update.   =20
> > > >
> > > > Right.
> > > >   =20
> > > > > Wrt avoiding the full reprobe for sink changes: I think we should
> > > > > indeed decouple that from the per-connector event for sink change=
s.
> > > > > That along is a good win already, since you know for which connec=
tor
> > > > > you need to call drmGetConnector (which forces the reprobe). It w=
ould
> > > > > be nice to only call drmGetConnectorCurrent (avoids the reprobe),=
 but
> > > > > historically speaking every time we tried to rely on this we ende=
d up
> > > > > regretting things.   =20
> > > >
> > > > What changed? This sounds very much what Paul suggested. Looking at=
 it
> > > > from userspace side:   =20
> > >=20
> > > This sounds solid, some refinements below:
> > >  =20
> > > > HOTPLUG=3D1 CONNECTOR=3Dxx PROPERTY=3Dyy
> > > >
> > > > - If yy is "Content Protection", no need to drmModeGetConnector(), =
just
> > > >   re-get the connector properties.
> > > >
> > > > - Kernel probably shouldn't bother sending this for properties where
> > > >   re-probe could be necessary, and send the below instead.   =20
> > >=20
> > >=20
> > > I think we should assert that the kernel can get the new property
> > > values using drmModeGetConnectorCurrent for this case, i.e. the kernel
> > > does not expect a full reprobe. I.e. upgrade your idea from "should"
> > > to "must" =20
> >=20
> > Hi Daniel,
> >=20
> > ok, that's good.
> >  =20
> > > Furthermore different property can indicate different kind of updates,
> > > e.g. hdcp vs general sink change vs. whatever else might come in the
> > > future. =20
> >=20
> > What do you mean by different kinds of updates? =20
>=20
> Atm we're discussing two:
>=20
> - "Content Protection"
> - "sink changed, but you don't need to reprobe" this would be quite a bit
>   a catch all from the output detection. Paul thinks differently, but I'm
>   not sold on splitting this up more, at least not right now. This would
>   include connector status (and related things returned by drmGetConnector
>   which currently aren't a property), EDID, the mst path id, that kind of
>   stuff.
>=20
> Ime once we have 2, there's more bound to come :-)

Hi Daniel,

I don't understand what the "sink changed" thing could be, but sure,
there can be more.

> > Btw. I started thinking, maybe we should completely leave out the "If
> > yy is "Content Protection"" and require the kernel to guarantee, that
> > if PROPERTY is set, then drmModeGetConnector() (probing) must not be
> > necessary based on this event alone.
> >=20
> > Writing it down again:
> >=20
> > HOTPLUG=3D1 CONNECTOR=3Dxx PROPERTY=3Dyy
> >=20
> > - yy denotes which connector xx property changed. =20
>=20
> Maybe yy denotes which group of properties changed, and part of the uapi
> is picking the canonical one. E.g. content protection might also gain more
> properties in the future (there's patches, but the userspace won't be open
> sourced). And for that case I don't think we should then send an even for
> every single individual property, but just for the lead property.
>=20
> Maybe we should change it to UPDATE_TYPE=3D<some-unique-string>, but it f=
elt
> better to use the property id we already have for this.

Indeed, it is not really necessary to identify the exact property.

We could even just use PROPERTY=3D0 to indicate "something may have
changed, you should re-get the properties, but no need to probe I
promise".

Or like you said, whatever. I don't really care as long as the
semantics are the same.

> > - Userspace does not need to do drmModeGetConnector(), it only needs to
> >   drmModeObjectGetProperties() on the connector to receive the new
> >   updated property values. =20
>=20
> drmModeGetConnector(Current) also supplies all the properties already.
> This is special with connectors, since the predate the "properties on
> everything" design. I'd just mention this function here, and ignore
> drmModeObjectGetProperties.

To avoid confusion, it would be best to mention all three functions
then. It is very easy to forget about legacy uAPI like properties
through GetConnector.

> > - Kernel must not send this event for changes that may require probing
> >   for correct results, exceptional conditions (buggy hardware, etc.)
> >   included. Instead, the kernel must send one of the below events.
> >=20
> > Is there actually anything interesting that
> > drmModeGetConnectorCurrent() could guaranteed correctly return that is
> > not a property already? I'd probably leave this consideration out
> > completely, and just say do one of the needs-probing events if anything
> > there changed. =20
>=20
> That's why I'm suggesting the PROPERTY=3D<epoch_prop_id> would indicate a=
ll
> sink related stuff, including the not-properperty-fied stuff is updated,
> and will be reported correctly by GetConnectorCurrent.

Just because GetConnectorCurrent returns the same properties as
drmModeObjectGetProperties? Ok then. Personally I'm quite firmly in the
land where drmModeObjectGetProperties exists, so don't really care
about the legacy stuff.

> > > > HOTPLUG=3D1 CONNECTOR=3Dxx
> > > >
> > > > - Needs to drmModeGetConnector() on the one connector, no need to p=
robe
> > > >   others. Implies that one needs to re-get the connector properties=
 as
> > > >   well.   =20
> > >=20
> > > Sounds good.
> > >  =20
> > > > HOTPLUG=3D1
> > > >
> > > > - Need to do drmModeGetResouces() to discover new/disappeared
> > > >   connectors, and need to drmModeGetConnector to re-probe every
> > > >   connector. (As always.)   =20
> > >=20
> > > Maybe we should clarify that this is also what you get when an entire
> > > connector appears/disappears (for dp mst hotplug). =20
> >=20
> > Yes, that's what I wrote. :-)
> >=20
> > Weston implements the discovery of appearing/disappearing connectors
> > (as opposed to connecting/disconnecting connectors). Not sure anyone
> > has ever tested it though... =20
>=20
> From what -modesetting and X drivers do: Expect surprises in real world
> usage :-/

I don't know what they do, but sure, always. :-)

As long as no-one uses untested Weston code to scream "kernel
regression"...

> > > Maybe we could make an additional rule that if a connector has the
> > > EPOCH property, then it does _not_ need to be reprobe for the global
> > > events. For that case userspace should only check whether there's
> > > new/removed connectors, and then probe the new ones (and disable the
> > > removed ones as needed). We can also use some other flag to indicate
> > > this if we don't add the epoch proprty. =20
> >=20
> > Sounds fine to me, though I'm not too clear what the epoch property
> > is designed to achieve. Is it about avoiding re-probing when re-gaining
> > DRM master after having let it go, e.g. VT-switching back from another
> > VT? That would be nice. =20
>=20
> Yup, pretty much. Plus I think we need the epoch internally in the kernel
> anyway, to figure out what has changed without having to rewrite endless
> amounts of output detection code in all drivers to pass up a new status
> change return code. Because atm we totally fail to track sink-related
> changes from short pulse hpd (i.e. stays connected, but e.g. edid
> changed).

I do not care at all what you might need internally. ;-)

I am solely interested in the uAPI, and will not look at kernel code. I
just don't have the time for that.

> > > > That should be also backwards-compatible: any userspace that doesn't
> > > > understand CONNECTOR will see HOTPLUG=3D1 and re-probe everything. =
Any
> > > > userspace that doesn't understand PROPERTY or the property it refer=
s to
> > > > will fall back to probing either the connector or everything.   =20
> > >=20
> > > Agreed, that should work. =20
> >=20
> > Cool. The epoch exception you worded seems to fit backward-compatible
> > as well.
> >  =20
> > >  =20
> > > > I would be happy to get that behaviour into Weston, particularly as=
 the
> > > > HDCP feature is brewing for Weston too.
> > > >
> > > > --------
> > > >
> > > > When discussing this in IRC, I had the concern about how uevents are
> > > > delivered in userspace. Is there a possibility that they might be
> > > > overwritten, contain stale attributes, or get squashed together?
> > > >
> > > > Particularly if a display server is current on the VT and active and
> > > > monitoring udev, but stuck doing something and cannot service ueven=
ts
> > > > very fast, and the kernel sends more than one event before the proc=
ess
> > > > gets back to dispatching. The terminology in libudev API confused m=
e as
> > > > an event is a device. Squashing together would make sense if the
> > > > uevent were just updating a device attribute list. Previously when =
we
> > > > had just a single kind of uevent, that would not have made a
> > > > difference, but if we gain different kinds of uevents like here, it
> > > > starts to matter.
> > > >
> > > > However, Paul came to the conclusion that we will be ok as long as =
the
> > > > events come via netlink.   =20
> > >=20
> > > Yeah netlink shouldn't drop events on the floor I think. It might
> > > still happen, but then I think you should get an indication of that
> > > error, and you just treat it as a general hotplug event like on older
> > > kernels. =20
> >=20
> > Alright, although reading Paul it sounds like there is another
> > (fallback?) method as well that wouldn't work. Should userspace worry
> > about that?
> >=20
> > Hmm, get an indication of an error... I don't know how that would be
> > presented in libudev API and I can't point to any code in Weston that
> > would deal with it. Does anyone have a clue about that?
> >=20
> > Userspace cannot really start taking advantage of any new fine-grained
> > hotplug events until it can rely on the event delivery. Granted, this
> > seems purely a userspace issue, but I bet it could be formulated as a
> > kernel regression: things stop working after upgrading the kernel while
> > having always used new userspace which was ready for detailed hotplug
> > events but didn't ensure the delivery in userspace. =20
>=20
> You have this already (if it's really an issue with netlink reliability,
> tbh no idea), you can already miss a global uevent. It's easier to catch
> up if you do miss it, since you're forcing a reprobe on everything. That's
> why I think the EPOCH thing would be good, userspace could be defensive
> and always call GetConnectorCurrent on all connectors if it gets any
> hotplug uevent, and if it gets an EPOCH change, force a reprobe. But I'm
> not sure that's really required (aside from VT switching).

No, my concern is not an issue with netlink reliability. It is a
potential issue when userspace chooses to not use netlink, and uses
something else instead. I'm not sure what that else is but Paul says
there is code in libudev and that is completely outside the control of
KMS apps like display servers.

Can you explain how one could miss a global hotplug event when
userspace is using netlink to watch for events? I thought the netlink
path through libudev was reliable. And how does userspace realize it
missed an event?


Thanks,
pq

--Sig_/P=uaEOag9KX+VtJdEd=htfB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAlzdHbMACgkQI1/ltBGq
qqfyrw//fg1hiYdSPyWbHZMWP1mL+uPxh9nNEZpL05ncJrYKSbfP5wRzU39a5n49
Spjg7ESN7Nz+FEn4sImvNjrY58sJb/1ZfOmZry0YPdaEMoksc/04OODdk2n+ntth
ilHXU0TV/h65BwkkuRX/4L7A0jGsAEGscnoijunkUgtZCCv3LpzlKaHnLwhLaF8P
7iY0EXV026G5GGMgnHGCEcR9R/wInCqI216QFTlthaTWINbxYhKi9jxIiKCY+eDI
VFLDqR2Lghia269QxiggVAis8kMN0yNXqT6TBMCHjju7VAoSKVQ203D+Yqu8v/Ws
Fl1bDVe5w7G2YUx5m/Y6rAIaA65zVMjqIUWQR6RID/25E4AulADJRAfEZYv3vODJ
UB/+yKveFd4jlqIJ+4rzL79To1WRRqANbkCkvunnM0X8NjCynbxD3tomRXXKKDqJ
6+VyaY2LjLw0sNcNdYNyWdVbKPDOFlkOKBd0sLFRmsTIIdWozxhXpR/7lBpFcp39
3ao5PSZOLqv5MZ2OTZIMQLINUMBiFwNYxeM+ksq+DXGIaZHndqIWJXcNLnQlOINc
zosojrkohAVOt/y9CKqeGFc/viFSw1jiiWZVamlycQWh79IUxWlKVCezgu88Uo+k
ub2Kgh0gokLSIxwoLhLjiCwJyb5a3dJzXeLZ20F4zMvxMRXwehE=
=GOa4
-----END PGP SIGNATURE-----

--Sig_/P=uaEOag9KX+VtJdEd=htfB--

--===============1066511850==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1066511850==--
