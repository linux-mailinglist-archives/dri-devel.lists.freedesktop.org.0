Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19280547FD1
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 08:55:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66EFC10E190;
	Mon, 13 Jun 2022 06:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7E510E190
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 06:54:57 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1o0dyH-0000QP-4Z; Mon, 13 Jun 2022 08:54:45 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o0dyG-000FHU-7y; Mon, 13 Jun 2022 08:54:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o0dyE-00Fz7Y-95; Mon, 13 Jun 2022 08:54:42 +0200
Date: Mon, 13 Jun 2022 08:54:40 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH v3 2/2] drm: bridge: Add TI DLPC3433 DSI to DMD bridge
Message-ID: <20220613065440.2vjccaixikrayvhy@pengutronix.de>
References: <20220603140349.3563612-1-jagan@amarulasolutions.com>
 <20220603140349.3563612-2-jagan@amarulasolutions.com>
 <CAG3jFyt3TwirBUbf+Zu0xuc7z+CBV8nqin0SVxVzZ7_2Qwx-vg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7zzbapx7jiwfpevh"
Content-Disposition: inline
In-Reply-To: <CAG3jFyt3TwirBUbf+Zu0xuc7z+CBV8nqin0SVxVzZ7_2Qwx-vg@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org, Christopher Vollo <chris@renewoutreach.org>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-amarula@amarulasolutions.com,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7zzbapx7jiwfpevh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Jun 03, 2022 at 04:37:51PM +0200, Robert Foss wrote:
> On Fri, 3 Jun 2022 at 16:04, Jagan Teki <jagan@amarulasolutions.com> wrot=
e:
> > +static int dlpc3433_remove(struct i2c_client *client)
> > +{
> > +       struct dlpc *dlpc =3D i2c_get_clientdata(client);
> > +
> > +       drm_bridge_remove(&dlpc->bridge);
> > +       of_node_put(dlpc->host_node);
> > +
> > +       return 0;
> > +}
> > + [...]
> > +static struct i2c_driver dlpc3433_driver =3D {
> > +       .probe_new =3D dlpc3433_probe,
> > +       .remove =3D dlpc3433_remove,
> > +       .id_table =3D dlpc3433_id,
> > +       .driver =3D {
> > +               .name =3D "ti-dlpc3433",
> > +               .of_match_table =3D dlpc3433_match_table,
> > +       },
> > +};
> > +module_i2c_driver(dlpc3433_driver);
>=20
> Applied to drm-misc-next.

just a quick note that there is an easy conflict between this patch and
my effort to make i2c remove callbacks return void. I intend to post my
series on top of v5.20-rc1, so if this patch goes in before, everything
is fine.

See
https://lore.kernel.org/linux-i2c/20220609091018.q52fhowlsdbdkct5@pengutron=
ix.de/
for some more details.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--7zzbapx7jiwfpevh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKm3ywACgkQwfwUeK3K
7AnabAf/X/oSsZpM9JxCRjMVlq5KKzcTRkez4HeVTkYGWiG3O1fL+TjuvGTkYZ48
YpoSz2U6epz0bVRj/IuSZkmh5Pg/dXSSzYv+RhSSSGzF0XSihGkrItnVK5S9r+dl
l4WibdSVE3he1EhMk0dbMRYbpo/mAajMsGsWlY1k9cCP21hZbFcCpI1OsbgTgw0U
BVTXCQFpy2OqbIwug15754e3dbS1B0mmTcp9sNWiSY1ZZ7B/LcOtB6dePVkOXaba
ySRB/h378863X0D869Mcj1H+e1jw8iiRAFP0mdYRpjUYkrK0Bh4kHAxfQGdd5Ez3
bEgmWpwZ40yrQyypYJcd1qh6SgMkpg==
=Izfm
-----END PGP SIGNATURE-----

--7zzbapx7jiwfpevh--
