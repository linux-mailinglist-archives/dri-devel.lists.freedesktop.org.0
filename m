Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8276276C82B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 10:15:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C550710E51F;
	Wed,  2 Aug 2023 08:15:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E99F10E51B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 08:15:14 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-31757edd9edso5802932f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 01:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690964112; x=1691568912;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=5207ikmn6FO2pMg9Ii8+IOoLRcWuJD5TBwm7P4/PsQc=;
 b=Qnv5VGWYZWJNvzi0EqgiFIA/bMbwyBgFHSg7T5sm47dvx/OQ38acYrlbiozXWpY0K5
 t0IRRxge/yvXwNGs66cf2hgjz92/WHjVK6+0QdCAP7brEDcHCE7IdJYAue1XjAnNQ169
 l+8GEb5a5e862qqJNC/6sWBKE7R4VEjQ1Gl/qC4Y7tkVrV5Zmtc/foJqLCfFTj386UvD
 YXpFsAi1dTF35+9bs0u9Y/IJ0UhKXNivz4oScn8yl5+lUYpTpS0cKGdDmmrUWz+SogVc
 8BoVASwuQBs7kkdHR4e8O5XvdViWXvzzEfBkEJAVICcg5J7iY/er3IDy4ZpUj350R66U
 vG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690964112; x=1691568912;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5207ikmn6FO2pMg9Ii8+IOoLRcWuJD5TBwm7P4/PsQc=;
 b=Mfjrmo7Qs4+4IPxa39LiZDCB44XQ9PVu2vWEtRBizwOOj/LJfsXSzLuKF4ETBbB7DV
 3+ya5hX1Nh0fc8V05UL8ArOmWNgUMA4gd6ID1iemDBh3B7OCxuwKssLMd+4ly8BpbDAE
 Mfg2WRFAVIBI/Qk6daXFFjo0wDkFFwRBVCDXO0Jre81+qCkVgjJYFx87uOxwo/MdTcRR
 NATmFRZqtm2NHEhyBbQ1WsJzVKz3zJuyBWhVy5647W1VPnGoOXMRYjcpTqcyyI7UYMyk
 S+1wTRg4ATIEDSnxTrDeIgBGQwaOXZURnY05Z7+Edfxx5/aPJzc66zBzXtairCO0pKU0
 kN1g==
X-Gm-Message-State: ABy/qLYV6EslwsXw2Z5HZTX+lcnqBH6IuIixDPMhSfg4N+zyVqBRF3b/
 1nFY7LQoKDLnKMzgeZTeoYi0qQ==
X-Google-Smtp-Source: APBJJlGrlmEBQ2oMdc02mtFAqelLKeKt6FFTP+bX6dAhd1LhtAC5oPtuwPafwqHkJrDtIVJFoLGw5g==
X-Received: by 2002:a5d:4572:0:b0:313:f0ef:1e55 with SMTP id
 a18-20020a5d4572000000b00313f0ef1e55mr3983967wrc.37.1690964112450; 
 Wed, 02 Aug 2023 01:15:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196?
 ([2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a5d4b8a000000b003175f00e555sm18086855wrt.97.2023.08.02.01.15.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 01:15:11 -0700 (PDT)
Message-ID: <e611a1db-89f6-999b-1a01-a49d9d00b07f@linaro.org>
Date: Wed, 2 Aug 2023 10:15:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 1/3] drm/display: add transparent bridge helper
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20230802011845.4176631-1-dmitry.baryshkov@linaro.org>
 <20230802011845.4176631-2-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230802011845.4176631-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Reply-To: neil.armstrong@linaro.org
Cc: linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 02/08/2023 03:18, Dmitry Baryshkov wrote:
> Define a helper for creating simple transparent bridges which serve the
> only purpose of linking devices into the bridge chain up to the last
> bridge representing the connector. This is especially useful for
> DP/USB-C bridge chains, which can span across several devices, but do
> not require any additional functionality from the intermediate bridges.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/display/Kconfig             |   9 ++
>   drivers/gpu/drm/display/Makefile            |   2 +
>   drivers/gpu/drm/display/drm_simple_bridge.c | 127 ++++++++++++++++++++

I wonder why drm/display/ and not drm/bridge ?

It's an helper, but it's mainly a bridge.

>   include/drm/display/drm_simple_bridge.h     |  19 +++
>   4 files changed, 157 insertions(+)
>   create mode 100644 drivers/gpu/drm/display/drm_simple_bridge.c
>   create mode 100644 include/drm/display/drm_simple_bridge.h
> 
> diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
> index 09712b88a5b8..a6132984b9e3 100644
> --- a/drivers/gpu/drm/display/Kconfig
> +++ b/drivers/gpu/drm/display/Kconfig
> @@ -49,3 +49,12 @@ config DRM_DP_CEC
>   
>   	  Note: not all adapters support this feature, and even for those
>   	  that do support this they often do not hook up the CEC pin.
> +
> +config DRM_SIMPLE_BRIDGE
> +	tristate
> +	depends on DRM
> +	select AUXILIARY_BUS
> +	select DRM_PANEL_BRIDGE
> +	help
> +	  Simple transparent bridge that is used by several drivers to build
> +	  bridges chain.
> diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
> index 17ac4a1006a8..6e2b0d7f24b3 100644
> --- a/drivers/gpu/drm/display/Makefile
> +++ b/drivers/gpu/drm/display/Makefile
> @@ -16,3 +16,5 @@ drm_display_helper-$(CONFIG_DRM_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
>   drm_display_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
>   
>   obj-$(CONFIG_DRM_DISPLAY_HELPER) += drm_display_helper.o
> +
> +obj-$(CONFIG_DRM_SIMPLE_BRIDGE) += drm_simple_bridge.o
> diff --git a/drivers/gpu/drm/display/drm_simple_bridge.c b/drivers/gpu/drm/display/drm_simple_bridge.c
> new file mode 100644
> index 000000000000..9e80efe67b93
> --- /dev/null
> +++ b/drivers/gpu/drm/display/drm_simple_bridge.c
> @@ -0,0 +1,127 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2023 Linaro Ltd.
> + *
> + * Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> + */
> +#include <linux/auxiliary_bus.h>
> +#include <linux/module.h>
> +
> +#include <drm/drm_bridge.h>
> +#include <drm/display/drm_simple_bridge.h>
> +
> +static DEFINE_IDA(simple_bridge_ida);
> +
> +static void drm_simple_bridge_release(struct device *dev)
> +{
> +	struct auxiliary_device *adev = to_auxiliary_dev(dev);
> +
> +	kfree(adev);
> +}
> +
> +static void drm_simple_bridge_unregister_adev(void *_adev)
> +{
> +	struct auxiliary_device *adev = _adev;
> +
> +	auxiliary_device_delete(adev);
> +	auxiliary_device_uninit(adev);
> +}
> +
> +int drm_simple_bridge_register(struct device *parent)
> +{
> +	struct auxiliary_device *adev;
> +	int ret;
> +
> +	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
> +	if (!adev)
> +		return -ENOMEM;
> +
> +	ret = ida_alloc(&simple_bridge_ida, GFP_KERNEL);
> +	if (ret < 0)
> +		return ret;
> +
> +	adev->id = ret;
> +	adev->name = "simple_bridge";
> +	adev->dev.parent = parent;
> +	adev->dev.of_node = parent->of_node;
> +	adev->dev.release = drm_simple_bridge_release;
> +
> +	ret = auxiliary_device_init(adev);
> +	if (ret) {
> +		kfree(adev);
> +		return ret;
> +	}
> +
> +	ret = auxiliary_device_add(adev);
> +	if (ret) {
> +		auxiliary_device_uninit(adev);
> +		return ret;
> +	}
> +
> +	return devm_add_action_or_reset(parent, drm_simple_bridge_unregister_adev, adev);
> +}
> +EXPORT_SYMBOL_GPL(drm_simple_bridge_register);
> +
> +struct drm_simple_bridge_data {
> +	struct drm_bridge bridge;
> +	struct drm_bridge *next_bridge;
> +	struct device *dev;
> +};
> +
> +static int drm_simple_bridge_attach(struct drm_bridge *bridge,
> +				    enum drm_bridge_attach_flags flags)
> +{
> +	struct drm_simple_bridge_data *data;
> +
> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
> +		return -EINVAL;
> +
> +	data = container_of(bridge, struct drm_simple_bridge_data, bridge);
> +
> +	return drm_bridge_attach(bridge->encoder, data->next_bridge, bridge,
> +				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +}
> +
> +static const struct drm_bridge_funcs drm_simple_bridge_funcs = {
> +	.attach	= drm_simple_bridge_attach,
> +};
> +
> +static int drm_simple_bridge_probe(struct auxiliary_device *auxdev,
> +				   const struct auxiliary_device_id *id)
> +{
> +	struct drm_simple_bridge_data *data;
> +
> +	data = devm_kzalloc(&auxdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->dev = &auxdev->dev;
> +	data->next_bridge = devm_drm_of_get_bridge(&auxdev->dev, auxdev->dev.of_node, 0, 0);
> +	if (IS_ERR(data->next_bridge))
> +		return dev_err_probe(&auxdev->dev, PTR_ERR(data->next_bridge),
> +				     "failed to acquire drm_bridge\n");
> +
> +	data->bridge.funcs = &drm_simple_bridge_funcs;
> +#ifdef CONFIG_OF
> +	data->bridge.of_node = data->dev->of_node;
> +#endif

I think the whole stuff should depend on OF since devm_drm_of_get_bridge() is a no-op when !OF

> +
> +	return devm_drm_bridge_add(data->dev, &data->bridge);
> +}
> +
> +static const struct auxiliary_device_id drm_simple_bridge_table[] = {
> +	{ .name = KBUILD_MODNAME ".simple_bridge" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(auxiliary, drm_simple_bridge_table);
> +
> +struct auxiliary_driver drm_simple_bridge_drv = {
> +	.name = "simple_bridge",
> +	.id_table = drm_simple_bridge_table,
> +	.probe = drm_simple_bridge_probe,
> +};
> +module_auxiliary_driver(drm_simple_bridge_drv);
> +
> +MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@linaro.org>");
> +MODULE_DESCRIPTION("DRM simple bridge helper");
> +MODULE_LICENSE("GPL");
> diff --git a/include/drm/display/drm_simple_bridge.h b/include/drm/display/drm_simple_bridge.h
> new file mode 100644
> index 000000000000..3da8e1fb1137
> --- /dev/null
> +++ b/include/drm/display/drm_simple_bridge.h
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2023 Linaro Ltd.
> + *
> + * Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> + */
> +#ifndef DRM_SIMPLE_BRIDGE_H
> +#define DRM_SIMPLE_BRIDGE_H
> +
> +#if IS_ENABLED(CONFIG_DRM_SIMPLE_BRIDGE)
> +int drm_simple_bridge_register(struct device *parent);
> +#else
> +static inline int drm_simple_bridge_register(struct device *parent)
> +{
> +	return 0;
> +}
> +#endif
> +
> +#endif

The design looks fine, but I'll need another review.

Thanks,
Neil

