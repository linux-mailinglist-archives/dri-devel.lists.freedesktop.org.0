Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7FB16BD5D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 10:36:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E256E117;
	Tue, 25 Feb 2020 09:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CECBF6E117
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 09:36:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 547F9AC4A;
 Tue, 25 Feb 2020 09:36:38 +0000 (UTC)
Subject: Re: [PATCH 3/3] drm/pci: Unexport drm_get_pci_dev
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200222175433.2259158-1-daniel.vetter@ffwll.ch>
 <20200222175433.2259158-3-daniel.vetter@ffwll.ch>
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
Message-ID: <20cc1a6c-196b-4711-e4d9-ff26c88f0340@suse.de>
Date: Tue, 25 Feb 2020 10:36:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200222175433.2259158-3-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============0918005148=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0918005148==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="IBbq9CRmWkHPFXQ2RfaofMh7hnJEzDMeE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IBbq9CRmWkHPFXQ2RfaofMh7hnJEzDMeE
Content-Type: multipart/mixed; boundary="QvoH9O5T4bYOULWhpyomC3B2iY7nWajZy";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <20cc1a6c-196b-4711-e4d9-ff26c88f0340@suse.de>
Subject: Re: [PATCH 3/3] drm/pci: Unexport drm_get_pci_dev
References: <20200222175433.2259158-1-daniel.vetter@ffwll.ch>
 <20200222175433.2259158-3-daniel.vetter@ffwll.ch>
In-Reply-To: <20200222175433.2259158-3-daniel.vetter@ffwll.ch>

--QvoH9O5T4bYOULWhpyomC3B2iY7nWajZy
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 22.02.20 um 18:54 schrieb Daniel Vetter:
> Only user left is the shadow attach for legacy drivers.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_pci.c | 22 +++-------------------
>  include/drm/drm_pci.h     | 11 -----------
>  2 files changed, 3 insertions(+), 30 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
> index c6bb98729a26..cc5af271a1b1 100644
> --- a/drivers/gpu/drm/drm_pci.c
> +++ b/drivers/gpu/drm/drm_pci.c
> @@ -75,7 +75,6 @@ drm_dma_handle_t *drm_pci_alloc(struct drm_device * d=
ev, size_t size, size_t ali
> =20
>  	return dmah;
>  }
> -
>  EXPORT_SYMBOL(drm_pci_alloc);
> =20
>  /**
> @@ -191,23 +190,9 @@ void drm_pci_agp_destroy(struct drm_device *dev)
>  	}
>  }
> =20
> -/**
> - * drm_get_pci_dev - Register a PCI device with the DRM subsystem
> - * @pdev: PCI device
> - * @ent: entry from the PCI ID table that matches @pdev
> - * @driver: DRM device driver
> - *
> - * Attempt to gets inter module "drm" information. If we are first
> - * then register the character device and inter module information.
> - * Try and register, if we fail to register, backout previous work.
> - *
> - * NOTE: This function is deprecated, please use drm_dev_alloc() and
> - * drm_dev_register() instead and remove your &drm_driver.load callbac=
k.
> - *
> - * Return: 0 on success or a negative error code on failure.
> - */
> -int drm_get_pci_dev(struct pci_dev *pdev, const struct pci_device_id *=
ent,
> -		    struct drm_driver *driver)
> +static int drm_get_pci_dev(struct pci_dev *pdev,
> +			   const struct pci_device_id *ent,
> +			   struct drm_driver *driver)
>  {
>  	struct drm_device *dev;
>  	int ret;
> @@ -250,7 +235,6 @@ int drm_get_pci_dev(struct pci_dev *pdev, const str=
uct pci_device_id *ent,
>  	drm_dev_put(dev);
>  	return ret;
>  }
> -EXPORT_SYMBOL(drm_get_pci_dev);
> =20
>  #ifdef CONFIG_DRM_LEGACY

drm_get_pci_dev() is now only used by some legacy code. It should be
protected by CONFIG_DRM_LEGACY. With this change

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> =20
> diff --git a/include/drm/drm_pci.h b/include/drm/drm_pci.h
> index 9031e217b506..3941b0255ecf 100644
> --- a/include/drm/drm_pci.h
> +++ b/include/drm/drm_pci.h
> @@ -45,10 +45,6 @@ struct drm_dma_handle *drm_pci_alloc(struct drm_devi=
ce *dev, size_t size,
>  				     size_t align);
>  void drm_pci_free(struct drm_device *dev, struct drm_dma_handle * dmah=
);
> =20
> -int drm_get_pci_dev(struct pci_dev *pdev,
> -		    const struct pci_device_id *ent,
> -		    struct drm_driver *driver);
> -
>  #else
> =20
>  static inline struct drm_dma_handle *drm_pci_alloc(struct drm_device *=
dev,
> @@ -62,13 +58,6 @@ static inline void drm_pci_free(struct drm_device *d=
ev,
>  {
>  }
> =20
> -static inline int drm_get_pci_dev(struct pci_dev *pdev,
> -				  const struct pci_device_id *ent,
> -				  struct drm_driver *driver)
> -{
> -	return -ENOSYS;
> -}
> -
>  #endif
> =20
>  #endif /* _DRM_PCI_H_ */
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--QvoH9O5T4bYOULWhpyomC3B2iY7nWajZy--

--IBbq9CRmWkHPFXQ2RfaofMh7hnJEzDMeE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5U6qIACgkQaA3BHVML
eiNyKggAv1tf+rEEG2K3nMYimmOVtWiYq0goY+mgXIeNAbwKilJZRTG8iC8TJpqR
zK2BtpUizdUzEoErY05D8niKkhxbs0ND3JUmrqN+WZFxsuCt2Qc5Oe+6P/v8Kc7Z
1aUdBgzQYi5LbAQMVdXlEW0iqQcyoJkhpGl1um7918LJLWGpHIH1oaCzjyeOOd/t
/j7nD+cmIk+EDgnOTPnd4Ac4PXaeSf2yBCHFnGkzDjY+trm/LAiMJphm9RT1YWtJ
pVLFeyuknWxefQj5jFrdHh59r7WWpSIHMFgJ94+r4aXUsm0ok8VWV9pmKP0kguST
6w/rGQu5CdquKlPUPpaqh3Ekvj9J1g==
=j+iX
-----END PGP SIGNATURE-----

--IBbq9CRmWkHPFXQ2RfaofMh7hnJEzDMeE--

--===============0918005148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0918005148==--
