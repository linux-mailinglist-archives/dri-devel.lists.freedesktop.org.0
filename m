Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 300D1A549F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 13:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD5F89B11;
	Mon,  2 Sep 2019 11:06:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0422D8957D
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 11:06:38 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id i8so1542303edn.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 04:06:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=n0DPExOYiH+PlNY6gmjCBVsx0gPTO8FgvcPFMeF6Iv0=;
 b=CLMKld8PLUYvGTFaiZmhph/1zc+iTwabTqrexBGwTyxubqLsbyCuU4u9HWQc1w5l/5
 bCembuDZJvaIPZuxaL1wpMV+fCLhvdAERrsY5417n6/IHu1Vkp+ZMp9ukV2saO8AzGrI
 OY1xr2MVUcSaDnhtpDu5BQm2wa89tl+1viKwdB43r8g+8r0RZ2p0ZCJpGOhEg3XW9Olq
 zOf0ZHndHnuqBzdnqpkwDjKnk7J84kuiRAwAo+p4wuG0B9FggGwepqNv0akVhLVmsXwi
 VHFUrv7GpuHFpP5F961Th5VwsrC5C8hiCSGsKPAAPpNnoLCfAod97mUBhok/9XMcNv3W
 AXkA==
X-Gm-Message-State: APjAAAUujpHxmXzZhaqCq8ZGKrv7wf+VuBsvAYDS2J2GnVlaHZ5E2g3a
 MA8GDTXSH4YGX+7amoH0DxM=
X-Google-Smtp-Source: APXvYqzoxO/V3At3HCy/iwd44FKKM0MElNs0S041xbUv68q+uvrRQrY1QbP/+l/XNf0t0oQdXTWuvw==
X-Received: by 2002:a50:e718:: with SMTP id a24mr30556240edn.260.1567422397479; 
 Mon, 02 Sep 2019 04:06:37 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id la18sm163386ejb.14.2019.09.02.04.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 04:06:35 -0700 (PDT)
Date: Mon, 2 Sep 2019 13:06:34 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 14/21] drm/dp: Use drm_dp_aux_rd_interval()
Message-ID: <20190902110634.GB19263@ulmo>
References: <20190805122350.8838-1-thierry.reding@gmail.com>
 <20190805122350.8838-14-thierry.reding@gmail.com>
 <1565270253.3656.11.camel@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <1565270253.3656.11.camel@pengutronix.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=n0DPExOYiH+PlNY6gmjCBVsx0gPTO8FgvcPFMeF6Iv0=;
 b=WLa5pzOFokKDEqMvsZ9SwreM+5Qm/FyR4yfoZq7FQNFVtOAxB0ZBgfZedkft/HSEaB
 vvxmFHyLezEkvaR+R9zXgwCb5psiielFXyJonjpyXF4anO1BO9zzWOmCS8rHITOt7HIg
 n0QQ+zb9J0srTWrk5WkiwPjyCndc3Nwkq8s/DGkWJoCR8OQBJlUDU6kKhJdOXl6xOePB
 MUgtmE8WOikAHDlqbOf/VqTRj8zeV1Xlj+N843YT9v99IJ/AfYcENWQZWCjCkhEeElxT
 uMxYT37z627gcMfDZnH4ETJn4UDiHkYZl61jfHzXbynzPObNuPKyUoMG8k0XcgyhDxrC
 jfsg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============0581501252=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0581501252==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zx4FCpZtqtKETZ7O"
Content-Disposition: inline


--zx4FCpZtqtKETZ7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2019 at 03:17:33PM +0200, Philipp Zabel wrote:
> On Mon, 2019-08-05 at 14:23 +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Make use of the newly added drm_dp_aux_rd_interval() helper in existing
> > DP link training helpers and add comments about minimum required delays
> > mandated by the DP specification.
>=20
> This patch does not add any comments:

Indeed, I think this is a left-over comment from when this hadn't been
split apart from patch "drm/dp: Read AUX read interval from DPCD".

I've dropped that second part in v2.

Thierry

>=20
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/drm/drm_dp_helper.c | 26 +++-----------------------
> >  1 file changed, 3 insertions(+), 23 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_h=
elper.c
> > index 344f887fef2c..1fb3c27cd012 100644
> > --- a/drivers/gpu/drm/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/drm_dp_helper.c
> > @@ -122,17 +122,7 @@ EXPORT_SYMBOL(drm_dp_get_adjust_request_pre_emphas=
is);
> > =20
> >  void drm_dp_link_train_clock_recovery_delay(const u8 dpcd[DP_RECEIVER_=
CAP_SIZE])
> >  {
> > -	unsigned int rd_interval =3D dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
> > -					DP_TRAINING_AUX_RD_MASK;
> > -
> > -	if (rd_interval > 4)
> > -		DRM_DEBUG_KMS("AUX interval %u, out of range (max 4)\n",
> > -			      rd_interval);
> > -
> > -	if (rd_interval =3D=3D 0 || dpcd[DP_DPCD_REV] >=3D DP_DPCD_REV_14)
> > -		rd_interval =3D 100;
> > -	else
> > -		rd_interval *=3D 4;
> > +	unsigned int rd_interval =3D drm_dp_aux_rd_interval(dpcd);
> > =20
> >  	usleep_range(rd_interval, rd_interval * 2);
> >  }
> > @@ -140,19 +130,9 @@ EXPORT_SYMBOL(drm_dp_link_train_clock_recovery_del=
ay);
> > =20
> >  void drm_dp_link_train_channel_eq_delay(const u8 dpcd[DP_RECEIVER_CAP_=
SIZE])
> >  {
> > -	unsigned int rd_interval =3D dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
> > -					DP_TRAINING_AUX_RD_MASK;
> > -
> > -	if (rd_interval > 4)
> > -		DRM_DEBUG_KMS("AUX interval %u, out of range (max 4)\n",
> > -			      rd_interval);
> > +	unsigned int min =3D drm_dp_aux_rd_interval(dpcd);
> > =20
> > -	if (rd_interval =3D=3D 0)
> > -		rd_interval =3D 400;
> > -	else
> > -		rd_interval *=3D 4;
> > -
> > -	usleep_range(rd_interval, rd_interval * 2);
> > +	usleep_range(min, min * 2);
> >  }
> >  EXPORT_SYMBOL(drm_dp_link_train_channel_eq_delay);
> > =20
>=20
> regards
> Philipp

--zx4FCpZtqtKETZ7O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1s97oACgkQ3SOs138+
s6FoXw/+PR9KBjASQ6YVKEniU3deNwsc5CTQhoaIYfjEHOtua+ZZp1A8T/fB2D8K
TBY0ftGIUwp7d0ivMklEA7we5aexC5ZmRSjke5+LQQEfF+GZhTv1esH2++3+O5fo
dMtEuaZ8kZ6GhUSKNZZFuCmHfOrw/PxVdQcgSH85IBqUgPaElLzKKJi9LU0Yr6bo
qCTuHxm5ONFZ9Fr2Z3UAybcyWeHW9q5kOggQBOuCeWU8mdTJpb/yKnE+uKu2Cf0s
RXuv79UCbRT+PFxJjAbpYxc/XydkLD1/XRGIU99U3h+kjK0vM7Gy8a2ioVujxrRa
KXOgEYE/MFrOYaCmC+rdPvoqGxLSHbPOQ/WVLJ6OJjXqt919MjuIDRgDXUN9UAv0
bA0dAzA6Wr7sRdChj9C/5vQYfdNNhMS8yQzH8t7L53wqhyZTLmucPyaNLDBp7umI
pb6j5FHDAvWUyp24GgodwHpW/gITLLcJh/ewNqd0cBlFmTHY8PNoQ9pBAUz3toei
TAwNrznlmhzSLoZfcffR3x/LegIFOhtHQEK+oISurJ70N4EfmFKDAQdzYJPjyfxR
YZBviFB3fCgQv75nVFP5jlCX1cmYGh0rGp9DH5iJIuSRkFKxEQ2S/xqwaLpgfZaf
kOir39RKHR5Daa8l0Dlm3blmbN7t8E3HaC4VBCaiQ+ocrvjnyiQ=
=0SdJ
-----END PGP SIGNATURE-----

--zx4FCpZtqtKETZ7O--

--===============0581501252==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0581501252==--
