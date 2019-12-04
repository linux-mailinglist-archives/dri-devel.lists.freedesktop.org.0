Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAFE112398
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 08:30:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC826E8D6;
	Wed,  4 Dec 2019 07:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F486E8D6
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 07:30:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D18CDACA5;
 Wed,  4 Dec 2019 07:30:46 +0000 (UTC)
Subject: Re: [PATCH 3/4] drm/mgag200: Add workaround for HW that does not
 support 'startadd'
To: John Donnelly <john.p.donnelly@oracle.com>
References: <20191126072545.22663-1-tzimmermann@suse.de>
 <20191126072545.22663-4-tzimmermann@suse.de>
 <20191126093710.GR29965@phenom.ffwll.local>
 <8099fad7-6b74-e769-9431-900a531c5d11@suse.de>
 <0FB4179F-B299-41A9-A75A-EF9294E0DD17@oracle.com>
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
Message-ID: <edc3ed43-cede-e5ea-f2a4-b4fcfc8b8af7@suse.de>
Date: Wed, 4 Dec 2019 08:30:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <0FB4179F-B299-41A9-A75A-EF9294E0DD17@oracle.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org, sam@ravnborg.org,
 kraxel@redhat.com
Content-Type: multipart/mixed; boundary="===============1688061774=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1688061774==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GTA755jyauPaIyDzMzl1VHfMEi2GMpnAH"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GTA755jyauPaIyDzMzl1VHfMEi2GMpnAH
Content-Type: multipart/mixed; boundary="IOnYHwDoTZVhNc6VZDAtkA22HjPPNiOQb";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: John Donnelly <john.p.donnelly@oracle.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, airlied@redhat.com, kraxel@redhat.com,
 sam@ravnborg.org, dri-devel@lists.freedesktop.org
Message-ID: <edc3ed43-cede-e5ea-f2a4-b4fcfc8b8af7@suse.de>
Subject: Re: [PATCH 3/4] drm/mgag200: Add workaround for HW that does not
 support 'startadd'
References: <20191126072545.22663-1-tzimmermann@suse.de>
 <20191126072545.22663-4-tzimmermann@suse.de>
 <20191126093710.GR29965@phenom.ffwll.local>
 <8099fad7-6b74-e769-9431-900a531c5d11@suse.de>
 <0FB4179F-B299-41A9-A75A-EF9294E0DD17@oracle.com>
In-Reply-To: <0FB4179F-B299-41A9-A75A-EF9294E0DD17@oracle.com>

--IOnYHwDoTZVhNc6VZDAtkA22HjPPNiOQb
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi John

Am 03.12.19 um 18:55 schrieb John Donnelly:
> Hi ,
>=20
> See below ,
>=20
>=20
>> On Nov 26, 2019, at 3:50 AM, Thomas Zimmermann <tzimmermann@suse.de> w=
rote:
>>
>> Hi
>>
>> Am 26.11.19 um 10:37 schrieb Daniel Vetter:
>>> On Tue, Nov 26, 2019 at 08:25:44AM +0100, Thomas Zimmermann wrote:
>>>> There's at least one system that does not interpret the value of
>>>> the device's 'startadd' field correctly, which leads to incorrectly
>>>> displayed scanout buffers. Always placing the active scanout buffer
>>>> at offset 0 works around the problem.
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Reported-by: John Donnelly <john.p.donnelly@oracle.com>
>>>> Link: https://gitlab.freedesktop.org/drm/misc/issues/7
>>>
>>> Tested-by: John Donnelly <john.p.donnelly@oracle.com>
>>>
>>> (Not quite this patch, but pretty much the logic, so counts).
>>>
>>> Fixes: 81da87f63a1e ("drm: Replace drm_gem_vram_push_to_system() with=
 kunmap + unpin")
>>> Cc: <stable@vger.kernel.org> # v5.3+
>>>
>>> Also you need the stable line on both prep patches too. For next time=

>>> around,
>>>
>>> $ dim fixes 81da87f63a1e
>>>
>>> will generate all the stuff you need, including a good set of suggest=
ed
>>> Cc: you should have.
>>>
>>> On the first 3 patches, with all that stuff added:
>>>
>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>
>> Thanks for the review.
>>
>> Sorry for leaving out some of the tags. I wanted to wait for feedback
>> before adding tested-by, fixes, stable. I'll split off patch 4 from th=
e
>> series and get 1 to 3 merged ASAP.
>>
>> Best regards
>> Thomas
>>
>>>
>>> Please push these to drm-misc-next-fixes so they get backported as qu=
ickly
>>> as possible.
>>> -Daniel
>>>
>>>> ---
>>>> drivers/gpu/drm/mgag200/mgag200_drv.c | 36 +++++++++++++++++++++++++=
+-
>>>> drivers/gpu/drm/mgag200/mgag200_drv.h |  3 +++
>>>> 2 files changed, 38 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm=
/mgag200/mgag200_drv.c
>>>> index 397f8b0a9af8..d43951caeea0 100644
>>>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
>>>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
>>>> @@ -30,6 +30,8 @@ module_param_named(modeset, mgag200_modeset, int, =
0400);
>>>> static struct drm_driver driver;
>>>>
>>>> static const struct pci_device_id pciidlist[] =3D {
>>>> +	{ PCI_VENDOR_ID_MATROX, 0x522, PCI_VENDOR_ID_SUN, 0x4852, 0, 0,
>>>> +		G200_SE_A | MGAG200_FLAG_HW_BUG_NO_STARTADD},
>=20
>=20
>=20
> I will have an additional list of vendor IDs (0x4852)  I will provide i=
n a follow up patch shortly .  This fixes only 1 flavor  of server.

Thank you for all the testing you do. We can add these ids as necessary.

Before, I posted a patch at [1] that prints an internal unique id. The
id of your original test machine was 0x2 IIRC.

My guess is that the problem might be related to the chip's revision. If
you have the option of booting your own kernels on all these machines,
could you apply the patch and look for a pattern in these ids? Maybe
only revision 0x2 is affected.

Best regards
Thomas


[1]
https://gitlab.freedesktop.org/drm/misc/uploads/1d5d9a75571c2bac71f80e0d2=
411e840/0001-drm-mgag200-Print-unique-revision-id-for-G200SE.patch

>=20
>=20
> Thank you .
>=20
>=20
>=20
>=20
>=20
>=20
>>>> 	{ PCI_VENDOR_ID_MATROX, 0x522, PCI_ANY_ID, PCI_ANY_ID, 0, 0, G200_S=
E_A },
>>>> 	{ PCI_VENDOR_ID_MATROX, 0x524, PCI_ANY_ID, PCI_ANY_ID, 0, 0, G200_S=
E_B },
>>>> 	{ PCI_VENDOR_ID_MATROX, 0x530, PCI_ANY_ID, PCI_ANY_ID, 0, 0, G200_E=
V },
>>>> @@ -60,6 +62,35 @@ static void mga_pci_remove(struct pci_dev *pdev)
>>>>
>>>> DEFINE_DRM_GEM_FOPS(mgag200_driver_fops);
>>>>
>>>> +static bool mgag200_pin_bo_at_0(const struct mga_device *mdev)
>>>> +{
>>>> +	return mdev->flags & MGAG200_FLAG_HW_BUG_NO_STARTADD;
>>>> +}
>>>> +
>>>> +int mgag200_driver_dumb_create(struct drm_file *file,
>>>> +			       struct drm_device *dev,
>>>> +			       struct drm_mode_create_dumb *args)
>>>> +{
>>>> +	struct mga_device *mdev =3D dev->dev_private;
>>>> +	unsigned long pg_align;
>>>> +
>>>> +	if (WARN_ONCE(!dev->vram_mm, "VRAM MM not initialized"))
>>>> +		return -EINVAL;
>>>> +
>>>> +	pg_align =3D 0ul;
>>>> +
>>>> +	/*
>>>> +	 * Aligning scanout buffers to the size of the video ram forces
>>>> +	 * placement at offset 0. Works around a bug where HW does not
>>>> +	 * respect 'startadd' field.
>>>> +	 */
>>>> +	if (mgag200_pin_bo_at_0(mdev))
>>>> +		pg_align =3D PFN_UP(mdev->mc.vram_size);
>>>> +
>>>> +	return drm_gem_vram_fill_create_dumb(file, dev, &dev->vram_mm->bde=
v,
>>>> +					     pg_align, false, args);
>>>> +}
>>>> +
>>>> static struct drm_driver driver =3D {
>>>> 	.driver_features =3D DRIVER_GEM | DRIVER_MODESET,
>>>> 	.load =3D mgag200_driver_load,
>>>> @@ -71,7 +102,10 @@ static struct drm_driver driver =3D {
>>>> 	.major =3D DRIVER_MAJOR,
>>>> 	.minor =3D DRIVER_MINOR,
>>>> 	.patchlevel =3D DRIVER_PATCHLEVEL,
>>>> -	DRM_GEM_VRAM_DRIVER
>>>> +	.debugfs_init =3D drm_vram_mm_debugfs_init,
>>>> +	.dumb_create =3D mgag200_driver_dumb_create,
>>>> +	.dumb_map_offset =3D drm_gem_vram_driver_dumb_mmap_offset,
>>>> +	.gem_prime_mmap =3D drm_gem_prime_mmap,
>>>> };
>>>>
>>>> static struct pci_driver mgag200_pci_driver =3D {
>>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm=
/mgag200/mgag200_drv.h
>>>> index 4b4f9ce74a84..aa32aad222c2 100644
>>>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
>>>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
>>>> @@ -150,6 +150,9 @@ enum mga_type {
>>>> 	G200_EW3,
>>>> };
>>>>
>>>> +/* HW does not handle 'startadd' field correct. */
>>>> +#define MGAG200_FLAG_HW_BUG_NO_STARTADD	(1ul << 8)
>>>> +
>>>> #define MGAG200_TYPE_MASK	(0x000000ff)
>>>> #define MGAG200_FLAG_MASK	(0x00ffff00)
>>>>
>>>> --=20
>>>> 2.23.0
>>>>
>>>
>>
>> --=20
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--IOnYHwDoTZVhNc6VZDAtkA22HjPPNiOQb--

--GTA755jyauPaIyDzMzl1VHfMEi2GMpnAH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3nYKUACgkQaA3BHVML
eiM6Rwf+P4z9OWT1PYyIBv2y1g2waVQ2jxBzoTcD67EHqOo1KGslJAVuWUFQcEXu
sP1SkgV2ZapNusqd+D8dSosVUzw8lP1A7jJgZtIY5J+kI6VmxV0QnLhqo2oDwpj6
QyX4xUzjIdrbn6dbXMVHm7dBtxXxllTd7rzPMN+B8Ps8qNHHh3W9B/1Bx35fX40s
GWJL6Gn2fw0/AsEw7kQE0bdQ2mYZU7CC0og1OYmCIULfyJgLKbq4LlJ6kU4K7ASd
9uzdcXcSNcNQyMPq6CYLgM4Iz90lLP/dZqwJ/g2yw+iTgqKRRbsalq8aVaP/+y8d
y9RA6jMuUKhtPaWFCokgNO8Bc3/VoQ==
=4ID5
-----END PGP SIGNATURE-----

--GTA755jyauPaIyDzMzl1VHfMEi2GMpnAH--

--===============1688061774==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1688061774==--
