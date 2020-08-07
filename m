Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7475223EA7D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 11:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E3B6E9B0;
	Fri,  7 Aug 2020 09:38:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9B96E991
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 09:38:15 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id w25so1478910ljo.12
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Aug 2020 02:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=Zy/6qhdKLIF5fQzoPLOplDwmck3BKD5YLF65SWogln0=;
 b=bNVt64iaZ7ntcQYufWjbZiEZ3aw96K1Lr3hXJHzbdyI8hvv4UTULl9iqraTKrSzTBg
 FVfRccnoogKI9+IEyTIYaVopMHmFcZ/5jHokqMyVQFa2YKXJjAZP/+4ueucuOSnTyjzI
 5LDBLvCzvLkH7BzurMB6mKyrP1tfA7ugVgBU61yRzetOgHyf9O5ITndsjFD0zjBkIRKu
 azrueYC172w+29ItSwsarWd8IF/uQ9ltdVkp2bNkT3/pDeGKdz4lubU1wVr+BrCsSN32
 XqOWFBBRvPJqC5CMfm31o8/iIIlZRLwAnERQAddHLiO7XI3H7uQ8fitqbMYMksP6Gnhv
 xO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Zy/6qhdKLIF5fQzoPLOplDwmck3BKD5YLF65SWogln0=;
 b=ugh9JvsRdnRZe5RuJ7cM+e29XCc2oQzF5OnZgiN8/FVyD50k1etX1WgqBXO8qevZTs
 LYJt1h3TQEi95uTpOvgScj/z2pWYR65D3X+QCmsxf+5Z4UWDw0/OwIOBreklQs0uiYC0
 TsIhlvRZQ+YW6ki/roHIY/QMNRrZSEUwoVAyrElpODGFHKnBJGyWL37vrnWp3JlcsC5J
 5kxiWWtoihZBHc8hb33gXeq4n9oLOXYaXA+C+WbMA1inYnAuNr1fy7n850WsZUWiTKol
 61bvwzdFzyf/k1gIEvJaey4fei3CiEkSxLuIKnfIaeNxYBZRpPIWKrdbhl9Aty5hZ4TO
 n0Dg==
X-Gm-Message-State: AOAM530/dkNR83OfpSXuElin/H0dDt5gkEVzuV0Xr+K5q2cvu0yPAtt0
 L78KCwTcRJmZTcKwTce7vms=
X-Google-Smtp-Source: ABdhPJxIA6eN0Dw9dIL/FovA10GnPuCWL5pPsmSBhvrxKK9lh2mjNfWhgslnIgNrF5vsJbBnHQfRQw==
X-Received: by 2002:a2e:3c03:: with SMTP id j3mr5892573lja.397.1596793093578; 
 Fri, 07 Aug 2020 02:38:13 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id y21sm4031232lff.34.2020.08.07.02.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 02:38:12 -0700 (PDT)
Date: Fri, 7 Aug 2020 12:38:02 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: drivers may provide multiple primary planes per CRTC
Message-ID: <20200807123802.6058baca@eldfell>
In-Reply-To: <20200807090706.GA2352366@phenom.ffwll.local>
References: <TJAyvL7GM0cZ61sbzYMZ7IbVow2d32QQntnAB5_zpBOdcKVIAy8qhZg4En6C8Ka-mUXV-goV21ExVsA8Q3N_lJV4jf6g6llQBQSDs602jgs=@emersion.fr>
 <20200807090706.GA2352366@phenom.ffwll.local>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1241313798=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1241313798==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/iQia8e2X_Npr8.ZXygdSjCN"; protocol="application/pgp-signature"

--Sig_/iQia8e2X_Npr8.ZXygdSjCN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 7 Aug 2020 11:07:06 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Thu, Aug 06, 2020 at 10:33:31AM +0000, Simon Ser wrote:
> > Some drivers may expose primary planes compatible with multiple CRTCs.
> > Make this clear in the docs: the current wording may be misunderstood as
> > "exactly one primary plane per CRTC".
> >=20
> > Signed-off-by: Simon Ser <contact@emersion.fr>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > ---
> >  drivers/gpu/drm/drm_plane.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> > index b7b90b3a2e38..108a922e8c23 100644
> > --- a/drivers/gpu/drm/drm_plane.c
> > +++ b/drivers/gpu/drm/drm_plane.c
> > @@ -49,8 +49,8 @@
> >   * &struct drm_plane (possibly as part of a larger structure) and regi=
sters it
> >   * with a call to drm_universal_plane_init().
> >   *
> > - * Cursor and overlay planes are optional. All drivers should provide =
one
> > - * primary plane per CRTC to avoid surprising userspace too much. See =
enum
> > + * Cursor and overlay planes are optional. All drivers should provide =
at least
> > + * one primary plane per CRTC to avoid surprising userspace too much. =
See enum =20
>=20
> I think that's even more confusing, since this reads like there could be
> multiple primary planes for a specific CRTC. That's not the case, there'
> only one pointer going from drm_crtc->primary to a drm_plane in the
> kernel.

There could be multiple primary planes *usable* for a specific CRTC but
just one used at a time, right?

> The problem is that userspace doesn't have a drm_property to read this
> pointer, and needs to guess.
>=20
> I thought the rule is:
>=20
> Nth primary plane (or cursor) is the primary plane for the Nth crtc.
> Enumaration with increasing drm kms object ids.

Why is that needed? With universal planes, I thought
drmModePlane::possible_crtcs bitmask is trustworthy?

In the legacy KMS UAPI you can't even pick your primary plane, because
it's implied in drmModeSetCrtc(), right?

> And I guess we should explain that on some hw any plane (including primary
> ones, since that's only a sw construct) can be freely assinged to crtc.
>=20
> Yes it's probably the most gloriously bonkers uapi we've come up with.
> Might be so bad that a libdrm helper to look up the primary plane for a
> crtc (or it's cursor plane if it exists) would be in order :-)

I'm not sure I see the bonkers there.


Thanks,
pq

>=20
> Cheers, Daniel
>=20
>=20
> >   * drm_plane_type for a more in-depth discussion of these special uapi=
-relevant
> >   * plane types. Special planes are associated with their CRTC by calli=
ng
> >   * drm_crtc_init_with_planes().
> > --=20
> > 2.28.0
> >=20
> >  =20
>=20


--Sig_/iQia8e2X_Npr8.ZXygdSjCN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl8tIPoACgkQI1/ltBGq
qqeN6A//RqdQHh/SkLgp894UOWaSBZOIHU7enMjpTXDDnLPqPkFPIUPdcMRtQRBS
IT3PhHt5eMFh+UJkkjHKZwBXQcxhfMJFG/UVmTWMk+njEnOKNJYM57up6rmG3H1S
xRlBJNlNwUvNmMKEYVrlGWenHEoYwllSSSWs9iWXlJsrWqVgH7F62UzoT8xbnPUU
xW50YyMnBoIZYrFBWgXUi+PLGSFBWiUxrPGb1Z1JAjXbcbftPFyC685dpKFXaK57
UndjIPGj6Ly01d0O67e/GHjtIrLb06wpyk2PHIzeyS6XuNULyUTtEb+tH3ARBXgj
wL5dULT7yxWNqzK/V5JYtrZpd9AceCgEO3IoGh+KHwcBhK1sML5SPSJDDaQZUw9R
z2KHe6bzjCTHC+ES8BuJn9lpRe6yDPR/qnq6HnP+vkYOxwItcHsBsgYzXsq1pVFX
uuTio8aRrdYqOICudp1H21kgJ2k75muSmO5vUBKV8Va/rnGXF4caNHkPvFuNqZFY
SO/N6vMvX/0T2KXYgzYuOWzytPrE+7GCeXQcRJMEY32kjMY+VbtFSupz0oyoUkiV
s2RQgknDDb76aEX9HjlBTUSkuQ4t8fCHTPcfCVBXRAt61WzE6M/dpGU7ReFhrbsR
Q7TFVHyDQNtrJQLTkNLsDHTemgs+CxVld2xLb9HhK/bpZXvW/Eg=
=nT3m
-----END PGP SIGNATURE-----

--Sig_/iQia8e2X_Npr8.ZXygdSjCN--

--===============1241313798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1241313798==--
