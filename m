Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA28A1891A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 01:48:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B783210E650;
	Wed, 22 Jan 2025 00:48:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WoJyUO/M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0794010E650
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 00:48:04 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-e545c1e8a15so9969010276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 16:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737506883; x=1738111683; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bS/VJzcWrGagiRuYTKYIke8OIbozTbnJXMaBNiiZ+ik=;
 b=WoJyUO/MZ1DhF5uJOoGjPhY7UBSofoViY3mJsfVNPxOuh0DpTt0Tb1QRKKwvBud6I5
 Vc+6JmghyBFzijDjmVvfz9PmGaNNJgJNVQmzIB260rf5swZCGCvXTSwdzTjKyq9Yc/x4
 RJ9INSZPY6vtPBd6Pnb7c/uUA9nrysW1asOytsgQPGywPv0OKV4eSzd9/laACXQbLMI7
 qwTobvYaKM5S/jmumom58Un5BJGe/aE+tFmgoe3VA+3yk3kAIGFpiPKEUgb2OubE9k/9
 bG9jKtnNUy/2U/3OKWslWBo1nu2BKE8ucgxtAod3umxMKUPHd3/X0EA1XIs/cRnlXwKp
 3XVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737506883; x=1738111683;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bS/VJzcWrGagiRuYTKYIke8OIbozTbnJXMaBNiiZ+ik=;
 b=EICsSQOUDrCz41B1QixteIRXHMDBNzwONqQwYptv2HNl0ZbCCXvOyGykok1fI9NSgp
 RBxGgA+t88BLbI3N/YLH0AI8UXQdnUmnoTdSHh27W4nRKaXZrZWIsCX2+Ar/ccyYuBIM
 3VEXxIftnVS673mhWFuO8YqZ+eZr4DqPN5Tw7nMqsdUb1rJwgHaNiXHL1e6rbAWx8V/Q
 d67D4x8095Qm1QZjLQ24NztDArTPoeFzn/XYu4LlwlAN2aAnNJu4oTHs1verTy751Co1
 AkzY0avoCnUYorKbjpXjwPwm54pZZTLZeHduxPqa3B4+vYqD+iVBqdWadQ0iIsdd9m4Y
 Ggsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhpGUm1lA6snTMVd2FCunpzH2s0P0mIosm0OZE0HtvY9EfOpRWZVjCjlW2Tf5WW3+LlDzJAig5rvE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9U8k1JIRwB6fXj5ZGCs6GfDWNBAHcqq6r6x/zroqOMuLUCfNL
 Arr/MIB5HNsCR+pm9vqp3GPRd8Beq/kefmrFGK3LUTMR25lwLE8azGJBvsAWDaB9XeHXOvqvKL/
 8gYMeFESvHSOO/blDOXGNtH1vk9dUscHbVqaU2Q==
X-Gm-Gg: ASbGncvVaJBNu8IdCwMZFRzK5Jy6mawmbdTD9jcmRVO4IjDj67sdAN4f4lPGJfH3NaO
 AkyMA9V0BWMBvF0baFCtbUIBe9KRS+DCo0Kl1SMN7LC5Gy9hQjA==
X-Google-Smtp-Source: AGHT+IHNpwH/nJ7G4ykzYu3i50l1wE++Ejfd+7Gv4N2WyGLqHaSWjWRicmVmxYN3bG9NzUJx8uqflaT725+edwJPpWM=
X-Received: by 2002:a05:690c:f81:b0:6ef:6f24:d092 with SMTP id
 00721157ae682-6f6eb654456mr170084847b3.1.1737506882961; Tue, 21 Jan 2025
 16:48:02 -0800 (PST)
MIME-Version: 1.0
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
 <20241214-dpu-drop-features-v1-9-988f0662cb7e@linaro.org>
 <b75ded72-f1b5-4e7e-b0b4-0720ef90b60f@quicinc.com>
In-Reply-To: <b75ded72-f1b5-4e7e-b0b4-0720ef90b60f@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 Jan 2025 02:47:52 +0200
X-Gm-Features: AbW1kvZ-0yr3fWq8rqcIL8gp-85OSXfCPUU70sc3IT5wMW2A1gZtKwrekj6S85c
Message-ID: <CAA8EJppbPGOc_n1r7Ji=ToLKFCjeFoVjz+dRdudjU_ODpNWO6w@mail.gmail.com>
Subject: Re: [PATCH 09/35] drm/msm/dpu: remove DSPP_SC7180_MASK
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Abhinav,

On Wed, 22 Jan 2025 at 02:28, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/13/2024 2:14 PM, Dmitry Baryshkov wrote:
> > Stop declaring DPU_DSPP_PCC as a part of the DSPP features, use the
> > presence of the PCC sblk to check whether PCC is present in the hardware
> > or not.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 2 --
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 2 --
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 2 --
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 2 --
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 2 --
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c              | 2 +-
> >   28 files changed, 1 insertion(+), 66 deletions(-)
> >
>
> <snip>
>
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> > index 0f5a74398e66642fba48c112db41ffc75ae2a79f..11fb1bc54fa92a5d9926addb437bc4b8f283723b 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> > @@ -90,7 +90,7 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(struct drm_device *dev,
> >       /* Assign ops */
> >       c->idx = cfg->id;
> >       c->cap = cfg;
> > -     if (test_bit(DPU_DSPP_PCC, &c->cap->features))
> > +     if (c->cap->sblk->pcc.base)
> >               c->ops.setup_pcc = dpu_setup_dspp_pcc;
> >
> >       return c;
> >
>
> Change LGTM, only one note (hopefully has already been taken into
> consideration). There are  two different versions of PCC, one with
> version 0x10007 and the other 0x40000.
>
> If for some reason we need to distinguish these two versions while
> programming, is the plan to use version to distinguish them? Because the
> presence of PCC alone is not enough for using the "correct" PCC.

Yes, we can either use mdss_ver or sblk->version to distinguish between those.

-- 
With best wishes
Dmitry
