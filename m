Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F215C70401E
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 23:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B0910E29C;
	Mon, 15 May 2023 21:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05C910E298
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 21:56:16 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-55c939fb24dso123315967b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 14:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684187775; x=1686779775;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0lPlc4qEgFtAyauRuU20afGpSG3CXt4C4kt+lMYU99Q=;
 b=HKVOb41nnA/UURo70T56UwgUW5N8aPA/Od/3f9DMurCvqTPRFwzp06QhjpRKC/tpDJ
 mKJSg2QW1JZwTG0CsufHAPqFJpfeCfYbQ7la3zkUe3xUWpnC1wbVxXfiL8rguIhS8xW8
 DfWtLmIZ0w8DgPpf2KiOYF85IO8AZ8xQNbCfxsCt4IMVagwXxGUZQkFZEzbd4/SPggpq
 +pWmN1nNFJZvGjdIj4i8Kktz5DGzyQZuRMblMBGApcDJcQxvzWhZ2ZbZvHXvFkW6M7/O
 /kEkAl/yrprKPWxTkthiJVgI452TMlpR9h9Jv+FyV9mJqNp6YpVgT/kW8SagISVSz/9N
 H7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684187775; x=1686779775;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0lPlc4qEgFtAyauRuU20afGpSG3CXt4C4kt+lMYU99Q=;
 b=LOpC77V9RBbv3HuXB6hnupHMEd+0O3rj7rAPv1jqjbVjb2XHcJ4uVeJChPpKSXfzUU
 ONrfOI2sID3Xx7/3o63a9AlxHFObR4hCreglr3Q/zIfA8/UU/co/zMkF2UqMbOLyUayp
 S0ZVN8Oc1Ko5NwGnNBayjTWS4mpR8Xm46na4uuxGNLMXl6ytpu+ktYD4mjCyYtr9wiT0
 qQLSbYL9P1oZHN81CezFQT2j5ACMPbjxhvsAg2iGKwaKw/l+1ZF3/XciLl7lq4M38Gu4
 Llqlhut18zW11mFydQH0ToIhr6dw6gQzz9sStsw7Qmk6o16tyBwT5NzwO/+E9DQAuWFq
 2Tgw==
X-Gm-Message-State: AC+VfDwP9TatrVBs3pp0sIBjOehJO4OXTV21LCwUcctd59iY3zehUR0B
 nmxYFe5h7txkjVUTilk0y8LfpD/5ZfBVSbbGWMf1oQ==
X-Google-Smtp-Source: ACHHUZ5yRt2IrPj/LNDhSE6gz+54j5EsXLzffnQwJylOHzaeRQYt5+9R+AGRcrxk8JfJEEUtBcf4z+r1GNt2r5ohhhs=
X-Received: by 2002:a0d:ef03:0:b0:55a:7c7:a2e1 with SMTP id
 y3-20020a0def03000000b0055a07c7a2e1mr30708227ywe.4.1684187775600; Mon, 15 May
 2023 14:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <1684185928-24195-1-git-send-email-quic_khsieh@quicinc.com>
 <1684185928-24195-3-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1684185928-24195-3-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 May 2023 00:56:04 +0300
Message-ID: <CAA8EJprT23Bp+Mfm6XOMn4MfqdexWEjnBEC4mp144=r_cmZTTg@mail.gmail.com>
Subject: Re: [PATCH v9 2/8] drm/msm/dpu: add DPU_PINGPONG_DSC feature bit for
 DPU < 7.0.0
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 swboyd@chromium.org, sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 16 May 2023 at 00:25, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> DPU < 7.0.0 requires the PINGPONG block to be involved during
> DSC setting up. Since DPU >= 7.0.0, enabling and starting the DSC
> encoder engine was moved to INTF with the help of the flush mechanism.
> Add a DPU_PINGPONG_DSC feature bit to restrict the availability of
> dpu_hw_pp_setup_dsc() and dpu_hw_pp_dsc_{enable,disable}() on the
> PINGPONG block to DPU < 7.0.0 hardware, as the registers are not
> available on DPU 7.0.0 and higher anymore.
> Add DPU_PINGPONG_DSC to PINGPONG_SDM845_MASK, PINGPONG_SDM845_TE2_MASK
> and PINGPONG_SM8150_MASK which is used for all DPU < 7.0 chipsets.
>
> changes in v6:
> -- split patches and rearrange to keep catalog related files at this patch
>
> changes in v9:
> -- delete add BIT(DPU_PINGPONG_DSC)  to PINGPONG_SDM845_TE2_MASK
>
> changes in v7:
> -- rewording commit text as suggested at review comments

This is definitely not in an order. Please keep the changelogs sorted
in way easy for other people to read.

>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 4 +++-
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 82b58c6..f2a1535 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -76,13 +76,13 @@
>         (BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
>
>  #define PINGPONG_SDM845_MASK \
> -       (BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_TE))
> +       (BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_TE) | BIT(DPU_PINGPONG_DSC))
>
>  #define PINGPONG_SDM845_TE2_MASK \
>         (PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
>
>  #define PINGPONG_SM8150_MASK \
> -       (BIT(DPU_PINGPONG_DITHER))
> +       (BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
>
>  #define CTL_SC7280_MASK \
>         (BIT(DPU_CTL_ACTIVE_CFG) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 6ee48f0..83854e8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -144,7 +144,8 @@ enum {
>   * @DPU_PINGPONG_TE2        Additional tear check block for split pipes
>   * @DPU_PINGPONG_SPLIT      PP block supports split fifo
>   * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
> - * @DPU_PINGPONG_DITHER,    Dither blocks
> + * @DPU_PINGPONG_DITHER     Dither blocks
> + * @DPU_PINGPONG_DSC        PP block supports DSC
>   * @DPU_PINGPONG_MAX
>   */
>  enum {
> @@ -153,6 +154,7 @@ enum {
>         DPU_PINGPONG_SPLIT,
>         DPU_PINGPONG_SLAVE,
>         DPU_PINGPONG_DITHER,
> +       DPU_PINGPONG_DSC,
>         DPU_PINGPONG_MAX
>  };
>
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
