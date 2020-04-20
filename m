Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E9B1B08C6
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 14:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5469A6E17E;
	Mon, 20 Apr 2020 12:08:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42A06E191
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 12:08:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F0007AF3F;
 Mon, 20 Apr 2020 12:07:58 +0000 (UTC)
Subject: Re: [PATCH 5/8] drm/vmwgfx: make framebuffer support optional
To: Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>, linux-fbdev@vger.kernel.org
References: <20200417155553.675905-1-arnd@arndb.de>
 <20200417155553.675905-6-arnd@arndb.de>
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
Message-ID: <9cba223a-7255-4170-f7be-ba4f45bae5a7@suse.de>
Date: Mon, 20 Apr 2020 14:07:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200417155553.675905-6-arnd@arndb.de>
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
Cc: marex@denx.de, dsd@laptop.org, Andrzej Hajda <a.hajda@samsung.com>,
 airlied@linux.ie, masahiroy@kernel.org, Nicolas Pitre <nico@fluxnic.net>,
 Saeed Mahameed <saeedm@mellanox.com>, thellstrom@vmware.com,
 haojian.zhuang@gmail.com, geert@linux-m68k.org,
 linux-renesas-soc@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 kieran.bingham+renesas@ideasonboard.com, linux-graphics-maintainer@vmware.com,
 Laurent.pinchart@ideasonboard.com, jfrederich@gmail.com,
 robert.jarzmik@free.fr, daniel@zonque.org
Content-Type: multipart/mixed; boundary="===============0871134073=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0871134073==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="QjdARr8dfpLxynX6OA5uCzKDKiNzxQLlP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QjdARr8dfpLxynX6OA5uCzKDKiNzxQLlP
Content-Type: multipart/mixed; boundary="9bkVbYw8uZtom442BoBKH6gzY8ZRJOq4V";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>, linux-fbdev@vger.kernel.org
Cc: Nicolas Pitre <nico@fluxnic.net>, Andrzej Hajda <a.hajda@samsung.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Saeed Mahameed <saeedm@mellanox.com>,
 masahiroy@kernel.org, Laurent.pinchart@ideasonboard.com,
 linux-renesas-soc@vger.kernel.org, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@zonque.org, haojian.zhuang@gmail.com,
 robert.jarzmik@free.fr, daniel@ffwll.ch, marex@denx.de, stefan@agner.ch,
 linux-graphics-maintainer@vmware.com, thellstrom@vmware.com,
 jfrederich@gmail.com, dsd@laptop.org, geert@linux-m68k.org
Message-ID: <9cba223a-7255-4170-f7be-ba4f45bae5a7@suse.de>
Subject: Re: [PATCH 5/8] drm/vmwgfx: make framebuffer support optional
References: <20200417155553.675905-1-arnd@arndb.de>
 <20200417155553.675905-6-arnd@arndb.de>
In-Reply-To: <20200417155553.675905-6-arnd@arndb.de>

--9bkVbYw8uZtom442BoBKH6gzY8ZRJOq4V
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

IMHO, at some point console support will require a change where there's
a single config option enables/disables fbdev emulation for all drivers.
But this patch is a step in the right direction. Thanks!

Am 17.04.20 um 17:55 schrieb Arnd Bergmann:
> CONFIG_FB causes unnecessary Kconfig dependency problems when selected
> from another driver. Since it is already optional in vmwgfx at runtime,=

> turn this into a compile-time dependency so the support can be complete=
ly
> left out of the driver and enabled only if CONFIG_FB is explicitly
> selected in the configuration.
>=20
> When the FB support is built into the driver, it is turned on by
> default, but can still be disabled when loading the module.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/vmwgfx/Kconfig      | 17 +++++++-------
>  drivers/gpu/drm/vmwgfx/Makefile     |  4 +++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 35 +++++++++++++++++++----------=

>  3 files changed, 35 insertions(+), 21 deletions(-)

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

>=20
> diff --git a/drivers/gpu/drm/vmwgfx/Kconfig b/drivers/gpu/drm/vmwgfx/Kc=
onfig
> index 15acdf2a7c0f..b2835636991b 100644
> --- a/drivers/gpu/drm/vmwgfx/Kconfig
> +++ b/drivers/gpu/drm/vmwgfx/Kconfig
> @@ -2,12 +2,7 @@
>  config DRM_VMWGFX
>  	tristate "DRM driver for VMware Virtual GPU"
>  	depends on DRM && PCI && X86 && MMU
> -	select FB_DEFERRED_IO
> -	select FB_CFB_FILLRECT
> -	select FB_CFB_COPYAREA
> -	select FB_CFB_IMAGEBLIT
>  	select DRM_TTM
> -	select FB
>  	select MAPPING_DIRTY_HELPERS
>  	# Only needed for the transitional use of drm_crtc_init - can be remo=
ved
>  	# again once vmwgfx sets up the primary plane itself.
> @@ -20,9 +15,15 @@ config DRM_VMWGFX
>  	  The compiled module will be called "vmwgfx.ko".
> =20
>  config DRM_VMWGFX_FBCON
> -	depends on DRM_VMWGFX && FB
> -	bool "Enable framebuffer console under vmwgfx by default"
> +	bool "Enable framebuffer console under vmwgfx"
> +	depends on DRM_VMWGFX
> +	depends on FB=3Dy || FB=3DDRM_VMWGFX
> +	select FB_DEFERRED_IO
> +	select FB_CFB_FILLRECT
> +	select FB_CFB_COPYAREA
> +	select FB_CFB_IMAGEBLIT
>  	help
>  	   Choose this option if you are shipping a new vmwgfx
> -	   userspace driver that supports using the kernel driver.
> +	   userspace driver that supports using the kernel driver
> +	   and you have framebuffer support enabled.
> =20
> diff --git a/drivers/gpu/drm/vmwgfx/Makefile b/drivers/gpu/drm/vmwgfx/M=
akefile
> index 31f85f09f1fc..905ebabc79fc 100644
> --- a/drivers/gpu/drm/vmwgfx/Makefile
> +++ b/drivers/gpu/drm/vmwgfx/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  vmwgfx-y :=3D vmwgfx_execbuf.o vmwgfx_gmr.o vmwgfx_kms.o vmwgfx_drv.o =
\
> -	    vmwgfx_fb.o vmwgfx_ioctl.o vmwgfx_resource.o vmwgfx_ttm_buffer.o =
\
> +	    vmwgfx_ioctl.o vmwgfx_resource.o vmwgfx_ttm_buffer.o \
>  	    vmwgfx_fifo.o vmwgfx_irq.o vmwgfx_ldu.o vmwgfx_ttm_glue.o \
>  	    vmwgfx_overlay.o vmwgfx_marker.o vmwgfx_gmrid_manager.o \
>  	    vmwgfx_fence.o vmwgfx_bo.o vmwgfx_scrn.o vmwgfx_context.o \
> @@ -11,5 +11,7 @@ vmwgfx-y :=3D vmwgfx_execbuf.o vmwgfx_gmr.o vmwgfx_km=
s.o vmwgfx_drv.o \
>  	    vmwgfx_validation.o vmwgfx_page_dirty.o vmwgfx_streamoutput.o \
>  	    ttm_object.o ttm_lock.o
> =20
> +vmwgfx-$(CONFIG_DRM_VMWGFX_FBCON) +=3D vmwgfx_fb.o
> +
>  vmwgfx-$(CONFIG_TRANSPARENT_HUGEPAGE) +=3D vmwgfx_thp.o
>  obj-$(CONFIG_DRM_VMWGFX) :=3D vmwgfx.o
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwg=
fx/vmwgfx_drv.c
> index c2247a893ed4..a471a659b89d 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -258,7 +258,6 @@ static const struct pci_device_id vmw_pci_id_list[]=
 =3D {
>  };
>  MODULE_DEVICE_TABLE(pci, vmw_pci_id_list);
> =20
> -static int enable_fbdev =3D IS_ENABLED(CONFIG_DRM_VMWGFX_FBCON);
>  static int vmw_force_iommu;
>  static int vmw_restrict_iommu;
>  static int vmw_force_coherent;
> @@ -269,8 +268,21 @@ static int vmw_probe(struct pci_dev *, const struc=
t pci_device_id *);
>  static int vmwgfx_pm_notifier(struct notifier_block *nb, unsigned long=
 val,
>  			      void *ptr);
> =20
> +#ifdef CONFIG_DRM_VMWGFX_FBCON
> +static int enable_fbdev =3D 1;
>  MODULE_PARM_DESC(enable_fbdev, "Enable vmwgfx fbdev");
>  module_param_named(enable_fbdev, enable_fbdev, int, 0600);
> +static inline bool vmw_fb_enabled(struct vmw_private *dev_priv)
> +{
> +	return dev_priv->enable_fb;
> +}
> +#else
> +#define enable_fbdev 0
> +static inline bool vmw_fb_enabled(struct vmw_private *dev_priv)
> +{
> +	return false;
> +}
> +#endif
>  MODULE_PARM_DESC(force_dma_api, "Force using the DMA API for TTM pages=
");
>  module_param_named(force_dma_api, vmw_force_iommu, int, 0600);
>  MODULE_PARM_DESC(restrict_iommu, "Try to limit IOMMU usage for TTM pag=
es");
> @@ -669,7 +681,6 @@ static int vmw_driver_load(struct drm_device *dev, =
unsigned long chipset)
>  	dev_priv->mmio_start =3D pci_resource_start(dev->pdev, 2);
> =20
>  	dev_priv->assume_16bpp =3D !!vmw_assume_16bpp;
> -
>  	dev_priv->enable_fb =3D enable_fbdev;
> =20
>  	vmw_write(dev_priv, SVGA_REG_ID, SVGA_ID_2);
> @@ -945,7 +956,7 @@ static int vmw_driver_load(struct drm_device *dev, =
unsigned long chipset)
>  		VMWGFX_DRIVER_PATCHLEVEL);
>  	vmw_host_log(host_log);
> =20
> -	if (dev_priv->enable_fb) {
> +	if (vmw_fb_enabled(dev_priv)) {
>  		vmw_fifo_resource_inc(dev_priv);
>  		vmw_svga_enable(dev_priv);
>  		vmw_fb_init(dev_priv);
> @@ -1001,7 +1012,7 @@ static void vmw_driver_unload(struct drm_device *=
dev)
>  	if (dev_priv->ctx.res_ht_initialized)
>  		drm_ht_remove(&dev_priv->ctx.res_ht);
>  	vfree(dev_priv->ctx.cmd_bounce);
> -	if (dev_priv->enable_fb) {
> +	if (vmw_fb_enabled(dev_priv)) {
>  		vmw_fb_off(dev_priv);
>  		vmw_fb_close(dev_priv);
>  		vmw_fifo_resource_dec(dev_priv);
> @@ -1149,7 +1160,7 @@ static void vmw_master_drop(struct drm_device *de=
v,
>  	struct vmw_private *dev_priv =3D vmw_priv(dev);
> =20
>  	vmw_kms_legacy_hotspot_clear(dev_priv);
> -	if (!dev_priv->enable_fb)
> +	if (vmw_fb_enabled(dev_priv))
>  		vmw_svga_disable(dev_priv);
>  }
> =20
> @@ -1347,7 +1358,7 @@ static int vmw_pm_freeze(struct device *kdev)
>  		DRM_ERROR("Failed to freeze modesetting.\n");
>  		return ret;
>  	}
> -	if (dev_priv->enable_fb)
> +	if (vmw_fb_enabled(dev_priv))
>  		vmw_fb_off(dev_priv);
> =20
>  	ttm_suspend_lock(&dev_priv->reservation_sem);
> @@ -1355,18 +1366,18 @@ static int vmw_pm_freeze(struct device *kdev)
>  	vmw_resource_evict_all(dev_priv);
>  	vmw_release_device_early(dev_priv);
>  	ttm_bo_swapout_all(&dev_priv->bdev);
> -	if (dev_priv->enable_fb)
> +	if (vmw_fb_enabled(dev_priv))
>  		vmw_fifo_resource_dec(dev_priv);
>  	if (atomic_read(&dev_priv->num_fifo_resources) !=3D 0) {
>  		DRM_ERROR("Can't hibernate while 3D resources are active.\n");
> -		if (dev_priv->enable_fb)
> +		if (vmw_fb_enabled(dev_priv))
>  			vmw_fifo_resource_inc(dev_priv);
>  		WARN_ON(vmw_request_device_late(dev_priv));
>  		dev_priv->suspend_locked =3D false;
>  		ttm_suspend_unlock(&dev_priv->reservation_sem);
>  		if (dev_priv->suspend_state)
>  			vmw_kms_resume(dev);
> -		if (dev_priv->enable_fb)
> +		if (vmw_fb_enabled(dev_priv))
>  			vmw_fb_on(dev_priv);
>  		return -EBUSY;
>  	}
> @@ -1388,14 +1399,14 @@ static int vmw_pm_restore(struct device *kdev)
>  	vmw_write(dev_priv, SVGA_REG_ID, SVGA_ID_2);
>  	(void) vmw_read(dev_priv, SVGA_REG_ID);
> =20
> -	if (dev_priv->enable_fb)
> +	if (vmw_fb_enabled(dev_priv))
>  		vmw_fifo_resource_inc(dev_priv);
> =20
>  	ret =3D vmw_request_device(dev_priv);
>  	if (ret)
>  		return ret;
> =20
> -	if (dev_priv->enable_fb)
> +	if (vmw_fb_enabled(dev_priv))
>  		__vmw_svga_enable(dev_priv);
> =20
>  	vmw_fence_fifo_up(dev_priv->fman);
> @@ -1404,7 +1415,7 @@ static int vmw_pm_restore(struct device *kdev)
>  	if (dev_priv->suspend_state)
>  		vmw_kms_resume(dev_priv->dev);
> =20
> -	if (dev_priv->enable_fb)
> +	if (vmw_fb_enabled(dev_priv))
>  		vmw_fb_on(dev_priv);
> =20
>  	return 0;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--9bkVbYw8uZtom442BoBKH6gzY8ZRJOq4V--

--QjdARr8dfpLxynX6OA5uCzKDKiNzxQLlP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6dkJ0ACgkQaA3BHVML
eiNQIgf/e8s3ypOiYHxl2v7FJPYgv5qwsIV3nKEfaeOBK0t+T3O5Zn6LJyJ0gT1X
XZPW6d9baoxEy8AK0CoD7d6mjfyhRtm1CpVsIWQhVQ9lvlE3uQck24rinn3mMb7o
WOeOmeFSwDBEJKRex1zhHq8c2slsMbro6tcXv6zVB6ulgHcV35qroiRiSMORmOFi
udMO8P+5/b/Yf2rx9AUsFmsgk0rO/cpmdOJD1TIVlNEbl74r2FnrgbBo/CiertKa
y33VQU5WO6PB0wFYiXCMsFGoHc2ajD5Sacx4KdWd8L4w2yaAxeYouMvDI1R7whyi
NJMCrp1s+MvH9aTjVm8sinKmegJ5yg==
=eZG8
-----END PGP SIGNATURE-----

--QjdARr8dfpLxynX6OA5uCzKDKiNzxQLlP--

--===============0871134073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0871134073==--
