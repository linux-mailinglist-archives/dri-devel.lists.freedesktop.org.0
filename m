Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C59CA552CF
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 18:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BFA10EA35;
	Thu,  6 Mar 2025 17:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k2HQDWII";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0122010EA35
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 17:20:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8AB67A44F5E;
 Thu,  6 Mar 2025 17:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82FB6C4CEE0;
 Thu,  6 Mar 2025 17:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741281641;
 bh=wBQrFkccoLNKzdS8ILzs3KY+o3I3a5Wty8xau+DEjDk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k2HQDWIIdXthpvoBQc1ZnZ62bkc+zTsA3e76yUv0Ea7wxwAkj1KJ4K9i0nFRcx47o
 eyUCexc61D7sfJceMNKXnol297ddZpBcMJQ4ZU9sJi8oQ0u4cQr+S/wqynLb8tSRbB
 kfGs4gsrW4c4fyFCI5492lHNrAXBT0ZlS/XsfnSBn/eXB+M0620iPD7afqWTnSZMX8
 fgbGNFXRRqB9vwXBvr8UsV+hSSgD7z7ZRnSExQdsXrK+72j2GkoaU0ccqg2MwBRQSL
 G2W+YoxuaNoqsHG19AakiXF2tjitQZY7voXka5VduCAJWqa+vROeB34DsWsawxHovR
 wiu7fD8VSBMSw==
Date: Thu, 6 Mar 2025 18:20:39 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Tejas Vipin <tejasvipin76@gmail.com>, Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] drm/panel/synaptics-r63353: Use _multi variants
Message-ID: <20250306-brave-wonderful-sambar-3d0bc5@houat>
References: <20250305-mipi-synaptic-1-v1-1-92017cd19ef6@redhat.com>
 <20250306-clever-lime-tanuki-e2fc43@houat>
 <CAN9Xe3SDyC47HWww1eH63aZOiM-WF9BGxztM3yh9bf6ORuY7VA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="a2tzjc6usivaxcnz"
Content-Disposition: inline
In-Reply-To: <CAN9Xe3SDyC47HWww1eH63aZOiM-WF9BGxztM3yh9bf6ORuY7VA@mail.gmail.com>
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


--a2tzjc6usivaxcnz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/panel/synaptics-r63353: Use _multi variants
MIME-Version: 1.0

On Thu, Mar 06, 2025 at 10:08:24AM -0500, Anusha Srivatsa wrote:
> On Thu, Mar 6, 2025 at 4:31=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
>=20
> > Hi Anusha,
> >
> > On Wed, Mar 05, 2025 at 07:01:41PM -0500, Anusha Srivatsa wrote:
> > > Move away from using deprecated API and use _multi
> > > variants if available. Use mipi_dsi_msleep()
> > > and mipi_dsi_usleep_range() instead of msleep()
> > > and usleep_range() respectively.
> > >
> > > Used Coccinelle to find the multiple occurences.
> > > SmPl patch:
> > > @rule@
> > > identifier dsi_var;
> > > identifier r;
> > > identifier func;
> > > type t;
> > > position p;
> > > expression dsi_device;
> > > expression list es;
> > > @@
> > > t func(...) {
> > > ...
> > > struct mipi_dsi_device *dsi_var =3D dsi_device;
> > > +struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi_var };
> > > <+...
> > > (
> > > -mipi_dsi_dcs_write_seq(dsi_var,es)@p;
> > > +mipi_dsi_dcs_write_seq_multi(&dsi_ctx,es);
> > > |
> > > -mipi_dsi_generic_write_seq(dsi_var,es)@p;
> > > +mipi_dsi_generic_write_seq_multi(&dsi_ctx,es);
> > > |
> > > -mipi_dsi_generic_write(dsi_var,es)@p;
> > > +mipi_dsi_generic_write_multi(&dsi_ctx,es);
> > > |
> > > -r =3D mipi_dsi_dcs_nop(dsi_var)@p;
> > > +mipi_dsi_dcs_nop_multi(&dsi_ctx);
> > > |
> > > ....rest of API
> > > ..
> > > )
> > > -if(r < 0) {
> > > -...
> > > -}
> > > ...+>
> >
> > The point of sending a single patch was to review the coccinelle script,
> > so you must put the entire script you used here.
>
> I was actually thinking of sending patches per driver this time around
> since Tejas also seems to be looking into similar parts....Thoughts?

Not really?

The point of doing it with one driver was to make sure the coccinelle
script was fine before rolling it to other drivers. And actually, it
doesn't really matter: the whole point of putting the script in the
commit log is to be able to review and document the script you used. If
you're not going to put the one you used, it's kind of pointless.

And yeah, you should absolutely sync with Tejas, but it's unrelated to
coccinelle.

Maxime

--a2tzjc6usivaxcnz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ8nZZgAKCRDj7w1vZxhR
xW3gAP90FBgkKfaIjre5FofZma/Apts2Ots6x06y7OCa4t1ZPgEAjoZOTj20Ifa1
NHwlSK9hDMf0DG8pbUsU6LwJaOaV9g8=
=WpR3
-----END PGP SIGNATURE-----

--a2tzjc6usivaxcnz--
