Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D455D58085A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 01:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB1C10EEC0;
	Mon, 25 Jul 2022 23:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682A010EECE;
 Mon, 25 Jul 2022 23:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Zt/P3e2xArbvy3gQPjSJj81ryeekwV1xnydX+463/tU=; b=j2SkKjTtAuQo8yx0a4sTbZLuLk
 rRzeGeaiod0i0a95YKX2BuMx19KjeUvm+SXl30WC7pOy63qvSKsEqspXRRi06NIhaqruvmVAZnzlo
 42ovgpEfyqz6GSeHDoREM5DDcHj2yWWqqK5o9pApV+YZ3jfGYPOgGWtJU90f40RIVB8mnqR9GkpXV
 V+1d4GrDEKdk9WvUTxp2H73unAQwZiyTz9748jledQ17Nj2OOdU45EAPo6WatZ6MoKfIfBjzsMkl4
 RkDxoICr/NyoaDL7Bx+2rzm2O+NjpqNYEDUjxx85+XyaELVe+wl1aATMZz5IZpIL+MEw/uv51r6j9
 Qb0hL24Q==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oG7fG-006a7K-P6; Tue, 26 Jul 2022 01:39:06 +0200
Date: Mon, 25 Jul 2022 22:38:53 -0100
From: Melissa Wen <mwen@igalia.com>
To: Magali Lemes <magalilemes00@gmail.com>
Subject: Re: [PATCH 1/2] drm/amd/display: change variables type
Message-ID: <20220725233853.5y7wgpbhfau24ric@mail.igalia.com>
References: <20220725181559.250030-1-magalilemes00@gmail.com>
 <a7589316-2a55-85f2-b665-5fe4bebf7a69@igalia.com>
 <4f359e30-90f8-c8bf-4e07-6856fcfd3506@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kvkmki7ubvlju5ob"
Content-Disposition: inline
In-Reply-To: <4f359e30-90f8-c8bf-4e07-6856fcfd3506@gmail.com>
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
Cc: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 siqueirajordao@riseup.net, mairacanal@riseup.net, sunpeng.li@amd.com,
 tales.aparecida@gmail.com, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 isabbasso@riseup.net, andrealmeid@riseup.net, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kvkmki7ubvlju5ob
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 07/25, Magali Lemes wrote:
>=20
> On 7/25/22 16:42, Andr=E9 Almeida wrote:
> > Hi Magali,
> >=20
> > =C0s 15:15 de 25/07/22, Magali Lemes escreveu:
> > > As "dcn3_15_soc" and "dcn3_16_soc" are of type "struct
> > > _vcs_dpi_soc_bounding_box_st", change their types accordingly.
> > >=20
> > I can see that indeed this type change sense for those variables, but
> > isn't a bit strange that the type was wrong in the first place? I wonder
> > if this variable is even used, given that it would very likely throw a
> > compiler error when using the wrong type and trying to access struct
> > members that aren't defined.
>=20
>=20
> A compilation error would be thrown if either "dc/dcn315/dcn315_resource.=
h"
> or "dc/dcn316/dcn316_resource.h" were included in the files where
> "dcn3_15_soc" and "dcn3_16_soc" are initialized. Since they are not
> included, the wrong variable type error is not shown.
> To solve the sparse warning in the second patch of this series, those
> variables need to be declared first, but they are already declared, we're
> only missing the headers. If I only add the headers, then those variables
> will be seen, and I get the expected incompatible variables types error. =
So,
> fixing the types here is a preliminary work for the next patch.
>=20

Hi Magali,

Thanks for inspecting it. What you say makes sense, but Andr=E9 pointed
out something that makes sense to me too.

As fas as I checked, dcn3_15_soc and dcn16_soc is not used outside their
respective FPU files. Maybe the proper solution is removing those
declarations (and make the struct static). Can you take a look at it?

Best Regards,

Melissa
>=20
> Magali
>=20
>=20
> >=20
> > > Signed-off-by: Magali Lemes <magalilemes00@gmail.com>
> > > ---
> > >   drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h | 2 +-
> > >   drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h | 2 +-
> > >   2 files changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h =
b/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h
> > > index 39929fa67a51..45276317c057 100644
> > > --- a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h
> > > +++ b/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h
> > > @@ -32,7 +32,7 @@
> > >   	container_of(pool, struct dcn315_resource_pool, base)
> > >   extern struct _vcs_dpi_ip_params_st dcn3_15_ip;
> > > -extern struct _vcs_dpi_ip_params_st dcn3_15_soc;
> > > +extern struct _vcs_dpi_soc_bounding_box_st dcn3_15_soc;
> > >   struct dcn315_resource_pool {
> > >   	struct resource_pool base;
> > > diff --git a/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h =
b/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h
> > > index 0dc5a6c13ae7..d2234aac5449 100644
> > > --- a/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h
> > > +++ b/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h
> > > @@ -32,7 +32,7 @@
> > >   	container_of(pool, struct dcn316_resource_pool, base)
> > >   extern struct _vcs_dpi_ip_params_st dcn3_16_ip;
> > > -extern struct _vcs_dpi_ip_params_st dcn3_16_soc;
> > > +extern struct _vcs_dpi_soc_bounding_box_st dcn3_16_soc;
> > >   struct dcn316_resource_pool {
> > >   	struct resource_pool base;

--kvkmki7ubvlju5ob
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmLfKYAACgkQwqF3j0dL
ehzLTQ/+IwJ5XwbEYtQOtKhEkTZqvfj+TLtKF5DGcM4hGBw3WAfajyLZAHPGRGnH
7r4G4evjr8FjsYugkiMuFbu6CyKnEU43stfyhjxrWNujglNopMXmNOUj6e8pEb8M
G9uqf2e/SHEzCSv9vbIrdkeA28dz6TJgyuMG53rf6H/Wh53uxY/Ob8QtlJv2immK
Bmb4NdHThVm0rpNg60rBF3dDHxcPSN7OhXRhVSlhH0m3HYr/zoz4kW3jF/Z9j5bz
yPGgpdaA2gI6l5Za18kyqJc4D7QaSF8Ls/Pejkdv4XXuYW07C4VwKRB3pJzd0gYs
TPoWw2F2vZ5t/1qf9+4aQFGj8yPcwPNS684+ivHiE1/RBZAC05IqRiDfEF+Gnfhj
t0qCuIf9YL23nYXJiEKgj5CxBWQMsdvXMohJbntc17BXOGRPafZIYklqlrAnlWrl
j28dTcHlrzoogvr8pqtxFK0hyYBDyYZN7UBFCLNuuUZZHiUqBY4LFpmvz7Fp135A
mSedlYz8IuNfuqIuM2RnQKjdRuF+j4TSIDZB+qmZuNDV/aMK5uvOsH0J2vS3jBcU
iHXYgxRLA9jHLO2ZNLrMnBx9HGK+zEh9lQn8M0x2b6b47sYeXpH7ugatmO1dLCdU
0GY6fxjhF+sf64alOobfOI+P9WZld9s9Ig/w2/DdOUqlddygrgk=
=4VRc
-----END PGP SIGNATURE-----

--kvkmki7ubvlju5ob--
