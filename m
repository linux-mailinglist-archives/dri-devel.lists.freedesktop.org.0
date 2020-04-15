Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 424BC1AAF96
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 19:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C616E1FB;
	Wed, 15 Apr 2020 17:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A266E1FB;
 Wed, 15 Apr 2020 17:32:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 26923AF3F;
 Wed, 15 Apr 2020 17:32:52 +0000 (UTC)
Subject: Re: [PATCH 05/59] drm/vboxvidoe: use managed pci functions
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-6-daniel.vetter@ffwll.ch>
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
Message-ID: <30509d8f-f2ce-ce32-1de6-b807c3eb5b4b@suse.de>
Date: Wed, 15 Apr 2020 19:32:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200415074034.175360-6-daniel.vetter@ffwll.ch>
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
Cc: Hans de Goede <hdegoede@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============1276254460=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1276254460==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ez2CnJveTAfgLs2uiV80M236OHAYLxMig"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ez2CnJveTAfgLs2uiV80M236OHAYLxMig
Content-Type: multipart/mixed; boundary="lTmyJdGtNFbhQSBGjE4UBXjX0F9OhdDda";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <30509d8f-f2ce-ce32-1de6-b807c3eb5b4b@suse.de>
Subject: Re: [PATCH 05/59] drm/vboxvidoe: use managed pci functions
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-6-daniel.vetter@ffwll.ch>
In-Reply-To: <20200415074034.175360-6-daniel.vetter@ffwll.ch>

--lTmyJdGtNFbhQSBGjE4UBXjX0F9OhdDda
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

The commit's headline says 'vboxvidoe'.

Am 15.04.20 um 09:39 schrieb Daniel Vetter:
> Allows us to drop the cleanup code on the floor.
>=20
> Sam noticed in his review:
>> With this change we avoid calling pci_disable_device()
>> twise in case vbox_mm_init() fails.
>> Once in vbox_hw_fini() and once in the error path.
>=20
> v2: Include Sam's review remarks
>=20
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/vboxvideo/vbox_drv.c  | 6 ++----
>  drivers/gpu/drm/vboxvideo/vbox_main.c | 7 +------
>  2 files changed, 3 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vbo=
xvideo/vbox_drv.c
> index cfa4639c5142..cf2e3e6a2388 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> @@ -55,13 +55,13 @@ static int vbox_pci_probe(struct pci_dev *pdev, con=
st struct pci_device_id *ent)
>  	pci_set_drvdata(pdev, vbox);
>  	mutex_init(&vbox->hw_mutex);
> =20
> -	ret =3D pci_enable_device(pdev);
> +	ret =3D pcim_enable_device(pdev);
>  	if (ret)
>  		return ret;
> =20
>  	ret =3D vbox_hw_init(vbox);
>  	if (ret)
> -		goto err_pci_disable;
> +		return ret;
> =20
>  	ret =3D vbox_mm_init(vbox);
>  	if (ret)
> @@ -91,8 +91,6 @@ static int vbox_pci_probe(struct pci_dev *pdev, const=
 struct pci_device_id *ent)
>  	vbox_mm_fini(vbox);
>  err_hw_fini:
>  	vbox_hw_fini(vbox);
> -err_pci_disable:
> -	pci_disable_device(pdev);
>  	return ret;
>  }
> =20
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_main.c b/drivers/gpu/drm/vb=
oxvideo/vbox_main.c
> index 9dcab115a261..1336ab9795fc 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_main.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_main.c
> @@ -71,8 +71,6 @@ static void vbox_accel_fini(struct vbox_private *vbox=
)
> =20
>  	for (i =3D 0; i < vbox->num_crtcs; ++i)
>  		vbva_disable(&vbox->vbva_info[i], vbox->guest_pool, i);
> -
> -	pci_iounmap(vbox->ddev.pdev, vbox->vbva_buffers);
>  }
> =20
>  /* Do we support the 4.3 plus mode hint reporting interface? */
> @@ -125,7 +123,7 @@ int vbox_hw_init(struct vbox_private *vbox)
>  	/* Create guest-heap mem-pool use 2^4 =3D 16 byte chunks */
>  	vbox->guest_pool =3D gen_pool_create(4, -1);
>  	if (!vbox->guest_pool)
> -		goto err_unmap_guest_heap;
> +		return -ENOMEM;
> =20
>  	ret =3D gen_pool_add_virt(vbox->guest_pool,
>  				(unsigned long)vbox->guest_heap,
> @@ -168,8 +166,6 @@ int vbox_hw_init(struct vbox_private *vbox)
> =20
>  err_destroy_guest_pool:
>  	gen_pool_destroy(vbox->guest_pool);
> -err_unmap_guest_heap:
> -	pci_iounmap(vbox->ddev.pdev, vbox->guest_heap);
>  	return ret;
>  }
> =20
> @@ -177,5 +173,4 @@ void vbox_hw_fini(struct vbox_private *vbox)
>  {
>  	vbox_accel_fini(vbox);
>  	gen_pool_destroy(vbox->guest_pool);
> -	pci_iounmap(vbox->ddev.pdev, vbox->guest_heap);
>  }
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--lTmyJdGtNFbhQSBGjE4UBXjX0F9OhdDda--

--ez2CnJveTAfgLs2uiV80M236OHAYLxMig
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6XRUEACgkQaA3BHVML
eiOrYwgAnXeD43oIm5bYpq4i2M2BmFSH1jJoznWUMNaNHjEKf9r9H4lV1lq74Ntp
/IBYeEGaDGBMch54y83tEPlKUVCGEon710jVLDKECwxNtO6ypkLlKC4YKHdvojWp
+QyhCEjijNzlh1HaNVdVJUGkQjoKyUWton2GxbcYM4x2DAbIFB4C7DJ2mF40T3oE
/DNc2KhX8KRxtm5sTG7N0xxCG8d77Fh3WZDmwwcp45pOFlHJkN5D8/5gVPSo4c3G
MtTCjPw16i7hwLjoDOqThY9lS1SWxjJeQQwAWgvG+NiEZ/En1eZ6HuaeQVZgZnQM
BQ7YXSwczR4NHfKX/sBuiIRVqNvMVQ==
=dCP8
-----END PGP SIGNATURE-----

--ez2CnJveTAfgLs2uiV80M236OHAYLxMig--

--===============1276254460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1276254460==--
