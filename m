Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B57A51F73E3
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 08:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC976E24D;
	Fri, 12 Jun 2020 06:28:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3940D6E24D
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 06:28:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 292ADAC2C;
 Fri, 12 Jun 2020 06:28:49 +0000 (UTC)
Subject: Re: [PATCH 3/3] drm/ast: Use per-device logging macros
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200611082809.7838-1-tzimmermann@suse.de>
 <20200611082809.7838-4-tzimmermann@suse.de>
 <20200611192406.GB160102@ravnborg.org>
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
Message-ID: <59164816-57b4-0279-56e9-a49a333ce839@suse.de>
Date: Fri, 12 Jun 2020 08:28:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200611192406.GB160102@ravnborg.org>
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
Cc: airlied@redhat.com, chen@aspeedtech.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, emil.velikov@collabora.com
Content-Type: multipart/mixed; boundary="===============1255623179=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1255623179==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="udLCXKNKywV2e3LMJ1Ce0I9tiAUDJJiIz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--udLCXKNKywV2e3LMJ1Ce0I9tiAUDJJiIz
Content-Type: multipart/mixed; boundary="qhHucNrw1Ic6Rrw41Lpo9IpcW46DhwUXb";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: chen@aspeedtech.com, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 airlied@redhat.com, emil.velikov@collabora.com
Message-ID: <59164816-57b4-0279-56e9-a49a333ce839@suse.de>
Subject: Re: [PATCH 3/3] drm/ast: Use per-device logging macros
References: <20200611082809.7838-1-tzimmermann@suse.de>
 <20200611082809.7838-4-tzimmermann@suse.de>
 <20200611192406.GB160102@ravnborg.org>
In-Reply-To: <20200611192406.GB160102@ravnborg.org>

--qhHucNrw1Ic6Rrw41Lpo9IpcW46DhwUXb
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Sam

Am 11.06.20 um 21:24 schrieb Sam Ravnborg:
> Hi Thomas.
> On Thu, Jun 11, 2020 at 10:28:09AM +0200, Thomas Zimmermann wrote:
>> Converts the ast driver to drm_info() and drm_err(). No functional
>> changes are made.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>=20
> I hope you will later follow-up with a patch that introduces drm_WARN_*=
=2E

I only found DRM_INFO and DRM_ERROR calls. Did I miss any other warning
macros?

Best regards
Thomas

>=20
> 	Sam
>=20
>> ---
>>  drivers/gpu/drm/ast/ast_main.c | 34 +++++++++++++++++----------------=
-
>>  drivers/gpu/drm/ast/ast_mode.c |  8 ++++----
>>  drivers/gpu/drm/ast/ast_post.c |  2 +-
>>  drivers/gpu/drm/ast/ast_ttm.c  |  2 +-
>>  4 files changed, 23 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_=
main.c
>> index a2ef3d9077671..9063fdc9e8852 100644
>> --- a/drivers/gpu/drm/ast/ast_main.c
>> +++ b/drivers/gpu/drm/ast/ast_main.c
>> @@ -79,7 +79,7 @@ static void ast_detect_config_mode(struct drm_device=
 *dev, u32 *scu_rev)
>>  					scu_rev)) {
>>  		/* We do, disable P2A access */
>>  		ast->config_mode =3D ast_use_dt;
>> -		DRM_INFO("Using device-tree for configuration\n");
>> +		drm_info(dev, "Using device-tree for configuration\n");
>>  		return;
>>  	}
>> =20
>> @@ -101,7 +101,7 @@ static void ast_detect_config_mode(struct drm_devi=
ce *dev, u32 *scu_rev)
>>  			/* P2A works, grab silicon revision */
>>  			ast->config_mode =3D ast_use_p2a;
>> =20
>> -			DRM_INFO("Using P2A bridge for configuration\n");
>> +			drm_info(dev, "Using P2A bridge for configuration\n");
>> =20
>>  			/* Read SCU7c (silicon revision register) */
>>  			ast_write32(ast, 0xf004, 0x1e6e0000);
>> @@ -112,7 +112,7 @@ static void ast_detect_config_mode(struct drm_devi=
ce *dev, u32 *scu_rev)
>>  	}
>> =20
>>  	/* We have a P2A bridge but it's disabled */
>> -	DRM_INFO("P2A bridge disabled, using default configuration\n");
>> +	drm_info(dev, "P2A bridge disabled, using default configuration\n");=

>>  }
>> =20
>>  static int ast_detect_chip(struct drm_device *dev, bool *need_post)
>> @@ -128,7 +128,7 @@ static int ast_detect_chip(struct drm_device *dev,=
 bool *need_post)
>>  	 */
>>  	if (!ast_is_vga_enabled(dev)) {
>>  		ast_enable_vga(dev);
>> -		DRM_INFO("VGA not enabled on entry, requesting chip POST\n");
>> +		drm_info(dev, "VGA not enabled on entry, requesting chip POST\n");
>>  		*need_post =3D true;
>>  	} else
>>  		*need_post =3D false;
>> @@ -144,36 +144,36 @@ static int ast_detect_chip(struct drm_device *de=
v, bool *need_post)
>>  	/* Identify chipset */
>>  	if (dev->pdev->revision >=3D 0x40) {
>>  		ast->chip =3D AST2500;
>> -		DRM_INFO("AST 2500 detected\n");
>> +		drm_info(dev, "AST 2500 detected\n");
>>  	} else if (dev->pdev->revision >=3D 0x30) {
>>  		ast->chip =3D AST2400;
>> -		DRM_INFO("AST 2400 detected\n");
>> +		drm_info(dev, "AST 2400 detected\n");
>>  	} else if (dev->pdev->revision >=3D 0x20) {
>>  		ast->chip =3D AST2300;
>> -		DRM_INFO("AST 2300 detected\n");
>> +		drm_info(dev, "AST 2300 detected\n");
>>  	} else if (dev->pdev->revision >=3D 0x10) {
>>  		switch (scu_rev & 0x0300) {
>>  		case 0x0200:
>>  			ast->chip =3D AST1100;
>> -			DRM_INFO("AST 1100 detected\n");
>> +			drm_info(dev, "AST 1100 detected\n");
>>  			break;
>>  		case 0x0100:
>>  			ast->chip =3D AST2200;
>> -			DRM_INFO("AST 2200 detected\n");
>> +			drm_info(dev, "AST 2200 detected\n");
>>  			break;
>>  		case 0x0000:
>>  			ast->chip =3D AST2150;
>> -			DRM_INFO("AST 2150 detected\n");
>> +			drm_info(dev, "AST 2150 detected\n");
>>  			break;
>>  		default:
>>  			ast->chip =3D AST2100;
>> -			DRM_INFO("AST 2100 detected\n");
>> +			drm_info(dev, "AST 2100 detected\n");
>>  			break;
>>  		}
>>  		ast->vga2_clone =3D false;
>>  	} else {
>>  		ast->chip =3D AST2000;
>> -		DRM_INFO("AST 2000 detected\n");
>> +		drm_info(dev, "AST 2000 detected\n");
>>  	}
>> =20
>>  	/* Check if we support wide screen */
>> @@ -248,13 +248,13 @@ static int ast_detect_chip(struct drm_device *de=
v, bool *need_post)
>>  	/* Print stuff for diagnostic purposes */
>>  	switch(ast->tx_chip_type) {
>>  	case AST_TX_SIL164:
>> -		DRM_INFO("Using Sil164 TMDS transmitter\n");
>> +		drm_info(dev, "Using Sil164 TMDS transmitter\n");
>>  		break;
>>  	case AST_TX_DP501:
>> -		DRM_INFO("Using DP501 DisplayPort transmitter\n");
>> +		drm_info(dev, "Using DP501 DisplayPort transmitter\n");
>>  		break;
>>  	default:
>> -		DRM_INFO("Analog VGA only\n");
>> +		drm_info(dev, "Analog VGA only\n");
>>  	}
>>  	return 0;
>>  }
>> @@ -443,7 +443,7 @@ int ast_driver_load(struct drm_device *dev, unsign=
ed long flags)
>>  	 * and higher).
>>  	 */
>>  	if (!(pci_resource_flags(dev->pdev, 2) & IORESOURCE_IO)) {
>> -		DRM_INFO("platform has no IO space, trying MMIO\n");
>> +		drm_info(dev, "platform has no IO space, trying MMIO\n");
>>  		ast->ioregs =3D ast->regs + AST_IO_MM_OFFSET;
>>  	}
>> =20
>> @@ -465,7 +465,7 @@ int ast_driver_load(struct drm_device *dev, unsign=
ed long flags)
>>  	if (ret)
>>  		goto out_free;
>>  	ast->vram_size =3D ast_get_vram_info(dev);
>> -	DRM_INFO("dram MCLK=3D%u Mhz type=3D%d bus_width=3D%d size=3D%08x\n"=
,
>> +	drm_info(dev, "dram MCLK=3D%u Mhz type=3D%d bus_width=3D%d size=3D%0=
8x\n",
>>  		 ast->mclk, ast->dram_type,
>>  		 ast->dram_bus_width, ast->vram_size);
>> =20
>> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_=
mode.c
>> index 10211751182da..ff789f2db9fc8 100644
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -1104,7 +1104,7 @@ static int ast_connector_init(struct drm_device =
*dev)
>>  	connector =3D &ast_connector->base;
>>  	ast_connector->i2c =3D ast_i2c_create(dev);
>>  	if (!ast_connector->i2c)
>> -		DRM_ERROR("failed to add ddc bus for connector\n");
>> +		drm_err(dev, "failed to add ddc bus for connector\n");
>> =20
>>  	drm_connector_init_with_ddc(dev, connector,
>>  				    &ast_connector_funcs,
>> @@ -1188,7 +1188,7 @@ int ast_mode_init(struct drm_device *dev)
>>  				       ARRAY_SIZE(ast_primary_plane_formats),
>>  				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
>>  	if (ret) {
>> -		DRM_ERROR("ast: drm_universal_plane_init() failed: %d\n", ret);
>> +		drm_err(dev, "ast: drm_universal_plane_init() failed: %d\n", ret);
>>  		return ret;
>>  	}
>>  	drm_plane_helper_add(&ast->primary_plane,
>> @@ -1200,7 +1200,7 @@ int ast_mode_init(struct drm_device *dev)
>>  				       ARRAY_SIZE(ast_cursor_plane_formats),
>>  				       NULL, DRM_PLANE_TYPE_CURSOR, NULL);
>>  	if (ret) {
>> -		DRM_ERROR("drm_universal_plane_failed(): %d\n", ret);
>> +		drm_err(dev, "drm_universal_plane_failed(): %d\n", ret);
>>  		return ret;
>>  	}
>>  	drm_plane_helper_add(&ast->cursor_plane,
>> @@ -1322,7 +1322,7 @@ static struct ast_i2c_chan *ast_i2c_create(struc=
t drm_device *dev)
>>  	i2c->bit.getscl =3D get_clock;
>>  	ret =3D i2c_bit_add_bus(&i2c->adapter);
>>  	if (ret) {
>> -		DRM_ERROR("Failed to register bit i2c\n");
>> +		drm_err(dev, "Failed to register bit i2c\n");
>>  		goto out_free;
>>  	}
>> =20
>> diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_=
post.c
>> index 226e1290227ad..c043fe7175530 100644
>> --- a/drivers/gpu/drm/ast/ast_post.c
>> +++ b/drivers/gpu/drm/ast/ast_post.c
>> @@ -2067,7 +2067,7 @@ void ast_post_chip_2500(struct drm_device *dev)
>>  		}
>> =20
>>  		if (!ast_dram_init_2500(ast))
>> -			DRM_ERROR("DRAM init failed !\n");
>> +			drm_err(dev, "DRAM init failed !\n");
>> =20
>>  		temp =3D ast_mindwm(ast, 0x1e6e2040);
>>  		ast_moutdwm(ast, 0x1e6e2040, temp | 0x40);
>> diff --git a/drivers/gpu/drm/ast/ast_ttm.c b/drivers/gpu/drm/ast/ast_t=
tm.c
>> index fad34106083a8..9c3788a4c1c54 100644
>> --- a/drivers/gpu/drm/ast/ast_ttm.c
>> +++ b/drivers/gpu/drm/ast/ast_ttm.c
>> @@ -44,7 +44,7 @@ int ast_mm_init(struct ast_private *ast)
>>  		ast->vram_size);
>>  	if (IS_ERR(vmm)) {
>>  		ret =3D PTR_ERR(vmm);
>> -		DRM_ERROR("Error initializing VRAM MM; %d\n", ret);
>> +		drm_err(dev, "Error initializing VRAM MM; %d\n", ret);
>>  		return ret;
>>  	}
>> =20
>> --=20
>> 2.26.2
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


--qhHucNrw1Ic6Rrw41Lpo9IpcW46DhwUXb--

--udLCXKNKywV2e3LMJ1Ce0I9tiAUDJJiIz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7jIJwACgkQaA3BHVML
eiNkGAgAwsV4pjmNbRVqw3ilw4fThaBKQ127nCqXQYvO4+JoHfOCOR6hvmQyOnrS
dzlySvZe4Hqd+jvitPr36kRioKnCBnwwUUymSOG2Vq0lMdsFrQRL2rMNNDJQ8sB1
vNFqucy8wTAiO+IuEaOEB4xbzjizB3XejLGsHBlp9JqCoGnLYCuIcXUQrsOtyngO
DMKJBO02DhpB1XN1f/3lxwtUlBYIUxlwPR+viiamm2oV2e+sevCDlTJfnPnypi2m
kB454eFLjtZf2s7/M+D2hU0xFqtzOpqCdUDEvxDOqytY5VaPLHIWHWQLW2P51X5Y
fz1v7tbiJZSE3wWHVnU+y/C9yi5h2g==
=IDRb
-----END PGP SIGNATURE-----

--udLCXKNKywV2e3LMJ1Ce0I9tiAUDJJiIz--

--===============1255623179==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1255623179==--
