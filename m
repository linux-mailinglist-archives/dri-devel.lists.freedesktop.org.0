Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC9C3555B9
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 15:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 144CC6E22B;
	Tue,  6 Apr 2021 13:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5C36E22B
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Apr 2021 13:50:55 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id r22so4166668edq.9
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Apr 2021 06:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gOH/ipopyYilVIRIl5MOuSb6PukEH3C954mhEJpN8pU=;
 b=FxkuNFz2WQR8ZsZjxDZnttBrh1ypAHN/rdnArvng/tmV2dVgD8cE3EF1OsLf/1zYT+
 cp8XuexYJXza2EnDzIVD0vvBqxORepAtFl49RXKYRUv7t+q53cGi5oI0rJWCywW3xjeM
 Sl3dtvmEsBxYYYvVK6a+a5nVEsoWq6M484cNbxTfRt7GLi+1gs/I03MknuB/VMjNpJlP
 M7MUY13GR7ZhWAQRouFgmoO13LGb2zYP40WT0rt7Ei/TzF2OdmCnV4R+Pgie8tWU2ivB
 bgvjSHEx4QeO08VJly+xZnc+s9MmMGYABxag+xH+wXpKwnUDM5pclhdYRGD8lZlR0PLw
 p0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gOH/ipopyYilVIRIl5MOuSb6PukEH3C954mhEJpN8pU=;
 b=bKNbJnNj5oBz5AWbl6bmRFheCiVjQXzkmQcdzVogwTp5wl8jl2UpmjPoP0ix2s1R2n
 WEWK6z94XUi5eWiMYP7T/9sIeFMb7rhJ41qj42gZLdbTSvQVghEchu7D+z11LHZErEwc
 dqkH2NVA3wSxlPJpgp4uHhOiemNXeJwCXHPIzKdu1SIk4uod77auOR1lHVE/CifQz33V
 au4XXsVYoyKVjJm9ZjlxcCIr9zVx4QhHP4eAzIPUXGTsfIZUfGGJN3MeM8rY7op5OGRk
 mt+doJfngS9Nu4ujWkMFVCGWGkp7xA6qgyPjU/oz1YHrIsHS5hfJKkhGbvn+MoXr3ios
 hMqA==
X-Gm-Message-State: AOAM533jJbgusxlz+qdZCPlj7li9u/wHEmUaWqhXjqvris2Xbk5serXl
 NrNu5ryNlEMKC9uTC6NWCBU=
X-Google-Smtp-Source: ABdhPJzAKqXHPAdIcDLV1E0pw1IFJ8ooXkt312+dixaD62M4Z7lWK5xAdM2fZWVlbzbjf9D/hIeb0g==
X-Received: by 2002:aa7:c656:: with SMTP id z22mr14000749edr.297.1617717054250; 
 Tue, 06 Apr 2021 06:50:54 -0700 (PDT)
Received: from localhost (p2e5be490.dip0.t-ipconnect.de. [46.91.228.144])
 by smtp.gmail.com with ESMTPSA id lx5sm2647230ejb.47.2021.04.06.06.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 06:50:52 -0700 (PDT)
Date: Tue, 6 Apr 2021 15:51:25 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH] drm/panel: panel-dsi-cm: disable TE for now
Message-ID: <YGxnXS8hQ5fkTCfe@orome.fritz.box>
References: <YDnyVV/O78sQjtWb@atomide.com>
 <20210227214542.99961-1-sebastian.reichel@collabora.com>
 <c8d624ce-5cc5-ba83-4446-4c7a7903b344@ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <c8d624ce-5cc5-ba83-4446-4c7a7903b344@ideasonboard.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
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
Cc: Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: multipart/mixed; boundary="===============0092792487=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0092792487==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dAPuqslZk2A53+ej"
Content-Disposition: inline


--dAPuqslZk2A53+ej
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 16, 2021 at 04:11:30PM +0200, Tomi Valkeinen wrote:
> Hi Sebastian, Sam, Thierry,
>=20
> On 27/02/2021 23:45, Sebastian Reichel wrote:
> > From: Sebastian Reichel <sre@kernel.org>
> >=20
> > Disable TE for Droid 4 panel, since implementation is currently
> > broken. Also disable it for N950 panel, which is untested.
> >=20
> > Reported-by: Tony Lindgren <tony@atomide.com>
> > Reported-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > Fixes: 4c1b935fea54 ("drm/omap: dsi: move TE GPIO handling into core")
> > Signed-off-by: Sebastian Reichel <sre@kernel.org>
> > ---
> > I suggest to start by fix the regression like this and look into
> > proper Droid 4 TE support separatly. Assumption is, that Tomi
> > tested taal panel, droid4 panel is 'broken' and N950 (himalaya)
> > is untested [*], so choosing safe default. Patch is compile-tested
> > only.
> >=20
> > [*] N950 display is not yet functional on mainline, since it needs
> > the omap3 FIFO workaround:
> > https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-n900.git/comm=
it/?h=3Dn950-display-tony&id=3Dd4cbc226a30b29bf2583ffff97b052c9ec68c8a3
> > ---
> >   drivers/gpu/drm/panel/panel-dsi-cm.c | 12 +++++++++---
> >   1 file changed, 9 insertions(+), 3 deletions(-)
>=20
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>=20
> Sam, Thierry, will you pick this up or can I push to drm-misc-fixes?

Sorry, I had missed this. Feel free to take this through drm-misc
yourself:

Acked-by: Thierry Reding <treding@nvidia.com>

--dAPuqslZk2A53+ej
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBsZ10ACgkQ3SOs138+
s6E0CRAAsLWeNSQg05TJMRnQ6l9yPs+Y6l5hmPN9IZGXBj72YXIjAC4kxW5TPiPC
284gXPFZyZHGCrfVrTKEPIRCAjIGgZQGeUI2l1rmmr4D1RlVY+NB8DHoda1C/DN0
DbWuny6YMWn5AaQ9r3I26PqlRAVkA6XNWocH/IrX0hRvaxy5Bg0+Ul1N3eKHxMLc
A1sfUcKQECVeQUr7FlXOFBb+uM8lkny0QNGBseF96yC+zY+GtB1yvEnK9ZhIv0xa
XGtvHlTus6WzXIq6gC0WlPZBxofdCcDDaAsWRETj7hSL1Lubi/qaO2+n7zynjEAS
VAx1xMgCvjxSTSNsUZcfAZRYHEWfbrk7oMbQUSjMgihhQwq3BI7PQlnB+i8iyBVi
ge+Bn1/3RZnjXJaic55B46+NgLnEYqhsZJBwUU/phkNA0be564yMnzKjvZ86neAD
62s1Y23v9usKt2eLMxuOaF6WD5mQbv58DALcOZbF/jAu9k8M+fPsJaR/JPg3TYTO
hojzku8q0FIsWal/O8rpGdfLriw0CWyAcExiaiRRnWs9Oa8Bq05jhys/ToxMvocu
U1DGF7CF8Kzzme+CGRWGP9455hb8jt0lziycJdCrmi3MaFWZ+mbG7SpFyKx5nqkf
zmIJ4B7twedRBDTeAamb8GXIy9R0vmfy4y+kIGa18ROTUsR6onc=
=KN91
-----END PGP SIGNATURE-----

--dAPuqslZk2A53+ej--

--===============0092792487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0092792487==--
