Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EAE37EF67
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 01:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7236E598;
	Wed, 12 May 2021 23:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E5D6E59B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 23:14:39 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id y12so18535527qtx.11
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 16:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ljcjrxsK/XtCU4dS+x6LI3mL4RYEV9Ptry5OPwJVY2E=;
 b=s8CweXbfhLkcMdcT4cy/GbSPDQnSsyfTfzDI1GTMbJ6TPSLqE4/nAW9bxFjPHzHL72
 571VcDZa6pKEhVPYi/CZ3RCUfI3x3KgqxhuxF5Nh/dvMXLeJM0XXdQViqi4lWm12vL5z
 50OrxtyTTYBRQchcB34p4bL2zp5LYS8lPQO8pOT4Y5l+gU40GNf1S1Fr3XL2iabIawfr
 Cema/AjTx7HVf+t5IiGbx8WqhJJWgRvWyhTilW1ps56sxrNs0XiFMPj1jkP+j+w/4F4R
 h+NHoxrRiQx/KJ3nld/gTRvxRV5grXrVIHqQsLrkGJFtOzF11mvcrqY16EAhTsvW8usg
 qgcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ljcjrxsK/XtCU4dS+x6LI3mL4RYEV9Ptry5OPwJVY2E=;
 b=WJZudJLP2qcsiI9YmV+avqVb6IBiTLCThZm09XxozYJEGlEbAfFV50x9wsfZzaw6GP
 Xx6GIHswEGUc/Ka1HHQd+VQiW3i2EkMZuajuJpae4/a8EUXzgReWUB1qxzI3AOaqzxB0
 +Kz7S+OefsjRYI8yKcaBTxl5QbTeuPXwocyRd0SUMROwmTylbsu+NIYqk3LXPwJXzQhe
 Ytdknp2W22NayJfvcJWsBBandqBAjRtvwy22Otip5lvPsHRVL9Yr15GiqEB/38yylI5L
 i+mm4c+NdLBzU1vccEX9IwA10nc8Ujjhu7fHuZctkuCShMWolXOHp2Rn18C80QZJekoU
 5taA==
X-Gm-Message-State: AOAM533TFREzVa078H1n2b3bcvQ5bHfnaKw+wL3LnmReU1sTJZu5nUKH
 ELXQxx3X0Nl6M4qaC+vsvhsnKKzfWTwbq17INR1JUQ==
X-Google-Smtp-Source: ABdhPJxLxj3TDBvcyByWDdaRA++dYA1K6hxNUZNV7DdQ5UKrMBDGQmHs5sMqcUIm9FkRI26YZKPprPB9q2vLgL3UH3w=
X-Received: by 2002:aed:314c:: with SMTP id 70mr34994410qtg.364.1620861278353; 
 Wed, 12 May 2021 16:14:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210511041852.592295-1-bjorn.andersson@linaro.org>
 <20210511041852.592295-2-bjorn.andersson@linaro.org>
In-Reply-To: <20210511041852.592295-2-bjorn.andersson@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 May 2021 02:14:27 +0300
Message-ID: <CAA8EJpo-GNsVSXG_6PfnPTLHp-hMT7GBKLEmDz4S25R4gGmOrw@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/msm/dpu: Introduce knowledge of widebus feature
To: Bjorn Andersson <bjorn.andersson@linaro.org>
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 11 May 2021 at 07:18, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Some hardware supports clocking 2 pixels per pixel clock pulse, known as
> "widebus". The configuration needs to match between the DPU and the
> interface controller, and the timing parameters must be adjusted.
>
> As a first step towards supporting this, start by adding a INTF mask
> flag to signal the timing configuration code that the INTF_CONFIG2
> register should be written - which will clear the bit, in the case that
> the bootloader left it set.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    | 3 ++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 4dfd8a20ad5c..c2f34a4f82d9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -196,12 +196,14 @@ enum {
>   * @DPU_INTF_TE                 INTF block has TE configuration support
>   * @DPU_DATA_HCTL_EN            Allows data to be transferred at different rate
>                                  than video timing
> + * @DPU_INTF_WIDEBUS            INTF block supports driving 2 pixels per clock
>   * @DPU_INTF_MAX
>   */
>  enum {
>         DPU_INTF_INPUT_CTRL = 0x1,
>         DPU_INTF_TE,
>         DPU_DATA_HCTL_EN,
> +       DPU_INTF_WIDEBUS,
>         DPU_INTF_MAX
>  };
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 1599e3f49a4f..933485d8c03c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -183,7 +183,6 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>         if (ctx->cap->features & BIT(DPU_DATA_HCTL_EN)) {
>                 intf_cfg2 |= BIT(4);
>                 display_data_hctl = display_hctl;
> -               DPU_REG_WRITE(c, INTF_CONFIG2, intf_cfg2);
>                 DPU_REG_WRITE(c, INTF_DISPLAY_DATA_HCTL, display_data_hctl);
>         }
>
> @@ -204,6 +203,8 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>         DPU_REG_WRITE(c, INTF_FRAME_LINE_COUNT_EN, 0x3);
>         DPU_REG_WRITE(c, INTF_CONFIG, intf_cfg);
>         DPU_REG_WRITE(c, INTF_PANEL_FORMAT, panel_format);
> +       if (ctx->cap->features & (BIT(DPU_DATA_HCTL_EN) | BIT(DPU_INTF_WIDEBUS)))
> +               DPU_REG_WRITE(c, INTF_CONFIG2, intf_cfg2);
>  }
>
>  static void dpu_hw_intf_enable_timing_engine(
> --
> 2.29.2
>


-- 
With best wishes
Dmitry
