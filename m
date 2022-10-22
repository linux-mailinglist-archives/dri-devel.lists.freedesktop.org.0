Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFD2608B11
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 11:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8808C10E396;
	Sat, 22 Oct 2022 09:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9E010E396
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Oct 2022 09:26:57 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id bp15so8992015lfb.13
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Oct 2022 02:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1kfDym2w0EElbmcx/BQsQ1yL8gt2nPkuv3T3pwbFJXM=;
 b=AmJhrDspddvLWhmS4pMWph+wgnz0kCDTGG9e6m9KejeBzZnmCn8RbMwMdUY8Om0zSY
 esqdVjSeZYTlyqF40HTOQ0uPpUCUbTLkVU7U6TKI/CTzkTwaEBoLVWz/x7QyvxiScijF
 SJavKFtjZvdmgNtsbnuDH4yppWfSZ6yg9w21TrK72j2o7GgW7eNrGgvGZAjqVTwNdkQX
 4lSNPJafEEq6liwUhw8vzVGrKULPlITvKT1ZdTZgAtiI64aJh3qn1mITHNU4uSMNP2Yz
 RODCSzYRcKtG9JhlHxFHgvuKqtoi9Rf73cajMk2MROpQl5MZu+iUt6JzFZvXHoK4ntnh
 JmZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1kfDym2w0EElbmcx/BQsQ1yL8gt2nPkuv3T3pwbFJXM=;
 b=sX2IkGSKHQBSgEOowRLEiQJdSEqhW0PXm+h/3B6w8yrzTgJmhAYKqp579l/pU2SxkK
 8G4tXhKZDUE8Zy1wX5Ey9r+Dr0zMyZR0cEja/Wwm+LpmcOi+z2mwdWwHQZFLc+jz2o4X
 k2LDppPfceCrC9D3IrGAUr0chkC4s+JOSwnpWxSu7UFa+ZNxYnutt+dHb4X6NSbRIOam
 Cgi4DCVlW73WD7jW0njWwtpDaGQq1lA9gMeds007ACCh4hPudxup6EhMEKW7U//lwHLS
 2IcJPjjZcO7DNvpPqFlhSR48tkNXpdg+KvfkxGhhU3BWyXrZMXHm58aeWu/lcwRMFPpj
 oDsw==
X-Gm-Message-State: ACrzQf2NA5I2iXPoNfEeoFGAEmH/NeIxhXGhiC3m6Mg3XRcwOd/ivLyL
 caLwCS7TPlN6DhYEjr5vZNPHAg==
X-Google-Smtp-Source: AMsMyM7dYOLwfD3xuUFQ4hZaTYV/X1nIweNJwQA3r2rbLyyBTwJl35wFPsRQKl3boAFc3N3EcBShoQ==
X-Received: by 2002:ac2:50cf:0:b0:4a2:a581:6411 with SMTP id
 h15-20020ac250cf000000b004a2a5816411mr7718493lfm.124.1666430815240; 
 Sat, 22 Oct 2022 02:26:55 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 o4-20020ac25e24000000b0049fe6f36880sm3498101lfg.51.2022.10.22.02.26.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Oct 2022 02:26:54 -0700 (PDT)
Message-ID: <80f060fc-142f-7876-0eb9-cbd2b3e46789@linaro.org>
Date: Sat, 22 Oct 2022 12:26:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2] drm/msm/mdp5: stop overriding drvdata
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20221021192641.2423237-1-dmitry.baryshkov@linaro.org>
 <778ae711-50a4-ae37-db18-8faa26f4c0ae@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <778ae711-50a4-ae37-db18-8faa26f4c0ae@quicinc.com>
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

On 22/10/2022 00:58, Abhinav Kumar wrote:
> Hi Dmitry
> 
> A couple of comments below.
> 
> On 10/21/2022 12:26 PM, Dmitry Baryshkov wrote:
>> The rest of the code expects that master's device drvdata is the
>> struct msm_drm_private instance. Do not override the mdp5's drvdata.
>>
>> Fixes: 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master components")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>> Abhinav, Rob, please pick this for -fixes.
>>
>> This is an updated version of [1]. Fixed the read_mdp_hw_revision()
>> function. PM runtime isn't available at the moment, as priv->kms is not
>> set.
> 
> Can you split them into two changes?

I can, but this would look a bit artificial.

Before the patch [1] there is no need to fix read_hw_revision, as 
pm_runtime_resume works correctly. And after [1] read_hw_revision can 
fail because pm_runtime_resume() wouldn't work before priv->kms being set

> 
> Any reason fixing the read_mdp_hw_revision() needs to be in this?
>>
>> [1] https://patchwork.freedesktop.org/patch/490326/?series=105392&rev=1
>>
>> ---
>>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 37 ++++++++++++++----------
>>   1 file changed, 22 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c 
>> b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>> index b0d21838a134..506c64940972 100644
>> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>> @@ -203,7 +203,7 @@ static int mdp5_set_split_display(struct msm_kms 
>> *kms,
>>                                 slave_encoder);
>>   }
>> -static void mdp5_destroy(struct platform_device *pdev);
>> +static void mdp5_destroy(struct mdp5_kms *mdp5_kms);
>>   static void mdp5_kms_destroy(struct msm_kms *kms)
>>   {
>> @@ -223,7 +223,7 @@ static void mdp5_kms_destroy(struct msm_kms *kms)
>>       }
>>       mdp_kms_destroy(&mdp5_kms->base);
>> -    mdp5_destroy(mdp5_kms->pdev);
>> +    mdp5_destroy(mdp5_kms);
>>   }
>>   #ifdef CONFIG_DEBUG_FS
>> @@ -519,9 +519,15 @@ static void read_mdp_hw_revision(struct mdp5_kms 
>> *mdp5_kms,
>>       struct device *dev = &mdp5_kms->pdev->dev;
>>       u32 version;
>> -    pm_runtime_get_sync(dev);
>> +    /* Manually enable the MDP5, as pm runtime isn't usable yet */
>> +    if (mdp5_enable(mdp5_kms)) {
> 
> mdp5_enable() always seems to return 0 so do we need this if block?

No.

> 
>> +        *major = 0;
>> +        *minor = 0;
>> +        return;
>> +    }
>> +
>>       version = mdp5_read(mdp5_kms, REG_MDP5_HW_VERSION);
>> -    pm_runtime_put_sync(dev);
>> +    mdp5_disable(mdp5_kms);
>>       *major = FIELD(version, MDP5_HW_VERSION_MAJOR);
>>       *minor = FIELD(version, MDP5_HW_VERSION_MINOR);
>> @@ -559,6 +565,8 @@ static int mdp5_kms_init(struct drm_device *dev)
>>       int irq, i, ret;
>>       ret = mdp5_init(to_platform_device(dev->dev), dev);
>> +    if (ret)
>> +        return ret;
>>       /* priv->kms would have been populated by the MDP5 driver */
>>       kms = priv->kms;
>> @@ -632,9 +640,8 @@ static int mdp5_kms_init(struct drm_device *dev)
>>       return ret;
>>   }
>> -static void mdp5_destroy(struct platform_device *pdev)
>> +static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
>>   {
>> -    struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
>>       int i;
>>       if (mdp5_kms->ctlm)
>> @@ -648,7 +655,7 @@ static void mdp5_destroy(struct platform_device 
>> *pdev)
>>           kfree(mdp5_kms->intfs[i]);
>>       if (mdp5_kms->rpm_enabled)
>> -        pm_runtime_disable(&pdev->dev);
>> +        pm_runtime_disable(&mdp5_kms->pdev->dev);
>>       drm_atomic_private_obj_fini(&mdp5_kms->glob_state);
>>       drm_modeset_lock_fini(&mdp5_kms->glob_state_lock);
>> @@ -797,8 +804,6 @@ static int mdp5_init(struct platform_device *pdev, 
>> struct drm_device *dev)
>>           goto fail;
>>       }
>> -    platform_set_drvdata(pdev, mdp5_kms);
>> -
>>       spin_lock_init(&mdp5_kms->resource_lock);
>>       mdp5_kms->dev = dev;
>> @@ -839,9 +844,6 @@ static int mdp5_init(struct platform_device *pdev, 
>> struct drm_device *dev)
>>        */
>>       clk_set_rate(mdp5_kms->core_clk, 200000000);
>> -    pm_runtime_enable(&pdev->dev);
>> -    mdp5_kms->rpm_enabled = true;
>> -
>>       read_mdp_hw_revision(mdp5_kms, &major, &minor);
>>       mdp5_kms->cfg = mdp5_cfg_init(mdp5_kms, major, minor);
>> @@ -893,10 +895,13 @@ static int mdp5_init(struct platform_device 
>> *pdev, struct drm_device *dev)
>>       /* set uninit-ed kms */
>>       priv->kms = &mdp5_kms->base.base;
>> +    pm_runtime_enable(&pdev->dev);
>> +    mdp5_kms->rpm_enabled = true;
>> +
>>       return 0;
>>   fail:
>>       if (mdp5_kms)
>> -        mdp5_destroy(pdev);
>> +        mdp5_destroy(mdp5_kms);
>>       return ret;
>>   }
>> @@ -953,7 +958,8 @@ static int mdp5_dev_remove(struct platform_device 
>> *pdev)
>>   static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
>>   {
>>       struct platform_device *pdev = to_platform_device(dev);
>> -    struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
>> +    struct msm_drm_private *priv = platform_get_drvdata(pdev);
>> +    struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
>>       DBG("");
>> @@ -963,7 +969,8 @@ static __maybe_unused int 
>> mdp5_runtime_suspend(struct device *dev)
>>   static __maybe_unused int mdp5_runtime_resume(struct device *dev)
>>   {
>>       struct platform_device *pdev = to_platform_device(dev);
>> -    struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
>> +    struct msm_drm_private *priv = platform_get_drvdata(pdev);
>> +    struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
>>       DBG("");

-- 
With best wishes
Dmitry

