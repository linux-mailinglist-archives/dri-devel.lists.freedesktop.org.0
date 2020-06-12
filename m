Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3A11F762E
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 11:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE99389349;
	Fri, 12 Jun 2020 09:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4360489349
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 09:48:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A1E76ADCD;
 Fri, 12 Jun 2020 09:48:02 +0000 (UTC)
Subject: Re: [PATCH 1/2] drm/shmem: add support for per object dma api
 operations
To: Gurchetan Singh <gurchetansingh@chromium.org>,
 dri-devel@lists.freedesktop.org
References: <20200612013625.547-1-gurchetansingh@chromium.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <b1b26b94-b0a5-6af8-a151-ad6310358708@suse.de>
Date: Fri, 12 Jun 2020 11:47:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200612013625.547-1-gurchetansingh@chromium.org>
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
Cc: daniel.vetter@ffwll.ch, kraxel@redhat.com
Content-Type: multipart/mixed; boundary="===============0408582675=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0408582675==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="wW9sdXfol2HgDodLizumv1OO8w6T8KUjp"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wW9sdXfol2HgDodLizumv1OO8w6T8KUjp
Content-Type: multipart/mixed; boundary="Wu1dTVx74q8QLydISsZrG6XCOIKSTus3X";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gurchetan Singh <gurchetansingh@chromium.org>,
 dri-devel@lists.freedesktop.org
Cc: kraxel@redhat.com, daniel.vetter@ffwll.ch
Message-ID: <b1b26b94-b0a5-6af8-a151-ad6310358708@suse.de>
Subject: Re: [PATCH 1/2] drm/shmem: add support for per object dma api
 operations
References: <20200612013625.547-1-gurchetansingh@chromium.org>
In-Reply-To: <20200612013625.547-1-gurchetansingh@chromium.org>

--Wu1dTVx74q8QLydISsZrG6XCOIKSTus3X
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 12.06.20 um 03:36 schrieb Gurchetan Singh:
> This is useful for the next patch.  Also, should we only unmap the
> amount entries that we mapped with the dma-api?

It looks like you're moving virtio code into shmem. It would be nice to
have a cover letter explaining the series.

>=20
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 16 +++++++++++-----
>  include/drm/drm_gem_shmem_helper.h     | 10 ++++++++++
>  2 files changed, 21 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/d=
rm_gem_shmem_helper.c
> index 0a7e3b664bc2..d439074ad7b5 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -124,8 +124,10 @@ void drm_gem_shmem_free_object(struct drm_gem_obje=
ct *obj)
>  		drm_prime_gem_destroy(obj, shmem->sgt);
>  	} else {
>  		if (shmem->sgt) {
> -			dma_unmap_sg(obj->dev->dev, shmem->sgt->sgl,
> -				     shmem->sgt->nents, DMA_BIDIRECTIONAL);
> +			if (!shmem->skip_dma_api)
> +				dma_unmap_sg(obj->dev->dev, shmem->sgt->sgl,
> +					     shmem->dma_map_count,
> +					     DMA_BIDIRECTIONAL);
>  			sg_free_table(shmem->sgt);
>  			kfree(shmem->sgt);
>  		}
> @@ -422,8 +424,9 @@ void drm_gem_shmem_purge_locked(struct drm_gem_obje=
ct *obj)
> =20
>  	WARN_ON(!drm_gem_shmem_is_purgeable(shmem));
> =20
> -	dma_unmap_sg(obj->dev->dev, shmem->sgt->sgl,
> -		     shmem->sgt->nents, DMA_BIDIRECTIONAL);
> +	if (!shmem->skip_dma_api)
> +		dma_unmap_sg(obj->dev->dev, shmem->sgt->sgl,
> +			     shmem->dma_map_count, DMA_BIDIRECTIONAL);
>  	sg_free_table(shmem->sgt);
>  	kfree(shmem->sgt);
>  	shmem->sgt =3D NULL;
> @@ -695,7 +698,10 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struc=
t drm_gem_object *obj)
>  		goto err_put_pages;
>  	}
>  	/* Map the pages for use by the h/w. */
> -	dma_map_sg(obj->dev->dev, sgt->sgl, sgt->nents, DMA_BIDIRECTIONAL);
> +	if (!shmem->skip_dma_api)
> +		shmem->dma_map_count =3D dma_map_sg(obj->dev->dev, sgt->sgl,
> +						  sgt->nents,
> +						  DMA_BIDIRECTIONAL);
> =20
>  	shmem->sgt =3D sgt;
> =20
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_s=
hmem_helper.h
> index 5381f0c8cf6f..2669d87cbfdd 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -101,6 +101,16 @@ struct drm_gem_shmem_object {
>  	 * @map_cached: map object cached (instead of using writecombine).
>  	 */
>  	bool map_cached;
> +
> +	/**
> +	 * @skip_dma_api: skip using dma api in certain places.
> +	 */
> +	bool skip_dma_api;

This looks like an under-documented workaround for something.

> +
> +	/**
> +	 * @skip_dma_api: number of pages mapped by dma-api.
> +	 */
> +	bool dma_map_count;

The documentation comment doesn't match the field name.

Best regards
Thomas

>  };
> =20
>  #define to_drm_gem_shmem_obj(obj) \
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Wu1dTVx74q8QLydISsZrG6XCOIKSTus3X--

--wW9sdXfol2HgDodLizumv1OO8w6T8KUjp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7jT0sACgkQaA3BHVML
eiOPWAf7Bzyoa+dE6k8ZQZO2yZiwXTDujACT6VdfWb7/KwzWfO/qrh58gwdZ/LL/
9QSutlmJqw5G6l9XibkDvTYk+XvaS7DRC0ofPE8ZlH+gK7Mkir3pJnW0zwk7JqVr
WaDQkt5Wn9Jxr+UULHoEh/l4MdVC1Ee/5YOsrJ1d9bMWC7A+4MJOTNhvb3YqHjMD
eLXz6bKsg8cPfrkvepr43W32jlAT85tiX/pN3h6m0VTxaSrkhKL6q7joiasOntd2
BeBDBH2R8pxv4p/ngxiHZ8yGnmR5MGs3njVB7vQvOzPvIDWORz9MR2/3GX1kT8y5
HenB2P6yKEW5nRSsWDNTW/b3XGLgyg==
=hSyr
-----END PGP SIGNATURE-----

--wW9sdXfol2HgDodLizumv1OO8w6T8KUjp--

--===============0408582675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0408582675==--
