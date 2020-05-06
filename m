Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 883241C6A5F
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 09:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F04689BBD;
	Wed,  6 May 2020 07:48:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9961E89BBD
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 07:48:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CDC89AC4A;
 Wed,  6 May 2020 07:48:36 +0000 (UTC)
Subject: Re: [PATCH 3/5] drm/mgag200: Remove several references to struct
 mga_device.dev
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200505095649.25814-1-tzimmermann@suse.de>
 <20200505095649.25814-4-tzimmermann@suse.de>
 <20200505140930.GS10381@phenom.ffwll.local>
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
Message-ID: <89f1e47f-54a4-937d-fd16-a3582bcb1acc@suse.de>
Date: Wed, 6 May 2020 09:48:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200505140930.GS10381@phenom.ffwll.local>
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
Cc: cogarre@gmail.com, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 airlied@redhat.com, sam@ravnborg.org, emil.velikov@collabora.com
Content-Type: multipart/mixed; boundary="===============0614684738=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0614684738==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="G9NWfUmI4ihVkRrkQD1jiYomsuH8hY1HT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--G9NWfUmI4ihVkRrkQD1jiYomsuH8hY1HT
Content-Type: multipart/mixed; boundary="iwozDBVgvRXftpvcdHg1V9sZCxMNO7bxw";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: airlied@redhat.com, kraxel@redhat.com, sam@ravnborg.org,
 emil.velikov@collabora.com, cogarre@gmail.com,
 dri-devel@lists.freedesktop.org
Message-ID: <89f1e47f-54a4-937d-fd16-a3582bcb1acc@suse.de>
Subject: Re: [PATCH 3/5] drm/mgag200: Remove several references to struct
 mga_device.dev
References: <20200505095649.25814-1-tzimmermann@suse.de>
 <20200505095649.25814-4-tzimmermann@suse.de>
 <20200505140930.GS10381@phenom.ffwll.local>
In-Reply-To: <20200505140930.GS10381@phenom.ffwll.local>

--iwozDBVgvRXftpvcdHg1V9sZCxMNO7bxw
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 05.05.20 um 16:09 schrieb Daniel Vetter:
> On Tue, May 05, 2020 at 11:56:47AM +0200, Thomas Zimmermann wrote:
>> Done in preparation of embedding the DRM device in struct mga_device.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> Not exactly sure what the goal is, since mga_vga_init still uses
> drm_device and not the mdev struct. *shrug*

It replaces 'mdev->dev' with simply 'dev'. That makes patch 5 easier to
read.

Best regards
Thomas

>=20
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>=20
>=20
>> ---
>>  drivers/gpu/drm/mgag200/mgag200_main.c | 21 +++++++++++----------
>>  drivers/gpu/drm/mgag200/mgag200_mode.c | 17 +++++++++--------
>>  2 files changed, 20 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/=
mgag200/mgag200_main.c
>> index 3830d3f3c9fa2..010b309c01fc4 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
>> @@ -66,25 +66,26 @@ static int mga_probe_vram(struct mga_device *mdev,=
 void __iomem *mem)
>>  /* Map the framebuffer from the card and configure the core */
>>  static int mga_vram_init(struct mga_device *mdev)
>>  {
>> +	struct drm_device *dev =3D mdev->dev;
>>  	void __iomem *mem;
>> =20
>>  	/* BAR 0 is VRAM */
>> -	mdev->mc.vram_base =3D pci_resource_start(mdev->dev->pdev, 0);
>> -	mdev->mc.vram_window =3D pci_resource_len(mdev->dev->pdev, 0);
>> +	mdev->mc.vram_base =3D pci_resource_start(dev->pdev, 0);
>> +	mdev->mc.vram_window =3D pci_resource_len(dev->pdev, 0);
>> =20
>> -	if (!devm_request_mem_region(mdev->dev->dev, mdev->mc.vram_base, mde=
v->mc.vram_window,
>> -				"mgadrmfb_vram")) {
>> +	if (!devm_request_mem_region(dev->dev, mdev->mc.vram_base,
>> +				     mdev->mc.vram_window, "mgadrmfb_vram")) {
>>  		DRM_ERROR("can't reserve VRAM\n");
>>  		return -ENXIO;
>>  	}
>> =20
>> -	mem =3D pci_iomap(mdev->dev->pdev, 0, 0);
>> +	mem =3D pci_iomap(dev->pdev, 0, 0);
>>  	if (!mem)
>>  		return -ENOMEM;
>> =20
>>  	mdev->mc.vram_size =3D mga_probe_vram(mdev, mem);
>> =20
>> -	pci_iounmap(mdev->dev->pdev, mem);
>> +	pci_iounmap(dev->pdev, mem);
>> =20
>>  	return 0;
>>  }
>> @@ -116,11 +117,11 @@ int mgag200_driver_load(struct drm_device *dev, =
unsigned long flags)
>>  	mdev->has_sdram =3D !(option & (1 << 14));
>> =20
>>  	/* BAR 0 is the framebuffer, BAR 1 contains registers */
>> -	mdev->rmmio_base =3D pci_resource_start(mdev->dev->pdev, 1);
>> -	mdev->rmmio_size =3D pci_resource_len(mdev->dev->pdev, 1);
>> +	mdev->rmmio_base =3D pci_resource_start(dev->pdev, 1);
>> +	mdev->rmmio_size =3D pci_resource_len(dev->pdev, 1);
>> =20
>> -	if (!devm_request_mem_region(mdev->dev->dev, mdev->rmmio_base, mdev-=
>rmmio_size,
>> -				"mgadrmfb_mmio")) {
>> +	if (!devm_request_mem_region(dev->dev, mdev->rmmio_base,
>> +				     mdev->rmmio_size, "mgadrmfb_mmio")) {
>>  		drm_err(dev, "can't reserve mmio registers\n");
>>  		return -ENOMEM;
>>  	}
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/=
mgag200/mgag200_mode.c
>> index fa91869c0db52..aaa73b29b04f0 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> @@ -1433,6 +1433,7 @@ static const struct drm_crtc_helper_funcs mga_he=
lper_funcs =3D {
>>  /* CRTC setup */
>>  static void mga_crtc_init(struct mga_device *mdev)
>>  {
>> +	struct drm_device *dev =3D mdev->dev;
>>  	struct mga_crtc *mga_crtc;
>> =20
>>  	mga_crtc =3D kzalloc(sizeof(struct mga_crtc) +
>> @@ -1442,7 +1443,7 @@ static void mga_crtc_init(struct mga_device *mde=
v)
>>  	if (mga_crtc =3D=3D NULL)
>>  		return;
>> =20
>> -	drm_crtc_init(mdev->dev, &mga_crtc->base, &mga_crtc_funcs);
>> +	drm_crtc_init(dev, &mga_crtc->base, &mga_crtc_funcs);
>> =20
>>  	drm_mode_crtc_set_gamma_size(&mga_crtc->base, MGAG200_LUT_SIZE);
>>  	mdev->mode_info.crtc =3D mga_crtc;
>> @@ -1617,30 +1618,30 @@ static struct drm_connector *mga_vga_init(stru=
ct drm_device *dev)
>> =20
>>  int mgag200_modeset_init(struct mga_device *mdev)
>>  {
>> +	struct drm_device *dev =3D mdev->dev;
>>  	struct drm_encoder *encoder =3D &mdev->encoder;
>>  	struct drm_connector *connector;
>>  	int ret;
>> =20
>>  	mdev->mode_info.mode_config_initialized =3D true;
>> =20
>> -	mdev->dev->mode_config.max_width =3D MGAG200_MAX_FB_WIDTH;
>> -	mdev->dev->mode_config.max_height =3D MGAG200_MAX_FB_HEIGHT;
>> +	dev->mode_config.max_width =3D MGAG200_MAX_FB_WIDTH;
>> +	dev->mode_config.max_height =3D MGAG200_MAX_FB_HEIGHT;
>> =20
>> -	mdev->dev->mode_config.fb_base =3D mdev->mc.vram_base;
>> +	dev->mode_config.fb_base =3D mdev->mc.vram_base;
>> =20
>>  	mga_crtc_init(mdev);
>> =20
>> -	ret =3D drm_simple_encoder_init(mdev->dev, encoder,
>> -				      DRM_MODE_ENCODER_DAC);
>> +	ret =3D drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DAC);=

>>  	if (ret) {
>> -		drm_err(mdev->dev,
>> +		drm_err(dev,
>>  			"drm_simple_encoder_init() failed, error %d\n",
>>  			ret);
>>  		return ret;
>>  	}
>>  	encoder->possible_crtcs =3D 0x1;
>> =20
>> -	connector =3D mga_vga_init(mdev->dev);
>> +	connector =3D mga_vga_init(dev);
>>  	if (!connector) {
>>  		DRM_ERROR("mga_vga_init failed\n");
>>  		return -1;
>> --=20
>> 2.26.0
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--iwozDBVgvRXftpvcdHg1V9sZCxMNO7bxw--

--G9NWfUmI4ihVkRrkQD1jiYomsuH8hY1HT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6ya84ACgkQaA3BHVML
eiNOxAf/fnb/Cw1VBJzI+S4LUuHW85v+w52ojvbirRfLCO3yaVf9T/g3pukPLNej
eXj6W1GhHMQ+eSCdlQpfIBm3JK359wy0kGiDBiSp6eAYR/M+98P0LgTQ5BtuDduU
f0d5NTlPCPKe2WA3ZdHX3rEsqWnCkVr+uc673/HcSbqxOsTW/K1McNfIgBsgfOMl
WrR5Jsl4D2W1122KetU2i0iYxkFtbb/gri5cHRCBDsq4M8Ki0mU0NM5CZcc6djMM
3rJ8hcj8rHmVywj6NgTNgkOanEvySH9pRloxfo8FSnLDUoZQ07fcIiLfkTzzzQup
lJlNbXiGF5PK3dGRhQhhDnJ6yOXZKg==
=Hln6
-----END PGP SIGNATURE-----

--G9NWfUmI4ihVkRrkQD1jiYomsuH8hY1HT--

--===============0614684738==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0614684738==--
