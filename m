Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E67810DDB6
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2019 14:24:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BDA86E109;
	Sat, 30 Nov 2019 13:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2766E06E
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 14:23:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 91F3928FA57
Date: Fri, 29 Nov 2019 09:23:42 -0500
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 0/8] panfrost: Fixes for 5.4
Message-ID: <20191129142342.GB2921@kevin>
References: <20191129135908.2439529-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20191129135908.2439529-1-boris.brezillon@collabora.com>
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
Content-Type: multipart/mixed; boundary="===============0895484191=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0895484191==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Content-Disposition: inline


--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Series acked-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

On Fri, Nov 29, 2019 at 02:59:00PM +0100, Boris Brezillon wrote:
> Hello,
>=20
> I've recently come to test a 5.4 kernel on a rk3288 platform (T760),
> and, as reported by many people on #panfrost, I've hit a page-fault
> storm when running various GL apps.
>=20
> This series tries to address the problems I could spot during my debug
> session, with patch 7 being the most invasive change. I wish I
> could find an easier way to fix the "BO mapping teared down while GPU
> jobs referencing it are in-flight" problem, as I don't like tagging
> complex changes for stable, but this is the best I could come up with.
>=20
> Let me know if you have better ideas.
>=20
> Regards,
>=20
> Boris
>=20
> Boris Brezillon (8):
>   drm/panfrost: Make panfrost_job_run() return an ERR_PTR() instead of
>     NULL
>   drm/panfrost: Fix a race in panfrost_ioctl_madvise()
>   drm/panfrost: Fix a BO leak in panfrost_ioctl_mmap_bo()
>   drm/panfrost: Fix a race in panfrost_gem_free_object()
>   drm/panfrost: Open/close the perfcnt BO
>   drm/panfrost: Make sure imported/exported BOs are never purged
>   drm/panfrost: Add the panfrost_gem_mapping concept
>   drm/panfrost: Make sure the shrinker does not reclaim referenced BOs
>=20
>  drivers/gpu/drm/panfrost/panfrost_drv.c       | 132 +++++++++++--
>  drivers/gpu/drm/panfrost/panfrost_gem.c       | 184 +++++++++++++++---
>  drivers/gpu/drm/panfrost/panfrost_gem.h       |  51 ++++-
>  .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |   6 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c       |  22 ++-
>  drivers/gpu/drm/panfrost/panfrost_job.h       |   1 +
>  drivers/gpu/drm/panfrost/panfrost_mmu.c       |  61 +++---
>  drivers/gpu/drm/panfrost/panfrost_mmu.h       |   6 +-
>  drivers/gpu/drm/panfrost/panfrost_perfcnt.c   |  49 +++--
>  drivers/gpu/drm/panfrost/panfrost_perfcnt.h   |   2 +-
>  10 files changed, 416 insertions(+), 98 deletions(-)
>=20
> --=20
> 2.23.0
>=20

--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl3hKe0ACgkQ/v5QWgr1
WA1IHQ//Vyhe65ctbeZNj9n7RVv7pucg87kfjp/rY3bArOzIN6lKudZR1YjZcb6b
6/Q66yV/nfNkumO9NWV3mzzNfxHPlQ/Fil3bXqzAfrkiSM1rv7idbggQZJK5ftpW
Cr6JpuIMfeH27UgQYocSWL/RdeY7SwPKAxHKdjJWvrjrNeyJnfxvgVryQx17j04a
+HId6SeEvNrnbAGAYuMhw0IRuovTdSxC+72kC/6hKFn8w5c8zeXcSozduK5sIw9/
601jtKuJyeBvgwpTc/8DxWcbbotnQxxkI5hJh75rhIdHDcC8+lG1PGCTj8gisQT2
xjtUrMsPMBnxXjTHHN2e5vdJi+29hruXfI7YX+EWM9FWF18tTRzplf2iYtFjGkrq
1rYO/LytplCUmtojiKqwdX03X/o628WXZOAuR49dwsgMDvG0FvlBKDooFva5h7os
Kf+xvwvo5gVzlyOOqii/9G3KcaLiRhw/gloHELgL4AwXLpkc/Ms+bteq0+PRUKlm
xiw8XPaeceVw+mme90BaNh7/fP37cUOh8SmhOElT6AHhZL+qxXxT+H4ABRpbXihe
iKUAb242TPt+bbTUz09i2UtmPACQPjiRr6mFR6zzcZQhUx088itbw5FKk3eW17v4
+vK78Q+AlIa7Npyd8pmUZHWj+AzwavU6/CYyQholECooiCUw+e4=
=t6x2
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--

--===============0895484191==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0895484191==--
