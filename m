Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3543C1527B0
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 09:53:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574FB6F4D4;
	Wed,  5 Feb 2020 08:52:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E6CD6E841
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2020 14:37:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 84EC7283BC0
Date: Tue, 4 Feb 2020 09:37:32 -0500
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 2/2] drm/panfrost: Propagate panfrost_fence_create()
 errors to the scheduler
Message-ID: <20200204143732.GA4525@kevin>
References: <20200204143504.135388-1-boris.brezillon@collabora.com>
 <20200204143504.135388-2-boris.brezillon@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20200204143504.135388-2-boris.brezillon@collabora.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Wed, 05 Feb 2020 08:52:53 +0000
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
Cc: Rob Herring <robh+dt@kernel.org>, Steven Price <steven.price@arm.com>,
 Icecream95 <ixn@keemail.me>, dri-devel@lists.freedesktop.org,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: multipart/mixed; boundary="===============0606064272=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0606064272==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Patch 2 is `Reviewed-by: Alyssa Rosenzweig
<alyssa.rosenzweig@collabora.com>`
On Tue, Feb 04, 2020 at 03:35:04PM +0100, Boris Brezillon wrote:
> ->job_run() can return an ERR_PTR() if somethings fails. Let's
> propagate the error returned by panfrost_fence_create() instead of
> returning NULL.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_job.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/pa=
nfrost/panfrost_job.c
> index b0716e49eeca..242147b36d8e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -349,7 +349,7 @@ static struct dma_fence *panfrost_job_run(struct drm_=
sched_job *sched_job)
> =20
>  	fence =3D panfrost_fence_create(pfdev, slot);
>  	if (IS_ERR(fence))
> -		return NULL;
> +		return fence;
> =20
>  	if (job->done_fence)
>  		dma_fence_put(job->done_fence);
> --=20
> 2.24.1
>=20

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl45gaUACgkQ/v5QWgr1
WA3Z6A//Z7IvPOqQSlkCWq1gl3iJeDlUXRn3zEAtvHtixUgkz5Vv8vYGbdXkGjvd
crlg4WhL3vmmbtMcNDpXp4JXMCSjwa6QLMNEaJh8XHWsqiqdhzhj2Z0b0sSXoRov
n5mA1nTDdC4xS3Ji8CuE4+L1pGgSu3IKbcx9NgF7nTclJYeC462CZVaqzXrPrp3/
mvhx0h0TfQw06I0GWFUrMcGFz8W3kKey5XeWiArgQIr/vE//flp4c/HZTKglBdRE
DKwn09Kq7PO6oMJdPewkeOixLOTskb0Opow+IiiT6ts9VlkMsccPDB4kwKVaJHa/
GSON0d4eVARcXMd1R9Fj8FN9u3vOVc+hbO3fU7H6SYnKA1WHX8kmKzf+BRtAaiCf
VQ5yLrvw0xJ1+GplIGDM8bfZfuX9uvnFqSzGDyGorcbqjC9/y7rHtfbZlCzjgpG+
g2Q6jInwaYIgyQeTEX98caHLuEj5j/D2mUB8vTriudK4+8BNTUsCI6OmnGEodFXc
PNL+NzfoY1V/7QhoYoVSQ9lDLGsYtrr32r0x1fIewZTSyyKToFYoiRcVeQPFeAqm
vnaE77vXhGFAjmM7jgXL2CxmDLF6+uu1NuIOFT7VX2YN5byCVZYIF0wjF7F8hpXY
r3p9yNyFhtt+m//QdZ0Ma0GJbbYVzVt7QwUqV0kX1wfSZFYQ2m4=
=1Vul
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--

--===============0606064272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0606064272==--
