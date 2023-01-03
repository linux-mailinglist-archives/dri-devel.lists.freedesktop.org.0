Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4838665C760
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 20:21:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3445010E4C5;
	Tue,  3 Jan 2023 19:21:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C67810E4C5
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 19:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8bdehVCsLpkqmzb7Gpav1SRqSrQemS3WZLbt8ThYpxA=; b=BUTk4W2JVWhYgnxAOU7wMs72yK
 39XS3W3x7LUyHuwWZXQrq8Ky74XvE6IudDE225nMt5LffjbAa0RI2mmY7b90pHEwzh1VZCDZJuvGW
 Ng4vgwOjEI/AzbvCwcwVRsmUrXnf7Q8xqgjHfMZM2cbyoabcsZNpyIuX8H7NbP2oBfsQhwJnHMwdL
 xkFSvWYCQE68MSo+upYl+lfPcjKf6QetOTk/LLYTLu7RZnwtiMS4rmFH03Uyp6KrW6UQC2rpgNJ+4
 D1I1knTf1eeWbTrBRrCW7RGSXqpWaN8WRCuMrKjYtwK7vplSRE7Dk7n/KB5FUO6/r86ALKJJq7aYW
 rUqevEzA==;
Received: from [41.74.137.107] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pCmqU-00GPNn-Pa; Tue, 03 Jan 2023 20:21:10 +0100
Date: Tue, 3 Jan 2023 18:20:56 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH] drm/v3d: replace open-coded implementation of
 drm_gem_object_lookup
Message-ID: <20230103192044.ppgipr5irkydrt4s@mail.igalia.com>
References: <20221227200010.191351-1-mcanal@igalia.com>
 <20221228143509.dsxjhstx54olxaek@mail.igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yunqnuvhld3d7hva"
Content-Disposition: inline
In-Reply-To: <20221228143509.dsxjhstx54olxaek@mail.igalia.com>
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
Cc: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 Emma Anholt <emma@anholt.net>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--yunqnuvhld3d7hva
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7x7cueloyz7ynrv5"
Content-Disposition: inline


--7x7cueloyz7ynrv5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 12/28, Melissa Wen wrote:
> On 12/27, Ma=EDra Canal wrote:
> > As v3d_submit_tfu_ioctl() performs the same steps as drm_gem_object_loo=
kup(),
> > replace the open-code implementation in v3d with its DRM core equivalen=
t.
> >=20
> > Signed-off-by: Ma=EDra Canal <mcanal@igalia.com>
> > ---
> >  drivers/gpu/drm/v3d/v3d_gem.c | 7 +------
> >  1 file changed, 1 insertion(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_ge=
m.c
> > index 6e152ef26358..5da1806f3969 100644
> > --- a/drivers/gpu/drm/v3d/v3d_gem.c
> > +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> > @@ -861,7 +861,6 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *=
data,
> > =20
> >  	job->args =3D *args;
> > =20
> > -	spin_lock(&file_priv->table_lock);
> >  	for (job->base.bo_count =3D 0;
> >  	     job->base.bo_count < ARRAY_SIZE(args->bo_handles);
> >  	     job->base.bo_count++) {
> > @@ -870,20 +869,16 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void=
 *data,
> >  		if (!args->bo_handles[job->base.bo_count])
> >  			break;
> > =20
> > -		bo =3D idr_find(&file_priv->object_idr,
> > -			      args->bo_handles[job->base.bo_count]);
> > +		bo =3D drm_gem_object_lookup(file_priv, args->bo_handles[job->base.b=
o_count]);
> >  		if (!bo) {
> >  			DRM_DEBUG("Failed to look up GEM BO %d: %d\n",
> >  				  job->base.bo_count,
> >  				  args->bo_handles[job->base.bo_count]);
> >  			ret =3D -ENOENT;
> > -			spin_unlock(&file_priv->table_lock);
> >  			goto fail;
> >  		}
> > -		drm_gem_object_get(bo);
> >  		job->base.bo[job->base.bo_count] =3D bo;
> >  	}
> > -	spin_unlock(&file_priv->table_lock);
>=20
> Hi Ma=EDra,
>=20
> Thanks for you patch.
>=20
> LGTM
>=20
> Reviewed-by: Melissa Wen <mwen@igalia.com>

Applied to drm-misc-next.

Thanks,

Melissa
>=20
> > =20
> >  	ret =3D v3d_lock_bo_reservations(&job->base, &acquire_ctx);
> >  	if (ret)
> > --=20
> > 2.38.1
> >=20



--7x7cueloyz7ynrv5--

--yunqnuvhld3d7hva
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmO0gBgACgkQwqF3j0dL
ehyBKQ//UGD81cEUVFmpyMxW3cvSSC4LlTmg6skoLx+aax6at7mOHs9QvAvMYc5C
riLs5e31c3ktzm0ZmVl9VIXEqyTtMjNV4sYo/wIC46A6TePpodw5JL1eWpA1H3Q+
3dh8/WhejWmV8KDPQQbYov5KEmbSbmzdx6SnxXTUTM53nwv5QSZSr/s66sfZiw7V
ukdqyEqWrh79T6H70khxjeqObNtQH30F3ORyL+H+lGXNmbnTG2JxWdccnscVKpdK
bW17c+7GFHNv6pRSjriuJVPRYNbIotobYNuZ5ygpSH4SEQOkLQ7WtThs+v0kuifW
PAamcOC4DEQT7ewVNa+9+yHF8QWLvyOoZwORm4XQUTeheIsB0TvBfUBn5YcimUGE
v8MzCxZ7KfoRDVw/9E73EvvsoOvF3oHKJOKPxthge/HEJQkh9dMcaZtqc07Nf8KT
G/H+00fHumSuDSP+Ex22jtJz3L+QuHpyPPUzMT/RWnM24TYWFzBVZdFKVBJtT9y4
mY+pTFJU2h55LeFoA4irpEecd4eQTtNHzm9IrzTscL3IPoibBwqLKJRmRgizX9aV
ue+wxZ++UTLoBOC2fhxYEAI4X4pMN9h1SfKgHBqsi6gQ7uNhb6ENLLhwts9PZbdO
uM1to/J6H+8hoLaMAMxdhALxg4/T4HCCypd/5jISn6hrTp9pbh0=
=iH1d
-----END PGP SIGNATURE-----

--yunqnuvhld3d7hva--
