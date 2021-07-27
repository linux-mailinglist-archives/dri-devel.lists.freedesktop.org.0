Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABCB3D70C4
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 10:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998EB6E876;
	Tue, 27 Jul 2021 08:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0866E876
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 08:03:24 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id z2so20277542lft.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 01:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=oG2l/hY7+md8LJTbfNJgw1T31crjPJfGKnBSvXreSnU=;
 b=lswTBQK6J9+VpJ1rAfkqLbfZieho9sMwF/xSSCY0DX8FSjEG9hvW6fPD+HsS7GveZD
 MWDjIVIz6SllqVNdBUxdG55rb9N1CWjTpawvYkIyarAxx1nAidTb5kpsT06cI0VeQInB
 S2BQ60bBKlV5aIsBKldlOnRvszBVExJIric9NKVgxRN2eb9YCktdZpjNDnhZbh86Xlae
 jGCVI1xBCJHlNVHef10BLc0iblZkltJtVFD+5psrZyWkIxreur/x8FhkKeNi5zJ8Tyeg
 UiTtlWVECYtcjeHCKLpyriZEuAf5W7MtKGDrly8lNPfb2+pYXovCVghIqCi1kD83VzTm
 qeGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=oG2l/hY7+md8LJTbfNJgw1T31crjPJfGKnBSvXreSnU=;
 b=qcAfazM2XYuKpamHIDuyXJsMJnlwMZIr0ZU39rMxfVhTht0/4G5khO3mZRrDt+B5J9
 FWIWXKbOsNo+JBqD3PswSj3gRq6V+Hixze4IHPUcbUxfzMA4OyNtbCrDDCou0MLqOGJ5
 RX1VzWhSJKTiVhfaOBZtxNk993jngq2vR4gvt9pbdPiaLUX5qmpI22tbia0i/0voBJz9
 PFGE6HVK1baBw+7LXKdQ8qe4ZoPaayeWx5OsQKyZEhOD40Qj6MnGK1OK+jQzrwKwCRhH
 r+qAZHHlKm6NIzAL706ofs7lEe/sqJ13kKJP5x59urY0HL72ryaR0f8WGNZYBQzp3wUm
 T3RA==
X-Gm-Message-State: AOAM53167jSkTSpRsqA618qDwn9KdKpglFpHAYT68rEWtRXLqsmxHdKP
 DwdtsqtTEHA1KdyDpBaNQYc=
X-Google-Smtp-Source: ABdhPJz7HWvEq80IMJZp3Om6ymMDMabkaMrQuZrtlG0kp+SkpcYmjH14+LhuhL7EsBvbdl72EuiThg==
X-Received: by 2002:ac2:48a9:: with SMTP id u9mr15933474lfg.277.1627373002991; 
 Tue, 27 Jul 2021 01:03:22 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id e1sm219183lfn.229.2021.07.27.01.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 01:03:22 -0700 (PDT)
Date: Tue, 27 Jul 2021 11:03:12 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm: add logging for RMFB ioctl
Message-ID: <20210727110312.7902260c@eldfell>
In-Reply-To: <YP8VRU+NDsS276gU@ravnborg.org>
References: <EghsoRDcn1SJV0nxVqRCisPd7v0627yLZbBjn4A8Yg@cp3-web-048.plabs.ch>
 <YP8VRU+NDsS276gU@ravnborg.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bIaEIqtSG1=yKApdh4VQBO=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/bIaEIqtSG1=yKApdh4VQBO=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Jul 2021 22:04:21 +0200
Sam Ravnborg <sam@ravnborg.org> wrote:

> Hi Simon,
>=20
> On Mon, Jul 26, 2021 at 07:49:06AM +0000, Simon Ser wrote:
> > We already have logging for ADDFB2. Add some logging for RMFB as
> > well.
> >=20
> > This can be handy when trying to find out why a CRTC gets magically
> > disabled.
> >=20
> > v2: make log message more explicit, add log messages to
> > drm_framebuffer_remove (Daniel)
> >=20
> > Signed-off-by: Simon Ser <contact@emersion.fr>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch> =20
>=20
> Looks like some very useful debugging logging.
>=20
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Yes indeed!

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/bIaEIqtSG1=yKApdh4VQBO=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmD/vcAACgkQI1/ltBGq
qqcWsQ//fHiiwvXHzrm+LPPl+VPgfeop7Q5ORhjBO1t0LAFz5LvfexlRrZjL2O5Z
l3drUqh+jfOAu3k02krZT1B+a6OUW71xynmIMvrdoseb1J0EbQcNEWaNYHz3BPUB
oA6M9DKRAijugJgfp9WWjoywnLX+n7qe8QJYGWLesnB61ob1TCRGiOB5fB90RCDE
/gd7q6xMSFw+V4g5G9KoDjWKHBw9id5bWHSp9F8WWfiDZ/byNed9sRd5X1Hg0705
sJk5IAjOaVMlv5hgcq2+zkfSRMbxPie3eTXSwc9VbI1X3msKYau3bpIoka3VVj1v
/XWa6Wdvkr52N4RKfQbk2K+sVB1BeJHOHVP9WMCntHKf8wvsqgZF4L+K3IBMxZCw
1yNbl1qB4gvzDEyXWspLmQERTUVixuuZsXDPVYPBdCMDBlC5GGwPADU7f9zq4RXX
yKy5yc+HUsQsJQYeCf+jLXvl56fckVEH/Jol/KRKrZhzMEBfNv6O7yu8JlgEZIb7
Q47FHkLoxWgpkMTZRKvKIDUNaOZBnJ3vd9v0dSpYrrFJXOPsFjZi2IPZ6Ul4etc1
huptiTs/CSNGc7V4QYlWqrwcijaicnnWGXxpa+kQJ39dILXeTfNxrOg0stKPs12L
6dOnZRSRqeq0LPWjgOx+zWYJJDMpiWSjOJRRpzqUPCZHtJXneZA=
=tk+d
-----END PGP SIGNATURE-----

--Sig_/bIaEIqtSG1=yKApdh4VQBO=--
