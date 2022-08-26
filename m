Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 665E15A294B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 16:24:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E193E10E924;
	Fri, 26 Aug 2022 14:23:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2722910E927
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 14:23:51 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id n15so2206840lfe.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 07:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=sfq7tZUKs4rAJyrCCvSvf3xZrhscMUNrm8KVd7IcisY=;
 b=edcYs11GXTwG/CAw7uNW5N6qgm9LYzXYRCuLYxGZHRfBk2BNo4BZ8YHA/jWuWSb/4m
 qVAMoIdUmfFG7OTB/8M/6qAl+WZ+TWJ3h6gXVz9Pv66QsMJVF5EHj94Rt+AjO++u6tjw
 tfQn/V5s7sOZzPJcL8CFmEKtLxt7BpszYlrIebMHibjtl3RY/vbABM+4am6ZDaTHJmYh
 u4KD6iKRZ93N+yuHCulipw7HfKTVKVgVu51Fe/3S1ulo0Hpl4NKBmnfiZ7LiCqdXdKLx
 GzOjHHP/ep6KMPFW46fORAXDK4xudzXbrQPLSjM59qmrcViB1aGKjNmPRJd0BBfp1zh1
 yozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=sfq7tZUKs4rAJyrCCvSvf3xZrhscMUNrm8KVd7IcisY=;
 b=bkP1WeJLH71OXtI7RUnZnPe2IAc5LygObtspYl5wFdAIovdWiaVxyif/9FzFwHKgN9
 +ST1JG6W+lc00s+QAeQy0Rc94nd+o2umosysFtCvSY4yZ+m3sHd9TsGpEjC0Jn5DGRFS
 dLisXosJ1FZ7SifnkCirKr1v4lOPUA4KRo6SVXpWmL9s2vGwjlIgXCNMc6V2IkAliInd
 3omwTsIgnj5udj71VBz/dvIhyISMuM7nMFO4JCr5IdyfbOOydISkdFAgO5pe/QcbQWJ8
 VeRsoX4mnWsaA2jnkh8NxBkeNnoFww851nD2QApEyPczfyYmqxldQLxW92VVDjiIldxg
 JB/g==
X-Gm-Message-State: ACgBeo0ZDNmL9KHCbQIhTnVHnycBdT39SjGj6kAdiXu3GtuWQxmVUkmh
 pTJ5RaMLp9tdOH1ohH1dETEbeQ==
X-Google-Smtp-Source: AA6agR5I8YOkYqPv50Oj5oe+SZf1+nyq9h6/MKP5fid19ciNW8F0PGYMS8JuIrvW2CotVs3VraAbmQ==
X-Received: by 2002:a05:6512:1521:b0:48a:3c5d:5d17 with SMTP id
 bq33-20020a056512152100b0048a3c5d5d17mr2494965lfb.587.1661523829475; 
 Fri, 26 Aug 2022 07:23:49 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 h2-20020ac24d22000000b0048b28acab8csm400991lfk.64.2022.08.26.07.23.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 07:23:48 -0700 (PDT)
Message-ID: <047e1001-754d-0913-fcbe-a4747c5df8b8@linaro.org>
Date: Fri, 26 Aug 2022 17:23:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v1 1/4] drm/msm/mdp5: stop overriding drvdata
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220620213054.1872954-1-dmitry.baryshkov@linaro.org>
 <20220620213054.1872954-2-dmitry.baryshkov@linaro.org>
 <251f0ce1-05cd-548e-9253-82adbc1038ce@quicinc.com>
 <CAA8EJpogK9BbrSzgJp+Rb_Op2+JBFsTdQHxpTFz28c2biE8AUw@mail.gmail.com>
 <7bdfc4da-740b-9e4d-647c-a349b0bfa1f9@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <7bdfc4da-740b-9e4d-647c-a349b0bfa1f9@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/08/2022 20:20, Abhinav Kumar wrote:
> 
> 
> On 8/24/2022 1:29 AM, Dmitry Baryshkov wrote:
>> On Wed, 24 Aug 2022 at 04:25, Abhinav Kumar 
>> <quic_abhinavk@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 6/20/2022 2:30 PM, Dmitry Baryshkov wrote:
>>>> The rest of the code expects that master's device drvdata is the
>>>> struct msm_drm_private instance. Do not override the mdp5's drvdata.
>>>>
>>>> Fixes: 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master 
>>>> components")
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> Is this just for consistency across mdp5/dpu drivers?
>>>
>>> What issue was seen if mdp5's platform data is overwritten?
>>
>> I think there was a crash in mdp5_destroy, but I did not capture the
>> log at the moment.
>>
>> As you can see, the mdp5_destroy() expects to get mdp5_kms pointer
>> from the drvdata. However the msm_drv_probe sets the drvdata to
>> msm_drm_private instance. Boom.
> 
> Yes, I see that msm_drv_probe sets the drvdata to msm_drm_private.
> But I also see that mdp5_init then sets it to
> 
> platform_set_drvdata(pdev, mdp5_kms);
> 
> Does this not override it then?

It does. But then the mdp5_pm_ops use msm_pm_prepare()/_complete(). And 
these calls expect the msm_drm_private instance in the drvdata. Maybe I 
stumbled upon this. I don't remember exactly, unfortunately.

> Also seems like the commit which introduced it is present since april, 
> this should have happened even earlier then right?
> 
>>
>>>
>>>> ---
>>>>    drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 19 +++++++++----------
>>>>    1 file changed, 9 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c 
>>>> b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>>>> index c668a4b27cc6..daf5b5ca7233 100644
>>>> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>>>> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>>>> @@ -203,7 +203,7 @@ static int mdp5_set_split_display(struct msm_kms 
>>>> *kms,
>>>>                                                          
>>>> slave_encoder);
>>>>    }
>>>>
>>>> -static void mdp5_destroy(struct platform_device *pdev);
>>>> +static void mdp5_destroy(struct mdp5_kms *mdp5_kms);
>>>>
>>>>    static void mdp5_kms_destroy(struct msm_kms *kms)
>>>>    {
>>>> @@ -223,7 +223,7 @@ static void mdp5_kms_destroy(struct msm_kms *kms)
>>>>        }
>>>>
>>>>        mdp_kms_destroy(&mdp5_kms->base);
>>>> -     mdp5_destroy(mdp5_kms->pdev);
>>>> +     mdp5_destroy(mdp5_kms);
>>>>    }
>>>>
>>>>    #ifdef CONFIG_DEBUG_FS
>>>> @@ -651,9 +651,8 @@ static int mdp5_kms_init(struct drm_device *dev)
>>>>        return ret;
>>>>    }
>>>>
>>>> -static void mdp5_destroy(struct platform_device *pdev)
>>>> +static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
>>>>    {
>>>> -     struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
>>>>        int i;
>>>>
>>>>        if (mdp5_kms->ctlm)
>>>> @@ -667,7 +666,7 @@ static void mdp5_destroy(struct platform_device 
>>>> *pdev)
>>>>                kfree(mdp5_kms->intfs[i]);
>>>>
>>>>        if (mdp5_kms->rpm_enabled)
>>>> -             pm_runtime_disable(&pdev->dev);
>>>> +             pm_runtime_disable(&mdp5_kms->pdev->dev);
>>>>
>>>>        drm_atomic_private_obj_fini(&mdp5_kms->glob_state);
>>>>        drm_modeset_lock_fini(&mdp5_kms->glob_state_lock);
>>>> @@ -816,8 +815,6 @@ static int mdp5_init(struct platform_device 
>>>> *pdev, struct drm_device *dev)
>>>>                goto fail;
>>>>        }
>>>>
>>>> -     platform_set_drvdata(pdev, mdp5_kms);
>>>> -
>>>>        spin_lock_init(&mdp5_kms->resource_lock);
>>>>
>>>>        mdp5_kms->dev = dev;
>>>> @@ -915,7 +912,7 @@ static int mdp5_init(struct platform_device 
>>>> *pdev, struct drm_device *dev)
>>>>        return 0;
>>>>    fail:
>>>>        if (mdp5_kms)
>>>> -             mdp5_destroy(pdev);
>>>> +             mdp5_destroy(mdp5_kms);
>>>>        return ret;
>>>>    }
>>>>
>>>> @@ -975,7 +972,8 @@ static int mdp5_dev_remove(struct 
>>>> platform_device *pdev)
>>>>    static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
>>>>    {
>>>>        struct platform_device *pdev = to_platform_device(dev);
>>>> -     struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
>>>> +     struct msm_drm_private *priv = platform_get_drvdata(pdev);
>>>> +     struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
>>>>
>>>>        DBG("");
>>>>
>>>> @@ -985,7 +983,8 @@ static __maybe_unused int 
>>>> mdp5_runtime_suspend(struct device *dev)
>>>>    static __maybe_unused int mdp5_runtime_resume(struct device *dev)
>>>>    {
>>>>        struct platform_device *pdev = to_platform_device(dev);
>>>> -     struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
>>>> +     struct msm_drm_private *priv = platform_get_drvdata(pdev);
>>>> +     struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
>>>>
>>>>        DBG("");
>>>>
>>
>>
>>

-- 
With best wishes
Dmitry

