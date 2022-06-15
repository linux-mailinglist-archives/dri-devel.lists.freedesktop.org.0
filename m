Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D936454C4C3
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 11:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E21D10F4EE;
	Wed, 15 Jun 2022 09:36:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D261C10F4EE
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 09:36:20 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id k4so7741164qth.8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 02:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7QNEGYXUz8pQf3w+1bvDdtgFH6MUG0ZoicrR4BjVHCc=;
 b=KLhRgQIh7j56rL+CeT1/AIsPs7HbftKnmpfSQGNxEaYzR+UvgSTW/66ZG7A5uSRB8m
 rYcBEns4a0tpewjfdBSWFlOdJ0s8y18USj87ulTV0wZxDZH7R5rvTq8QqwCye9COw7eh
 oYZTlt8Xy9f1YoIylk+uIB1wTM2gwYSDLHrx3oEVXhw6f28lyIiY3ssCjtQzlBdNroFR
 VADuJcqtNdpLbPSeCv841rPmr41txzfHXdTIqX/TrEN+73hGB/AV5UxCfc0y6lrsrUQM
 0etmPt6DHp/LoihXdY3MhnrvC40sKIgGcjJTQlsFZfaxADXpvXFNVo0HSRY3t7Ji712k
 jIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7QNEGYXUz8pQf3w+1bvDdtgFH6MUG0ZoicrR4BjVHCc=;
 b=AZMWGO8v4m5+N9f7TCyXKjnmqgZQthDUWKB0t0yC+fFVkvxz81QYsrY5ETcO2+/ban
 qohCMYb5n/hp8AQzYjOf2iZgvF6O+Lb/z4auGZkzB5EPyxhkGOXTIt922eiyQG/NjHP2
 iLgt3/fQwEq1Qozuz5/KFK+i7om9/DtWwQOEeY4egYW9Huv1vloeGhEiiPHXV+gT9HQe
 l28vaPAoGFenIr7z9DRJvJi+o9puwRMRID4n5tZDcPaBJoAc8L/nSMfo4e1tfHMMgnjL
 Nvj8vpHEI0TQF3KA00QCwzqCF3qWzdYvM30LOdAVEGT1lGLnIcH12z+BXdGvqP4LpjmD
 baOw==
X-Gm-Message-State: AOAM530FARQUAzqWRP7mkhUCbx/IeVPQYtHNPxMDcwjODyLcGsUmmDWl
 WiUlfJGDwK7BzEtzOV5/zvo1B/6/llO66gq4JAjZsQ==
X-Google-Smtp-Source: ABdhPJy2bbSEedgpMZFbZEgRXdnRZv2EXPcCVH6aPnp4Gb7d93BjTJ+t4/cvMDZUeHyJwmLG6si774f6ZtVKomeNQH4=
X-Received: by 2002:ac8:598f:0:b0:305:8f8:2069 with SMTP id
 e15-20020ac8598f000000b0030508f82069mr8051126qte.370.1655285779944; Wed, 15
 Jun 2022 02:36:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220614211328.216-1-quic_jesszhan@quicinc.com>
 <20220614211328.216-3-quic_jesszhan@quicinc.com>
In-Reply-To: <20220614211328.216-3-quic_jesszhan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 15 Jun 2022 12:36:09 +0300
Message-ID: <CAA8EJpoNQTzMQB8Kge9LshMzAQM8NEYtrDVPaz9OJ3zrD-X2xw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/msm/dpu: Add MISR register support for
 interface
To: Jessica Zhang <quic_jesszhan@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Jun 2022 at 00:13, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Add support for setting MISR registers within the interface
>
> Changes since V1:
> - Replaced dpu_hw_intf collect_misr and setup_misr implementations with
>   calls to dpu_hw_utils helper methods
>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 19 ++++++++++++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  8 +++++++-
>  2 files changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 3f4d2c6e1b45..0157613224fd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -1,5 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> +/*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>   */
>
>  #include "dpu_hwio.h"
> @@ -67,6 +69,9 @@
>  #define INTF_CFG2_DATABUS_WIDEN        BIT(0)
>  #define INTF_CFG2_DATA_HCTL_EN BIT(4)
>
> +#define INTF_MISR_CTRL                 0x180
> +#define INTF_MISR_SIGNATURE            0x184
> +
>  static const struct dpu_intf_cfg *_intf_offset(enum dpu_intf intf,
>                 const struct dpu_mdss_cfg *m,
>                 void __iomem *addr,
> @@ -319,6 +324,16 @@ static u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
>         return DPU_REG_READ(c, INTF_LINE_COUNT);
>  }
>
> +static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf, bool enable, u32 frame_count)
> +{
> +       dpu_hw_setup_misr(&intf->hw, enable, frame_count, INTF_MISR_CTRL);
> +}
> +
> +static int dpu_hw_intf_collect_misr(struct dpu_hw_intf *intf, u32 *misr_value)
> +{
> +       return dpu_hw_collect_misr(&intf->hw, misr_value, INTF_MISR_CTRL, INTF_MISR_SIGNATURE);
> +}
> +
>  static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
>                 unsigned long cap)
>  {
> @@ -329,6 +344,8 @@ static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
>         ops->get_line_count = dpu_hw_intf_get_line_count;
>         if (cap & BIT(DPU_INTF_INPUT_CTRL))
>                 ops->bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
> +       ops->setup_misr = dpu_hw_intf_setup_misr;
> +       ops->collect_misr = dpu_hw_intf_collect_misr;
>  }
>
>  struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf idx,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index 7b2d96ac61e8..8d0e7b509260 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -1,5 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> +/*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>   */
>
>  #ifndef _DPU_HW_INTF_H
> @@ -57,6 +59,8 @@ struct intf_status {
>   * @ get_line_count: reads current vertical line counter
>   * @bind_pingpong_blk: enable/disable the connection with pingpong which will
>   *                     feed pixels to this interface
> + * @setup_misr: enable/disable MISR
> + * @collect_misr: read MISR signature
>   */
>  struct dpu_hw_intf_ops {
>         void (*setup_timing_gen)(struct dpu_hw_intf *intf,
> @@ -77,6 +81,8 @@ struct dpu_hw_intf_ops {
>         void (*bind_pingpong_blk)(struct dpu_hw_intf *intf,
>                         bool enable,
>                         const enum dpu_pingpong pp);
> +       void (*setup_misr)(struct dpu_hw_intf *intf, bool enable, u32 frame_count);
> +       int (*collect_misr)(struct dpu_hw_intf *intf, u32 *misr_value);
>  };
>
>  struct dpu_hw_intf {
> --
> 2.35.1
>


-- 
With best wishes
Dmitry
