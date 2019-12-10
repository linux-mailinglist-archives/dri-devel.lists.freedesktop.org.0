Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E0311837F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 10:27:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124616E87E;
	Tue, 10 Dec 2019 09:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC696E87F
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 09:27:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6B6A1AE74;
 Tue, 10 Dec 2019 09:27:19 +0000 (UTC)
Subject: Re: [PATCH] drm/virtio: fix mmap page attributes
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20191210085759.14763-1-kraxel@redhat.com>
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
Message-ID: <e8915378-df67-e6f4-f40c-599797e16e9c@suse.de>
Date: Tue, 10 Dec 2019 10:27:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191210085759.14763-1-kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, gurchetansingh@chromium.org,
 open list <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: multipart/mixed; boundary="===============1440275920=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1440275920==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tXIp6XNLLIEce1SuAIUeV5SovceQlbU1x"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tXIp6XNLLIEce1SuAIUeV5SovceQlbU1x
Content-Type: multipart/mixed; boundary="byvtVeCFq7qEeSe2yUOBbH4fGZ9G4ZJeh";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, open list
 <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 gurchetansingh@chromium.org
Message-ID: <e8915378-df67-e6f4-f40c-599797e16e9c@suse.de>
Subject: Re: [PATCH] drm/virtio: fix mmap page attributes
References: <20191210085759.14763-1-kraxel@redhat.com>
In-Reply-To: <20191210085759.14763-1-kraxel@redhat.com>

--byvtVeCFq7qEeSe2yUOBbH4fGZ9G4ZJeh
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 10.12.19 um 09:57 schrieb Gerd Hoffmann:
> virtio-gpu uses cached mappings.  shmem helpers use writecombine though=
=2E
> So roll our own mmap function, wrapping drm_gem_shmem_mmap(), to tweak
> vm_page_prot accordingly.
>=20
> Reported-by: Gurchetan Singh <gurchetansingh@chromium.org>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_object.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/=
virtio/virtgpu_object.c
> index 017a9e0fc3bb..158610902054 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -75,6 +75,22 @@ static void virtio_gpu_free_object(struct drm_gem_ob=
ject *obj)
>  	drm_gem_shmem_free_object(obj);
>  }
> =20
> +static int virtio_gpu_gem_mmap(struct drm_gem_object *obj, struct vm_a=
rea_struct *vma)
> +{
> +	pgprot_t prot;
> +	int ret;
> +
> +	ret =3D drm_gem_shmem_mmap(obj, vma);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* virtio-gpu needs normal caching, so clear writecombine */
> +	prot =3D vm_get_page_prot(vma->vm_flags);
> +	prot =3D pgprot_decrypted(prot);
> +	vma->vm_page_prot =3D prot;
> +	return 0;
> +}

There's similar code in udl, [1] which still uses writecombine for
imported buffers. Virtio does not need this?

Aside from this, do you think we could handle all special cases within
shmem?

Best regards
Thomas

[1]
https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/udl/udl_gem=
=2Ec?id=3D28ecf94a6f1072fc4744c06f5b3d267297125b37#n20

> +
>  static const struct drm_gem_object_funcs virtio_gpu_gem_funcs =3D {
>  	.free =3D virtio_gpu_free_object,
>  	.open =3D virtio_gpu_gem_object_open,
> @@ -86,7 +102,7 @@ static const struct drm_gem_object_funcs virtio_gpu_=
gem_funcs =3D {
>  	.get_sg_table =3D drm_gem_shmem_get_sg_table,
>  	.vmap =3D drm_gem_shmem_vmap,
>  	.vunmap =3D drm_gem_shmem_vunmap,
> -	.mmap =3D &drm_gem_shmem_mmap,
> +	.mmap =3D &virtio_gpu_gem_mmap,
>  };
> =20
>  struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev=
,
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--byvtVeCFq7qEeSe2yUOBbH4fGZ9G4ZJeh--

--tXIp6XNLLIEce1SuAIUeV5SovceQlbU1x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3vZPIACgkQaA3BHVML
eiOEEQgAm12FJOpXRZL0gz0A05Oagc66189UnZVFiMGYgvmaTb/glrD2qc1uZ0/z
kDVe8Amys5mv3I/QeEuoN9p9ZMpuxAdcKmeNlfroDSo5BJfJWQO9/PC5Lyz6sWEq
Snr9ukUlw2jwtSFA0GcbgzdbuVyaA6ZM4rkNuYAnadUPf/EswcgUxQlxWjZSQ1dY
4PnkqgrHk+LZwyza2haOM5AX/2zjGjdbGxPHWQ1LE4YSESqEOg4xOJ0AuYCc84aO
fU8klXGhkQ+MeTr55AG71Kc10y8cQwelz4V/f4AW05Kk6eHuumykaVUZPE2+AVtu
r+HKNLNv+FkXOrlmPdo3y0F/BFB8Fw==
=15RE
-----END PGP SIGNATURE-----

--tXIp6XNLLIEce1SuAIUeV5SovceQlbU1x--

--===============1440275920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1440275920==--
