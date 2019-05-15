Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 914241E934
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 09:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF638954A;
	Wed, 15 May 2019 07:37:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDDE38954A;
 Wed, 15 May 2019 07:37:45 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id u27so1169858lfg.10;
 Wed, 15 May 2019 00:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=XjCBaBzLHDu1cu1Zpl3st5onyMkpatNCsUCLHxhzwAk=;
 b=o4Y1qKix8kfdUQ+4mQ4hUzz/9P5LNfDEJxWLrHwch2j7shWhQIyfm5WUpQT+aLD72D
 coChMpFW0z73XbZWafgQ+Vxg4Z8d2Bl70JS632qCPuRBsroP4A9ckeDRkX+JxBHpKmmE
 rRKDgBFzzD1Moq4QmXey9EaC14dgWwhaQXpmCygbl2i+aVx1Oc7eLYLbxRTxXdG8PI6f
 /i7Y6trPxPzvdvKiKy+aVGdu9wJ4iP2uy9iV5M84ZG2kFMw8UhD5VAxFPYkX2xYhSKin
 EMELUtCx7QyQC9q/jroywLhbNB6P8JIN6Gcvjfmotpb8Q1y/83b6y7RP1/qXAYqkwP0r
 CyXg==
X-Gm-Message-State: APjAAAVST6ZN4/sduUN/gwqwyZTS4S0ALoyBtcsFrLm6FRf0BncSZ1sy
 OLQ/4Hd1GsEPY1H6Pjmvg9Y=
X-Google-Smtp-Source: APXvYqzOj1fUIZ6yCtsnuMYqm1qM5BH9KJbMf+VLyxtFfoIIUxE0Tv4kmUvGyJotclKLiNWTf5UB9Q==
X-Received: by 2002:a19:2791:: with SMTP id n139mr11724915lfn.67.1557905864040; 
 Wed, 15 May 2019 00:37:44 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id 20sm234364lfa.31.2019.05.15.00.37.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 00:37:43 -0700 (PDT)
Date: Wed, 15 May 2019 10:37:31 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v7 09/11] drm: uevent for connector status change
Message-ID: <20190515103731.16855195@eldfell.localdomain>
In-Reply-To: <CAKMK7uGMJMZiOP4rhhiu=Obu6sO0oav5se-vy8bNLu8dfoZmvA@mail.gmail.com>
References: <20190507162745.25600-1-ramalingam.c@intel.com>
 <20190507162745.25600-10-ramalingam.c@intel.com>
 <31dad9a323382628911c5301a6eec179855aa815.camel@bootlin.com>
 <CAKMK7uEwHZ=As3B4z+WZ1fyd2yP5Krg3hVzfCcCAtv3jOxmTrA@mail.gmail.com>
 <8aa3980a6948b9b2b989c237f8453ca54e72ad95.camel@bootlin.com>
 <CAKMK7uFaEPm+kqYdc=vkb_iRRXDf=P6D98VTMMKtCMQHCixhLg@mail.gmail.com>
 <20190514110242.6f6ba4b0@eldfell.localdomain>
 <9b6386239ecae396fc4f5cc4467f8e76721f2c83.camel@intel.com>
 <CAKMK7uHJPugRWJx32oWVF94jBf28P0nBirZNbSBRMS1SbUaS9A@mail.gmail.com>
 <20190514163602.7d252b12@eldfell.localdomain>
 <CAKMK7uGMJMZiOP4rhhiu=Obu6sO0oav5se-vy8bNLu8dfoZmvA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=XjCBaBzLHDu1cu1Zpl3st5onyMkpatNCsUCLHxhzwAk=;
 b=DWimmXu3JJaqT6qMqn5L4XSTcmC2vsGFfp+bSN7y0xShH5H+5/ul3oTuB8VEZ7uPXT
 Ak4kP33HQGeHBC1XrMhtouyOW/ldmu9Y9DrxbulDS+/G0h4czxDFN0+Ok+nB1VMcs5DN
 /ZfPZSnh20pcnqOsF4QgYUT5IhT2c5AB63+qtJOKoOxA241+uJYztBf9IgyxqtwE13dv
 1r3Hm0QqRxjDh1yXliR8D16jGej/SWfrXZlz9/JnB6B+a4wrNC7/VlRcdgYhBG2J0xa3
 /FJdEb9emWEIpDYT1t0FIIMOWDg9CurlodNxAxpwfXS7KVsdu6fxfJ4wgWTH6IkHRa5X
 fLuw==
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
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Mun, 
 Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
 "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>, "Vetter, 
 Daniel" <daniel.vetter@intel.com>, "sean@poorly.run" <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============0134721523=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0134721523==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/yrwTOwUg7dkdhYf/CxHS1AV"; protocol="application/pgp-signature"

--Sig_/yrwTOwUg7dkdhYf/CxHS1AV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 14 May 2019 16:34:01 +0200
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> On Tue, May 14, 2019 at 3:36 PM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
> >
> > On Tue, 14 May 2019 13:02:09 +0200
> > Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > =20
> > > On Tue, May 14, 2019 at 10:18 AM Ser, Simon <simon.ser@intel.com> wro=
te: =20
> > > >
> > > > On Tue, 2019-05-14 at 11:02 +0300, Pekka Paalanen wrote: =20

...

> > > > > Hi Daniel,
> > > > >
> > > > > just to clarify the first case, specific to one very particular
> > > > > property:
> > > > >
> > > > > With HDCP, there is a property that may change dynamically at run=
time
> > > > > (the undesired/desired/enabled tristate). Userspace must be notif=
ied
> > > > > when it changes, I do not want userspace have to poll that proper=
ty
> > > > > with a timer.
> > > > >
> > > > > When that property alone changes, and userspace is prepared to ha=
ndle
> > > > > that property changing alone, it must not trigger a reprobe of the
> > > > > connector. There is no reason to reprobe at that point AFAIU.
> > > > >
> > > > > How do you ensure that userspace can avoid triggering a reprobe w=
ith the
> > > > > epoch approach or with any alternate uevent design?
> > > > >
> > > > > We need an event to userspace that indicates that re-reading the
> > > > > properties is enough and reprobe of the connector is not necessar=
y.
> > > > > This is complementary to indicating to userspace that only some
> > > > > connectors need to be reprobed instead of everything. =20
> > > >
> > > > Can't you use the PROPERTY hint? If PROPERTY is the HDCP one, skip =
the
> > > > reprobing. Would that work? =20
> >
> > Hi,
> >
> > yes, that would work, if it was acceptable to DRM upstream. The replies
> > to Paul seemed to be going south so fast that I thought we wouldn't get
> > any new uevent fields in favour of "epoch counters".
> > =20
> > > Yes that's the idea, depending upon which property you get you know
> > > it's a sink change (needs full reprobe) or something else like hdcp
> > > state machinery update. =20
> >
> > Right.
> > =20
> > > Wrt avoiding the full reprobe for sink changes: I think we should
> > > indeed decouple that from the per-connector event for sink changes.
> > > That along is a good win already, since you know for which connector
> > > you need to call drmGetConnector (which forces the reprobe). It would
> > > be nice to only call drmGetConnectorCurrent (avoids the reprobe), but
> > > historically speaking every time we tried to rely on this we ended up
> > > regretting things. =20
> >
> > What changed? This sounds very much what Paul suggested. Looking at it
> > from userspace side: =20
>=20
> This sounds solid, some refinements below:
>=20
> > HOTPLUG=3D1 CONNECTOR=3Dxx PROPERTY=3Dyy
> >
> > - If yy is "Content Protection", no need to drmModeGetConnector(), just
> >   re-get the connector properties.
> >
> > - Kernel probably shouldn't bother sending this for properties where
> >   re-probe could be necessary, and send the below instead. =20
>=20
>=20
> I think we should assert that the kernel can get the new property
> values using drmModeGetConnectorCurrent for this case, i.e. the kernel
> does not expect a full reprobe. I.e. upgrade your idea from "should"
> to "must"

Hi Daniel,

ok, that's good.

> Furthermore different property can indicate different kind of updates,
> e.g. hdcp vs general sink change vs. whatever else might come in the
> future.

What do you mean by different kinds of updates?

Btw. I started thinking, maybe we should completely leave out the "If
yy is "Content Protection"" and require the kernel to guarantee, that
if PROPERTY is set, then drmModeGetConnector() (probing) must not be
necessary based on this event alone.

Writing it down again:

HOTPLUG=3D1 CONNECTOR=3Dxx PROPERTY=3Dyy

- yy denotes which connector xx property changed.

- Userspace does not need to do drmModeGetConnector(), it only needs to
  drmModeObjectGetProperties() on the connector to receive the new
  updated property values.

- Kernel must not send this event for changes that may require probing
  for correct results, exceptional conditions (buggy hardware, etc.)
  included. Instead, the kernel must send one of the below events.

Is there actually anything interesting that
drmModeGetConnectorCurrent() could guaranteed correctly return that is
not a property already? I'd probably leave this consideration out
completely, and just say do one of the needs-probing events if anything
there changed.

> > HOTPLUG=3D1 CONNECTOR=3Dxx
> >
> > - Needs to drmModeGetConnector() on the one connector, no need to probe
> >   others. Implies that one needs to re-get the connector properties as
> >   well. =20
>=20
> Sounds good.
>=20
> > HOTPLUG=3D1
> >
> > - Need to do drmModeGetResouces() to discover new/disappeared
> >   connectors, and need to drmModeGetConnector to re-probe every
> >   connector. (As always.) =20
>=20
> Maybe we should clarify that this is also what you get when an entire
> connector appears/disappears (for dp mst hotplug).

Yes, that's what I wrote. :-)

Weston implements the discovery of appearing/disappearing connectors
(as opposed to connecting/disconnecting connectors). Not sure anyone
has ever tested it though...

> Maybe we could make an additional rule that if a connector has the
> EPOCH property, then it does _not_ need to be reprobe for the global
> events. For that case userspace should only check whether there's
> new/removed connectors, and then probe the new ones (and disable the
> removed ones as needed). We can also use some other flag to indicate
> this if we don't add the epoch proprty.

Sounds fine to me, though I'm not too clear what the epoch property
is designed to achieve. Is it about avoiding re-probing when re-gaining
DRM master after having let it go, e.g. VT-switching back from another
VT? That would be nice.

> > That should be also backwards-compatible: any userspace that doesn't
> > understand CONNECTOR will see HOTPLUG=3D1 and re-probe everything. Any
> > userspace that doesn't understand PROPERTY or the property it refers to
> > will fall back to probing either the connector or everything. =20
>=20
> Agreed, that should work.

Cool. The epoch exception you worded seems to fit backward-compatible
as well.

>=20
> > I would be happy to get that behaviour into Weston, particularly as the
> > HDCP feature is brewing for Weston too.
> >
> > --------
> >
> > When discussing this in IRC, I had the concern about how uevents are
> > delivered in userspace. Is there a possibility that they might be
> > overwritten, contain stale attributes, or get squashed together?
> >
> > Particularly if a display server is current on the VT and active and
> > monitoring udev, but stuck doing something and cannot service uevents
> > very fast, and the kernel sends more than one event before the process
> > gets back to dispatching. The terminology in libudev API confused me as
> > an event is a device. Squashing together would make sense if the
> > uevent were just updating a device attribute list. Previously when we
> > had just a single kind of uevent, that would not have made a
> > difference, but if we gain different kinds of uevents like here, it
> > starts to matter.
> >
> > However, Paul came to the conclusion that we will be ok as long as the
> > events come via netlink. =20
>=20
> Yeah netlink shouldn't drop events on the floor I think. It might
> still happen, but then I think you should get an indication of that
> error, and you just treat it as a general hotplug event like on older
> kernels.

Alright, although reading Paul it sounds like there is another
(fallback?) method as well that wouldn't work. Should userspace worry
about that?

Hmm, get an indication of an error... I don't know how that would be
presented in libudev API and I can't point to any code in Weston that
would deal with it. Does anyone have a clue about that?

Userspace cannot really start taking advantage of any new fine-grained
hotplug events until it can rely on the event delivery. Granted, this
seems purely a userspace issue, but I bet it could be formulated as a
kernel regression: things stop working after upgrading the kernel while
having always used new userspace which was ready for detailed hotplug
events but didn't ensure the delivery in userspace.


Thanks,
pq

--Sig_/yrwTOwUg7dkdhYf/CxHS1AV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAlzbwbwACgkQI1/ltBGq
qqeFOg/7BAClCiJltqjfT+E55wAk890KhTN8nz2/oNf/1XyXoQVISuwcvV559ReQ
YurjtWZX9k00ZuctWPBEHCpqUG8D4fm84wRB+zO89tyVspCqjf5Zg4cvcdkqenjF
A4gOvXJeZtk1vO1lYpkeHXkzizwOhb7VLZqiuOu6fpNazu/vx8103i3fvnAjV0yY
q74J1axXenIZR4VaH7O3sEkWQFdxYwE1EEJjWTmfaUFqdk64fHlh9hRCwl2YA5po
usb5YrEiDV3o3tcwaA2rycaplaL2KR/8uJRV6+chNvdKDANq+fFyDdxvwY9Eu1Xa
uXS8KgH9OYIILKZfgF5Z5HcewmZBaIKFyJPF7lpkcCf1wfHIfo3nuvyhx58Wd4KJ
NGWWqjjqupn92wrUzpR9HtQ3g2Bo8ftbNQ8sX92b6O8vRuso3YhfK9O791xtoesi
RmGOjxmJcVUV3+XtJr5AFDS2KSwqb9COEglIBvEn9h1EB2+w57FaYEitv1GtVx2V
tDu1pAdZJQbI3tR8NLOi8SIqaYBK8WExKlv+kD4nVX2H30Vmvcpv7deq4GxHiI8s
nRkZxXlGSf8v/5OvpeHGOGunZmBAX3r4d2mJenyyemc8ffMM/5CHdyFe49xfYWRe
zQoJh+8T2Vesw7pvhf2C1bisfuD4N/FJ5ilwNyFJ+/TgpxE9zsA=
=hWOr
-----END PGP SIGNATURE-----

--Sig_/yrwTOwUg7dkdhYf/CxHS1AV--

--===============0134721523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0134721523==--
