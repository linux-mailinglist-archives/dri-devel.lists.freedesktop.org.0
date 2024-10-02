Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D576C98D0C2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 12:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D0210E6EB;
	Wed,  2 Oct 2024 10:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ucw.cz header.i=@ucw.cz header.b="loAw3P46";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C461310E6EB
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 10:05:36 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 847221C00AB; Wed,  2 Oct 2024 12:05:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1727863535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VfuiRXRY0wqydTeH0MWxTZk7em8PH+gby0u5eY1neME=;
 b=loAw3P467BCPE5Xmcz+Cvm2i8cXLQNjKYOguqWLT1/a8DJaWWP/ZC13lXWSVUM20zOFEoF
 p+S9LPmrCK3eWvm7E35hH7fgBTjTH+FOPUsC8zPG7riywLgPRk29wK4EucUhx8I8Nqnh1w
 2ZBF/AdSECKVIHnzJ17VkehK06yfdKY=
Date: Wed, 2 Oct 2024 12:05:34 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
 Hans de Goede <hdegoede@redhat.com>, bentiss@kernel.org,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org,
 onitake@gmail.com, cs@tuxedo.de, platform-driver-x86@vger.kernel.org
Subject: Re: [RFC PATCH v4 1/1] platform/x86/tuxedo: Add virtual LampArray
 for TUXEDO NB04 devices
Message-ID: <Zv0a7pUQlZP44aB5@duo.ucw.cz>
References: <20241001180658.76396-1-wse@tuxedocomputers.com>
 <20241001180658.76396-2-wse@tuxedocomputers.com>
 <bc3f5f2b-252e-0a66-df0f-f01197a5a17d@linux.intel.com>
 <Zv0YlxQOFVGRS/DB@duo.ucw.cz>
 <c2694d50-db7c-84ee-288a-06802e10ca8d@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="/5H51XUMUCryMJ4/"
Content-Disposition: inline
In-Reply-To: <c2694d50-db7c-84ee-288a-06802e10ca8d@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--/5H51XUMUCryMJ4/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2024-10-02 13:01:05, Ilpo J=E4rvinen wrote:
> On Wed, 2 Oct 2024, Pavel Machek wrote:
>=20
> > Hi!
> >=20
> > > > +static struct wmi_driver tuxedo_nb04_wmi_ab_driver =3D {
> > > > +	.driver =3D {
> > > > +		.name =3D "tuxedo_nb04_wmi_ab",
> > > > +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> > > > +	},
> > > > +	.id_table =3D tuxedo_nb04_wmi_ab_device_ids,
> > > > +	.probe =3D probe,
> > > > +	.remove =3D remove,
> > > > +	.no_singleton =3D true,
> > > > +};
> > > > +
> > > > +// We don't know if the WMI API is stable and how unique the GUID =
is for this ODM. To be on the safe
> > > > +// side we therefore only run this driver on tested devices define=
d by this list.
> > >=20
> > > Please limit comment length to 80 chars and since you need multiple l=
ines=20
> > > here anyway, use the usual /* */ multiline comment formatting.
> >=20
> > This driver needs to be split into generic part + hw specific part,
> > and reasonable kernel/user API needs to be defined for the generic
> > part. It is really too soon to tweak comment lengths.
>=20
> Coding style is not something you add on top of everything after=20
> everything else is done. It's much better to start with that right from=
=20
> the beginning.

And yes, this driver leaves something to be desired.

OTOH if you comment on coding style only, it leaves impression of
"everything else is ok with this", which easily leads to wasted work
and frustration.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--/5H51XUMUCryMJ4/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZv0a7gAKCRAw5/Bqldv6
8jInAKCTO0pfGpRohULY7qmHpbryLYpGAgCgvtfw76lxVOS/qGSzcnI5XQM7r6c=
=nnrN
-----END PGP SIGNATURE-----

--/5H51XUMUCryMJ4/--
