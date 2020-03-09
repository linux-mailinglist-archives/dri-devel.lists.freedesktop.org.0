Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C67A617D9E4
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 08:32:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80876E14F;
	Mon,  9 Mar 2020 07:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4F56E14F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 07:32:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 088CAB1A2;
 Mon,  9 Mar 2020 07:32:12 +0000 (UTC)
Subject: Re: [PATCH 05/22] drm/gma500: Use simple encoder
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200305155950.2705-1-tzimmermann@suse.de>
 <20200305155950.2705-6-tzimmermann@suse.de>
 <20200306213519.GD17369@ravnborg.org>
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
Message-ID: <4ce9be7e-7b1d-c679-6dba-3f17dc2a7ebc@suse.de>
Date: Mon, 9 Mar 2020 08:32:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200306213519.GD17369@ravnborg.org>
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
Cc: hamohammed.sa@gmail.com, alexandre.belloni@bootlin.com, airlied@linux.ie,
 linux@armlinux.org.uk, paul@crapouillou.net, thierry.reding@gmail.com,
 krzk@kernel.org, sebastian.reichel@collabora.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, hjc@rock-chips.com,
 tomi.valkeinen@ti.com, abrodkin@synopsys.com, kong.kongxinwei@hisilicon.com,
 jonathanh@nvidia.com, xinliang.liu@linaro.org, ludovic.desroches@microchip.com,
 kgene@kernel.org, linux-imx@nxp.com, linux-rockchip@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 puck.chen@hisilicon.com, s.hauer@pengutronix.de, alison.wang@nxp.com,
 jsarha@ti.com, matthias.bgg@gmail.com, wens@csie.org, kernel@pengutronix.de,
 jernej.skrabec@siol.net, kraxel@redhat.com, rodrigosiqueiramelo@gmail.com,
 bbrezillon@kernel.org, jingoohan1@gmail.com, dri-devel@lists.freedesktop.org,
 sw0312.kim@samsung.com, nicolas.ferre@microchip.com, kyungmin.park@samsung.com,
 kieran.bingham+renesas@ideasonboard.com, zourongrong@gmail.com,
 linux-mediatek@lists.infradead.org, shawnguo@kernel.org,
 laurent.pinchart@ideasonboard.com
Content-Type: multipart/mixed; boundary="===============1245395619=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1245395619==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="2CKpQBBJjLNlZfBAUkhK2Hrn2Oz1pgit2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2CKpQBBJjLNlZfBAUkhK2Hrn2Oz1pgit2
Content-Type: multipart/mixed; boundary="KG81PaEcZ9d020t5NFe2dKhwBZ7oRjdf5";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: airlied@linux.ie, daniel@ffwll.ch, abrodkin@synopsys.com,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, jingoohan1@gmail.com,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
 stefan@agner.ch, alison.wang@nxp.com, patrik.r.jakobsson@gmail.com,
 xinliang.liu@linaro.org, zourongrong@gmail.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 linux@armlinux.org.uk, p.zabel@pengutronix.de, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, paul@crapouillou.net, ck.hu@mediatek.com,
 matthias.bgg@gmail.com, laurent.pinchart@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, hjc@rock-chips.com,
 heiko@sntech.de, wens@csie.org, jernej.skrabec@siol.net,
 thierry.reding@gmail.com, jonathanh@nvidia.com, jsarha@ti.com,
 tomi.valkeinen@ti.com, eric@anholt.net, kraxel@redhat.com,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 sebastian.reichel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Message-ID: <4ce9be7e-7b1d-c679-6dba-3f17dc2a7ebc@suse.de>
Subject: Re: [PATCH 05/22] drm/gma500: Use simple encoder
References: <20200305155950.2705-1-tzimmermann@suse.de>
 <20200305155950.2705-6-tzimmermann@suse.de>
 <20200306213519.GD17369@ravnborg.org>
In-Reply-To: <20200306213519.GD17369@ravnborg.org>

--KG81PaEcZ9d020t5NFe2dKhwBZ7oRjdf5
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Sam

Am 06.03.20 um 22:35 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> On Thu, Mar 05, 2020 at 04:59:33PM +0100, Thomas Zimmermann wrote:
>> The gma500 driver uses empty implementations for some of its encoders.=

>> Replace the code with the generic simple encoder.
> This parts looks good.
>=20
>=20
>> As a side effect, the
>> patch also removes an indirection in the encoder setup for Medfield.
>=20
> I failed to see where this was done. Maybe too late for me to review
> patches, so I will stop now.

The indirection is in setting the encoder functions. Defined in
drivers/gpu/drm/gma500/mdfld_output.h, struct panel_funcs.encoder_funcs
is filled by various Medfield backends with encoder callbacks. But it's
always the same and the encoder_funcs field can be removed. A call to
drm_simple_encoder_init() works for all Medfield code.

Best regards
Thomas

>=20
>=20
> No matter - patch is:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>=20
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/gma500/cdv_intel_crt.c     | 14 +++-----------
>>  drivers/gpu/drm/gma500/cdv_intel_dp.c      | 16 +++-------------
>>  drivers/gpu/drm/gma500/cdv_intel_hdmi.c    |  4 ++--
>>  drivers/gpu/drm/gma500/cdv_intel_lvds.c    | 17 +++--------------
>>  drivers/gpu/drm/gma500/mdfld_dsi_dpi.c     |  7 +++----
>>  drivers/gpu/drm/gma500/mdfld_output.h      |  1 -
>>  drivers/gpu/drm/gma500/mdfld_tmd_vid.c     |  6 ------
>>  drivers/gpu/drm/gma500/mdfld_tpo_vid.c     |  6 ------
>>  drivers/gpu/drm/gma500/oaktrail_hdmi.c     | 14 ++------------
>>  drivers/gpu/drm/gma500/oaktrail_lvds.c     |  5 +++--
>>  drivers/gpu/drm/gma500/psb_intel_drv.h     |  1 -
>>  drivers/gpu/drm/gma500/psb_intel_lvds.c    | 18 +++---------------
>>  drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c |  5 -----
>>  13 files changed, 22 insertions(+), 92 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/gma500/cdv_intel_crt.c b/drivers/gpu/drm/=
gma500/cdv_intel_crt.c
>> index 29c36d63b20e..88535f5aacc5 100644
>> --- a/drivers/gpu/drm/gma500/cdv_intel_crt.c
>> +++ b/drivers/gpu/drm/gma500/cdv_intel_crt.c
>> @@ -28,6 +28,8 @@
>>  #include <linux/i2c.h>
>>  #include <linux/pm_runtime.h>
>> =20
>> +#include <drm/drm_simple_kms_helper.h>
>> +
>>  #include "cdv_device.h"
>>  #include "intel_bios.h"
>>  #include "power.h"
>> @@ -237,15 +239,6 @@ static const struct drm_connector_helper_funcs
>>  	.best_encoder =3D gma_best_encoder,
>>  };
>> =20
>> -static void cdv_intel_crt_enc_destroy(struct drm_encoder *encoder)
>> -{
>> -	drm_encoder_cleanup(encoder);
>> -}
>> -
>> -static const struct drm_encoder_funcs cdv_intel_crt_enc_funcs =3D {
>> -	.destroy =3D cdv_intel_crt_enc_destroy,
>> -};
>> -
>>  void cdv_intel_crt_init(struct drm_device *dev,
>>  			struct psb_intel_mode_device *mode_dev)
>>  {
>> @@ -271,8 +264,7 @@ void cdv_intel_crt_init(struct drm_device *dev,
>>  		&cdv_intel_crt_connector_funcs, DRM_MODE_CONNECTOR_VGA);
>> =20
>>  	encoder =3D &gma_encoder->base;
>> -	drm_encoder_init(dev, encoder,
>> -		&cdv_intel_crt_enc_funcs, DRM_MODE_ENCODER_DAC, NULL);
>> +	drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DAC);
>> =20
>>  	gma_connector_attach_encoder(gma_connector, gma_encoder);
>> =20
>> diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/g=
ma500/cdv_intel_dp.c
>> index 5772b2dce0d6..13947ec06dbb 100644
>> --- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
>> +++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
>> @@ -32,6 +32,7 @@
>>  #include <drm/drm_crtc.h>
>>  #include <drm/drm_crtc_helper.h>
>>  #include <drm/drm_dp_helper.h>
>> +#include <drm/drm_simple_kms_helper.h>
>> =20
>>  #include "gma_display.h"
>>  #include "psb_drv.h"
>> @@ -1908,11 +1909,6 @@ cdv_intel_dp_destroy(struct drm_connector *conn=
ector)
>>  	kfree(connector);
>>  }
>> =20
>> -static void cdv_intel_dp_encoder_destroy(struct drm_encoder *encoder)=

>> -{
>> -	drm_encoder_cleanup(encoder);
>> -}
>> -
>>  static const struct drm_encoder_helper_funcs cdv_intel_dp_helper_func=
s =3D {
>>  	.dpms =3D cdv_intel_dp_dpms,
>>  	.mode_fixup =3D cdv_intel_dp_mode_fixup,
>> @@ -1935,11 +1931,6 @@ static const struct drm_connector_helper_funcs =
cdv_intel_dp_connector_helper_fun
>>  	.best_encoder =3D gma_best_encoder,
>>  };
>> =20
>> -static const struct drm_encoder_funcs cdv_intel_dp_enc_funcs =3D {
>> -	.destroy =3D cdv_intel_dp_encoder_destroy,
>> -};
>> -
>> -
>>  static void cdv_intel_dp_add_properties(struct drm_connector *connect=
or)
>>  {
>>  	cdv_intel_attach_force_audio_property(connector);
>> @@ -2016,8 +2007,7 @@ cdv_intel_dp_init(struct drm_device *dev, struct=
 psb_intel_mode_device *mode_dev
>>  	encoder =3D &gma_encoder->base;
>> =20
>>  	drm_connector_init(dev, connector, &cdv_intel_dp_connector_funcs, ty=
pe);
>> -	drm_encoder_init(dev, encoder, &cdv_intel_dp_enc_funcs,
>> -			 DRM_MODE_ENCODER_TMDS, NULL);
>> +	drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_TMDS);
>> =20
>>  	gma_connector_attach_encoder(gma_connector, gma_encoder);
>> =20
>> @@ -2120,7 +2110,7 @@ cdv_intel_dp_init(struct drm_device *dev, struct=
 psb_intel_mode_device *mode_dev
>>  		if (ret =3D=3D 0) {
>>  			/* if this fails, presume the device is a ghost */
>>  			DRM_INFO("failed to retrieve link info, disabling eDP\n");
>> -			cdv_intel_dp_encoder_destroy(encoder);
>> +			drm_encoder_cleanup(encoder);
>>  			cdv_intel_dp_destroy(connector);
>>  			goto err_priv;
>>  		} else {
>> diff --git a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c b/drivers/gpu/drm=
/gma500/cdv_intel_hdmi.c
>> index 1711a41acc16..0d12c6ffbc40 100644
>> --- a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
>> +++ b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
>> @@ -32,6 +32,7 @@
>>  #include <drm/drm.h>
>>  #include <drm/drm_crtc.h>
>>  #include <drm/drm_edid.h>
>> +#include <drm/drm_simple_kms_helper.h>
>> =20
>>  #include "cdv_device.h"
>>  #include "psb_drv.h"
>> @@ -311,8 +312,7 @@ void cdv_hdmi_init(struct drm_device *dev,
>>  			   &cdv_hdmi_connector_funcs,
>>  			   DRM_MODE_CONNECTOR_DVID);
>> =20
>> -	drm_encoder_init(dev, encoder, &psb_intel_lvds_enc_funcs,
>> -			 DRM_MODE_ENCODER_TMDS, NULL);
>> +	drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_TMDS);
>> =20
>>  	gma_connector_attach_encoder(gma_connector, gma_encoder);
>>  	gma_encoder->type =3D INTEL_OUTPUT_HDMI;
>> diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm=
/gma500/cdv_intel_lvds.c
>> index ea0a5d9a0acc..18de10e9ff9a 100644
>> --- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
>> +++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
>> @@ -12,6 +12,8 @@
>>  #include <linux/i2c.h>
>>  #include <linux/pm_runtime.h>
>> =20
>> +#include <drm/drm_simple_kms_helper.h>
>> +
>>  #include "cdv_device.h"
>>  #include "intel_bios.h"
>>  #include "power.h"
>> @@ -499,16 +501,6 @@ static const struct drm_connector_funcs cdv_intel=
_lvds_connector_funcs =3D {
>>  	.destroy =3D cdv_intel_lvds_destroy,
>>  };
>> =20
>> -
>> -static void cdv_intel_lvds_enc_destroy(struct drm_encoder *encoder)
>> -{
>> -	drm_encoder_cleanup(encoder);
>> -}
>> -
>> -static const struct drm_encoder_funcs cdv_intel_lvds_enc_funcs =3D {
>> -	.destroy =3D cdv_intel_lvds_enc_destroy,
>> -};
>> -
>>  /*
>>   * Enumerate the child dev array parsed from VBT to check whether
>>   * the LVDS is present.
>> @@ -616,10 +608,7 @@ void cdv_intel_lvds_init(struct drm_device *dev,
>>  			   &cdv_intel_lvds_connector_funcs,
>>  			   DRM_MODE_CONNECTOR_LVDS);
>> =20
>> -	drm_encoder_init(dev, encoder,
>> -			 &cdv_intel_lvds_enc_funcs,
>> -			 DRM_MODE_ENCODER_LVDS, NULL);
>> -
>> +	drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_LVDS);
>> =20
>>  	gma_connector_attach_encoder(gma_connector, gma_encoder);
>>  	gma_encoder->type =3D INTEL_OUTPUT_LVDS;
>> diff --git a/drivers/gpu/drm/gma500/mdfld_dsi_dpi.c b/drivers/gpu/drm/=
gma500/mdfld_dsi_dpi.c
>> index d4c65f268922..aa5aa293ddb6 100644
>> --- a/drivers/gpu/drm/gma500/mdfld_dsi_dpi.c
>> +++ b/drivers/gpu/drm/gma500/mdfld_dsi_dpi.c
>> @@ -27,6 +27,8 @@
>> =20
>>  #include <linux/delay.h>
>> =20
>> +#include <drm/drm_simple_kms_helper.h>
>> +
>>  #include "mdfld_dsi_dpi.h"
>>  #include "mdfld_dsi_pkg_sender.h"
>>  #include "mdfld_output.h"
>> @@ -993,10 +995,7 @@ struct mdfld_dsi_encoder *mdfld_dsi_dpi_init(stru=
ct drm_device *dev,
>>  	/*create drm encoder object*/
>>  	connector =3D &dsi_connector->base.base;
>>  	encoder =3D &dpi_output->base.base.base;
>> -	drm_encoder_init(dev,
>> -			encoder,
>> -			p_funcs->encoder_funcs,
>> -			DRM_MODE_ENCODER_LVDS, NULL);
>> +	drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_LVDS);
>>  	drm_encoder_helper_add(encoder,
>>  				p_funcs->encoder_helper_funcs);
>> =20
>> diff --git a/drivers/gpu/drm/gma500/mdfld_output.h b/drivers/gpu/drm/g=
ma500/mdfld_output.h
>> index ab2b27c0f037..17a944d70add 100644
>> --- a/drivers/gpu/drm/gma500/mdfld_output.h
>> +++ b/drivers/gpu/drm/gma500/mdfld_output.h
>> @@ -51,7 +51,6 @@ struct panel_info {
>>  };
>> =20
>>  struct panel_funcs {
>> -	const struct drm_encoder_funcs *encoder_funcs;
>>  	const struct drm_encoder_helper_funcs *encoder_helper_funcs;
>>  	struct drm_display_mode * (*get_config_mode)(struct drm_device *);
>>  	int (*get_panel_info)(struct drm_device *, int, struct panel_info *)=
;
>> diff --git a/drivers/gpu/drm/gma500/mdfld_tmd_vid.c b/drivers/gpu/drm/=
gma500/mdfld_tmd_vid.c
>> index 49c92debb7b2..25e897b98f86 100644
>> --- a/drivers/gpu/drm/gma500/mdfld_tmd_vid.c
>> +++ b/drivers/gpu/drm/gma500/mdfld_tmd_vid.c
>> @@ -188,13 +188,7 @@ static const struct drm_encoder_helper_funcs
>>  	.commit =3D mdfld_dsi_dpi_commit,
>>  };
>> =20
>> -/*TPO DPI encoder funcs*/
>> -static const struct drm_encoder_funcs mdfld_tpo_dpi_encoder_funcs =3D=
 {
>> -	.destroy =3D drm_encoder_cleanup,
>> -};
>> -
>>  const struct panel_funcs mdfld_tmd_vid_funcs =3D {
>> -	.encoder_funcs =3D &mdfld_tpo_dpi_encoder_funcs,
>>  	.encoder_helper_funcs =3D &mdfld_tpo_dpi_encoder_helper_funcs,
>>  	.get_config_mode =3D &tmd_vid_get_config_mode,
>>  	.get_panel_info =3D tmd_vid_get_panel_info,
>> diff --git a/drivers/gpu/drm/gma500/mdfld_tpo_vid.c b/drivers/gpu/drm/=
gma500/mdfld_tpo_vid.c
>> index a9420bf9a419..11845978fb0a 100644
>> --- a/drivers/gpu/drm/gma500/mdfld_tpo_vid.c
>> +++ b/drivers/gpu/drm/gma500/mdfld_tpo_vid.c
>> @@ -76,13 +76,7 @@ static const struct drm_encoder_helper_funcs
>>  	.commit =3D mdfld_dsi_dpi_commit,
>>  };
>> =20
>> -/*TPO DPI encoder funcs*/
>> -static const struct drm_encoder_funcs mdfld_tpo_dpi_encoder_funcs =3D=
 {
>> -	.destroy =3D drm_encoder_cleanup,
>> -};
>> -
>>  const struct panel_funcs mdfld_tpo_vid_funcs =3D {
>> -	.encoder_funcs =3D &mdfld_tpo_dpi_encoder_funcs,
>>  	.encoder_helper_funcs =3D &mdfld_tpo_dpi_encoder_helper_funcs,
>>  	.get_config_mode =3D &tpo_vid_get_config_mode,
>>  	.get_panel_info =3D tpo_vid_get_panel_info,
>> diff --git a/drivers/gpu/drm/gma500/oaktrail_hdmi.c b/drivers/gpu/drm/=
gma500/oaktrail_hdmi.c
>> index f4370232767d..b25086f252ae 100644
>> --- a/drivers/gpu/drm/gma500/oaktrail_hdmi.c
>> +++ b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
>> @@ -27,6 +27,7 @@
>>  #include <linux/delay.h>
>> =20
>>  #include <drm/drm.h>
>> +#include <drm/drm_simple_kms_helper.h>
>> =20
>>  #include "psb_drv.h"
>>  #include "psb_intel_drv.h"
>> @@ -620,15 +621,6 @@ static const struct drm_connector_funcs oaktrail_=
hdmi_connector_funcs =3D {
>>  	.destroy =3D oaktrail_hdmi_destroy,
>>  };
>> =20
>> -static void oaktrail_hdmi_enc_destroy(struct drm_encoder *encoder)
>> -{
>> -	drm_encoder_cleanup(encoder);
>> -}
>> -
>> -static const struct drm_encoder_funcs oaktrail_hdmi_enc_funcs =3D {
>> -	.destroy =3D oaktrail_hdmi_enc_destroy,
>> -};
>> -
>>  void oaktrail_hdmi_init(struct drm_device *dev,
>>  					struct psb_intel_mode_device *mode_dev)
>>  {
>> @@ -651,9 +643,7 @@ void oaktrail_hdmi_init(struct drm_device *dev,
>>  			   &oaktrail_hdmi_connector_funcs,
>>  			   DRM_MODE_CONNECTOR_DVID);
>> =20
>> -	drm_encoder_init(dev, encoder,
>> -			 &oaktrail_hdmi_enc_funcs,
>> -			 DRM_MODE_ENCODER_TMDS, NULL);
>> +	drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_TMDS);
>> =20
>>  	gma_connector_attach_encoder(gma_connector, gma_encoder);
>> =20
>> diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/=
gma500/oaktrail_lvds.c
>> index 582e09597500..2828360153d1 100644
>> --- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
>> +++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
>> @@ -13,6 +13,8 @@
>> =20
>>  #include <asm/intel-mid.h>
>> =20
>> +#include <drm/drm_simple_kms_helper.h>
>> +
>>  #include "intel_bios.h"
>>  #include "power.h"
>>  #include "psb_drv.h"
>> @@ -311,8 +313,7 @@ void oaktrail_lvds_init(struct drm_device *dev,
>>  			   &psb_intel_lvds_connector_funcs,
>>  			   DRM_MODE_CONNECTOR_LVDS);
>> =20
>> -	drm_encoder_init(dev, encoder, &psb_intel_lvds_enc_funcs,
>> -			 DRM_MODE_ENCODER_LVDS, NULL);
>> +	drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_LVDS);
>> =20
>>  	gma_connector_attach_encoder(gma_connector, gma_encoder);
>>  	gma_encoder->type =3D INTEL_OUTPUT_LVDS;
>> diff --git a/drivers/gpu/drm/gma500/psb_intel_drv.h b/drivers/gpu/drm/=
gma500/psb_intel_drv.h
>> index 16c6136f778b..fb601983cef0 100644
>> --- a/drivers/gpu/drm/gma500/psb_intel_drv.h
>> +++ b/drivers/gpu/drm/gma500/psb_intel_drv.h
>> @@ -252,7 +252,6 @@ extern int psb_intel_lvds_set_property(struct drm_=
connector *connector,
>>  					struct drm_property *property,
>>  					uint64_t value);
>>  extern void psb_intel_lvds_destroy(struct drm_connector *connector);
>> -extern const struct drm_encoder_funcs psb_intel_lvds_enc_funcs;
>> =20
>>  /* intel_gmbus.c */
>>  extern void gma_intel_i2c_reset(struct drm_device *dev);
>> diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm=
/gma500/psb_intel_lvds.c
>> index afaebab7bc17..063c66bb946d 100644
>> --- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
>> +++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
>> @@ -11,6 +11,8 @@
>>  #include <linux/i2c.h>
>>  #include <linux/pm_runtime.h>
>> =20
>> +#include <drm/drm_simple_kms_helper.h>
>> +
>>  #include "intel_bios.h"
>>  #include "power.h"
>>  #include "psb_drv.h"
>> @@ -621,18 +623,6 @@ const struct drm_connector_funcs psb_intel_lvds_c=
onnector_funcs =3D {
>>  	.destroy =3D psb_intel_lvds_destroy,
>>  };
>> =20
>> -
>> -static void psb_intel_lvds_enc_destroy(struct drm_encoder *encoder)
>> -{
>> -	drm_encoder_cleanup(encoder);
>> -}
>> -
>> -const struct drm_encoder_funcs psb_intel_lvds_enc_funcs =3D {
>> -	.destroy =3D psb_intel_lvds_enc_destroy,
>> -};
>> -
>> -
>> -
>>  /**
>>   * psb_intel_lvds_init - setup LVDS connectors on this device
>>   * @dev: drm device
>> @@ -683,9 +673,7 @@ void psb_intel_lvds_init(struct drm_device *dev,
>>  			   &psb_intel_lvds_connector_funcs,
>>  			   DRM_MODE_CONNECTOR_LVDS);
>> =20
>> -	drm_encoder_init(dev, encoder,
>> -			 &psb_intel_lvds_enc_funcs,
>> -			 DRM_MODE_ENCODER_LVDS, NULL);
>> +	drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_LVDS);
>> =20
>>  	gma_connector_attach_encoder(gma_connector, gma_encoder);
>>  	gma_encoder->type =3D INTEL_OUTPUT_LVDS;
>> diff --git a/drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c b/drivers/gpu/=
drm/gma500/tc35876x-dsi-lvds.c
>> index 9e8224456ea2..f7e121f4c609 100644
>> --- a/drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c
>> +++ b/drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c
>> @@ -765,12 +765,7 @@ static const struct drm_encoder_helper_funcs tc35=
876x_encoder_helper_funcs =3D {
>>  	.commit =3D mdfld_dsi_dpi_commit,
>>  };
>> =20
>> -static const struct drm_encoder_funcs tc35876x_encoder_funcs =3D {
>> -	.destroy =3D drm_encoder_cleanup,
>> -};
>> -
>>  const struct panel_funcs mdfld_tc35876x_funcs =3D {
>> -	.encoder_funcs =3D &tc35876x_encoder_funcs,
>>  	.encoder_helper_funcs =3D &tc35876x_encoder_helper_funcs,
>>  	.get_config_mode =3D tc35876x_get_config_mode,
>>  	.get_panel_info =3D tc35876x_get_panel_info,
>> --=20
>> 2.25.1

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--KG81PaEcZ9d020t5NFe2dKhwBZ7oRjdf5--

--2CKpQBBJjLNlZfBAUkhK2Hrn2Oz1pgit2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5l8PQACgkQaA3BHVML
eiOgawgAn1Xz2m1ILaenfMDwzy4wCNFKGBwUM1NrJ+DUqX1a6OkQ0Bt7fxBXlsgw
5OVrHHbgW1gVsVlMVDiU78RGcBHNLoMZgIqW3g7RjQvIDBL0cFmjnws92anzxXQB
cHi9dBffLf0e2U3/SD5qkXdpCD913sa6eyMYFhIdy5i4KE93U6JlWcxHAjTAmwuT
TZ8iE60frDVwlfDG4bIsPnNEszeNFW8sCtNFzocu4xO7oOhbFxpHWtZhep5C8ZLt
YgsNIhDpSrPJusLYoXJBJjk2mGYTh7uxoJGrpB45dgJrOSfKiHLGEpF4E/mwXCnb
Qdc8F27JWd1LMCnREq4Gu71qHiuMmQ==
=3fID
-----END PGP SIGNATURE-----

--2CKpQBBJjLNlZfBAUkhK2Hrn2Oz1pgit2--

--===============1245395619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1245395619==--
