Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F830162646
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 13:41:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3BC16E2E4;
	Tue, 18 Feb 2020 12:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311966E2E4;
 Tue, 18 Feb 2020 12:41:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6197BB394;
 Tue, 18 Feb 2020 12:41:07 +0000 (UTC)
Subject: Re: [PATCH 8/8] drm/ttm: do not keep GPU dependent addresses
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200217150427.49994-1-nirmoy.das@amd.com>
 <20200217150427.49994-9-nirmoy.das@amd.com>
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
Message-ID: <c3a20c1b-0520-1995-7445-9e3f3ea77394@suse.de>
Date: Tue, 18 Feb 2020 13:40:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200217150427.49994-9-nirmoy.das@amd.com>
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 kraxel@redhat.com
Content-Type: multipart/mixed; boundary="===============1955444229=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1955444229==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="DKbn1261TXRforxiFSUl09U1NUbHK8nHt"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DKbn1261TXRforxiFSUl09U1NUbHK8nHt
Content-Type: multipart/mixed; boundary="hzgR0rEPl8mNr9VtqFlzxwJfRSSaDs2oL";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 kraxel@redhat.com
Message-ID: <c3a20c1b-0520-1995-7445-9e3f3ea77394@suse.de>
Subject: Re: [PATCH 8/8] drm/ttm: do not keep GPU dependent addresses
References: <20200217150427.49994-1-nirmoy.das@amd.com>
 <20200217150427.49994-9-nirmoy.das@amd.com>
In-Reply-To: <20200217150427.49994-9-nirmoy.das@amd.com>

--hzgR0rEPl8mNr9VtqFlzxwJfRSSaDs2oL
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 17.02.20 um 16:04 schrieb Nirmoy Das:
> GPU address handling is device specific and should be handle by its dev=
ice
> driver.
>=20
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c    | 7 -------
>  include/drm/ttm/ttm_bo_api.h    | 2 --
>  include/drm/ttm/ttm_bo_driver.h | 1 -
>  3 files changed, 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.=
c
> index 151edfd8de77..d5885cd609a3 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -85,7 +85,6 @@ static void ttm_mem_type_debug(struct ttm_bo_device *=
bdev, struct drm_printer *p
>  	drm_printf(p, "    has_type: %d\n", man->has_type);
>  	drm_printf(p, "    use_type: %d\n", man->use_type);
>  	drm_printf(p, "    flags: 0x%08X\n", man->flags);
> -	drm_printf(p, "    gpu_offset: 0x%08llX\n", man->gpu_offset);
>  	drm_printf(p, "    size: %llu\n", man->size);
>  	drm_printf(p, "    available_caching: 0x%08X\n", man->available_cachi=
ng);
>  	drm_printf(p, "    default_caching: 0x%08X\n", man->default_caching);=

> @@ -345,12 +344,6 @@ static int ttm_bo_handle_move_mem(struct ttm_buffe=
r_object *bo,
>  moved:
>  	bo->evicted =3D false;
> =20
> -	if (bo->mem.mm_node)
> -		bo->offset =3D (bo->mem.start << PAGE_SHIFT) +
> -		    bdev->man[bo->mem.mem_type].gpu_offset;
> -	else
> -		bo->offset =3D 0;
> -

After moving this into users, the else branch has been lost. Is
'bo->mem.mm_node' always true?

Best regards
Thomas

>  	ctx->bytes_moved +=3D bo->num_pages << PAGE_SHIFT;
>  	return 0;
> =20
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.=
h
> index b9bc1b00142e..d6f39ee5bf5d 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -213,8 +213,6 @@ struct ttm_buffer_object {
>  	 * either of these locks held.
>  	 */
> =20
> -	uint64_t offset; /* GPU address space is independent of CPU word size=
 */
> -
>  	struct sg_table *sg;
>  };
> =20
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_d=
river.h
> index c9e0fd09f4b2..c8ce6c181abe 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -177,7 +177,6 @@ struct ttm_mem_type_manager {
>  	bool has_type;
>  	bool use_type;
>  	uint32_t flags;
> -	uint64_t gpu_offset; /* GPU address space is independent of CPU word =
size */
>  	uint64_t size;
>  	uint32_t available_caching;
>  	uint32_t default_caching;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--hzgR0rEPl8mNr9VtqFlzxwJfRSSaDs2oL--

--DKbn1261TXRforxiFSUl09U1NUbHK8nHt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5L21kACgkQaA3BHVML
eiP5nAf/aOtrTFYMTYw8KRfHUzyo6pmyhWQ04C4+27v1z0FnJ7EwpA55EOYfeJ23
cQFjTy94VLGYa+5Q/UD+MpYHkao1jA1k2TfC5alO0QPl3vyoD/lxc3HNvImERGgO
exu/cedfDR7S9yJFnkf+JCNaZR41cS8scXr8iKtNqYm+32xpPLwhdPSVeNeQFi03
gsMyXQ/GvSmozA8LOfHaKxQML2gagprtelGdZloLMI+D0Eaydn5ldoBJLktLTV1/
s4G0ozf8LN6UIZWSHyEOoJxTKzSR8LIYPqpZAw5C3g4HoSq5hgTqGx7qcSzfwBTF
IaVOjqFp4yMWLD4y0zLG7nhckfcw9g==
=+37I
-----END PGP SIGNATURE-----

--DKbn1261TXRforxiFSUl09U1NUbHK8nHt--

--===============1955444229==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1955444229==--
