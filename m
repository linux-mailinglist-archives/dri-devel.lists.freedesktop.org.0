Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA1F76B3FF
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 13:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5561B10E3F2;
	Tue,  1 Aug 2023 11:56:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB1210E11E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 11:56:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E166561573;
 Tue,  1 Aug 2023 11:56:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD24DC433C8;
 Tue,  1 Aug 2023 11:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690890966;
 bh=dNbS2NfuAynBVMvuWl6D3a35wHrGyTN6rKb7IKHX1QI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CMeAMPLEtVG9PsP0rzkOIjCx5valOv/2IEWTZ0DRihnb7E0yHRfXzOaK3t6ajN951
 owMAbRdn7zl3L0s1Vs9qjC8NGxZlvqsUyzsfbJQiwcHN6fGotoudUxu/h6CY3JpR3Q
 NBZk0y0mO2hW0mvhO0QOmAEHpaGYbVOElkhESl/h0RmnaN96liG8AF0XkNukjAeBf3
 obn3T09EnuMAjb3btm/GMR10x42dtwhcDyN1PkePQXHR/PmMff5HHeTT30XVNbY8Gy
 4n4DjmxDaprQFm3+EgN/lbWf0/QwXS4774k0l3AaBJ2chLpi1nsGtcBgaGDjDSPvqc
 h4/CuyaxIKQ+w==
Date: Tue, 1 Aug 2023 13:56:03 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Subject: Re: [PATCH v1 v1 5/7] drm/vs: Register DRM device
Message-ID: <pug7eu7td6hq56jgr2ro2ql5exywed4pj4o4hgqiypxos6qqpz@dcaaqufqeayk>
References: <20230801101030.2040-1-keith.zhao@starfivetech.com>
 <20230801101030.2040-6-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xgoan7pmmnklpxdl"
Content-Disposition: inline
In-Reply-To: <20230801101030.2040-6-keith.zhao@starfivetech.com>
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Shengyang Chen <shengyang.chen@starfivetech.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jagan Teki <jagan@edgeble.ai>,
 linaro-mm-sig@lists.linaro.org, Rob Herring <robh+dt@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xgoan7pmmnklpxdl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 01, 2023 at 06:10:28PM +0800, Keith Zhao wrote:
> +#define DRV_NAME	"starfive"
> +#define DRV_DESC	"Starfive DRM driver"

Shouldn't it be verisilicon?

> +#define DRV_DATE	"202305161"
> +#define DRV_MAJOR	1
> +#define DRV_MINOR	0
> +
> +static struct platform_driver vs_drm_platform_driver;

You don't seem to need that forward declaration.

> +static const struct file_operations fops = {
> +	.owner			= THIS_MODULE,
> +	.open			= drm_open,
> +	.release		= drm_release,
> +	.unlocked_ioctl	= drm_ioctl,
> +	.compat_ioctl	= drm_compat_ioctl,
> +	.poll			= drm_poll,
> +	.read			= drm_read,
> +	.mmap			= drm_gem_mmap,
> +};
> +
> +static struct drm_driver vs_drm_driver = {
> +	.driver_features	= DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
> +	.lastclose		= drm_fb_helper_lastclose,
> +	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
> +	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> +	.gem_prime_import_sg_table = vs_gem_prime_import_sg_table,
> +	.gem_prime_mmap		= drm_gem_prime_mmap,
> +	.dumb_create		= vs_gem_dumb_create,
> +	.fops			= &fops,
> +	.name			= DRV_NAME,
> +	.desc			= DRV_DESC,
> +	.date			= DRV_DATE,
> +	.major			= DRV_MAJOR,
> +	.minor			= DRV_MINOR,
> +};
> +
> +void vs_drm_update_pitch_alignment(struct drm_device *drm_dev,
> +				   unsigned int alignment)
> +{
> +	struct vs_drm_private *priv = to_vs_dev(drm_dev);
> +
> +	if (alignment > priv->pitch_alignment)
> +		priv->pitch_alignment = alignment;
> +}
> +
> +static int vs_drm_bind(struct device *dev)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct vs_drm_private *priv;
> +	int ret;
> +	static u64 dma_mask = DMA_BIT_MASK(40);
> +	struct drm_device *drm_dev;
> +
> +	/* Remove existing drivers that may own the framebuffer memory. */
> +	ret = drm_aperture_remove_framebuffers(&vs_drm_driver);
> +	if (ret) {
> +		dev_err(dev,
> +			    "Failed to remove existing framebuffers - %d.\n",
> +			    ret);
> +		return ret;
> +	}
> +
> +	priv = devm_drm_dev_alloc(dev, &vs_drm_driver, struct vs_drm_private, base);
> +		if (IS_ERR(priv))
> +			return PTR_ERR(priv);
> +
> +	priv->pitch_alignment = 64;
> +	priv->dma_dev = priv->base.dev;
> +	priv->dma_dev->coherent_dma_mask = dma_mask;

dma_set_coherent_mask()

> +	drm_dev = &priv->base;
> +	platform_set_drvdata(pdev, drm_dev);
> +
> +	vs_mode_config_init(drm_dev);
> +
> +	/* Now try and bind all our sub-components */
> +	ret = component_bind_all(dev, drm_dev);
> +	if (ret)
> +		goto err_mode;
> +
> +	ret = drm_vblank_init(drm_dev, drm_dev->mode_config.num_crtc);
> +	if (ret)
> +		goto err_bind;
> +
> +	drm_mode_config_reset(drm_dev);
> +
> +	drm_kms_helper_poll_init(drm_dev);
> +
> +	ret = drm_dev_register(drm_dev, 0);
> +	if (ret)
> +		goto err_helper;
> +
> +	drm_fbdev_generic_setup(drm_dev, 32);
> +
> +	return 0;
> +
> +err_helper:
> +	drm_kms_helper_poll_fini(drm_dev);
> +err_bind:
> +	component_unbind_all(drm_dev->dev, drm_dev);
> +err_mode:
> +	drm_mode_config_cleanup(drm_dev);

If you're using drmm_mode_config_init this can go away.

> +
> +	return ret;
> +}
> +
> +static void vs_drm_unbind(struct device *dev)
> +{
> +	struct drm_device *drm_dev = dev_get_drvdata(dev);
> +
> +	drm_dev_unregister(drm_dev);
> +
> +	drm_kms_helper_poll_fini(drm_dev);
> +
> +	component_unbind_all(drm_dev->dev, drm_dev);
> +}
> +
> +static const struct component_master_ops vs_drm_ops = {
> +	.bind = vs_drm_bind,
> +	.unbind = vs_drm_unbind,
> +};
> +
> +static struct platform_driver *drm_sub_drivers[] = {
> +
> +
> +	/* connector + encoder*/
> +#ifdef CONFIG_STARFIVE_HDMI
> +	&starfive_hdmi_driver,
> +#endif
> +
> +};
> +
> +#define NUM_DRM_DRIVERS \
> +	(sizeof(drm_sub_drivers) / sizeof(struct platform_driver *))
> +
> +static int compare_dev(struct device *dev, void *data)
> +{
> +	return dev == (struct device *)data;
> +}
> +
> +static struct component_match *vs_drm_match_add(struct device *dev)
> +{
> +	struct component_match *match = NULL;
> +	int i;
> +
> +	for (i = 0; i < NUM_DRM_DRIVERS; ++i) {
> +		struct platform_driver *drv = drm_sub_drivers[i];
> +		struct device *p = NULL, *d;
> +
> +		while ((d = platform_find_device_by_driver(p, &drv->driver))) {
> +			put_device(p);
> +
> +			component_match_add(dev, &match, compare_dev, d);
> +			p = d;
> +		}
> +		put_device(p);
> +	}
> +
> +	return match ?: ERR_PTR(-ENODEV);
> +}
> +
> +static int vs_drm_platform_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct component_match *match;
> +
> +	match = vs_drm_match_add(dev);
> +	if (IS_ERR(match))
> +		return PTR_ERR(match);
> +
> +	return component_master_add_with_match(dev, &vs_drm_ops, match);
> +}
> +
> +static int vs_drm_platform_remove(struct platform_device *pdev)
> +{
> +	component_master_del(&pdev->dev, &vs_drm_ops);
> +	return 0;
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int vs_drm_suspend(struct device *dev)
> +{
> +	return drm_mode_config_helper_suspend(dev_get_drvdata(dev));
> +}
> +
> +static int vs_drm_resume(struct device *dev)
> +{
> +	drm_mode_config_helper_resume(dev_get_drvdata(dev));
> +
> +	return 0;
> +}
> +#endif
> +
> +static SIMPLE_DEV_PM_OPS(vs_drm_pm_ops, vs_drm_suspend, vs_drm_resume);
> +
> +static const struct of_device_id vs_drm_dt_ids[] = {
> +	{ .compatible = "starfive,display-subsystem", },
> +	{ },
> +};
> +
> +MODULE_DEVICE_TABLE(of, vs_drm_dt_ids);
> +
> +static struct platform_driver vs_drm_platform_driver = {
> +	.probe = vs_drm_platform_probe,
> +	.remove = vs_drm_platform_remove,
> +
> +	.driver = {
> +		.name = DRV_NAME,
> +		.of_match_table = vs_drm_dt_ids,
> +		.pm = &vs_drm_pm_ops,
> +	},
> +};
> +
> +static int __init vs_drm_init(void)
> +{
> +	int ret;
> +
> +	ret = platform_register_drivers(drm_sub_drivers, NUM_DRM_DRIVERS);
> +	if (ret)
> +		return ret;
> +
> +	ret = platform_driver_register(&vs_drm_platform_driver);
> +	if (ret)
> +		platform_unregister_drivers(drm_sub_drivers, NUM_DRM_DRIVERS);
> +
> +	return ret;
> +}
> +
> +static void __exit vs_drm_fini(void)
> +{
> +	platform_driver_unregister(&vs_drm_platform_driver);
> +	platform_unregister_drivers(drm_sub_drivers, NUM_DRM_DRIVERS);
> +}
> +
> +module_init(vs_drm_init);
> +module_exit(vs_drm_fini);
> +
> +MODULE_DESCRIPTION("VeriSilicon DRM Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/verisilicon/vs_drv.h b/drivers/gpu/drm/verisilicon/vs_drv.h
> new file mode 100644
> index 000000000..6ddc99dcf
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_drv.h
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
> + */
> +
> +#ifndef __VS_DRV_H__
> +#define __VS_DRV_H__
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/version.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_gem.h>
> +#include <drm/drm_managed.h>
> +
> +/*
> + *
> + * @dma_dev: device for DMA API.
> + *	- use the first attached device if support iommu
> +	else use drm device (only contiguous buffer support)
> + * @domain: iommu domain for DRM.
> + *	- all DC IOMMU share same domain to reduce mapping
> + * @pitch_alignment: buffer pitch alignment required by sub-devices.
> + *
> + */
> +struct vs_drm_private {
> +	struct drm_device base;
> +	struct device *dma_dev;
> +	struct iommu_domain *domain;
> +	unsigned int pitch_alignment;
> +};
> +
> +static inline struct vs_drm_private *
> +to_vs_dev(const struct drm_device *dev)
> +{
> +	return container_of(dev, struct vs_drm_private, base);
> +}
> +
> +void vs_drm_update_pitch_alignment(struct drm_device *drm_dev,
> +				   unsigned int alignment);
> +
> +
> +static inline bool is_iommu_enabled(struct drm_device *dev)
> +{
> +	struct vs_drm_private *priv = to_vs_dev(dev);
> +
> +	return priv->domain ? true : false;
> +}
> +
> +#ifdef CONFIG_STARFIVE_HDMI
> +extern struct platform_driver starfive_hdmi_driver;
> +#endif
> +
> +#endif /* __VS_DRV_H__ */
> diff --git a/drivers/gpu/drm/verisilicon/vs_gem.c b/drivers/gpu/drm/verisilicon/vs_gem.c
> new file mode 100644
> index 000000000..a7d5a5c7b
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_gem.c
> @@ -0,0 +1,298 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
> + */
> +
> +#include <linux/dma-buf.h>
> +#include <linux/of_reserved_mem.h>
> +#include <drm/drm_gem_dma_helper.h>
> +
> +#include "vs_drv.h"
> +#include "vs_gem.h"
> +
> +MODULE_IMPORT_NS(DMA_BUF);
> +
> +static const struct drm_gem_object_funcs vs_gem_default_funcs;
> +
> +static int vs_gem_alloc_buf(struct vs_gem_object *vs_obj)
> +{
> +	struct drm_device *dev = vs_obj->base.base.dev;
> +	unsigned int nr_pages;
> +	struct sg_table sgt;
> +	int ret = -ENOMEM;
> +
> +	if (vs_obj->base.dma_addr) {
> +		drm_dbg_kms(dev, "already allocated.\n");
> +		return 0;
> +	}
> +
> +	vs_obj->base.dma_addr = DMA_ATTR_WRITE_COMBINE | DMA_ATTR_FORCE_CONTIGUOUS
> +			   | DMA_ATTR_NO_KERNEL_MAPPING;
> +
> +	nr_pages = vs_obj->base.base.size >> PAGE_SHIFT;
> +
> +	vs_obj->pages = kvmalloc_array(nr_pages, sizeof(struct page *),
> +				       GFP_KERNEL | __GFP_ZERO);
> +	if (!vs_obj->pages)
> +		return -ENOMEM;
> +
> +	vs_obj->cookie = dma_alloc_attrs(dev->dev, vs_obj->base.base.size,
> +					 &vs_obj->base.dma_addr, GFP_KERNEL,
> +					 vs_obj->dma_attrs);
> +
> +	if (!vs_obj->cookie) {
> +		dev_err(dev->dev, "failed to allocate buffer.\n");
> +		goto err_free;
> +	}
> +
> +	vs_obj->iova = vs_obj->base.dma_addr;
> +
> +	ret = dma_get_sgtable_attrs(dev->dev, &sgt,
> +				    vs_obj->cookie, vs_obj->base.dma_addr,
> +				    vs_obj->base.base.size, vs_obj->dma_attrs);
> +	if (ret < 0) {
> +		dev_err(dev->dev, "failed to get sgtable.\n");
> +		goto err_mem_free;
> +	}
> +
> +	if (drm_prime_sg_to_page_array(&sgt, vs_obj->pages, nr_pages)) {
> +		dev_err(dev->dev, "invalid sgtable.\n");
> +		ret = -EINVAL;
> +		goto err_sgt_free;
> +	}
> +
> +	sg_free_table(&sgt);
> +
> +	return 0;
> +
> +err_sgt_free:
> +	sg_free_table(&sgt);
> +err_mem_free:
> +		dma_free_attrs(dev->dev, vs_obj->base.base.size, vs_obj->cookie,
> +			       vs_obj->base.dma_addr, vs_obj->dma_attrs);
> +err_free:
> +	kvfree(vs_obj->pages);
> +
> +	return ret;
> +}
> +
> +static void vs_gem_free_buf(struct vs_gem_object *vs_obj)
> +{
> +	struct drm_device *dev = vs_obj->base.base.dev;
> +
> +	if (!vs_obj->base.dma_addr) {
> +		drm_dbg_kms(dev, "dma_addr is invalid.\n");
> +		return;
> +	}
> +
> +	dma_free_attrs(dev->dev, vs_obj->base.base.size, vs_obj->cookie,
> +		       (dma_addr_t)vs_obj->base.dma_addr,
> +		       vs_obj->dma_attrs);
> +
> +	kvfree(vs_obj->pages);
> +}
> +
> +static void vs_gem_free_object(struct drm_gem_object *obj)
> +{
> +	struct vs_gem_object *vs_obj = to_vs_gem_object(obj);
> +
> +	if (obj->import_attach)
> +		drm_prime_gem_destroy(obj, vs_obj->base.sgt);
> +	else
> +		vs_gem_free_buf(vs_obj);
> +
> +	drm_gem_object_release(obj);
> +
> +	kfree(vs_obj);
> +}
> +
> +static struct vs_gem_object *vs_gem_alloc_object(struct drm_device *dev,
> +						 size_t size)
> +{
> +	struct vs_gem_object *vs_obj;
> +	struct drm_gem_object *obj;
> +	int ret;
> +
> +	vs_obj = kzalloc(sizeof(*vs_obj), GFP_KERNEL);
> +	if (!vs_obj)
> +		return ERR_PTR(-ENOMEM);
> +
> +	vs_obj->base.base.size = size;
> +	obj = &vs_obj->base.base;
> +
> +	ret = drm_gem_object_init(dev, obj, size);
> +	if (ret)
> +		goto err_free;
> +
> +	vs_obj->base.base.funcs = &vs_gem_default_funcs;
> +
> +	ret = drm_gem_create_mmap_offset(obj);
> +	if (ret) {
> +		drm_gem_object_release(obj);
> +		goto err_free;
> +	}
> +
> +	return vs_obj;
> +
> +err_free:
> +	kfree(vs_obj);
> +	return ERR_PTR(ret);
> +}
> +
> +static struct vs_gem_object *vs_gem_create_object(struct drm_device *dev,
> +						  size_t size)
> +{
> +	struct vs_gem_object *vs_obj;
> +	int ret;
> +
> +	size = PAGE_ALIGN(size);
> +
> +	vs_obj = vs_gem_alloc_object(dev, size);
> +	if (IS_ERR(vs_obj))
> +		return vs_obj;
> +
> +	ret = vs_gem_alloc_buf(vs_obj);
> +	if (ret) {
> +		drm_gem_object_release(&vs_obj->base.base);
> +		kfree(vs_obj);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return vs_obj;
> +}
> +
> +static struct vs_gem_object *vs_gem_create_with_handle(struct drm_device *dev,
> +						       struct drm_file *file,
> +						       size_t size,
> +						       unsigned int *handle)
> +{
> +	struct vs_gem_object *vs_obj;
> +	struct drm_gem_object *obj;
> +	int ret;
> +
> +	vs_obj = vs_gem_create_object(dev, size);
> +	if (IS_ERR(vs_obj))
> +		return vs_obj;
> +
> +	obj = &vs_obj->base.base;
> +
> +	ret = drm_gem_handle_create(file, obj, handle);
> +
> +	drm_gem_object_put(obj);
> +
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return vs_obj;
> +}
> +
> +static struct sg_table *vs_gem_prime_get_sg_table(struct drm_gem_object *obj)
> +{
> +	struct vs_gem_object *vs_obj = to_vs_gem_object(obj);
> +
> +	return drm_prime_pages_to_sg(obj->dev, vs_obj->pages,
> +					 vs_obj->base.base.size >> PAGE_SHIFT);
> +}
> +
> +static int vs_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
> +{
> +	struct vs_gem_object *vs_obj = to_vs_gem_object(obj);
> +
> +	vs_obj->base.vaddr = vs_obj->dma_attrs & DMA_ATTR_NO_KERNEL_MAPPING ?
> +		       page_address(vs_obj->cookie) : vs_obj->cookie;
> +
> +	return drm_gem_dma_vmap(&vs_obj->base, map);
> +}

This looks *very* similar to the GEM DMA ops. Why do you need to roll
your own?

> +static const struct vm_operations_struct vs_vm_ops = {
> +	.open  = drm_gem_vm_open,
> +	.close = drm_gem_vm_close,
> +};
> +
> +static const struct drm_gem_object_funcs vs_gem_default_funcs = {
> +	.free = vs_gem_free_object,
> +	.get_sg_table = vs_gem_prime_get_sg_table,
> +	.vmap = vs_gem_prime_vmap,
> +	.mmap = drm_gem_dma_object_mmap,
> +	.vm_ops = &vs_vm_ops,
> +};
> +
> +int vs_gem_dumb_create(struct drm_file *file,
> +		       struct drm_device *dev,
> +		       struct drm_mode_create_dumb *args)
> +{
> +	struct vs_drm_private *priv = to_vs_dev(dev);
> +	struct vs_gem_object *vs_obj;
> +	unsigned int pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
> +
> +	if (args->bpp % 10)
> +		args->pitch = ALIGN(pitch, priv->pitch_alignment);
> +	else
> +		/* for costum 10bit format with no bit gaps */
> +		args->pitch = pitch;
> +	args->size = PAGE_ALIGN(args->pitch * args->height);
> +	vs_obj = vs_gem_create_with_handle(dev, file, args->size,
> +					   &args->handle);
> +	return PTR_ERR_OR_ZERO(vs_obj);
> +}
> +
> +struct drm_gem_object *
> +vs_gem_prime_import_sg_table(struct drm_device *dev,
> +			     struct dma_buf_attachment *attach,
> +			     struct sg_table *sgt)
> +{
> +	struct vs_gem_object *vs_obj;
> +	int npages;
> +	int ret;
> +	struct scatterlist *s;
> +	u32 i;
> +	dma_addr_t expected;
> +	size_t size = attach->dmabuf->size;
> +
> +	size = PAGE_ALIGN(size);
> +
> +	vs_obj = vs_gem_alloc_object(dev, size);
> +	if (IS_ERR(vs_obj))
> +		return ERR_CAST(vs_obj);
> +
> +	expected = sg_dma_address(sgt->sgl);
> +	for_each_sg(sgt->sgl, s, sgt->nents, i) {
> +		if (sg_dma_address(s) != expected) {
> +			DRM_ERROR("sg_table is not contiguous");
> +			ret = -EINVAL;
> +			goto err;
> +		}
> +		if (sg_dma_len(s) & (PAGE_SIZE - 1)) {
> +			ret = -EINVAL;
> +			goto err;
> +		}
> +		if (i == 0)
> +			vs_obj->iova = sg_dma_address(s);
> +		expected = sg_dma_address(s) + sg_dma_len(s);
> +	}
> +
> +	vs_obj->base.dma_addr = sg_dma_address(sgt->sgl);
> +
> +	npages = vs_obj->base.base.size >> PAGE_SHIFT;
> +	vs_obj->pages = kvmalloc_array(npages, sizeof(struct page *),
> +				       GFP_KERNEL);
> +	if (!vs_obj->pages) {
> +		ret = -ENOMEM;
> +		goto err;
> +	}
> +
> +	ret = drm_prime_sg_to_page_array(sgt, vs_obj->pages, npages);
> +	if (ret)
> +		goto err_free_page;
> +
> +	vs_obj->base.sgt = sgt;
> +
> +	return &vs_obj->base.base;
> +
> +err_free_page:
> +	kvfree(vs_obj->pages);
> +err:
> +	vs_gem_free_object(&vs_obj->base.base);
> +
> +	return ERR_PTR(ret);
> +}

Ditto

Maxime

--xgoan7pmmnklpxdl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZMjy0wAKCRDj7w1vZxhR
xRUZAP9dZyJpqxh/3iQ/mPjhJ/AtpK09jOTCpAyvsEFdRUG0cwEA2CuBuXIpi5YA
UZr6SAwxgR9YosUtfdXawp3OeGo5iQM=
=0QzG
-----END PGP SIGNATURE-----

--xgoan7pmmnklpxdl--
