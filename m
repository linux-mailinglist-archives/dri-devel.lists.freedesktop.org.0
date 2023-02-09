Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3086908F5
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 13:36:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B31D310E060;
	Thu,  9 Feb 2023 12:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8674D10E100
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 12:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EBlWBxOhyoDO5dXhvsOtmD3whL9PVjYauzJq6Up20zE=; b=ks9kp+CgJXmy87rtcYg2d3Zyy3
 Dq1lO0EVTWzfge/TJoeLC6ylvS/uGV8D3jCDUT88OScZwpfm68rdYqTR/pnpaqhDaUXQO31KPLkbh
 3rvgwHbbSgKT1cSQpwIbHKQehdoHBQs6hi9RWK2wxtLkDpf/YGNxiq3vClhOSilBYgf1oMiiywwPm
 cIAoVVYprwlBSRLmx/+FH3DuZu3cR1NusN3N+TQ0k2cDjHqHMBs0okVgxiWhbTZM/mZTVw5RqqhoZ
 j0hgXEXtixu1XiaEi6ce8CPS67sZnl/CfQIKwoArObEf1b7BalJdSFfM7XttxdZXQTnenIj5IBMMe
 W/nEjh6g==;
Received: from [38.44.66.31] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pQ69r-00DvCB-0w; Thu, 09 Feb 2023 13:36:11 +0100
Date: Thu, 9 Feb 2023 11:36:05 -0100
From: Melissa Wen <mwen@igalia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH 5/5] drm/v3d: Use drm_sched_job_add_syncobj_dependency()
Message-ID: <20230209123605.ctr7g75ekslmmboh@mail.igalia.com>
References: <20230208194817.199932-1-mcanal@igalia.com>
 <20230208194817.199932-6-mcanal@igalia.com>
 <20230209112731.bzwlhwmimg5vvmhd@mail.igalia.com>
 <df67ca19-5bfa-ba1f-3601-1218db2a0aa5@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="keu55znf33ac4cho"
Content-Disposition: inline
In-Reply-To: <df67ca19-5bfa-ba1f-3601-1218db2a0aa5@amd.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Sumit Semwal <sumit.semwal@linaro.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--keu55znf33ac4cho
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 02/09, Christian K=F6nig wrote:
> Am 09.02.23 um 12:27 schrieb Melissa Wen:
> > On 02/08, Ma=EDra Canal wrote:
> > > As v3d_job_add_deps() performs the same steps as
> > > drm_sched_job_add_syncobj_dependency(), replace the open-coded
> > > implementation in v3d in order to simply, using the DRM function.
> > >=20
> > > Signed-off-by: Ma=EDra Canal <mcanal@igalia.com>
> > > ---
> > >   drivers/gpu/drm/v3d/v3d_gem.c | 9 +--------
> > >   1 file changed, 1 insertion(+), 8 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_=
gem.c
> > > index 5da1806f3969..f149526ec971 100644
> > > --- a/drivers/gpu/drm/v3d/v3d_gem.c
> > > +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> > > @@ -400,14 +400,7 @@ static int
> > >   v3d_job_add_deps(struct drm_file *file_priv, struct v3d_job *job,
> > >   		 u32 in_sync, u32 point)
> > >   {
> > > -	struct dma_fence *in_fence =3D NULL;
> > > -	int ret;
> > > -
> > > -	ret =3D drm_syncobj_find_fence(file_priv, in_sync, point, 0, &in_fe=
nce);
> > > -	if (ret =3D=3D -EINVAL)
> > > -		return ret;
> > > -
> > > -	return drm_sched_job_add_dependency(&job->base, in_fence);
> > > +	return drm_sched_job_add_syncobj_dependency(&job->base, file_priv, =
in_sync, point);
> > Hi Ma=EDra,
> >=20
> > First, thanks for making this function a common-code.
> >=20
> > There are two issues to address before moving v3d to the new
> > drm_sche_job_add_syncobj_dependency():
> >=20
> > 1. We don't need the v3d_job_add_deps one line function just wrapping
> > the new drm_sched_job_add_syncobj_dependency() with the same parameters.
> > We can just replace all occurrences of v3d function with drm_sched
> > function. Except if we use v3d_job_add_deps to address the second issue:
> >=20
> > 2. Currently, v3d_job_add_deps returns 0 (success) if
> > drm_syncobj_find_fence() doesn't find the syncobj from handle (-ENOENT),
> > but drm_sched_job_add_syncobj_dependency() returns a negative value on
> > this case. If it happens, job submissions will fail (and may cause a
> > regression). One way to solve it is checking the return value of
> > drm_sched_job_add_syncobj_dependency in v3d_job_add_deps.  The second
> > way is to replace v3d_job_add_deps by
> > drm_sched_job_add_syncobj_dependency and check expected return values
> > there.
>=20
> Oh, wait a second. This behavior is most likely a bug in V3D.
>=20
> When a syncobj can't find a timeline point aborting the IOCTL with -ENOENT
> is mandatory or otherwise you run into trouble with wait before signal
> handling for Vulkan.
>=20
> This should be common behavior for all drivers which at some point want to
> support Vulkan.

So, v3d doesn't support timeline syncobj yet, and I took a look at
returning errors on drm_syncobj_find_fence, for timeline syncobj they
can be `-ETIME` and `-ERESTARTSYS`.

TBH, I don't exactly know the design reason for accepting a ENOENT from
drm_syncobj_find_fence. I suspect it's only trying to deal with the
`in_sync =3D=3D 0` case (that would be better replaced by a `if then;
continue;`).

In any case, I think it isn't good to change this behavior in the same
time we are moving to another function. I'd prefer to preserve the
current behavior here and better investigate/address this issue in
another patch.

Melissa

>=20
> Regards,
> Christian.
>=20
> >=20
> > Melissa
> >=20
> > >   }
> > >   static int
> > > --=20
> > > 2.39.1
> > >=20
>=20

--keu55znf33ac4cho
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmPk6LAACgkQwqF3j0dL
ehwXOg//TZFCLNFVTSx1xHGLBwsXe2LzoOOYjIoJ5fpzQNS6vyVn1jvjskhQvOoC
7Gzc5lOoNBVz/TzuQ/njGx0vuSOLdDQSUd8SxtQ8y6oH0SnVt4b61dx4a6k3ekXx
wmza5oKqzgcvH7uQRJ2ITx9Dm2sbwo7E3SfQ/SUCiUWJkzD8/XJFwL2ZzMweNhGo
QWbg7n2JcpjcYQJXIwPg4ODx3hPp1ecERzPi8zj9MlucRCJteSwBKENATVtPbNw3
4sntEy1TsRtEV8T2b1GUgOPfZxd7MsekopiO2GAd1/igfoJJDsemIcrxZwju4ssC
zUGbgP8HbIMu11IzxbX9zxufl53+6tAIP2GeyngR2xWVyda5TBsEyOh90cMCXiKw
64cE1camzUPU0S4RYjws76EuXO7XH71AGZMvuOmv6IccSzMx9WCRwbDIKELGIZu5
v+I7QqeJq9lP24lT4dYChV/gPmm3Z4S/dpznt8oqSETBUab15hlMkuv/D20068GL
ZloYl0XgnRE8h751Q/Kg2g6yPoBr8PG5WBX00mpag26a8rvXmXg8KTrk2mgO8avy
Jm8bPcNg7+/6GCDClOzRUwRXcwgAnTzfRgFeTZS2lNkSnRgl+nMOPcoBTGuVmutT
gZJaENMJZXXX1MRKvamjRZ9dcUjnZUaYq0Ha7Ih75Dw55UYAhgg=
=CIbu
-----END PGP SIGNATURE-----

--keu55znf33ac4cho--
