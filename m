Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD61685F300
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 09:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D5D10E8BE;
	Thu, 22 Feb 2024 08:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F8dz2Yh8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D96D10E8BA;
 Thu, 22 Feb 2024 08:32:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 79F9661735;
 Thu, 22 Feb 2024 08:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C776AC433C7;
 Thu, 22 Feb 2024 08:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708590732;
 bh=N7a5IF82ize/+pzYCn6kEa3/rgM3v7OL3ujPEwZlvg8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F8dz2Yh8UDjroLtHv0F9r3QcElMUbyQi+Y1f9K48WIJjH0DM7VWXyWr6NBgBE4kVx
 yUv8+iKVg02/jHN029nS3NsIwpi2qGin7BZuGxBsF6BT/P9WiTCQW7niaAuWJkf9hN
 r5g2DsWl7+53idn3FLJ4xMx1dd+uqZIC5boLQTRmoyRWkiTf9yTDC87IKLuo0BIyH5
 2wFn/ljKYkZhjV65XsYnRRmNhGJst7R6znw64oeB/qiBWhgjPSECUicSYSn1GZPKoa
 MHyDfYFyoeQt3LUENvnhPx8y04eXRsKWlxqkmiHD7V0a9jfF8pfjtf1qncVr4eMhpW
 2EBRboHk9q+ow==
Date: Thu, 22 Feb 2024 09:32:09 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, 
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <4hdbpzyab7djy7gxsn6qjhgmr3qczstfgwhefgar4nuxohajdq@5hn6m3b4m64n>
References: <20240222124610.383e1ce3@canb.auug.org.au>
 <TYCPR01MB11269B83A59650E230F4DD97F86562@TYCPR01MB11269.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="27unys4ydult4g2a"
Content-Disposition: inline
In-Reply-To: <TYCPR01MB11269B83A59650E230F4DD97F86562@TYCPR01MB11269.jpnprd01.prod.outlook.com>
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


--27unys4ydult4g2a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Thu, Feb 22, 2024 at 08:14:14AM +0000, Biju Das wrote:
> > -----Original Message-----
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Sent: Thursday, February 22, 2024 1:46 AM
> > Subject: linux-next: build failure after merge of the drm-misc tree
> >=20
> > Hi all,
> >=20
> > After merging the drm-misc tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:47:6: error: redefinition =
of
> > 'rzg2l_du_vsp_enable'
> >    47 | void rzg2l_du_vsp_enable(struct rzg2l_du_crtc *crtc)
> >       |      ^~~~~~~~~~~~~~~~~~~
> > In file included from drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h:18,
> >                  from drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:30:
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:72:20: note: previous
> > definition of 'rzg2l_du_vsp_enable' with type 'void(struct rzg2l_du_crtc
> > *)'
> >    72 | static inline void rzg2l_du_vsp_enable(struct rzg2l_du_crtc *cr=
tc)
> > { };
> >       |                    ^~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:61:6: error: redefinition =
of
> > 'rzg2l_du_vsp_disable'
> >    61 | void rzg2l_du_vsp_disable(struct rzg2l_du_crtc *crtc)
> >       |      ^~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:73:20: note: previous
> > definition of 'rzg2l_du_vsp_disable' with type 'void(struct rzg2l_du_cr=
tc
> > *)'
> >    73 | static inline void rzg2l_du_vsp_disable(struct rzg2l_du_crtc
> > *crtc) { };
> >       |                    ^~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:66:6: error: redefinition =
of
> > 'rzg2l_du_vsp_atomic_flush'
> >    66 | void rzg2l_du_vsp_atomic_flush(struct rzg2l_du_crtc *crtc)
> >       |      ^~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:74:20: note: previous
> > definition of 'rzg2l_du_vsp_atomic_flush' with type 'void(struct
> > rzg2l_du_crtc *)'
> >    74 | static inline void rzg2l_du_vsp_atomic_flush(struct rzg2l_du_cr=
tc
> > *crtc) { };
> >       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:76:19: error: redefinition=
 of
> > 'rzg2l_du_vsp_get_drm_plane'
> >    76 | struct drm_plane *rzg2l_du_vsp_get_drm_plane(struct rzg2l_du_cr=
tc
> > *crtc,
> >       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:75:33: note: previous
> > definition of 'rzg2l_du_vsp_get_drm_plane' with type 'struct drm_plane
> > *(struct rzg2l_du_crtc *, unsigned int)'
> >    75 | static inline struct drm_plane *rzg2l_du_vsp_get_drm_plane(stru=
ct
> > rzg2l_du_crtc *crtc,
> >       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:302:5: error: redefinition=
 of
> > 'rzg2l_du_vsp_init'
> >   302 | int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_n=
ode
> > *np,
> >       |     ^~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:66:19: note: previous
> > definition of 'rzg2l_du_vsp_init' with type 'int(struct rzg2l_du_vsp *,
> > struct device_node *, unsigned int)'
> >    66 | static inline int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp,
> > struct device_node *np,
> >       |                   ^~~~~~~~~~~~~~~~~
> >=20
> > Caused by commit
> >=20
> >   768e9e61b3b9 ("drm: renesas: Add RZ/G2L DU Support")
> >=20
> > I have used the drm-misc tree from next-20240221 for today.
>=20
> I will send an incremental patch to fix this build error with x86 on drm-=
next.

Any chance you can do it today? We need to send the drm-misc-next PR.

Maxime

--27unys4ydult4g2a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZdcGiAAKCRDj7w1vZxhR
xeWEAQDsnNF+oM0G4cjC34BmXGz+r23Jn7SE6VAbXNQULFhk2QD9FOJWgAdMVDMF
iQ8KOfo32ZmEWCJgyT0sNdl2ytAtVwI=
=zRxw
-----END PGP SIGNATURE-----

--27unys4ydult4g2a--
