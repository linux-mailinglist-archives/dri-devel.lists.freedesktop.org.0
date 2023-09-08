Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4648D7992C1
	for <lists+dri-devel@lfdr.de>; Sat,  9 Sep 2023 01:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A0110E213;
	Fri,  8 Sep 2023 23:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF9F10E216
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 23:18:12 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-d7f0a60a159so2267861276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Sep 2023 16:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694215091; x=1694819891; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NJMUBhG0eoBNMSnOz1KraejVtnxEE/dXjjdZnrGqmlg=;
 b=O99F7QgypgfAqXi7JfxNZaN9UHkM08qRdyObxp7hpwldwBabqPWJktT1AxblEq40iY
 f25h04KgnsW3A7PfyPEScDiMXHLKk3cXANx7QRjTmdL/LUng1rz5CU9b8D/IcXDpR7Py
 DKhxY+9msI6PQisF4xHY93wZubBWwcR+dgvVMXVti7Xpp4LEjljpeCX357fdaWbRDooj
 DypBRDFLPn9tiao6rNm7BTPe9x3jDpI+3c55eYuU5J/4EKK1eVqw0nLzguJ0cN+cAZ9N
 bKwfVv1gSSOVJTRWUWHp63D70sZvuF2wt1+I2m0VmBarZLXEkbZTvDFkKz2IH/Imgovw
 mp1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694215091; x=1694819891;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NJMUBhG0eoBNMSnOz1KraejVtnxEE/dXjjdZnrGqmlg=;
 b=D8snykC+RLGnaPEyTI6gFXsJ7iGdlNDem8ITlYub7Ky6G/6XRyvrF+3YknqMyTaMQ3
 15p6aZGHvFsdlyXJ8tcOwW/u634MDtv1IRTQ913fxU3Xe1SRqgtUVGjMn9qkl6rUgtZA
 WCTqzwoRMctgpA3nxCocziZtaIOKnF/i0ojJlZq4tl+ljPX5crA1uOg40P3D8AM/3JH6
 TvaqeHXZiajzImMiyHnDwnPchc8nRbyJw08YrIVm6OIf+Z84O8QavlkCQSKb/GXAuLZH
 HNH7ik8zmdel4CEQW5AGb2zdu4+pGGzx2IdLdMQMj/qWVWNOfio4P6XxPE2psqqIeWhX
 0/bg==
X-Gm-Message-State: AOJu0YzxBxHXSbemrooUqImiQXCnrYSq5upIOh+vVKqK1+vJjIlwkNy7
 8iH+6EcVlGPXdwhfvk8D6ecQNQbbNb5wC2ciYxITyg==
X-Google-Smtp-Source: AGHT+IEHwQi9VCn0Ewp1OpyUXVY6DBAkAsvUro6YE8dOwPuGcphb95UIrrUWzqBjJD0FOWCSZ/X/MBXn68aBCYeLzAU=
X-Received: by 2002:a05:6902:1895:b0:bc9:92c9:7fd1 with SMTP id
 cj21-20020a056902189500b00bc992c97fd1mr4692606ybb.3.1694215091567; Fri, 08
 Sep 2023 16:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230908193314.27008-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20230908193314.27008-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 9 Sep 2023 02:18:00 +0300
Message-ID: <CAA8EJppXTpTW=Q2N_wJ_VUYeQDagRYqYXHJBBhNWFv8asYPKJQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: enable smartdma on sm8350
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_parellan@quicinc.com, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 nespera@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 Sept 2023 at 22:33, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> To support high resolutions on sm8350, enable smartdma
> in its catalog.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>
> Notes:
>     only compile tested, to be landed after sufficient testing

I'll test sm8350 (and hopefully sm8450) early next week.

>
>  .../drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index 8da424eaee6a..a32d235ff08e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -82,21 +82,21 @@ static const struct dpu_ctl_cfg sm8350_ctl[] = {
>  };
>
>  static const struct dpu_sspp_cfg sm8350_sspp[] = {
> -       SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
> +       SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK_SDMA,
>                 sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -       SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1f8, VIG_SC7180_MASK,
> +       SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1f8, VIG_SC7180_MASK_SDMA,
>                 sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> -       SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1f8, VIG_SC7180_MASK,
> +       SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1f8, VIG_SC7180_MASK_SDMA,
>                 sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> -       SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1f8, VIG_SC7180_MASK,
> +       SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1f8, VIG_SC7180_MASK_SDMA,
>                 sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> -       SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
> +       SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK_SDMA,
>                 sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -       SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_SDM845_MASK,
> +       SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_SDM845_MASK_SDMA,
>                 sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -       SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> +       SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK_SDMA,
>                 sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> -       SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> +       SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1f8, DMA_CURSOR_SDM845_MASK_SDMA,
>                 sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>  };
>
> --
> 2.40.1
>


-- 
With best wishes
Dmitry
