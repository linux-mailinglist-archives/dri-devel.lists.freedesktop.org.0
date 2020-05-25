Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4151E0E0F
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 14:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCDC689BFD;
	Mon, 25 May 2020 12:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8398B89BFD
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 12:03:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 985C4AEAF;
 Mon, 25 May 2020 12:03:46 +0000 (UTC)
Subject: Re: [PATCH 01/21] drm/cma-helper: Rework DRM_GEM_CMA_VMAP_DRIVER_OPS
 macro
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-2-tzimmermann@suse.de>
 <20200522174835.GA1087580@ravnborg.org>
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
Message-ID: <b6f36f00-b68f-b111-5bcd-55c2658b1f27@suse.de>
Date: Mon, 25 May 2020 14:03:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200522174835.GA1087580@ravnborg.org>
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
Cc: alexandre.belloni@bootlin.com, linux-aspeed@lists.ozlabs.org,
 narmstrong@baylibre.com, airlied@linux.ie, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, nicolas.ferre@microchip.com,
 paul@crapouillou.net, laurent.pinchart@ideasonboard.com,
 mihail.atanassov@arm.com, marex@denx.de, khilman@baylibre.com,
 abrodkin@synopsys.com, kong.kongxinwei@hisilicon.com, xinliang.liu@linaro.org,
 ludovic.desroches@microchip.com, tomi.valkeinen@ti.com,
 james.qian.wang@arm.com, linux-imx@nxp.com, joel@jms.id.au,
 alexandre.torgue@st.com, puck.chen@hisilicon.com, s.hauer@pengutronix.de,
 alison.wang@nxp.com, jsarha@ti.com, wens@csie.org, vincent.abriou@st.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 bbrezillon@kernel.org, andrew@aj.id.au, philippe.cornu@st.com,
 yannick.fertre@st.com, kieran.bingham+renesas@ideasonboard.com,
 kernel@pengutronix.de, zourongrong@gmail.com, shawnguo@kernel.org
Content-Type: multipart/mixed; boundary="===============0356768381=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0356768381==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="y014uW9UbPDmqu8s94d3p41U8GRgJuOFE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--y014uW9UbPDmqu8s94d3p41U8GRgJuOFE
Content-Type: multipart/mixed; boundary="jZqnVpoS59Du5V7y6CaDLyno36mnruRCw";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: alexandre.belloni@bootlin.com, linux-aspeed@lists.ozlabs.org,
 narmstrong@baylibre.com, airlied@linux.ie, liviu.dudau@arm.com,
 philippe.cornu@st.com, paul@crapouillou.net,
 laurent.pinchart@ideasonboard.com, mihail.atanassov@arm.com,
 alexandre.torgue@st.com, marex@denx.de, khilman@baylibre.com,
 abrodkin@synopsys.com, ludovic.desroches@microchip.com,
 xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com,
 tomi.valkeinen@ti.com, james.qian.wang@arm.com, joel@jms.id.au,
 linux-imx@nxp.com, puck.chen@hisilicon.com, s.hauer@pengutronix.de,
 alison.wang@nxp.com, jsarha@ti.com, wens@csie.org, vincent.abriou@st.com,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, bbrezillon@kernel.org, andrew@aj.id.au,
 dri-devel@lists.freedesktop.org, nicolas.ferre@microchip.com,
 yannick.fertre@st.com, kieran.bingham+renesas@ideasonboard.com,
 zourongrong@gmail.com, shawnguo@kernel.org
Message-ID: <b6f36f00-b68f-b111-5bcd-55c2658b1f27@suse.de>
Subject: Re: [PATCH 01/21] drm/cma-helper: Rework DRM_GEM_CMA_VMAP_DRIVER_OPS
 macro
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-2-tzimmermann@suse.de>
 <20200522174835.GA1087580@ravnborg.org>
In-Reply-To: <20200522174835.GA1087580@ravnborg.org>

--jZqnVpoS59Du5V7y6CaDLyno36mnruRCw
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Sam

Am 22.05.20 um 19:48 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> On Fri, May 22, 2020 at 03:52:26PM +0200, Thomas Zimmermann wrote:
>> Rename the macro to DRM_GEM_CMA_DRIVER_OPS to align with SHMEM
>> helpers.
> This part is fine, I like that the naming is somehow consistent.
>=20
>> An internal version is provided for drivers that override
>> the default .dumb_create callback. Adapt drivers to the changes.
> I loathe anything named __foo or __FOO. This __ signals to me
> that the author was clueless in naming - or some sort.
> I know that __ is used in some lib headers - but thats not the case
> here.

I agree with your comment and I've been trying to find a better name
before posting the patchset. I considered something like
DRM_GEM_CMA_DRIVER_OPS_INTERNAL(), but wasn't happy with that either. In
the end, I uses the double underscore to push driver authors towards the
other macro. This one's only for the special case of settings a separate
implementation for .dumb_create().

>=20
> But I love that we have a variant that takes a create function.
> So we do not have to escape from the nice macro.
> The macro is another way to tell me as rewiewer that this
> drivers uses all the default helpers for this.
>=20
>=20
> So critizising the name I better suggest something that
> I personally like better:
>=20
> DRM_GEM_CMA_DRIVER_OPS_CREATE()

Can we at least use DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE ? Because
there's also gem_object_create.

I'll update the patches accordingly.

I noticed that most of the affected drivers do some kind of alignment
calculation in their dumb_create code. IMHO in the long run, we should
move such calculations into the default implementation and put the
control paramters into struct drm_mode_config.

Best regards
Thomas

>=20
> It would look like this:
> 	/* GEM Operations */
> -	DRM_GEM_CMA_VMAP_DRIVER_OPS,
> -	.dumb_create            =3D drm_sun4i_gem_dumb_create,
> +	DRM_GEM_CMA_DRIVER_OPS_CREATE(drm_sun4i_gem_dumb_create),
>=20
>=20
>=20
> Please fix zte/zx_drm_drv.c which also uses DRM_GEM_CMA_VMAP_DRIVER_OPS=
=2E
>=20
>=20
> The naming is a bikeshedding topic that we may not agree on, soo..
>=20
> With zte fixed the patch is:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>=20
> 	Sam
>=20
>=20
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/drm_gem_cma_helper.c |  2 +-
>>  drivers/gpu/drm/sun4i/sun4i_drv.c    |  3 +--
>>  drivers/gpu/drm/tidss/tidss_drv.c    |  2 +-
>>  drivers/gpu/drm/tiny/hx8357d.c       |  2 +-
>>  drivers/gpu/drm/tiny/ili9225.c       |  2 +-
>>  drivers/gpu/drm/tiny/ili9341.c       |  2 +-
>>  drivers/gpu/drm/tiny/ili9486.c       |  2 +-
>>  drivers/gpu/drm/tiny/mi0283qt.c      |  2 +-
>>  drivers/gpu/drm/tiny/repaper.c       |  2 +-
>>  drivers/gpu/drm/tiny/st7586.c        |  2 +-
>>  drivers/gpu/drm/tiny/st7735r.c       |  2 +-
>>  include/drm/drm_gem_cma_helper.h     | 24 ++++++++++++++++++++----
>>  12 files changed, 31 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/dr=
m_gem_cma_helper.c
>> index 12e98fb28229d..6fa4d2f2e3987 100644
>> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
>> @@ -620,7 +620,7 @@ EXPORT_SYMBOL(drm_cma_gem_create_object_default_fu=
ncs);
>>   * address set. This address is released when the object is freed.
>>   *
>>   * This function can be used as the &drm_driver.gem_prime_import_sg_t=
able
>> - * callback. The DRM_GEM_CMA_VMAP_DRIVER_OPS() macro provides a short=
cut to set
>> + * callback. The &DRM_GEM_CMA_DRIVER_OPS macro provides a shortcut to=
 set
>>   * the necessary DRM driver operations.
>>   *
>>   * Returns:
>> diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i=
/sun4i_drv.c
>> index 328272ff77d84..012855fd89c24 100644
>> --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
>> +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
>> @@ -52,8 +52,7 @@ static struct drm_driver sun4i_drv_driver =3D {
>>  	.minor			=3D 0,
>> =20
>>  	/* GEM Operations */
>> -	DRM_GEM_CMA_VMAP_DRIVER_OPS,
>> -	.dumb_create		=3D drm_sun4i_gem_dumb_create,
>> +	__DRM_GEM_CMA_DRIVER_OPS(drm_sun4i_gem_dumb_create),
>>  };
>> =20
>>  static int sun4i_drv_bind(struct device *dev)
>> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss=
/tidss_drv.c
>> index 99edc66ebdef2..1753cdc74ebda 100644
>> --- a/drivers/gpu/drm/tidss/tidss_drv.c
>> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
>> @@ -112,7 +112,7 @@ static struct drm_driver tidss_driver =3D {
>>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>>  	.fops			=3D &tidss_fops,
>>  	.release		=3D tidss_release,
>> -	DRM_GEM_CMA_VMAP_DRIVER_OPS,
>> +	DRM_GEM_CMA_DRIVER_OPS,
>>  	.name			=3D "tidss",
>>  	.desc			=3D "TI Keystone DSS",
>>  	.date			=3D "20180215",
>> diff --git a/drivers/gpu/drm/tiny/hx8357d.c b/drivers/gpu/drm/tiny/hx8=
357d.c
>> index b4bc358a3269a..592da71d7ca70 100644
>> --- a/drivers/gpu/drm/tiny/hx8357d.c
>> +++ b/drivers/gpu/drm/tiny/hx8357d.c
>> @@ -196,7 +196,7 @@ DEFINE_DRM_GEM_CMA_FOPS(hx8357d_fops);
>>  static struct drm_driver hx8357d_driver =3D {
>>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>>  	.fops			=3D &hx8357d_fops,
>> -	DRM_GEM_CMA_VMAP_DRIVER_OPS,
>> +	DRM_GEM_CMA_DRIVER_OPS,
>>  	.debugfs_init		=3D mipi_dbi_debugfs_init,
>>  	.name			=3D "hx8357d",
>>  	.desc			=3D "HX8357D",
>> diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili=
9225.c
>> index d1a5ab6747d5c..368ff6c8a1efb 100644
>> --- a/drivers/gpu/drm/tiny/ili9225.c
>> +++ b/drivers/gpu/drm/tiny/ili9225.c
>> @@ -346,7 +346,7 @@ DEFINE_DRM_GEM_CMA_FOPS(ili9225_fops);
>>  static struct drm_driver ili9225_driver =3D {
>>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>>  	.fops			=3D &ili9225_fops,
>> -	DRM_GEM_CMA_VMAP_DRIVER_OPS,
>> +	DRM_GEM_CMA_DRIVER_OPS,
>>  	.name			=3D "ili9225",
>>  	.desc			=3D "Ilitek ILI9225",
>>  	.date			=3D "20171106",
>> diff --git a/drivers/gpu/drm/tiny/ili9341.c b/drivers/gpu/drm/tiny/ili=
9341.c
>> index bb819f45a5d3b..e1b9043ef7a0a 100644
>> --- a/drivers/gpu/drm/tiny/ili9341.c
>> +++ b/drivers/gpu/drm/tiny/ili9341.c
>> @@ -152,7 +152,7 @@ DEFINE_DRM_GEM_CMA_FOPS(ili9341_fops);
>>  static struct drm_driver ili9341_driver =3D {
>>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>>  	.fops			=3D &ili9341_fops,
>> -	DRM_GEM_CMA_VMAP_DRIVER_OPS,
>> +	DRM_GEM_CMA_DRIVER_OPS,
>>  	.debugfs_init		=3D mipi_dbi_debugfs_init,
>>  	.name			=3D "ili9341",
>>  	.desc			=3D "Ilitek ILI9341",
>> diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili=
9486.c
>> index 2702ea557d297..90a17f40fdf0c 100644
>> --- a/drivers/gpu/drm/tiny/ili9486.c
>> +++ b/drivers/gpu/drm/tiny/ili9486.c
>> @@ -165,7 +165,7 @@ DEFINE_DRM_GEM_CMA_FOPS(ili9486_fops);
>>  static struct drm_driver ili9486_driver =3D {
>>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>>  	.fops			=3D &ili9486_fops,
>> -	DRM_GEM_CMA_VMAP_DRIVER_OPS,
>> +	DRM_GEM_CMA_DRIVER_OPS,
>>  	.debugfs_init		=3D mipi_dbi_debugfs_init,
>>  	.name			=3D "ili9486",
>>  	.desc			=3D "Ilitek ILI9486",
>> diff --git a/drivers/gpu/drm/tiny/mi0283qt.c b/drivers/gpu/drm/tiny/mi=
0283qt.c
>> index 08ac549ab0f7f..6624c2098fba2 100644
>> --- a/drivers/gpu/drm/tiny/mi0283qt.c
>> +++ b/drivers/gpu/drm/tiny/mi0283qt.c
>> @@ -156,7 +156,7 @@ DEFINE_DRM_GEM_CMA_FOPS(mi0283qt_fops);
>>  static struct drm_driver mi0283qt_driver =3D {
>>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>>  	.fops			=3D &mi0283qt_fops,
>> -	DRM_GEM_CMA_VMAP_DRIVER_OPS,
>> +	DRM_GEM_CMA_DRIVER_OPS,
>>  	.debugfs_init		=3D mipi_dbi_debugfs_init,
>>  	.name			=3D "mi0283qt",
>>  	.desc			=3D "Multi-Inno MI0283QT",
>> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/rep=
aper.c
>> index 1c0e7169545b4..877dcece25828 100644
>> --- a/drivers/gpu/drm/tiny/repaper.c
>> +++ b/drivers/gpu/drm/tiny/repaper.c
>> @@ -946,7 +946,7 @@ DEFINE_DRM_GEM_CMA_FOPS(repaper_fops);
>>  static struct drm_driver repaper_driver =3D {
>>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>>  	.fops			=3D &repaper_fops,
>> -	DRM_GEM_CMA_VMAP_DRIVER_OPS,
>> +	DRM_GEM_CMA_DRIVER_OPS,
>>  	.name			=3D "repaper",
>>  	.desc			=3D "Pervasive Displays RePaper e-ink panels",
>>  	.date			=3D "20170405",
>> diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st75=
86.c
>> index 2a1fae422f7a2..ec84bdc51f60d 100644
>> --- a/drivers/gpu/drm/tiny/st7586.c
>> +++ b/drivers/gpu/drm/tiny/st7586.c
>> @@ -285,7 +285,7 @@ DEFINE_DRM_GEM_CMA_FOPS(st7586_fops);
>>  static struct drm_driver st7586_driver =3D {
>>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>>  	.fops			=3D &st7586_fops,
>> -	DRM_GEM_CMA_VMAP_DRIVER_OPS,
>> +	DRM_GEM_CMA_DRIVER_OPS,
>>  	.debugfs_init		=3D mipi_dbi_debugfs_init,
>>  	.name			=3D "st7586",
>>  	.desc			=3D "Sitronix ST7586",
>> diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/tiny/st7=
735r.c
>> index 0af1b15efdf8a..cfd4933f3b30c 100644
>> --- a/drivers/gpu/drm/tiny/st7735r.c
>> +++ b/drivers/gpu/drm/tiny/st7735r.c
>> @@ -157,7 +157,7 @@ DEFINE_DRM_GEM_CMA_FOPS(st7735r_fops);
>>  static struct drm_driver st7735r_driver =3D {
>>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>>  	.fops			=3D &st7735r_fops,
>> -	DRM_GEM_CMA_VMAP_DRIVER_OPS,
>> +	DRM_GEM_CMA_DRIVER_OPS,
>>  	.debugfs_init		=3D mipi_dbi_debugfs_init,
>>  	.name			=3D "st7735r",
>>  	.desc			=3D "Sitronix ST7735R",
>> diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cm=
a_helper.h
>> index 947ac95eb24a9..917d42603db06 100644
>> --- a/include/drm/drm_gem_cma_helper.h
>> +++ b/include/drm/drm_gem_cma_helper.h
>> @@ -110,21 +110,37 @@ struct drm_gem_object *
>>  drm_cma_gem_create_object_default_funcs(struct drm_device *dev, size_=
t size);
>> =20
>>  /**
>> - * DRM_GEM_CMA_VMAP_DRIVER_OPS - CMA GEM driver operations ensuring a=
 virtual
>> - *                               address on the buffer
>> + * __DRM_GEM_CMA_DRIVER_OPS - CMA GEM driver operations ensuring a
>> + *                            virtual address on the buffer
>> + * @__dumb_create: callback function for .dumb_create
>>   *
>>   * This macro provides a shortcut for setting the default GEM operati=
ons in the
>>   * &drm_driver structure for drivers that need the virtual address al=
so on
>>   * imported buffers.
>> + *
>> + * This macro is a variant of DRM_GEM_CMA_DRIVER_OPS for drivers that=

>> + * override the default implementation of .dumb_create. Use
>> + * DRM_GEM_CMA_DRIVER_OPS if possible.
>>   */
>> -#define DRM_GEM_CMA_VMAP_DRIVER_OPS \
>> +#define __DRM_GEM_CMA_DRIVER_OPS(__dumb_create) \
>>  	.gem_create_object	=3D drm_cma_gem_create_object_default_funcs, \
>> -	.dumb_create		=3D drm_gem_cma_dumb_create, \
>> +	.dumb_create		=3D (__dumb_create), \
>>  	.prime_handle_to_fd	=3D drm_gem_prime_handle_to_fd, \
>>  	.prime_fd_to_handle	=3D drm_gem_prime_fd_to_handle, \
>>  	.gem_prime_import_sg_table =3D drm_gem_cma_prime_import_sg_table_vma=
p, \
>>  	.gem_prime_mmap		=3D drm_gem_prime_mmap
>> =20
>> +/**
>> + * DRM_GEM_CMA_DRIVER_OPS - CMA GEM driver operations ensuring a virt=
ual
>> + *                          address on the buffer
>> + *
>> + * This macro provides a shortcut for setting the default GEM operati=
ons in the
>> + * &drm_driver structure for drivers that need the virtual address al=
so on
>> + * imported buffers.
>> + */
>> +#define DRM_GEM_CMA_DRIVER_OPS \
>> +	__DRM_GEM_CMA_DRIVER_OPS(drm_gem_cma_dumb_create)
>> +
>>  struct drm_gem_object *
>>  drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *drm,
>>  				       struct dma_buf_attachment *attach,
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


--jZqnVpoS59Du5V7y6CaDLyno36mnruRCw--

--y014uW9UbPDmqu8s94d3p41U8GRgJuOFE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7LtBsACgkQaA3BHVML
eiOmfAf/cY0lo/8aC/nwYB5FIN7qnqju9DjPBeIIWdyz1VELT6BHX/kLYmhxaSx6
rhgY+r+zzofU1y62c2h5vrhVD7yN6JDM0b98JdIINIe6hgv/9EgmbtGidVBSXHRZ
jHomh2KRfgxbyjQ74SBdxp7y6HbNsth6x1P7bOQHtjmF26tXuW9dqLPTP9V6/uKN
/SjoNUVD6ndKYUiWOV3CwE5UaqGL7YcW3mly2JS5W33S/RvzFmrcL9wsecB0gUfs
YEA7IQhBH3WToemvEcoPkwphfjxZZA0Z5kvW/YZGb7CFYZnz9Un19Yo3lXr7lxt8
QzPXc9oA2PsGi2R4/Z96qpZRhXi8dg==
=a+xm
-----END PGP SIGNATURE-----

--y014uW9UbPDmqu8s94d3p41U8GRgJuOFE--

--===============0356768381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0356768381==--
