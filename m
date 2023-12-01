Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE1F8004C7
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 08:36:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 519DF10E7FA;
	Fri,  1 Dec 2023 07:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A038510E801
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 07:36:18 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-db537948ea0so220923276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 23:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701416178; x=1702020978; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=agsfiRECeqYBBTNI5jA/GLw7ZqrRCfvXHnWiPUcu+5c=;
 b=tM0QTtJ8bUAQ6kW+02tyDVTx08DpOUfQqDxX0VK2FSvPVbjESJauYwME4VQNE5mVPM
 J0MFQIdWnuWpD4x5zuMGuLoJK3h3lfEPiiVONt5i08oQ3kaqzghIWXCptiQ4M3wi0Qfk
 jfMDenf88OVZzvro8mnQvXwhrvx5nLId2wd2TCaCGY1GD3903ztYBJniIJ1TIxFO+kkO
 mhpndZQ3ch8yMVJzLJQYc3aigbA1UFr7OlDPhhHgOv/LccCE2sekGL0B+puNplQfupEd
 0WG83hceuTEqwLZU4aiAO2eeS3du4deluQe/Ccsx6B9ZHZ19qiVpUothfnMW1iZMCEb0
 JEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701416178; x=1702020978;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=agsfiRECeqYBBTNI5jA/GLw7ZqrRCfvXHnWiPUcu+5c=;
 b=u3KiGy4N1WoSyn4zBGVEYJOhnJUJ9X5AerNczeiUUpmmGsUElGP0EQnznt4RjXjwNl
 M/GIUmw/vkxweal4ilHvFRhV7odegPyTlQgJ/DOWQzHNdvWgBBWWWKgqH3G3yVM7iI8f
 dfmDtqdQ//ZbfpBUasLVTzz9TxCq3V5KquK/6SLuBVnvAtWpS8sTc4OXV80tzOOWRbYY
 VphsREvu1mpveygIjLNXG1QcXGsuXjG0JEMOGT3pC/gFartcuaGVFu6hFHAEQmlDtfm+
 RtRVsQ/b1BSAOip7LK+m6ihxd+Ake5iFA1OGsjQwKln+OAaLpwLpYeUO6uT+o/fX3pAH
 pZHg==
X-Gm-Message-State: AOJu0YzrouH6322P+0Ixa9rTRhEBoI/Li5BSzbcuUSqTu9Kcs+13C5bU
 SnuFqq0BePrJ2Mx5CI3drsTROEmeQftgP+9aV2bXfw==
X-Google-Smtp-Source: AGHT+IGbb2baOB0YO00MsvV5IKpg+i74V1z52uF6AVI5m1Ru+KhhZ9N4dcWelfpI2abVk4W6sHR5sUCVFZgpwgYXSlE=
X-Received: by 2002:a25:8d0b:0:b0:d9b:eb86:2b26 with SMTP id
 n11-20020a258d0b000000b00d9beb862b26mr22384450ybl.21.1701416177709; Thu, 30
 Nov 2023 23:36:17 -0800 (PST)
MIME-Version: 1.0
References: <20231130-encoder-fixup-v1-0-585c54cd046e@quicinc.com>
 <20231130-encoder-fixup-v1-2-585c54cd046e@quicinc.com>
In-Reply-To: <20231130-encoder-fixup-v1-2-585c54cd046e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 1 Dec 2023 09:36:06 +0200
Message-ID: <CAA8EJpqeu18q4jN82fUvsEdBRmEjG_mYLQQUWD+LDxjiQQQPsg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/dpu: Set input_sel bit for INTF
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
Cc: freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Dec 2023 at 03:31, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Set the input_sel bit for encoders as it was missed in the initial
> implementation.
>
> Reported-by: Rob Clark <robdclark@gmail.com>
> Fixes: 91143873a05d ("drm/msm/dpu: Add MISR register support for interface")
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/39
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 7 ++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 4 +++-
>  4 files changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 3442cf65b86f..d0884997ecb7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -320,7 +320,7 @@ static u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
>
>  static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf)
>  {
> -       dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL);
> +       dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL, true);
>  }
>
>  static int dpu_hw_intf_collect_misr(struct dpu_hw_intf *intf, u32 *misr_value)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> index f38473e68f79..77b14107c84a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> @@ -83,7 +83,7 @@ static void dpu_hw_lm_setup_border_color(struct dpu_hw_mixer *ctx,
>
>  static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx)
>  {
> -       dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL);
> +       dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, false);
>  }
>
>  static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *misr_value)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> index a8a0a4e76b94..f441df47fdde 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> @@ -481,7 +481,8 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
>                       cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
>  }
>
> -void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c, u32 misr_ctrl_offset)
> +void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c, u32 misr_ctrl_offset,
> +               bool set_input_sel)
>  {
>         u32 config = 0;
>
> @@ -491,6 +492,10 @@ void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c, u32 misr_ctrl_offset)
>         wmb();
>
>         config = MISR_FRAME_COUNT | MISR_CTRL_ENABLE | MISR_CTRL_FREE_RUN_MASK;
> +
> +       if (set_input_sel)
> +               config |= MISR_CTRL_INPUT_SEL;
> +
>         DPU_REG_WRITE(c, misr_ctrl_offset, config);
>  }
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> index bb496ebe283b..793670d62414 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> @@ -17,6 +17,7 @@
>  #define MISR_CTRL_ENABLE                BIT(8)
>  #define MISR_CTRL_STATUS                BIT(9)
>  #define MISR_CTRL_STATUS_CLEAR          BIT(10)
> +#define MISR_CTRL_INPUT_SEL             BIT(24)

The public apq8916 TRM documents this as a 4-bit field. I think this
was followed into the later generations. Can we please document it
correctly and use an uint instead of just bool for set_input_sel?

>  #define MISR_CTRL_FREE_RUN_MASK         BIT(31)
>
>  /*
> @@ -357,7 +358,8 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
>                            bool qos_8lvl,
>                            const struct dpu_hw_qos_cfg *cfg);
>
> -void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c, u32 misr_ctrl_offset);
> +void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c, u32 misr_ctrl_offset,
> +                      bool set_input_sel);
>
>  int dpu_hw_collect_misr(struct dpu_hw_blk_reg_map *c,
>                 u32 misr_ctrl_offset,
>
> --
> 2.43.0
>


-- 
With best wishes
Dmitry
