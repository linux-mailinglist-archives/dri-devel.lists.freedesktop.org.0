Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1924C244C6E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 18:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1911C6EA41;
	Fri, 14 Aug 2020 16:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD6D6EA41
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 16:06:35 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id t14so8355432wmi.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 09:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0CIYVcQQN6V0rTPsyFS5dYA4IzYTpn+LTaXrtoXxdDs=;
 b=jetOJTPwRqvvZiXi0fCjv5lpziReWkbizj3kAL7CxooUyPVeOElHDijQvTR259W9rW
 QHrHzycGXud/ATZevVpyhteRYUA/copu4r5d5QOK3ILw8G9EUwYoewHk+TYnhV+e4EAd
 FyNz9Jb5xMZTJfcbT6ZUAu+dGN4KHx2CU5W4Rv4YSUG8p3zlKt+jowS54VDswxODrOE4
 E1xImiVYaFxJ2Sl/u+drsy+wUsFIjaFKO42D6K5qmQNOGVuUndqQSopY9qLS6q22xkey
 Ypk76hBW6Cjl8GblKgbIcSAHy1pmoxRaIPw0AjcjcBsAS3ddXxkm9pis98QgiwGhnYQZ
 rHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0CIYVcQQN6V0rTPsyFS5dYA4IzYTpn+LTaXrtoXxdDs=;
 b=Na7gMfnd0TymIk1rzU8ZVRdVO6BQ0aR3P47OO/jI1+JMROqKPPRxGBMVRBXedORAUc
 nkK6Ji/tY3q1w3UkkhjoDyrylC0wLLktVrmpQdDqdZsXVE3oZjH/fhN1/lJ8V8G4Y1mP
 Rda642QJ4Yhhk0X2rd9WEGXaG4hdrzENjS4g4ItIgfj6a4VtE468fGCeAkeSyRDjLEVj
 Wsb7LpSX9umGYUitYjjLIrIZ1apNVR37/2H4P2KRr2ZZF1qCytDWbLk2eDTEgEHXIYTl
 BOtGspfF/eWxwo9dRoCarVshntP6JSttflhK5KsNezu7rx66Rs9vBoSFIfuJomG+MPi9
 3W1g==
X-Gm-Message-State: AOAM530D9m85cTSLIwmj6pkhoBkVy6NKtQ5AGAhu52FgYoUgmJJYv6oV
 +r/v705/Op7bic13TdhPxRo=
X-Google-Smtp-Source: ABdhPJzEmx91DWIu9DrNY8zYtBJXqlCaut+62Pzt6seVzHaJxju62RKVv0Cipqoi970kcJNDdn0LsA==
X-Received: by 2002:a05:600c:2116:: with SMTP id
 u22mr3119156wml.35.1597421194301; 
 Fri, 14 Aug 2020 09:06:34 -0700 (PDT)
Received: from localhost
 (p200300e41f10ca00f451c56750ebc625.dip0.t-ipconnect.de.
 [2003:e4:1f10:ca00:f451:c567:50eb:c625])
 by smtp.gmail.com with ESMTPSA id i22sm18306445wrb.45.2020.08.14.09.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 09:06:32 -0700 (PDT)
Date: Fri, 14 Aug 2020 18:06:31 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [git pull] drm for 5.8-rc1
Message-ID: <20200814160631.GI556087@ulmo>
References: <2c5cf2e8-afd2-446d-1f27-2c225c65d447@nvidia.com>
 <CACO55tto89kT-_QKGjQ50Ht8U-4Dop6sTjNsbr1qHXhgNuDHEA@mail.gmail.com>
 <CACO55tu1RWZ0ZGcMcrU-snT3CkJtwxawwJ9990-5a+hpByh-Hw@mail.gmail.com>
 <CACO55tsfV9pGijOF5F=dLqFhpXgPSArGHXa44Mt3eRBk7z-X=g@mail.gmail.com>
 <CACO55tsEjGUhfrBdbcpT9xLa8N-T0JR-t7xFBA5pxDZ5+NiQhg@mail.gmail.com>
 <efb830fe-9ded-f5d3-6944-45adbb2a1f80@nvidia.com>
 <20200814140527.GD556087@ulmo>
 <CACO55tsr9hTd6mkaKfnnEWUz-7X=Sx7EY5sr1BVz-O2ftr98ww@mail.gmail.com>
 <20200814153449.GH556087@ulmo>
 <CACO55tt69SbBKLkmTVtoq2BLRJGbO5fmUH4dFWX_qC7nii3jSQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACO55tt69SbBKLkmTVtoq2BLRJGbO5fmUH4dFWX_qC7nii3jSQ@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
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
Cc: James Jones <jajones@nvidia.com>, Thierry Reding <treding@nvidia.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1964392995=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1964392995==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DwoPkXS38qd3dnhB"
Content-Disposition: inline


--DwoPkXS38qd3dnhB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2020 at 05:40:34PM +0200, Karol Herbst wrote:
> On Fri, Aug 14, 2020 at 5:35 PM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> >
> > On Fri, Aug 14, 2020 at 04:44:43PM +0200, Karol Herbst wrote:
> > > On Fri, Aug 14, 2020 at 4:05 PM Thierry Reding <thierry.reding@gmail.=
com> wrote:
> > > >
> > > > On Thu, Aug 13, 2020 at 10:45:34AM -0700, James Jones wrote:
> > > > > I'll defer to Thierry, but I think that may be by design.  Tegra =
format
> > > > > modifiers were added to get things like this working in the first=
 place,
> > > > > right?  It's not a regression, is it?
> > > >
> > > > I recall that things used to work with or without modifiers at some
> > > > point. That was basically the point of the "pitch-linear by default"
> > > > patch, see:
> > > >
> > > >     https://gitlab.freedesktop.org/mesa/mesa/-/commit/9603d81df0510=
5857b676f20dff964ef3ab0ecff
> > > >
> > > > If we don't force pitch-linear for cases where we don't have modifi=
ers,
> > > > there's no way we can properly display these as framebuffers becaus=
e we
> > > > lack the modifier information at the kernel level.
> > > >
> > >
> > > I suspect that's related to
> > > https://gitlab.freedesktop.org/mesa/mesa/commit/c56fe4118a2dd991ff1b2=
a532c0f234eddd435e9
> >
> > But we're checking the the PIPE_USAGE_SCANOUT flag specifically for that
> > type of case, so this should work. On the other hand, it does sound like
> > that logic might actually work, but for some reason Nouveau then ends up
> > allocating a linear render buffer and a tiled depth buffer, and that's
> > the combination that doesn't work. Did I understand that correctly?
> >
> > So it sounds like there's a few options:
> >
> >   a) Make Nouveau render without a depth buffer in these cases (not sure
> >      if that's even possible).
> >
> >   b) Allocate a linear buffer *in addition* to the normal buffer that
> >      Nouveau allocates (with whatever it selects as the default layout)
> >      and then blit from the tiled buffer to the linear buffer everytime
> >      we need to. I think that'd be basically reproducing the code that
> >      is controlled by the DRI_PRIME environment variable.
> >
>=20
> yeah, I think Ilia suggested something like that a long time ago as well.
>=20
> >   c) Accept that modifiers are the way to go and rely on them for proper
> >      functionality. This is obviously a really bad solution because not
> >      everyone has transitioned to framebuffer modifiers yet. On the
> >      other hand, this is precisely the kind of use-case that framebuffer
> >      modifiers were meant to address, so it isn't all that far-fetched
> >      to make them a requirement.
> >
>=20
> the problem with that is, that by default we don't have modifier aware
> desktops. gnome-shell by default and no Xorg release.
>=20
> > None of those are really great options... does anyone have any other
> > ideas?
> >
>=20
> What I am wondering about is why with my patch it simply works in X,
> but that could be a mere coincidence.

So I was testing your revert with Weston and that "works", but only as
in "it doesn't crash". As expected, since there's now a mismatch between
what layout Nouveau assumes and the pitch-linear buffer that modesetting
assumes it got, it'll now be completely scrambled. That said, even
without the revert I can't seem to be able to make Weston work without
modifiers support.

I'll have to investigate some more why that's not working. Perhaps it
doesn't pass the correct usage flags?

Thierry

--DwoPkXS38qd3dnhB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl82toUACgkQ3SOs138+
s6FSCRAAv6uQj6qGKyc/rgojaU4oLF8KD0nz7UmBN0g2lbYt3vEis0cKTTMX3VXU
x4n7JX/mC50U4XxTDtqPlQKlgB/wrVggbbUQovG9rev69j2H22POzxutW5hHQMSK
jEI4zEImRPOa6RByUfq8bap08wtPJNeQtQGT4/gk45KtNsMpKPp08lOuwMOLpMlN
VsC/aG/TMWNBiGYWBoqhalYXPQlxKqJydTRYhq57YF038CdQ057xlaR1ZpShH2Pr
a8bfxQRMD3XRb9qbqirLtRCyliHdIe+oDB+0Zu3hdpAePSR3ukxZWJLYdDOG22XQ
uAauOyrVLQrqydX/ZYMSHJ16Euex2ZTKdnQ6wX/moBcrb/s+QWzp+EyUe+HgePuG
sSzon4+M+YXqMSwoVR7kTeZGIGcAFHtaJDq+rhGFbQDIB3ldCYmVP3Ps2uoWmBBV
LCTEft+EhVa0YzYzbSh8V3vb/QbX+R9niAM0O4gKCqyxyKNSz8I4UAhM40bOYBnZ
MJhLbkHHAWXRu/1ksC214WdVdlTZOw0sYnLRkUNycZGl0jwBr7hPq4dHFkpDFJ5O
X/eRZKAdGjjJ8Vt8dUzMywh8IRuWEnpxAkBDTsLf25lg/GM54lCVHqI3AzbwQ7TB
ZuAQLmo22mtwNnL/qdjJwfkFZ1RGBP3sleXFuxjXD9YlQl5a5S4=
=Y4j1
-----END PGP SIGNATURE-----

--DwoPkXS38qd3dnhB--

--===============1964392995==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1964392995==--
