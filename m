Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3AA347B81
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:01:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3446EA26;
	Wed, 24 Mar 2021 15:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730866EA26
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:01:44 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 u5-20020a7bcb050000b029010e9316b9d5so1370444wmj.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ozgkKBnPgzZpMk+NLeLUK1O40arp+27rcVK+9sn9QdA=;
 b=fiEGmxzf0LgQzbZ7ctEFtBWRfddGh8OwrG4zWflAAR8mQvp9lbzFx32LV+Sy72W7Va
 fEdb8Zp6dxLbmpSFZjVBdsC/+bARDUzDDeUf+JUHbh6UAzxXuZjg6jW3NN1ALniHlwab
 4MS9ARKRL56YiZF8gFM7tB1aKgfEj1nb6tvnsH3Pur56raH1upW2rJiJbEJMwNXTlzQz
 5pusPf7dGUdkxzlmVpgFG0sP73hNEc3XeFEpdZaQw2/UbirWUKYwbDKebXmBJLybiCpj
 QccRGnM0iQZnMc8Pt/uE2/QP0OfaSVJ/4JhyuZLAVLE3cXpX7BHcG9D4O9pO60bKp4l7
 d9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ozgkKBnPgzZpMk+NLeLUK1O40arp+27rcVK+9sn9QdA=;
 b=gj8KSaZ0+/LbsmGJA8TX/rlC4g0+7nwQc0oIp5hYy1sf5G+2YumKcbyl4cTVq65TyG
 dCdYs/rJtrHrFjsqXZkHXGwGLKDKLnHyM2ri8968D1eWY/1eTXBZqwT/GzwAzQ6J0kUv
 sMr0dV9I3+mGYG3W7UKqemO5SHl2aYMxtRzAp1P42vuzCL9TrNJ+nPEqTMnC4v8+n30Y
 OE6ljBDrtmYH5Va9/ObqR5Iyh/AekQGJJezs2LfwVcMPI+qgCRTMD2KePPb5Nz8G3XIe
 jFSu6rYC8XZrN/XdyeT8RUD+H+MwJsUDsBkhL9D2rGZve8rzzMA8bOSvr51QtRCZkGU4
 negw==
X-Gm-Message-State: AOAM530yEIukeL+4pIEHpi+XXi/RHoJfnM5bIvf+8WGNP250IqP35uqv
 oU0zpKlLBbwciKhu/K2I4Wg=
X-Google-Smtp-Source: ABdhPJyJA74grQrQ0FO01q13W5xCGT/jw7NZtR7jNbmWETb5SOep8SrxZZQq7PenS9a946ramfGyOw==
X-Received: by 2002:a1c:771a:: with SMTP id t26mr3405731wmi.60.1616598102853; 
 Wed, 24 Mar 2021 08:01:42 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id 1sm6851218wmj.0.2021.03.24.08.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:01:41 -0700 (PDT)
Date: Wed, 24 Mar 2021 16:02:02 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 6/9] drm/tegra: gem: Add a clarifying comment
Message-ID: <YFtUalHlk9YiH03n@orome.fritz.box>
References: <20210323155437.513497-1-thierry.reding@gmail.com>
 <20210323155437.513497-7-thierry.reding@gmail.com>
 <21d2e691-6404-503b-422a-be97a7b9d1b4@gmail.com>
MIME-Version: 1.0
In-Reply-To: <21d2e691-6404-503b-422a-be97a7b9d1b4@gmail.com>
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
Cc: Mikko Perttunen <cyndis@kapsi.fi>, David Airlie <airlied@linux.ie>,
 James Jones <jajones@nvidia.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1566344914=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1566344914==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MOE9NLKQk3uuQJql"
Content-Disposition: inline


--MOE9NLKQk3uuQJql
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 05:41:08PM +0300, Dmitry Osipenko wrote:
> 23.03.2021 18:54, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Clarify when a fixed IOV address can be used and when a buffer has to
> > be mapped before the IOVA can be used.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/drm/tegra/plane.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plan=
e.c
> > index 19e8847a164b..793da5d675d2 100644
> > --- a/drivers/gpu/drm/tegra/plane.c
> > +++ b/drivers/gpu/drm/tegra/plane.c
> > @@ -119,6 +119,14 @@ static int tegra_dc_pin(struct tegra_dc *dc, struc=
t tegra_plane_state *state)
> >  		dma_addr_t phys_addr, *phys;
> >  		struct sg_table *sgt;
> > =20
> > +		/*
> > +		 * If we're not attached to a domain, we already stored the
> > +		 * physical address when the buffer was allocated. If we're
> > +		 * part of a group that's shared between all display
> > +		 * controllers, we've also already mapped the framebuffer
> > +		 * through the SMMU. In both cases we can short-circuit the
> > +		 * code below and retrieve the stored IOV address.
> > +		 */
> >  		if (!domain || dc->client.group)
> >  			phys =3D &phys_addr;
> >  		else
> >=20
>=20
> This comment is correct, but the logic feels a bit lame because it
> should be wasteful to re-map DMA on each FB flip. Personally I don't
> care much about this since older Tegras use pinned buffers by default,
> but this shouldn't be good for T124+ users.

I'm not terribly thrilled by this either, but it's the only way to do
this when using the DMA API because we don't know at allocation time (or
import time for that matter) which of the (up to) 4 display controllers
a framebuffer will be shown on. tegra_dc_pin() is the earliest where
this is known and worst case that's called once per flip.

When the IOMMU API is used explicitly, we always map framebuffers into
the IOMMU domain shared by all display controllers at allocation or
import time and then we don't need to pin at flip time anymore.

I do have a work-in-progress patch somewhere that creates a mapping
cache to mitigate this problem to some degree. I need to dig that up and
do a few measurements because I vaguely recall this speeding up flips by
quite a bit (well, except for the very first mapping, obviously).

> Perhaps dumb buffers should be pinned to display by default and then we
> should extend the Tegra UAPI to support BO mapping to display client(?).

That would kind of defeat the purpose of a generic KMS UAPI.

Thierry

--MOE9NLKQk3uuQJql
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBbVGcACgkQ3SOs138+
s6ESdQ/+NdmpXXTy+kfj08xBu0B2l8gbhdG6adBF4aOVFuPB0EwEKyxLuu53/X71
m/BY61DL8narC8NACDbRv0vkkabv4yWj/GApc2dI6oTHwpyHhmHwGm+n7WLAXSUj
RftK+EU1GoXDqzWwJJEv/2S0AZvUjQxnpCHNDU/lzyfeHejerSNL8GqtvYirzdjg
7L+MlVTs8QTVGJRrbs97AVI5WaLRmvzSVId6gwUJZlOAg9mFGDzbhac1SyUj2csi
F1l7yp9fNWOGaOwhCubULd2+9aXBOkkoLrH6IIa1BPNWF0l6yLMqMqdWQr/dadZU
T/tCW/9Il+ieIIPmNJiIwGxSuu73zjxiS1HSST71a8uoR4jX4xtB0nVbLPt+MCCH
oGUozUEGJPHdOFpca3+AulagTnwy/U2Ghi+/Ixz5MiTaDSL9JqgvsnrAWS52wTRj
Ex5Z6yAMc3yGvuuMYFZ77zPvBN1lcCCosiH9rX7Yj8LSJGfZgtz525XdZZ0KiWwX
VV3TenZomI1nZcM6Dd9mCKPmno/TFQfabqV6qEcMFJOV54sHSsK8W/tpUIonOqc0
8xfo4CP8skJWN7nc/BNvLAPn9uJ68FnEyvoz5MqpwRCn4CHJDw1LMYOj6kWX0Cip
SD93wAN286Mttms5gGXjiX64drX7TVlWtqxuwoCQoyBcdi1bwfQ=
=5Bcx
-----END PGP SIGNATURE-----

--MOE9NLKQk3uuQJql--

--===============1566344914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1566344914==--
