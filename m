Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3243EB419
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 12:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3B26E5B2;
	Fri, 13 Aug 2021 10:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 237716E5B2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 10:34:01 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 l10-20020a05600c4f0a00b002e6be174c29so2564436wmq.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 03:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=drW2s19rJYY7O+/Nya4xV6OqunsSjSmEFOmQUF4SWn0=;
 b=oL1NrgoJyE6uPktlm9mvl/Hvw/tIOrg/EZ08olU3Xg+JsAoV2Y4ydt0DoD5BD8KE1U
 tJqRuK3m9cMFnp9WclHDAZrVUFsee6nzpZnYMafiRQg9PMYTfFm83TZZOdX8wfrI2GL8
 WQUVJiNEy1TKLjwSBjh2di9eBIepMmvanFrKIHuCIM/7EhN63B9hPYwOLeGuXoUPog0M
 PB9Utd323wHVPK4pndDILTiNaVeup2+o5Nu46YYMb9Lhr6TQ5sEqPrTZLbYoxj39Rv/f
 yE4Yz/2ZSdKCpAeCYY/mJTbi9XP0A/ZfY9xVnGthbted7Mkc3pZVte/7pBgHE3+/jkXN
 hM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=drW2s19rJYY7O+/Nya4xV6OqunsSjSmEFOmQUF4SWn0=;
 b=YQpKcP5z4qdyyhISLc0ZhBs+RjrUrm+y9t96ulepVQM6ofHKtDemXddCTLMMBbCC7L
 xRovtuHbX5DnXBNNXO3O+lGYrRp/09bbj179CcpG6gRD8/e/Qv8oLSK14enKetqJ2CGD
 9qIdCViPQDM6wGMovyA7+PICJMdjgV2duDumsgImi80HEU1EEyPx0EgCDnhCIt+UYIK0
 kcdKIOEDpd2/1pHNdMYJON5M6hmTOvdg7smq7R3X0VSktc9YUU7P3J/FUyAPL1HRqXd0
 8nHSJaYx4d4Epo9ag4/E7JEA88C+uRcxIqxfnlCxUQ3DsSb1HdaqXRLZTycCS/22jZnD
 FS6g==
X-Gm-Message-State: AOAM5322tvKe7yfRiRwHr5j+XouMDCVT2zdZq0j0URq+HXx3ju4Ry0tf
 7yAbVreWTOdKevGkF1GmIh4=
X-Google-Smtp-Source: ABdhPJxmxhsijAM34+CEGEwXblQ+l9BM4uTixQ7AV2powo98NdVrFoPPbQnDhY1n2OXBGlt5HfMSjQ==
X-Received: by 2002:a7b:c40e:: with SMTP id k14mr2010883wmi.46.1628850839619; 
 Fri, 13 Aug 2021 03:33:59 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id z13sm1151315wrs.71.2021.08.13.03.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 03:33:58 -0700 (PDT)
Date: Fri, 13 Aug 2021 12:33:57 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matt Merhar <mattmerhar@protonmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH v18 0/2] Add memory bandwidth management to NVIDIA Tegra
 DRM driver
Message-ID: <YRZKlYg5YQlbmqFg@orome.fritz.box>
References: <20210601042108.1942-1-digetx@gmail.com>
 <8accfe1e-fc48-21ca-f7c6-bd2d60162e6d@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jrvKOVFBTGi4etd5"
Content-Disposition: inline
In-Reply-To: <8accfe1e-fc48-21ca-f7c6-bd2d60162e6d@gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
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


--jrvKOVFBTGi4etd5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 07, 2021 at 01:40:06AM +0300, Dmitry Osipenko wrote:
> 01.06.2021 07:21, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > This series adds memory bandwidth management to the NVIDIA Tegra DRM dr=
iver,
> > which is done using interconnect framework. It fixes display corruption=
 that
> > happens due to insufficient memory bandwidth.
> >=20
> > Changelog:
> >=20
> > v18: - Moved total peak bandwidth from CRTC state to plane state and re=
moved
> >        dummy plane bandwidth state initialization from T186+ plane hub.=
 This
> >        was suggested by Thierry Reding to v17.
> >=20
> >      - I haven't done anything about the cursor's plane bandwidth which
> >        doesn't contribute to overlapping bandwidths for a small sized
> >        window because it works okay as-is.
>=20
> Thierry, will you take these patches for 5.14?

As discussed offline, I've picked these up for v5.15 with a small patch
squashed in to unbreak the Tegra186 and later support.

Thanks,
Thierry

--jrvKOVFBTGi4etd5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEWSpUACgkQ3SOs138+
s6EO5g/6Asf0AlKgNnrGVq250gnG5jSscO5GxTFzO9VNbuIHOOLJlKqBkx2fLXl3
TwKAtaQDfNzRiBVgCMk6xsxAas49cESh82NXgZSvsdU0O9+7PcMaK2IfPtZNHLSI
ClDiIi/WSdy9BsfUllfq4o1WkkzNQGUSiD+mAc/GaL/PxSEk7gc70vyg5cHl2Haa
yIrvXGZu9SlQ8b5MY9vdUK22xBvjd8+dRmmYDpm/wHFUfQC0Q/OpaPpxBi64OEuh
f+L25WJNJHimkXgrokDcDqtu9dVfS5k00qN6tG44jjDpLHn1rDmwU6P7lHgvr08G
+3tNJCLSAToYLKu8m0GYkYuB9gXyeb/YbRISJfm5pFkl1lWJ+4oM3ic+GWLaUlLe
2VwStFgoYK+um7AWuUYXGItLbU+w/x/U13ScGSABCGhQwu9y2KCKHtkOjCF3S1Nr
54hnTr1dmJx/sJvkU62txM5xiLMmjN/5bGUfvmMZoahbUSDumcPF4tgiEPBwZVRx
5LfVRCOih6+U0SIN52c1bVQ4ujwGF4wpHpFYP6IFEf+bHGV7J8ht5qgwdeWrBS3K
WdJ4XOkRugfXjUmspnry7kCsn5bR358Pj9qdXZvgOnrUWMyx8UH/2GugoMedTxJ0
QbCpolRbjR0Ief0B1CZcgDlonGaGOCJWA9fxaecjokALpIm3sm0=
=K59I
-----END PGP SIGNATURE-----

--jrvKOVFBTGi4etd5--
