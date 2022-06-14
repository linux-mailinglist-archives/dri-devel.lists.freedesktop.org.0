Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B072854B4D8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 17:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9629112773;
	Tue, 14 Jun 2022 15:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFDF411277A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 15:38:15 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id q104so6701133qvq.8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 08:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z2yLINaTzV8fSrfmCIDVzIix1NCFViFEnmZVJZZ6Sa4=;
 b=eL5IL1nulrSQ4Sp0dXS0I23ihVz+S36hijRsX7WL+U/iLrea3l0Nv8O6qZrtfJl9Si
 DHQlBtZH2UGBGVWy7IYYYRi8LnMeZmMmhVqksRKVrvmdx95gukiTPTSWXMLKYhFzWw/8
 SFTfT2ZX615lJasNk/W7iiIB4fQBYZztiKhVWNi0cTbnsefL0S3cwUH0RSHpUqKT4BzZ
 qnjMdpBbHC9/zJsohCvySI41JbFTjZl4pxRSEIfk3PUCycbmEvB2/vbABuRhO6fB1ihm
 y/L3RfL8dLOKAI+6vpfyzsytSUBNRfC06LTi47Ib5GnANNub7EVVbRClXHK4vcZGPWuW
 o/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z2yLINaTzV8fSrfmCIDVzIix1NCFViFEnmZVJZZ6Sa4=;
 b=TL4u3wXjWKzXr1rpkJaDgDMDEvhp8QqtJ/FvH9omlx5IYPI4/hm5Q5yiCmFgQVZXcb
 lfEGLE9y0OJZLSNgMJg0Vux9XyP/fpCA+PUmkSGKBj036w7rD7fkoil7PFjotFsC1GWH
 +6/8G7FbmfI2EobeI8GxM6uJlug6XdfwQW7eBUi/yEVtrs/FWAm1JaTBf6rTVgU1UGsc
 mFu4Wjv7cwZbpGA/JwGYKVLGSxAGkL04c87/Dvi10e1IMtjgGXov0gKwGKM3wkcUwNiZ
 BqLHzMZ2LBi/npiMkLG9N74ydpZMmQOeUZ1zBk42bFg4sAqohYU425h81/q/KFR26ZeW
 HMnQ==
X-Gm-Message-State: AJIora8qsXbeVis+9eNDvqopjNCe2cGswSCacJWVdtF3jK1GYmrZD0f1
 seI8WgNDoyFh1rug4iIyB9aI2Uj/2kpulODDUc2Vlw==
X-Google-Smtp-Source: AGRyM1td/rPSbsDPtwajD50WhjsLg3QFEDBWftZKqAEd+cbeoSRsVxg4lt/ba5CXFnCbN7OomFghAvTe9nTeMMiSBTA=
X-Received: by 2002:ad4:5aa4:0:b0:465:2b11:cfd with SMTP id
 u4-20020ad45aa4000000b004652b110cfdmr4031385qvg.55.1655221094880; Tue, 14 Jun
 2022 08:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220613204910.2651747-1-robdclark@gmail.com>
In-Reply-To: <20220613204910.2651747-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 14 Jun 2022 18:38:04 +0300
Message-ID: <CAA8EJpoU8ZqHTTcGWH3=cBRecFTKErjz2paTEjCYt8hTsvpbAQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Make msm_gem_free_object() static
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Jun 2022 at 23:49, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Misc small cleanup I noticed.  Not called from another object file since
> 3c9edd9c85f5 ("drm/msm: Introduce GEM object funcs")
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/msm_gem.c | 2 +-
>  drivers/gpu/drm/msm/msm_gem.h | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 35845e273d81..3ef7ada59392 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -1004,7 +1004,7 @@ void msm_gem_describe_objects(struct list_head *list, struct seq_file *m)
>  #endif
>
>  /* don't call directly!  Use drm_gem_object_put() */
> -void msm_gem_free_object(struct drm_gem_object *obj)
> +static void msm_gem_free_object(struct drm_gem_object *obj)
>  {
>         struct msm_gem_object *msm_obj = to_msm_bo(obj);
>         struct drm_device *dev = obj->dev;
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index 6b7d5bb3b575..d608339c1643 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -175,7 +175,6 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu);
>  void msm_gem_active_put(struct drm_gem_object *obj);
>  int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout);
>  int msm_gem_cpu_fini(struct drm_gem_object *obj);
> -void msm_gem_free_object(struct drm_gem_object *obj);
>  int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
>                 uint32_t size, uint32_t flags, uint32_t *handle, char *name);
>  struct drm_gem_object *msm_gem_new(struct drm_device *dev,
> --
> 2.36.1
>


-- 
With best wishes
Dmitry
