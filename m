Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C15D52EFF41
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jan 2021 12:47:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C65AF6E948;
	Sat,  9 Jan 2021 11:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66CCC6E8D0
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 21:54:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 2A8EB1F46C99
Received: by earth.universe (Postfix, from userid 1000)
 id 1FEB03C0C94; Fri,  8 Jan 2021 22:54:45 +0100 (CET)
Date: Fri, 8 Jan 2021 22:54:45 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Subject: Re: [PATCH v4 39/80] drm/panel: Move OMAP's DSI command mode panel
 driver
Message-ID: <20210108215445.fijvog4ypv3docun@earth.universe>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-40-tomi.valkeinen@ti.com>
 <87wnwndswl.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
In-Reply-To: <87wnwndswl.wl-ashutosh.dixit@intel.com>
X-Mailman-Approved-At: Sat, 09 Jan 2021 11:46:48 +0000
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Sekhar Nori <nsekhar@ti.com>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: multipart/mixed; boundary="===============0308589671=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0308589671==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gl3q7klkjlinonlo"
Content-Disposition: inline


--gl3q7klkjlinonlo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jan 08, 2021 at 01:23:54PM -0800, Dixit, Ashutosh wrote:
> On Tue, 24 Nov 2020 04:44:57 -0800, Tomi Valkeinen wrote:
> >
> > From: Sebastian Reichel <sebastian.reichel@collabora.com>
> >
> > The panel driver is no longer using any OMAP specific APIs, so
> > let's move it into the generic panel directory.
> >
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/omapdrm/Kconfig                        |  1 -
> >  drivers/gpu/drm/omapdrm/Makefile                       |  1 -
> >  drivers/gpu/drm/omapdrm/displays/Kconfig               | 10 ----------
> >  drivers/gpu/drm/omapdrm/displays/Makefile              |  2 --
> >  drivers/gpu/drm/panel/Kconfig                          |  9 +++++++++
> >  drivers/gpu/drm/panel/Makefile                         |  1 +
> >  .../gpu/drm/{omapdrm/displays =3D> panel}/panel-dsi-cm.c |  0
>=20
> Not sure if it's a result of this commit but on drm-tip we see:
>=20
> $ make allmodconfig
> $ make modules_check
>   DESCEND  objtool
>   CALL    scripts/atomic/check-atomics.sh
>   CALL    scripts/checksyscalls.sh
>   CHK     include/generated/compile.h
> error: the following would cause module name conflict:
>   drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.ko
>   drivers/gpu/drm/panel/panel-dsi-cm.ko
> make: *** [Makefile:1400: modules_check] Error 1

It is a result of this commit and it has already been reported by
Stephen Rothwell. The thread also contains a patch to fixup the
problem:

https://lore.kernel.org/linux-next/20210108195839.GA1429715@ravnborg.org/T/=
#m0eee5e806cc93cf9982620b7b8b9f77df2c37498

Sorry for the inconvenience,

-- Sebastian

--gl3q7klkjlinonlo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/41J4ACgkQ2O7X88g7
+pr6KA//Yn1egelYt8TTu1cegd4nh6zGM7103sbWFizHk14NPBMCzmPiOs8TmPgk
O5x/BaRGq2G7tyVc65hYj4zhWeQXQp9Z7afjbbI8irUqepZHU2UpNsSYt2B1ZEBx
nhs722HUl6AgQQd3XCu7emCXPqFqMUeolGFvnnvnwlHb5cX+cbC4kL3orcXPFBDu
29QQT8PMc3ix7H+kwVrZ6yzMCTXi9/LGAe0ygplgAYF3rqMYBE105WQI6KmcjJFC
vPorPPlmOC6EMF9VKW8iUrUvyshgTjkyEmTsWH6YNXU3w8aWjUVbKlXLVQm0pbSw
MLrv4XAZBHlFPuhIF8MzVZxH+25VeDuq3AIixfdkawz+gjK9/GrPjzrZOGeUsbKW
YRWRmtxa0AwedO1uydQouAcFEopJzHJAKl/N3c/L3txQAytpyoLG5Ku7JW4hF519
gu2HRml07yMHqvLIKah9qzkETISuUiWF2yF3LReUjua1EkXvc2TO+z+lbdnJWTiA
zQW/tzwlogX+OJUFts9KyEqdf+hZS4EgJUwQluJRSMeYwGf/mpJf/KPEuPSWJ+lv
q9YG9gD2VbPilZj41cUmZYPUmxFGL/NST8otY5OwwpTQ/TEEEDL+lrwoUjqXgC10
fcF/TO5oflY/OBsSRWlQUqmcY1q2rP+SFjWwcwFL26n5XrXifo8=
=rgoN
-----END PGP SIGNATURE-----

--gl3q7klkjlinonlo--

--===============0308589671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0308589671==--
