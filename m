Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6449F7BEA3D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 21:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5939610E2C7;
	Mon,  9 Oct 2023 19:01:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2BD10E1A5
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 19:01:33 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50305abe5f0so6463379e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 12:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696878092; x=1697482892; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sQRa7Z0itLNvQQvFmb48s32crEbJ5leinJHM1uy9rHo=;
 b=AISmBf8WWa4l9jSemIgz00WJpTbM94noGjVU73ALtzQ8qebEtsDhQV+03vryRNeFJC
 N1y24D+4S22OM6knVgc7jMCgWtq+00jzZKUEmH6xwhBwk6JcGNP2BqKj3uN2qoE1ZwgL
 /57jdado6HP/fNjc7NrUKb/haOsyInXhj3UN70DUWar5WkB//rQfvot03q2Fn7nOX1JN
 p2t1ZqS48IoN7Xyx4XtUF3KQqJE8AFR1gzU0Y7dCL5faE/8sTrEdGy38wu6U8QK4mpQe
 fEx67NDXDLc0fCnhnkZ84rXVYqgHkpnN3cEIjkrl6G/mKJwpagiTDH1igBRzfE6jAi6R
 Cy2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696878092; x=1697482892;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sQRa7Z0itLNvQQvFmb48s32crEbJ5leinJHM1uy9rHo=;
 b=O4IIVzAUMKzdCQ1kvkwsvkE4RzEf7u6XCdNnoVCrHArVzWwfyO+pDIx8wbTJSwdzz1
 vWE3oq3KNbPdcvCjY6rlAyXuVAc3BSY2KgAwEp0iJ3SNkIHq736qZI4//7XHtPV4dBLF
 ysq/Fcses8eNf58EgbEbv3I0CMJVNnRiK+O3/y5af+LdcePcXYRnCWTlAswUi7O8xjIq
 2W6reV9w79ATdCeWUh3Mgqa0CwmbJK9WOZXFKwA9zoEvZycZy211m5XtbI/X9ZhLXHRV
 AWk2y+YeI74Me/JGLdquViImYALZijGZgiL5ZM+KP2buoVXxRLjfilYxKNf+b26PrEIm
 7gSQ==
X-Gm-Message-State: AOJu0YyHBvlTL6UCQ6ucBBAPZd5sXKOaAC4U1aOEq9WV3PvGbkhIHk2m
 UxB7+zyCWjlbYj0KT0qXaA//Wg==
X-Google-Smtp-Source: AGHT+IFdmlo3WD/utX3PApaKhD2XbKsYr7D00mGHP8ljVc9xIubtkwcWBI+UgQZqKuUplLltBNOnnA==
X-Received: by 2002:a05:6512:3415:b0:501:bf37:1fc0 with SMTP id
 i21-20020a056512341500b00501bf371fc0mr19064122lfr.33.1696878091412; 
 Mon, 09 Oct 2023 12:01:31 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 l4-20020ac24304000000b0050481c400e9sm1528086lfh.287.2023.10.09.12.01.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Oct 2023 12:01:30 -0700 (PDT)
Message-ID: <015b688e-836f-4cdb-a139-ed7ceb1489ef@linaro.org>
Date: Mon, 9 Oct 2023 22:01:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/13] drm/msm/dsi: switch to devm_drm_bridge_add()
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
 <20231009181040.2743847-2-dmitry.baryshkov@linaro.org>
 <9cd7fcd1-19c3-ed9b-568d-4b67b3649e86@quicinc.com>
 <0b201558-d794-4675-a20f-58d00a8b1a53@linaro.org>
 <e3208975-84cb-5c44-2397-c6b31103659b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <e3208975-84cb-5c44-2397-c6b31103659b@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/10/2023 21:51, Abhinav Kumar wrote:
> 
> 
> On 10/9/2023 11:46 AM, Dmitry Baryshkov wrote:
>> On 09/10/2023 21:39, Abhinav Kumar wrote:
>>>
>>>
>>> On 10/9/2023 11:10 AM, Dmitry Baryshkov wrote:
>>>> Make MSM DSI driver use devm_drm_bridge_add() instead of plain
>>>> drm_bridge_add(). As the driver doesn't require any additional cleanup,
>>>> stop adding created bridge to the priv->bridges array.
>>>>
>>>> Reviewed-by: Rob Clark <robdclark@gmail.com>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>   drivers/gpu/drm/msm/dsi/dsi.c         | 28 +++++--------------------
>>>>   drivers/gpu/drm/msm/dsi/dsi.h         |  3 +--
>>>>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 30 
>>>> +++++++++------------------
>>>>   3 files changed, 16 insertions(+), 45 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c 
>>>> b/drivers/gpu/drm/msm/dsi/dsi.c
>>>> index d45e43024802..47f327e68471 100644
>>>> --- a/drivers/gpu/drm/msm/dsi/dsi.c
>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
>>>> @@ -215,20 +215,14 @@ void __exit msm_dsi_unregister(void)
>>>>   int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct 
>>>> drm_device *dev,
>>>>                struct drm_encoder *encoder)
>>>>   {
>>>> -    struct msm_drm_private *priv = dev->dev_private;
>>>>       int ret;
>>>> -    if (priv->num_bridges == ARRAY_SIZE(priv->bridges)) {
>>>> -        DRM_DEV_ERROR(dev->dev, "too many bridges\n");
>>>> -        return -ENOSPC;
>>>> -    }
>>>> -
>>>>       msm_dsi->dev = dev;
>>>>       ret = msm_dsi_host_modeset_init(msm_dsi->host, dev);
>>>>       if (ret) {
>>>>           DRM_DEV_ERROR(dev->dev, "failed to modeset init host: 
>>>> %d\n", ret);
>>>> -        goto fail;
>>>> +        return ret;
>>>>       }
>>>>       if (msm_dsi_is_bonded_dsi(msm_dsi) &&
>>>> @@ -242,32 +236,20 @@ int msm_dsi_modeset_init(struct msm_dsi 
>>>> *msm_dsi, struct drm_device *dev,
>>>>       msm_dsi->encoder = encoder;
>>>> -    msm_dsi->bridge = msm_dsi_manager_bridge_init(msm_dsi->id);
>>>> -    if (IS_ERR(msm_dsi->bridge)) {
>>>> -        ret = PTR_ERR(msm_dsi->bridge);
>>>> +    ret = msm_dsi_manager_bridge_init(msm_dsi);
>>>> +    if (ret) {
>>>>           DRM_DEV_ERROR(dev->dev, "failed to create dsi bridge: 
>>>> %d\n", ret);
>>>> -        msm_dsi->bridge = NULL;
>>>> -        goto fail;
>>>> +        return ret;
>>>>       }
>>>>       ret = msm_dsi_manager_ext_bridge_init(msm_dsi->id);
>>>>       if (ret) {
>>>>           DRM_DEV_ERROR(dev->dev,
>>>>               "failed to create dsi connector: %d\n", ret);
>>>> -        goto fail;
>>>> +        return ret;
>>>>       }
>>>> -    priv->bridges[priv->num_bridges++]       = msm_dsi->bridge;
>>>> -
>>>>       return 0;
>>>> -fail:
>>>> -    /* bridge/connector are normally destroyed by drm: */
>>>> -    if (msm_dsi->bridge) {
>>>> -        msm_dsi_manager_bridge_destroy(msm_dsi->bridge);
>>>> -        msm_dsi->bridge = NULL;
>>>> -    }
>>>
>>> We can drop msm_dsi_manager_bridge_destroy() now but dont we need to 
>>> keep the part to reset msm_dsi->bridge to NULL in the fail tag if 
>>> msm_dsi_manager_ext_bridge_init() fails?
>>
>> What for? This field is not read in the error /unbinding path.
>> I'll send a followup that drops msm_dsi->bridge completely.
>>
> 
> Not used in the error path. The behavior before this patch was, if 
> msm_dsi_manager_ext_bridge_init failed, it was marking msm_dsi->bridge 
> as NULL. Thats what I thought you would want to retain till you drop the 
> msm_dsi->bridge.

Why would you like to keep the useless behaviour?

> OR you can even add that line in the if (ret) of 
> msm_dsi_manager_ext_bridge_init(msm_dsi->id); failure.
> 
>>>
>>>> -
>>>> -    return ret;
>>>>   }
>>>>   void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct 
>>>> msm_dsi *msm_dsi)
>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
>>>> b/drivers/gpu/drm/msm/dsi/dsi.h
>>>> index d21867da78b8..a01c326774a6 100644
>>>> --- a/drivers/gpu/drm/msm/dsi/dsi.h
>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
>>>> @@ -56,8 +56,7 @@ struct msm_dsi {
>>>>   };
>>>>   /* dsi manager */
>>>> -struct drm_bridge *msm_dsi_manager_bridge_init(u8 id);
>>>> -void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge);
>>>> +int msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi);
>>>>   int msm_dsi_manager_ext_bridge_init(u8 id);
>>>>   int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg);
>>>>   bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 len);
>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c 
>>>> b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>>> index 28b8012a21f2..17aa19bb6510 100644
>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>>> @@ -466,9 +466,8 @@ static const struct drm_bridge_funcs 
>>>> dsi_mgr_bridge_funcs = {
>>>>   };
>>>>   /* initialize bridge */
>>>> -struct drm_bridge *msm_dsi_manager_bridge_init(u8 id)
>>>> +int msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi)
>>>>   {
>>>> -    struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>>>       struct drm_bridge *bridge = NULL;
>>>>       struct dsi_bridge *dsi_bridge;
>>>>       struct drm_encoder *encoder;
>>>> @@ -476,31 +475,27 @@ struct drm_bridge 
>>>> *msm_dsi_manager_bridge_init(u8 id)
>>>>       dsi_bridge = devm_kzalloc(msm_dsi->dev->dev,
>>>>                   sizeof(*dsi_bridge), GFP_KERNEL);
>>>> -    if (!dsi_bridge) {
>>>> -        ret = -ENOMEM;
>>>> -        goto fail;
>>>> -    }
>>>> +    if (!dsi_bridge)
>>>> +        return -ENOMEM;
>>>> -    dsi_bridge->id = id;
>>>> +    dsi_bridge->id = msm_dsi->id;
>>>>       encoder = msm_dsi->encoder;
>>>>       bridge = &dsi_bridge->base;
>>>>       bridge->funcs = &dsi_mgr_bridge_funcs;
>>>> -    drm_bridge_add(bridge);
>>>> +    ret = devm_drm_bridge_add(&msm_dsi->pdev->dev, bridge);
>>>> +    if (ret)
>>>> +        return ret;
>>>>       ret = drm_bridge_attach(encoder, bridge, NULL, 0);
>>>>       if (ret)
>>>> -        goto fail;
>>>> +        return ret;
>>>> -    return bridge;
>>>> +    msm_dsi->bridge = bridge;
>>>> -fail:
>>>> -    if (bridge)
>>>> -        msm_dsi_manager_bridge_destroy(bridge);
>>>> -
>>>> -    return ERR_PTR(ret);
>>>> +    return 0;
>>>>   }
>>>>   int msm_dsi_manager_ext_bridge_init(u8 id)
>>>> @@ -557,11 +552,6 @@ int msm_dsi_manager_ext_bridge_init(u8 id)
>>>>       return 0;
>>>>   }
>>>> -void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge)
>>>> -{
>>>> -    drm_bridge_remove(bridge);
>>>> -}
>>>> -
>>>>   int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg)
>>>>   {
>>>>       struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>

-- 
With best wishes
Dmitry

