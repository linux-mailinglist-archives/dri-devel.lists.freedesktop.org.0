Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD9E1516CC
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 09:08:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5256EDE3;
	Tue,  4 Feb 2020 08:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2275E6E43A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 19:12:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 7B45929040D
Date: Mon, 3 Feb 2020 14:12:36 -0500
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] drm/panfrost: Remove set but not used variable 'bo'
Message-ID: <20200203191236.GA2913@kevin>
References: <20200203152724.42611-1-yuehaibing@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200203152724.42611-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Tue, 04 Feb 2020 08:08:21 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, linaro-mm-sig@lists.linaro.org,
 Hulk Robot <hulkci@huawei.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0044379750=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0044379750==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alyssas Rosenzweig <alyssa.rosenzweig@collabora.com>, thank
you!

On Mon, Feb 03, 2020 at 03:27:24PM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
>=20
> drivers/gpu/drm/panfrost/panfrost_job.c: In function 'panfrost_job_cleanu=
p':
> drivers/gpu/drm/panfrost/panfrost_job.c:278:31: warning:
>  variable 'bo' set but not used [-Wunused-but-set-variable]
>=20
> commit bdefca2d8dc0 ("drm/panfrost: Add the panfrost_gem_mapping concept")
> involved this unused variable.
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_job.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/pa=
nfrost/panfrost_job.c
> index 7c36ec675b73..ccb8546a9342 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -275,12 +275,8 @@ static void panfrost_job_cleanup(struct kref *ref)
>  	}
> =20
>  	if (job->bos) {
> -		struct panfrost_gem_object *bo;
> -
> -		for (i =3D 0; i < job->bo_count; i++) {
> -			bo =3D to_panfrost_bo(job->bos[i]);
> +		for (i =3D 0; i < job->bo_count; i++)
>  			drm_gem_object_put_unlocked(job->bos[i]);
> -		}
> =20
>  		kvfree(job->bos);
>  	}
>=20
>=20
>=20

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl44cJoACgkQ/v5QWgr1
WA1MQA//eHYgx1kcsdR+AmUM+1kdx1sYRUsvVzSaADRg0iMTcRTZEmlBXAlu6hak
WYuhLq96Cw6+kkmAoWSizha3jij7Vg1HwMsaHsbQMSnocIQVyp2BqfjlOMBtWcMm
OyUzFz5QWvGFEEGh9DjSxZ8TGT4BoRzzCj0FF60d2JEEguRMSvT9xvq2Hi/JRsaN
Mx0cfCAMjmPzaPv091TR8KhTuGPIHg+Im0agoY1rd2sTARywX9abYShLIQA2ZtEj
mNSjuKGPDz7LlTdKpcgkQHK/7VQeQr63J8ymCTUDPfSFJd0qhVVAHB31knjkLLss
nTtbMjKhGYtEXB7l64s+VqxUUJvRafsRJEc/7zUaqfjEtQb0iEt0AEecDxnkAyS6
9cfC0hSMcUVYGRXENQTy0Pp8a5hFZFc25TxQq5zD36u4ndvVDs29ZCQ1iqAmg9K+
m3zOWxJdcw9+kyyyFvSjbB8GM5+CcV8jfCe5pSxdwBsXILZ5Tb+8F32Y2y9EIORV
RK9m32/mDJaZUsIPaeEmpMwkV/efHn9qTfA77iIVm9EkTRTzLBXWBjSodTC+a5mD
9y5xR5RmSIuBY4FlcVsZNlZj2d/js6+UxtPj/qqVOYv9lnrqKJr/Ji+KqRYIGEyB
QwjLFAQeOkINXhqRGfTlKgPaNwj+gFBse10UjwyLHRzL5HpLexg=
=+/k/
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--

--===============0044379750==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0044379750==--
