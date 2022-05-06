Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCEA51E09B
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 23:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA95610EF02;
	Fri,  6 May 2022 21:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9E910EF02
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 21:05:04 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id l19so10618752ljb.7
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 14:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8vp8riqZibAc+f/Ed6BiR6qr92aiaOVeRIgv69HStgY=;
 b=b5CI7ILMHgRkyfWScDEb/J663yAayWohb8zus4sk3ubvvdyn4bv6dHShcxOgaGOx2L
 FswJ6cD3WKdcVc7nNrTrdfB2tlhBKXnhSgRXv7SQpW4a+jl5lgk4+DAdGQwgcAlMI29p
 RZPxJqsnw1tNOBdcvl8cd/NHde51ya3FjoHaw+FlzV49f66dA4iJVzMyZQvhr48mBMqM
 kgxIuSKFhWrQ+X5zgCk9nUZNy8RAGEfOVmXyS2He5cpWXsZmweYlDUnHgqCULQ4rZ7Pv
 SQrgcXvs7400abS16V8JiZjZqFqTyEDRuhiWrUluIffNrud6hlCEnxEGylPmLNU9rjjv
 BOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8vp8riqZibAc+f/Ed6BiR6qr92aiaOVeRIgv69HStgY=;
 b=s5nq5Ln6mg+oRK3g7vDvSdoywT4/nja4vQQ3FxwGDUvWNYRk3FS96/yvJgjqFAGC+U
 QAalXWyuYyNnEKPrAyRaIEWRMeWKMxHmjTMWI3VkylL051XvpQKfLOY7rGMOsGCQtBvL
 wVET1CqO6d+BXOg1V2/5sq5iu9sL0ZoGdvmGAbu56Zw0xXKktq9Cd3SRl4Ty8swRmlkf
 Z+5IHVr4VPhNyJvY/JdopwDU3Tz4QyWWUFYQ9HBzS0E/CjLqe0X21BJVRM1xA92vsiun
 lRuvIEQT1hTW6wReDq65LbDwxpOBsMqhToyE5j1XaGJOelaEwpnJs2Y0eWPcaJxj+T7R
 APUg==
X-Gm-Message-State: AOAM5300EMlsjgXOQ5tOw+wEP4k4xpFRG2wWfuGv98E7YO2or+E5xQzz
 L3Y5QFascxNq6yRBtkzClikoPA==
X-Google-Smtp-Source: ABdhPJz2TE1DUTP2gYgbYpqzk2YBXXmn/6/5nXauOsRprAXTduwGSEBH8jTvF2zMXHKPlYmIIZsAnw==
X-Received: by 2002:a2e:9e43:0:b0:24b:3c6:3832 with SMTP id
 g3-20020a2e9e43000000b0024b03c63832mr3059978ljk.63.1651871102772; 
 Fri, 06 May 2022 14:05:02 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a056512138b00b0047255d210fasm822996lfa.41.2022.05.06.14.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 14:05:02 -0700 (PDT)
Message-ID: <1ad06f9b-69e8-327f-f695-3a833459b2ed@linaro.org>
Date: Sat, 7 May 2022 00:05:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v10 1/4] drm/msm/dp: Add eDP support via aux_bus
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <1650887072-16652-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650887072-16652-2-git-send-email-quic_sbillaka@quicinc.com>
 <8fe3f9cd-546d-539b-cba4-8479d780a4c5@linaro.org>
 <30e4f4db-9c4c-af90-f1d2-ec39019f95a5@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <30e4f4db-9c4c-af90-f1d2-ec39019f95a5@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, bjorn.andersson@linaro.org,
 quic_vproddut@quicinc.com, airlied@linux.ie, dianders@chromium.org,
 steev@kali.org, quic_khsieh@quicinc.com, seanpaul@chromium.org,
 quic_aravindh@quicinc.com, swboyd@chromium.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/05/2022 00:03, Abhinav Kumar wrote:
> 
> 
> On 5/6/2022 1:49 PM, Dmitry Baryshkov wrote:
>> On 25/04/2022 14:44, Sankeerth Billakanti wrote:
>>> This patch adds support for generic eDP sink through aux_bus. The eDP/DP
>>> controller driver should support aux transactions originating from the
>>> panel-edp driver and hence should be initialized and ready.
>>>
>>> The panel bridge supporting the panel should be ready before the bridge
>>> connector is initialized. The generic panel probe needs the controller
>>> resources to be enabled to support the aux transactions originating from
>>> the panel probe.
>>>
>>> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
>>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>>
>> An additional side effect from this patch. Previously missing panel 
>> would have caused the bind error. Now it is the dp_modeset_init error, 
>> which translates to kms_hw_init returning -517. I kind ask to move the 
>> next_bridge acquisition back to the dp_bind in one of the followup 
>> patches.
>>
> 
> This is true. But the end result would be same isnt it?
> 
> When dp_display_bind() failed earlier, it would cause master bind 
> failure too due to component model.
> 
> Even now, it causes the same result?

Yes, it helped us to uncover several error. But I'd still prefer to have 
EPROBE_DEFER being returned earlier rather than later.

> 
>>> ---
>>> Changes in v10:
>>>    - modify the error handling condition
>>>    - modify the kernel doc
>>>
>>> Changes in v9:
>>>    - add comments for panel probe
>>>    - modify the error handling checks
>>>
>>> Changes in v8:
>>>    - handle corner cases
>>>    - add comment for the bridge ops
>>>
>>> Changes in v7:
>>>    - aux_bus is mandatory for eDP
>>>    - connector type check modified to just check for eDP
>>>
>>> Changes in v6:
>>>    - Remove initialization
>>>    - Fix aux_bus node leak
>>>    - Split the patches
>>>
>>>   drivers/gpu/drm/msm/dp/dp_display.c | 72 
>>> ++++++++++++++++++++++++++++++++++---
>>>   drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>>>   drivers/gpu/drm/msm/dp/dp_drm.c     | 21 ++++++++---
>>>   drivers/gpu/drm/msm/dp/dp_parser.c  | 23 ++----------
>>>   drivers/gpu/drm/msm/dp/dp_parser.h  | 14 +++++++-
>>>   5 files changed, 101 insertions(+), 30 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>>> b/drivers/gpu/drm/msm/dp/dp_display.c
>>> index d7a19d6..f772d84 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>> @@ -10,6 +10,7 @@
>>>   #include <linux/component.h>
>>>   #include <linux/of_irq.h>
>>>   #include <linux/delay.h>
>>> +#include <drm/dp/drm_dp_aux_bus.h>
>>>   #include "msm_drv.h"
>>>   #include "msm_kms.h"
>>> @@ -259,14 +260,12 @@ static int dp_display_bind(struct device *dev, 
>>> struct device *master,
>>>       dp->dp_display.drm_dev = drm;
>>>       priv->dp[dp->id] = &dp->dp_display;
>>> -    rc = dp->parser->parse(dp->parser, dp->dp_display.connector_type);
>>> +    rc = dp->parser->parse(dp->parser);
>>>       if (rc) {
>>>           DRM_ERROR("device tree parsing failed\n");
>>>           goto end;
>>>       }
>>> -    dp->dp_display.next_bridge = dp->parser->next_bridge;
>>> -
>>>       dp->aux->drm_dev = drm;
>>>       rc = dp_aux_register(dp->aux);
>>>       if (rc) {
>>> @@ -1319,6 +1318,8 @@ static int dp_display_probe(struct 
>>> platform_device *pdev)
>>>       dp->pdev = pdev;
>>>       dp->name = "drm_dp";
>>>       dp->dp_display.connector_type = desc->connector_type;
>>> +    dp->dp_display.is_edp =
>>> +        (dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
>>>       rc = dp_init_sub_modules(dp);
>>>       if (rc) {
>>> @@ -1508,7 +1509,8 @@ void msm_dp_irq_postinstall(struct msm_dp 
>>> *dp_display)
>>>       dp_hpd_event_setup(dp);
>>> -    dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
>>> +    if (!dp_display->is_edp)
>>> +        dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
>>>   }
>>>   void msm_dp_debugfs_init(struct msm_dp *dp_display, struct 
>>> drm_minor *minor)
>>> @@ -1530,6 +1532,64 @@ void msm_dp_debugfs_init(struct msm_dp 
>>> *dp_display, struct drm_minor *minor)
>>>       }
>>>   }
>>> +static int dp_display_get_next_bridge(struct msm_dp *dp)
>>> +{
>>> +    int rc;
>>> +    struct dp_display_private *dp_priv;
>>> +    struct device_node *aux_bus;
>>> +    struct device *dev;
>>> +
>>> +    dp_priv = container_of(dp, struct dp_display_private, dp_display);
>>> +    dev = &dp_priv->pdev->dev;
>>> +    aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
>>> +
>>> +    if (aux_bus && dp->is_edp) {
>>> +        dp_display_host_init(dp_priv);
>>> +        dp_catalog_ctrl_hpd_config(dp_priv->catalog);
>>> +        dp_display_host_phy_init(dp_priv);
>>> +        enable_irq(dp_priv->irq);
>>> +
>>> +        /*
>>> +         * The code below assumes that the panel will finish probing
>>> +         * by the time devm_of_dp_aux_populate_ep_devices() returns.
>>> +         * This isn't a great assumption since it will fail if the
>>> +         * panel driver is probed asynchronously but is the best we
>>> +         * can do without a bigger driver reorganization.
>>> +         */
>>> +        rc = devm_of_dp_aux_populate_ep_devices(dp_priv->aux);
>>> +        of_node_put(aux_bus);
>>> +        if (rc)
>>> +            goto error;
>>> +    } else if (dp->is_edp) {
>>> +        DRM_ERROR("eDP aux_bus not found\n");
>>> +        return -ENODEV;
>>> +    }
>>> +
>>> +    /*
>>> +     * External bridges are mandatory for eDP interfaces: one has to
>>> +     * provide at least an eDP panel (which gets wrapped into 
>>> panel-bridge).
>>> +     *
>>> +     * For DisplayPort interfaces external bridges are optional, so
>>> +     * silently ignore an error if one is not present (-ENODEV).
>>> +     */
>>> +    rc = dp_parser_find_next_bridge(dp_priv->parser);
>>> +    if (!dp->is_edp && rc == -ENODEV)
>>> +        return 0;
>>> +
>>> +    if (!rc) {
>>> +        dp->next_bridge = dp_priv->parser->next_bridge;
>>> +        return 0;
>>> +    }
>>> +
>>> +error:
>>> +    if (dp->is_edp) {
>>> +        disable_irq(dp_priv->irq);
>>> +        dp_display_host_phy_exit(dp_priv);
>>> +        dp_display_host_deinit(dp_priv);
>>> +    }
>>> +    return rc;
>>> +}
>>> +
>>>   int msm_dp_modeset_init(struct msm_dp *dp_display, struct 
>>> drm_device *dev,
>>>               struct drm_encoder *encoder)
>>>   {
>>> @@ -1553,6 +1613,10 @@ int msm_dp_modeset_init(struct msm_dp 
>>> *dp_display, struct drm_device *dev,
>>>       dp_display->encoder = encoder;
>>> +    ret = dp_display_get_next_bridge(dp_display);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>>       dp_display->bridge = dp_bridge_init(dp_display, dev, encoder);
>>>       if (IS_ERR(dp_display->bridge)) {
>>>           ret = PTR_ERR(dp_display->bridge);
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h 
>>> b/drivers/gpu/drm/msm/dp/dp_display.h
>>> index 49a1d89..1377cc3 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_display.h
>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
>>> @@ -21,6 +21,7 @@ struct msm_dp {
>>>       bool audio_enabled;
>>>       bool power_on;
>>>       unsigned int connector_type;
>>> +    bool is_edp;
>>>       hdmi_codec_plugged_cb plugged_cb;
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c 
>>> b/drivers/gpu/drm/msm/dp/dp_drm.c
>>> index 7ce1aca..8a75c55 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
>>> @@ -114,10 +114,23 @@ struct drm_bridge *dp_bridge_init(struct msm_dp 
>>> *dp_display, struct drm_device *
>>>       bridge->funcs = &dp_bridge_ops;
>>>       bridge->type = dp_display->connector_type;
>>> -    bridge->ops =
>>> -        DRM_BRIDGE_OP_DETECT |
>>> -        DRM_BRIDGE_OP_HPD |
>>> -        DRM_BRIDGE_OP_MODES;
>>> +    /*
>>> +     * Many ops only make sense for DP. Why?
>>> +     * - Detect/HPD are used by DRM to know if a display is 
>>> _physically_
>>> +     *   there, not whether the display is powered on / finished 
>>> initting.
>>> +     *   On eDP we assume the display is always there because you can't
>>> +     *   know until power is applied. If we don't implement the ops 
>>> DRM will
>>> +     *   assume our display is always there.
>>> +     * - Currently eDP mode reading is driven by the panel driver. This
>>> +     *   allows the panel driver to properly power itself on to read 
>>> the
>>> +     *   modes.
>>> +     */
>>> +    if (!dp_display->is_edp) {
>>> +        bridge->ops =
>>> +            DRM_BRIDGE_OP_DETECT |
>>> +            DRM_BRIDGE_OP_HPD |
>>> +            DRM_BRIDGE_OP_MODES;
>>> +    }
>>>       rc = drm_bridge_attach(encoder, bridge, NULL, 
>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>>       if (rc) {
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c 
>>> b/drivers/gpu/drm/msm/dp/dp_parser.c
>>> index 1056b8d..4bdbf91 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
>>> @@ -265,7 +265,7 @@ static int dp_parser_clock(struct dp_parser *parser)
>>>       return 0;
>>>   }
>>> -static int dp_parser_find_next_bridge(struct dp_parser *parser)
>>> +int dp_parser_find_next_bridge(struct dp_parser *parser)
>>>   {
>>>       struct device *dev = &parser->pdev->dev;
>>>       struct drm_bridge *bridge;
>>> @@ -279,7 +279,7 @@ static int dp_parser_find_next_bridge(struct 
>>> dp_parser *parser)
>>>       return 0;
>>>   }
>>> -static int dp_parser_parse(struct dp_parser *parser, int 
>>> connector_type)
>>> +static int dp_parser_parse(struct dp_parser *parser)
>>>   {
>>>       int rc = 0;
>>> @@ -300,25 +300,6 @@ static int dp_parser_parse(struct dp_parser 
>>> *parser, int connector_type)
>>>       if (rc)
>>>           return rc;
>>> -    /*
>>> -     * External bridges are mandatory for eDP interfaces: one has to
>>> -     * provide at least an eDP panel (which gets wrapped into 
>>> panel-bridge).
>>> -     *
>>> -     * For DisplayPort interfaces external bridges are optional, so
>>> -     * silently ignore an error if one is not present (-ENODEV).
>>> -     */
>>> -    rc = dp_parser_find_next_bridge(parser);
>>> -    if (rc == -ENODEV) {
>>> -        if (connector_type == DRM_MODE_CONNECTOR_eDP) {
>>> -            DRM_ERROR("eDP: next bridge is not present\n");
>>> -            return rc;
>>> -        }
>>> -    } else if (rc) {
>>> -        if (rc != -EPROBE_DEFER)
>>> -            DRM_ERROR("DP: error parsing next bridge: %d\n", rc);
>>> -        return rc;
>>> -    }
>>> -
>>>       /* Map the corresponding regulator information according to
>>>        * version. Currently, since we only have one supported platform,
>>>        * mapping the regulator directly.
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h 
>>> b/drivers/gpu/drm/msm/dp/dp_parser.h
>>> index d371bae..3a4d797 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
>>> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
>>> @@ -125,7 +125,7 @@ struct dp_parser {
>>>       u32 max_dp_lanes;
>>>       struct drm_bridge *next_bridge;
>>> -    int (*parse)(struct dp_parser *parser, int connector_type);
>>> +    int (*parse)(struct dp_parser *parser);
>>>   };
>>>   /**
>>> @@ -141,4 +141,16 @@ struct dp_parser {
>>>    */
>>>   struct dp_parser *dp_parser_get(struct platform_device *pdev);
>>> +/**
>>> + * dp_parser_find_next_bridge() - find an additional bridge to DP
>>> + *
>>> + * @parser: dp_parser data from client
>>> + *
>>> + * This function is used to find any additional bridge attached to
>>> + * the DP controller. The eDP interface requires a panel bridge.
>>> + *
>>> + * Return: 0 if able to get the bridge, otherwise negative errno for 
>>> failure.
>>> + */
>>> +int dp_parser_find_next_bridge(struct dp_parser *parser);
>>> +
>>>   #endif
>>
>>


-- 
With best wishes
Dmitry
