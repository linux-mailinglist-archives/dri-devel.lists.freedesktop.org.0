Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AED53845B5
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:26:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86446E625;
	Wed,  7 Aug 2019 07:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680206E556
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 20:25:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 612E928C03F
Date: Tue, 6 Aug 2019 13:25:46 -0700
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] drm/panfrost: Add "compute shader only" hint
Message-ID: <20190806202546.GA4872@kevin>
References: <20190806195259.3531-1-alyssa.rosenzweig@collabora.com>
 <CAL_Jsq+B1jv-TzQe8oQPLS8+JPH80spe=z_SK8umtpw5AXG3Qw@mail.gmail.com>
 <20190806201129.GA4119@kevin>
 <CAL_JsqLfiYScsBGe4C=n=WVTP+bNwig7HruO7FvrSsHqD5mEkg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLfiYScsBGe4C=n=WVTP+bNwig7HruO7FvrSsHqD5mEkg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 07 Aug 2019 07:26:18 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>
Content-Type: multipart/mixed; boundary="===============1994480762=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1994480762==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > It's not obvious to me when it actually needs to be enabled. Besides the
> > errata, it's only when... device_nr=3D1 for a compute-only job in kbase?
> >
> > I'm afraid I don't know nearly enough about how kbase plumbs CL to grok
> > the signifiance...
>=20
> Figuring out the nr_core_groups was the complicated part of this as I
> recall. Seems like we should at least figure out if we (or will need)
> PANFROST_JD_REQ_CORE_GRP_MASK added to the UAPI as well.

I suspect this is something OpenCL/Vulkan specific. Hopefully Stephen
can shine some light here :)

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl1J4kUACgkQ/v5QWgr1
WA1ZUhAAo/PqiBh8nyTAMdXlhY47UyzGOCwLT/HDMXBYf2JVMH/6Dm3WWc52Xniw
YUGB9btkqKQJVkZ4PtafJ/UAgG857dK3rZe489h5tPtaRZrhWoe7TTLrUdZZfiLY
uT2yeQCIo4YIc544k73VM3AC0GmTT9A1tu03CCCj4NdQnXtjOeM6WKsvkVgWGolm
9Hoz1CPFH6IjUrlIpDNV7HbwmtIr0QU9l5JI5rl3hqRFqIj/VFG0P4mcZMlowXr/
zvEYr5wuv/9OcBKb1zScKBMerdBKord1luByzGuK0MEYzoaX5ELaG7WBC4mPMabT
ip4+0Gsc02KbQmu8qgI3A3PqB3PT7yFblUVOCQQtjmylFQx5R8cWee+0H9x6ns+w
EE3JfdqaxGKQFFLDQp4zVgFekHTfIaMZ+hYRJCP/So20hkEJFF96oKyKCJC+VZbw
JavBqIzxEzPUf8LYVhX6jyK6k58OtM2jdtPPwQQkc2hQW+BEiVX6H/raC9CVzoS4
y+hULx/r/GzgC3cv86hfp95UeNtZQQ5qv41qbyGs0OFy0VEGMycUFintRLnFV772
DZfUabvVTdxJjxY+ypg6M0oEnfIsrsXrYZ1yMoc3uO8HbtHk6Qjia7KA/LxVZ1lN
QnnjDkNNbFktw4YAnbUm2Bp6+UXznE3EB62Pk6A0xTyp3soJAks=
=V7M2
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--

--===============1994480762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1994480762==--
