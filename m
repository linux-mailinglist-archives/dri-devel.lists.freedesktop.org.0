Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F85AAE518
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 17:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E4A810E829;
	Wed,  7 May 2025 15:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OFSvRMHJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF18C10E829
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 15:42:24 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-441d1ed82faso195985e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 08:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746632543; x=1747237343; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TlQ5hw6LWmdOYpYPvKtDsPG1vnMrD1DZlCe7qiUp07k=;
 b=OFSvRMHJsyvMEJCz6Qli5NlVBiHoPl4poSWNHX3jOIyiZu1vyV6N5JzNEKOHpIPqOU
 jo1JlEWxRN0EyyPlMEpHuzcz+987+I5ASSCza1Sm+d1iNZMB/6GO4N37sDY+E9Ww+Tu2
 DEoQNsOxq9xk212/S/LuIXUGb9p/fDjAQSQQj88XyUwp6+Nq/tVOXnZtzv5d0C0P8img
 yCm9ZJf4gq9ROXnoGaoXhN3qC+0JEa+1pOxEBlUxSykisx8pGagjGbWYYRKVIc6VZfgL
 wQM2bDmw0H+WoTn6niaecHuCx3JuOVeLeAljUd8RiulZyaLNrJ2daurUVddb0dt7szcz
 Rrrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746632543; x=1747237343;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TlQ5hw6LWmdOYpYPvKtDsPG1vnMrD1DZlCe7qiUp07k=;
 b=HCYYsOoyusl/Mbbe1RbJ9dKhGkwrvlYNhOVdXv6xAS884BIM5QaJ75BJJ/W/ejo5i9
 KuwyHzE1L4hsBDZ1oyRyHm77nYDoM6Rn/z+9tT6+kVOus//8LAe+qpRHIvdgOldGmrt7
 VCjIdJxDOB2aHpHlis27BAL3Y0ev1AMpvMJzrHwy7hQwcLv6vQT6ldz2DLDzvlGADBml
 QoFCPCo0PGriqkaK2iYbXUV9gsuz8bM2jICBr6f0w73mns0JI4cxmN2e3GBc+Mb2Xfws
 TpDenFIpD4MwenVpoa0Fla1TKLBm6VgAp+nOHJq5or7I1TBO/2wogsLGEJDEs7MfWqWK
 lwWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW65xAkHZX8aV84maTO2WmSO/5WbtdeI7/gU8FLONOO+C6iOvYg3iQF9Zg0TC6K3GnAHRYiJaaL0Jk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZYDiOxWMOGWDzfxSHM33yzqKl5bKC5c8Uxr+RwFS5PVINub+C
 0QHygn5BwLOhIT3OWqunr4kl2jPeJuI0UEM59Dt0u6scgUkB5lFH7on4Eg==
X-Gm-Gg: ASbGncuKJKUuuaKe/yZ4HsgZcWIeiltlDHYTP8x11gtwheIAfI4xvl+EOaBetpK6PJZ
 3g1BVhMcelUJCYrgQbR8WvJtczLYJSZVrC9A3SLIZy7OkrAs2HXms1I26enRCxwtiBXiHj3jOM9
 DHsfrWcD99G4hM6HQlQs5npvmHUEE+0VXrdDFN9+Wvg+1w3Z8JBDI2A7PfKK9oJbqU+8FXU7vfH
 vt1G791TyyZ0EOvMcs90wxahymaFGzizAC96RFvWvVpHtwyrnTJU7nuqEORINrN+KdyGEe8FeNs
 vIeKXAg5nI5THZZhrqFcAxO5ANQGf/jKVDWV7jpr2J6pqNDKiYI405dR8QHAnzjEftM51hA988/
 SzONmAGYHvHdXkxxvf5+v/ph/1Mo=
X-Google-Smtp-Source: AGHT+IGjXvu9oFQySoHXW/9xwWknPz1Z0gC3AIJFj0PBkN+vPBbSa6+gpsSaULJ4J4weRDJhyGu+Xg==
X-Received: by 2002:a05:600c:4eca:b0:43c:e2dd:98f3 with SMTP id
 5b1f17b1804b1-441d44dd21cmr24445935e9.21.1746632543150; 
 Wed, 07 May 2025 08:42:23 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd3b7b83sm4516915e9.33.2025.05.07.08.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 08:42:21 -0700 (PDT)
Date: Wed, 7 May 2025 17:42:20 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] drm/fbdev-client: Ignore EOPNOTSUPP errors
Message-ID: <7auvkja5skuew55xrpb5vbat3qgopg2mynm2rxxxa4re3ar3ql@jue4ofk5ohl5>
References: <20250412070047.6725-1-thierry.reding@gmail.com>
 <tqvzgt3cyf453x6eovhe2ox5n7w4wacmdjzxpclxsubq3ub7ld@a6fzvt2is2sa>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tcjqysmwuu4pfr7d"
Content-Disposition: inline
In-Reply-To: <tqvzgt3cyf453x6eovhe2ox5n7w4wacmdjzxpclxsubq3ub7ld@a6fzvt2is2sa>
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


--tcjqysmwuu4pfr7d
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/fbdev-client: Ignore EOPNOTSUPP errors
MIME-Version: 1.0

On Sat, Apr 26, 2025 at 08:52:40AM +0300, Dmitry Baryshkov wrote:
> On Sat, Apr 12, 2025 at 09:00:47AM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Recent generations of Tegra have moved the display components outside of
> > host1x, leading to a device that has no CRTCs attached and hence doesn't
> > support any of the modesetting functionality. When this is detected, the
> > driver clears the DRIVER_MODESET and DRIVER_ATOMIC flags for the device.
> >=20
> > Unfortunately, this causes the following errors during boot:
> >=20
> >     [      15.418958] ERR KERN drm drm: [drm] *ERROR* Failed to registe=
r client: -95
> >     [      15.425311] WARNING KERN drm drm: [drm] Failed to set up DRM =
client; error -95
> >=20
> > These originate from the fbdev client checking for the presence of the
> > DRIVER_MODESET flag and returning -EOPNOTSUPP. However, if a driver does
> > not support DRIVER_MODESET this is entirely expected and the error isn't
> > helpful.
> >=20
> > One solution would have been to conditionally call drm_client_setup()
> > only if modesetting is supported. This seems a bit redundant, however,
> > and could further complicate things if ever any DRM clients are added
> > that do not rely on modesetting.
> >=20
> > Instead, simply add an extra check to ignore this expected error and
> > skip the fbdev client registration.
> >=20
> > Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/drm/clients/drm_fbdev_client.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/clients/drm_fbdev_client.c b/drivers/gpu/d=
rm/clients/drm_fbdev_client.c
> > index f894ba52bdb5..8c8552ed912e 100644
> > --- a/drivers/gpu/drm/clients/drm_fbdev_client.c
> > +++ b/drivers/gpu/drm/clients/drm_fbdev_client.c
> > @@ -152,7 +152,11 @@ int drm_fbdev_client_setup(struct drm_device *dev,=
 const struct drm_format_info
> > =20
> >  	ret =3D drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_=
client_funcs);
> >  	if (ret) {
> > -		drm_err(dev, "Failed to register client: %d\n", ret);
> > +		if (ret !=3D -EOPNOTSUPP)
> > +			drm_err(dev, "Failed to register client: %d\n", ret);
> > +		else
> > +			ret =3D 0;
> > +
>=20
> Wouldn't it be better to explicitly return 0 in the beginning of the
> function if !drm_core_check_feature(dev, DRIVER_MODESET) ?

It'd return a bit earlier in that case, so there's that. On the other
hand I think it becomes a little less clear what's going on. In the
above, we already have the appropriate check in a central location and
we reuse that here.

I don't feel very strongly either way, though.

Thierry

>=20
> >  		goto err_drm_client_init;
> >  	}
> > =20
> > --=20
> > 2.49.0
> >=20
>=20
> --=20
> With best wishes
> Dmitry

--tcjqysmwuu4pfr7d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgbf1wACgkQ3SOs138+
s6Fygw/+Mkw6+cuUsTfKqPTm0TmTd8ImHwyo54jIptx737/JkRutAG94/l7qi1P7
NVkueLtx2NF3cAnZeA8nYs5mAQqo71YqjQ4uJqGm5Uc7jrZEiMIz74msZXLChMKY
lW1ELYDC0xRJDDMTQkVO4rZum0E7IavUlLtC1D1taQmfY4nvXJYJJ+d8J0GrqK7S
5eQ02ESYqaCJND+M6Naa5PfP3ab2mKKOzRmU69q6U45s7mWz/2iIZtgs/cJCJU9w
4K+jIMbzAchf1eHdPMWTDDprgpApL0luHB3Wc7t/n60puLawWgsMec+TdMB2hXHy
a9Re1flEbsmbbuHtGtk/jIbuG+9SObcWvHpOQaFHgZO0Lg8kE6XpC2vw2GJ8DkDG
6MJy9+7BpSPqzeF17RQOKM3ILacy85fCeyQFlcD7GZaIUkxII3QledgwqGF4fBs+
n1POebwZEyxAqp6fuAfRIkNo8L7WsJULPIGiRtB6tqv0Z9N+NuCGQoVC7iHhnPbW
dbjj3Kk8dJ9XFNvvN5cXZRdvuftc+m4eCHOTjOJsb4jgY3d+jWN+zwa+yMRnRBlK
5/7oA7wMmIBoor5GFMyitDm0Mk1aEdnxYtTru6T7KqUbbWsqdzV6lnTmYaesSp/k
wclXSwn/h93MdG4QSsbrh7AynYapuR+v49uYv85hPf6RthVKtS8=
=1JI4
-----END PGP SIGNATURE-----

--tcjqysmwuu4pfr7d--
