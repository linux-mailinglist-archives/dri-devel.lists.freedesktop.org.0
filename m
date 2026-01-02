Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A289CEDAC8
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 07:17:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 679F810E046;
	Fri,  2 Jan 2026 06:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jKKYwXAy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC0E10E055
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 06:17:23 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b4755f37c3eso7929954a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jan 2026 22:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767334643; x=1767939443; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:date:user-agent:message-id
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9tu4+qvE4HVhlD3XFHpS0OFSs6sZmg8C8rk5ZdNmyzE=;
 b=jKKYwXAyn0hEb5HkqOz94eDy+H/W1YuavH9hBqa4scsI7W+MCVeG1zTVv9LKSegprB
 XUDVE3eqoWSCQVnSpa8XkMT4poJuCguQs5Xc6Nq4x6v567TWlLXVrdeuwlxdHLZNzHLa
 doZF0j0ugpnI0BvjOqOj05dqMXHAfPBOH+PZv4CoGEepSDAJ7UicDfk9D1CDE7GYwSsE
 Ae45UVqpRZM5Rs9strb9pkXFdgKKFNkgVmHolfDbc3QcwXS2DJh0Pkv/cYVRLEf4EboX
 UKz9mVJHjKWecbrCUoP4idB50qc3FF/cUJbImlEgoTT9TQf1WpxQRSiSFkxnX4BM36vP
 fjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767334643; x=1767939443;
 h=mime-version:references:in-reply-to:date:user-agent:message-id
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9tu4+qvE4HVhlD3XFHpS0OFSs6sZmg8C8rk5ZdNmyzE=;
 b=I7Fv+GTwKAO0jEEsWMgU0MuAXCQ9hiTmtvXWWlRDeumhDslT3FTiGah4IcZqbNBsXu
 HVhh09BdzTTM94xwygnDmULzxN+SUl+fYxEZfGw7qjAJo0PX5QrqexuuyZ3wssJLvk5x
 wMixzGaDoL4s/QC/C0aSyiXI5curX3qNcn4ndjU2aljfMM7fuehz4JItD9WxpT7HBxl2
 e6r9qas73JHdJAoyNG/2Ggo1ccbyRr/H5zHXqHh3/w84zuijNr1rv0wqpBrBmRquEmnZ
 h+kLUOoGaDvGJEugmzz1HGy178KPoT3iz8GtOX1pnvPeKHVYqMYa9i5p194wB5ytB14T
 c3Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuiFCKem7teNCG6v94saB6tcM9l5JM/5rOzgocQZtSDugaqFSms66hb0VspIjztFQbdc4sEO2zBLE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzy5D7PA/bd+wBlWcWcLbBXCluzV8Fz2LNNMDJy0UDS4epuavQf
 ZdqqG9aEmyQkANwGpvlqqWXPs7zdu72DlLFbvowqUbC1xlYcsSV2Nuht
X-Gm-Gg: AY/fxX5InXmUoX7QoasU8pvDoo97ZK8s1HgubFFNNPe7kLgAANZXWmrOXsBIrGAkddO
 l4OBysKSvKgR3bh71qcYnYw2F2LhFrKDZs4jZqnR1TdTZvuWTCGkMGOhFhK9GTQhiSEI5lukPBT
 jbua4mE2FIUzjMoswBIs/r+pg56hT4ignPfsIDFai8E7RmRS9FcAZ8Tf3M6zEcO6i1cDrQPwLnc
 xgkykijLss2/cK9PR9QxkPABVV3gignW4pAlgZQeYRJEQ8TKxoqfoTdR6T6scHWDL93CGzmQXvC
 Kv+noL0AV6DzC+J5bXiabyB6sO6QpGsvFcpp3JrC8WL4ZxVzrtEgeQXjTyT5Y4KjEWQMmXmgq9m
 b+38lStr8iPufhECVc4pLLz1R4O+tM3hORrtBGZomnxez9ZveHXTNImpV/Hp9S7n5Rgq/pvAKs1
 8=
X-Google-Smtp-Source: AGHT+IHFpVYh+rorOZKdQRWoZhugs0CHqY2P8dMbar8W2hgy3i7fuX7M+pBhDPEO+z8g5iSqn3uNwg==
X-Received: by 2002:a05:7022:e80c:b0:11d:f44d:34db with SMTP id
 a92af1059eb24-121722ec1a5mr33889693c88.35.1767334643190; 
 Thu, 01 Jan 2026 22:17:23 -0800 (PST)
Received: from localhost ([2600:6c51:4c3f:8e93::cef])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1217243bbe3sm159501293c88.0.2026.01.01.22.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jan 2026 22:17:22 -0800 (PST)
From: Christopher Snowhill <kode54@gmail.com>
To: Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 stable@vger.kernel.org, Lyude Paul <lyude@redhat.com>,
 Timur Tabi <ttabi@nvidia.com>
Subject: Re: [PATCH] nouveau: don't attempt fwsec on sb on newer platforms.
Message-ID: <176733464054.3438.4631752218787568258@copycat>
User-Agent: Dodo
Date: Thu, 01 Jan 2026 22:17:20 -0800
In-Reply-To: <4ba1b583-8ae3-4698-8fde-0084f7f9cbf9@linux.dev>
References: <20260102041829.2748009-1-airlied@gmail.com>
 <4ba1b583-8ae3-4698-8fde-0084f7f9cbf9@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="pgp-sha512"; boundary="===============8364432865010440589=="
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

--===============8364432865010440589==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable



On Thu 01 Jan 2026 09:21:26 PM , Matthew Schwartz wrote:
> On 1/1/26 8:18 PM, Dave Airlie wrote:
> > From: Dave Airlie <airlied@redhat.com>
> >=20
> > The changes to always loads fwsec sb causes problems on newer GPUs
> > which don't use this path.
> >=20
> > Add hooks and pass through the device specific layers.
> >=20
> > Fixes: da67179e5538 ("drm/nouveau/gsp: Allocate fwsec-sb at boot")
>=20
> Closes: https://lore.kernel.org/nouveau/59736756-d81b-41bb-84ba-a1b51057cdd=
4@linux.dev/
> Tested-by: Matthew Schwartz <matthew.schwartz@linux.dev>
>=20
> Thanks,
> Matt

Closes:
https://lore.kernel.org/all/176682185563.8256.115798774340102079@copycat/
Tested-by: Christopher Snowhill <chris@kode54.net>

My thanks as well,
Christopher

>=20
> > Cc: <stable@vger.kernel.org> # v6.16+
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: Timur Tabi <ttabi@nvidia.com>
> > Signed-off-by: Dave Airlie <airlied@redhat.com>
> > ---
> >  .../gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c   |  3 +++
> >  .../gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c   | 12 +++-------
> >  .../gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c   |  3 +++
> >  .../gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c   |  3 +++
> >  .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    | 23 +++++++++++++++++--
> >  .../gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c   | 15 ++++++++++++
> >  .../gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c   |  3 +++
> >  7 files changed, 51 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c b/drivers/gp=
u/drm/nouveau/nvkm/subdev/gsp/ad102.c
> > index 35d1fcef520bf..b3e994386334d 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
> > @@ -29,6 +29,9 @@ ad102_gsp =3D {
> >  	.sig_section =3D ".fwsignature_ad10x",
> > =20
> >  	.booter.ctor =3D ga102_gsp_booter_ctor,
> > +=09
> > +	.fwsec_sb.ctor =3D tu102_gsp_fwsec_sb_ctor,
> > +	.fwsec_sb.dtor =3D tu102_gsp_fwsec_sb_dtor,
> > =20
> >  	.dtor =3D r535_gsp_dtor,
> >  	.oneinit =3D tu102_gsp_oneinit,
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c b/drivers/gp=
u/drm/nouveau/nvkm/subdev/gsp/fwsec.c
> > index 5037602466604..8d4f40a443ce4 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
> > @@ -337,16 +337,10 @@ nvkm_gsp_fwsec_sb(struct nvkm_gsp *gsp)
> >  }
> > =20
> >  int
> > -nvkm_gsp_fwsec_sb_ctor(struct nvkm_gsp *gsp)
> > +nvkm_gsp_fwsec_sb_init(struct nvkm_gsp *gsp)
> >  {
> > -	return nvkm_gsp_fwsec_init(gsp, &gsp->fws.falcon.sb, "fwsec-sb",
> > -				   NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB);
> > -}
> > -
> > -void
> > -nvkm_gsp_fwsec_sb_dtor(struct nvkm_gsp *gsp)
> > -{
> > -	nvkm_falcon_fw_dtor(&gsp->fws.falcon.sb);
> > +       return nvkm_gsp_fwsec_init(gsp, &gsp->fws.falcon.sb, "fwsec-sb",
> > +                                  NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB);
> >  }
> > =20
> >  int
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c b/drivers/gp=
u/drm/nouveau/nvkm/subdev/gsp/ga100.c
> > index d201e8697226b..27a13aeccd3cb 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
> > @@ -47,6 +47,9 @@ ga100_gsp =3D {
> > =20
> >  	.booter.ctor =3D tu102_gsp_booter_ctor,
> > =20
> > +	.fwsec_sb.ctor =3D tu102_gsp_fwsec_sb_ctor,
> > +	.fwsec_sb.dtor =3D tu102_gsp_fwsec_sb_dtor,
> > +
> >  	.dtor =3D r535_gsp_dtor,
> >  	.oneinit =3D tu102_gsp_oneinit,
> >  	.init =3D tu102_gsp_init,
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c b/drivers/gp=
u/drm/nouveau/nvkm/subdev/gsp/ga102.c
> > index 917f7e2f6c466..a59fb74ef6315 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
> > @@ -158,6 +158,9 @@ ga102_gsp_r535 =3D {
> > =20
> >  	.booter.ctor =3D ga102_gsp_booter_ctor,
> > =20
> > +	.fwsec_sb.ctor =3D tu102_gsp_fwsec_sb_ctor,
> > +	.fwsec_sb.dtor =3D tu102_gsp_fwsec_sb_dtor,
> > +=09
> >  	.dtor =3D r535_gsp_dtor,
> >  	.oneinit =3D tu102_gsp_oneinit,
> >  	.init =3D tu102_gsp_init,
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu=
/drm/nouveau/nvkm/subdev/gsp/priv.h
> > index 86bdd203bc107..9dd66a2e38017 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
> > @@ -7,9 +7,8 @@ enum nvkm_acr_lsf_id;
> > =20
> >  int nvkm_gsp_fwsec_frts(struct nvkm_gsp *);
> > =20
> > -int nvkm_gsp_fwsec_sb_ctor(struct nvkm_gsp *);
> >  int nvkm_gsp_fwsec_sb(struct nvkm_gsp *);
> > -void nvkm_gsp_fwsec_sb_dtor(struct nvkm_gsp *);
> > +int nvkm_gsp_fwsec_sb_init(struct nvkm_gsp *gsp);
> > =20
> >  struct nvkm_gsp_fwif {
> >  	int version;
> > @@ -52,6 +51,11 @@ struct nvkm_gsp_func {
> >  			    struct nvkm_falcon *, struct nvkm_falcon_fw *);
> >  	} booter;
> > =20
> > +	struct {
> > +		int (*ctor)(struct nvkm_gsp *);
> > +		void (*dtor)(struct nvkm_gsp *);
> > +	} fwsec_sb;
> > +
> >  	void (*dtor)(struct nvkm_gsp *);
> >  	int (*oneinit)(struct nvkm_gsp *);
> >  	int (*init)(struct nvkm_gsp *);
> > @@ -67,6 +71,8 @@ extern const struct nvkm_falcon_func tu102_gsp_flcn;
> >  extern const struct nvkm_falcon_fw_func tu102_gsp_fwsec;
> >  int tu102_gsp_booter_ctor(struct nvkm_gsp *, const char *, const struct =
firmware *,
> >  			  struct nvkm_falcon *, struct nvkm_falcon_fw *);
> > +int tu102_gsp_fwsec_sb_ctor(struct nvkm_gsp *);
> > +void tu102_gsp_fwsec_sb_dtor(struct nvkm_gsp *);
> >  int tu102_gsp_oneinit(struct nvkm_gsp *);
> >  int tu102_gsp_init(struct nvkm_gsp *);
> >  int tu102_gsp_fini(struct nvkm_gsp *, bool suspend);
> > @@ -91,5 +97,18 @@ int r535_gsp_fini(struct nvkm_gsp *, bool suspend);
> >  int nvkm_gsp_new_(const struct nvkm_gsp_fwif *, struct nvkm_device *, en=
um nvkm_subdev_type, int,
> >  		  struct nvkm_gsp **);
> > =20
> > +static inline int nvkm_gsp_fwsec_sb_ctor(struct nvkm_gsp *gsp)
> > +{
> > +	if (gsp->func->fwsec_sb.ctor)
> > +		return gsp->func->fwsec_sb.ctor(gsp);
> > +	return 0;
> > +}
> > +
> > +static inline void nvkm_gsp_fwsec_sb_dtor(struct nvkm_gsp *gsp)
> > +{
> > +	if (gsp->func->fwsec_sb.dtor)
> > +		gsp->func->fwsec_sb.dtor(gsp);
> > +}
> > +
> >  extern const struct nvkm_gsp_func gv100_gsp;
> >  #endif
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gp=
u/drm/nouveau/nvkm/subdev/gsp/tu102.c
> > index 81e56da0474a1..04b642a1f7305 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
> > @@ -30,6 +30,18 @@
> >  #include <nvfw/fw.h>
> >  #include <nvfw/hs.h>
> > =20
> > +int
> > +tu102_gsp_fwsec_sb_ctor(struct nvkm_gsp *gsp)
> > +{
> > +	return nvkm_gsp_fwsec_sb_init(gsp);
> > +}
> > +
> > +void
> > +tu102_gsp_fwsec_sb_dtor(struct nvkm_gsp *gsp)
> > +{
> > +	nvkm_falcon_fw_dtor(&gsp->fws.falcon.sb);
> > +}
> > +
> >  static int
> >  tu102_gsp_booter_unload(struct nvkm_gsp *gsp, u32 mbox0, u32 mbox1)
> >  {
> > @@ -370,6 +382,9 @@ tu102_gsp =3D {
> > =20
> >  	.booter.ctor =3D tu102_gsp_booter_ctor,
> > =20
> > +	.fwsec_sb.ctor =3D tu102_gsp_fwsec_sb_ctor,
> > +	.fwsec_sb.dtor =3D tu102_gsp_fwsec_sb_dtor,
> > +
> >  	.dtor =3D r535_gsp_dtor,
> >  	.oneinit =3D tu102_gsp_oneinit,
> >  	.init =3D tu102_gsp_init,
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c b/drivers/gp=
u/drm/nouveau/nvkm/subdev/gsp/tu116.c
> > index 97eb046c25d07..58cf258424218 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
> > @@ -30,6 +30,9 @@ tu116_gsp =3D {
> > =20
> >  	.booter.ctor =3D tu102_gsp_booter_ctor,
> > =20
> > +	.fwsec_sb.ctor =3D tu102_gsp_fwsec_sb_ctor,
> > +	.fwsec_sb.dtor =3D tu102_gsp_fwsec_sb_dtor,
> > +
> >  	.dtor =3D r535_gsp_dtor,
> >  	.oneinit =3D tu102_gsp_oneinit,
> >  	.init =3D tu102_gsp_init,
>=20

--===============8364432865010440589==
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
MIME-Version: 1.0

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEdiLr51NrDwQ29PFjjWyYR59K3nEFAmlXYvAACgkQjWyYR59K
3nE1yQ/9EJVWTNypR4Qp9EdmQu8lGbilKZCbxy9izW/fLgrRyeZwT2NX7nDV67uC
lDT/6jsgs6BeCeKKnJeEwoH15fEuRkh9CnXQ4R0dl9Zea8nXWpaGBf5SAhSpZxdP
pYKTWN1XUUWDFrzEwiBkF9etrzQnEfnmY2SxO/fBXiQ0A4u94KxuWMZ3zEc6YoPQ
Lp2r2/N2trJII7wlhSTPGsVf7+X0eYUxFyzEEAJ7TsOyu4U4rFBBMaSClHXmPHTV
bVYIRyPtsRULdaNVxgrQQmbrstjUM7R9crBCo6WhIa7EAhOj7mRG/q+jRIyjr/g+
bFG1K8EUAcC04eTuLFAjPMW2mfUwDh6HVzQ6+Lzqc1ljbcbxpNkN3PgiQ/e7CyYA
fc8gPCYU0/yzpcIcriqH+Yu/t17Fxdr9EqVcLS5VcAUKifcGl++gauK0MO2R7UWq
5L1DXk3u2Y+d9gmOdOyrt3f/7dZSJTXz0IlLdZWb71oM0Vu+UeIhM8zG5qtz1ejO
ovMgReAoKwDc1tdIj5Uo9ERe6R6HAoJhEPQ2q7rPpKZO7+4MEoA1rRpssMEeRCtj
S0us+sSpwg/udEO8QyBkyQ9LyGln3KUd6hH78k7WEoJQhU1ukS19TifV7RAHLIOq
c47v0A68w2DI8txaU7N2tCDOkH0Ayce59RbVgzdT/hP0srJeMYY=
=7N2B
-----END PGP SIGNATURE-----

--===============8364432865010440589==--
