Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56698399C3D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 10:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F8F6F41C;
	Thu,  3 Jun 2021 08:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141A16F41C;
 Thu,  3 Jun 2021 08:05:41 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id i9so7451701lfe.13;
 Thu, 03 Jun 2021 01:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=Qjlzl7LKAJKi8TUo9KnlRb8pzUxi6orV6bBvxpPrnLA=;
 b=RtcnG8cLpdUdwWSza30NsCnZRL6mXDE+x/JANlIJm20Yl2inTU2/m2qoFgC+qKNyiD
 tAezYDMsO+wrxrdRnrUTfKw0Jbx5xue7mYwFhb5o5QWvZq0EBYbagdvnf7/C72Hu2ZxZ
 a23gdj7mEXEiB9FePuONDZgx57V+k9kEQ2HfP2m4BHdtrAPlkKckH3r5S1xwye9tncue
 VwZUOnYhtjGEQ+aF/PT7c/iUf8hXogb3mHFwB5FbUuG7fczMo2bAF1Pl5rBV2vcaW+bO
 dR1ltLU3OUIKajvYXmHYbgUr2FiKlF1mWeF6ptDQx62UtlWPzoD7HIXih4Yr74+zZlAF
 i/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Qjlzl7LKAJKi8TUo9KnlRb8pzUxi6orV6bBvxpPrnLA=;
 b=oKUV5RtbGb7qDf/uRkOBY/Mb9agYFjQVztX0u9sO25GLep89OkXzaMoIzhQ2N58mEx
 b9Cihh4WYW35lo3y+uT85mz0ofse92I/TLyvW5Q/ZIheHhG7a13nyX7O++qF+wx/Lj6k
 e+9M+iDfJEetCbQEX3MRcVxP48T1kiiZ5iLGmf4NIs0spsmzX22WG5vTWa6IWhkKLCSz
 e2HjOQGmXhjzHj0xZGZlRDBlK7YitymN0rJKCS/Y4RN5i7W5iObJna6eO0ZlIAlOeQ+k
 r0AYz0xqUwhuDf+nEyE9IvlAUEX4sTadlJ5WEnikENMw9dItRADSd75ib26OrWYFdpUD
 z+2A==
X-Gm-Message-State: AOAM532z6w3SYROROm0RmDjdpB0Wdp3oxt54rj0URgMHXZJ9KDSBa6sO
 PmXEVqIxrzYpAl6nzoRpbO0=
X-Google-Smtp-Source: ABdhPJx5fVz/7fYZXZYji0VvPOBKEqTHc5qekvk0fccj1TVB04EHKVXaOzHn5+F546qyaNh3R+31Ew==
X-Received: by 2002:a05:6512:c02:: with SMTP id
 z2mr456476lfu.303.1622707539454; 
 Thu, 03 Jun 2021 01:05:39 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id a22sm298152ljp.72.2021.06.03.01.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 01:05:39 -0700 (PDT)
Date: Thu, 3 Jun 2021 11:05:27 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Shankar, Uma" <uma.shankar@intel.com>
Subject: Re: [PATCH 1/9] drm: Add gamma mode property
Message-ID: <20210603110527.39ead45e@eldfell>
In-Reply-To: <33e9b79a413346309519f2a2499de367@intel.com>
References: <20210601104135.29020-1-uma.shankar@intel.com>
 <20210601104135.29020-2-uma.shankar@intel.com>
 <20210602120957.7a154640@eldfell>
 <33e9b79a413346309519f2a2499de367@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/sh8hlzAqrJ2W8d.HBkYXJrA"; protocol="application/pgp-signature"
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Modem,
 Bhanuprakash" <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/sh8hlzAqrJ2W8d.HBkYXJrA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 2 Jun 2021 20:18:19 +0000
"Shankar, Uma" <uma.shankar@intel.com> wrote:

> > -----Original Message-----
> > From: Pekka Paalanen <ppaalanen@gmail.com>
> > Sent: Wednesday, June 2, 2021 2:40 PM
> > To: Shankar, Uma <uma.shankar@intel.com>
> > Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; M=
odem,
> > Bhanuprakash <bhanuprakash.modem@intel.com>
> > Subject: Re: [PATCH 1/9] drm: Add gamma mode property
> >=20
> > On Tue,  1 Jun 2021 16:11:27 +0530
> > Uma Shankar <uma.shankar@intel.com> wrote:
> >  =20
> > > Add a gamma mode property to enable various kind of gamma modes
> > > supported by platforms like: Interpolated, Split, Multi Segmented,
> > > Logarithmic etc. Userspace can get this property and should be able to
> > > get the platform capabilities wrt various gamma modes possible and the
> > > possible ranges.
> > >
> > > It can select one of the modes exposed as blob_id as an enum and set
> > > the respective mode.
> > >
> > > It can then create the LUT and send it to driver using already
> > > available GAMMA_LUT property as blob.
> > >
> > > Note: This is based on design by Ville and is being carried forward
> > > based on his original idea.
> > >
> > > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_atomic_uapi.c |  5 +++
> > > drivers/gpu/drm/drm_color_mgmt.c  | 75 +++++++++++++++++++++++++++++++
> > >  include/drm/drm_color_mgmt.h      |  8 ++++
> > >  include/drm/drm_crtc.h            | 14 ++++++
> > >  include/uapi/drm/drm_mode.h       | 43 ++++++++++++++++++
> > >  5 files changed, 145 insertions(+)

...

> > Hi,
> >=20
> > where is the UAPI documentation for this new GAMMA_MODE?
> > As a userspace dev, I have no idea what to do with the above based on w=
hat's
> > written here. =20
>=20
> Got that, I will add more details on the UAPI usage to make things a bit =
clearer.
>=20
> > Also, reading the description of DRM_CLIENT_CAP_ADVANCE_GAMMA_MODES in
> > patch 5/9, what difference does it make whether userspace sets or does =
not set that
> > cap? I don't understand the implications from the description. =20
>=20
> The reason we have this Client caps is to have it co-exist with legacy cr=
tc color properties.
> The idea is that driver will describe the h/w luts to userspace through G=
AMMA_MODE UAPI,
> but the actual lut samples will still be sent through the legacy GAMMA_LU=
T UAPI. This client
> cap will help distinguish between legacy and this new implementation.
>=20
> I will add more details in the UAPI description to avoid ambiguity and ex=
plain the rationale and
> usage of this UAPI.
>=20
> Thanks Pekka for the looking into the series and the initial feedback.

Thanks a lot, will be interesting to read those docs.
pq

--Sig_/sh8hlzAqrJ2W8d.HBkYXJrA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmC4jUcACgkQI1/ltBGq
qqe2gQ//ZKWcS5z202c8pnPboJV49xzTEU2lRyfWxc1qxMyvx1LzIlZI3AhQCCod
qzp8LvVf7zM+U5XmKKRRDV5H0SCCDkOGUxXb5ijOLFfPRZiyimacrOZrxobaUfK1
418Qc41tuwQwWJCaCBd9xUniSBE8HbGo9bWlZ2OhYc1sC4W1KeAYd3/htKyWGbiK
qjxuUan0wSXBReEXRSbcXW7/gkWEaXe2JYHyjJ/9nr0L9TtqMuT8fEfW55/ZnZiY
ENYBsECYIlkd3FcBtaSiZ0M4DQVnmqRdv7YBrpdWZttrjY9QmySomaZlL6ELs2LG
wHXJKznGWq+PcxhiaNieQ8caQCwmpAsDkCUFgDlcJS2H79YgibBfzdnGtufVJPmb
CwBx6ZZgbS/CEXvNziJ0+cP2PWdScreNs/l6WhwEcWSSJJHaH77Y0kRarGWod7sB
PU+wAOGGmOSnCIGAirYAfuCGp7sGXJqijHtrlKp9QfSoGcYkcBBfuzoFTbgIL/zC
2kwVrb3xjvDab2yMHAo8/sAIyrFfGsGNILyyrY9Il8usbcCD4ZPZ7ldbT+KeZAvi
fs8c8pmDcFbXi7C78kNpjdXPH8zTlct2YRfcrAWmuWwsnP7MkJHVvRKPLqDeiOi7
9AZlBOm+r64NUdEimeU/ZxGmkq44Eo1eM9h/RqkBkvt11VEm+UU=
=kr+R
-----END PGP SIGNATURE-----

--Sig_/sh8hlzAqrJ2W8d.HBkYXJrA--
