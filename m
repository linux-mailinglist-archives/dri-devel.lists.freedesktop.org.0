Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 536AC6FCB45
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 18:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C4E310E163;
	Tue,  9 May 2023 16:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC2C10E163;
 Tue,  9 May 2023 16:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=umBookDemeoalHamsv8AZ2MJb2TmDf6VcIWK2LC8sLc=; b=U3BjdybmtLfGVat1+g1gDq+mTW
 XscXq9u4snCPKWvn54qlifvgdqn9ELugIbfXA42OlAinDR1tGuIiOxn9jnrVkQaqy2IL5DpkiSae/
 Lmh8iET2bHL0ls97M4y6be7KGgy7UKXANmay381QI9avFAv3pnpDYM++X0peIncYgpXSdyXs5aF30
 9uXyM2iqMTpY+/9KF0SVliE/9IjTeEg3hx9HM3aGXn3pxMtIA7KBcu6MWZbfQ42nXQFDX0eC3DZ8W
 uup37cFTQUvqRhYAL02MMAEwNn6/J0LGbcJ+EXjpfbUA7UlsaT075PjxUM2uXLlUXmohZTQbdJDcp
 8mYygYVg==;
Received: from [38.44.72.37] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pwQA5-00529q-JE; Tue, 09 May 2023 18:26:01 +0200
Date: Tue, 9 May 2023 15:23:53 -0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 03/40] drm/amd/display: introduce Steam Deck color
 features to AMD display driver
Message-ID: <20230509162353.7hak3fda43fim3ho@mail.igalia.com>
References: <20230423141051.702990-1-mwen@igalia.com>
 <20230423141051.702990-4-mwen@igalia.com>
 <613b2431-7d05-fb44-25d7-dba59e5eca3c@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yujgcwrfuecqavuz"
Content-Disposition: inline
In-Reply-To: <613b2431-7d05-fb44-25d7-dba59e5eca3c@amd.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, sunpeng.li@amd.com,
 linux-kernel@vger.kernel.org, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--yujgcwrfuecqavuz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 05/08, Harry Wentland wrote:
> On 4/23/23 10:10, Melissa Wen wrote:
> > We are enabling a large set of color calibration features to enhance KMS
> > color mgmt but these properties are specific of AMD display HW, and
> > cannot be provided by other vendors. Therefore, set a config option to
> > enable AMD driver-private properties used on Steam Deck color mgmt
> > pipeline.
> >=20
> > Co-developed-by: Joshua Ashton <joshua@froggi.es>
> > Signed-off-by: Joshua Ashton <joshua@froggi.es>
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >  drivers/gpu/drm/amd/display/Kconfig | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/=
display/Kconfig
> > index 06b438217c61..c45a8deb1098 100644
> > --- a/drivers/gpu/drm/amd/display/Kconfig
> > +++ b/drivers/gpu/drm/amd/display/Kconfig
> > @@ -53,5 +53,11 @@ config DRM_AMD_SECURE_DISPLAY
> >              of crc of specific region via debugfs.
> >              Cooperate with specific DMCU FW.
> > =20
> > +config STEAM_DECK
> > +	bool "Enable color calibration features for Steam Deck"
> > +	depends on DRM_AMD_DC
> > +	help
> > +	  Choose this option if you want to use AMDGPU features for broader
> > +	  color management support on Steam Deck.
> > =20
>=20
> If we can drop this (i.e. don't offer a CONFIG_ option to allow enablemen=
t of
> the uAPI, but build with -DCONFIG_STEAM_DECK) it would go a long way to k=
eep
> us from requiring to support this forever.

I see, I'll follow this path. Still on that, I've changed
CONFIG_STEAM_DECK (too generic) to CONFIG_DRM_AMD_COLOR_STEAMDECK.
Does it sound better?

Thanks,

Melissa

>=20
> Harry
>=20
> >  endmenu
>=20
>=20

--yujgcwrfuecqavuz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmRac4QACgkQwqF3j0dL
ehyZUg/9EUF7RDeBqh4Z7iHKcSDPhygavmOUO9Q2SiahN7VzbsG4uNw9A44fGPhA
YdgJ8uxv+0p0a6rindUAvBZp0ktVFhZR44nK5yyN6OD9nnjjot/NVyGoloOyuH3p
s86locDBuRzQkbnExzIdF4tzp7WImNcftseS8+9sCrbb66L5pQlJHXe4t0AdnQnE
fNZOQ7F3vxCll+R+aCEIyFcJb4NzM28zWhBN0M3cItkdXyoFS49wH9P+2o9NoPcS
aoQdt9wJ2+Q4eB4QxP3r5h90U5vvnmDwFln+/eVQH+uJWAuNiHvutFSiBXjCtJa8
BsuiTw0D2YpgkQbsxkZ9XRQ/3hOi1lLXIW6Olom4/lkfG9xI8+xbPOXDY2Rb5ap8
P5L4ziM6C/5mWAhVi9H5ufUV4V+jzYgR/a7UVpc9rLQ35ELKqr7vEMXIlXtIYb2z
EoI9XETyaMewVGr14tY5vq+sr3h7NW6YczmykVGXPpkQgWXVA2+Tqg7qdBnWCgQ7
qkNyX8nK8nJ/H+QGUDuK7oS2IjI25KPvSXcZHmL0wcM7gWlQYho9yjlw3Elsjy+6
bbP3YzwGXqpZZTh7WxpFDXCEvT5NAiLp9UQVKanRfqgYbpXMgC5uW9sbnDVtxUKf
/RDwn0tjLy4SrVj25WGHzrgS7ZrwnmXjtKyQagRmFfK5XSJb+Ds=
=H7Ao
-----END PGP SIGNATURE-----

--yujgcwrfuecqavuz--
