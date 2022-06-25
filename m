Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBA655A7AD
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 09:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597B3113112;
	Sat, 25 Jun 2022 07:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC2411310F
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 07:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=z0nitn4B9v5zpeQQaWoZzz9P5kB3Psorz5y+b8qRBIM=;
 b=fG2YAsw3HHG8xULJznmZP7xKc/i/DjWp/0GkpaRhpLoyMZqLabtI/V7HK19yk4VCs39MNfEuTh/uq
 dGaomNPqP9zHbPDpE2gUi/7EIiQw5McCt77/EGF5CJzqZ2kJJixoD7GVXd1AMRXQ23O96iJUp9ZJAd
 YakS8yUVbR0NrCOuyYdAsEfjTRC05I7iDFiIiNHXNtgYf3sszkAGGRvPva0IY0i4jDd3mIzR9F2nrr
 7d0mjD4+hXrgRWuT/DXOi2/Aekwj6yuFEvy3et1ry6gh6wz52l50riSO9p7Vf9Uk1eAzX0FHyCaSBh
 lVcDJghPWm5GF6k/Ao9WOHswgjzza9Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=z0nitn4B9v5zpeQQaWoZzz9P5kB3Psorz5y+b8qRBIM=;
 b=e7zpX2Vwfat2ZZMg66GRtYbcMvk2p5+gf5TT7CFxQOapzpjEgStRoIk8OG5LHU//0ei29zMUKI+Dv
 zC2eWxOCw==
X-HalOne-Cookie: b22300b4f68da3c893d0f914cb404dd23545a635
X-HalOne-ID: 8df00c07-f456-11ec-a6c4-d0431ea8a283
Received: from mailproxy4.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 8df00c07-f456-11ec-a6c4-d0431ea8a283;
 Sat, 25 Jun 2022 07:15:12 +0000 (UTC)
Date: Sat, 25 Jun 2022 09:15:11 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Kevin Brace <kevinbrace@gmx.com>
Subject: Re: [PATCH 11/28] drm/via: Add via_drv.c
Message-ID: <Yra1/7UltfzYc7Fz@ravnborg.org>
References: <20220624202633.3978-1-kevinbrace@gmx.com>
 <20220624202633.3978-12-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220624202633.3978-12-kevinbrace@gmx.com>
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kevin,

a few nitpicks in the following.

	Sam

On Fri, Jun 24, 2022 at 03:26:16PM -0500, Kevin Brace wrote:
> From: Kevin Brace <kevinbrace@bracecomputerlab.com>
> 
> Note that GPL is chosen as a license type.  This is due to via_i2c.c
> being GPL based.  Everything else is MIT license based.
It would be nice to have a re-written version of i2c so everything could
be MIT.

> 
> Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab.com>
> ---
>  drivers/gpu/drm/via/via_drv.c | 313 ++++++++++++++++++++++++++++++++++
>  1 file changed, 313 insertions(+)
>  create mode 100644 drivers/gpu/drm/via/via_drv.c
> 
> diff --git a/drivers/gpu/drm/via/via_drv.c b/drivers/gpu/drm/via/via_drv.c
> new file mode 100644
> index 000000000000..25d7967c938b
> --- /dev/null
> +++ b/drivers/gpu/drm/via/via_drv.c
> @@ -0,0 +1,313 @@
> +/*
> + * Copyright © 2019-2021 Kevin Brace.
> + * Copyright 2012 James Simmons. All Rights Reserved.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sub license,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the
> + * next paragraph) shall be included in all copies or substantial portions
> + * of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHOR(S) OR COPYRIGHT HOLDER(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> + * DEALINGS IN THE SOFTWARE.
Can you use the SPDX:
// SPDX-License-Identifier: GPL-2.0 OR MIT

> + *
> + * Author(s):
> + * Kevin Brace <kevinbrace@bracecomputerlab.com>
> + * James Simmons <jsimmons@infradead.org>
> + */
> +
> +#include <linux/pci.h>
> +
> +#include <drm/drm_aperture.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_gem.h>
> +#include <drm/drm_ioctl.h>
> +#include <drm/drm_pciids.h>
> +#include <drm/drm_prime.h>
> +
> +#include <drm/ttm/ttm_bo_api.h>
> +
> +#include "via_drv.h"
> +
> +
> +extern const struct drm_ioctl_desc via_driver_ioctls[];
> +
> +/*
> + * For now, this device driver will be disabled, unless the
> + * user decides to enable it.
> + */
> +int via_modeset = 0;
> +
> +MODULE_PARM_DESC(modeset, "Enable DRM device driver "
> +				"(Default: Disabled, "
> +				"0 = Disabled,"
> +				"1 = Enabled)");
> +module_param_named(modeset, via_modeset, int, 0400);
> +
> +static int via_driver_open(struct drm_device *dev,
> +					struct drm_file *file_priv)
> +{
> +	int ret = 0;
> +
> +	DRM_DEBUG_KMS("Entered %s.\n", __func__);
> +
> +	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
> +	return ret;
> +}
> +
> +static void via_driver_postclose(struct drm_device *dev,
> +					struct drm_file *file_priv)
> +{
> +	DRM_DEBUG_KMS("Entered %s.\n", __func__);
> +
> +	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
> +}
> +
> +static void via_driver_lastclose(struct drm_device *dev)
> +{
> +	DRM_DEBUG_KMS("Entered %s.\n", __func__);
> +
> +	drm_fb_helper_lastclose(dev);
> +
> +	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
> +}
The above three functions should be dropped as they are not needed.

> +
> +static int via_driver_dumb_create(struct drm_file *file_priv,
> +					struct drm_device *dev,
> +					struct drm_mode_create_dumb *args)
> +{
> +	struct ttm_buffer_object *ttm_bo;
> +	struct via_drm_priv *dev_priv = to_via_drm_priv(dev);
> +	struct via_bo *bo;
> +	uint32_t handle, pitch;
> +	uint64_t size;
> +	int ret;
> +
> +	DRM_DEBUG_KMS("Entered %s.\n", __func__);
> +
> +	/*
> +	 * Calculate the parameters for the dumb buffer.
> +	 */
> +	pitch = args->width * ((args->bpp + 7) >> 3);
> +	size = pitch * args->height;
> +
> +	ret = via_bo_create(dev, &dev_priv->bdev, size,
> +				ttm_bo_type_device, TTM_PL_VRAM, false, &bo);
> +	if (ret) {
> +		goto exit;
> +	}
> +
> +	ttm_bo = &bo->ttm_bo;
> +
> +	ret = drm_gem_handle_create(file_priv, &ttm_bo->base, &handle);
> +	drm_gem_object_put(&ttm_bo->base);
> +	if (ret) {
> +		via_bo_destroy(bo, false);
> +		goto exit;
> +	}
> +
> +	args->handle = handle;
> +	args->pitch = pitch;
> +	args->size = size;
> +exit:
> +	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
> +	return ret;
> +}
> +
> +static int via_driver_dumb_map_offset(struct drm_file *file_priv,
> +						struct drm_device *dev,
> +						uint32_t handle,
> +						uint64_t *offset)
> +{
> +	struct drm_gem_object *gem;
> +	struct ttm_buffer_object *ttm_bo;
> +	struct via_bo *bo;
> +	int ret = 0;
> +
> +	DRM_DEBUG_KMS("Entered %s.\n", __func__);
> +
> +	gem = drm_gem_object_lookup(file_priv, handle);
> +	if (!gem) {
> +		ret = -ENOENT;
> +		goto exit;
> +	}
> +
> +	ttm_bo = container_of(gem, struct ttm_buffer_object, base);
> +	bo = to_ttm_bo(ttm_bo);
> +	*offset = drm_vma_node_offset_addr(&ttm_bo->base.vma_node);
> +
> +	drm_gem_object_put(gem);
> +exit:
> +	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
> +	return ret;
> +}
> +
> +static const struct file_operations via_driver_fops = {
> +	.owner		= THIS_MODULE,
> +	.open		= drm_open,
> +	.release	= drm_release,
> +	.unlocked_ioctl = drm_ioctl,
> +	.mmap		= drm_gem_mmap,
> +	.poll		= drm_poll,
> +	.llseek		= noop_llseek,
> +};
There is a few macros that can be used here - like DEFINE_DRM_GEM_CMA_FOPS
Maybe this fits.

What I cannot grasp is the memory handling in the driver. There is a lot
of helpers around for gem, shm, tmm etc. and I wonder how much of the
helpers in drm apply to this driver.
This is obviously a question for the audience and not to Kevin.

> +
> +static struct drm_driver via_driver = {
> +	.driver_features = DRIVER_GEM |
> +				DRIVER_MODESET |
> +				DRIVER_ATOMIC,
> +	.open = via_driver_open,
> +	.postclose = via_driver_postclose,
> +	.lastclose = via_driver_lastclose,
> +	.gem_prime_mmap = drm_gem_prime_mmap,
> +	.dumb_create = via_driver_dumb_create,
> +	.dumb_map_offset = via_driver_dumb_map_offset,
> +	.ioctls = via_driver_ioctls,
> +	.fops = &via_driver_fops,
> +	.name = DRIVER_NAME,
> +	.desc = DRIVER_DESC,
> +	.date = DRIVER_DATE,
> +	.major = DRIVER_MAJOR,
> +	.minor = DRIVER_MINOR,
> +	.patchlevel = DRIVER_PATCHLEVEL,
> +};
> +
> +static struct pci_device_id via_pci_table[] = {
> +	viadrv_PCI_IDS,
> +};
> +
> +MODULE_DEVICE_TABLE(pci, via_pci_table);
> +
> +static int via_pci_probe(struct pci_dev *pdev,
> +				const struct pci_device_id *ent)
> +{
> +	struct drm_device *dev;
> +	struct via_drm_priv *dev_priv;
> +	int ret;
> +
> +	DRM_DEBUG_KMS("Entered %s.\n", __func__);
> +
> +	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev,
> +								&via_driver);
> +	if (ret) {
> +		goto exit;
> +	}
> +
> +	ret = pci_enable_device(pdev);
> +	if (ret) {
> +		goto exit;
> +	}
> +
> +	dev_priv = devm_drm_dev_alloc(&pdev->dev,
> +					&via_driver,
> +					struct via_drm_priv,
> +					dev);
> +	if (IS_ERR(dev_priv)) {
> +		ret = PTR_ERR(dev_priv);
> +		goto exit;
> +	}
> +
> +	dev = &dev_priv->dev;
> +
> +	pci_set_drvdata(pdev, dev);
> +
> +	ret = via_drm_init(dev);
> +	if (ret) {
> +		goto error_disable_pci;
> +	}
> +
> +	ret = drm_dev_register(dev, ent->driver_data);
> +	if (ret) {
> +		goto error_disable_pci;
> +	}
> +
> +	drm_fbdev_generic_setup(dev, 32);
> +	goto exit;
> +error_disable_pci:
> +	pci_disable_device(pdev);
> +exit:
> +	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
> +	return ret;
> +}
> +
> +static void via_pci_remove(struct pci_dev *pdev)
> +{
> +	struct drm_device *dev = pci_get_drvdata(pdev);
> +
> +	DRM_DEBUG_KMS("Entered %s.\n", __func__);
> +
> +	via_drm_fini(dev);
> +	drm_dev_unregister(dev);
> +
> +	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
> +}
> +
Use DEFINE_SIMPLE_DEV_PM_OPS(.., ..) here.
> +static const struct dev_pm_ops via_dev_pm_ops = {
> +	.suspend	= via_dev_pm_ops_suspend,
> +	.resume		= via_dev_pm_ops_resume,
> +};
> +
> +static struct pci_driver via_pci_driver = {
> +	.name		= DRIVER_NAME,
> +	.id_table	= via_pci_table,
> +	.probe		= via_pci_probe,
> +	.remove		= via_pci_remove,
> +	.driver.pm	= &via_dev_pm_ops,
> +};
> +
> +static int __init via_init(void)
> +{
> +	int ret = 0;
> +
> +	DRM_DEBUG_KMS("Entered %s.\n", __func__);
> +
> +	if ((via_modeset == -1) &&
> +		(drm_firmware_drivers_only())) {
> +		via_modeset = 0;
> +	}
> +
> +	if (!via_modeset) {
> +		ret = -EINVAL;
> +		goto exit;
> +	}
> +
> +	via_driver.num_ioctls = via_driver_num_ioctls;
> +
> +	ret = pci_register_driver(&via_pci_driver);
> +
> +exit:
> +	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
> +	return ret;
> +}
> +
> +static void __exit via_exit(void)
> +{
> +	DRM_DEBUG_KMS("Entered %s.\n", __func__);
> +
> +	if (!via_modeset) {
> +		goto exit;
> +	}
> +
> +	pci_unregister_driver(&via_pci_driver);
> +exit:
> +	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
> +}
> +
> +module_init(via_init);
> +module_exit(via_exit);
> +
> +MODULE_AUTHOR(DRIVER_AUTHOR);
> +MODULE_DESCRIPTION(DRIVER_DESC);
> +MODULE_LICENSE("GPL");
> --
> 2.35.1
