Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A9BC4853
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 09:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D540F6E8E8;
	Wed,  2 Oct 2019 07:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995946E5EA;
 Tue,  1 Oct 2019 14:31:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 19501B03E;
 Tue,  1 Oct 2019 14:31:25 +0000 (UTC)
Date: Tue, 1 Oct 2019 16:31:06 +0200
From: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
To: Kenny Ho <Kenny.Ho@amd.com>
Subject: Re: [PATCH RFC v4 02/16] cgroup: Introduce cgroup for drm subsystem
Message-ID: <20191001143106.GA4749@blackbody.suse.cz>
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
 <20190829060533.32315-3-Kenny.Ho@amd.com>
MIME-Version: 1.0
In-Reply-To: <20190829060533.32315-3-Kenny.Ho@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 02 Oct 2019 07:18:31 +0000
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
Cc: felix.kuehling@amd.com, jsparks@cray.com, amd-gfx@lists.freedesktop.org,
 lkaplan@cray.com, tj@kernel.org, y2kenny@gmail.com,
 dri-devel@lists.freedesktop.org, joseph.greathouse@amd.com,
 alexander.deucher@amd.com, cgroups@vger.kernel.org, christian.koenig@amd.com
Content-Type: multipart/mixed; boundary="===============1247545010=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1247545010==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

On Thu, Aug 29, 2019 at 02:05:19AM -0400, Kenny Ho <Kenny.Ho@amd.com> wrote:
> +struct cgroup_subsys drm_cgrp_subsys = {
> +	.css_alloc	= drmcg_css_alloc,
> +	.css_free	= drmcg_css_free,
> +	.early_init	= false,
> +	.legacy_cftypes	= files,
Do you really want to expose the DRM controller on v1 hierarchies (where
threads of one process can be in different cgroups, or children cgroups
compete with their parents)?

> +	.dfl_cftypes	= files,
> +};

Just asking,
Michal

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEEoQaUCWq8F2Id1tNia1+riC5qSgFAl2TYykACgkQia1+riC5
qSiNOhAAj+V8JbkviYhAkKfW2XIQz6L02LM+3vfiRHzZZJhcqdSs+4WB6xhmjKme
aG0SzH8NOiWzLpq+XPq4iW4G6v7QNjQcniUtb0kBiGvFfWpczCaFs9K0hyeUKCu0
2Xn/VIVvMqkPWDgirANCa/Dgsc5JMpsGY5A+E44aiPyqO/6UrQSDYXmvqu7132yx
L/4UtNJpH2SFnGJ7l0n1Gspe8W50WkKEscmLh3jlWcPFqUNY3JpdZ6rJ+LniGVck
xdEGSGbGnoZmfkg+lCLTnVU8p8fPUHh6Z8ZRoUey9d63+XCNvNqpWLfTp72kgIRr
48XrUaUKu49DO081Qehg4hLFb6uayHfoXMDHR/URLStF3AdPF3XZ/pStA3A0owp8
HztqK6hn/BfZuDSMZ5Vvtfqkqqjq68EmMdZ0TI4Ab/9dY5RMthv8ADVbKE58vC8K
KF4jbEKJFUGNWUpSVuX2BJOE9rTOk64MqSUmJs2KDKTZnwLeuOlHoUYUH1YLHxsj
6SEZZ6+3hiHMGQYAFz6bxSvzF/abDe/O9tW/MnOQT3VkxHBSWnMyC3j0KRlgUJ/j
HnWawWW4SPRkhykkzBxpp2Qs4YY29JqiExVfmFxQlt46MgnqH4V9DteH0H7EI0MY
eUvqey3L9y3hBv1B8Z9XjOix4HwxFpK4HZH8SrQArcyeThtNnuE=
=je6w
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--

--===============1247545010==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1247545010==--
