Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E96A0812095
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 22:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525BC10E85B;
	Wed, 13 Dec 2023 21:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC5E10E85F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 21:20:30 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-5e36848f6c6so1779207b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 13:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702502429; x=1703107229; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FqXQr8abf4Sh2kGebNrfb5oJyMJpF6xCUKnEE12XH/Q=;
 b=dCRj7cig3eCYuv45hUZ+ItrtdZpIkkYjt4xO0MwaePL2mI9MavtMPeWNfRq6Va7r0q
 eWDKlowswkGF00kNmHI8DZqHd2E4p8E8vUzgnILaYIqzgxpc0jM8G2X7joBae37njEMY
 T8B2mNcR/b1Cm0SEqRj6vYSf5gDeGoUs/91RnA4IipvtXgzOceNBnCuELGTR6snVi1z0
 Fq1H2Iv+d/+mXC6Zmsb4V59uRVbbLr1F+Pi1dQsPUE7nYs2eFfZS22XrOLlb5sLVzrXi
 /pLCtowavSh0AloKMxPJFpTvRBiqGGx66Stl2RaKsRNDYRilWfs2jSDLdoWsJollr0F5
 qqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702502429; x=1703107229;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FqXQr8abf4Sh2kGebNrfb5oJyMJpF6xCUKnEE12XH/Q=;
 b=wU0ZWshxj/ICsWEPIOc0hZ07N7v8UrUy1GSYwQ7lrQVefsu604jIG3FadDrrEixlXX
 qADmQfz74dGiQOEM9zWED+xCFyFyrmeTZckPJaHK9bwL1XsJ//XMOOo4pIlgnMRuuXVX
 CZej6+xYrmeHk3CipDI/IQAnNpsksNjYXIsCcJlpgQaEbGqLz26sQnSYslXnRWxtRhRB
 lSBLPv3HW2k9WSLfJ2ouMn3WG5E+Ns1XzjX7Z2Si+m8HYSV8h1xzWKgdBhn0Tlp+Uh1T
 OI9JGs7Ly9GB7Yl3rnBbmku+N6nhr7ZZYPCiZ2mozlwg+rL9GdODlNsFJltmbXhP/+Jt
 TzfA==
X-Gm-Message-State: AOJu0YxtZfwtP3UsNA8fClQnV8QkLR/j8Ero0Hkupv0W4UKC0qakxWZX
 blTuKCIyW+AM4lyNn8QuZlB2o5UxCzT/MLMRIkDKrQ==
X-Google-Smtp-Source: AGHT+IHeo1UY1ULCcNk0KgK5peeMfa7CxbPjWoOoAA82PaXMtiZ9blILD4Z6ZOVhguzGfUKhUFB2iVcj8GUGo2GD07g=
X-Received: by 2002:a81:6582:0:b0:5d3:cd07:4c05 with SMTP id
 z124-20020a816582000000b005d3cd074c05mr6091652ywb.0.1702502429619; Wed, 13
 Dec 2023 13:20:29 -0800 (PST)
MIME-Version: 1.0
References: <20231213-encoder-fixup-v2-0-b11a4ad35e5e@quicinc.com>
 <20231213-encoder-fixup-v2-1-b11a4ad35e5e@quicinc.com>
In-Reply-To: <20231213-encoder-fixup-v2-1-b11a4ad35e5e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Dec 2023 23:20:18 +0200
Message-ID: <CAA8EJpqr0akUZoDYR1Q2+WBC4vvAgp_xfjBSq2ZTuoS4HLxnUQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm/dpu: Set input_sel bit for INTF
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

On Wed, 13 Dec 2023 at 22:51, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Set the input_sel bit for encoders as it was missed in the initial
> implementation.
>
> Reported-by: Rob Clark <robdclark@gmail.com>
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/39
> Fixes: 91143873a05d ("drm/msm/dpu: Add MISR register support for interface")
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 10 ++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  3 ++-
>  4 files changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 0b6a0a7dcc39..226133af7840 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -322,7 +322,7 @@ static u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
>
>  static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf, bool enable, u32 frame_count)
>  {
> -       dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL, enable, frame_count);
> +       dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL, enable, frame_count, 0x1);
>  }
>
>  static int dpu_hw_intf_collect_misr(struct dpu_hw_intf *intf, u32 *misr_value)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> index 25af52ab602f..bbc9756ecde9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> @@ -85,7 +85,7 @@ static void dpu_hw_lm_setup_border_color(struct dpu_hw_mixer *ctx,
>
>  static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx, bool enable, u32 frame_count)
>  {
> -       dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, enable, frame_count);
> +       dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, enable, frame_count, 0x0);
>  }
>
>  static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *misr_value)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> index 0b05061e3e62..87716a60332e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> @@ -477,7 +477,8 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
>
>  void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
>                 u32 misr_ctrl_offset,
> -               bool enable, u32 frame_count)
> +               bool enable, u32 frame_count,
> +               u32 input_sel)
>  {
>         u32 config = 0;
>
> @@ -487,8 +488,13 @@ void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
>         wmb();
>
>         if (enable) {
> +               /*
> +                * note: Aside from encoders, input_sel should be
> +                * set to 0x0 by default
> +                */

Even if it is not a proper kernedoc, please move this comment before
the function.

>                 config = (frame_count & MISR_FRAME_COUNT_MASK) |
> -                       MISR_CTRL_ENABLE | MISR_CTRL_FREE_RUN_MASK;
> +                       MISR_CTRL_ENABLE | MISR_CTRL_FREE_RUN_MASK |
> +                       ((input_sel & 0xF) << 24);
>
>                 DPU_REG_WRITE(c, misr_ctrl_offset, config);
>         } else {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> index fe083b2e5696..761056be272b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> @@ -357,7 +357,8 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
>  void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
>                 u32 misr_ctrl_offset,
>                 bool enable,
> -               u32 frame_count);
> +               u32 frame_count,
> +               u32 input_sel);
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
