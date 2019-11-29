Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB3D10DDC1
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2019 14:24:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E255E6E137;
	Sat, 30 Nov 2019 13:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982876E91A
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 14:17:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id D2494265BE1
Date: Fri, 29 Nov 2019 09:16:59 -0500
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2] drm/panfrost: Document base field location constraint
 in panfrost_gem_object
Message-ID: <20191129141659.GA2921@kevin>
References: <20191129135614.2439058-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20191129135614.2439058-1-boris.brezillon@collabora.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Sat, 30 Nov 2019 13:23:59 +0000
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
Cc: Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>
Content-Type: multipart/mixed; boundary="===============0735410521=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0735410521==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

On Fri, Nov 29, 2019 at 02:56:14PM +0100, Boris Brezillon wrote:
> I've spent hours chasing a memory corruption that was caused by
> insertion of an extra field field before ->base. Let's document the
> fact that base has to be the first field in panfrost_gem_object.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes in v2:
> * Use the proper prefix in the subject line
> ---
>  drivers/gpu/drm/panfrost/panfrost_gem.h | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/pa=
nfrost/panfrost_gem.h
> index b3517ff9630c..d480261fc177 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
> @@ -10,6 +10,10 @@
>  struct panfrost_mmu;
> =20
>  struct panfrost_gem_object {
> +	/*
> +	 * Must be the first element because we're using some of the
> +	 * drm_gem_shmem helpers.
> +	 */
>  	struct drm_gem_shmem_object base;
>  	struct sg_table *sgts;
> =20
> --=20
> 2.23.0
>=20

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl3hKFQACgkQ/v5QWgr1
WA33TQ//ScFnJYrE8MH6Mm7JrrqMC8fC3bIUREHewlzvKjhkvUMcCxfRx9mLKYmn
OU5B9PimW/nzDnYxlsNvs4YeTpKH1oepJ2cghJoPuu7hvGo8Kweg2XXQoCfqv/JF
jRxxwvH1Y4ST4rFzRLE0vjXdk8TNhDl9zgvUeTHt4J6DJe7s6zs/MpE56jSCoN+1
DM0aNGyoV70IpUBtgdRwVEInPxaPQ0zWd8nm02XvOY8gogGg5L65O10oTITUxsQa
JhbKFpa0os1Eg+nPBn4fwzdP7Uk3fZsGLsYAWrh+/yi8DxpWXW4Z4zsdflGha0nQ
5hV2pGbiwunfrS9GSBUkZLqt09wLM4IW8iIEmncGg5ofHmmfWD6pSQ1tCQksvX2u
0dJnn0DY5o1STHTBpRjD8eslzdKLhWIn2nRbYTpDwBvzW2t3Wo+Nfel9BHUaI5f2
A+KqEdOEp8ydnVMJBRQUWqMaEP+KcYmS+Rrxb0hcYwV1xzFI6cfBmLMXh/8z6a2t
xe67lHoJXKToO+prpS22EEl0WI72O1kD05bbtpSs+b1dP2CnOWwgRMEE39fTqIPi
qJWFCt2Ni6rbi1cGs8cQDD2I9PTTtH6AdQ7wx0hf/rkm7UwZ+H1JJ+DKpxvA3xMW
DP+ubJoY3TMxSl/Rxc9rx7Zl5Jxa/SrO/bqNUNrXF/C+9PsHbNc=
=OhDF
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--

--===============0735410521==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0735410521==--
