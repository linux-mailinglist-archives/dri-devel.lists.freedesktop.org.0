Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 021A89ABAD9
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 03:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D62810E009;
	Wed, 23 Oct 2024 01:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A6B310E009
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 01:12:23 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.254])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4XY9wv58vSzQs82;
 Wed, 23 Oct 2024 09:11:27 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id 3F65D18010F;
 Wed, 23 Oct 2024 09:12:19 +0800 (CST)
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Wed, 23 Oct 2024 09:12:17 +0800
Message-ID: <9e7b2f9b-3a34-4d94-90e0-aa4796f95383@huawei.com>
Date: Wed, 23 Oct 2024 09:12:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-dp 4/4] drm/hisilicon/hibmc: add dp module in hibmc
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <liangjian010@huawei.com>,
 <chenjianmin@huawei.com>, <lidongming5@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <shiyongbang@huawei.com>
References: <20240930100610.782363-1-shiyongbang@huawei.com>
 <20240930100610.782363-5-shiyongbang@huawei.com>
 <xeemxeld4cqpx47kzb5qqsawk7mu5kje6r7n335dhe2s7ynw6m@eaiowriiilgr>
 <ede06bc0-0719-4a6f-b67a-d7b576ca4df9@huawei.com>
 <CAA8EJpq5MED1gScw=L-7fvO1MPOFgc+P_0K+GimtXdMTJu67RQ@mail.gmail.com>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <CAA8EJpq5MED1gScw=L-7fvO1MPOFgc+P_0K+GimtXdMTJu67RQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.159.166.136]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd500013.china.huawei.com (7.221.188.12)
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

> On Tue, 22 Oct 2024 at 15:24, Yongbang Shi <shiyongbang@huawei.com> wrote:
>>
>>> On Mon, Sep 30, 2024 at 06:06:10PM +0800, shiyongbang wrote:
>>>> From: baihan li <libaihan@huawei.com>
>>>>
>>>> To support DP interface displaying in hibmc driver. Add
>>>> a encoder and connector for DP modual.
>>>>
>>>> Signed-off-by: baihan li <libaihan@huawei.com>
>>>> ---
>>>>    drivers/gpu/drm/hisilicon/hibmc/Makefile      |   2 +-
>>>>    .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 195 ++++++++++++++++++
>>>>    .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  17 +-
>>>>    .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |   5 +
>>>>    4 files changed, 217 insertions(+), 2 deletions(-)
>>>>    create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
>>>>
>>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/Makefile b/drivers/gpu/drm/hisilicon/hibmc/Makefile
>>>> index 693036dfab52..8cf74e0d4785 100644
>>>> --- a/drivers/gpu/drm/hisilicon/hibmc/Makefile
>>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/Makefile
>>>> @@ -1,5 +1,5 @@
>>>>    # SPDX-License-Identifier: GPL-2.0-only
>>>>    hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o \
>>>> -           dp/dp_aux.o dp/dp_link.o dp/dp_kapi.o
>>>> +           dp/dp_aux.o dp/dp_link.o dp/dp_kapi.o hibmc_drm_dp.o
>>>>
>>>>    obj-$(CONFIG_DRM_HISI_HIBMC) += hibmc-drm.o
>>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
>>>> new file mode 100644
>>>> index 000000000000..7a50f1d81aac
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
>>>> @@ -0,0 +1,195 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>> +
>>>> +#include <linux/io.h>
>>>> +
>>>> +#include <drm/drm_probe_helper.h>
>>>> +#include <drm/drm_simple_kms_helper.h>
>>>> +#include <drm/drm_atomic_helper.h>
>>>> +#include <drm/drm_drv.h>
>>>> +#include <drm/drm_edid.h>
>>>> +
>>>> +#include "hibmc_drm_drv.h"
>>>> +#include "dp/dp_kapi.h"
>>>> +
>>>> +static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
>>>> +{
>>>> +    int count;
>>>> +
>>>> +    count = drm_add_modes_noedid(connector, connector->dev->mode_config.max_width,
>>>> +                                 connector->dev->mode_config.max_height);
>>>> +    drm_set_preferred_mode(connector, 800, 600); /* default 800x600 */
>>> What? Please parse EDID instead.
>>>
>>>> +
>>>> +    return count;
>>>> +}
>>>> +
>>>> +static const struct drm_connector_helper_funcs hibmc_dp_conn_helper_funcs = {
>>>> +    .get_modes = hibmc_dp_connector_get_modes,
>>>> +};
>>>> +
>>>> +static const struct drm_connector_funcs hibmc_dp_conn_funcs = {
>>>> +    .reset = drm_atomic_helper_connector_reset,
>>>> +    .fill_modes = drm_helper_probe_single_connector_modes,
>>>> +    .destroy = drm_connector_cleanup,
>>>> +    .atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>>>> +    .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>>>> +};
>>>> +
>>>> +static void dp_mode_cfg(struct drm_device *dev, struct dp_mode *dp_mode,
>>>> +                    struct drm_display_mode *mode)
>>>> +{
>>>> +    dp_mode->field_rate = drm_mode_vrefresh(mode);
>>>> +    dp_mode->pixel_clock = mode->clock / 1000; /* 1000: khz to hz */
>>>> +
>>>> +    dp_mode->h_total = mode->htotal;
>>>> +    dp_mode->h_active = mode->hdisplay;
>>>> +    dp_mode->h_blank = mode->htotal - mode->hdisplay;
>>>> +    dp_mode->h_front = mode->hsync_start - mode->hdisplay;
>>>> +    dp_mode->h_sync = mode->hsync_end - mode->hsync_start;
>>>> +    dp_mode->h_back = mode->htotal - mode->hsync_end;
>>>> +
>>>> +    dp_mode->v_total = mode->vtotal;
>>>> +    dp_mode->v_active = mode->vdisplay;
>>>> +    dp_mode->v_blank = mode->vtotal - mode->vdisplay;
>>>> +    dp_mode->v_front = mode->vsync_start - mode->vdisplay;
>>>> +    dp_mode->v_sync = mode->vsync_end - mode->vsync_start;
>>>> +    dp_mode->v_back = mode->vtotal - mode->vsync_end;
>>> No need to copy the bits around. Please use drm_display_mode directly.
>>>
>>>> +
>>>> +    if (mode->flags & DRM_MODE_FLAG_PHSYNC) {
>>>> +            drm_info(dev, "horizontal sync polarity: positive\n");
>>>> +            dp_mode->h_pol = 1;
>>>> +    } else if (mode->flags & DRM_MODE_FLAG_NHSYNC) {
>>>> +            drm_info(dev, "horizontal sync polarity: negative\n");
>>>> +            dp_mode->h_pol = 0;
>>>> +    } else {
>>>> +            drm_err(dev, "horizontal sync polarity: unknown or not set\n");
>>>> +    }
>>>> +
>>>> +    if (mode->flags & DRM_MODE_FLAG_PVSYNC) {
>>>> +            drm_info(dev, "vertical sync polarity: positive\n");
>>>> +            dp_mode->v_pol = 1;
>>>> +    } else if (mode->flags & DRM_MODE_FLAG_NVSYNC) {
>>>> +            drm_info(dev, "vertical sync polarity: negative\n");
>>> No spamming, use DRM debugging macros.
>>>
>>>> +            dp_mode->v_pol = 0;
>>>> +    } else {
>>>> +            drm_err(dev, "vertical sync polarity: unknown or not set\n");
>>>> +    }
>>>> +}
>>>> +
>>>> +static int dp_prepare(struct hibmc_dp *dp, struct drm_display_mode *mode)
>>>> +{
>>>> +    struct dp_mode dp_mode = {0};
>>>> +    int ret;
>>>> +
>>>> +    hibmc_dp_display_en(dp, false);
>>>> +
>>>> +    dp_mode_cfg(dp->drm_dev, &dp_mode, mode);
>>>> +    ret = hibmc_dp_mode_set(dp, &dp_mode);
>>>> +    if (ret)
>>>> +            drm_err(dp->drm_dev, "hibmc dp mode set failed: %d\n", ret);
>>>> +
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +static void dp_enable(struct hibmc_dp *dp)
>>>> +{
>>>> +    hibmc_dp_display_en(dp, true);
>>>> +}
>>>> +
>>>> +static void dp_disable(struct hibmc_dp *dp)
>>>> +{
>>>> +    hibmc_dp_display_en(dp, false);
>>>> +}
>>>> +
>>>> +static int hibmc_dp_hw_init(struct hibmc_drm_private *priv)
>>>> +{
>>>> +    int ret;
>>>> +
>>>> +    ret = hibmc_dp_kapi_init(&priv->dp);
>>>> +    if (ret)
>>>> +            return ret;
>>>> +
>>>> +    hibmc_dp_display_en(&priv->dp, false);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static void hibmc_dp_hw_uninit(struct hibmc_drm_private *priv)
>>>> +{
>>>> +    hibmc_dp_kapi_uninit(&priv->dp);
>>>> +}
>>> Inline all these one-line wrappers, they serve no purpose.
>> Hi Dmitry,
>>
>> Yes, it make sense to be inline. But it is generally better to let the compiler decide when to inline a function.
> Please excuse me for not being explicit or clear enough. Drop the
> one-line wrappers and just call the necessary functions directly.
> There is no need to have such wrappers.

Thanks for your clear explanation, I'll change them in the next version!


>> Thanks,
>> Baihan
>>
>>
>>>> +
>>>> +static void hibmc_dp_encoder_enable(struct drm_encoder *drm_encoder,
>>>> +                                struct drm_atomic_state *state)
>>>> +{
>>>> +    struct hibmc_dp *dp = container_of(drm_encoder, struct hibmc_dp, encoder);
>>>> +    struct drm_display_mode *mode = &drm_encoder->crtc->state->mode;
>>>> +
>>>> +    if (dp_prepare(dp, mode))
>>>> +            return;
>>>> +
>>>> +    dp_enable(dp);
>>>> +}
>>>> +
>>>> +static void hibmc_dp_encoder_disable(struct drm_encoder *drm_encoder,
>>>> +                                 struct drm_atomic_state *state)
>>>> +{
>>>> +    struct hibmc_dp *dp = container_of(drm_encoder, struct hibmc_dp, encoder);
>>>> +
>>>> +    dp_disable(dp);
>>>> +}
>>>> +
>>>> +static const struct drm_encoder_helper_funcs hibmc_dp_encoder_helper_funcs = {
>>>> +    .atomic_enable = hibmc_dp_encoder_enable,
>>>> +    .atomic_disable = hibmc_dp_encoder_disable,
>>>> +};
>>>> +
>>>> +void hibmc_dp_uninit(struct hibmc_drm_private *priv)
>>>> +{
>>>> +    hibmc_dp_hw_uninit(priv);
>>>> +}
>>>> +
>>>> +int hibmc_dp_init(struct hibmc_drm_private *priv)
>>>> +{
>>>> +    struct drm_device *dev = &priv->dev;
>>>> +    struct drm_crtc *crtc = &priv->crtc;
>>>> +    struct hibmc_dp *dp = &priv->dp;
>>>> +    struct drm_connector *connector = &dp->connector;
>>>> +    struct drm_encoder *encoder = &dp->encoder;
>>>> +    int ret;
>>>> +
>>>> +    dp->mmio = priv->mmio;
>>>> +    dp->drm_dev = dev;
>>>> +
>>>> +    ret = hibmc_dp_hw_init(priv);
>>>> +    if (ret) {
>>>> +            drm_err(dev, "dp hw init failed: %d\n", ret);
>>>> +            return ret;
>>>> +    }
>>>> +
>>>> +    encoder->possible_crtcs = drm_crtc_mask(crtc);
>>>> +    ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_TMDS);
>>> I think drm_simple_foo interfaces are being deprecated. Please copy
>>> required code into the driver instead.
>>>
>>>> +    if (ret) {
>>>> +            drm_err(dev, "init dp encoder failed: %d\n", ret);
>>>> +            goto err_init;
>>>> +    }
>>>> +
>>>> +    drm_encoder_helper_add(encoder, &hibmc_dp_encoder_helper_funcs);
>>>> +
>>>> +    ret = drm_connector_init(dev, connector, &hibmc_dp_conn_funcs,
>>>> +                             DRM_MODE_CONNECTOR_DisplayPort);
>>>> +    if (ret) {
>>>> +            drm_err(dev, "init dp connector failed: %d\n", ret);
>>>> +            goto err_init;
>>>> +    }
>>>> +
>>>> +    drm_connector_helper_add(connector, &hibmc_dp_conn_helper_funcs);
>>>> +
>>>> +    drm_connector_attach_encoder(connector, encoder);
>>>> +
>>>> +    return 0;
>>>> +
>>>> +err_init:
>>>> +    hibmc_dp_hw_uninit(priv);
>>>> +
>>>> +    return ret;
>>>> +}
>>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>>>> index 9f9b19ea0587..c90a8db021b0 100644
>>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>>>> @@ -93,6 +93,10 @@ static const struct drm_mode_config_funcs hibmc_mode_funcs = {
>>>>
>>>>    static int hibmc_kms_init(struct hibmc_drm_private *priv)
>>>>    {
>>>> +#define DP_HOST_SERDES_CTRL         0x1f001c
>>>> +#define DP_HOST_SERDES_CTRL_VAL             0x8A00
>>>> +#define DP_HOST_SERDES_CTRL_MASK    0x7FFFE
>>>> +
>>> #defines outside of the function body.
>>>
>>>>       struct drm_device *dev = &priv->dev;
>>>>       int ret;
>>>>
>>>> @@ -116,10 +120,17 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)
>>>>               return ret;
>>>>       }
>>>>
>>>> +    /* if DP existed, init DP */
>>>> +    if ((readl(priv->mmio + DP_HOST_SERDES_CTRL) &
>>>> +         DP_HOST_SERDES_CTRL_MASK) == DP_HOST_SERDES_CTRL_VAL) {
>>>> +            ret = hibmc_dp_init(priv);
>>>> +            if (ret)
>>>> +                    drm_err(dev, "failed to init dp: %d\n", ret);
>>>> +    }
>>>> +
>>>>       ret = hibmc_vdac_init(priv);
>>>>       if (ret) {
>>>>               drm_err(dev, "failed to init vdac: %d\n", ret);
>>>> -            return ret;
>>> Why?
>>>
>>>>       }
>>>>
>>>>       return 0;
>>>> @@ -239,6 +250,7 @@ static int hibmc_hw_init(struct hibmc_drm_private *priv)
>>>>
>>>>    static int hibmc_unload(struct drm_device *dev)
>>>>    {
>>>> +    struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
>>>>       struct pci_dev *pdev = to_pci_dev(dev->dev);
>>>>
>>>>       drm_atomic_helper_shutdown(dev);
>>>> @@ -247,6 +259,9 @@ static int hibmc_unload(struct drm_device *dev)
>>>>
>>>>       pci_disable_msi(to_pci_dev(dev->dev));
>>>>
>>>> +    if (priv->dp.encoder.possible_crtcs)
>>>> +            hibmc_dp_uninit(priv);
>>>> +
>>>>       return 0;
>>>>    }
>>>>
>>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>>>> index 6b566f3aeecb..aa79903fe022 100644
>>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>>>> @@ -19,6 +19,7 @@
>>>>    #include <linux/i2c.h>
>>>>
>>>>    #include <drm/drm_framebuffer.h>
>>>> +#include "dp/dp_kapi.h"
>>>>
>>>>    struct hibmc_connector {
>>>>       struct drm_connector base;
>>>> @@ -37,6 +38,7 @@ struct hibmc_drm_private {
>>>>       struct drm_crtc crtc;
>>>>       struct drm_encoder encoder;
>>>>       struct hibmc_connector connector;
>>> It seems this needs to be refactored too, to separate VGA connector /
>>> encoder / CRTC to a child struct.
>>>
>>>> +    struct hibmc_dp dp;
>>>>    };
>>>>
>>>>    static inline struct hibmc_connector *to_hibmc_connector(struct drm_connector *connector)
>>>> @@ -59,4 +61,7 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv);
>>>>
>>>>    int hibmc_ddc_create(struct drm_device *drm_dev, struct hibmc_connector *connector);
>>>>
>>>> +int hibmc_dp_init(struct hibmc_drm_private *priv);
>>>> +void hibmc_dp_uninit(struct hibmc_drm_private *priv);
>>>> +
>>>>    #endif
>>>> --
>>>> 2.33.0
>>>>
>
>
