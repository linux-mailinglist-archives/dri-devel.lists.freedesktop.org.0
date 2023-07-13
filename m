Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4111A75199F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 09:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79CD510E60B;
	Thu, 13 Jul 2023 07:18:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64CE310E60C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 07:18:06 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-992f6d7c7fbso62579366b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 00:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689232684; x=1691824684;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=imQAUE4KBLzEPz1T5FNMGIZyan8EvzWIX1rzI3GOLpY=;
 b=Xo5xO+Fc+I9d3vdflaq5WWZXID4zgLMOcUFoXVuaatgsqmcU+Iz+YfM91gXAXgmHgu
 jtuRuMZyPhhA5sxycs914quMoDArhvjq6ChMBImgP2ns3Ef/WoX6CJc73hucxV4mgr+g
 qnBX+kS0l3ATP5pX4SgWkcrGh+aUTCAke9xA47rp8F9AiEm6ClM8vDb28dmjmOsVNRie
 WPzhJnBKPDLOnIKlIR0POr77Y9kppDFcuqJ7V69TNGMzlRrr5gExUZOFnN2eqELzch4i
 Ya44hO6ZqW0IaHuXltuFpJfYBmImmz7l+R3RP7Rwi+AUAaNt3IBOBIPvYQPYQ8BoWOIG
 dejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689232684; x=1691824684;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=imQAUE4KBLzEPz1T5FNMGIZyan8EvzWIX1rzI3GOLpY=;
 b=YoySHjechETjsjVZvu2/BmDEeN/HYExZ2Iztz8jF3jYBrX2tL7SFWaLfxvYxvlxwt0
 XPIbJkdvsGsv2jvgVn2v67bcLFpq4CpqHeqvvZqBQ8RGaz59oSAxsoleP0nFx0z6gkha
 gjuNFDNhI8Zi7YglpJ7kK266f9CzxvtrrRaSez3qX2yWJRofYfDpnX7lFmxSIRjFfkom
 SkewnpQNYQ8Ko6JJdBsCJ76rqjOG4+pVuMv+SMU1G9fEQVRr3QejsFLdJOrKEnzZYJHs
 HGN5ynlP4qnilDqR/QF8lo8jovSQK/pc113PgasEanToVWB1G5sbNpghKlul7As9jfIl
 vLxg==
X-Gm-Message-State: ABy/qLYVCvxHb/oAK6an4X80vucWRkUQIzicpSrLzpnQE2+y9ipltfrc
 AW041u3v6E0/Pi5Tw61m9CTXYr+lgFM=
X-Google-Smtp-Source: APBJJlEfTiGyWIbwa45J0nnwLfWj1UQoW3DeXV01L4aev7NG1Fsc+BMetEYoN8ju6zQRrE89Dugk4g==
X-Received: by 2002:a17:906:6bc6:b0:988:c3f9:3ad6 with SMTP id
 t6-20020a1709066bc600b00988c3f93ad6mr524287ejs.42.1689232684109; 
 Thu, 13 Jul 2023 00:18:04 -0700 (PDT)
Received: from orome (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a170906390a00b00992b8d56f3asm3579320eje.105.2023.07.13.00.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 00:18:03 -0700 (PDT)
Date: Thu, 13 Jul 2023 09:18:02 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH RFC v1 00/52] drm/crtc: Rename struct drm_crtc::dev to
 drm_dev
Message-ID: <ZK-kw7cnpeAxf1Yp@orome>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <87fs5tgpvv.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GMEB3U1VMeEkRrsV"
Content-Disposition: inline
In-Reply-To: <87fs5tgpvv.fsf@intel.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
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
Cc: dri-devel@lists.freedesktop.org,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--GMEB3U1VMeEkRrsV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Shortening the absurdly long recipient list, Google won't let me send
this otherwise.

On Wed, Jul 12, 2023 at 05:34:28PM +0300, Jani Nikula wrote:
> On Wed, 12 Jul 2023, Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.d=
e> wrote:
> > Hello,
> >
> > while I debugged an issue in the imx-lcdc driver I was constantly
> > irritated about struct drm_device pointer variables being named "dev"
> > because with that name I usually expect a struct device pointer.
> >
> > I think there is a big benefit when these are all renamed to "drm_dev".
> > I have no strong preference here though, so "drmdev" or "drm" are fine
> > for me, too. Let the bikesheding begin!
> >
> > Some statistics:
> >
> > $ git grep -ohE 'struct drm_device *\* *[^ (),;]*' v6.5-rc1 | sort | un=
iq -c | sort -n
> >       1 struct drm_device *adev_to_drm
> >       1 struct drm_device *drm_
> >       1 struct drm_device          *drm_dev
> >       1 struct drm_device        *drm_dev
> >       1 struct drm_device *pdev
> >       1 struct drm_device *rdev
> >       1 struct drm_device *vdev
> >       2 struct drm_device *dcss_drv_dev_to_drm
> >       2 struct drm_device **ddev
> >       2 struct drm_device *drm_dev_alloc
> >       2 struct drm_device *mock
> >       2 struct drm_device *p_ddev
> >       5 struct drm_device *device
> >       9 struct drm_device * dev
> >      25 struct drm_device *d
> >      95 struct drm_device *
> >     216 struct drm_device *ddev
> >     234 struct drm_device *drm_dev
> >     611 struct drm_device *drm
> >    4190 struct drm_device *dev
> >
> > This series starts with renaming struct drm_crtc::dev to drm_dev. If
> > it's not only me and others like the result of this effort it should be
> > followed up by adapting the other structs and the individual usages in
> > the different drivers.
>=20
> I think this is an unnecessary change. In drm, a dev is usually a drm
> device, i.e. struct drm_device *. As shown by the numbers above.

I fully agree with this. I can understand that this is potentially
confusing to people that work across subsystems and aren't used to
seeing this. But to most DRM/KMS developers this is quite familiar
and since they spend much more time on this than the occasional
cross-kernel patch, it outweighs the minor nuisance that this may
be for everyone else.

Since Uwe has already shown that "dev" is the consensus, I think if we
really must have this kind of patch the logical choice would be to
change any struct drm_device * to be named "dev" rather than trying to
establish a new consensus.

> If folks insist on following through with this anyway, I'm firmly in the
> camp the name should be "drm" and nothing else.

Same here. If people can't live with "dev", then simply "drm" seems like
the next best choice. It's short and to the point. A _dev suffix is
redundant because any other DRM structure variables will typically be
named something else anyway (i.e. crtc, connector, encoder, plane, ...
or a corresponding abbreviated form).

Thierry

--GMEB3U1VMeEkRrsV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmSvpSoACgkQ3SOs138+
s6GWHA//Sc7mVxeGp6V/0YMUO1ZL+LWtYFPP1PYM+GKdF3diuRkF4m3p3IJaBnjr
hpTYDAG3eHRprZDqVH5qwULt8oDAhbb/v0y00TjMmJhzajIWd00iupHwaGE8qlwc
KvVeB5lxhverALEFkvJitpaCmOZ5DQakAp01pOrnMIuS84uDtvmw7TDNF0Fa03u/
EvttLaCRhNJnYM2kZciF8hOy0JdsThCj+/JQDnSUN0JOKRX/h2G4RXJnklD36xke
LguchOmBLvJib2aioFfU+jVC323HD5/ADBI8ThDswGwxXMk3o8e6u2Q9pvOQyz7I
2tMM+jhd3ps5WluXGiXZjKyYMOffXUyPcrZ+XmlH56MEfevNkG7SIMLopBXeWpja
3c57vh8XLzZn5pQZ1KdbFVXsVwKupqA4jalvzHeEqOxte3uiIfP4VWun0nwhOKdz
gUb2Ssa7W+Lamd+eBGv5X3tV8x4g3Orzhoqh35EyiMN0gQ3EQPs+KBoHkZyTqjHI
SDA3Ezc0Eu9aXyRixDNtG65nVVcic3V3jVx9Wiq4FXoivLdNT7dKCfADRLzFGQuN
QDfZSUTjCVSiOZG3QYTS9RAkmVvyhqZtETxlLybi9RPKDEbLpuYXCWU4GrvC1wkR
OYfKZCeb/BA784K6J6aJ52sC6uEWKL33qSqINeyaUww74MRfojo=
=zbAF
-----END PGP SIGNATURE-----

--GMEB3U1VMeEkRrsV--
