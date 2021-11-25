Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C860A45E307
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 23:39:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58476E03F;
	Thu, 25 Nov 2021 22:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B982B6E0C6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 22:39:47 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id y26so19439979lfa.11
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 14:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mJT9UmrAop50weZOiXkTq034qrYD2Z7sYhOghCoxa7U=;
 b=ER5U62wVTM7pabOVfUgOEfM++HmPnLsIUtJJtK1duTTFNB1CUBpvMyCcuhpZMsBbEy
 HDXuAH+TvPJQEhC+vUgaGzUkw58buUjEI2O9CCt0xxtv7vOrHYW9/YANe+yqS1ddX/TM
 Q8P1kvdiJ39A2mU8DxDuMAR2kMMzCJqnmW7fz/HA/VhHW+MrGAy6DqNvtlbrfmgwB/zP
 g1ZAlfbDH83u1msdS7JMtmReqJpnPPnxyBVraO1oRJmf3HMZZ7UNzNFVuqARNxon5BCc
 yW7rfhJZTxAMcx9j3NXeT/FyPs9UpLvbzRG0LkK4fVIWdI8Yi8flY+TSl/4vPWx7NUm3
 VcIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mJT9UmrAop50weZOiXkTq034qrYD2Z7sYhOghCoxa7U=;
 b=PtHxiDypwQgAn0y4Q3uz97stpNXFZzPXSf6hdCPGjhbneg8zT+NkKleJ4A/KLZAbVV
 PVB70FNopbiiQXEaNEqf66svVdUpbzlh7+DsUUfRP5RClIPX0uDOp5yPdkWVfbnXILqO
 Gtu/EOGVIEffxLvDNk+BddkOi7V6O5wV++Z6kbeor/8OKQhemtuYGMh+p64ed/y0a3HC
 U9q6oMQ5Di7n12xQTqLF+LiM9nogbBfAYjgpfbLJxm3kDcuRTha908ggoj7pZdwh86DZ
 weOS0UbK7ytwP3qtEkuRKy8H6y0VKL1rQEupu3ad/A0gN9udXScKkmgWUXKOj869e7YJ
 Qyqg==
X-Gm-Message-State: AOAM531VqVP+ujHl+03hPwrypi9pT5iSwQarvb0IoZtaXqrLRdOdqSh0
 bTZ40cjQRF4jd698GClzJPv4cg==
X-Google-Smtp-Source: ABdhPJzYAsPi7L22JigPExXwwF0ksBTYtm1JieAuKmK3VDJBdWCxiRTSKgcCc7Gpkn2HnnVb4OLLqw==
X-Received: by 2002:a05:6512:3053:: with SMTP id
 b19mr26807543lfb.276.1637879985892; 
 Thu, 25 Nov 2021 14:39:45 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id x5sm332534ljm.101.2021.11.25.14.39.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 14:39:45 -0800 (PST)
Subject: Re: [PATCH] drm/msm: Initialize MDSS irq domain at probe time
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robdclark@gmail.com
References: <20211125150947.354076-1-angelogioacchino.delregno@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <4e0147b9-6168-6eac-87f3-4d90c8404e3a@linaro.org>
Date: Fri, 26 Nov 2021 01:39:44 +0300
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

If device is not fully bound (e.g. DSI host could not bind the panel), 
this patch causes the following oops on reboot:

[   75.011942] Unable to handle kernel NULL pointer dereference at 
virtual address 0000000000000030
[   75.020974] Mem abort info:
[   75.023859]   ESR = 0x96000006
[   75.027013]   EC = 0x25: DABT (current EL), IL = 32 bits
[   75.032480]   SET = 0, FnV = 0
[   75.035627]   EA = 0, S1PTW = 0
[   75.038861]   FSC = 0x06: level 2 translation fault
[   75.043876] Data abort info:
[   75.046847]   ISV = 0, ISS = 0x00000006
[   75.050796]   CM = 0, WnR = 0
[   75.053857] user pgtable: 4k pages, 48-bit VAs, pgdp=00000001102b3000
[   75.060478] [0000000000000030] pgd=080000011035d003, 
p4d=080000011035d003, pud=080000011035f003, pmd=0000000000000000
[   75.071380] Internal error: Oops: 96000006 [#1] SMP
[   75.076388] Modules linked in:
[   75.079530] CPU: 0 PID: 1442 Comm: reboot Not tainted 
5.16.0-rc1-00046-g2207fd610cf4-dirty #185
[   75.088460] Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
[   75.095345] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS 
BTYPE=--)
[   75.102496] pc : drm_atomic_state_alloc+0x14/0x74
[   75.107335] lr : drm_atomic_helper_disable_all+0x20/0x210
[   75.112885] sp : ffff80001480bb70
[   75.116298] x29: ffff80001480bb70 x28: ffff0c8753505400 x27: 
0000000000000000
[   75.123626] x26: ffff0c874097d890 x25: ffffaa357b610e00 x24: 
0000000000000000
[   75.130954] x23: ffffaa357bdaa030 x22: ffffaa357bdfd2d8 x21: 
ffff80001480bbf8
[   75.138282] x20: ffff0c87469bd800 x19: ffff0c87469bd800 x18: 
ffffffffffffffff
[   75.145608] x17: 000000000000000e x16: 0000000000000001 x15: 
ffff80009480ba3d
[   75.152934] x14: 0000000000000004 x13: 0000000000000000 x12: 
ffff0c87452c1288
[   75.160261] x11: 0000000000000003 x10: ffff0c87452c1240 x9 : 
0000000000000001
[   75.167588] x8 : ffff80001480bc38 x7 : 0000000000000000 x6 : 
ffff0c874f63d300
[   75.174914] x5 : 0000000000000000 x4 : ffffaa357b582d30 x3 : 
0000000000000000
[   75.182240] x2 : ffff80001480bc20 x1 : 0000000000000000 x0 : 
ffff0c87469bd800
[   75.189568] Call trace:
[   75.192092]  drm_atomic_state_alloc+0x14/0x74
[   75.196571]  drm_atomic_helper_disable_all+0x20/0x210
[   75.201765]  drm_atomic_helper_shutdown+0x80/0x130
[   75.206683]  msm_pdev_shutdown+0x2c/0x40
[   75.210717]  platform_shutdown+0x28/0x40
[   75.214751]  device_shutdown+0x15c/0x450
[   75.218785]  __do_sys_reboot+0x218/0x2a0
[   75.222819]  __arm64_sys_reboot+0x28/0x34
[   75.226937]  invoke_syscall+0x48/0x114
[   75.230794]  el0_svc_common.constprop.0+0xd4/0xfc
[   75.235626]  do_el0_svc+0x28/0x90
[   75.239030]  el0_svc+0x28/0x80
[   75.242174]  el0t_64_sync_handler+0xa4/0x130
[   75.246567]  el0t_64_sync+0x1a0/0x1a4
[   75.250338] Code: a9be7bfd 910003fd a90153f3 f9418c01 (f9401821)
[   75.256599] ---[ end trace d90b41486de58d22 ]---


The following patch fixes it:

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 41c6a9f9dd34..5a92417d21d0 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1435,7 +1435,7 @@ static void msm_pdev_shutdown(struct
         struct drm_device *drm = platform_get_drvdata(pdev);
         struct msm_drm_private *priv = drm ? drm->dev_private : NULL;

-       if (!priv || !priv->kms)
+       if (!priv || !priv->kms || !drm->mode_config.funcs)
                 return;

         drm_atomic_helper_shutdown(drm);


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
