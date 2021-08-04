Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 420323E079D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 20:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F99B6E42F;
	Wed,  4 Aug 2021 18:30:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F836E42F;
 Wed,  4 Aug 2021 18:30:44 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 20F7B222E3;
 Wed,  4 Aug 2021 18:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628101843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KUz+dWu1JedU38OjBLq+YD5okNGXKNVig0LLvYSaDCI=;
 b=x1ljMwLyZSD2ngghH7eBBQzZtrZsV1A6xmzlBomJsbdsPdwZfvYfBBxovQe2GwqETYYuAl
 Wxc24FD5NnGKHMoHkCU/osnduEHqpBOijdiuWRYGYO0XviHNQ9RlEItEW4Rh6ROVHL1v7D
 kwXrdIU0h3s8U30AnYzu/v/C5wXbrAw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628101843;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KUz+dWu1JedU38OjBLq+YD5okNGXKNVig0LLvYSaDCI=;
 b=DExaCUJXASlqY5Xr0RQZ7W3liyDwed3+Mx8MC6QjtqnpeMFi9tlWLzu2gtzue27IlKEBg8
 S+cq3YU8KVwKrLBw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 5F2AF139B5;
 Wed,  4 Aug 2021 18:30:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id XDOGFdLcCmH8EwAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Wed, 04 Aug 2021 18:30:42 +0000
To: Sam Ravnborg <sam@ravnborg.org>
Cc: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, liviu.dudau@arm.com, brian.starkey@arm.com,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, stefan@agner.ch,
 alison.wang@nxp.com, patrik.r.jakobsson@gmail.com,
 anitha.chrisanthus@intel.com, robdclark@gmail.com, edmund.j.dea@intel.com,
 sean@poorly.run, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, jyri.sarha@iki.fi, tomba@kernel.org,
 Dan.Sneddon@microchip.com, tomi.valkeinen@ideasonboard.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20210803090704.32152-1-tzimmermann@suse.de>
 <20210803090704.32152-12-tzimmermann@suse.de> <YQlZ+EQVbO9N3Mla@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 11/14] drm/tilcdc: Convert to Linux IRQ interfaces
Message-ID: <896793e5-f5a8-fe74-1d8f-3dd1450d3fae@suse.de>
Date: Wed, 4 Aug 2021 20:30:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQlZ+EQVbO9N3Mla@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="YucijCQJHyzyZtQX54zjdDl9YYZpFF6pK"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--YucijCQJHyzyZtQX54zjdDl9YYZpFF6pK
Content-Type: multipart/mixed; boundary="mCfsOcPzSKYlTHNGiPJThEmp0NdPdChTp";
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
 Dan.Sneddon@microchip.com, tomi.valkeinen@ideasonboard.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Message-ID: <896793e5-f5a8-fe74-1d8f-3dd1450d3fae@suse.de>
Subject: Re: [PATCH v2 11/14] drm/tilcdc: Convert to Linux IRQ interfaces
References: <20210803090704.32152-1-tzimmermann@suse.de>
 <20210803090704.32152-12-tzimmermann@suse.de> <YQlZ+EQVbO9N3Mla@ravnborg.org>
In-Reply-To: <YQlZ+EQVbO9N3Mla@ravnborg.org>

--mCfsOcPzSKYlTHNGiPJThEmp0NdPdChTp
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 03.08.21 um 17:00 schrieb Sam Ravnborg:
> Hi Thomas,
>=20
> On Tue, Aug 03, 2021 at 11:07:01AM +0200, Thomas Zimmermann wrote:
>> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
>> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
>> don't benefit from using it.
>>
>> DRM IRQ callbacks are now being called directly or inlined.
>>
>> Calls to platform_get_irq() can fail with a negative errno code.
>> Abort initialization in this case. The DRM IRQ midlayer does not
>> handle this case correctly.
>=20
> I cannot see why the irq_enabled flag is needed here, and the changelog=

> do not help me.
> What do I miss?

That's a good point. Usually, only the DRM IRQ helpers use irq_enabled=20
in struct drm_device. It'll become legacy and we can ignore it for the=20
driver conversion.

The exception is tilcdc, which also uses irq_enabled to make its error=20
rollback work correctly. So I duplicated the state in the local private=20
structure.

I'll add this explanation to the commit message.

Best regards
Thomas

>=20
> 	Sam
>=20
>=20
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/tilcdc/tilcdc_drv.c | 51 ++++++++++++++++++++++-----=
--
>>   drivers/gpu/drm/tilcdc/tilcdc_drv.h |  3 ++
>>   2 files changed, 43 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/til=
cdc/tilcdc_drv.c
>> index f1d3a9f919fd..6b03f89a98d4 100644
>> --- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
>> +++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
>> @@ -20,7 +20,6 @@
>>   #include <drm/drm_fourcc.h>
>>   #include <drm/drm_gem_cma_helper.h>
>>   #include <drm/drm_gem_framebuffer_helper.h>
>> -#include <drm/drm_irq.h>
>>   #include <drm/drm_mm.h>
>>   #include <drm/drm_probe_helper.h>
>>   #include <drm/drm_vblank.h>
>> @@ -124,6 +123,39 @@ static int cpufreq_transition(struct notifier_blo=
ck *nb,
>>   }
>>   #endif
>>  =20
>> +static irqreturn_t tilcdc_irq(int irq, void *arg)
>> +{
>> +	struct drm_device *dev =3D arg;
>> +	struct tilcdc_drm_private *priv =3D dev->dev_private;
>> +
>> +	return tilcdc_crtc_irq(priv->crtc);
>> +}
>> +
>> +static int tilcdc_irq_install(struct drm_device *dev, unsigned int ir=
q)
>> +{
>> +	struct tilcdc_drm_private *priv =3D dev->dev_private;
>> +	int ret;
>> +
>> +	ret =3D request_irq(irq, tilcdc_irq, 0, dev->driver->name, dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	priv->irq_enabled =3D false;
>> +
>> +	return 0;
>> +}
>> +
>> +static void tilcdc_irq_uninstall(struct drm_device *dev)
>> +{
>> +	struct tilcdc_drm_private *priv =3D dev->dev_private;
>> +
>> +	if (!priv->irq_enabled)
>> +		return;
>> +
>> +	free_irq(priv->irq, dev);
>> +	priv->irq_enabled =3D false;
>> +}
>> +
>>   /*
>>    * DRM operations:
>>    */
>> @@ -145,7 +177,7 @@ static void tilcdc_fini(struct drm_device *dev)
>>   		drm_dev_unregister(dev);
>>  =20
>>   	drm_kms_helper_poll_fini(dev);
>> -	drm_irq_uninstall(dev);
>> +	tilcdc_irq_uninstall(dev);
>>   	drm_mode_config_cleanup(dev);
>>  =20
>>   	if (priv->clk)
>> @@ -336,7 +368,12 @@ static int tilcdc_init(const struct drm_driver *d=
drv, struct device *dev)
>>   		goto init_failed;
>>   	}
>>  =20
>> -	ret =3D drm_irq_install(ddev, platform_get_irq(pdev, 0));
>> +	ret =3D platform_get_irq(pdev, 0);
>> +	if (ret < 0)
>> +		goto init_failed;
>> +	priv->irq =3D ret;
>> +
>> +	ret =3D tilcdc_irq_install(ddev, priv->irq);
>>   	if (ret < 0) {
>>   		dev_err(dev, "failed to install IRQ handler\n");
>>   		goto init_failed;
>> @@ -360,13 +397,6 @@ static int tilcdc_init(const struct drm_driver *d=
drv, struct device *dev)
>>   	return ret;
>>   }
>>  =20
>> -static irqreturn_t tilcdc_irq(int irq, void *arg)
>> -{
>> -	struct drm_device *dev =3D arg;
>> -	struct tilcdc_drm_private *priv =3D dev->dev_private;
>> -	return tilcdc_crtc_irq(priv->crtc);
>> -}
>> -
>>   #if defined(CONFIG_DEBUG_FS)
>>   static const struct {
>>   	const char *name;
>> @@ -454,7 +484,6 @@ DEFINE_DRM_GEM_CMA_FOPS(fops);
>>  =20
>>   static const struct drm_driver tilcdc_driver =3D {
>>   	.driver_features    =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC=
,
>> -	.irq_handler        =3D tilcdc_irq,
>>   	DRM_GEM_CMA_DRIVER_OPS,
>>   #ifdef CONFIG_DEBUG_FS
>>   	.debugfs_init       =3D tilcdc_debugfs_init,
>> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/til=
cdc/tilcdc_drv.h
>> index d29806ca8817..b818448c83f6 100644
>> --- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
>> +++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
>> @@ -46,6 +46,8 @@ struct tilcdc_drm_private {
>>   	struct clk *clk;         /* functional clock */
>>   	int rev;                 /* IP revision */
>>  =20
>> +	unsigned int irq;
>> +
>>   	/* don't attempt resolutions w/ higher W * H * Hz: */
>>   	uint32_t max_bandwidth;
>>   	/*
>> @@ -82,6 +84,7 @@ struct tilcdc_drm_private {
>>  =20
>>   	bool is_registered;
>>   	bool is_componentized;
>> +	bool irq_enabled;
>>   };
>>  =20
>>   /* Sub-module for display.  Since we don't know at compile time what=
 panels
>> --=20
>> 2.32.0

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--mCfsOcPzSKYlTHNGiPJThEmp0NdPdChTp--

--YucijCQJHyzyZtQX54zjdDl9YYZpFF6pK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmEK3NEFAwAAAAAACgkQlh/E3EQov+C+
4Q//dCYZ5TP4KEG8lVz+MeAm3RYh4P1SDDFvX8RYKmv1CyQGh2WTA1kOOgm6Orj/v3TE+x8F7hyt
+99JcU2JZx7dwpuc4Ydm7PK2FZhdH/2CpzIo0Bw0UmCaUY7R7tpM5WKIukCqwYCEW3yGI5IW2Onf
pwwhzijl1+L7LiwNMsRTOcbqZM9xcF8rGqut4HbRTY0PlNmVAN/EmfpOwo0k8RCzAzIuCAvl/5VR
V6dmO8zuLMaMCs8RNAviyJ1wDs4CleJsepN1IXNDLyqcyqcPTWhDvVwWjUg85/+XxoF6t1G6wJk/
QSUnjNbBJi41DxsVB0NtMHxeT4Qwe/O+PAaQQYLOIgnbcFp1/imQ/FeGkZFqzqefb80rOUCsQcdM
4JKSxtYWxj7sCS0VWtl3RL1GdOelj8DYVs5X1wDoSdEngYoGwr4CJy60ZvYudMGNqv3IP/NVVSuR
+bV8plSN7Bbdy/wZR1GREZNS7y5NBAXv0hOcHna6uLKwPkmRR37Xm+oyddUjWNgUuSpUvkRAAD0z
jw5IfKSVif3ZY9XdyuK3EBK5cFzgeUI563+sshIYiEB+Ibl5Unfxj5rVh6VWBSORJ+iz8IEa3Oy5
opdFyRNn5Kk03zZVGPfYwOmNgJB+u+MYGjKwgWTgqWjL2vZ+lN7quDgl1dJCv9MjdZEHjHFVfI8V
F+s=
=xdU3
-----END PGP SIGNATURE-----

--YucijCQJHyzyZtQX54zjdDl9YYZpFF6pK--
