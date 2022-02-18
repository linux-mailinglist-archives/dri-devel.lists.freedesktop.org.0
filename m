Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9094BC29B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 23:33:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4813A10EEA5;
	Fri, 18 Feb 2022 22:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2F710EEA5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 22:32:56 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id v22so4427819ljh.7
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 14:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EmbZ+Rs0DCCaaiAlhr8hnJNWT7G3P69JhJhCoYAgkyI=;
 b=lgDmZYH5oDnn3u94HVyLPuaezlpg5OtCTcfDmaDnbgSf75cqELOA+SzUY4iECFi9fI
 PEqrL73l6GDWCZcoaDs0YhUamvyfzKd6M+U5bHhdP6UZ4cpH5FI5NckuqQum6FfI8Gyi
 YnlEA/T1IytaeKeAwKAbCBscRsLaUJCBGfBEzO1c5JDkbUm0ifiVCH36JnfelR4xpTBy
 5KqKjx8+PZswPbsQn46J42Q09hf0XkF7DmaZLjbWwugorJAEZeufIAuKvs9Df6pe/s7Y
 2pRkjEdtXc00quRYaWhiWkOXwQ5e+umtJ1XlOfGm47AhqQLPCx9RYc2NMeo/PuGDy4pp
 v3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EmbZ+Rs0DCCaaiAlhr8hnJNWT7G3P69JhJhCoYAgkyI=;
 b=A0nPP2trc39KG2HEpLhVoNRBdTTA2opQfyZkOh55qrqpxFXJmGpdsaATwKzEbzwKfT
 nkL6oqJbEQ9ILOcbvsYB5Bw8ZKmoUNV0hzjflsAODNY4y8hdvIH9oPkLY9BITVWuD8Ju
 ioFK7vYWgeFLYLBZYqFJ3EOreO+Gzb8yFfB1vznr8k6x6r4NxVGfJV5as9DxLERgcklv
 8PlMzvVOkDIkY1mQupcCd0rAsLBeFBE7Tgl6pggVCTV0n93UwIGXKKEm7CHz0ZfrIwSh
 qMvCzaehVsrMFxxOJy9rae8v2wsAQpZ96OBG42MeMiP5m3q2Z0npqgMGB+9zoRW9USqQ
 CAnw==
X-Gm-Message-State: AOAM532SJ9o7p2E4fKfI4rEB/dsn5OJ8OF4bIEERYNkuRlmonHhR4hkd
 Nm8uhPWzVJRLYpgKew9erYAUpw==
X-Google-Smtp-Source: ABdhPJxXJfznG7eTeQS4X2nWtTN4ctoIdPjwRRirntuU8kEYIG5c3G3gt+3Cb65jn+sWGLZQpxByng==
X-Received: by 2002:a2e:8198:0:b0:246:e7d:45d2 with SMTP id
 e24-20020a2e8198000000b002460e7d45d2mr6871560ljg.495.1645223574954; 
 Fri, 18 Feb 2022 14:32:54 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c1sm392401lfc.49.2022.02.18.14.32.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 14:32:54 -0800 (PST)
Message-ID: <b25d422e-cdd8-bcb9-1815-1d89f170d421@linaro.org>
Date: Sat, 19 Feb 2022 01:32:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC PATCH v2 4/5] drm/msm/dp: replace dp_connector with
 drm_bridge_connector
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
 <20220211224006.1797846-5-dmitry.baryshkov@linaro.org>
 <572c0402-55da-077b-1809-3d1caf7ce743@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <572c0402-55da-077b-1809-3d1caf7ce743@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/02/2022 00:31, Kuogee Hsieh wrote:
> 
> On 2/11/2022 2:40 PM, Dmitry Baryshkov wrote:
>> There is little point in having both connector and root bridge
>> implementation in the same driver. Move connector's functionality to the
>> bridge to let next bridge in chain to override it.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> This patch break primary (edp) display
> 
> -- right half of screen garbled
> 
> -- screen shift vertically
> 
> below are error messages seen --
> 
> [   36.679216] panel-edp soc@0:edp_panel: No display modes
> [   36.687272] panel-edp soc@0:edp_panel: No display modes
> [   40.593709] panel-edp soc@0:edp_panel: No display modes
> [   40.600285] panel-edp soc@0:edp_panel: No display modes

So, before the patch the drm core was getting modes from the 
drm_connector (which means, modes from drm driver itself). With this 
patch the panel-edp tries to get modes.

Could you please check, why panel_edp_get_modes() fails? Assuming that 
you use platform panel-edp binding (rather than 'edp-panel') could you 
please check you have either of the following:
- ddc bus for EDID?
- either num_timing or num_modes in your panel desc.


> 
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c |  22 +++---
>>   drivers/gpu/drm/msm/dp/dp_drm.c     | 113 ++++++++++------------------
>>   2 files changed, 52 insertions(+), 83 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 45f9a912ecc5..59e5e5b8e5b4 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1501,6 +1501,17 @@ int msm_dp_modeset_init(struct msm_dp 
>> *dp_display, struct drm_device *dev,
>>       dp_display->encoder = encoder;
>> +    dp_display->bridge = msm_dp_bridge_init(dp_display, dev, encoder);
>> +    if (IS_ERR(dp_display->bridge)) {
>> +        ret = PTR_ERR(dp_display->bridge);
>> +        DRM_DEV_ERROR(dev->dev,
>> +            "failed to create dp bridge: %d\n", ret);
>> +        dp_display->bridge = NULL;
>> +        return ret;
>> +    }
>> +
>> +    priv->bridges[priv->num_bridges++] = dp_display->bridge;
>> +
>>       dp_display->connector = dp_drm_connector_init(dp_display);
>>       if (IS_ERR(dp_display->connector)) {
>>           ret = PTR_ERR(dp_display->connector);
>> @@ -1514,17 +1525,6 @@ int msm_dp_modeset_init(struct msm_dp 
>> *dp_display, struct drm_device *dev,
>>       priv->connectors[priv->num_connectors++] = dp_display->connector;
>> -    dp_display->bridge = msm_dp_bridge_init(dp_display, dev, encoder);
>> -    if (IS_ERR(dp_display->bridge)) {
>> -        ret = PTR_ERR(dp_display->bridge);
>> -        DRM_DEV_ERROR(dev->dev,
>> -            "failed to create dp bridge: %d\n", ret);
>> -        dp_display->bridge = NULL;
>> -        return ret;
>> -    }
>> -
>> -    priv->bridges[priv->num_bridges++] = dp_display->bridge;
>> -
>>       return 0;
>>   }
>> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c 
>> b/drivers/gpu/drm/msm/dp/dp_drm.c
>> index 80f59cf99089..57800b865fe6 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
>> @@ -6,6 +6,7 @@
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_atomic.h>
>>   #include <drm/drm_bridge.h>
>> +#include <drm/drm_bridge_connector.h>
>>   #include <drm/drm_crtc.h>
>>   #include "msm_drv.h"
>> @@ -20,24 +21,16 @@ struct msm_dp_bridge {
>>   #define to_dp_display(x)     container_of((x), struct msm_dp_bridge, 
>> bridge)
>> -struct dp_connector {
>> -    struct drm_connector base;
>> -    struct msm_dp *dp_display;
>> -};
>> -#define to_dp_connector(x) container_of(x, struct dp_connector, base)
>> -
>>   /**
>> - * dp_connector_detect - callback to determine if connector is connected
>> - * @conn: Pointer to drm connector structure
>> - * @force: Force detect setting from drm framework
>> - * Returns: Connector 'is connected' status
>> + * dp_bridge_detect - callback to determine if connector is connected
>> + * @bridge: Pointer to drm bridge structure
>> + * Returns: Bridge's 'is connected' status
>>    */
>> -static enum drm_connector_status dp_connector_detect(struct 
>> drm_connector *conn,
>> -        bool force)
>> +static enum drm_connector_status dp_bridge_detect(struct drm_bridge 
>> *bridge)
>>   {
>>       struct msm_dp *dp;
>> -    dp = to_dp_connector(conn)->dp_display;
>> +    dp = to_dp_display(bridge)->dp_display;
>>       DRM_DEBUG_DP("is_connected = %s\n",
>>           (dp->is_connected) ? "true" : "false");
>> @@ -47,11 +40,12 @@ static enum drm_connector_status 
>> dp_connector_detect(struct drm_connector *conn,
>>   }
>>   /**
>> - * dp_connector_get_modes - callback to add drm modes via 
>> drm_mode_probed_add()
>> + * dp_bridge_get_modes - callback to add drm modes via 
>> drm_mode_probed_add()
>> + * @bridge: Poiner to drm bridge
>>    * @connector: Pointer to drm connector structure
>>    * Returns: Number of modes added
>>    */
>> -static int dp_connector_get_modes(struct drm_connector *connector)
>> +static int dp_bridge_get_modes(struct drm_bridge *bridge, struct 
>> drm_connector *connector)
>>   {
>>       int rc = 0;
>>       struct msm_dp *dp;
>> @@ -61,7 +55,7 @@ static int dp_connector_get_modes(struct 
>> drm_connector *connector)
>>       if (!connector)
>>           return 0;
>> -    dp = to_dp_connector(connector)->dp_display;
>> +    dp = to_dp_display(bridge)->dp_display;
>>       dp_mode = kzalloc(sizeof(*dp_mode),  GFP_KERNEL);
>>       if (!dp_mode)
>> @@ -102,18 +96,20 @@ static int dp_connector_get_modes(struct 
>> drm_connector *connector)
>>   }
>>   /**
>> - * dp_connector_mode_valid - callback to determine if specified mode 
>> is valid
>> - * @connector: Pointer to drm connector structure
>> + * dp_bridge_mode_valid - callback to determine if specified mode is 
>> valid
>> + * @bridge: Pointer to drm bridge structure
>> + * @info: display info
>>    * @mode: Pointer to drm mode structure
>>    * Returns: Validity status for specified mode
>>    */
>> -static enum drm_mode_status dp_connector_mode_valid(
>> -        struct drm_connector *connector,
>> -        struct drm_display_mode *mode)
>> +static enum drm_mode_status dp_bridge_mode_valid(
>> +        struct drm_bridge *bridge,
>> +        const struct drm_display_info *info,
>> +        const struct drm_display_mode *mode)
>>   {
>>       struct msm_dp *dp_disp;
>> -    dp_disp = to_dp_connector(connector)->dp_display;
>> +    dp_disp = to_dp_display(bridge)->dp_display;
>>       if ((dp_disp->max_pclk_khz <= 0) ||
>>               (dp_disp->max_pclk_khz > DP_MAX_PIXEL_CLK_KHZ) ||
>> @@ -123,55 +119,6 @@ static enum drm_mode_status dp_connector_mode_valid(
>>       return dp_display_validate_mode(dp_disp, mode->clock);
>>   }
>> -static const struct drm_connector_funcs dp_connector_funcs = {
>> -    .detect = dp_connector_detect,
>> -    .fill_modes = drm_helper_probe_single_connector_modes,
>> -    .destroy = drm_connector_cleanup,
>> -    .reset = drm_atomic_helper_connector_reset,
>> -    .atomic_duplicate_state = 
>> drm_atomic_helper_connector_duplicate_state,
>> -    .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>> -};
>> -
>> -static const struct drm_connector_helper_funcs 
>> dp_connector_helper_funcs = {
>> -    .get_modes = dp_connector_get_modes,
>> -    .mode_valid = dp_connector_mode_valid,
>> -};
>> -
>> -/* connector initialization */
>> -struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
>> -{
>> -    struct drm_connector *connector = NULL;
>> -    struct dp_connector *dp_connector;
>> -    int ret;
>> -
>> -    dp_connector = devm_kzalloc(dp_display->drm_dev->dev,
>> -                    sizeof(*dp_connector),
>> -                    GFP_KERNEL);
>> -    if (!dp_connector)
>> -        return ERR_PTR(-ENOMEM);
>> -
>> -    dp_connector->dp_display = dp_display;
>> -
>> -    connector = &dp_connector->base;
>> -
>> -    ret = drm_connector_init(dp_display->drm_dev, connector,
>> -            &dp_connector_funcs,
>> -            dp_display->connector_type);
>> -    if (ret)
>> -        return ERR_PTR(ret);
>> -
>> -    drm_connector_helper_add(connector, &dp_connector_helper_funcs);
>> -
>> -    /*
>> -     * Enable HPD to let hpd event is handled when cable is connected.
>> -     */
>> -    connector->polled = DRM_CONNECTOR_POLL_HPD;
>> -
>> -    drm_connector_attach_encoder(connector, dp_display->encoder);
>> -
>> -    return connector;
>> -}
>> -
>>   static void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
>>                   const struct drm_display_mode *mode,
>>                   const struct drm_display_mode *adjusted_mode)
>> @@ -211,6 +158,9 @@ static const struct drm_bridge_funcs dp_bridge_ops 
>> = {
>>       .disable      = dp_bridge_disable,
>>       .post_disable = dp_bridge_post_disable,
>>       .mode_set     = dp_bridge_mode_set,
>> +    .mode_valid   = dp_bridge_mode_valid,
>> +    .get_modes    = dp_bridge_get_modes,
>> +    .detect       = dp_bridge_detect,
>>   };
>>   struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, 
>> struct drm_device *dev,
>> @@ -228,7 +178,12 @@ struct drm_bridge *msm_dp_bridge_init(struct 
>> msm_dp *dp_display, struct drm_devi
>>       bridge = &dp_bridge->bridge;
>>       bridge->funcs = &dp_bridge_ops;
>> -    bridge->encoder = encoder;
>> +    bridge->type = dp_display->connector_type;
>> +
>> +    bridge->ops =
>> +        DRM_BRIDGE_OP_DETECT |
>> +        DRM_BRIDGE_OP_HPD |
>> +        DRM_BRIDGE_OP_MODES;
>>       rc = drm_bridge_attach(encoder, bridge, NULL, 
>> DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>       if (rc) {
>> @@ -249,3 +204,17 @@ struct drm_bridge *msm_dp_bridge_init(struct 
>> msm_dp *dp_display, struct drm_devi
>>       return bridge;
>>   }
>> +
>> +/* connector initialization */
>> +struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
>> +{
>> +    struct drm_connector *connector = NULL;
>> +
>> +    connector = drm_bridge_connector_init(dp_display->drm_dev, 
>> dp_display->encoder);
>> +    if (IS_ERR(connector))
>> +        return connector;
>> +
>> +    drm_connector_attach_encoder(connector, dp_display->encoder);
>> +
>> +    return connector;
>> +}


-- 
With best wishes
Dmitry
