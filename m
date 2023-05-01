Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 794E36F3979
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 22:56:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C2510E451;
	Mon,  1 May 2023 20:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD0310E451
 for <dri-devel@lists.freedesktop.org>; Mon,  1 May 2023 20:56:29 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4ec8149907aso3721995e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 May 2023 13:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682974588; x=1685566588;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fRi8WeWbFUqJuehlBhyZd78a/p9Tg8JwKR1fy0aT0Jg=;
 b=ddsTfsgnDYaHHdX1g4taaGDyH2sPtMkYxmVUyu/MOxweHpFL+sUoh+LIOPidLdRN4/
 GsuTDoggzA4y+41/eWfa5RhT34nAXN8NDKxwtnS1oGZZvpNR2ziTJwNXjg8ZibF6dln4
 mQoAXHAwYY6FuPLM7yEpjGZVTL08G3s5IoWBQbHwVDDzoOllVOnY/DgrU2PO3KPcva36
 UTsZoBNyTpyk2L1rP3iHMgTQ7bLLDJpOfRg/RcBsXY1kdcPdGailIC/MoJjJ01bdHaZT
 9QdATURzOOANSO+kdGNHM4vPZrECagQYmAA2o1F7J8WACpLGzd/B20sb0xWBceGIoUVW
 nqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682974588; x=1685566588;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fRi8WeWbFUqJuehlBhyZd78a/p9Tg8JwKR1fy0aT0Jg=;
 b=VnHpoecqe7tst4WmGQjq1ycuVonFVE1/HgEU5U19qjWJMEcP3iBaaXZpstyBUQX+bq
 9loq435t2kEHp2ruJe0QbkZ9zrlxUEp41DTO5tGlIDMGqvH2iZG0GeNqh3XJ50O0sPMf
 m3LiM8+lYRuI5CnIfAXifbhXFYA+JMfnW9JAabS6FnAMQ3Pqm4VoLoxVBVDg3+K+WccU
 nhNkv6kKgCfVfd4l3LCH5CPiMqKp/b6puM75s2gDBzuMC1HUOhIa01b54jDosFBRdcfn
 9qFF5YNjjAFjMJUT5v0t+j5XxY7Wbd7p7TIQD3ar/zj3Kt1VerBVxOH5Avp/ySOJseQM
 iN0A==
X-Gm-Message-State: AC+VfDwfxsOuVO3bD7vHIoAw0otr+ZFOuxnlT60pi/RvyL/DbQa5m29+
 /U0VtHptiY2SrPiv6bsycynHKg==
X-Google-Smtp-Source: ACHHUZ7/wdm93DxRBAvt2OwUx/l0GuYYMfX+zGJ+Yy7jSPEk21ffkc8d/WR+DjJ/+FbE9Kqcs2CB8Q==
X-Received: by 2002:ac2:5691:0:b0:4ed:bdac:7a49 with SMTP id
 17-20020ac25691000000b004edbdac7a49mr4895238lfr.54.1682974587748; 
 Mon, 01 May 2023 13:56:27 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v22-20020ac25596000000b004e845b49d81sm4931174lfg.140.2023.05.01.13.56.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 13:56:27 -0700 (PDT)
Message-ID: <f2b7e6cf-d747-efb8-820c-41e4eef6cbb3@linaro.org>
Date: Mon, 1 May 2023 23:56:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/msm: Set max segment size earlier
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230501204441.1642741-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230501204441.1642741-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/05/2023 23:44, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Fixes the following splat on a6xx gen2+ (a640, a650, a660 families),
> a6xx gen1 has smaller GMU allocations so they fit under the default
> 64K max segment size.
> 
>     ------------[ cut here ]------------
>     DMA-API: msm_dpu ae01000.display-controller: mapping sg segment longer than device claims to support [len=126976] [max=65536]
>     WARNING: CPU: 5 PID: 9 at kernel/dma/debug.c:1160 debug_dma_map_sg+0x288/0x314
>     Modules linked in:
>     CPU: 5 PID: 9 Comm: kworker/u16:0 Not tainted 6.3.0-rc2-debug+ #629
>     Hardware name: Google Villager (rev1+) with LTE (DT)
>     Workqueue: events_unbound deferred_probe_work_func
>     pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>     pc : debug_dma_map_sg+0x288/0x314
>     lr : debug_dma_map_sg+0x288/0x314
>     sp : ffffffc00809b560
>     x29: ffffffc00809b560 x28: 0000000000000060 x27: 0000000000000000
>     x26: 0000000000010000 x25: 0000000000000004 x24: 0000000000000004
>     x23: ffffffffffffffff x22: ffffffdb31693cc0 x21: ffffff8080935800
>     x20: ffffff8087417400 x19: ffffff8087a45010 x18: 0000000000000000
>     x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000010000
>     x14: 0000000000000001 x13: ffffffffffffffff x12: ffffffffffffffff
>     x11: 0000000000000000 x10: 000000000000000a x9 : ffffffdb2ff05e14
>     x8 : ffffffdb31275000 x7 : ffffffdb2ff08908 x6 : 0000000000000000
>     x5 : 0000000000000001 x4 : ffffffdb2ff08a74 x3 : ffffffdb31275008
>     x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffffff80803a9a80
>     Call trace:
>      debug_dma_map_sg+0x288/0x314
>      __dma_map_sg_attrs+0x80/0xe4
>      dma_map_sgtable+0x30/0x4c
>      get_pages+0x1d4/0x1e4
>      msm_gem_pin_pages_locked+0xbc/0xf8
>      msm_gem_pin_vma_locked+0x58/0xa0
>      msm_gem_get_and_pin_iova_range+0x98/0xac
>      a6xx_gmu_memory_alloc+0x7c/0x128
>      a6xx_gmu_init+0x16c/0x9b0
>      a6xx_gpu_init+0x38c/0x3e4
>      adreno_bind+0x214/0x264
>      component_bind_all+0x128/0x1f8
>      msm_drm_bind+0x2b8/0x608
>      try_to_bring_up_aggregate_device+0x88/0x1a4
>      __component_add+0xec/0x13c
>      component_add+0x1c/0x28
>      dp_display_probe+0x3f8/0x43c
>      platform_probe+0x70/0xc4
>      really_probe+0x148/0x280
>      __driver_probe_device+0xc8/0xe0
>      driver_probe_device+0x44/0x100
>      __device_attach_driver+0x64/0xdc
>      bus_for_each_drv+0xb0/0xd8
>      __device_attach+0xd8/0x168
>      device_initial_probe+0x1c/0x28
>      bus_probe_device+0x44/0xb0
>      deferred_probe_work_func+0xc8/0xe0
>      process_one_work+0x2e0/0x488
>      process_scheduled_works+0x4c/0x50
>      worker_thread+0x218/0x274
>      kthread+0xf0/0x100
>      ret_from_fork+0x10/0x20
>     irq event stamp: 293712
>     hardirqs last  enabled at (293711): [<ffffffdb2ff0893c>] vprintk_emit+0x160/0x25c
>     hardirqs last disabled at (293712): [<ffffffdb30b48130>] el1_dbg+0x24/0x80
>     softirqs last  enabled at (279520): [<ffffffdb2fe10420>] __do_softirq+0x21c/0x4bc
>     softirqs last disabled at (279515): [<ffffffdb2fe16708>] ____do_softirq+0x18/0x24
>     ---[ end trace 0000000000000000 ]---
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

I think this should be:

Fixes: db735fc4036b ("drm/msm: Set dma maximum segment size for mdss")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_drv.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 3a74b5653e96..6dec1a3534f2 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -440,27 +440,27 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   	fs_reclaim_acquire(GFP_KERNEL);
>   	might_lock(&priv->lru.lock);
>   	fs_reclaim_release(GFP_KERNEL);
>   
>   	drm_mode_config_init(ddev);
>   
>   	ret = msm_init_vram(ddev);
>   	if (ret)
>   		goto err_drm_dev_put;
>   
> +	dma_set_max_seg_size(dev, UINT_MAX);
> +
>   	/* Bind all our sub-components: */
>   	ret = component_bind_all(dev, ddev);
>   	if (ret)
>   		goto err_drm_dev_put;
>   
> -	dma_set_max_seg_size(dev, UINT_MAX);
> -
>   	msm_gem_shrinker_init(ddev);
>   
>   	if (priv->kms_init) {
>   		ret = priv->kms_init(ddev);
>   		if (ret) {
>   			DRM_DEV_ERROR(dev, "failed to load kms\n");
>   			priv->kms = NULL;
>   			goto err_msm_uninit;
>   		}
>   		kms = priv->kms;

-- 
With best wishes
Dmitry

