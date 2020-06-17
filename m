Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 228411FC6E4
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 09:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D85B6E24B;
	Wed, 17 Jun 2020 07:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF41E6EAA0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 07:13:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 81973AC2E;
 Wed, 17 Jun 2020 07:13:22 +0000 (UTC)
Subject: Re: [PATCH 1/3] drm/ast: Remove unused code paths for AST 1180
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20200611082809.7838-1-tzimmermann@suse.de>
 <20200611082809.7838-2-tzimmermann@suse.de>
 <CACvgo53MoViSck=VpYb1jVaTXb1CtuR9t3251COFQ_H_qZucBg@mail.gmail.com>
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
Message-ID: <216cad9d-4e72-dd97-4c23-67f32fc57212@suse.de>
Date: Wed, 17 Jun 2020 09:13:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CACvgo53MoViSck=VpYb1jVaTXb1CtuR9t3251COFQ_H_qZucBg@mail.gmail.com>
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
Cc: chen@aspeedtech.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: multipart/mixed; boundary="===============0336424830=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0336424830==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="4AdZe6TiCBZaBQUpq6SzGvZeEQkN283XO"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4AdZe6TiCBZaBQUpq6SzGvZeEQkN283XO
Content-Type: multipart/mixed; boundary="MyOqo96W4mDfkZGape2tL0aO82bf2i5Yq";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: chen@aspeedtech.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Message-ID: <216cad9d-4e72-dd97-4c23-67f32fc57212@suse.de>
Subject: Re: [PATCH 1/3] drm/ast: Remove unused code paths for AST 1180
References: <20200611082809.7838-1-tzimmermann@suse.de>
 <20200611082809.7838-2-tzimmermann@suse.de>
 <CACvgo53MoViSck=VpYb1jVaTXb1CtuR9t3251COFQ_H_qZucBg@mail.gmail.com>
In-Reply-To: <CACvgo53MoViSck=VpYb1jVaTXb1CtuR9t3251COFQ_H_qZucBg@mail.gmail.com>

--MyOqo96W4mDfkZGape2tL0aO82bf2i5Yq
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Emil

Am 16.06.20 um 01:21 schrieb Emil Velikov:
> Hi Thomas,
>=20
> On Thu, 11 Jun 2020 at 09:28, Thomas Zimmermann <tzimmermann@suse.de> w=
rote:
>=20
>> --- a/drivers/gpu/drm/ast/ast_drv.c
>> +++ b/drivers/gpu/drm/ast/ast_drv.c
>> @@ -59,7 +59,6 @@ static struct drm_driver driver;
>>  static const struct pci_device_id pciidlist[] =3D {
>>         AST_VGA_DEVICE(PCI_CHIP_AST2000, NULL),
>>         AST_VGA_DEVICE(PCI_CHIP_AST2100, NULL),
>> -       /*      AST_VGA_DEVICE(PCI_CHIP_AST1180, NULL), - don't bind t=
o 1180 for now */
>=20
> Since we don't bind to this pciid, the (removed) code is never
> used/dead. For the series:
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>=20
> Small idea below: feel free to ignore or if you agree - follow-up at a
> random point in the future.
>=20
>=20
>> +       if (dev->pdev->revision >=3D 0x40) {
>> +               ast->chip =3D AST2500;
>> +               DRM_INFO("AST 2500 detected\n");
>> +       } else if (dev->pdev->revision >=3D 0x30) {
>> +               ast->chip =3D AST2400;
>> +               DRM_INFO("AST 2400 detected\n");
>> +       } else if (dev->pdev->revision >=3D 0x30) {
>> +               ast->chip =3D AST2400;
>> +               DRM_INFO("AST 2400 detected\n");
>> +       } else if (dev->pdev->revision >=3D 0x20) {
>> +               ast->chip =3D AST2300;
>> +               DRM_INFO("AST 2300 detected\n");
>> +       } else if (dev->pdev->revision >=3D 0x10) {
>> +               switch (scu_rev & 0x0300) {
>> +               case 0x0200:
>> +                       ast->chip =3D AST1100;
>> +                       DRM_INFO("AST 1100 detected\n");
>> +                       break;
>> +               case 0x0100:
>> +                       ast->chip =3D AST2200;
>> +                       DRM_INFO("AST 2200 detected\n");
>> +                       break;
>> +               case 0x0000:
>> +                       ast->chip =3D AST2150;
>> +                       DRM_INFO("AST 2150 detected\n");
>> +                       break;
>> +               default:
>> +                       ast->chip =3D AST2100;
>> +                       DRM_INFO("AST 2100 detected\n");
>> +                       break;
>>                 }
>> +               ast->vga2_clone =3D false;
>> +       } else {
>> +               ast->chip =3D AST2000;
>> +               DRM_INFO("AST 2000 detected\n");
>>         }
>>
> Instead of the above if/else spaghetti, one can use something alike
>=20
> static const struct foo {
>     u8 rev_maj; // revision & 0xf0 >> 4
>     u8 rev_scu; // scu_rev & 0x0300 >> 8, ignored if table has 0xf
>     enum ast_chip;
>     const char *name;
> } bar {
>    { 0x3, 0xf, AST2400, "2400" },
>    { 0x2, 0xf, AST2300, "2300" },
>    { 0x1, 0x3, AST2100, "2100" },
>    { 0x1, 0x2, AST1100, "1100" },
>    { 0x1, 0x1, AST2200, "2200" },
>    { 0x1, 0x0, AST2150, "2150" },
>    { 0x0, 0xf, AST2000, "2000" },
> };
>=20
> + trivial loop.

I do like the idea, but there's plenty of similar code throughout the
driver. I think a separate patchset could introduce an info structure
with per-chip constants and flags, and fix the entire driver.

Best regards
Thomas

>=20
> -Emil
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--MyOqo96W4mDfkZGape2tL0aO82bf2i5Yq--

--4AdZe6TiCBZaBQUpq6SzGvZeEQkN283XO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7pwooACgkQaA3BHVML
eiOrNgf9EmLmR9COXQ3fbWbsCQd6r7l49m/QfKHKUKYMq3r15lSYJyAdwUCpg5Cl
zSgisuAqaw10A7n8t7HMIkAl7uIXAdYdGWt67Vx0/KVJDzamIl4eDP2UNSsceFfq
Nj0LUdJQa1H0KGPxDSPuUum/Lfy1C8uOTZv0TazqcKUmYOj5xIExSIukw5NwhlUI
gsVe+mAti1tSXnG8Soy6ktncwPN1jhnzMLQf+VJsuD+H5wD8CgJSs5J/sWoGsGOj
2oNXgPUF/S21PCugjQuKkqgr5rIbMDHUi8JhMNfLrS/bS/7OHQ8U3ytX+sELHmL/
T3gVhVB5CiQ+c+iCn254lYQiv61j1A==
=pbev
-----END PGP SIGNATURE-----

--4AdZe6TiCBZaBQUpq6SzGvZeEQkN283XO--

--===============0336424830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0336424830==--
