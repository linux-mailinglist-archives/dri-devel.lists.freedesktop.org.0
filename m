Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBAA19FB8E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 19:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A5C6E461;
	Mon,  6 Apr 2020 17:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08216E45E;
 Mon,  6 Apr 2020 17:29:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 26AD5B1FC1;
 Mon,  6 Apr 2020 17:29:37 +0000 (UTC)
Subject: Re: [PATCH 30/44] drm/qxl: Use devm_drm_dev_alloc
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-31-daniel.vetter@ffwll.ch>
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
Message-ID: <f85e0d74-2d1a-03ce-3eef-8c21b90845d4@suse.de>
Date: Mon, 6 Apr 2020 14:11:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200403135828.2542770-31-daniel.vetter@ffwll.ch>
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
Cc: Dave Airlie <airlied@redhat.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 spice-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============2001952359=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2001952359==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="U47qTCGnlx1wJpHiO8OcTjEHNNfTq4eiS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--U47qTCGnlx1wJpHiO8OcTjEHNNfTq4eiS
Content-Type: multipart/mixed; boundary="6kv8mAox5GvUraJWEerWSr8Z7ZNmjb3HG";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: spice-devel@lists.freedesktop.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann
 <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Dave Airlie <airlied@redhat.com>
Message-ID: <f85e0d74-2d1a-03ce-3eef-8c21b90845d4@suse.de>
Subject: Re: [PATCH 30/44] drm/qxl: Use devm_drm_dev_alloc
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-31-daniel.vetter@ffwll.ch>
In-Reply-To: <20200403135828.2542770-31-daniel.vetter@ffwll.ch>

--6kv8mAox5GvUraJWEerWSr8Z7ZNmjb3HG
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 03.04.20 um 15:58 schrieb Daniel Vetter:
> Also need to remove the drm_dev_put from the remove hook.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: virtualization@lists.linux-foundation.org
> Cc: spice-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/qxl/qxl_drv.c | 15 ++++++++-------
>  drivers/gpu/drm/qxl/qxl_drv.h |  3 +--
>  drivers/gpu/drm/qxl/qxl_kms.c | 12 +-----------
>  3 files changed, 10 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_dr=
v.c
> index 09102e2efabc..6b4ae4c5fb76 100644
> --- a/drivers/gpu/drm/qxl/qxl_drv.c
> +++ b/drivers/gpu/drm/qxl/qxl_drv.c
> @@ -81,13 +81,16 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pc=
i_device_id *ent)
>  		return -EINVAL; /* TODO: ENODEV ? */
>  	}
> =20
> -	qdev =3D kzalloc(sizeof(struct qxl_device), GFP_KERNEL);
> -	if (!qdev)
> +	qdev =3D devm_drm_dev_alloc(&pdev->dev, &qxl_driver,
> +				  struct qxl_device, ddev);
> +	if (IS_ERR(qdev)) {
> +		pr_err("Unable to init drm dev");
>  		return -ENOMEM;
> +	}

My feeling is that it is too early to allocate. Wouldn't it be better to
first do the pdev and conflicting-fb stuff and allocate right before
qxl_device_init() ?

Best regards
Thomas

> =20
>  	ret =3D pci_enable_device(pdev);
>  	if (ret)
> -		goto free_dev;
> +		return ret;
> =20
>  	ret =3D drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "qxl"=
);
>  	if (ret)
> @@ -101,7 +104,7 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pc=
i_device_id *ent)
>  		}
>  	}
> =20
> -	ret =3D qxl_device_init(qdev, &qxl_driver, pdev);
> +	ret =3D qxl_device_init(qdev, pdev);
>  	if (ret)
>  		goto put_vga;
> =20
> @@ -128,8 +131,7 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pc=
i_device_id *ent)
>  		vga_put(pdev, VGA_RSRC_LEGACY_IO);
>  disable_pci:
>  	pci_disable_device(pdev);
> -free_dev:
> -	kfree(qdev);
> +
>  	return ret;
>  }
> =20
> @@ -155,7 +157,6 @@ qxl_pci_remove(struct pci_dev *pdev)
>  	drm_atomic_helper_shutdown(dev);
>  	if (is_vga(pdev))
>  		vga_put(pdev, VGA_RSRC_LEGACY_IO);
> -	drm_dev_put(dev);
>  }
> =20
>  DEFINE_DRM_GEM_FOPS(qxl_fops);
> diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_dr=
v.h
> index 435126facc9b..86ac191d9205 100644
> --- a/drivers/gpu/drm/qxl/qxl_drv.h
> +++ b/drivers/gpu/drm/qxl/qxl_drv.h
> @@ -276,8 +276,7 @@ struct qxl_device {
>  extern const struct drm_ioctl_desc qxl_ioctls[];
>  extern int qxl_max_ioctl;
> =20
> -int qxl_device_init(struct qxl_device *qdev, struct drm_driver *drv,
> -		    struct pci_dev *pdev);
> +int qxl_device_init(struct qxl_device *qdev, struct pci_dev *pdev);
>  void qxl_device_fini(struct qxl_device *qdev);
> =20
>  int qxl_modeset_init(struct qxl_device *qdev);
> diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_km=
s.c
> index 9eed1a375f24..91a34dd835d7 100644
> --- a/drivers/gpu/drm/qxl/qxl_kms.c
> +++ b/drivers/gpu/drm/qxl/qxl_kms.c
> @@ -108,21 +108,13 @@ static void qxl_gc_work(struct work_struct *work)=

>  }
> =20
>  int qxl_device_init(struct qxl_device *qdev,
> -		    struct drm_driver *drv,
>  		    struct pci_dev *pdev)
>  {
>  	int r, sb;
> =20
> -	r =3D drm_dev_init(&qdev->ddev, drv, &pdev->dev);
> -	if (r) {
> -		pr_err("Unable to init drm dev");
> -		goto error;
> -	}
> -
>  	qdev->ddev.pdev =3D pdev;
>  	pci_set_drvdata(pdev, &qdev->ddev);
>  	qdev->ddev.dev_private =3D qdev;
> -	drmm_add_final_kfree(&qdev->ddev, qdev);
> =20
>  	mutex_init(&qdev->gem.mutex);
>  	mutex_init(&qdev->update_area_mutex);
> @@ -138,8 +130,7 @@ int qxl_device_init(struct qxl_device *qdev,
>  	qdev->vram_mapping =3D io_mapping_create_wc(qdev->vram_base, pci_reso=
urce_len(pdev, 0));
>  	if (!qdev->vram_mapping) {
>  		pr_err("Unable to create vram_mapping");
> -		r =3D -ENOMEM;
> -		goto error;
> +		return -ENOMEM;
>  	}
> =20
>  	if (pci_resource_len(pdev, 4) > 0) {
> @@ -293,7 +284,6 @@ int qxl_device_init(struct qxl_device *qdev,
>  	io_mapping_free(qdev->surface_mapping);
>  vram_mapping_free:
>  	io_mapping_free(qdev->vram_mapping);
> -error:
>  	return r;
>  }
> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--6kv8mAox5GvUraJWEerWSr8Z7ZNmjb3HG--

--U47qTCGnlx1wJpHiO8OcTjEHNNfTq4eiS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6LHF0ACgkQaA3BHVML
eiN5oAgAiGX1c+294XzOEnNtdftBXz6wvc9tUg7FAMoBixHQK3BrcgYD9CIZ5RkA
EMKoRH7GkgVruL7ABjv6Pw2h/Gb3ywxUui1pNONAmqj5mk59l7ZpNxHHgtArTvV1
+puo9VV2l7UklAoH+w8xf9obXFKSwfwyRX+bIuemq1pJGwRbIQ0/XxkTe4fK6CVu
g8+b9arcUfykEiZXH6MUWOZwUkj2nvC/oVVdc3+sFThfbKhkAd2j+Zbfa2OOXWJ6
Rf1no3zjvXrwawkGBd6k/WpwHBziIM5C6LHeAOR4OVckgLFI+cLjEiix7VyYcwYR
kiWzBaGT9GfEkX90fAqhSFia/0GXQA==
=mZNW
-----END PGP SIGNATURE-----

--U47qTCGnlx1wJpHiO8OcTjEHNNfTq4eiS--

--===============2001952359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2001952359==--
