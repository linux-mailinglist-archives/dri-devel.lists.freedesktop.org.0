Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6491CF6B0
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 16:15:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E1B6E923;
	Tue, 12 May 2020 14:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7410C6E923
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 14:14:59 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id a4so10691207lfh.12
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 07:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=X1HaGjwgT0naN7kQb9lQQ26nx7jhCnpSY8u8f6qQMBs=;
 b=MzqweOspzeb4jzSipA+qLk5fAMEoagOt7ZQNjHp3SboUT6b/hTgRB8QHG9I2N1ASvp
 hbhxshDcAoe1fC1Ga90rVVHACISjK6A5i+DrWjF7jy3NTchU6yuEbaOQMuP6TrolKv28
 jWy80vALyIvGrYkygNvCP6pvPOg+nB5eeFQVR7SI8XsaQlXgaK9Q+TLxyT2wi4vPImfE
 PFNJFp06nh+eQbmemVBZtXb/J5zncZyorM7cNiXMcA8vjZ1qA1PW4qpKUz9tXG+TaikR
 5rQ0x+Z20Up5XJXsVR28UL+/ch2ElypcbLJvY/4osHr2VDh7UDzEf3Ztp+7LCHvlwLY/
 lkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=X1HaGjwgT0naN7kQb9lQQ26nx7jhCnpSY8u8f6qQMBs=;
 b=DqjH4SEC7kGvw30hW/A16cR8h5G0/dNy0FKVuX0rEL7PrVjZ4+JnnLHH1QhOwtK9AM
 QP88icTB5chqVIuiVgZfA6FYP2nhHdUYjrUqjLILOp+OElOCjG8WQVPJk541tsELotYn
 aBIM+FVTT5PQYSV8W1ahFMIbqU2P7kPtDZ63sbM76jBlTKIXiRq0kxUcGNZFowRtxC76
 uVtZK4VjuRa6J/DdRnhPp2tS3QkzFE9KYbwtQ5879F2jeca6wwJp4FPG6PwhSkINeUF+
 dc3rjeOxkxqOQkwGOs3l8ug9002Ci42kNUsvt/fwi0ULw8Xf1zJEq139D+JAwmz3CRXg
 gWaQ==
X-Gm-Message-State: AOAM532W2txICoTGJPeWMgot694VseZ407eP44LKHjpmtxLfoc2x7Wda
 krKthUa7Fz375pX4UDisWCw=
X-Google-Smtp-Source: ABdhPJyBcEq8UR4k7BH9dDxCOtC6GjVtS9anFYSxZOfHTT1XVJUSHE+D4H1Aavo8XHTuN5g9Lz/bEw==
X-Received: by 2002:ac2:57cd:: with SMTP id k13mr14673604lfo.104.1589292897685; 
 Tue, 12 May 2020 07:14:57 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id t13sm13082211ljd.38.2020.05.12.07.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 07:14:56 -0700 (PDT)
Date: Tue, 12 May 2020 17:14:47 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC v2] drm/connector: Add support for privacy-screen
 properties (v2)
Message-ID: <20200512171447.6de0a6d3@eldfell.localdomain>
In-Reply-To: <d6421971-cff2-9aa7-30c5-9e6d9bea3f62@redhat.com>
References: <20200511174724.21512-1-hdegoede@redhat.com>
 <20200511174724.21512-2-hdegoede@redhat.com>
 <20200512104912.419270ff@eldfell.localdomain>
 <d6421971-cff2-9aa7-30c5-9e6d9bea3f62@redhat.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
Cc: Sonny.Quintanilla@dell.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Mario Limonciello <mario.limonciello@dell.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Jared Dominguez <jaredz@redhat.com>, Rajat Jain <rajatja@google.com>,
 Mark Pearson <mpearson@lenovo.com>
Content-Type: multipart/mixed; boundary="===============0087061582=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0087061582==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/byHpVmRvl6P6/W..5ATg5Eo"; protocol="application/pgp-signature"

--Sig_/byHpVmRvl6P6/W..5ATg5Eo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 12 May 2020 10:02:12 +0200
Hans de Goede <hdegoede@redhat.com> wrote:

> Hi,
>=20
> On 5/12/20 9:49 AM, Pekka Paalanen wrote:
> > On Mon, 11 May 2020 19:47:24 +0200
> > Hans de Goede <hdegoede@redhat.com> wrote:
> >  =20
> >> From: Rajat Jain <rajatja@google.com>
> >>
> >> Add support for generic electronic privacy screen properties, that
> >> can be added by systems that have an integrated EPS.
> >>
> >> Changes in v2 (Hans de Goede)
> >> - Create 2 properties, "privacy-screen sw-state" and
> >>    "privacy-screen hw-state", to deal with devices where the OS might =
be
> >>    locked out of making state changes
> >> - Write kerneldoc explaining how the 2 properties work together, what
> >>    happens when changes to the state are made outside of the DRM code's
> >>    control, etc.
> >>
> >> Signed-off-by: Rajat Jain <rajatja@google.com>
> >> Co-authored-by: Hans de Goede <hdegoede@redhat.com>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>   Documentation/gpu/drm-kms.rst     |   2 +
> >>   drivers/gpu/drm/drm_atomic_uapi.c |   6 ++
> >>   drivers/gpu/drm/drm_connector.c   | 100 ++++++++++++++++++++++++++++=
++
> >>   include/drm/drm_connector.h       |  50 +++++++++++++++
> >>   4 files changed, 158 insertions(+) =20
> >=20
> > ...
> >  =20
> >> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_con=
nector.c
> >> index 644f0ad10671..01360edc2376 100644
> >> --- a/drivers/gpu/drm/drm_connector.c
> >> +++ b/drivers/gpu/drm/drm_connector.c
> >> @@ -1186,6 +1186,45 @@ static const struct drm_prop_enum_list dp_color=
spaces[] =3D {
> >>    *	can also expose this property to external outputs, in which case =
they
> >>    *	must support "None", which should be the default (since external =
screens
> >>    *	have a built-in scaler).
> >> + *
> >> + * privacy-screen sw-state, privacy-screen hw-state:
> >> + *	These 2 optional properties can be used to query the state of the
> >> + *	electronic privacy screen that is available on some displays; and =
in
> >> + *	some cases also control the state. If a driver implements these
> >> + *	properties then both properties must be present.
> >> + *
> >> + *	"privacy-screen hw-state" is read-only and reflects the actual sta=
te
> >> + *	of the privacy-screen, possible values: "Enabled", "Disabled,
> >> + *	"Enabled, locked", "Disabled, locked". The locked states indicate
> >> + *	that the state cannot be changed through the DRM API. E.g. there
> >> + *	might be devices where the firmware-setup options, or a hardware
> >> + *	slider-switch, offer always on / off modes.
> >> + *
> >> + *	"privacy-screen sw-state" can be set to change the privacy-screen =
state
> >> + *	when not locked. In this case the driver must update the hw-state
> >> + *	property to reflect the new state on completion of the commit of t=
he
> >> + *	sw-state property. Setting the sw-state property when the hw-state=
 is
> >> + *	locked must be interpreted by the driver as a request to change the
> >> + *	state to the set state when the hw-state becomes unlocked. E.g. if
> >> + *	"privacy-screen hw-state" is "Enabled, locked" and the sw-state
> >> + *	gets set to "Disabled" followed by the user unlocking the state by
> >> + *	changing the slider-switch position, then the driver must set the
> >> + *	state to "Disabled" upon receiving the unlock event.
> >> + *
> >> + *	In some cases the privacy-screen state might change outside of con=
trol
> >> + *	of the DRM code. E.g. there might be a firmware handled hotkey whi=
ch
> >> + *	toggles the state, or the state might be changed through another =
=20
> >=20
> > Hi,
> >=20
> > in the above three lines, I'd use the term "hardware state" instead of
> > just "state" to be explicit. Or should it be "physical state" since
> > "hardware state" might be confused with "hw-state" property state? =20
>=20
> Maybe "actual state"? That is what is used a few lines higher:
>=20
> '"privacy-screen hw-state" is read-only and reflects the actual state'
>=20
> And you use it yourself to describe what we want below:
>=20
> > I don't mind as long as it's unambiguous and distinguishes explicitly
> > between actual and the two property states. =20
>=20
> So since you and I both naturally described it as "actual state" without
> thinking too much what we where writing at the time (I guess that applies
> to your use too), "actual state" seems a good fit ?

Sure!


Thanks,
pq

--Sig_/byHpVmRvl6P6/W..5ATg5Eo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl66r1cACgkQI1/ltBGq
qqdXjA//RlImrEL4NI13e5AEaKulcxkcRbsxz71JQzK+QCjhizNnOhhtt5wPO4RD
SYEZdA3uX8P/UFgrJcfI+XQCMU4AMk3rMgWD7sbGN9MPw+Wur4eNIUlDH1cEfGcd
N4GQCGXT3h31EtNH1a4oIgIJPCETVMnOvTVcc6CZPv0FRrcQQaKu7F6w3KZkNON6
yoT6BJ3aMek67iP/S9Kn18FXiEPN2qzHK2ji/cfxO1tHHbW13E1EXh60RoXMe7u+
Y8zvQvFAwAes+fGn42EnoIcQsv3XSCyhAfMTdr5yaspM/0RmsP9x+tKxQoTBX02c
7sRbRdMDGAw/x0CqAHqKAYbKuE08CYTMEEYCVurLWNRd4ti0i4lmo4HvCR7I7vsO
tpDUTdkHmmn9MkvQC5MY2DQqINxhpvMSoJvnkDupya/nT6md8yliqBKlA9S7IL7Q
p14lS6ReuZmUR8KMheO2BN2VLeAjMKgJIkXRf8eIUE7yIfRgEmu1CQ+P10Bi/GO2
3WL2mVpJl56e2w/LHv/+7e48i5NnuxZfiMIhfB8LNr1Mhb6Soir1Bh4OTGNVoBMG
tbaznL+ojZCrCr4vIwbEdJHeeQj7sbYgdpGbb72ApZZVLmmRlVX7+bn00UfD2mZC
G0TlxwUS+42sBNZdYwuDtwv4UjBpme6N9zNfYILh0dPgzfGcgZg=
=d7gU
-----END PGP SIGNATURE-----

--Sig_/byHpVmRvl6P6/W..5ATg5Eo--

--===============0087061582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0087061582==--
