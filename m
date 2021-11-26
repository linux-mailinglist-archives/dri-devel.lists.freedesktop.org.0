Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B36AC45E396
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 01:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5046E1D7;
	Fri, 26 Nov 2021 00:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF076E1D7
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 00:06:05 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id bu18so20017827lfb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 16:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gFiDE23LtSP8Xw8ZCiJ3tYxoqVMmHqaafglT7gNk0Lo=;
 b=dyoxbiQIKR8IWogmRA1l3tmsX/gdu9NDn/gmpqTqE8nEj70fpPUyoWAv4mOqe2eOZM
 +Y148UCLu2suLHpQZ3JU6rRxR7KBgQ9WEaeWo+Jl4yk3wUiKlOUmUTo5FbPXZ5wKlKVS
 S1p/kY9ivOnrhJtYnqXjbVZafd9+da5AvdcFbJTiXbwfBozCNR1ucsH1Xy918zkFI89I
 dBJ5vnpzuWDftg4xqUCXFSWFd/SZlqAag8QOn2nLsH9xvt5M0tdKw+N6/LF3wA+KHjHd
 Wl+21ujthzkrdjDYDri1/zTOshdMd7S5xDMM5thqlvh/Fkv8bRJUaUNArFJKfqQZAraJ
 xjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gFiDE23LtSP8Xw8ZCiJ3tYxoqVMmHqaafglT7gNk0Lo=;
 b=ef5n5Y6IK7cBjGQJsPUoH8flUwYiRLOMBJ+Nk/JB00I55AoP0vz2mQerJc5Pp07dId
 k5vIGSzxx0/lMAITWXaGzprghp2t31yFecMb7W5KZnad0sIOL77m/JsQCy1ERG8BvS6g
 SCx1PE/nh+S5ltAZaEZlrvRud1sD6ihpAe+MOsGQjhxsYal3T8H1vNbUVxKBi3z809uZ
 uu53kwN2xjUBBvz2tdjTi5PA8KLJSrGPgFvnROMfHTgpX/0o4SANbeVxyKz5AWio3A/d
 DLb8kwecAIGgNS7S4HLAnE6YLXV3WZ7W3uQoO8DkfNE4lBcwUBWOZmEyrmWyVkT/sK6H
 UF0g==
X-Gm-Message-State: AOAM530c3Wz3rhZeLzHIVWQ0dM1swaTjH7WmgNcnOT5Dims6hLAcGvLq
 L/KQn+WXOc/UJz7fXOkL1bjJhg==
X-Google-Smtp-Source: ABdhPJxg1zQpTb19QmrH/PpXgKZ/pbr0V52ar3ywQRcg1DU+Jr+Q5rMxHAIY6ot/xtVGZLDntjaETQ==
X-Received: by 2002:a05:6512:228a:: with SMTP id
 f10mr26077082lfu.463.1637885163433; 
 Thu, 25 Nov 2021 16:06:03 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id be25sm358109ljb.114.2021.11.25.16.06.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 16:06:03 -0800 (PST)
Subject: Re: [PATCH] drm/msm: Initialize MDSS irq domain at probe time
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robdclark@gmail.com
References: <20211125150947.354076-1-angelogioacchino.delregno@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <32cdade5-1487-9182-e939-4d93f8a27ad6@linaro.org>
Date: Fri, 26 Nov 2021 03:06:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211125150947.354076-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jami.kettunen@somainline.org, maxime@cerno.tech, marijn.suijten@somainline.org,
 kernel@collabora.com, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/11/2021 18:09, AngeloGioacchino Del Regno wrote:
> Since commit 8f59ee9a570c ("drm/msm/dsi: Adjust probe order"), the
> DSI host gets initialized earlier, but this caused unability to probe
> the entire stack of components because they all depend on interrupts
> coming from the main `mdss` node (mdp5, or dpu1).
> 
> To fix this issue, also anticipate probing mdp5 or dpu1 by initializing
> them at msm_pdev_probe() time: this will make sure that we add the
> required interrupt controller mapping before dsi and/or other components
> try to initialize, finally satisfying the dependency.
> 
> While at it, also change the allocation of msm_drm_private to use the
> devm variant of kzalloc().
> 
> Fixes: 8f59ee9a570c ("drm/msm/dsi: Adjust probe order")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Another issue (or a pack of issues):
Now the msm_drm_init() is unbalanced with msm_drm_uninit(). Bits of code 
(putting the drm dev, removing the IRQ domain, etc) have to be called 
now from the msm_pdev_remove() function rather than from the unbind path.

The following changes fix the observed issues here, however additional 
care should be taken.

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 5a92417d21d0..0abb16256b61 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -342,7 +342,6 @@ static int msm_drm_uninit(struct device *dev)
         struct drm_device *ddev = platform_get_drvdata(pdev);
         struct msm_drm_private *priv = ddev->dev_private;
         struct msm_kms *kms = priv->kms;
-       struct msm_mdss *mdss = priv->mdss;
         int i;

         /*
@@ -402,14 +401,7 @@ static int msm_drm_uninit(struct device *dev)

         component_unbind_all(dev, ddev);

-       if (mdss && mdss->funcs)
-               mdss->funcs->destroy(ddev);
-
-       ddev->dev_private = NULL;
-       drm_dev_put(ddev);
-
         destroy_workqueue(priv->wq);
-       kfree(priv);

         return 0;
  }
@@ -515,7 +507,6 @@ static int msm_drm_init(struct device *dev, const
         struct drm_device *ddev = platform_get_drvdata(pdev);
         struct msm_drm_private *priv = ddev->dev_private;
         struct msm_kms *kms = priv->kms;
-       struct msm_mdss *mdss = priv->mdss;
         int ret, i;

         priv->wq = alloc_ordered_workqueue("msm", 0);
@@ -538,12 +529,12 @@ static int msm_drm_init(struct device *dev, const

         ret = msm_init_vram(ddev);
         if (ret)
-               goto err_destroy_mdss;
+               return ret;

         /* Bind all our sub-components: */
         ret = component_bind_all(dev, ddev);
         if (ret)
-               goto err_destroy_mdss;
+               return ret;

         dma_set_max_seg_size(dev, UINT_MAX);

@@ -649,10 +640,6 @@ static int msm_drm_init(struct device *dev, const
  err_msm_uninit:
         msm_drm_uninit(dev);
         return ret;
-err_destroy_mdss:
-       if (mdss && mdss->funcs)
-               mdss->funcs->destroy(ddev);
-       return ret;
  }

  /*
@@ -1424,9 +1411,20 @@ static int msm_pdev_probe(struct platform_device

  static int msm_pdev_remove(struct platform_device *pdev)
  {
+       struct drm_device *ddev = platform_get_drvdata(pdev);
+       struct msm_drm_private *priv = ddev->dev_private;
+       struct msm_mdss *mdss = priv->mdss;
+
         component_master_del(&pdev->dev, &msm_drm_ops);
+
         of_platform_depopulate(&pdev->dev);

+       if (mdss && mdss->funcs)
+               mdss->funcs->destroy(ddev);
+
+       ddev->dev_private = NULL;
+       drm_dev_put(ddev);
+
         return 0;
  }



> ---
>   drivers/gpu/drm/msm/msm_drv.c | 81 ++++++++++++++++-------------------
>   1 file changed, 38 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 7936e8d498dd..790acf4993c0 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -512,45 +512,12 @@ static int msm_init_vram(struct drm_device *dev)
>   static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   {
>   	struct platform_device *pdev = to_platform_device(dev);
> -	struct drm_device *ddev;
> -	struct msm_drm_private *priv;
> -	struct msm_kms *kms;
> -	struct msm_mdss *mdss;
> +	struct drm_device *ddev = platform_get_drvdata(pdev);
> +	struct msm_drm_private *priv = ddev->dev_private;
> +	struct msm_kms *kms = priv->kms;
> +	struct msm_mdss *mdss = priv->mdss;
>   	int ret, i;
>   
> -	ddev = drm_dev_alloc(drv, dev);
> -	if (IS_ERR(ddev)) {
> -		DRM_DEV_ERROR(dev, "failed to allocate drm_device\n");
> -		return PTR_ERR(ddev);
> -	}
> -
> -	platform_set_drvdata(pdev, ddev);
> -
> -	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> -	if (!priv) {
> -		ret = -ENOMEM;
> -		goto err_put_drm_dev;
> -	}
> -
> -	ddev->dev_private = priv;
> -	priv->dev = ddev;
> -
> -	switch (get_mdp_ver(pdev)) {
> -	case KMS_MDP5:
> -		ret = mdp5_mdss_init(ddev);
> -		break;
> -	case KMS_DPU:
> -		ret = dpu_mdss_init(ddev);
> -		break;
> -	default:
> -		ret = 0;
> -		break;
> -	}
> -	if (ret)
> -		goto err_free_priv;
> -
> -	mdss = priv->mdss;
> -
>   	priv->wq = alloc_ordered_workqueue("msm", 0);
>   	priv->hangcheck_period = DRM_MSM_HANGCHECK_DEFAULT_PERIOD;
>   
> @@ -685,11 +652,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   err_destroy_mdss:
>   	if (mdss && mdss->funcs)
>   		mdss->funcs->destroy(ddev);
> -err_free_priv:
> -	kfree(priv);
> -err_put_drm_dev:
> -	drm_dev_put(ddev);
> -	platform_set_drvdata(pdev, NULL);
>   	return ret;
>   }
>   
> @@ -1382,12 +1344,42 @@ static const struct component_master_ops msm_drm_ops = {
>   static int msm_pdev_probe(struct platform_device *pdev)
>   {
>   	struct component_match *match = NULL;
> +	struct msm_drm_private *priv;
> +	struct drm_device *ddev;
>   	int ret;
>   
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	ddev = drm_dev_alloc(&msm_driver, &pdev->dev);
> +	if (IS_ERR(ddev)) {
> +		DRM_DEV_ERROR(&pdev->dev, "failed to allocate drm_device\n");
> +		return PTR_ERR(ddev);
> +	}
> +
> +	platform_set_drvdata(pdev, ddev);
> +	ddev->dev_private = priv;
> +	priv->dev = ddev;
> +
> +	switch (get_mdp_ver(pdev)) {
> +	case KMS_MDP5:
> +		ret = mdp5_mdss_init(ddev);
> +		break;
> +	case KMS_DPU:
> +		ret = dpu_mdss_init(ddev);
> +		break;
> +	default:
> +		ret = 0;
> +		break;
> +	}
> +	if (ret)
> +		goto err_put_drm_dev;
> +
>   	if (get_mdp_ver(pdev)) {
>   		ret = add_display_components(pdev, &match);
>   		if (ret)
> -			return ret;
> +			goto fail;
>   	}
>   
>   	ret = add_gpu_components(&pdev->dev, &match);
> @@ -1409,6 +1401,9 @@ static int msm_pdev_probe(struct platform_device *pdev)
>   
>   fail:
>   	of_platform_depopulate(&pdev->dev);
> +err_put_drm_dev:
> +	drm_dev_put(ddev);
> +	platform_set_drvdata(pdev, NULL);
>   	return ret;
>   }
>   
> 


-- 
With best wishes
Dmitry
