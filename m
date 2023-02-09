Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BCF690760
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 12:28:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECB010E9C2;
	Thu,  9 Feb 2023 11:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5FD10E9C2
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 11:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lPGlnz7cqVWTcpKmZ5WyI5VQhfAgLMK2qKr4xyiswUY=; b=W0QG6PmDzM3UtED4GM2P74nLbl
 kau8D0FXmIv9Yd8szOhAqvVm9QAOWhM4VPjtDitkSZmLNs9TrWweBbevAoKFTf2INgpu4tauFZTMq
 6ApfWRtvpeeLwx39e3Z6CY1MKyoOSQmIy6z49ypvPK0AK7qkE7OwRbuSji1sGYeJxyoCNKFUA8jEd
 83TCCgzfOQPgDrzIiEHPKdhGvJkqFx9CmJ/4cGcL569NwoNimNeHY+/yGBodzrjkFMqOME8pwqj3R
 AK8W9MUq3PQm5QZfDTZltGjKznyYjLXF9pcQ7G6bo7tCpBOPf/hYAvdM5d9DjyIcLg2/Z577DK/o3
 fCJ+5/1Q==;
Received: from [38.44.66.31] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pQ55f-00DsfQ-Cp; Thu, 09 Feb 2023 12:27:47 +0100
Date: Thu, 9 Feb 2023 10:27:31 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH 5/5] drm/v3d: Use drm_sched_job_add_syncobj_dependency()
Message-ID: <20230209112731.bzwlhwmimg5vvmhd@mail.igalia.com>
References: <20230208194817.199932-1-mcanal@igalia.com>
 <20230208194817.199932-6-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="baicj7ik4m75ebwj"
Content-Disposition: inline
In-Reply-To: <20230208194817.199932-6-mcanal@igalia.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Qiang Yu <yuq825@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Steven Price <steven.price@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--baicj7ik4m75ebwj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 02/08, Ma=EDra Canal wrote:
> As v3d_job_add_deps() performs the same steps as
> drm_sched_job_add_syncobj_dependency(), replace the open-coded
> implementation in v3d in order to simply, using the DRM function.
>=20
> Signed-off-by: Ma=EDra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/v3d/v3d_gem.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index 5da1806f3969..f149526ec971 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -400,14 +400,7 @@ static int
>  v3d_job_add_deps(struct drm_file *file_priv, struct v3d_job *job,
>  		 u32 in_sync, u32 point)
>  {
> -	struct dma_fence *in_fence =3D NULL;
> -	int ret;
> -
> -	ret =3D drm_syncobj_find_fence(file_priv, in_sync, point, 0, &in_fence);
> -	if (ret =3D=3D -EINVAL)
> -		return ret;
> -
> -	return drm_sched_job_add_dependency(&job->base, in_fence);
> +	return drm_sched_job_add_syncobj_dependency(&job->base, file_priv, in_s=
ync, point);

Hi Ma=EDra,

First, thanks for making this function a common-code.

There are two issues to address before moving v3d to the new
drm_sche_job_add_syncobj_dependency():

1. We don't need the v3d_job_add_deps one line function just wrapping
the new drm_sched_job_add_syncobj_dependency() with the same parameters.
We can just replace all occurrences of v3d function with drm_sched
function. Except if we use v3d_job_add_deps to address the second issue:

2. Currently, v3d_job_add_deps returns 0 (success) if
drm_syncobj_find_fence() doesn't find the syncobj from handle (-ENOENT),
but drm_sched_job_add_syncobj_dependency() returns a negative value on
this case. If it happens, job submissions will fail (and may cause a
regression). One way to solve it is checking the return value of
drm_sched_job_add_syncobj_dependency in v3d_job_add_deps.  The second
way is to replace v3d_job_add_deps by
drm_sched_job_add_syncobj_dependency and check expected return values
there.

Melissa

>  }
> =20
>  static int
> --=20
> 2.39.1
>=20

--baicj7ik4m75ebwj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmPk2J4ACgkQwqF3j0dL
ehw/0xAArp+pPvd81q9On1JGmbMQFRRyKWs9wQnJM0E1LDyFhZ9B1wpvlbjq7gbM
9v48gZECvySkQvV/YifYCFMH4Lnw9Q+NyyaxSNA1Hg2B85Koff77EKy6DZr9Zu9B
p46+Qc71vWxQB4CyWYg0v3kuBhG3LbUSyETL9bULBA2qfge9KyzK3fSwzqFt/Lzv
MO0a3vHvL95PqQkL+Ty7o8YauBxR3XdfrfvVa84MIqSEpEWDjdiBaPo22hCEQAf5
zXdRQFJcDrr+/YR4L0hiLiJdT/xcjBzrGQUyVdNEY8zKwIUg80xsK5/sLuBYxuxd
A7ufbSO/uGvMA5o68dLU44SpyfLR5uulFFsWK9ql1dg5X6VyHm0VF+3lUfdDe7PC
A034jjt51c6BehRKZTrZ5cCR7DizoZ8EpLqCq/aLWnjtbgMlpUodO5F7Deqf4cBw
93xNVkmf6Zvsz7z2byMRTUACFsGXRCk8zwJu0ckQLafN316ATNVsr2wr1MZwTNJ1
f+lBELG7xUZ/Vh1VGz4HAH5dtpleemQQUejQ+Z8rE9IMRKxvCo9P2xLaPbrcdN3K
hWjcJYsHipfgi10lS+Zx5tGczQ66eyaWJTrW82ncboyro33hVmOITI1Yu6RPoQus
dJNxiGuX+nGoOKK91YfvKh4Kng1taRe2MjTboTRS8GGp9aU5wzQ=
=ZScW
-----END PGP SIGNATURE-----

--baicj7ik4m75ebwj--
