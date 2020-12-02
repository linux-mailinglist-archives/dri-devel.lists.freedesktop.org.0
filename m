Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 515A92CB7E6
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:59:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 705A76E955;
	Wed,  2 Dec 2020 08:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B688B6E955
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 08:59:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 47911ACC2;
 Wed,  2 Dec 2020 08:59:34 +0000 (UTC)
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <1606898835-40775-1-git-send-email-tiantao6@hisilicon.com>
 <1606898835-40775-3-git-send-email-tiantao6@hisilicon.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH drm/hisilicon 2/3] drm/irq: Add the new api to install irq
Message-ID: <0582b2bc-cba5-af9e-3da1-dddc65dc859a@suse.de>
Date: Wed, 2 Dec 2020 09:59:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1606898835-40775-3-git-send-email-tiantao6@hisilicon.com>
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
Cc: linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0663903473=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0663903473==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="D2ArB4BjPyH4gDC0vZ4coFadlRx6osh0i"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--D2ArB4BjPyH4gDC0vZ4coFadlRx6osh0i
Content-Type: multipart/mixed; boundary="dtcKyPVlomp4LMREjCRK4bfjpc1oBkVK4";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: linux-kernel@vger.kernel.org
Message-ID: <0582b2bc-cba5-af9e-3da1-dddc65dc859a@suse.de>
Subject: Re: [PATCH drm/hisilicon 2/3] drm/irq: Add the new api to install irq
References: <1606898835-40775-1-git-send-email-tiantao6@hisilicon.com>
 <1606898835-40775-3-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1606898835-40775-3-git-send-email-tiantao6@hisilicon.com>

--dtcKyPVlomp4LMREjCRK4bfjpc1oBkVK4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 02.12.20 um 09:47 schrieb Tian Tao:
> Add new api devm_drm_irq_install() to register interrupts,
> no need to call drm_irq_uninstall() when the drm module is removed.
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>   drivers/gpu/drm/drm_irq.c | 35 +++++++++++++++++++++++++++++++++++
>   include/drm/drm_irq.h     |  2 +-
>   2 files changed, 36 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
> index 09d6e9e..b363dec 100644
> --- a/drivers/gpu/drm/drm_irq.c
> +++ b/drivers/gpu/drm/drm_irq.c
> @@ -214,6 +214,41 @@ int drm_irq_uninstall(struct drm_device *dev)
>   }
>   EXPORT_SYMBOL(drm_irq_uninstall);
>  =20
> +static void devm_drm_irq_uninstall(void *data)
> +{
> +	drm_irq_uninstall(data);
> +}
> +
> +/**
> + * devm_drm_irq_install - install IRQ handler
> + * @dev: DRM device
> + * @irq: IRQ number to install the handler for
> + *
> + * devm_drm_irq_install is a  help function of drm_irq_install.
> + *
> + * if the driver uses devm_drm_irq_install, there is no need
> + * to call drm_irq_uninstall when the drm module get unloaded,
> + * as this will done automagically.
> + *
> + * Returns:
> + * Zero on success or a negative error code on failure.
> + */
> +int devm_drm_irq_install(struct drm_device *dev, int irq)
> +{
> +	int ret;
> +
> +	ret =3D drm_irq_install(dev, irq);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_add_action_or_reset(dev->dev, devm_drm_irq_uninstall, de=
v);
> +	if (ret)
> +		devm_drm_irq_uninstall(dev);

If anything went wrong, devm_add_action_or_reset() will have already=20
cleaned up for you. [1] So just return the result of=20
devm_add_action_or_reset().

Best regards
Thomas

[1]=20
https://elixir.bootlin.com/linux/latest/source/include/linux/device.h#L25=
5

> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(devm_drm_irq_install);
> +
>   #if IS_ENABLED(CONFIG_DRM_LEGACY)
>   int drm_legacy_irq_control(struct drm_device *dev, void *data,
>   			   struct drm_file *file_priv)
> diff --git a/include/drm/drm_irq.h b/include/drm/drm_irq.h
> index d77f6e6..631b22f 100644
> --- a/include/drm/drm_irq.h
> +++ b/include/drm/drm_irq.h
> @@ -28,5 +28,5 @@ struct drm_device;
>  =20
>   int drm_irq_install(struct drm_device *dev, int irq);
>   int drm_irq_uninstall(struct drm_device *dev);
> -
> +int devm_drm_irq_install(struct drm_device *dev, int irq);
>   #endif
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--dtcKyPVlomp4LMREjCRK4bfjpc1oBkVK4--

--D2ArB4BjPyH4gDC0vZ4coFadlRx6osh0i
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/HV3QFAwAAAAAACgkQlh/E3EQov+Aa
7Q/8CvfrnS6P1zg9BpA9ogBz2v+5GhfIQ3opWto2b2dVaQMSOeEv2PYPrl9lz14cKqQsActOxSY4
97qDlQAZYFw3uyMIqFHEUrIqaX0+5rC4xryCtOeo5yo2rqvB9t3gj1lJ1lPBzTqxhXVZoUgFROaK
d6G+i6ik7nKLBxFULVFcYMivu8IrSD2Y9Qi8ED13AXAQwYSX51OTcNyRSgdSNjKOpPPdw1OBoyqP
wng29OVeE/qbO5b2Rm5aWHwOXxQeY1MSG4ik4erBoK3X27cj/NrbJUnyXYJf5OYTm1T4zK6cFB9M
tLSopJsv+gXmH5S1j6nM2k/G8riS9ZDFstt+NwFXxKAb2QjhxGY6xYFUiiJNeFEqAccy5zSWRHFf
UCnqLJf7d0h2pSvksr7RVPXKZEFprHkEwuUqeBM4EjjE3zwNahpAKv6Bm+JuqeW72UjqU6Iwv+Ki
nyba/Fcw579VJE6y88X7WBk4+VDbBX3moCBCkc9fRH10hCQIm5K5aemzSZVyu7BERVPz7gYwCVcD
5TP4NQSTSoBWfTgQS8ignw0Z6Tj72FY3e+htbeDTmMkdWdL1cQH4EQ0at61Vp5bUwJlTO/TZqlZ8
gGbrk+SEyzGhofpQFvCclP1TxoxsQlVMWK4gBpp2Nnv/wSCRn+GD6vxRmPF0QPcjuX4HQjqA6wuz
/Xk=
=BUWM
-----END PGP SIGNATURE-----

--D2ArB4BjPyH4gDC0vZ4coFadlRx6osh0i--

--===============0663903473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0663903473==--
