Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBFC908666
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 10:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8F510EC9B;
	Fri, 14 Jun 2024 08:35:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vETvn++F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBC010EC9F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 08:35:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A2B4ACE28AC;
 Fri, 14 Jun 2024 08:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A10E5C2BD10;
 Fri, 14 Jun 2024 08:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718354119;
 bh=fVF9Ccc0oMZovUmZ6rY+dr8Z+7/iCmVunj1XSiI672U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vETvn++Fz5v4Glc3Vqo+GIyJrDnSy5vujaAchADlfoAsg8xZOQy8Z04lW9cXqXYAI
 +oEtteN5dVoBkvXlbEhx2aM4Wg/edlK+MT4H50uz53ysmwP/JEVEQvYqtRa+r95iGU
 ejbjDFqdu9AvquNpHl7c+pKXgGahqk+VylPSr18rbqmvaQPLIhUsCQGV5MYIeMh9WY
 IPQe+oft/afzaXY1WmHZ9+HS3WbQYVZ2fItTsP58ewzLVJ/WLL5mHVBw2n4qA83XuS
 qruePazQF3wwKUGOC8cMFiqSpvKPTGDc2+/Mgo0GyrIGB7TS6Xx+WWl9+JKNedwKeY
 HA14gkaBEYlLw==
Date: Fri, 14 Jun 2024 10:35:16 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
 Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/3] drm/panic: Fixes and graphical logo
Message-ID: <20240614-fractal-organic-doberman-ee0cc5@houat>
References: <cover.1718199918.git.geert+renesas@glider.be>
 <386a229b-6904-465d-b772-921f99815e8c@redhat.com>
 <CAMuHMdWy15T1JPH6w=xLyx_-zpHJA_VUe_Mu+h5zNPXEZw8+RQ@mail.gmail.com>
 <cff14393-d702-4fcd-8a13-034692dc931e@redhat.com>
 <CAMuHMdUGEuX+8EP3gbCB-Kgri=h34q0ryjOd5-KE-4+fWWwsGQ@mail.gmail.com>
 <20240614075949.3a3c667f@canb.auug.org.au>
 <CAMuHMdUn4w74q0-_xDvX5vZogR68pKjmmRw0rC26jcr6_vcPMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="m77uksvhqyv4resl"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUn4w74q0-_xDvX5vZogR68pKjmmRw0rC26jcr6_vcPMA@mail.gmail.com>
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


--m77uksvhqyv4resl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jun 14, 2024 at 08:58:26AM GMT, Geert Uytterhoeven wrote:
> Hi Stephen and Maxime,
>=20
> On Fri, Jun 14, 2024 at 12:00=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.=
org.au> wrote:
> > On Thu, 13 Jun 2024 11:48:15 +0200 Geert Uytterhoeven <geert@linux-m68k=
=2Eorg> wrote:
> > > > > Has the drm-misc git repo moved?
> > > >
> > > > It moved to gitlab recently, the new url is
> > > > git@gitlab.freedesktop.org:drm/misc/kernel.git
> > >
> > > Time to tell Stephen...
> >
> > linux-next has been using that URL for some time.
>=20
> OK.
>=20
> Looks like the top commit of last drm-misc PR [1] is part of the
> drm-misc-next branch. but not of the for-linux-next branch, while
> Stephen pulls the latter.
> Is that a drm-misc or a linux-next issue?

This was a drm-misc issue, it should now be solved

Maxime

--m77uksvhqyv4resl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZmwAwwAKCRDj7w1vZxhR
xTDsAQCIpqfK6vT9nOrr1d9AHMzoVgI3sBWPfCxNlM/igyT0igEAvonuMas+7i9c
+MD0H2tN0BDF1I6bV7871RL9t7frwg4=
=Er6x
-----END PGP SIGNATURE-----

--m77uksvhqyv4resl--
