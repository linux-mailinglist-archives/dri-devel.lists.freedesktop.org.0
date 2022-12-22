Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C82426544CB
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 17:06:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47CC810E549;
	Thu, 22 Dec 2022 16:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A62310E540
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 16:06:19 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 v13-20020a17090a6b0d00b00219c3be9830so2315201pjj.4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 08:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pd8J2dbi+nJa0nIAVQiZbGW+egYRsIjDjMr2P+LE6ac=;
 b=jbNC/iaFj19aD9UAvXbaxGHFITNg/Oj13sTSy6nq0qcRIcNCqRgD22hu4q3750DMBB
 sGtesb8aHe3Abg3JriFsX0FlA2qiL85lQgcm5RLsguxSk2RggrkPRH5rxcKTy4kCTOOu
 0q+qe96uDDe32oSEIX0oNaQ2fxssFQE/X7/hbkGrVfRRZ/nCTJff2+P00kbhkg+/ydmg
 cqM1NE4qKxxinOCaOguLjDXZOBGJ0XIilHYe7Lu9DeGvMzvPbuLxu6H4iivb3sCKbX8x
 WG/Kpa1a0apkv33M+emZvyfd5F7lxGhgVaQ8Q52vxLT1PySXYTimlQiT8p/kKu92mN1M
 9DPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pd8J2dbi+nJa0nIAVQiZbGW+egYRsIjDjMr2P+LE6ac=;
 b=w7K3Ptrl9QT640ZR49+U3cc7Y4d7VC3ZhL9V8MOLx59Ifguzjb7pxv2uAa9Zam33ZX
 srDa3ouQjjepZdDvBQ8pYpEM66MUXt56nEE+xOvczQokKOIbk7f/zZneHNJ3TeVuRSSn
 JAZwE6++69Va4diLBzzigsZ0smGTAdrBvotL1sH4tgG32F5wf+JMQCHEqKdwxkTcHxXR
 AQZMLiZl1IdpkOXlVGxSEYppsgSnFpMrAgJOjh//y/KKzNfWX5D7HHiV+qDe5KceFQFW
 mreMmZT8005w9w5NNF84EgauP6Tdc/hcK8iinkVXrC9wrCuJ3TXqdnjNokCkSkNgYoG4
 cjMQ==
X-Gm-Message-State: AFqh2krNtPBBLzb7poBgLbcAVxkp+NeIExLVxiK957baF8TbSUnMtPAK
 2tgPqF0yrnuSxI/QDSsek7q8EBDAfHjfvn8qx4jb+g==
X-Google-Smtp-Source: AMrXdXs+kPSuX6elbHX0wwdBF6E2KD4a5x3vO5J56BnBpITPhp5hbb1eOlxVKC42QFy7/VnsQMdZzD4OttJDFfJ0X68=
X-Received: by 2002:a17:90a:be0c:b0:219:ef02:a5eb with SMTP id
 a12-20020a17090abe0c00b00219ef02a5ebmr636078pjs.84.1671725178987; Thu, 22 Dec
 2022 08:06:18 -0800 (PST)
MIME-Version: 1.0
References: <1671642843-5244-1-git-send-email-quic_akhilpo@quicinc.com>
 <20221221224338.v4.4.I96e0bf9eaf96dd866111c1eec8a4c9b70fd7cbcb@changeid>
In-Reply-To: <20221221224338.v4.4.I96e0bf9eaf96dd866111c1eec8a4c9b70fd7cbcb@changeid>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 22 Dec 2022 17:05:42 +0100
Message-ID: <CAPDyKFoZB0tmbZwgVnmcbMvV9RNWVQJ+bnkxC7sc4M4yxk-n=Q@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] drm/msm/a6xx: Remove cx gdsc polling using 'reset'
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Sean Paul <sean@poorly.run>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 21 Dec 2022 at 18:14, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> Remove the unused 'reset' interface which was supposed to help to ensure
> that cx gdsc has collapsed during gpu recovery. This is was not enabled
> so far due to missing gpucc driver support. Similar functionality using
> genpd framework will be implemented in the upcoming patch.
>
> This effectively reverts commit 1f6cca404918
> ("drm/msm/a6xx: Ensure CX collapse during gpu recovery").
>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe


> ---
>
> (no changes since v3)
>
> Changes in v3:
> - Updated commit msg (Philipp)
>
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ----
>  drivers/gpu/drm/msm/msm_gpu.c         | 4 ----
>  drivers/gpu/drm/msm/msm_gpu.h         | 4 ----
>  3 files changed, 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 36c8fb699b56..4b16e75dfa50 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -10,7 +10,6 @@
>
>  #include <linux/bitfield.h>
>  #include <linux/devfreq.h>
> -#include <linux/reset.h>
>  #include <linux/soc/qcom/llcc-qcom.h>
>
>  #define GPU_PAS_ID 13
> @@ -1298,9 +1297,6 @@ static void a6xx_recover(struct msm_gpu *gpu)
>         /* And the final one from recover worker */
>         pm_runtime_put_sync(&gpu->pdev->dev);
>
> -       /* Call into gpucc driver to poll for cx gdsc collapse */
> -       reset_control_reset(gpu->cx_collapse);
> -
>         pm_runtime_use_autosuspend(&gpu->pdev->dev);
>
>         if (active_submits)
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 30ed45af76ad..97e1319d4577 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -16,7 +16,6 @@
>  #include <generated/utsrelease.h>
>  #include <linux/string_helpers.h>
>  #include <linux/devcoredump.h>
> -#include <linux/reset.h>
>  #include <linux/sched/task.h>
>
>  /*
> @@ -933,9 +932,6 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>         if (IS_ERR(gpu->gpu_cx))
>                 gpu->gpu_cx = NULL;
>
> -       gpu->cx_collapse = devm_reset_control_get_optional_exclusive(&pdev->dev,
> -                       "cx_collapse");
> -
>         gpu->pdev = pdev;
>         platform_set_drvdata(pdev, &gpu->adreno_smmu);
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 651786bc55e5..fa9e34d02c91 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -13,7 +13,6 @@
>  #include <linux/interconnect.h>
>  #include <linux/pm_opp.h>
>  #include <linux/regulator/consumer.h>
> -#include <linux/reset.h>
>
>  #include "msm_drv.h"
>  #include "msm_fence.h"
> @@ -282,9 +281,6 @@ struct msm_gpu {
>         bool hw_apriv;
>
>         struct thermal_cooling_device *cooling;
> -
> -       /* To poll for cx gdsc collapse during gpu recovery */
> -       struct reset_control *cx_collapse;
>  };
>
>  static inline struct msm_gpu *dev_to_gpu(struct device *dev)
> --
> 2.7.4
>
