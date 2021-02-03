Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4EB30D50A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 09:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4296EA07;
	Wed,  3 Feb 2021 08:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D295D89F6B;
 Wed,  3 Feb 2021 08:20:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5AEB8AC3A;
 Wed,  3 Feb 2021 08:20:22 +0000 (UTC)
Subject: =?UTF-8?Q?Re=3a_=5bPATCH=5d_drm/nouveau=3a_remove_set_but_not_used_?=
 =?UTF-8?Q?variable_=e2=80=98pdev=e2=80=99_in_nouveau=5fbios=5finit?=
To: Ye Bin <yebin10@huawei.com>, bskeggs@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210123013014.3815870-1-yebin10@huawei.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <aa1dc788-bc47-ac8e-73a9-067be8b6ba7a@suse.de>
Date: Wed, 3 Feb 2021 09:20:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210123013014.3815870-1-yebin10@huawei.com>
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
Cc: Hulk Robot <hulkci@huawei.com>
Content-Type: multipart/mixed; boundary="===============1208324638=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1208324638==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="rm5LD8VZtyhsfXogm2MgzIbGwK4MBB9k6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rm5LD8VZtyhsfXogm2MgzIbGwK4MBB9k6
Content-Type: multipart/mixed; boundary="1CsaXThNQWcfbJMGuWTfOXIh1DkO7eibk";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Ye Bin <yebin10@huawei.com>, bskeggs@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Hulk Robot <hulkci@huawei.com>
Message-ID: <aa1dc788-bc47-ac8e-73a9-067be8b6ba7a@suse.de>
Subject: =?UTF-8?Q?Re=3a_=5bPATCH=5d_drm/nouveau=3a_remove_set_but_not_used_?=
 =?UTF-8?Q?variable_=e2=80=98pdev=e2=80=99_in_nouveau=5fbios=5finit?=
References: <20210123013014.3815870-1-yebin10@huawei.com>
In-Reply-To: <20210123013014.3815870-1-yebin10@huawei.com>

--1CsaXThNQWcfbJMGuWTfOXIh1DkO7eibk
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Applied to drm-misc-next. Thanks for the patch!

Am 23.01.21 um 02:30 schrieb Ye Bin:
> Fix follow warning:
> drivers/gpu/drm/nouveau/nouveau_bios.c:2086:18: warning: variable =E2=80=
=98pdev=E2=80=99 set but not used [-Wunused-but-set-variable]
>    struct pci_dev *pdev;
>                    ^~~~
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Ye Bin <yebin10@huawei.com>
> ---
>   drivers/gpu/drm/nouveau/nouveau_bios.c | 2 --
>   1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/n=
ouveau/nouveau_bios.c
> index 7cc683b8dc7a..e8c445eb1100 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bios.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
> @@ -2083,13 +2083,11 @@ nouveau_bios_init(struct drm_device *dev)
>   {
>   	struct nouveau_drm *drm =3D nouveau_drm(dev);
>   	struct nvbios *bios =3D &drm->vbios;
> -	struct pci_dev *pdev;
>   	int ret;
>  =20
>   	/* only relevant for PCI devices */
>   	if (!dev_is_pci(dev->dev))
>   		return 0;
> -	pdev =3D to_pci_dev(dev->dev);
>  =20
>   	if (!NVInitVBIOS(dev))
>   		return -ENODEV;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--1CsaXThNQWcfbJMGuWTfOXIh1DkO7eibk--

--rm5LD8VZtyhsfXogm2MgzIbGwK4MBB9k6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAaXMUFAwAAAAAACgkQlh/E3EQov+D7
ZxAAxLjMylCx6YFYx6DLkHXiemXHddeNdKImp91LogDAOIXpRgBwOi20RoRKzEHF3wuRHBr3mQbn
FbLzxYBdu4Hc+CMSuZwLdg5GaICjhuvB6KXsZwEfpDOCpaPsduT6FKWMYCqscDY36Vb6e11mGgUd
ua/tgcPTxJML1pV/GKYTch8rS+OJ2fUxXqRuNQTmipjaIaM8F6s4n1255kwVQCYa6aKjy0aFHm5f
qf5Uk8XiWhSbmw5lO31+6oynLJHA4Q2BpBtPmAr4Abw9cR+UIn7MbywA+JFiYT6TV2bcWXb2uK+8
3dRWW8SizsqQtElS7vN9PBiPcDW9YMX6fcHj8PO2Xtqw6kYlgejS0jPuPOkTtECeuKbBlGtut7r0
7LL8uHs4fsvTGB+RmTKdEn/hI5ubHbE8R2x+EXWpNA+3ItzOlV6a75S/ShNcAVXZc3hB2KsNEnje
GwpP+NmlJUC7BXlbuPSRlC7AZjSzxV0Ukffk7vVqzF0cVyHPwJJNzSwRU4Ct20+5d7J9+pcXrk4x
7iACRs4e/5qkPdQYtdE0O4iwUeq9XdxDEuXWFS9e6t1SHP3hXndRfoMFNaqKNtDWGCK+hN7bhKfS
2Bq9356np4qmoyTm9M1MS1+SsH1AB6azfqboJ7QV9KYRDYXQmBvDMeJcV2qaAxtwwWfQcp7pKNd3
new=
=Nb9N
-----END PGP SIGNATURE-----

--rm5LD8VZtyhsfXogm2MgzIbGwK4MBB9k6--

--===============1208324638==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1208324638==--
