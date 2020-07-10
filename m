Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE2B21E954
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747B06E92C;
	Tue, 14 Jul 2020 07:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA776E1CF
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 23:11:55 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id k18so5765625qtm.10
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 16:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=54ZF/DC2XdS/e/GhSUjcB8qoFITR5sUGRvRbus64HRQ=;
 b=xga4wvwbBEC04/iZpEdO+nhnKTnoWlbbOevlszj0kqf16I1GjGr2sWmPrl1s1Ac8/T
 xM9JsU8YxXMfBlBfQ1zelM4fXOPxVB7GA2UJmQDJq3w4iKA4J2pKNLyKeqHSJw60q3+5
 fj+WGPSBLucdRgsJmDXtQuij5Y/RI7THik614lchFwEy3G5tAHFMXaRm8cEA6R6qFMsh
 18GHMINFtD+gVYbEE7G68OfsmO0mmB6KO9PgQhua53yFHm8B2LCo6u3nyIXIwifazrn7
 +/xvSRKtruklY3AJhwmfVjeyra2puvk+nh63Dzt1kXBlrLfxVje+VVjUv0nlpETSXQ50
 HSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=54ZF/DC2XdS/e/GhSUjcB8qoFITR5sUGRvRbus64HRQ=;
 b=LFGCfFaoBGDBbUOGKmmsBm21BkIh+ioXFEy0EwwVPr8qBm5M1QZRKk7JIeFtuOsjyT
 4fuNfnXrWus3jWMkF9qExpRwGnja192zLfcpfpFNADR0DfxdfV3wuiFkPbO43AD1ZXTq
 o2IDYh27fk4sGaBl4QYhFumqe53OjWCUkpfsaj4jhJkxWl3iF2rH4Tmf9o2GMSH6ldeq
 eMbq68yWEnVAAJ/EOUBjBGLm2cRXCSMukcPCDlby7WIK8G6Id2TltFP62sk0qG34dBOz
 lj1E0xLLVHpL8/vQVX0o6UrLi3Bc7+DAJI1Srih+Kh0AGlPZEvCKXaWXYQ0nhEpa+HTe
 PXRA==
X-Gm-Message-State: AOAM530lMNyLIFEt0IHO9+VKF04rhT9NP11IiMfFd0nrHSi3JiLhj9tf
 Kwkww9M9mx4LJALsR+93xL3bzg==
X-Google-Smtp-Source: ABdhPJyN68zcsLWPlfYAlpLa0B3HI+vp8uJq0nlRnX2FePWUTrlODNZIEv3VOJ1fuHsSCLi9SZGELQ==
X-Received: by 2002:ac8:674c:: with SMTP id n12mr67421310qtp.312.1594422714572; 
 Fri, 10 Jul 2020 16:11:54 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id k14sm10155785qtb.38.2020.07.10.16.11.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 16:11:54 -0700 (PDT)
Subject: Re: [PATCH v2] drm/msm: handle for EPROBE_DEFER for of_icc_get
To: Rob Clark <robdclark@gmail.com>
References: <20200709143404.11876-1-jonathan@marek.ca>
 <CAF6AEGsQFVptXi2wgx_JipyK0AOSUBHOHaDmRF_gG+hSH8mF5A@mail.gmail.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <3729cda9-2d02-c213-c31a-d3e1316798f8@marek.ca>
Date: Fri, 10 Jul 2020 19:10:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAF6AEGsQFVptXi2wgx_JipyK0AOSUBHOHaDmRF_gG+hSH8mF5A@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:08 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 freedreno <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, Brian Masney <masneyb@onstation.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/9/20 11:15 AM, Rob Clark wrote:
> On Thu, Jul 9, 2020 at 7:35 AM Jonathan Marek <jonathan@marek.ca> wrote:
>>
>> Check for errors instead of silently not using icc if the msm driver
>> probes before the interconnect driver.
>>
>> Allow ENODATA for ocmem path, as it is optional and this error
>> is returned when "gfx-mem" path is provided but not "ocmem".
>>
>> Remove the WARN_ON in msm_gpu_cleanup because INIT_LIST_HEAD won't have
>> been called on the list yet when going through the defer error path.
>>
>> Changes in v2:
>> * Changed to not only check for EPROBE_DEFER
>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 17 ++++++++++++++---
>>   drivers/gpu/drm/msm/msm_gpu.c           |  2 --
>>   2 files changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> index 89673c7ed473..0f5217202eb5 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> @@ -940,12 +940,20 @@ static int adreno_get_pwrlevels(struct device *dev,
>>                   */
>>                  gpu->icc_path = of_icc_get(dev, NULL);
>>          }
>> -       if (IS_ERR(gpu->icc_path))
>> +       if (IS_ERR(gpu->icc_path)) {
>> +               ret = PTR_ERR(gpu->icc_path);
>>                  gpu->icc_path = NULL;
>> +               return ret;
>> +       }
>>
>>          gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
>> -       if (IS_ERR(gpu->ocmem_icc_path))
>> +       if (IS_ERR(gpu->ocmem_icc_path)) {
>> +               ret = PTR_ERR(gpu->ocmem_icc_path);
>>                  gpu->ocmem_icc_path = NULL;
>> +               /* allow -ENODATA, ocmem icc is optional */
>> +               if (ret != -ENODATA)
>> +                       return ret;
>> +       }
>>
>>          return 0;
>>   }
>> @@ -996,6 +1004,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>          struct adreno_platform_config *config = pdev->dev.platform_data;
>>          struct msm_gpu_config adreno_gpu_config  = { 0 };
>>          struct msm_gpu *gpu = &adreno_gpu->base;
>> +       int ret;
>>
>>          adreno_gpu->funcs = funcs;
>>          adreno_gpu->info = adreno_info(config->rev);
>> @@ -1007,7 +1016,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>
>>          adreno_gpu_config.nr_rings = nr_rings;
>>
>> -       adreno_get_pwrlevels(&pdev->dev, gpu);
>> +       ret = adreno_get_pwrlevels(&pdev->dev, gpu);
>> +       if (ret)
>> +               return ret;
>>
>>          pm_runtime_set_autosuspend_delay(&pdev->dev,
>>                  adreno_gpu->info->inactive_period);
>> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
>> index a22d30622306..ccf9a0dd9706 100644
>> --- a/drivers/gpu/drm/msm/msm_gpu.c
>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
>> @@ -959,8 +959,6 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
>>
>>          DBG("%s", gpu->name);
>>
>> -       WARN_ON(!list_empty(&gpu->active_list));
>> -
> 
> hmm, not a huge fan of removing the WARN_ON().. can we just init the
> list head earlier?
> 

There doesn't seem to be a nice way of doing that. Would it be 
reasonable to instead detect that msm_gpu_init wasn't called (checking 
if gpu->dev is NULL?), and just skip the msm_gpu_cleanup() call in 
adreno_gpu_cleanup() in that case?

> BR,
> -R
> 
>>          for (i = 0; i < ARRAY_SIZE(gpu->rb); i++) {
>>                  msm_ringbuffer_destroy(gpu->rb[i]);
>>                  gpu->rb[i] = NULL;
>> --
>> 2.26.1
>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
