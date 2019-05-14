Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A513C1C982
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 15:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7324A89294;
	Tue, 14 May 2019 13:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E1589294;
 Tue, 14 May 2019 13:36:15 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id d8so11885156lfb.8;
 Tue, 14 May 2019 06:36:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=orTq2adjs0Zu79RFqTC/IbMAdPA1HhNI5JTNppRMG0E=;
 b=QcehCsZlZdW6JnRzlqDSWmuqzCZiehlmENSGGYeyRqyYaQk6ach3PgxLcTvvwWJT6r
 zn9bVvWh1AqntGiL57HdY4ECSQ7ADwa3H/bBojGGt1TaAc/cdq9Rih7nG1i85s06Wj/o
 WAXMsh3zaVigstSaTIoILElCH1kO2I8wmuiecnqNMjW6il96dMUCacXtk26nEfYdZ8lG
 Md/oN1e+2d6ZNj72nKgXSn9yK7PE2p/2f6LKImyFIM1BtmJUd84wdwftrIAMAwd68a6j
 7heAZM/mghljKtSxr/POpOTDuHXrPIk6KJXCROEhUixDxvlFY+kzItcTpsx2GM+OGUuB
 oEtA==
X-Gm-Message-State: APjAAAXk5cfBktf3z4dY6v8xVgSFN/zAXHRcm/vwq3Jl2bO1i8DPsbpd
 WsbfoetLqpLbnZtOmkKKpko=
X-Google-Smtp-Source: APXvYqzhNHgiYHXXVvdnrfaw32Lounl/H9toGKgt2KNKfnrViNs3/Lv8CC49HVlqYcaRboT4zR03Rg==
X-Received: by 2002:ac2:5606:: with SMTP id v6mr15258111lfd.129.1557840973928; 
 Tue, 14 May 2019 06:36:13 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id y27sm1272547ljd.14.2019.05.14.06.36.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 06:36:13 -0700 (PDT)
Date: Tue, 14 May 2019 16:36:02 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v7 09/11] drm: uevent for connector status change
Message-ID: <20190514163602.7d252b12@eldfell.localdomain>
In-Reply-To: <CAKMK7uHJPugRWJx32oWVF94jBf28P0nBirZNbSBRMS1SbUaS9A@mail.gmail.com>
References: <20190507162745.25600-1-ramalingam.c@intel.com>
 <20190507162745.25600-10-ramalingam.c@intel.com>
 <31dad9a323382628911c5301a6eec179855aa815.camel@bootlin.com>
 <CAKMK7uEwHZ=As3B4z+WZ1fyd2yP5Krg3hVzfCcCAtv3jOxmTrA@mail.gmail.com>
 <8aa3980a6948b9b2b989c237f8453ca54e72ad95.camel@bootlin.com>
 <CAKMK7uFaEPm+kqYdc=vkb_iRRXDf=P6D98VTMMKtCMQHCixhLg@mail.gmail.com>
 <20190514110242.6f6ba4b0@eldfell.localdomain>
 <9b6386239ecae396fc4f5cc4467f8e76721f2c83.camel@intel.com>
 <CAKMK7uHJPugRWJx32oWVF94jBf28P0nBirZNbSBRMS1SbUaS9A@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=orTq2adjs0Zu79RFqTC/IbMAdPA1HhNI5JTNppRMG0E=;
 b=RUpC4TvFQDc0KBWXrOp4rubA0U2o0cNPW0EDQqF31H1z9Qax81fwPrQixGQHLpW1oY
 2Zk7cQuBPo+NDoF48ibKJYoD9LdIKa9K0iTz8Zd1NabuQFO73taVzzKoUocZGmWwymAd
 2GvBVfZQyrs90MsVjLe4RnOc5pFKWw19Xel5/vZO+B5hK8U/Zlw1x0exX763gJrOHBl/
 qnfB+T/QiJ3jAtrjkmVBsXOAlwflp3Qhp5DFBVjlgyZcLs5kvupfINnUeVrZhxItVSHp
 gRonjkVUQELYIlyiT7EYI9dtuQ6v1DLSXNuHjgKLfnJunh7rC56HJy1c/dZujwYrDPQH
 PkmQ==
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
Cc: "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Mun, 
 Gwan-gyeong" <gwan-gyeong.mun@intel.com>, "Ser, Simon" <simon.ser@intel.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, "sean@poorly.run" <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============0798456817=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0798456817==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/P5t9xemXHAgk_b6t2Sx4khH"; protocol="application/pgp-signature"

--Sig_/P5t9xemXHAgk_b6t2Sx4khH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 14 May 2019 13:02:09 +0200
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> On Tue, May 14, 2019 at 10:18 AM Ser, Simon <simon.ser@intel.com> wrote:
> >
> > On Tue, 2019-05-14 at 11:02 +0300, Pekka Paalanen wrote: =20
> > > On Mon, 13 May 2019 11:34:58 +0200
> > > Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > =20
> > > > On Mon, May 13, 2019 at 11:02 AM Paul Kocialkowski
> > > > <paul.kocialkowski@bootlin.com> wrote: =20
> > > > > Hi,
> > > > >
> > > > > On Fri, 2019-05-10 at 16:54 +0200, Daniel Vetter wrote: =20
> > > > > > On Fri, May 10, 2019 at 2:12 PM Paul Kocialkowski
> > > > > > <paul.kocialkowski@bootlin.com> wrote: =20
> > > > > > > Hi,
> > > > > > >
> > > > > > > On Tue, 2019-05-07 at 21:57 +0530, Ramalingam C wrote: =20
> > > > > > > > DRM API for generating uevent for a status changes of conne=
ctor's
> > > > > > > > property.
> > > > > > > >
> > > > > > > > This uevent will have following details related to the stat=
us change:
> > > > > > > >
> > > > > > > >   HOTPLUG=3D1, CONNECTOR=3D<connector_id> and PROPERTY=3D<p=
roperty_id>
> > > > > > > >
> > > > > > > > Need ACK from this uevent from userspace consumer. =20
> > > > > > >
> > > > > > > So we just had some discussions over on IRC and at about the =
hotplug
> > > > > > > issue and came up with similar ideas:
> > > > > > > https://lists.freedesktop.org/archives/dri-devel/2019-May/217=
408.html
> > > > > > >
> > > > > > > The conclusions of these discussions so far would be to have =
a more or
> > > > > > > less fine grain of uevent reporting depending on what happene=
d. The
> > > > > > > point is that we need to cover different cases:
> > > > > > > - one or more properties changed;
> > > > > > > - the connector status changed;
> > > > > > > - something else about the connector changed (e.g. EDID/modes)
> > > > > > >
> > > > > > > For the first case, we can send out:
> > > > > > > HOTPLUG=3D1
> > > > > > > CONNECTOR=3D<id>
> > > > > > > PROPERTY=3D<id>
> > > > > > >
> > > > > > > and no reprobe is required.
> > > > > > >
> > > > > > > For the second one, something like:
> > > > > > > HOTPLUG=3D1
> > > > > > > CONNECTOR=3D<id>
> > > > > > > STATUS=3DConnected/Disconnected
> > > > > > >
> > > > > > > and a connector probe is needed for connected, but not for
> > > > > > > disconnected;
> > > > > > >
> > > > > > > For the third one, we can only indicate the connector:
> > > > > > > HOTPLUG=3D1
> > > > > > > CONNECTOR=3D<id>
> > > > > > >
> > > > > > > and a reprobe of the connector is always needed =20
> > > > > >
> > > > > > There's no material difference between this one and the previou=
s one.
> > > > > > Plus there's no beenfit in supplying the actual value of the pr=
operty,
> > > > > > i.e. we can reuse the same PROPERTY=3D<id-of-status-property> t=
rick. =20
> > > > >
> > > > > That's the idea, but we need to handle status changes differently=
 than
> > > > > properties, since as far as I know, connected/unconnected status =
is not
> > > > > exposed as a prop for the connector. =20
> > > >
> > > > Oops, totally missed that. "Everything is a property" is kinda
> > > > new-ish, at least compared to kms. Kinda tempted to just make status
> > > > into a property. Or another excuse why we should expose the epoch
> > > > property :-) =20
> > >
> > > Hi Daniel,
> > >
> > > just to clarify the first case, specific to one very particular
> > > property:
> > >
> > > With HDCP, there is a property that may change dynamically at runtime
> > > (the undesired/desired/enabled tristate). Userspace must be notified
> > > when it changes, I do not want userspace have to poll that property
> > > with a timer.
> > >
> > > When that property alone changes, and userspace is prepared to handle
> > > that property changing alone, it must not trigger a reprobe of the
> > > connector. There is no reason to reprobe at that point AFAIU.
> > >
> > > How do you ensure that userspace can avoid triggering a reprobe with =
the
> > > epoch approach or with any alternate uevent design?
> > >
> > > We need an event to userspace that indicates that re-reading the
> > > properties is enough and reprobe of the connector is not necessary.
> > > This is complementary to indicating to userspace that only some
> > > connectors need to be reprobed instead of everything. =20
> >
> > Can't you use the PROPERTY hint? If PROPERTY is the HDCP one, skip the
> > reprobing. Would that work? =20

Hi,

yes, that would work, if it was acceptable to DRM upstream. The replies
to Paul seemed to be going south so fast that I thought we wouldn't get
any new uevent fields in favour of "epoch counters".

> Yes that's the idea, depending upon which property you get you know
> it's a sink change (needs full reprobe) or something else like hdcp
> state machinery update.

Right.

> Wrt avoiding the full reprobe for sink changes: I think we should
> indeed decouple that from the per-connector event for sink changes.
> That along is a good win already, since you know for which connector
> you need to call drmGetConnector (which forces the reprobe). It would
> be nice to only call drmGetConnectorCurrent (avoids the reprobe), but
> historically speaking every time we tried to rely on this we ended up
> regretting things.

What changed? This sounds very much what Paul suggested. Looking at it
from userspace side:

HOTPLUG=3D1 CONNECTOR=3Dxx PROPERTY=3Dyy

- If yy is "Content Protection", no need to drmModeGetConnector(), just
  re-get the connector properties.

- Kernel probably shouldn't bother sending this for properties where
  re-probe could be necessary, and send the below instead.

HOTPLUG=3D1 CONNECTOR=3Dxx

- Needs to drmModeGetConnector() on the one connector, no need to probe
  others. Implies that one needs to re-get the connector properties as
  well.

HOTPLUG=3D1

- Need to do drmModeGetResouces() to discover new/disappeared
  connectors, and need to drmModeGetConnector to re-probe every
  connector. (As always.)

That should be also backwards-compatible: any userspace that doesn't
understand CONNECTOR will see HOTPLUG=3D1 and re-probe everything. Any
userspace that doesn't understand PROPERTY or the property it refers to
will fall back to probing either the connector or everything.

I would be happy to get that behaviour into Weston, particularly as the
HDCP feature is brewing for Weston too.

--------

When discussing this in IRC, I had the concern about how uevents are
delivered in userspace. Is there a possibility that they might be
overwritten, contain stale attributes, or get squashed together?

Particularly if a display server is current on the VT and active and
monitoring udev, but stuck doing something and cannot service uevents
very fast, and the kernel sends more than one event before the process
gets back to dispatching. The terminology in libudev API confused me as
an event is a device. Squashing together would make sense if the
uevent were just updating a device attribute list. Previously when we
had just a single kind of uevent, that would not have made a
difference, but if we gain different kinds of uevents like here, it
starts to matter.

However, Paul came to the conclusion that we will be ok as long as the
events come via netlink.


Thanks,
pq

--Sig_/P5t9xemXHAgk_b6t2Sx4khH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAlzaxEIACgkQI1/ltBGq
qqcceA//cfWlk/DuUob8blOFM49kvwc1TkgHceYJLMuK4JhqUYri6+7jgv+tLM00
fBNiNyw36r+98UsDfaZnB2R7w9EFJQyjd+0Ol6vnCCF3GZbLWzX6f/eo1wX6fBV0
Hdv6X05hB1jndsWnk8FkwCE8KwkSOvIWsyeDdRVeaEGhWChVJ7owUubrYt/JK1dF
PkhUr3krmaKbBwkbbwtbKyqjvYpLHH5P3+yDsDt+cdtWhsJMsq/odys11bsK3gE2
moQ4iRDjDDnyEHCVvO/1iNHvtau2q9sevGa352YisBuTi5PdgQ9I3BZj9Q023GDN
TcQ8dUF+95R0CP0ZC8mxt1Hd69JIVvgJ1zn7Yvt6DQMdv1Kuh2Aqz7vyuwD9Pcnx
T6+DY6mjmiu6wW2r3GJvfNTN3FunHmwSzXu7aY6/aLFvS22TTcpgHfZlU3aL7BlU
lDuRsmhFZmSHqs7qWQwrkTf+2uCHijzjFbR3Tw7ebHpLJtf0qG12FTwrIKnUqOC2
Okj4AFGrDTG3Y348AiI66tmPksSW6FHAYmJpxc8GdU2O41VqAUzZaTNEZLh8MVas
OaUpOhYmskrRWhBUhs7jE5NOZnwJUm3VPzU3zas4wijsHeVSWLa/i/6pSmi+HE9q
0WvUi0iOPqQWfykDY13Uw0nqIo1LEe8QRuFykABc8E9/L3l6P5Q=
=RTuG
-----END PGP SIGNATURE-----

--Sig_/P5t9xemXHAgk_b6t2Sx4khH--

--===============0798456817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0798456817==--
