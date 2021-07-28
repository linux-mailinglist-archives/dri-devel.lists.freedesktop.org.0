Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 166423D9519
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 20:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A60C6E19C;
	Wed, 28 Jul 2021 18:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E4C6E19C;
 Wed, 28 Jul 2021 18:15:08 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1F0F81FFE5;
 Wed, 28 Jul 2021 18:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627496106; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y28AIFkhWiderK8PJhfuYxgNWDXDJQHw+OqLmv7b+GQ=;
 b=J46UeUzPBwj4BzWn50sFbARKqoy241eBPIF0+wWnoNNzo/77+2rZb2Ht7DIMKaHOEzO+FB
 EEjgCqYm//gUa5JRL4ohyj1GQTIToJGE1k0ZwMlwntLd6YM/+URwnUOYjlgoSVIvNNVptg
 7Mv+l0xMOrHDRqEEtL2lAtE2x1i+j64=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627496106;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y28AIFkhWiderK8PJhfuYxgNWDXDJQHw+OqLmv7b+GQ=;
 b=WXItOCUJ/Qm+BocjIExYDyVZqeWoV1RtjxLLmFXrw3EV6U4DM0Au3AVWVDaRVjJ6tEKfk2
 olEOHAielUkMyDAw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 87FA513AAE;
 Wed, 28 Jul 2021 18:15:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id I1fIH6meAWHNOgAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Wed, 28 Jul 2021 18:15:05 +0000
To: Sam Ravnborg <sam@ravnborg.org>
References: <20210727182721.17981-1-tzimmermann@suse.de>
 <20210727182721.17981-3-tzimmermann@suse.de> <YQFcOU79/lpbt1VW@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 02/14] drm/arm/hdlcd: Convert to Linux IRQ interfaces
Message-ID: <0f9569f8-18ce-485b-7d02-62a4bca45a5d@suse.de>
Date: Wed, 28 Jul 2021 20:15:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQFcOU79/lpbt1VW@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="mFY4koTf4cpSBUbJltMEI2GlIpOaZ1U6l"
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
Cc: airlied@linux.ie, liviu.dudau@arm.com, amd-gfx@lists.freedesktop.org,
 anitha.chrisanthus@intel.com, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, edmund.j.dea@intel.com,
 s.hauer@pengutronix.de, alison.wang@nxp.com, dri-devel@lists.freedesktop.org,
 sean@poorly.run, linux-arm-kernel@lists.infradead.org, tomba@kernel.org,
 bbrezillon@kernel.org, jyri.sarha@iki.fi, nicolas.ferre@microchip.com,
 christian.koenig@amd.com, kernel@pengutronix.de, alexander.deucher@amd.com,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--mFY4koTf4cpSBUbJltMEI2GlIpOaZ1U6l
Content-Type: multipart/mixed; boundary="IRquQ23pnTk82MxUVYVwIk8gHNTDMLFNo";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, liviu.dudau@arm.com, brian.starkey@arm.com,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, stefan@agner.ch,
 alison.wang@nxp.com, patrik.r.jakobsson@gmail.com,
 anitha.chrisanthus@intel.com, robdclark@gmail.com, edmund.j.dea@intel.com,
 sean@poorly.run, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, jyri.sarha@iki.fi, tomba@kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Message-ID: <0f9569f8-18ce-485b-7d02-62a4bca45a5d@suse.de>
Subject: Re: [PATCH 02/14] drm/arm/hdlcd: Convert to Linux IRQ interfaces
References: <20210727182721.17981-1-tzimmermann@suse.de>
 <20210727182721.17981-3-tzimmermann@suse.de> <YQFcOU79/lpbt1VW@ravnborg.org>
In-Reply-To: <YQFcOU79/lpbt1VW@ravnborg.org>

--IRquQ23pnTk82MxUVYVwIk8gHNTDMLFNo
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Sam

Am 28.07.21 um 15:31 schrieb Sam Ravnborg:
> Hi Thomas,
>=20
> On Tue, Jul 27, 2021 at 08:27:09PM +0200, Thomas Zimmermann wrote:
>> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
>> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
>> don't benefit from using it.
>>
>> DRM IRQ callbacks are now being called directly or inlined.
>>
>> Calls to platform_get_irq() can fail with a negative errno code.
>> Abort initialization in this case. The DRM IRQ midlayer does not
>> handle this case correctly.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/arm/hdlcd_drv.c | 174 ++++++++++++++++++------------=
--
>>   drivers/gpu/drm/arm/hdlcd_drv.h |   1 +
>>   2 files changed, 97 insertions(+), 78 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdl=
cd_drv.c
>> index 81ae92390736..b9998fe3982f 100644
>> --- a/drivers/gpu/drm/arm/hdlcd_drv.c
>> +++ b/drivers/gpu/drm/arm/hdlcd_drv.c
>> @@ -29,7 +29,6 @@
>>   #include <drm/drm_fb_helper.h>
>>   #include <drm/drm_gem_cma_helper.h>
>>   #include <drm/drm_gem_framebuffer_helper.h>
>> -#include <drm/drm_irq.h>
>>   #include <drm/drm_modeset_helper.h>
>>   #include <drm/drm_of.h>
>>   #include <drm/drm_probe_helper.h>
>> @@ -38,6 +37,94 @@
>>   #include "hdlcd_drv.h"
>>   #include "hdlcd_regs.h"
>>  =20
>> +static irqreturn_t hdlcd_irq(int irq, void *arg)
>> +{
>> +	struct drm_device *drm =3D arg;
>> +	struct hdlcd_drm_private *hdlcd =3D drm->dev_private;
>> +	unsigned long irq_status;
>> +
>> +	irq_status =3D hdlcd_read(hdlcd, HDLCD_REG_INT_STATUS);
>> +
>> +#ifdef CONFIG_DEBUG_FS
>> +	if (irq_status & HDLCD_INTERRUPT_UNDERRUN)
>> +		atomic_inc(&hdlcd->buffer_underrun_count);
>> +
>> +	if (irq_status & HDLCD_INTERRUPT_DMA_END)
>> +		atomic_inc(&hdlcd->dma_end_count);
>> +
>> +	if (irq_status & HDLCD_INTERRUPT_BUS_ERROR)
>> +		atomic_inc(&hdlcd->bus_error_count);
>> +
>> +	if (irq_status & HDLCD_INTERRUPT_VSYNC)
>> +		atomic_inc(&hdlcd->vsync_count);
>> +
>> +#endif
>> +	if (irq_status & HDLCD_INTERRUPT_VSYNC)
>> +		drm_crtc_handle_vblank(&hdlcd->crtc);
>> +
>> +	/* acknowledge interrupt(s) */
>> +	hdlcd_write(hdlcd, HDLCD_REG_INT_CLEAR, irq_status);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static void hdlcd_irq_preinstall(struct drm_device *drm)
>> +{
>> +	struct hdlcd_drm_private *hdlcd =3D drm->dev_private;
>> +	/* Ensure interrupts are disabled */
>> +	hdlcd_write(hdlcd, HDLCD_REG_INT_MASK, 0);
>> +	hdlcd_write(hdlcd, HDLCD_REG_INT_CLEAR, ~0);
>> +}
>> +
>> +static void hdlcd_irq_postinstall(struct drm_device *drm)
>> +{
>> +#ifdef CONFIG_DEBUG_FS
>> +	struct hdlcd_drm_private *hdlcd =3D drm->dev_private;
>> +	unsigned long irq_mask =3D hdlcd_read(hdlcd, HDLCD_REG_INT_MASK);
>> +
>> +	/* enable debug interrupts */
>> +	irq_mask |=3D HDLCD_DEBUG_INT_MASK;
>> +
>> +	hdlcd_write(hdlcd, HDLCD_REG_INT_MASK, irq_mask);
>> +#endif
>> +}
>> +
>> +static int hdlcd_irq_install(struct drm_device *dev, int irq)
> It is inconsistent that the drm_device * is named "dev", as similar
> functions in this patch uses the name "drm".
>=20
>> +{
>> +	int ret;
>> +
>> +	if (irq =3D=3D IRQ_NOTCONNECTED)
>> +		return -ENOTCONN;
> The code above is almost redundandt as request_irq has the same check.
> The only benefit of this check is that we avoid calling
> hdlcd_irq_preinstall().

I'd expect that there's a reason that the code is in _preinstall(). So=20
testing for IRQF_NOTCONNECTED in request_irq() might be too late. I'd=20
really like to here from driver maintainers that this can be changed.

I agree that the logic is duplicated and the whole thing could be=20
simpler. But I rather stick with the original logic as used in=20
drm_irq_install(). That function get's it totally wrong BTW.

>=20
> And IRQ_NOTCONNECTED is only set for PCI devices which this is not.

Is that guaranteed?

Best regards
Thomas

> So I would thing the if () should be dropped here. ??
>=20
> With the inputs considered/addressed:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>=20
>=20
>> +
>> +	hdlcd_irq_preinstall(dev);
>> +
>> +	ret =3D request_irq(irq, hdlcd_irq, 0, dev->driver->name, dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	hdlcd_irq_postinstall(dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static void hdlcd_irq_uninstall(struct drm_device *drm)
>> +{
>> +	struct hdlcd_drm_private *hdlcd =3D drm->dev_private;
>> +	/* disable all the interrupts that we might have enabled */
>> +	unsigned long irq_mask =3D hdlcd_read(hdlcd, HDLCD_REG_INT_MASK);
>> +
>> +#ifdef CONFIG_DEBUG_FS
>> +	/* disable debug interrupts */
>> +	irq_mask &=3D ~HDLCD_DEBUG_INT_MASK;
>> +#endif
>> +
>> +	/* disable vsync interrupts */
>> +	irq_mask &=3D ~HDLCD_INTERRUPT_VSYNC;
>> +	hdlcd_write(hdlcd, HDLCD_REG_INT_MASK, irq_mask);
>> +
>> +	free_irq(hdlcd->irq, drm);
>> +}
>> +
>>   static int hdlcd_load(struct drm_device *drm, unsigned long flags)
>>   {
>>   	struct hdlcd_drm_private *hdlcd =3D drm->dev_private;
>> @@ -90,7 +177,12 @@ static int hdlcd_load(struct drm_device *drm, unsi=
gned long flags)
>>   		goto setup_fail;
>>   	}
>>  =20
>> -	ret =3D drm_irq_install(drm, platform_get_irq(pdev, 0));
>> +	ret =3D platform_get_irq(pdev, 0);
>> +	if (ret < 0)
>> +		goto irq_fail;
>> +	hdlcd->irq =3D ret;
>> +
>> +	ret =3D hdlcd_irq_install(drm, hdlcd->irq);
>>   	if (ret < 0) {
>>   		DRM_ERROR("failed to install IRQ handler\n");
>>   		goto irq_fail;
>> @@ -122,76 +214,6 @@ static void hdlcd_setup_mode_config(struct drm_de=
vice *drm)
>>   	drm->mode_config.funcs =3D &hdlcd_mode_config_funcs;
>>   }
>>  =20
>> -static irqreturn_t hdlcd_irq(int irq, void *arg)
>> -{
>> -	struct drm_device *drm =3D arg;
>> -	struct hdlcd_drm_private *hdlcd =3D drm->dev_private;
>> -	unsigned long irq_status;
>> -
>> -	irq_status =3D hdlcd_read(hdlcd, HDLCD_REG_INT_STATUS);
>> -
>> -#ifdef CONFIG_DEBUG_FS
>> -	if (irq_status & HDLCD_INTERRUPT_UNDERRUN)
>> -		atomic_inc(&hdlcd->buffer_underrun_count);
>> -
>> -	if (irq_status & HDLCD_INTERRUPT_DMA_END)
>> -		atomic_inc(&hdlcd->dma_end_count);
>> -
>> -	if (irq_status & HDLCD_INTERRUPT_BUS_ERROR)
>> -		atomic_inc(&hdlcd->bus_error_count);
>> -
>> -	if (irq_status & HDLCD_INTERRUPT_VSYNC)
>> -		atomic_inc(&hdlcd->vsync_count);
>> -
>> -#endif
>> -	if (irq_status & HDLCD_INTERRUPT_VSYNC)
>> -		drm_crtc_handle_vblank(&hdlcd->crtc);
>> -
>> -	/* acknowledge interrupt(s) */
>> -	hdlcd_write(hdlcd, HDLCD_REG_INT_CLEAR, irq_status);
>> -
>> -	return IRQ_HANDLED;
>> -}
>> -
>> -static void hdlcd_irq_preinstall(struct drm_device *drm)
>> -{
>> -	struct hdlcd_drm_private *hdlcd =3D drm->dev_private;
>> -	/* Ensure interrupts are disabled */
>> -	hdlcd_write(hdlcd, HDLCD_REG_INT_MASK, 0);
>> -	hdlcd_write(hdlcd, HDLCD_REG_INT_CLEAR, ~0);
>> -}
>> -
>> -static int hdlcd_irq_postinstall(struct drm_device *drm)
>> -{
>> -#ifdef CONFIG_DEBUG_FS
>> -	struct hdlcd_drm_private *hdlcd =3D drm->dev_private;
>> -	unsigned long irq_mask =3D hdlcd_read(hdlcd, HDLCD_REG_INT_MASK);
>> -
>> -	/* enable debug interrupts */
>> -	irq_mask |=3D HDLCD_DEBUG_INT_MASK;
>> -
>> -	hdlcd_write(hdlcd, HDLCD_REG_INT_MASK, irq_mask);
>> -#endif
>> -	return 0;
>> -}
>> -
>> -static void hdlcd_irq_uninstall(struct drm_device *drm)
>> -{
>> -	struct hdlcd_drm_private *hdlcd =3D drm->dev_private;
>> -	/* disable all the interrupts that we might have enabled */
>> -	unsigned long irq_mask =3D hdlcd_read(hdlcd, HDLCD_REG_INT_MASK);
>> -
>> -#ifdef CONFIG_DEBUG_FS
>> -	/* disable debug interrupts */
>> -	irq_mask &=3D ~HDLCD_DEBUG_INT_MASK;
>> -#endif
>> -
>> -	/* disable vsync interrupts */
>> -	irq_mask &=3D ~HDLCD_INTERRUPT_VSYNC;
>> -
>> -	hdlcd_write(hdlcd, HDLCD_REG_INT_MASK, irq_mask);
>> -}
>> -
>>   #ifdef CONFIG_DEBUG_FS
>>   static int hdlcd_show_underrun_count(struct seq_file *m, void *arg)
>>   {
>> @@ -236,10 +258,6 @@ DEFINE_DRM_GEM_CMA_FOPS(fops);
>>  =20
>>   static const struct drm_driver hdlcd_driver =3D {
>>   	.driver_features =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>> -	.irq_handler =3D hdlcd_irq,
>> -	.irq_preinstall =3D hdlcd_irq_preinstall,
>> -	.irq_postinstall =3D hdlcd_irq_postinstall,
>> -	.irq_uninstall =3D hdlcd_irq_uninstall,
>>   	DRM_GEM_CMA_DRIVER_OPS,
>>   #ifdef CONFIG_DEBUG_FS
>>   	.debugfs_init =3D hdlcd_debugfs_init,
>> @@ -316,7 +334,7 @@ static int hdlcd_drm_bind(struct device *dev)
>>   err_unload:
>>   	of_node_put(hdlcd->crtc.port);
>>   	hdlcd->crtc.port =3D NULL;
>> -	drm_irq_uninstall(drm);
>> +	hdlcd_irq_uninstall(drm);
>>   	of_reserved_mem_device_release(drm->dev);
>>   err_free:
>>   	drm_mode_config_cleanup(drm);
>> @@ -338,7 +356,7 @@ static void hdlcd_drm_unbind(struct device *dev)
>>   	hdlcd->crtc.port =3D NULL;
>>   	pm_runtime_get_sync(dev);
>>   	drm_atomic_helper_shutdown(drm);
>> -	drm_irq_uninstall(drm);
>> +	hdlcd_irq_uninstall(drm);
>>   	pm_runtime_put(dev);
>>   	if (pm_runtime_enabled(dev))
>>   		pm_runtime_disable(dev);
>> diff --git a/drivers/gpu/drm/arm/hdlcd_drv.h b/drivers/gpu/drm/arm/hdl=
cd_drv.h
>> index fd438d177b64..909c39c28487 100644
>> --- a/drivers/gpu/drm/arm/hdlcd_drv.h
>> +++ b/drivers/gpu/drm/arm/hdlcd_drv.h
>> @@ -11,6 +11,7 @@ struct hdlcd_drm_private {
>>   	struct clk			*clk;
>>   	struct drm_crtc			crtc;
>>   	struct drm_plane		*plane;
>> +	unsigned int			irq;
>>   #ifdef CONFIG_DEBUG_FS
>>   	atomic_t buffer_underrun_count;
>>   	atomic_t bus_error_count;
>> --=20
>> 2.32.0

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--IRquQ23pnTk82MxUVYVwIk8gHNTDMLFNo--

--mFY4koTf4cpSBUbJltMEI2GlIpOaZ1U6l
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmEBnqgFAwAAAAAACgkQlh/E3EQov+BR
3Q/9H11I+VG2jMIb5wT1Tszl1jbA+a8GQJkMoKvsAWjMwNqID5C0oFOsMEhoVZU6TqI7Nzz5bvcO
Qeb6LKuJUjAY2zwGkxYmiOxlL6CW1jcqCXoS+BIvqa1dixXuoIkPqQW0/hfFxl9zJil9+m4A3OYH
ldEDnVnKtQ4SrD4+NrEYFHY3j/OLvfQcUqYyMh61wRII40GGRA91D9cxPFQvMxGkAAqWrPYxzQMS
fAjgiiXwzrfLGkd3M6ZAwmYzuT1vAwLaaJsQunoib/fZPPDBvj29gl3lh0hfxiSJv7+y4nL9r4bG
FWAj48lNK5Kv/kVeoAznCl8LfYnabLXDNCkmv9ZNgeQeroph3Kl1aTxpxVTvb8eyRdvoseDxweSb
csgW0I3Hd4x/PNTZgYk6k3XgcbZn2JfsuHtxVXUQ0ZMwTAPjHHZXglblXm7nAjU7WiUvIQPB7uuw
WVUQoae15Iwa1PLfmIxqDgiVlbDg7bVRSOuGC/DKU6aWEN7yAGDmNi+/U5trvE2m/57hSUf4SrlN
83EjcNaG2UMYX9N7q7bFkNiTi3A5brHXQXGzuGuNc2ZreRuw2iJdpjzirJTBkOZrNDzODA0gTbRZ
3x+4xduPOdjhejEKdBBe6T8bxhhaHM/5fl3fqjlVC4f59ZT7uBDT6fZk7QHQZx4TA4ZC//QyXHGJ
lrQ=
=hZt0
-----END PGP SIGNATURE-----

--mFY4koTf4cpSBUbJltMEI2GlIpOaZ1U6l--
