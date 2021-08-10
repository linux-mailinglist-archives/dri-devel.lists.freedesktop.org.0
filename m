Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 635243E7CF4
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 18:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC186E045;
	Tue, 10 Aug 2021 16:00:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 893706E045
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 16:00:29 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso2320638wmg.4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 09:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wEBNOuULbonlBX66+WtmXYjvzCxn7CstM1XVkP+RaGE=;
 b=VM95yTf+4s3dBVENaBBNRrZQaGHbqsIeryNDctZDk/P3B3AvopL5K6mfLv/otNIFR4
 8LUqM2TkuOg5znoB+QSuiNetb5lJoimAxQcXQv5jV2vYqPNMAXbdvn79QwSLlAqNTM0H
 gQVksJ4i0wK/Mbh3uR8pCDMJYR8J6j89G1ajCV7tgjdw2yvNY5Ws9UDwLofd7z/k9bVG
 LPhbchZgpQyqPWeCphZXDZTBZjfKLA7W+8AkJXsEvL598w+eaETA83OdMtfoI8Cu5OOh
 9nbXuPrxxzIb4HLtrzcK5qBdjElY+/95CiEGvHR1bMcMR8PpI9lFlGPUyIm/sPOB0hWe
 1t6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wEBNOuULbonlBX66+WtmXYjvzCxn7CstM1XVkP+RaGE=;
 b=FNw3HMUYD8ZqGLL1sgrGYWcnyuzwsvroUfLJYbcORNu1gMhHxrAmrh7uE+97BSw7P4
 EqieC+OKrAbASOCv3vyeS6/u0MahHjiiXTeyAfrNy2ECJZ/9mnQIcaycvjiz557L+igW
 79/R4/E5FsUSJ6oodvaWF/VZItuogecPr0wblitVXVD4BtvW1zdWhhgpcpeRO1krqVmL
 oT4ziJO/moVUdkmeH7TJjsxNa6pNjLHBUuk4gs5gMmwQhwMp6g9iBN1thYnTYtuUdUvW
 iijDBtXrW6e8n1WRxnyL63vt92OypZFYnR9ToUImHvAMaBcwklZvh6iFqr41lpq+0waZ
 Ha0g==
X-Gm-Message-State: AOAM5322lb6ONEXSoeghu6q3UjjgqiLlA01DXTEv610llv2a6hdtvywu
 z2QjkLU1I3nV08M64ASCkVk=
X-Google-Smtp-Source: ABdhPJxXtK9rfEqGNnHRk4b/CTLfWzfnj+1dYpWworDPdZw02NbKGa+NUBPdNu5SM3XEVjX22NBapg==
X-Received: by 2002:a1c:7706:: with SMTP id t6mr7871704wmi.30.1628611228062;
 Tue, 10 Aug 2021 09:00:28 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id u5sm6760715wrr.94.2021.08.10.09.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 09:00:26 -0700 (PDT)
Date: Tue, 10 Aug 2021 18:02:52 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] drm/tegra: Add NVDEC driver
Message-ID: <YRKjLOqBpxBzG62a@orome.fritz.box>
References: <20210806123450.2970777-1-mperttunen@nvidia.com>
 <20210806123450.2970777-4-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VPqa6mWmG7/oyOgx"
Content-Disposition: inline
In-Reply-To: <20210806123450.2970777-4-mperttunen@nvidia.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
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


--VPqa6mWmG7/oyOgx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 06, 2021 at 03:34:50PM +0300, Mikko Perttunen wrote:
> Add support for booting and using NVDEC on Tegra210, Tegra186
> and Tegra194 to the Host1x and TegraDRM drivers. Booting in
> secure mode is not currently supported.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v2:
> * Use devm_platform_get_and_ioremap_resource
> * Remove reset handling, done by power domain code
> * Assume runtime PM is enabled
> ---
>  drivers/gpu/drm/tegra/Makefile |   3 +-
>  drivers/gpu/drm/tegra/drm.c    |   4 +
>  drivers/gpu/drm/tegra/drm.h    |   1 +
>  drivers/gpu/drm/tegra/nvdec.c  | 473 +++++++++++++++++++++++++++++++++
>  drivers/gpu/host1x/dev.c       |  18 ++
>  include/linux/host1x.h         |   2 +
>  6 files changed, 500 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/tegra/nvdec.c
>=20
> diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Makef=
ile
> index 5d2039f0c734..b248c631f790 100644
> --- a/drivers/gpu/drm/tegra/Makefile
> +++ b/drivers/gpu/drm/tegra/Makefile
> @@ -24,7 +24,8 @@ tegra-drm-y :=3D \
>  	gr2d.o \
>  	gr3d.o \
>  	falcon.o \
> -	vic.o
> +	vic.o \
> +	nvdec.o
> =20
>  tegra-drm-y +=3D trace.o
> =20
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index b20fd0833661..5f5afd7ba37e 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -1337,15 +1337,18 @@ static const struct of_device_id host1x_drm_subde=
vs[] =3D {
>  	{ .compatible =3D "nvidia,tegra210-sor", },
>  	{ .compatible =3D "nvidia,tegra210-sor1", },
>  	{ .compatible =3D "nvidia,tegra210-vic", },
> +	{ .compatible =3D "nvidia,tegra210-nvdec", },
>  	{ .compatible =3D "nvidia,tegra186-display", },
>  	{ .compatible =3D "nvidia,tegra186-dc", },
>  	{ .compatible =3D "nvidia,tegra186-sor", },
>  	{ .compatible =3D "nvidia,tegra186-sor1", },
>  	{ .compatible =3D "nvidia,tegra186-vic", },
> +	{ .compatible =3D "nvidia,tegra186-nvdec", },
>  	{ .compatible =3D "nvidia,tegra194-display", },
>  	{ .compatible =3D "nvidia,tegra194-dc", },
>  	{ .compatible =3D "nvidia,tegra194-sor", },
>  	{ .compatible =3D "nvidia,tegra194-vic", },
> +	{ .compatible =3D "nvidia,tegra194-nvdec", },
>  	{ /* sentinel */ }
>  };
> =20
> @@ -1369,6 +1372,7 @@ static struct platform_driver * const drivers[] =3D=
 {
>  	&tegra_gr2d_driver,
>  	&tegra_gr3d_driver,
>  	&tegra_vic_driver,
> +	&tegra_nvdec_driver,
>  };
> =20
>  static int __init host1x_drm_init(void)
> diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
> index 8b28327c931c..fc0a19554eac 100644
> --- a/drivers/gpu/drm/tegra/drm.h
> +++ b/drivers/gpu/drm/tegra/drm.h
> @@ -202,5 +202,6 @@ extern struct platform_driver tegra_sor_driver;
>  extern struct platform_driver tegra_gr2d_driver;
>  extern struct platform_driver tegra_gr3d_driver;
>  extern struct platform_driver tegra_vic_driver;
> +extern struct platform_driver tegra_nvdec_driver;
> =20
>  #endif /* HOST1X_DRM_H */
> diff --git a/drivers/gpu/drm/tegra/nvdec.c b/drivers/gpu/drm/tegra/nvdec.c
> new file mode 100644
> index 000000000000..4a58b5357473
> --- /dev/null
> +++ b/drivers/gpu/drm/tegra/nvdec.c
> @@ -0,0 +1,473 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2015-2021, NVIDIA Corporation.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/host1x.h>
> +#include <linux/iommu.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +
> +#include <soc/tegra/pmc.h>
> +
> +#include "drm.h"
> +#include "falcon.h"
> +#include "vic.h"
> +
> +struct nvdec_config {
> +	const char *firmware;
> +	unsigned int version;
> +	bool supports_sid;
> +	int num_instances;

This can be unsigned int.

> +};
> +
> +struct nvdec {
> +	struct falcon falcon;
> +
> +	void __iomem *regs;
> +	struct tegra_drm_client client;

Traditionally this goes first to make the to_nvdec() cast helper a
no-op. But I see that we also got this wrong for VIC, and that's
probably where you copied this from. So nevermind, we can fix that
in a later patch.

> +	struct host1x_channel *channel;
> +	struct device *dev;
> +	struct clk *clk;
> +
> +	/* Platform configuration */
> +	const struct nvdec_config *config;
> +};
> +
> +static inline struct nvdec *to_nvdec(struct tegra_drm_client *client)
> +{
> +	return container_of(client, struct nvdec, client);
> +}
> +
> +static void nvdec_writel(struct nvdec *nvdec, u32 value, unsigned int of=
fset)
> +{
> +	writel(value, nvdec->regs + offset);
> +}
> +
> +static int nvdec_boot(struct nvdec *nvdec)
> +{
> +#ifdef CONFIG_IOMMU_API
> +	struct iommu_fwspec *spec =3D dev_iommu_fwspec_get(nvdec->dev);
> +#endif
> +	int err =3D 0;

Why does this need to be initialized?

> +
> +#ifdef CONFIG_IOMMU_API
> +	if (nvdec->config->supports_sid && spec) {
> +		u32 value;
> +
> +		value =3D TRANSCFG_ATT(1, TRANSCFG_SID_FALCON) |
> +			TRANSCFG_ATT(0, TRANSCFG_SID_HW);

This fits on a single line. The limit of characters per line was
recently bumped to 100.

> +		nvdec_writel(nvdec, value, VIC_TFBIF_TRANSCFG);
> +
> +		if (spec->num_ids > 0) {
> +			value =3D spec->ids[0] & 0xffff;
> +
> +			nvdec_writel(nvdec, value, VIC_THI_STREAMID0);
> +			nvdec_writel(nvdec, value, VIC_THI_STREAMID1);
> +		}
> +	}
> +#endif
> +
> +	err =3D falcon_boot(&nvdec->falcon);
> +	if (err < 0)
> +		return err;
> +
> +	err =3D falcon_wait_idle(&nvdec->falcon);
> +	if (err < 0) {
> +		dev_err(nvdec->dev,
> +			"failed to set application ID and FCE base\n");

Same here.

> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int nvdec_init(struct host1x_client *client)
> +{
> +	struct tegra_drm_client *drm =3D host1x_to_drm_client(client);
> +	struct drm_device *dev =3D dev_get_drvdata(client->host);
> +	struct tegra_drm *tegra =3D dev->dev_private;
> +	struct nvdec *nvdec =3D to_nvdec(drm);
> +	int err;
> +
> +	err =3D host1x_client_iommu_attach(client);
> +	if (err < 0 && err !=3D -ENODEV) {
> +		dev_err(nvdec->dev, "failed to attach to domain: %d\n", err);
> +		return err;
> +	}
> +
> +	nvdec->channel =3D host1x_channel_request(client);
> +	if (!nvdec->channel) {
> +		err =3D -ENOMEM;
> +		goto detach;
> +	}
> +
> +	client->syncpts[0] =3D host1x_syncpt_request(client, 0);
> +	if (!client->syncpts[0]) {
> +		err =3D -ENOMEM;
> +		goto free_channel;
> +	}
> +
> +	err =3D tegra_drm_register_client(tegra, drm);
> +	if (err < 0)
> +		goto free_syncpt;
> +
> +	/*
> +	 * Inherit the DMA parameters (such as maximum segment size) from the
> +	 * parent host1x device.
> +	 */
> +	client->dev->dma_parms =3D client->host->dma_parms;
> +
> +	return 0;
> +
> +free_syncpt:
> +	host1x_syncpt_put(client->syncpts[0]);
> +free_channel:
> +	host1x_channel_put(nvdec->channel);
> +detach:
> +	host1x_client_iommu_detach(client);
> +
> +	return err;
> +}
> +
> +static int nvdec_exit(struct host1x_client *client)
> +{
> +	struct tegra_drm_client *drm =3D host1x_to_drm_client(client);
> +	struct drm_device *dev =3D dev_get_drvdata(client->host);
> +	struct tegra_drm *tegra =3D dev->dev_private;
> +	struct nvdec *nvdec =3D to_nvdec(drm);
> +	int err;
> +
> +	/* avoid a dangling pointer just in case this disappears */
> +	client->dev->dma_parms =3D NULL;
> +
> +	err =3D tegra_drm_unregister_client(tegra, drm);
> +	if (err < 0)
> +		return err;
> +
> +	host1x_syncpt_put(client->syncpts[0]);
> +	host1x_channel_put(nvdec->channel);
> +	host1x_client_iommu_detach(client);
> +
> +	if (client->group) {
> +		dma_unmap_single(nvdec->dev, nvdec->falcon.firmware.phys,
> +				 nvdec->falcon.firmware.size, DMA_TO_DEVICE);
> +		tegra_drm_free(tegra, nvdec->falcon.firmware.size,
> +			       nvdec->falcon.firmware.virt,
> +			       nvdec->falcon.firmware.iova);
> +	} else {
> +		dma_free_coherent(nvdec->dev, nvdec->falcon.firmware.size,
> +				  nvdec->falcon.firmware.virt,
> +				  nvdec->falcon.firmware.iova);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct host1x_client_ops nvdec_client_ops =3D {
> +	.init =3D nvdec_init,
> +	.exit =3D nvdec_exit,
> +};
> +
> +static int nvdec_load_firmware(struct nvdec *nvdec)
> +{
> +	struct host1x_client *client =3D &nvdec->client.base;
> +	struct tegra_drm *tegra =3D nvdec->client.drm;
> +	dma_addr_t iova;
> +	size_t size;
> +	void *virt;
> +	int err;
> +
> +	if (nvdec->falcon.firmware.virt)
> +		return 0;
> +
> +	err =3D falcon_read_firmware(&nvdec->falcon, nvdec->config->firmware);
> +	if (err < 0)
> +		return err;
> +
> +	size =3D nvdec->falcon.firmware.size;
> +
> +	if (!client->group) {
> +		virt =3D dma_alloc_coherent(nvdec->dev, size, &iova, GFP_KERNEL);
> +
> +		err =3D dma_mapping_error(nvdec->dev, iova);
> +		if (err < 0)
> +			return err;
> +	} else {
> +		virt =3D tegra_drm_alloc(tegra, size, &iova);
> +	}
> +
> +	nvdec->falcon.firmware.virt =3D virt;
> +	nvdec->falcon.firmware.iova =3D iova;
> +
> +	err =3D falcon_load_firmware(&nvdec->falcon);
> +	if (err < 0)
> +		goto cleanup;
> +
> +	/*
> +	 * In this case we have received an IOVA from the shared domain, so we
> +	 * need to make sure to get the physical address so that the DMA API
> +	 * knows what memory pages to flush the cache for.
> +	 */
> +	if (client->group) {
> +		dma_addr_t phys;
> +
> +		phys =3D dma_map_single(nvdec->dev, virt, size, DMA_TO_DEVICE);
> +
> +		err =3D dma_mapping_error(nvdec->dev, phys);
> +		if (err < 0)
> +			goto cleanup;
> +
> +		nvdec->falcon.firmware.phys =3D phys;
> +	}
> +
> +	return 0;
> +
> +cleanup:
> +	if (!client->group)
> +		dma_free_coherent(nvdec->dev, size, virt, iova);
> +	else
> +		tegra_drm_free(tegra, size, virt, iova);
> +
> +	return err;
> +}
> +
> +
> +static int nvdec_runtime_resume(struct device *dev)
> +{
> +	struct nvdec *nvdec =3D dev_get_drvdata(dev);
> +	int err;
> +
> +	err =3D clk_prepare_enable(nvdec->clk);
> +	if (err < 0)
> +		return err;
> +
> +	usleep_range(10, 20);
> +
> +	err =3D nvdec_load_firmware(nvdec);
> +	if (err < 0)
> +		goto disable;
> +
> +	err =3D nvdec_boot(nvdec);
> +	if (err < 0)
> +		goto disable;
> +
> +	return 0;
> +
> +disable:
> +	clk_disable_unprepare(nvdec->clk);
> +	return err;
> +}
> +
> +static int nvdec_runtime_suspend(struct device *dev)
> +{
> +	struct nvdec *nvdec =3D dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(nvdec->clk);
> +
> +	return 0;
> +}
> +
> +static int nvdec_open_channel(struct tegra_drm_client *client,
> +			    struct tegra_drm_context *context)
> +{
> +	struct nvdec *nvdec =3D to_nvdec(client);
> +	int err;
> +
> +	err =3D pm_runtime_get_sync(nvdec->dev);
> +	if (err < 0) {
> +		pm_runtime_put(nvdec->dev);
> +		return err;
> +	}
> +
> +	context->channel =3D host1x_channel_get(nvdec->channel);
> +	if (!context->channel) {
> +		pm_runtime_put(nvdec->dev);
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static void nvdec_close_channel(struct tegra_drm_context *context)
> +{
> +	struct nvdec *nvdec =3D to_nvdec(context->client);
> +
> +	host1x_channel_put(context->channel);
> +	pm_runtime_put(nvdec->dev);
> +}
> +
> +static const struct tegra_drm_client_ops nvdec_ops =3D {
> +	.open_channel =3D nvdec_open_channel,
> +	.close_channel =3D nvdec_close_channel,
> +	.submit =3D tegra_drm_submit,
> +};
> +
> +#define NVIDIA_TEGRA_210_NVDEC_FIRMWARE "nvidia/tegra210/nvdec.bin"
> +
> +static const struct nvdec_config nvdec_t210_config =3D {
> +	.firmware =3D NVIDIA_TEGRA_210_NVDEC_FIRMWARE,
> +	.version =3D 0x21,
> +	.supports_sid =3D false,
> +};
> +
> +#define NVIDIA_TEGRA_186_NVDEC_FIRMWARE "nvidia/tegra186/nvdec.bin"
> +
> +static const struct nvdec_config nvdec_t186_config =3D {
> +	.firmware =3D NVIDIA_TEGRA_186_NVDEC_FIRMWARE,
> +	.version =3D 0x18,
> +	.supports_sid =3D true,
> +};

Shouldn't the above both have .num_instances =3D 1?

> +
> +#define NVIDIA_TEGRA_194_NVDEC_FIRMWARE "nvidia/tegra194/nvdec.bin"
> +
> +static const struct nvdec_config nvdec_t194_config =3D {
> +	.firmware =3D NVIDIA_TEGRA_194_NVDEC_FIRMWARE,
> +	.version =3D 0x19,
> +	.supports_sid =3D true,

And shouldn't this have .num_instances =3D 2?

> +};
> +
> +static const struct of_device_id tegra_nvdec_of_match[] =3D {
> +	{ .compatible =3D "nvidia,tegra210-nvdec", .data =3D &nvdec_t210_config=
 },
> +	{ .compatible =3D "nvidia,tegra186-nvdec", .data =3D &nvdec_t186_config=
 },
> +	{ .compatible =3D "nvidia,tegra194-nvdec", .data =3D &nvdec_t194_config=
 },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, tegra_nvdec_of_match);
> +
> +static int nvdec_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct host1x_syncpt **syncpts;
> +	struct nvdec *nvdec;
> +	u32 instance;
> +	int err;
> +
> +	/* inherit DMA mask from host1x parent */
> +	err =3D dma_coerce_mask_and_coherent(dev, *dev->parent->dma_mask);
> +	if (err < 0) {
> +		dev_err(&pdev->dev, "failed to set DMA mask: %d\n", err);
> +		return err;
> +	}
> +
> +	nvdec =3D devm_kzalloc(dev, sizeof(*nvdec), GFP_KERNEL);
> +	if (!nvdec)
> +		return -ENOMEM;
> +
> +	nvdec->config =3D of_device_get_match_data(dev);
> +
> +	syncpts =3D devm_kzalloc(dev, sizeof(*syncpts), GFP_KERNEL);
> +	if (!syncpts)
> +		return -ENOMEM;
> +
> +	nvdec->regs =3D devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
> +	if (IS_ERR(nvdec->regs))
> +		return PTR_ERR(nvdec->regs);
> +
> +	nvdec->clk =3D devm_clk_get(dev, NULL);
> +	if (IS_ERR(nvdec->clk)) {
> +		dev_err(&pdev->dev, "failed to get clock\n");
> +		return PTR_ERR(nvdec->clk);
> +	}
> +
> +	err =3D of_property_read_u32(dev->of_node, "nvidia,instance", &instance=
);
> +	if (err < 0)
> +		instance =3D 0;
> +
> +	if (instance > nvdec->config->num_instances)
> +		return -EINVAL;

I assume nvidia,instance is zero-based? Shouldn't this then be:

	if (instance >=3D nvdec->config->num_instances)

instead? With the current code, a second instance (nvidia,instance =3D
<1>) would be accepted, even if the SoC only supported a single
instance.

Thierry

--VPqa6mWmG7/oyOgx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmESoykACgkQ3SOs138+
s6Gfww/9G15WmhCkYcQloKlhRjgh/fgjWtQny/pcwGlHEXbXd+tNzKMzvTkX5mNM
RkeYWv4Ibwiv7jRm3cKh/w44GYKFe+7yxjPo76gTpyjfBEAisJC5862J7IKq8o/Y
Au7vdaEyG0VR5KCYadyiDzI06tAuZgIg2cAJl+wB3DYbKmR4xRE0Fq4kxaTK2CZL
sBAYzvt6IungP36Nq/nl+W4oHecIe/r8qE8RkZFxTenG+8uTUtHjtiuIdLGCHnyU
aivu87uRvRjSgS1XJEAl4SUhsinYv/CJU0k6e7cvcEJZazpmqqe5AVvqgWPcNMY5
o2T4oGJuyt+i3PYrx0OO/FoUz1j8rJMoZ6QixaF647vSNp1Yxe+WPkMXz98r1a9i
1nORdrV4C+6/O1bcmMX7fR3ZlJc5QNrkbkFrG6hFZg4FrHo00MZPlCxGb39nCtVa
z80I+Pl/TBv1VyXyqULU+LXObfNgYOCEO/5p70hTyeVRNajrpnN3F1QHlyRGvFet
rLeNn8NfKg09m35e67k8K8NPcE09iZtMnZpnzI3n3A23uJVKrAGwHTmowoQEY26p
b25NlgkW+fgWr76czIwByPvRhdjwTBuDA7lZ/ic3/Q469R9D6K+jyAKw8RHExE+3
WQYPpVwvkqEHWgOE/mkl6ASNV92KmKjb6HrXcS5ThxVc39d9hkk=
=jjwS
-----END PGP SIGNATURE-----

--VPqa6mWmG7/oyOgx--
