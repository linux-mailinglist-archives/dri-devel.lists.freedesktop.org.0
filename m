Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B93651F676A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 14:04:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0366E915;
	Thu, 11 Jun 2020 12:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB10A6E14A;
 Thu, 11 Jun 2020 12:04:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 04B02AD35;
 Thu, 11 Jun 2020 12:04:13 +0000 (UTC)
Subject: Re: [PATCH 57/59] drm/ast: Use managed pci functions
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-58-daniel.vetter@ffwll.ch>
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
Message-ID: <b14b78e4-556d-9e52-bdfd-7c4229392ed9@suse.de>
Date: Thu, 11 Jun 2020 14:04:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200415074034.175360-58-daniel.vetter@ffwll.ch>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: multipart/mixed; boundary="===============0779524353=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0779524353==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="uoAxM33dMVkCKbcmfTM6FDINVsXgj0Hhd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uoAxM33dMVkCKbcmfTM6FDINVsXgj0Hhd
Content-Type: multipart/mixed; boundary="ZstktO1jONv1T8oOFG4XI4WNd2GbG0B3g";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>
Message-ID: <b14b78e4-556d-9e52-bdfd-7c4229392ed9@suse.de>
Subject: Re: [PATCH 57/59] drm/ast: Use managed pci functions
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-58-daniel.vetter@ffwll.ch>
In-Reply-To: <20200415074034.175360-58-daniel.vetter@ffwll.ch>

--ZstktO1jONv1T8oOFG4XI4WNd2GbG0B3g
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 15.04.20 um 09:40 schrieb Daniel Vetter:
> Allows us to remove a bit of cleanup code.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Emil Velikov <emil.velikov@collabora.com>
> Cc: "Noralf Tr=C3=B8nnes" <noralf@tronnes.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Y.C. Chen" <yc_chen@aspeedtech.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for answering my questions. Sorry for never getting back to it.

Best regards
Thomas

> ---
>  drivers/gpu/drm/ast/ast_drv.c  | 10 +++-------
>  drivers/gpu/drm/ast/ast_main.c |  3 ---
>  2 files changed, 3 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_dr=
v.c
> index b7ba22dddcad..48a9cc4e080a 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -91,15 +91,13 @@ static int ast_pci_probe(struct pci_dev *pdev, cons=
t struct pci_device_id *ent)
> =20
>  	ast_kick_out_firmware_fb(pdev);
> =20
> -	ret =3D pci_enable_device(pdev);
> +	ret =3D pcim_enable_device(pdev);
>  	if (ret)
>  		return ret;
> =20
>  	dev =3D drm_dev_alloc(&driver, &pdev->dev);
> -	if (IS_ERR(dev)) {
> -		ret =3D PTR_ERR(dev);
> -		goto err_pci_disable_device;
> -	}
> +	if (IS_ERR(dev))
> +		return  PTR_ERR(dev);
> =20
>  	dev->pdev =3D pdev;
>  	pci_set_drvdata(pdev, dev);
> @@ -120,8 +118,6 @@ static int ast_pci_probe(struct pci_dev *pdev, cons=
t struct pci_device_id *ent)
>  	ast_driver_unload(dev);
>  err_drm_dev_put:
>  	drm_dev_put(dev);
> -err_pci_disable_device:
> -	pci_disable_device(pdev);
>  	return ret;
> =20
>  }
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_m=
ain.c
> index e5398e3dabe7..1b35728ad871 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -531,8 +531,5 @@ void ast_driver_unload(struct drm_device *dev)
>  	drm_mode_config_cleanup(dev);
> =20
>  	ast_mm_fini(ast);
> -	if (ast->ioregs !=3D ast->regs + AST_IO_MM_OFFSET)
> -		pci_iounmap(dev->pdev, ast->ioregs);
> -	pci_iounmap(dev->pdev, ast->regs);
>  	kfree(ast);
>  }
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--ZstktO1jONv1T8oOFG4XI4WNd2GbG0B3g--

--uoAxM33dMVkCKbcmfTM6FDINVsXgj0Hhd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7iHbkACgkQaA3BHVML
eiMPAAf/b29grQfSneivr8NgJ1e+1YFkiO/l9upZX5aV56un6u+wRJtb1VkhBbEU
2RhdnQF5u7QdeP/ax9wDSUBksWPk9aGnXHM+LZPHv/am+GMEYpt76GAGkoqyzlvl
FQgo0P7H+v2EpV7Gv7qUAmq7tY/fbmGYWrMRjlypAjXjLq/VLW3p7y6ock3WGNUc
nDB9r/Rn+Ay6lh57MPjU2ZPc95eBXO1qcZiypTvAkcXjWVEwzxT4pXIlNIME8fqw
BmLgitGku2mLjKSfbxO4gK2YtAyR2XGxsmJDSThEIAtlAOIFfRUBCIDxjwAbNet8
dvDVJHg2NguqDTEzoHsNg/xHlNL1qQ==
=tqC8
-----END PGP SIGNATURE-----

--uoAxM33dMVkCKbcmfTM6FDINVsXgj0Hhd--

--===============0779524353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0779524353==--
