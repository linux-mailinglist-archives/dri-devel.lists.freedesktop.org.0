Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D096A7626C5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 00:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DDE810E1A6;
	Tue, 25 Jul 2023 22:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBCC10E1A6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 22:34:01 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b9b5ee9c5aso671001fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 15:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690324439; x=1690929239;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+q0s/DwiqiE6dEjrgVx133qqoVLemgwKwO1eiag9Cds=;
 b=IqG4Dyjra4ijXkZkkf00BQtdu7kBinSMfzCntuaqPgKTDxWokiGRCMumlOa1+jp9aE
 eJvlHFNOnnbKSRM2YowhhSY/ANSGIhVaImnHv5tykj94vLWNZW/AQyr83e6ljfHmNQ7z
 4hb/rXBsTKwK34a2tv7mN0ikSDJPZ3kYUue7NvdqzSNNuRbd7FZ9/G6ylkbQlXF9O+6V
 AlvBLPmQP7QQXv0jXU51ptOYZeZwJpVunRPQwuXme65IaPxNGuWKDTuMVmtPt0lo4wcU
 cXNXq353yLcoxsMOnQwz90h9ErI02fePZegUNWdo3NUVL6AdRzUtdeCnm8WH7f+g4y70
 xOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690324439; x=1690929239;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+q0s/DwiqiE6dEjrgVx133qqoVLemgwKwO1eiag9Cds=;
 b=d1LgOHr4BskP8DJVCxYAgZ5iqWG8Rx8OnBKTLY2ulKN24z/GEsyGks2og2LHkSW6JN
 ZUXB6dxg4rpU16Bum4q1MIN8RnK1EZw3/Slal/u5yyw/5vzFm4pBeUkYpy2C4r7b9WU2
 AtKMY40rRSA8aCGDb+N2ib1BbiSwsiNyhU9oKkoIifEC52n2MZ4g/MtWa8KOGzvrYqJy
 e/apW6Oypgk6Rl0zXrwGmszMYfutSUhUbme63xIMa7fRRoT5f3bbmPCiGFbyao37LVFU
 sOzpgn/s2GR2Y/7SsCNLXE0PODsI4u2ZJLHjl2rSkPFQmWfidDkF74T3wswjyLuMGH0I
 yGxg==
X-Gm-Message-State: ABy/qLZe/9+xtWsPStJPENBI6ateKoThy9Hve/rQOski5u8XOGK/9QyI
 CiX+Q7jx6NxzgbgjisYZ1OX+Ew==
X-Google-Smtp-Source: APBJJlEbfcO8ew8CL0pNfInmj8EMozGYnVxCgypoVRCtT4kf4ePVJWZs2CQc/WmHBnCiwmiomv/zVQ==
X-Received: by 2002:a2e:7213:0:b0:2b6:9f95:46d9 with SMTP id
 n19-20020a2e7213000000b002b69f9546d9mr73715ljc.46.1690324438898; 
 Tue, 25 Jul 2023 15:33:58 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a2e90c7000000b002b6c92fa161sm3669937ljg.61.2023.07.25.15.33.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jul 2023 15:33:58 -0700 (PDT)
Message-ID: <a7405272-6a9e-b0c4-f749-060dbe716148@linaro.org>
Date: Wed, 26 Jul 2023 01:33:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Freedreno] [PATCH v1 2/5] drm/msm/dp: incorporate pm_runtime
 framework into DP driver
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>
References: <1688773943-3887-1-git-send-email-quic_khsieh@quicinc.com>
 <1688773943-3887-3-git-send-email-quic_khsieh@quicinc.com>
 <oc6cohs6pbiuyirdxgepoharuzdra2hzy3kwfqjmdfcq36y367@ah3bal2jqncb>
 <0ac305d2-d0a9-cdfb-9be8-243402d865e7@quicinc.com>
 <44299d05-d411-e9c4-7b96-84efb28d47c9@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <44299d05-d411-e9c4-7b96-84efb28d47c9@quicinc.com>
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
Cc: sean@poorly.run, vkoul@kernel.org, quic_sbillaka@quicinc.com,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
 marijn.suijten@somainline.org, swboyd@chromium.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/07/2023 01:25, Kuogee Hsieh wrote:
> 
> On 7/10/2023 9:22 AM, Kuogee Hsieh wrote:
>>
>> On 7/8/2023 7:52 PM, Bjorn Andersson wrote:
>>> On Fri, Jul 07, 2023 at 04:52:20PM -0700, Kuogee Hsieh wrote:
>>>> Incorporating pm runtime framework into DP driver so that power
>>>> and clock resource handling can be centralized allowing easier
>>>> control of these resources in preparation of registering aux bus
>>>> uring probe.
>>>>
>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>> ---
>>>>   drivers/gpu/drm/msm/dp/dp_aux.c     |  3 ++
>>>>   drivers/gpu/drm/msm/dp/dp_display.c | 75 
>>>> +++++++++++++++++++++++++++++--------
>>>>   2 files changed, 63 insertions(+), 15 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c 
>>>> b/drivers/gpu/drm/msm/dp/dp_aux.c
>>>> index 8e3b677..c592064 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
>>>> @@ -291,6 +291,7 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux 
>>>> *dp_aux,
>>>>           return -EINVAL;
>>>>       }
>>>>   +    pm_runtime_get_sync(dp_aux->dev);
>>>>       mutex_lock(&aux->mutex);
>>>>       if (!aux->initted) {
>>>>           ret = -EIO;
>>>> @@ -364,6 +365,8 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux 
>>>> *dp_aux,
>>>>     exit:
>>>>       mutex_unlock(&aux->mutex);
>>>> +    pm_runtime_mark_last_busy(dp_aux->dev);
>>>> +    pm_runtime_put_autosuspend(dp_aux->dev);
>>>>         return ret;
>>>>   }
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>>>> b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> index 76f1395..2c5706a 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> @@ -309,6 +309,10 @@ static int dp_display_bind(struct device *dev, 
>>>> struct device *master,
>>>>           goto end;
>>>>       }
>>>>   +    pm_runtime_enable(dev);
>>>> +    pm_runtime_set_autosuspend_delay(dev, 1000);
>>>> +    pm_runtime_use_autosuspend(dev);
>>>> +
>>>>       return 0;
>>>>   end:
>>>>       return rc;
>>>> @@ -320,9 +324,8 @@ static void dp_display_unbind(struct device 
>>>> *dev, struct device *master,
>>>>       struct dp_display_private *dp = dev_get_dp_display_private(dev);
>>>>       struct msm_drm_private *priv = dev_get_drvdata(master);
>>>>   -    /* disable all HPD interrupts */
>>>> -    if (dp->core_initialized)
>>>> -        dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, 
>>>> false);
>>>> +    pm_runtime_dont_use_autosuspend(dev);
>>>> +    pm_runtime_disable(dev);
>>>>         kthread_stop(dp->ev_tsk);
>>>>   @@ -466,10 +469,12 @@ static void dp_display_host_init(struct 
>>>> dp_display_private *dp)
>>>>           dp->dp_display.connector_type, dp->core_initialized,
>>>>           dp->phy_initialized);
>>>>   -    dp_power_init(dp->power);
>>>> -    dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
>>>> -    dp_aux_init(dp->aux);
>>>> -    dp->core_initialized = true;
>>>> +    if (!dp->core_initialized) {
>>>> +        dp_power_init(dp->power);
>>>> +        dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
>>>> +        dp_aux_init(dp->aux);
>>>> +        dp->core_initialized = true;
>>> There are two cases that queries core_initialized, both of those are
>>> done to avoid accessing the DP block without it first being powered up.
>>> With the introduction of runtime PM, it seems reasonable to just power
>>> up the block in those two code paths (and remove the variable).
>>>
>>>> +    }
>>>>   }
>>>>     static void dp_display_host_deinit(struct dp_display_private *dp)
>>>> @@ -478,10 +483,12 @@ static void dp_display_host_deinit(struct 
>>>> dp_display_private *dp)
>>>>           dp->dp_display.connector_type, dp->core_initialized,
>>>>           dp->phy_initialized);
>>>>   -    dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
>>>> -    dp_aux_deinit(dp->aux);
>>>> -    dp_power_deinit(dp->power);
>>>> -    dp->core_initialized = false;
>>>> +    if (dp->core_initialized) {
>>>> +        dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
>>>> +        dp_aux_deinit(dp->aux);
>>>> +        dp_power_deinit(dp->power);
>>>> +        dp->core_initialized = false;
>>>> +    }
>>>>   }
>>>>     static int dp_display_usbpd_configure_cb(struct device *dev)
>>>> @@ -1304,6 +1311,39 @@ static int dp_display_remove(struct 
>>>> platform_device *pdev)
>>>>       dp_display_deinit_sub_modules(dp);
>>>>         platform_set_drvdata(pdev, NULL);
>>>> +    pm_runtime_put_sync_suspend(&pdev->dev);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int dp_pm_runtime_suspend(struct device *dev)
>>>> +{
>>>> +    struct platform_device *pdev = to_platform_device(dev);
>>>> +    struct msm_dp *dp_display = platform_get_drvdata(pdev);
>>> platform_get_drvdata() is a wrapper for dev_get_drvdata(&pdev->dev), so
>>> there's no need to resolve the platform_device first...
>>>
>>>> +    struct dp_display_private *dp;
>>>> +
>>>> +    dp = container_of(dp_display, struct dp_display_private, 
>>>> dp_display);
>>>> +
>>>> +    dp_display_host_phy_exit(dp);
>>>> +    dp_catalog_ctrl_hpd_enable(dp->catalog);
>>>> +    dp_display_host_deinit(dp);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int dp_pm_runtime_resume(struct device *dev)
>>>> +{
>>>> +    struct platform_device *pdev = to_platform_device(dev);
>>>> +    struct msm_dp *dp_display = platform_get_drvdata(pdev);
>>>> +    struct dp_display_private *dp;
>>>> +
>>>> +    dp = container_of(dp_display, struct dp_display_private, 
>>>> dp_display);
>>>> +
>>>> +    dp_display_host_init(dp);
>>>> +    if (dp_display->is_edp) {
>>>> +        dp_catalog_ctrl_hpd_enable(dp->catalog);
>>>> +        dp_display_host_phy_init(dp);
>>>> +    }
>>>>         return 0;
>>>>   }
>>>> @@ -1409,6 +1449,7 @@ static int dp_pm_suspend(struct device *dev)
>>>>   }
>>>>     static const struct dev_pm_ops dp_pm_ops = {
>>>> +    SET_RUNTIME_PM_OPS(dp_pm_runtime_suspend, dp_pm_runtime_resume, 
>>>> NULL)
>>>>       .suspend = dp_pm_suspend,
>>>>       .resume =  dp_pm_resume,
>>>>   };
>>>> @@ -1493,10 +1534,6 @@ static int dp_display_get_next_bridge(struct 
>>>> msm_dp *dp)
>>>>       aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
>>>>         if (aux_bus && dp->is_edp) {
>>>> -        dp_display_host_init(dp_priv);
>>>> -        dp_catalog_ctrl_hpd_enable(dp_priv->catalog);
>>>> -        dp_display_host_phy_init(dp_priv);
>>> I'm probably just missing it, but how do we get here with the host
>>> powered up and the phy initialized?
>>
>> if (!dp->core_initialized)  is at dp_display_host_init()
>>
>>>
>>>> -
>>>>           /*
>>>>            * The code below assumes that the panel will finish probing
>>>>            * by the time devm_of_dp_aux_populate_ep_devices() returns.
>>>> @@ -1604,6 +1641,7 @@ void dp_bridge_atomic_enable(struct drm_bridge 
>>>> *drm_bridge,
>>>>           dp_hpd_plug_handle(dp_display, 0);
>>>>         mutex_lock(&dp_display->event_mutex);
>>>> +    pm_runtime_get_sync(&dp_display->pdev->dev);
>>>>         state = dp_display->hpd_state;
>>>>       if (state != ST_DISPLAY_OFF && state != ST_MAINLINK_READY) {
>>>> @@ -1684,6 +1722,8 @@ void dp_bridge_atomic_post_disable(struct 
>>>> drm_bridge *drm_bridge,
>>>>       }
>>>>         drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
>>>> +
>>>> +    pm_runtime_put_sync(&dp_display->pdev->dev);
>>>>       mutex_unlock(&dp_display->event_mutex);
>>>>   }
>>>>   @@ -1723,6 +1763,8 @@ void dp_bridge_hpd_enable(struct drm_bridge 
>>>> *bridge)
>>>>       struct dp_display_private *dp = container_of(dp_display, 
>>>> struct dp_display_private, dp_display);
>>>>         mutex_lock(&dp->event_mutex);
>>>> +    pm_runtime_get_sync(&dp->pdev->dev);
>>>> +
>>>>       dp_catalog_ctrl_hpd_enable(dp->catalog);
>>>>         /* enable HDP interrupts */
>>>> @@ -1744,6 +1786,9 @@ void dp_bridge_hpd_disable(struct drm_bridge 
>>>> *bridge)
>>>>       dp_catalog_ctrl_hpd_disable(dp->catalog);
>>>>         dp_display->internal_hpd = false;
>>>> +
>>>> +    pm_runtime_mark_last_busy(&dp->pdev->dev);
>>>> +    pm_runtime_put_autosuspend(&dp->pdev->dev);
>>>>       mutex_unlock(&dp->event_mutex);
>>>>   }
>>> The runtime_get/put in dp_bridge_hpd_enable() and disable matches my
>>> expectations. But in the case that we have an external HPD source, where
>>> will the power be turned on?
>>>
>>> Note that you can test this on your device by routing the HPD GPIO to a
>>> display-connector instance and wiring this to the DP node. In the same
>>> way it's done here:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/sa8295p-adp.dts#n28
> 
> at sc7280, gpio-47 has function 2 as dp-hot-plug pin. but it does not 
> has function for general purpose pin.

It has a 'gpio' function, so that the pin can be used as a generic GPIO 
with a dp-connector device.

> 
> Just curious,  to work with external HPD source,
> 
> 1) which DRM_BRIDGE_OP_xxx should be used for bridge->ops?

There is no difference. The drm_bridge_connector will select the bridges 
according to the needs. E.g. the dp-connector can provide 
DRM_BRIDGE_OP_DETECT / OP_HPD (if the hpd-gpios property is configured). 
If it does, it will be selected for detection/HPD handling. If not, the 
main dp bridge will handle these operations.

> 
> 2) are both .hpd_enable and .hpd_disable  have to be populated?

No, they are both optional.

-- 
With best wishes
Dmitry

