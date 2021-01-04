Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8762E916B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:04:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D02389C14;
	Mon,  4 Jan 2021 08:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C735289C14
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jan 2021 08:04:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4D523AD75;
 Mon,  4 Jan 2021 08:04:15 +0000 (UTC)
Subject: Re: [PATCH v2] drm/hisilicon: Add load and unload callback functions
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
References: <1608799558-29564-1-git-send-email-tiantao6@hisilicon.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <e1c6fa5a-27d4-1726-0ae8-5990839aac61@suse.de>
Date: Mon, 4 Jan 2021 09:04:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1608799558-29564-1-git-send-email-tiantao6@hisilicon.com>
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
Content-Type: multipart/mixed; boundary="===============0870894710=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0870894710==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="u6hWuRE08bl3qPl4zHmAMlPyFZi3LrVu3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--u6hWuRE08bl3qPl4zHmAMlPyFZi3LrVu3
Content-Type: multipart/mixed; boundary="ciPq5Np7IqVuo7gosp9iQSLBNK1WF6MRW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
Message-ID: <e1c6fa5a-27d4-1726-0ae8-5990839aac61@suse.de>
Subject: Re: [PATCH v2] drm/hisilicon: Add load and unload callback functions
References: <1608799558-29564-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1608799558-29564-1-git-send-email-tiantao6@hisilicon.com>

--ciPq5Np7IqVuo7gosp9iQSLBNK1WF6MRW
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

and a happy new year.

Am 24.12.20 um 09:45 schrieb Tian Tao:
> Add the callback functions of drm_driver structure member functions
> load and unload, no need to call load in the hibmc_pci_probe function
> and unload in the hibmc_pci_remove function.

The load and unload callbacks are left over from long ago. They are now=20
deprecated.* Don't use them.

>=20
> v2:
> remove the hibmc_unload called from hibmc_pic_remove.

If anything, you'd want to inline hibmc's load/unload into their callers.=


Best regards
Thomas

*) White lie: They are used by the old non-KMS drivers. Anything with=20
KMS should not use them.

>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 18 +++++++---------=
--
>   1 file changed, 7 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/=
gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index 0d4e902..10042cf 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -27,6 +27,9 @@
>  =20
>   DEFINE_DRM_GEM_FOPS(hibmc_fops);
>  =20
> +static int hibmc_load(struct drm_device *dev, unsigned long flags);
> +static void hibmc_unload(struct drm_device *dev);
> +
>   static irqreturn_t hibmc_drm_interrupt(int irq, void *arg)
>   {
>   	struct drm_device *dev =3D (struct drm_device *)arg;
> @@ -63,6 +66,8 @@ static const struct drm_driver hibmc_driver =3D {
>   	.dumb_map_offset        =3D drm_gem_vram_driver_dumb_mmap_offset,
>   	.gem_prime_mmap		=3D drm_gem_prime_mmap,
>   	.irq_handler		=3D hibmc_drm_interrupt,
> +	.load			=3D hibmc_load,
> +	.unload			=3D hibmc_unload,
>   };
>  =20
>   static int __maybe_unused hibmc_pm_suspend(struct device *dev)
> @@ -248,7 +253,7 @@ static int hibmc_hw_init(struct hibmc_drm_private *=
priv)
>   	return 0;
>   }
>  =20
> -static int hibmc_unload(struct drm_device *dev)
> +static void hibmc_unload(struct drm_device *dev)
>   {
>   	drm_atomic_helper_shutdown(dev);
>  =20
> @@ -256,11 +261,9 @@ static int hibmc_unload(struct drm_device *dev)
>   		drm_irq_uninstall(dev);
>  =20
>   	pci_disable_msi(dev->pdev);
> -
> -	return 0;
>   }
>  =20
> -static int hibmc_load(struct drm_device *dev)
> +static int hibmc_load(struct drm_device *dev, unsigned long flags)
>   {
>   	struct hibmc_drm_private *priv =3D to_hibmc_drm_private(dev);
>   	int ret;
> @@ -335,12 +338,6 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
>   		goto err_return;
>   	}
>  =20
> -	ret =3D hibmc_load(dev);
> -	if (ret) {
> -		drm_err(dev, "failed to load hibmc: %d\n", ret);
> -		goto err_return;
> -	}
> -
>   	ret =3D drm_dev_register(dev, 0);
>   	if (ret) {
>   		drm_err(dev, "failed to register drv for userspace access: %d\n",
> @@ -363,7 +360,6 @@ static void hibmc_pci_remove(struct pci_dev *pdev)
>   	struct drm_device *dev =3D pci_get_drvdata(pdev);
>  =20
>   	drm_dev_unregister(dev);
> -	hibmc_unload(dev);
>   }
>  =20
>   static const struct pci_device_id hibmc_pci_table[] =3D {
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--ciPq5Np7IqVuo7gosp9iQSLBNK1WF6MRW--

--u6hWuRE08bl3qPl4zHmAMlPyFZi3LrVu3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/yy/0FAwAAAAAACgkQlh/E3EQov+Bh
wg/+IvCyezuD14UleRkSN4+mLh1au6dgj6AyGJKWiPcTl+Zr5+fvCrnubEBFFBcgWFCYGwg5cfJC
RsiloINl/r7zcAXON5IVPVXnIFU+0jClbQicZMxqotYYPSnKgCcjL3E2Nmt+aLDVZhmD3OjWMIMg
q6d7EGKacGm+o5hEuFQf3fQOAhy1IIXLC2yyNLzbkPnEBpuOdHuBYhmu5IS4u0hOtFanffhjmgZA
a46qs80XKebZ3HG3vxLFwg07/9XVlelcGiERwTjY/Wq0wBXQ39N+gsLQFduj8fNMUen9M+iNnWsq
9EsuGIFo1FJLsf0UY9xzGwrevlMXQT9HZGVWQbrJErVO5l1ViTPdgqSh326e1oGhklaq/A9eQ5pj
KOQUoEk8KtAEGgmHI8M++JwUFeTXqnWlm/x9S+RNDo5UDX1BzP9oWkvwCih5OhF44COLzy4CfOZC
zcLwdBvzGDiOF8Du4xL1cXJN0C+qWLvzfXNMMjP1bRwe6bJ/ckS+V0oijzSRndfR5QxBalcA8sD/
3O3zM/Cr0fUvfD51LHQAIgebhSsYKvBjhhFV0ZUiNfdm8NjDcVEZstiBBGwz5FZamaOnbUPQFz98
Wjsj+UoqiU3Hzh3gIXOsYgzId+21fmkUQ02zjk7vnfRC8fDo8aYbv0AAk6+UPXyIVaNdIM+J0a85
wtY=
=NaQb
-----END PGP SIGNATURE-----

--u6hWuRE08bl3qPl4zHmAMlPyFZi3LrVu3--

--===============0870894710==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0870894710==--
