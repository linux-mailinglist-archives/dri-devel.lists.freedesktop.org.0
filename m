Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 210BD1F19AA
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 15:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E456E4F1;
	Mon,  8 Jun 2020 13:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4005C6E4F1
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 13:06:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 682EBAD7D;
 Mon,  8 Jun 2020 13:06:39 +0000 (UTC)
Subject: Re: [PATCH 09/14] drm/mgag200: Prefix global names in mgag200_drv.c
 with mgag200_
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200605135803.19811-1-tzimmermann@suse.de>
 <20200605135803.19811-10-tzimmermann@suse.de>
 <20200605144219.GC204352@ravnborg.org>
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
Message-ID: <5aa0b58c-7e35-1fb2-68b7-55d1a9ea81a6@suse.de>
Date: Mon, 8 Jun 2020 15:06:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200605144219.GC204352@ravnborg.org>
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 emil.velikov@collabora.com
Content-Type: multipart/mixed; boundary="===============0962434722=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0962434722==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="2LR843andjlP6WacuP95giKxl5W254LTe"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2LR843andjlP6WacuP95giKxl5W254LTe
Content-Type: multipart/mixed; boundary="NOgVUi2OZq9PjJFqdDCHOOqj5whHDKFeG";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: airlied@redhat.com, daniel@ffwll.ch, emil.velikov@collabora.com,
 kraxel@redhat.com, dri-devel@lists.freedesktop.org
Message-ID: <5aa0b58c-7e35-1fb2-68b7-55d1a9ea81a6@suse.de>
Subject: Re: [PATCH 09/14] drm/mgag200: Prefix global names in mgag200_drv.c
 with mgag200_
References: <20200605135803.19811-1-tzimmermann@suse.de>
 <20200605135803.19811-10-tzimmermann@suse.de>
 <20200605144219.GC204352@ravnborg.org>
In-Reply-To: <20200605144219.GC204352@ravnborg.org>

--NOgVUi2OZq9PjJFqdDCHOOqj5whHDKFeG
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 05.06.20 um 16:42 schrieb Sam Ravnborg:
> On Fri, Jun 05, 2020 at 03:57:58PM +0200, Thomas Zimmermann wrote:
>> The naming of global symbols in mgag200_drv.c is inconsistent. Fix
>> that by prefixing all names with mgag200_.
>=20
> Hmm, static symbols are hardly global symbols.
> Patch is fine, but changelog seems a litte off.

OK, I'll try to clarify this.

Best regards
Thomas

>=20
> 	Sam
>=20
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/mgag200/mgag200_drv.c | 20 ++++++++++----------
>>  1 file changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/m=
gag200/mgag200_drv.c
>> index 670e12d57dea8..ad74e02d8f251 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
>> @@ -27,7 +27,7 @@ module_param_named(modeset, mgag200_modeset, int, 04=
00);
>> =20
>>  DEFINE_DRM_GEM_FOPS(mgag200_driver_fops);
>> =20
>> -static struct drm_driver driver =3D {
>> +static struct drm_driver mgag200_driver =3D {
>>  	.driver_features =3D DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
>>  	.fops =3D &mgag200_driver_fops,
>>  	.name =3D DRIVER_NAME,
>> @@ -43,7 +43,7 @@ static struct drm_driver driver =3D {
>>   * PCI driver
>>   */
>> =20
>> -static const struct pci_device_id pciidlist[] =3D {
>> +static const struct pci_device_id mgag200_pciidlist[] =3D {
>>  	{ PCI_VENDOR_ID_MATROX, 0x522, PCI_ANY_ID, PCI_ANY_ID, 0, 0,
>>  		G200_SE_A | MGAG200_FLAG_HW_BUG_NO_STARTADD},
>>  	{ PCI_VENDOR_ID_MATROX, 0x524, PCI_ANY_ID, PCI_ANY_ID, 0, 0, G200_SE=
_B },
>> @@ -56,10 +56,10 @@ static const struct pci_device_id pciidlist[] =3D =
{
>>  	{0,}
>>  };
>> =20
>> -MODULE_DEVICE_TABLE(pci, pciidlist);
>> +MODULE_DEVICE_TABLE(pci, mgag200_pciidlist);
>> =20
>> -
>> -static int mga_pci_probe(struct pci_dev *pdev, const struct pci_devic=
e_id *ent)
>> +static int
>> +mgag200_pci_probe(struct pci_dev *pdev, const struct pci_device_id *e=
nt)
>>  {
>>  	struct drm_device *dev;
>>  	int ret;
>> @@ -70,7 +70,7 @@ static int mga_pci_probe(struct pci_dev *pdev, const=
 struct pci_device_id *ent)
>>  	if (ret)
>>  		return ret;
>> =20
>> -	dev =3D drm_dev_alloc(&driver, &pdev->dev);
>> +	dev =3D drm_dev_alloc(&mgag200_driver, &pdev->dev);
>>  	if (IS_ERR(dev))
>>  		return PTR_ERR(dev);
>> =20
>> @@ -96,7 +96,7 @@ static int mga_pci_probe(struct pci_dev *pdev, const=
 struct pci_device_id *ent)
>>  	return ret;
>>  }
>> =20
>> -static void mga_pci_remove(struct pci_dev *pdev)
>> +static void mgag200_pci_remove(struct pci_dev *pdev)
>>  {
>>  	struct drm_device *dev =3D pci_get_drvdata(pdev);
>> =20
>> @@ -107,9 +107,9 @@ static void mga_pci_remove(struct pci_dev *pdev)
>> =20
>>  static struct pci_driver mgag200_pci_driver =3D {
>>  	.name =3D DRIVER_NAME,
>> -	.id_table =3D pciidlist,
>> -	.probe =3D mga_pci_probe,
>> -	.remove =3D mga_pci_remove,
>> +	.id_table =3D mgag200_pciidlist,
>> +	.probe =3D mgag200_pci_probe,
>> +	.remove =3D mgag200_pci_remove,
>>  };
>> =20
>>  static int __init mgag200_init(void)
>> --=20
>> 2.26.2

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--NOgVUi2OZq9PjJFqdDCHOOqj5whHDKFeG--

--2LR843andjlP6WacuP95giKxl5W254LTe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7eN9sACgkQaA3BHVML
eiMi0QgAiLGEOP4D/iBe3oHtWbhIFgxxdtVCeG5ltYthxshB0XYsralFfJDC3TFs
HiPnSG3YnCxOGB4BixdGaKfwCoiSbWhCIAamYuxTyKSta3WOhnxT0isvTpva0MIs
TJKgjeIa8B1v+OTSdOWz0sGjwjrRw11ze6XbsjwXfUQL5yi891xGnGEA/pYs2lgc
BlmDlmgrHbwy/QKEsWF588/cqBnhhwm6tBJuQSWgeXH/NBJINX5ep81HXORnjDOY
PCfDTrgiBHG7vgx6oTkboB6PGMc6+KIs1KuQlzQMeAhBR0RociisFsQ959mqSmXX
25KnI31BzN5ETA4JoIAUg+zmZXr3BA==
=OQU2
-----END PGP SIGNATURE-----

--2LR843andjlP6WacuP95giKxl5W254LTe--

--===============0962434722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0962434722==--
