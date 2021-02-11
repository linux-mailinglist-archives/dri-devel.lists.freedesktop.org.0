Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4387318DAA
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 15:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F2F6EE45;
	Thu, 11 Feb 2021 14:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93C06EE45
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 14:53:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5C0B8ACBF;
 Thu, 11 Feb 2021 14:53:33 +0000 (UTC)
Subject: Re: [PATCH 2/4] drm/qxl: clean up qxl_bo_move_notify
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com, zackr@vmware.com,
 dri-devel@lists.freedesktop.org
References: <20210211131659.276275-1-christian.koenig@amd.com>
 <20210211131659.276275-2-christian.koenig@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <31f82144-fb8c-fab3-c9f3-bbfced132684@suse.de>
Date: Thu, 11 Feb 2021 15:53:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210211131659.276275-2-christian.koenig@amd.com>
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
Content-Type: multipart/mixed; boundary="===============0515385800=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0515385800==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="WruFdISqMcnUQmxv8F1nfAqYn2L1KmJUr"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WruFdISqMcnUQmxv8F1nfAqYn2L1KmJUr
Content-Type: multipart/mixed; boundary="qF0m3eTEs3ptmnXwEKni0ItTiIgSesy1r";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com, zackr@vmware.com,
 dri-devel@lists.freedesktop.org
Message-ID: <31f82144-fb8c-fab3-c9f3-bbfced132684@suse.de>
Subject: Re: [PATCH 2/4] drm/qxl: clean up qxl_bo_move_notify
References: <20210211131659.276275-1-christian.koenig@amd.com>
 <20210211131659.276275-2-christian.koenig@amd.com>
In-Reply-To: <20210211131659.276275-2-christian.koenig@amd.com>

--qF0m3eTEs3ptmnXwEKni0ItTiIgSesy1r
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 11.02.21 um 14:16 schrieb Christian K=C3=B6nig:
> Remove the unused evict parameter and drop swapping bo->mem.

Could you provide the same patch for vram-helpers as well?

Best regards
Thomas

>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/qxl/qxl_ttm.c | 16 ++++------------
>   1 file changed, 4 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_tt=
m.c
> index b7f77eb685cb..47afe95d04a1 100644
> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> @@ -121,7 +121,6 @@ static struct ttm_tt *qxl_ttm_tt_create(struct ttm_=
buffer_object *bo,
>   }
>  =20
>   static void qxl_bo_move_notify(struct ttm_buffer_object *bo,
> -			       bool evict,
>   			       struct ttm_resource *new_mem)
>   {
>   	struct qxl_bo *qbo;
> @@ -144,29 +143,22 @@ static int qxl_bo_move(struct ttm_buffer_object *=
bo, bool evict,
>   	struct ttm_resource *old_mem =3D &bo->mem;
>   	int ret;
>  =20
> -	qxl_bo_move_notify(bo, evict, new_mem);
> +	qxl_bo_move_notify(bo, new_mem);
>  =20
>   	ret =3D ttm_bo_wait_ctx(bo, ctx);
>   	if (ret)
> -		goto out;
> +		return ret;
>  =20
>   	if (old_mem->mem_type =3D=3D TTM_PL_SYSTEM && bo->ttm =3D=3D NULL) {=

>   		ttm_bo_move_null(bo, new_mem);
>   		return 0;
>   	}
> -	ret =3D ttm_bo_move_memcpy(bo, ctx, new_mem);
> -out:
> -	if (ret) {
> -		swap(*new_mem, bo->mem);
> -		qxl_bo_move_notify(bo, false, new_mem);
> -		swap(*new_mem, bo->mem);
> -	}
> -	return ret;
> +	return ttm_bo_move_memcpy(bo, ctx, new_mem);
>   }
>  =20
>   static void qxl_bo_delete_mem_notify(struct ttm_buffer_object *bo)
>   {
> -	qxl_bo_move_notify(bo, false, NULL);
> +	qxl_bo_move_notify(bo, NULL);
>   }
>  =20
>   static struct ttm_device_funcs qxl_bo_driver =3D {
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--qF0m3eTEs3ptmnXwEKni0ItTiIgSesy1r--

--WruFdISqMcnUQmxv8F1nfAqYn2L1KmJUr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAlROwFAwAAAAAACgkQlh/E3EQov+Df
BQ/+JBMpJ8xki4NEAFV+cHrdUZb8s4CmxL+tY7LF5ck8/1oknt3kH/ydI7g1RTPxsN1JhRkRXlUD
ekl2vA5MkmfbNkrDOm9rvlDKAqg6qvfL8zbWTIa3JONtbojE+Wh/iyxUuxTO2YHAO/HAY5WO/ZMc
ugBBnwyy+pFHxKY9OP2H+MWzrYhCGBQ2dpVdoImrFkpnx377cWYauJrChYwwDlfb143BPEps73Qe
FblAdvVKsFMrfjz5S5+1lVghsohgqtY1Q0NqUKmk2Nwvt924sNdTkCe44y0k2IaNa5verYxLNAx7
fNueYPSFgg2/hNdCeX8LyV+AHS9shpYJyFptv6WQ6kkxVcVxeBI6zLSrFCqaD5V1e1o29I8y0s5N
YHArcxkhE8yr8HAK6/q+XPKI66QubIzeQpPrGy4KTyVl1xJuU99KURXSSEkdb6mp3849YbA4tbCB
s3diAFiNslErFUbpPqrMcJoI50b/eYdOBv1Fxegm/GTaIqK1esOwkKe0dHq+UyfqIg2dS73vMHXn
2Vuszt2NVafeJMJkTrkenMWWlbN8PsXqL4bI0tbCtSglh/dIpuvvTFekFSbeGoZ3vxdmwArWelqI
RMTbXcMf2eVpEGep/R57FzDM/4mWsHoHIVMvt/35eaX6L+miEPnJNOc9vPryS5ncCuOkGTn4Jwfn
Fbc=
=egSu
-----END PGP SIGNATURE-----

--WruFdISqMcnUQmxv8F1nfAqYn2L1KmJUr--

--===============0515385800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0515385800==--
