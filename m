Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C286F1C454
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 10:03:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC1589308;
	Tue, 14 May 2019 08:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD1689015;
 Tue, 14 May 2019 08:02:56 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id 188so13399904ljf.9;
 Tue, 14 May 2019 01:02:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=0rG4JeZYl40TiUZGVj/VepyJkR7jNmst+/WZT0L1Xx8=;
 b=DBvhvl/d5tfmlYS/h1ZJqwBnct3Xv41ogotoD/QAHaTzy+W2PHDcMRV+o732xAKBgp
 82byEB5Ehku/BKly1YtOVD7reTOl5/HbEJpJfkz0Qc96RwR+mvsHQ0L48gmk5vrkoQW4
 iDVyr6pt0a2tyDpJzXC+/tq4bbStSFu8hzXtjeB7EDyFFI36HjBAPWcIblaXvOhFAScr
 R0Fyrpg6bL5DHN0SwRCYfZCe/CMwchSnftcuZ2Sk1dpH8lqKB3Sqz0IpRIyGfcK8NBtT
 31E9J1vDcNNmFcXMlyD53dgauvJU12qZ1s0k4FTvHxXcYLT+dAKbzZm79OIuCgRBkM+L
 n+qA==
X-Gm-Message-State: APjAAAXKe5WdRiXP8AKDSmnNBb8tfqjmVCVePGd/Xwh4kkts+D2TmYn/
 vkuHVHfR6z9N/p/qbUT2pI0=
X-Google-Smtp-Source: APXvYqz5653EhGNBL6JPJTQ9TBoxfb/4V+Vt81eztJwyzdmcLwPB6TARCFXnZZiV8AkuUrl/Wtitkw==
X-Received: by 2002:a2e:4701:: with SMTP id u1mr11629109lja.38.1557820975069; 
 Tue, 14 May 2019 01:02:55 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id q21sm3730228lfa.84.2019.05.14.01.02.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 01:02:54 -0700 (PDT)
Date: Tue, 14 May 2019 11:02:42 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v7 09/11] drm: uevent for connector status change
Message-ID: <20190514110242.6f6ba4b0@eldfell.localdomain>
In-Reply-To: <CAKMK7uFaEPm+kqYdc=vkb_iRRXDf=P6D98VTMMKtCMQHCixhLg@mail.gmail.com>
References: <20190507162745.25600-1-ramalingam.c@intel.com>
 <20190507162745.25600-10-ramalingam.c@intel.com>
 <31dad9a323382628911c5301a6eec179855aa815.camel@bootlin.com>
 <CAKMK7uEwHZ=As3B4z+WZ1fyd2yP5Krg3hVzfCcCAtv3jOxmTrA@mail.gmail.com>
 <8aa3980a6948b9b2b989c237f8453ca54e72ad95.camel@bootlin.com>
 <CAKMK7uFaEPm+kqYdc=vkb_iRRXDf=P6D98VTMMKtCMQHCixhLg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=0rG4JeZYl40TiUZGVj/VepyJkR7jNmst+/WZT0L1Xx8=;
 b=o5oN1V5IxJHEIrS1T7UkcWpJsKjtuSazdsh7g42kYiz14vdHiAFgGkf+S2k1pyztpR
 Qdrv0NE2Ht46tRGyPoZcHdMVVk82b/of92enmAYh0VZIo/aIXNYXSikQvli+BxmWGb3p
 +6ON8XVhVZfBRw4Co3eiuQkeHsF8oDD6RUtin0WfE347jlrD//eMgDF4/2F7Ic356tyL
 7m+lVT1MtbMvean0647ybJvw7aAb0/82JnNyAy9acZxGFtaUqxg64ZdZoqgOz92g2/kI
 hJIQgOjJB2XHQwtM3y8BAJoh8ErnXRoyrwBl7r6PASN9wP4SgpxCFmFU6efJjSoCLRZY
 0JKw==
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
 Maxime Ripard <maxime.ripard@bootlin.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 David Airlie <airlied@linux.ie>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1926669453=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1926669453==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/xePYMb_LVcJtrNRDT_vhGiI"; protocol="application/pgp-signature"

--Sig_/xePYMb_LVcJtrNRDT_vhGiI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 13 May 2019 11:34:58 +0200
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> On Mon, May 13, 2019 at 11:02 AM Paul Kocialkowski
> <paul.kocialkowski@bootlin.com> wrote:
> >
> > Hi,
> >
> > On Fri, 2019-05-10 at 16:54 +0200, Daniel Vetter wrote: =20
> > > On Fri, May 10, 2019 at 2:12 PM Paul Kocialkowski
> > > <paul.kocialkowski@bootlin.com> wrote: =20
> > > > Hi,
> > > >
> > > > On Tue, 2019-05-07 at 21:57 +0530, Ramalingam C wrote: =20
> > > > > DRM API for generating uevent for a status changes of connector's
> > > > > property.
> > > > >
> > > > > This uevent will have following details related to the status cha=
nge:
> > > > >
> > > > >   HOTPLUG=3D1, CONNECTOR=3D<connector_id> and PROPERTY=3D<propert=
y_id>
> > > > >
> > > > > Need ACK from this uevent from userspace consumer. =20
> > > >
> > > > So we just had some discussions over on IRC and at about the hotplug
> > > > issue and came up with similar ideas:
> > > > https://lists.freedesktop.org/archives/dri-devel/2019-May/217408.ht=
ml
> > > >
> > > > The conclusions of these discussions so far would be to have a more=
 or
> > > > less fine grain of uevent reporting depending on what happened. The
> > > > point is that we need to cover different cases:
> > > > - one or more properties changed;
> > > > - the connector status changed;
> > > > - something else about the connector changed (e.g. EDID/modes)
> > > >
> > > > For the first case, we can send out:
> > > > HOTPLUG=3D1
> > > > CONNECTOR=3D<id>
> > > > PROPERTY=3D<id>
> > > >
> > > > and no reprobe is required.
> > > >
> > > > For the second one, something like:
> > > > HOTPLUG=3D1
> > > > CONNECTOR=3D<id>
> > > > STATUS=3DConnected/Disconnected
> > > >
> > > > and a connector probe is needed for connected, but not for
> > > > disconnected;
> > > >
> > > > For the third one, we can only indicate the connector:
> > > > HOTPLUG=3D1
> > > > CONNECTOR=3D<id>
> > > >
> > > > and a reprobe of the connector is always needed =20
> > >
> > > There's no material difference between this one and the previous one.
> > > Plus there's no beenfit in supplying the actual value of the property,
> > > i.e. we can reuse the same PROPERTY=3D<id-of-status-property> trick. =
=20
> >
> > That's the idea, but we need to handle status changes differently than
> > properties, since as far as I know, connected/unconnected status is not
> > exposed as a prop for the connector. =20
>=20
> Oops, totally missed that. "Everything is a property" is kinda
> new-ish, at least compared to kms. Kinda tempted to just make status
> into a property. Or another excuse why we should expose the epoch
> property :-)

Hi Daniel,

just to clarify the first case, specific to one very particular
property:

With HDCP, there is a property that may change dynamically at runtime
(the undesired/desired/enabled tristate). Userspace must be notified
when it changes, I do not want userspace have to poll that property
with a timer.

When that property alone changes, and userspace is prepared to handle
that property changing alone, it must not trigger a reprobe of the
connector. There is no reason to reprobe at that point AFAIU.

How do you ensure that userspace can avoid triggering a reprobe with the
epoch approach or with any alternate uevent design?

We need an event to userspace that indicates that re-reading the
properties is enough and reprobe of the connector is not necessary.
This is complementary to indicating to userspace that only some
connectors need to be reprobed instead of everything.


Thanks,
pq

--Sig_/xePYMb_LVcJtrNRDT_vhGiI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAlzadiIACgkQI1/ltBGq
qqdNjg//fhiH95AO/F8SSQJpoxesnfj5ARXoWmT35WIxxSg+byDJrk79fLc0RliQ
0KvvhfScOUWz5fjrO16imxfbaV86pxgRqedDs0p0bx5AC0oaUh/Di4gEuWRh5lub
FRDaTbjzKZju5eyMpADkggbhvoYQfQAlnVqhqyxWGls5Qy2RVy2O5ioIhfC/Lf9+
Esg5xnZVdDHKtDEy5pW/PbJ2jSUstKc07ag2oppKA9zhDLJXepD15ejNctwtio3R
vV8nD71nBRFsk5ImSWdRurIHmiSoTwNpOW1mYF3QDDuTBZr2w6l6kQ6VuzjzjdeD
o3BYhswCsAqxNSj6H0b5CD9yMRB/GZzw/GwGIGfCnzQwO00MJWif+bDr6rxf/nCg
s8CFyP0mFshUXBeygTKzjtDzJe1dZmWn95bRtZP73K734E069pWefwG5p61Cfbk8
yFLZUKHSc4flh4yljP71O0QZX8g9rRFbcvc2fhFNhkO3qbrVKtzQPJl6qvEpehuo
xYp75O74b0V+UEvDZrtmWjsRmZ/+HLybAvNREUj0kMhb/8C/pJq/vcnTOSCB7r77
NPaaQrufrhDk1s2pj7bLSeZA4J7nQTK4VDT8SzRceQqCLl+sL7Rig6ndb10QDUss
Qo1OeZX81SZMSxqNhWwXbDdkbVulJfSmKIgDKo8K+ZUdJqFpX3Y=
=H+Hh
-----END PGP SIGNATURE-----

--Sig_/xePYMb_LVcJtrNRDT_vhGiI--

--===============1926669453==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1926669453==--
