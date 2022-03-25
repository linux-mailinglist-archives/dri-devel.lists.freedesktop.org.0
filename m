Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 841054E700B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 10:34:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA3A10EA9C;
	Fri, 25 Mar 2022 09:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362E910EAA0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 09:34:49 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id bu29so12454592lfb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 02:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3XqQVa7Xf+Mh5WS5zci1tUo0VzoceV5erDl2gShhJ3A=;
 b=lJqOOM3gFzNyYQTALRMFjYo8qlotvRftKjQvSP8YFhV3r8wjOmkoDDB1NNajO7MKNT
 6kUivfiwEiJA8yxj4J98txHseLl+xQtKwo2l9dSsgib9voDr16+/PPnEwwUg15GUchKA
 vM69cj4ZhVDqZMBxfm5jgzRIP3ZaC6Pu9DvWmAuUpfusLE0C0ucNPKjOdfIF8UHvX9Xv
 0+g8zpQDV8dNguMW+oAA8Z8o52W1Xg00u9lL38Ct6blbqfkdLXAdxsLxhq3ZgonME1uW
 bKKfLLLfLlo+/uYXrXZ0cJO4TwjBwQT0D0u6JcL0JwG7dg4hW0KjlSJYMAtbuU5NzxAU
 JOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3XqQVa7Xf+Mh5WS5zci1tUo0VzoceV5erDl2gShhJ3A=;
 b=33RI/0ba1uzawLFquR9RbuXG133l4211140bfKILeUZa99xnHUOb3G7o+WXUbA2v95
 eoZaVZZ7sTiSZWqfEhu2igO03YheiQCRBKaMO1zTr/8T9l6gqc13N4192ZeyOph9T22c
 BG5Wsi6//b8tK00zINvONDD5VP5oLrkTD3VgWgBRgpDHgCBJLb1HO0Yv1fqPvmiP3bvV
 jGTCz6xKQH2HCoOi/ySxvG0tRufqWnstKt3nmEBKjamVaaDk36DMtEpclmzVbY7qCkEA
 Gt5Sv1FTScxWdajLupbjid6yEwtFVjWrFsmP+hs1LRK5Uu2OE2Bz0O9uercR3tqz+VpO
 I5Og==
X-Gm-Message-State: AOAM533DaSaZGJdr6nX6j27jA7eL+emQRgHZAr2pN3YSdfjr76OsalEQ
 SbSq2lb8UWFxsQSxBxPLhVhXSQ==
X-Google-Smtp-Source: ABdhPJyIBmtG4IiWkb5WcsIhShr/3qwzMAB998rTzdDGHOrlCtlPiY5bmNBPcaPkaFH1TTwXzyf5Ew==
X-Received: by 2002:ac2:5485:0:b0:448:bc39:8d30 with SMTP id
 t5-20020ac25485000000b00448bc398d30mr7386290lfk.462.1648200887342; 
 Fri, 25 Mar 2022 02:34:47 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a196554000000b0044a1181c527sm638069lfj.9.2022.03.25.02.34.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 02:34:46 -0700 (PDT)
Message-ID: <a02d0a60-e5f5-1b1d-b3d4-31233ca40bad@linaro.org>
Date: Fri, 25 Mar 2022 12:34:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 6/6] drm/msm: make mdp5/dpu devices master components
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220323092538.1757880-1-dmitry.baryshkov@linaro.org>
 <20220323092538.1757880-7-dmitry.baryshkov@linaro.org>
 <CAE-0n51VvGu5w9dSUKUt4GywYbSpOaqxfWypB7ObJZg1pM5BAQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n51VvGu5w9dSUKUt4GywYbSpOaqxfWypB7ObJZg1pM5BAQ@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/03/2022 00:37, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-03-23 02:25:38)
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index 38627ccf3068..ab8a35e09bc9 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -381,8 +381,8 @@ static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
>>          struct icc_path *path1;
>>          struct drm_device *dev = dpu_kms->dev;
>>
>> -       path0 = of_icc_get(dev->dev, "mdp0-mem");
>> -       path1 = of_icc_get(dev->dev, "mdp1-mem");
>> +       path0 = of_icc_get(dev->dev->parent, "mdp0-mem");
> 
> dev->dev->parent is long
> 
>> +       path1 = of_icc_get(dev->dev->parent, "mdp1-mem");
>>
>>          if (IS_ERR_OR_NULL(path0))
>>                  return PTR_ERR_OR_ZERO(path0);
>> @@ -837,6 +837,9 @@ static void dpu_kms_destroy(struct msm_kms *kms)
>>          _dpu_kms_hw_destroy(dpu_kms);
>>
>>          msm_kms_destroy(&dpu_kms->base);
>> +
>> +       if (dpu_kms->rpm_enabled)
>> +               pm_runtime_disable(&dpu_kms->pdev->dev);
>>   }
>>
>>   static irqreturn_t dpu_irq(struct msm_kms *kms)
>> @@ -978,7 +981,7 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
>>          if (!domain)
>>                  return 0;
>>
>> -       mmu = msm_iommu_new(dpu_kms->dev->dev, domain);
>> +       mmu = msm_iommu_new(dpu_kms->dev->dev->parent, domain);
> 
> And dpu_kms->dev->dev->parent is longer. Can we get some local variable
> or something that is more descriptive? I guess it is an 'mdss_dev'?

Yes, I'll fix these two usages.

> 
>>          if (IS_ERR(mmu)) {
>>                  iommu_domain_free(domain);
>>                  return PTR_ERR(mmu);
>> @@ -1172,40 +1175,15 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>          return rc;
>>   }
>>
>> -static int dpu_kms_init(struct drm_device *dev)
>> -{
>> -       struct msm_drm_private *priv;
>> -       struct dpu_kms *dpu_kms;
>> -       int irq;
>> -
>> -       if (!dev) {
>> -               DPU_ERROR("drm device node invalid\n");
>> -               return -EINVAL;
>> -       }
>> -
>> -       priv = dev->dev_private;
>> -       dpu_kms = to_dpu_kms(priv->kms);
>> -
>> -       irq = irq_of_parse_and_map(dpu_kms->pdev->dev.of_node, 0);
>> -       if (irq < 0) {
>> -               DPU_ERROR("failed to get irq: %d\n", irq);
>> -               return irq;
>> -       }
>> -       dpu_kms->base.irq = irq;
>> -
>> -       return 0;
>> -}
>> -
>> -static int dpu_bind(struct device *dev, struct device *master, void *data)
>> +static int dpu_kms_init(struct drm_device *ddev)
>>   {
>> -       struct msm_drm_private *priv = dev_get_drvdata(master);
>> +       struct msm_drm_private *priv = ddev->dev_private;
>> +       struct device *dev = ddev->dev;
>>          struct platform_device *pdev = to_platform_device(dev);
>> -       struct drm_device *ddev = priv->dev;
>>          struct dpu_kms *dpu_kms;
>> +       int irq;
>>          int ret = 0;
>>
>> -       priv->kms_init = dpu_kms_init;
>> -
>>          dpu_kms = devm_kzalloc(&pdev->dev, sizeof(*dpu_kms), GFP_KERNEL);
>>          if (!dpu_kms)
>>                  return -ENOMEM;
>> @@ -1227,8 +1205,6 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
>>          }
>>          dpu_kms->num_clocks = ret;
>>
>> -       platform_set_drvdata(pdev, dpu_kms);
>> -
>>          ret = msm_kms_init(&dpu_kms->base, &kms_funcs);
>>          if (ret) {
>>                  DPU_ERROR("failed to init kms, ret=%d\n", ret);
>> @@ -1242,31 +1218,25 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
>>
>>          priv->kms = &dpu_kms->base;
>>
>> -       return ret;
>> -}
>> -
>> -static void dpu_unbind(struct device *dev, struct device *master, void *data)
>> -{
>> -       struct platform_device *pdev = to_platform_device(dev);
>> -       struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
>> +       irq = irq_of_parse_and_map(dpu_kms->pdev->dev.of_node, 0);
> 
> Why doesn't platform_get_irq() work? This is code movement but I'm
> trying to understand why OF APIs are required.

Good question, I'll take a look separately (in a followup patch).

> 
>> +       if (irq < 0) {
>> +               DPU_ERROR("failed to get irq: %d\n", irq);
>> +               return irq;
>> +       }
>> +       dpu_kms->base.irq = irq;
>>
>> -       if (dpu_kms->rpm_enabled)
>> -               pm_runtime_disable(&pdev->dev);
>> +       return 0;
>>   }
>>
>> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
>> index 1f571372e928..ab25fff271f9 100644
>> --- a/drivers/gpu/drm/msm/msm_kms.h
>> +++ b/drivers/gpu/drm/msm/msm_kms.h
>> @@ -194,9 +194,6 @@ static inline void msm_kms_destroy(struct msm_kms *kms)
>>                  msm_atomic_destroy_pending_timer(&kms->pending_timers[i]);
>>   }
>>
>> -extern const struct of_device_id dpu_dt_match[];
>> -extern const struct of_device_id mdp5_dt_match[];
>> -
>>   #define for_each_crtc_mask(dev, crtc, crtc_mask) \
>>          drm_for_each_crtc(crtc, dev) \
>>                  for_each_if (drm_crtc_mask(crtc) & (crtc_mask))
>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
>> index 7451105cbf01..9ecae833037d 100644
>> --- a/drivers/gpu/drm/msm/msm_mdss.c
>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
>> @@ -329,14 +310,7 @@ static int mdss_probe(struct platform_device *pdev)
>>          if (IS_ERR(mdss))
>>                  return PTR_ERR(mdss);
>>
>> -       priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>> -       if (!priv) {
>> -               ret = -ENOMEM;
>> -               goto fail;
>> -       }
>> -
>> -       priv->mdss = mdss;
>> -       platform_set_drvdata(pdev, priv);
>> +       platform_set_drvdata(pdev, mdss);
>>
>>          /*
>>           * MDP5/DPU based devices don't have a flat hierarchy. There is a top
>> @@ -350,39 +324,18 @@ static int mdss_probe(struct platform_device *pdev)
>>                  goto fail;
> 
> Can the goto fail be removed? And replaced with

Ack, I'll do this.

> 
> 	if (ret)
> 		msm_mdss_destroy(mdss)
> 
> 	return ret;
> 
>>          }
>>
>> -       mdp_dev = device_find_child(dev, NULL, find_mdp_node);
>> -       if (!mdp_dev) {
>> -               DRM_DEV_ERROR(dev, "failed to find MDSS MDP node\n");
>> -               of_platform_depopulate(dev);
>> -               ret = -ENODEV;
>> -               goto fail;
>> -       }
>> -
>> -       /*
>> -        * on MDP5 based platforms, the MDSS platform device is the component
>> -        * that adds MDP5 and other display interface components to
>> -        * itself.
>> -        */
>> -       ret = msm_drv_probe(dev, mdp_dev);
>> -       put_device(mdp_dev);
>> -       if (ret)
>> -               goto fail;
>> -
> 
> I see a lot of removal of 'goto fail'.
> 
>>          return 0;
>>
>>   fail:
>> -       of_platform_depopulate(dev);
>> -       msm_mdss_destroy(priv->mdss);
>> +       msm_mdss_destroy(mdss);
>>
>>          return ret;
>>   }
>>


-- 
With best wishes
Dmitry
