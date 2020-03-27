Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFEA195A28
	for <lists+dri-devel@lfdr.de>; Fri, 27 Mar 2020 16:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2410D6EA51;
	Fri, 27 Mar 2020 15:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 943996EA51
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 15:45:10 +0000 (UTC)
Received: from localhost (p54B3358F.dip0.t-ipconnect.de [84.179.53.143])
 by pokefinder.org (Postfix) with ESMTPSA id 232922C08B2;
 Fri, 27 Mar 2020 16:45:10 +0100 (CET)
Date: Fri, 27 Mar 2020 16:45:09 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 6/6] drm/radeon: convert to use i2c_new_client_device()
Message-ID: <20200327154509.GB3971@ninjato>
References: <20200326211005.13301-1-wsa+renesas@sang-engineering.com>
 <20200326211005.13301-7-wsa+renesas@sang-engineering.com>
 <CADnq5_P07b-A-VawLTgiTMSdifxMbWS5kgQV_+0Bw2x_DQHATQ@mail.gmail.com>
 <20200327152535.GA2191@ravnborg.org>
 <CADnq5_O-pXK1FeT1NfGBdXYZbqF6jmyXJNPgJt5qLaYMLiZy_Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADnq5_O-pXK1FeT1NfGBdXYZbqF6jmyXJNPgJt5qLaYMLiZy_Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Linux I2C <linux-i2c@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0911330998=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0911330998==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O5XBE6gyVG5Rl6Rj"
Content-Disposition: inline


--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > > Move away from the deprecated API.
> > > >
> > > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > >
> > > patches 1,6, are:
> > > Acked-by: Alex Deucher <alexander.deucher@amd.com>
> > Should we commit all to drm-misc-next?
>=20
> I'm fine to see it go through whatever tree makes sense.

I'd suggest drm-misc-next to minimize merge conflicts. But I can take it
via I2C tree, too, if desired.


--O5XBE6gyVG5Rl6Rj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5+H4UACgkQFA3kzBSg
Kbbt+Q//bZmtiJw258S5u6Dib6o4qV/VfaFTecO/PvxGk7gMFCCwd1iJJV90BTv9
pv5FqyUDeC8s1JiBGAzYiN+d9sAY065o018UaHyWuNGLrvypL6e/xMQdDUcfIsZD
ICbJAUtvmRHAtq3XkvBSCh/aPM/uQi6wDZcm6UL6WQMjL7qRGeY24d68IVP2OBWX
oliHQMrxDd2A/Xe5znga31ByTC3cB31rhDNHrUBoModp6gMYQB3aHGf1m+QPnjFQ
tUwnN7ECc9hlJxj/6ok7faDT+DtDNoxdMpKLM2s04O39WQUgFlz0YAinDLblifqZ
65+pV/wGqT3NP8P6gljisJiENeMh5TH/02XWAxd2NbDwfEarG8RIEI8oOACEzC7J
FH/qaxGlY1Es+JHDtCltSxVLT9+XtB3Te2t5+R5lTcRpCdoiomvrHD9nLaXKOx5Q
4YZTDn8ybrnSMd0UOwH+tqYYnXUhfISC/r89ISFsnMJAay8RzAo9lDhr8sD5QtDj
H1mw/CuVktYfzdXXOYOCvnVh+5+rzvMd6pQb1BfBqxyGkRsMemKBzTTf9+Xfbp1t
pKu+DyiKAyjorKj0J4mNwBhEIKeGLkgkTvgzi8tp7PSNPveh2lSfDaUq0IS18cN0
4RKx8WZP/O+SQX5sHKtI4AeFJegLNVbHAkeV9afQ0Z0QnvxNwFo=
=6umv
-----END PGP SIGNATURE-----

--O5XBE6gyVG5Rl6Rj--

--===============0911330998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0911330998==--
