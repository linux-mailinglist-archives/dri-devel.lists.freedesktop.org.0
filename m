Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDB15FB7D0
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 17:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A23C10E380;
	Tue, 11 Oct 2022 15:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C4D810E87B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 15:56:45 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id i16so5172776uak.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 08:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wH1Bl8itt96KxBsAlutBeKuPO2AccjwjUzu7pu+C0go=;
 b=cHQS7SWHH1gASscavrPWCc246E7BVCVrvaxgOLz953W9ZYcFihTNZv8KTxGIoPE6VO
 oxondL9qq+lJt4+IbHPqqpuaTIVC17a3n1VJ1GNQMzW5Pm1mS57FLx+5CAdHEkcfl7wu
 Wwm66Rp6rTnBPjtVSfACGBqcakSKTvYQ47tmUJBN0sqjUjgLWyAS3SJ/fPNfhEGngrt2
 0ZoJeZbPXX2MoCGE4SpvxUHGHv/Ovju656QRtnZJsqWpbYmlQ7pygRvr4N6pOUPceDQl
 dwHTSyp+zflFhfPwKszINz4PuTsGqtK2Jefl0RHElZbs7PwM+DjGcWnKFSSCX9OIqkfU
 4q6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wH1Bl8itt96KxBsAlutBeKuPO2AccjwjUzu7pu+C0go=;
 b=5cDZx9CLu5O8I0Z9fVla9dJs1WsWuURJPMXcRYfBOdKCKxMO495gdZCVUtAJGAFZxM
 1d5y5LYW8I4Q2aPlWFAVlBZHGgvp7s+VhtAGDtEySIVAFE1LW8FFL2udJb5tHiAV1UgO
 HztVThMEFCExZiVrouLmrEYPp/6NJIFvU5Q2ZOLjJrDGASoiUPT564RrjFFyCm5/cl4q
 94SgM1GiuZmQTFh64jz8f/FVZ/y3kD8EjNCey7/1BNdr30oT0YnQLWo9AZJ4Vd4t/PLa
 sXwu0KhUJiASp5NSf0Hg5dzJVB7ffe2vSUBxKN7D2/IyOB1rnMr29XGulHVZQW29xdSN
 MtFA==
X-Gm-Message-State: ACrzQf1HCo6vMRVhLCtw5hES+QrK9c+KT7gyaomiCDo912om+kgf8G0W
 jCqsCp9iBvJi8KCClvzX0yOuUvvoiHgBmxKiX2scbA==
X-Google-Smtp-Source: AMsMyM7hO86TNlZ7RU1O5BbKxgzcrBU9iEjAHsEU8uEo45EdTTocB+iB/ZslSLRzKUzF+PENEMSkZ/nzKg+/gEiZ/rg=
X-Received: by 2002:ab0:7a5b:0:b0:3b3:8eb9:5a25 with SMTP id
 a27-20020ab07a5b000000b003b38eb95a25mr11832841uat.55.1665503804335; Tue, 11
 Oct 2022 08:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <20221011075519.3111928-1-shraash@google.com>
In-Reply-To: <20221011075519.3111928-1-shraash@google.com>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 11 Oct 2022 08:56:33 -0700
Message-ID: <CABXOdTdum0q=2Fy3yM3OnGmHM9ZkNyEURx6C08879ND7ye=vxg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Remove redundant check for 'submit'
To: Aashish Sharma <shraash@google.com>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 kernel test robot <lkp@intel.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Sean Paul <sean@poorly.run>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 11, 2022 at 12:55 AM Aashish Sharma <shraash@google.com> wrote:
>
> Rectify the below smatch warning:
> drivers/gpu/drm/msm/msm_gem_submit.c:963 msm_ioctl_gem_submit() warn:
> variable dereferenced before check 'submit'
>
> 'submit' is normally error pointer or valid, so remove its NULL
> initializer as it's confusing and also remove a redundant check for it's
> value.
>
> Signed-off-by: Aashish Sharma <shraash@google.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 5599d93ec0d2..74fe1c56cd65 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -706,7 +706,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>         struct msm_drm_private *priv = dev->dev_private;
>         struct drm_msm_gem_submit *args = data;
>         struct msm_file_private *ctx = file->driver_priv;
> -       struct msm_gem_submit *submit = NULL;
> +       struct msm_gem_submit *submit;
>         struct msm_gpu *gpu = priv->gpu;
>         struct msm_gpu_submitqueue *queue;
>         struct msm_ringbuffer *ring;
> @@ -946,8 +946,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>                 put_unused_fd(out_fence_fd);
>         mutex_unlock(&queue->lock);
>  out_post_unlock:
> -       if (submit)
> -               msm_gem_submit_put(submit);
> +       msm_gem_submit_put(submit);
>         if (!IS_ERR_OR_NULL(post_deps)) {
>                 for (i = 0; i < args->nr_out_syncobjs; ++i) {
>                         kfree(post_deps[i].chain);
> --
> 2.38.0.rc2.412.g84df46c1b4-goog
>
