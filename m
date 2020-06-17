Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 217311FCF21
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 16:10:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6666F6E0EB;
	Wed, 17 Jun 2020 14:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3187F6E0EB
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 14:10:19 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id j198so4570042wmj.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 07:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=aKAqZLtD99M+vyhmg0PlpTTUmWWPmxZ1wOcYL6M9ZQE=;
 b=ixi1sX/WioMHTATDa6Yvi/YHkzlyAgwCjz4MGehafbr1i179MaHUEqMdoFhGZNrCPB
 MuKV40pif1e5d5h3kZw0hJhZEyXUz2fwz8gFjosr+m5Ob6mw1UZfYzd8zU11fZCv55Aw
 F8qmVR/D+IKncu6q7G2TvHoP+CZukPt5+ey7V8GVYS0uHjOUSPAyXBuNojYi/AvloydL
 jWA08+/DPzPRGMXsprEUYpY3X+y5C6SfT4/75pK/gu+LBvs8AIH895hJY10VuZAUJ56X
 Y19XohRqktXLkdrVQeJj1xQxe0+09hRA2jXcR/zylmbXOGxTs0GHhn+3HjRU4V7axNyr
 A4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aKAqZLtD99M+vyhmg0PlpTTUmWWPmxZ1wOcYL6M9ZQE=;
 b=Mx26QaVgfV+plrjK3NV1nSnMjhP4jOfTKte3Lr/2ml7w+h9qU5tcfjf4JqRNoRquKH
 m0aUItahCOoym1ak7x6jIYMYzbeM9zM0BHbeFc3L1FnWTdMykdY6cxNKyxWH8JLggTiY
 h+DVlepmrFZa+dgoaNyQ7Qtow+lE585u13hqG3PDMyWUUB2Mpo6epNewX4IG+IwC3e5F
 YyV24mQG/UOhjTkH9WHhZKELkTUB0Q534uEs7XUcPU2j3tpQb8zBvVPE8ajgmioSHjoC
 jH0GY067oVKfE9mZasu7zG45BY+fE2mCkwchfJEzt3mlMPSbeSmaQaFfMDIcy/vlhOc7
 iWXQ==
X-Gm-Message-State: AOAM530tsOISpsNV0fhl2nMizXRjDd5Kvab+gOBz8Qw+dNRpAF82aQeO
 TnJgqfcLQI33vkTH2aQpMKI=
X-Google-Smtp-Source: ABdhPJz93A2UmQ40Y7WNyr7o0oTwNMslkZc4nlQeuWoA1l3IGLZZpKCIXYZ6HcrT3zXCpjaQmvjb3g==
X-Received: by 2002:a1c:6389:: with SMTP id x131mr8648296wmb.90.1592403017702; 
 Wed, 17 Jun 2020 07:10:17 -0700 (PDT)
Received: from localhost (pd9e51079.dip0.t-ipconnect.de. [217.229.16.121])
 by smtp.gmail.com with ESMTPSA id d2sm34273507wrs.95.2020.06.17.07.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 07:10:16 -0700 (PDT)
Date: Wed, 17 Jun 2020 16:10:15 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3] drm/tegra: Add zpos property for cursor planes
Message-ID: <20200617141015.GB3536291@ulmo>
References: <20200616181449.3147258-1-thierry.reding@gmail.com>
 <8e45b425-b667-433e-2074-7a058329f5c2@gmail.com>
MIME-Version: 1.0
In-Reply-To: <8e45b425-b667-433e-2074-7a058329f5c2@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Content-Type: multipart/mixed; boundary="===============0076134557=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0076134557==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2B/JsCI69OhZNC5r"
Content-Disposition: inline


--2B/JsCI69OhZNC5r
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2020 at 09:39:19PM +0300, Dmitry Osipenko wrote:
> 16.06.2020 21:14, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > As of commit 4dc55525b095 ("drm: plane: Verify that no or all planes
> > have a zpos property") a warning is emitted if there's a mix of planes
> > with and without a zpos property.
> >=20
> > On Tegra, cursor planes are always composited on top of all other
> > planes, which is why they never had a zpos property attached to them.
> > However, since the composition order is fixed, this is trivial to
> > remedy by simply attaching an immutable zpos property to them.
> >=20
> > v3: do not hardcode zpos for overlay planes used as cursor (Dmitry)
> > v2: hardcode cursor plane zpos to 255 instead of 0 (Ville)
> >=20
> > Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/drm/tegra/dc.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> > index 83f31c6e891c..04d6848d19fc 100644
> > --- a/drivers/gpu/drm/tegra/dc.c
> > +++ b/drivers/gpu/drm/tegra/dc.c
> > @@ -957,6 +957,7 @@ static struct drm_plane *tegra_dc_cursor_plane_crea=
te(struct drm_device *drm,
> >  	}
> > =20
> >  	drm_plane_helper_add(&plane->base, &tegra_cursor_plane_helper_funcs);
> > +	drm_plane_create_zpos_immutable_property(&plane->base, 255);
> > =20
> >  	return &plane->base;
> >  }
> >=20
>=20
> Looks nice, thanks! Since you dropped all other zpos changes for other
> planes and given that the other planes have 255 for the max zpos, what
> about to set the cursor's zpos to 256?

I'd prefer to have all of the planes' zpos within the same range. By
default the other planes will be on the very bottom end of that range
and the atomic core will normalize the zpos for all planes anyway, so
the cursor plane will end up with a very small normalized zpos in the
end.

The zpos documentation already mentions that the behaviour is undefined
if two planes have the same zpos value, so I think userspace is going to
know how to set these anyway.

It might be worth to do a follow-up patch that is smarter about setting
the range of valid values. 0-255 is true on later chips where we
actually have a proper "layer depth" register field and I wanted this to
be uniform across all generations. Other drivers seem to set the upper
limit on the zpos range to be equal to the number of planes available,
so that there aren't potentially big gaps in the numbering. That said,
since the core already normalizes the zpos for us, I don't see a big
benefit in explicitly clipping the range.

Thierry

--2B/JsCI69OhZNC5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7qJEcACgkQ3SOs138+
s6G60xAAwyap6WO12SudpUTIDTnWEapALfkB70KdeN1LlQXgSqGE+QK64mOlno/i
yG1WcmUph/G1s+tK45jVKr2d0OKUFMqGeeB5h0rAjGYIOQN8DAh8wOidleeCowY2
YVHAOSzJtoF/+ovHVNEOOet7C1OX7pUpUz21gQ4TKgydJ9P5DtbwCP67mHCuEx+6
e6oJZYR4UZDURiebgB9UmwomXm2dka82e28vrcrkeX+2zra/vO97e4bNQA2Dl1BX
qPrPFEIfWoch8s0giWz79p5FK80AuqjXVL1Fks6vG74E5DzL0F6BPXryFPKqg8XS
IvqFQ0ATokM+ZTzf6lSUlBfH7HffnSDtZiQP5dsaMVFDDjqLCTlB2JD0hKBiffzg
cqcHjM4DvjGYBrPtEe6SuIiARr9/DBTPXzcqFTtPcuGxmalefHZnMc4RD3comOSI
b/fpB21n3RY7lQC44j3G4m184GQv8MPuzvfvBzTRgLwxJBnbI39JnNeOEh8Oiybl
3fyxnbV72Nimsrd7dXV2NnhFWprzAmWN0IODAiGRGfSKIGLdh+h3Xik0ufOyLGBA
e3mYEPFmJ8AKx+AUIiYQ4Y492Rq1PviyGW/5iWG7tK7t/bedWOOGObHOk5fT+sEN
kh66ifmz13uHGSQuJwLbDylto3LpqlMwHxHMBKkBbbypA2DnR00=
=ASa+
-----END PGP SIGNATURE-----

--2B/JsCI69OhZNC5r--

--===============0076134557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0076134557==--
