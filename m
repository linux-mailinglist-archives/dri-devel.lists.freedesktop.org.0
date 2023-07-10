Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDC774DD15
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 20:09:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F5F10E2BF;
	Mon, 10 Jul 2023 18:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA7610E185
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 18:09:35 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4faaaa476a9so7617958e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 11:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689012574; x=1691604574;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/+vcMRZuH8e00aADkiBKSPktishrl5OOSExTXTMF+z4=;
 b=IATjbDCla2LKz9dUK0El6aCtxULGWX8iVvBIA4FMhHWcfL2jIwimtK/cc/Ck6fCBv1
 5EfH8/nEd+iewDcUOoQEuWk8FcFGraf95frc1pYIcyvcsfjKSROs+JGSiK8qAUPZI09u
 OFbl8OKrrHnTSgQ9CQ2U9jQ+7+4BRRpoZT4DFAwzT47oUUf+ic3cFt7mNDCLHoV0t980
 vqY4sgQdj5yTO+m5JqhhUaEWMS3ae/dY91ocgCAhIJyrkpQlnthjOc2KWm10I9UO7iLU
 8MFMIbFyAH3xt4kqgbGiPxQgR3P2BMVFfovzFvdWrTdjQsN2hMhZbpW0K5dSUBN0vng4
 6Eow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689012574; x=1691604574;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/+vcMRZuH8e00aADkiBKSPktishrl5OOSExTXTMF+z4=;
 b=PDQCpqC1WF02yswRW4maEzXCH1ZZcYwFV60HaT3QJdO2qAwLoksRD2qbmsTE1diDxt
 Jao3QYUk+ZIzEUgTds9xBCRuIsZ1//+gS/P7DF5LrDHb/gbwTU9BPSUGkEsgrvE674mw
 XbpJpQXV8ccgv1s5mg/ejXYi3hnmI0I3Q6MrynLCx93wPUbJdfAXCekquzCxws3ryNFO
 ZgI0yTFqsYZcWP2ViHrDd//BhSj1SsV7SW7wVGZRrMiuvXjmth0ieFXuJ6NOrwaV1i40
 iCkkMQASkNP17aU+PoGO4nf/8SLPLt7LhAHXyzNG7vyRBq3ZrIjns+8Kp/XS8x6836QT
 kfQQ==
X-Gm-Message-State: ABy/qLbdy/YR5QDFbh36qPCQhkZFtS77KmxzW+6cKuCwh1uzLK+w8iXN
 +KWVLvPugV1oMOysnIm+Lilr0g==
X-Google-Smtp-Source: APBJJlEk7Ukp7qTROFnmFRK4CejkXr6Pgwn00QgIFI2J8jJ0nA/c/nqv+AsJeHThB9oSNjLLLAz+WQ==
X-Received: by 2002:a19:670b:0:b0:4f8:742f:3bed with SMTP id
 b11-20020a19670b000000b004f8742f3bedmr10160306lfc.37.1689012573544; 
 Mon, 10 Jul 2023 11:09:33 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 eo6-20020a056512480600b004fb81fbeb33sm561lfb.251.2023.07.10.11.09.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jul 2023 11:09:33 -0700 (PDT)
Message-ID: <348ec5bf-157b-5d70-4f92-d5623dfc4e68@linaro.org>
Date: Mon, 10 Jul 2023 21:09:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 2/5] drm/msm/dp: incorporate pm_runtime framework into
 DP driver
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1688773943-3887-1-git-send-email-quic_khsieh@quicinc.com>
 <1688773943-3887-3-git-send-email-quic_khsieh@quicinc.com>
 <c551f77f-804f-3e45-6b15-680c70b86d37@linaro.org>
 <9d037933-6d55-9a4b-f3e4-8993816c4425@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <9d037933-6d55-9a4b-f3e4-8993816c4425@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/07/2023 19:18, Kuogee Hsieh wrote:
> 
> On 7/7/2023 5:04 PM, Dmitry Baryshkov wrote:
>> On 08/07/2023 02:52, Kuogee Hsieh wrote:
>>> Incorporating pm runtime framework into DP driver so that power
>>> and clock resource handling can be centralized allowing easier
>>> control of these resources in preparation of registering aux bus
>>> uring probe.
>>>
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/dp/dp_aux.c     |  3 ++
>>>   drivers/gpu/drm/msm/dp/dp_display.c | 75 
>>> +++++++++++++++++++++++++++++--------
>>>   2 files changed, 63 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c 
>>> b/drivers/gpu/drm/msm/dp/dp_aux.c
>>> index 8e3b677..c592064 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
>>> @@ -291,6 +291,7 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux 
>>> *dp_aux,
>>>           return -EINVAL;
>>>       }
>>>   +    pm_runtime_get_sync(dp_aux->dev);
>>
>> Let me quote the function's documentation:
>> Consider using pm_runtime_resume_and_get() instead of it, especially 
>> if its return value is checked by the caller, as this is likely to 
>> result in cleaner code.
> 
> pm_runtime_resume_and_get() will call pm_runtime_resume()  every time.
> 
> Since aux_transfer is called very frequently, is it just simple to call 
> pm_runtiem_get_sync() which will call pm_runtime_reusme() if power 
> counter is 0 before increased it.
> 
> otherwise it just increase power counter?

As you are adding meaningful runtime PM calls, you have to add error 
checking to these calls. Just calling pm_runtime_get_sync() is not enough.

And once you add error handling, you will see what is the difference 
between two mentioned functions and why one is suggested to be used 
instead of the other one.

> 
> 
>>
>> So two notes concerning the whole patch:
>> - error checking is missing
>> - please use pm_runtime_resume_and_get() instead.
>>
>>>       mutex_lock(&aux->mutex);
>>>       if (!aux->initted) {
>>>           ret = -EIO;
>>> @@ -364,6 +365,8 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux 
>>> *dp_aux,
>>>     exit:
>>>       mutex_unlock(&aux->mutex);
>>> +    pm_runtime_mark_last_busy(dp_aux->dev);
>>> +    pm_runtime_put_autosuspend(dp_aux->dev);
>>>         return ret;
>>>   }
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>>> b/drivers/gpu/drm/msm/dp/dp_display.c
>>> index 76f1395..2c5706a 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>> @@ -309,6 +309,10 @@ static int dp_display_bind(struct device *dev, 
>>> struct device *master,
>>>           goto end;
>>>       }
>>>   +    pm_runtime_enable(dev);
>>
>> devm_pm_runtime_enable() removes need for a cleanup.
>>
>>> +    pm_runtime_set_autosuspend_delay(dev, 1000);
>>> +    pm_runtime_use_autosuspend(dev);
>>
>> Why do you want to use autosuspend here?
>>
>>> +
>>>       return 0;
>>>   end:
>>>       return rc;
>>> @@ -320,9 +324,8 @@ static void dp_display_unbind(struct device *dev, 
>>> struct device *master,
>>>       struct dp_display_private *dp = dev_get_dp_display_private(dev);
>>>       struct msm_drm_private *priv = dev_get_drvdata(master);
>>>   -    /* disable all HPD interrupts */
>>> -    if (dp->core_initialized)
>>> -        dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, 
>>> false);
>>> +    pm_runtime_dont_use_autosuspend(dev);
>>> +    pm_runtime_disable(dev);
>>>         kthread_stop(dp->ev_tsk);
>>>   @@ -466,10 +469,12 @@ static void dp_display_host_init(struct 
>>> dp_display_private *dp)
>>>           dp->dp_display.connector_type, dp->core_initialized,
>>>           dp->phy_initialized);
>>>   -    dp_power_init(dp->power);
>>> -    dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
>>> -    dp_aux_init(dp->aux);
>>> -    dp->core_initialized = true;
>>> +    if (!dp->core_initialized) {
>>> +        dp_power_init(dp->power);
>>> +        dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
>>> +        dp_aux_init(dp->aux);
>>> +        dp->core_initialized = true;
>>> +    }
>>
>> Is this relevant to PM runtime? I don't think so.
>>
>>>   }
>>>     static void dp_display_host_deinit(struct dp_display_private *dp)
>>> @@ -478,10 +483,12 @@ static void dp_display_host_deinit(struct 
>>> dp_display_private *dp)
>>>           dp->dp_display.connector_type, dp->core_initialized,
>>>           dp->phy_initialized);
>>>   -    dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
>>> -    dp_aux_deinit(dp->aux);
>>> -    dp_power_deinit(dp->power);
>>> -    dp->core_initialized = false;
>>> +    if (dp->core_initialized) {
>>> +        dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
>>> +        dp_aux_deinit(dp->aux);
>>> +        dp_power_deinit(dp->power);
>>> +        dp->core_initialized = false;
>>> +    }
>>>   }
>>>     static int dp_display_usbpd_configure_cb(struct device *dev)
>>> @@ -1304,6 +1311,39 @@ static int dp_display_remove(struct 
>>> platform_device *pdev)
>>>       dp_display_deinit_sub_modules(dp);
>>>         platform_set_drvdata(pdev, NULL);
>>> +    pm_runtime_put_sync_suspend(&pdev->dev);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int dp_pm_runtime_suspend(struct device *dev)
>>> +{
>>> +    struct platform_device *pdev = to_platform_device(dev);
>>> +    struct msm_dp *dp_display = platform_get_drvdata(pdev);
>>> +    struct dp_display_private *dp;
>>> +
>>> +    dp = container_of(dp_display, struct dp_display_private, 
>>> dp_display);
>>> +
>>> +    dp_display_host_phy_exit(dp);
>>> +    dp_catalog_ctrl_hpd_enable(dp->catalog);
>>
>> What? NO!
>>
>>> +    dp_display_host_deinit(dp);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int dp_pm_runtime_resume(struct device *dev)
>>> +{
>>> +    struct platform_device *pdev = to_platform_device(dev);
>>> +    struct msm_dp *dp_display = platform_get_drvdata(pdev);
>>> +    struct dp_display_private *dp;
>>> +
>>> +    dp = container_of(dp_display, struct dp_display_private, 
>>> dp_display);
>>> +
>>> +    dp_display_host_init(dp);
>>> +    if (dp_display->is_edp) {
>>> +        dp_catalog_ctrl_hpd_enable(dp->catalog);
>>> +        dp_display_host_phy_init(dp);
>>> +    }
>>>         return 0;
>>>   }
>>> @@ -1409,6 +1449,7 @@ static int dp_pm_suspend(struct device *dev)
>>>   }
>>>     static const struct dev_pm_ops dp_pm_ops = {
>>> +    SET_RUNTIME_PM_OPS(dp_pm_runtime_suspend, dp_pm_runtime_resume, 
>>> NULL)
>>>       .suspend = dp_pm_suspend,
>>>       .resume =  dp_pm_resume,
>>
>> With the runtime PM in place, can we change suspend/resume to use 
>> pm_runtime_force_suspend() and pm_runtime_force_resume() ?
> 
> Let em try if i can move checking device connection status out of 
> dp_pm_resume(). it handles external dp panel plugin/unplug during 
> suspend cases.

As we discussed during the telco, it does it in a very strange way, 
which is not compatible with the external HPD support. Thus it should be 
rewritten anyway. Yes, this change can be handled in a separate patch,

What bugs me here is that I don't see runtime PM calls in the device's 
suspend/resume path. Shouldn't you put the runtime PM status in suspend 
path?

> 
>>
>>
>>>   };
>>> @@ -1493,10 +1534,6 @@ static int dp_display_get_next_bridge(struct 
>>> msm_dp *dp)
>>>       aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
>>>         if (aux_bus && dp->is_edp) {
>>> -        dp_display_host_init(dp_priv);
>>> -        dp_catalog_ctrl_hpd_enable(dp_priv->catalog);
>>> -        dp_display_host_phy_init(dp_priv);
>>
>> Are you going to populate the AUX bus (which can cause AUX bus access) 
>> without waking up the device?
> 
>> devm_of_dp_aux_populate_ep_devices() ==>  will call 
>> pm_runtiemget_sync() internally which will call pm_runtime_resume() to 
>> wake dp driver
>>> -
>>>           /*
>>>            * The code below assumes that the panel will finish probing
>>>            * by the time devm_of_dp_aux_populate_ep_devices() returns.
>>> @@ -1604,6 +1641,7 @@ void dp_bridge_atomic_enable(struct drm_bridge 
>>> *drm_bridge,
>>>           dp_hpd_plug_handle(dp_display, 0);
>>
>> Nearly the same question. Resume device before accessing registers.
>>
>>> mutex_lock(&dp_display->event_mutex);
>>> +    pm_runtime_get_sync(&dp_display->pdev->dev);
>>>         state = dp_display->hpd_state;
>>>       if (state != ST_DISPLAY_OFF && state != ST_MAINLINK_READY) {
>>> @@ -1684,6 +1722,8 @@ void dp_bridge_atomic_post_disable(struct 
>>> drm_bridge *drm_bridge,
>>>       }
>>>         drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
>>> +
>>> +    pm_runtime_put_sync(&dp_display->pdev->dev);
>>>       mutex_unlock(&dp_display->event_mutex);
>>>   }
>>>   @@ -1723,6 +1763,8 @@ void dp_bridge_hpd_enable(struct drm_bridge 
>>> *bridge)
>>>       struct dp_display_private *dp = container_of(dp_display, struct 
>>> dp_display_private, dp_display);
>>>         mutex_lock(&dp->event_mutex);
>>> +    pm_runtime_get_sync(&dp->pdev->dev);
>>> +
>>>       dp_catalog_ctrl_hpd_enable(dp->catalog);
>>>         /* enable HDP interrupts */
>>> @@ -1744,6 +1786,9 @@ void dp_bridge_hpd_disable(struct drm_bridge 
>>> *bridge)
>>>       dp_catalog_ctrl_hpd_disable(dp->catalog);
>>>         dp_display->internal_hpd = false;
>>> +
>>> +    pm_runtime_mark_last_busy(&dp->pdev->dev);
>>> +    pm_runtime_put_autosuspend(&dp->pdev->dev);
>>>       mutex_unlock(&dp->event_mutex);
>>>   }
>>

-- 
With best wishes
Dmitry

