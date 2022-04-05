Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA414F35CA
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 15:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F021110E92A;
	Tue,  5 Apr 2022 13:53:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF9E510E922
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 13:53:52 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id o15so9692748qtv.8
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 06:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4HnvRO7lr2w7hmP3stxla6YE3jnvjBGfmNRhV/EHqOA=;
 b=o0X5VaZwVCyYI1G5T5upkTdAjGlcoKIdCZmTqolCgeKFccezDvV/tgpqIzF2/mMSKs
 Kl2IuC5SRPqA7v7voAvbq3MpW9DX8JABcp6fN2/GlDIDDQVPYcxctXIVKpGRstZS9x5U
 +w7v2q/pZ0Cw9MxcUo9RBfptEYG9kN0euhcDa3r4BzJlRJS3meHblSVHUTQzePAeDaqg
 VyJ+gchjtKwi/OpChzgEMWYrDzJmzwjz+PVvNonzxV+IM4ekcts0LjqjsEa0r706torC
 zrC68CMWltSEnX6k2BQ4ndKhl9Tm2vz/XkS4CiQJRELnrkTmq8lFVGcKQ/AhBKi0aUUc
 7R1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4HnvRO7lr2w7hmP3stxla6YE3jnvjBGfmNRhV/EHqOA=;
 b=GVly84Zb0dxwXvth8ZO9prWmPQjHeiNXxIH1szr//+rZh4SmKFE/zwl79DGcrjC1L+
 edoj+oTEoPF5UzhIbo4rICGFqVlTWmvfIBEa4NkgPyyc2fVcvt0g8hyGzJgBZu7cGxY1
 +/b3lNGNWD/C70T7MhOu2jc+PbE0xxSYFLYr7GgFADjtcC5YBFQYbILLRTSVkOfVxrmf
 mxeN0eOyXIKitZLSsSF/I5TCn5Ctqnxyfc2fF7nBeVotafOW3RQKMS1WnzrzOKAcE7Sy
 YSZUkJg/2sj77+iwafUwMvJ8DQi+sqzUjIlVKKQvkA7JJK/UIYf+xlmyuqAF5buZaOfr
 0YIg==
X-Gm-Message-State: AOAM5326CEGtLKwgwQGk7BsXlNsrJPQfZHdLydm3ci7iDzzSOQVHCQ8G
 Gpo1u3PzPL6YREyQWVJgsdiHpvCsLROXU5xLwJNpig==
X-Google-Smtp-Source: ABdhPJzIDoSF+6Z+IgVGJYIOZcre2dgT+lmOkYw8CPj1kGK+QedemExf0JBY+krsIbSwCgL7Do7CtFRysaGmp57oFxI=
X-Received: by 2002:ac8:4e52:0:b0:2e1:dad8:5141 with SMTP id
 e18-20020ac84e52000000b002e1dad85141mr3037475qtw.62.1649166831760; Tue, 05
 Apr 2022 06:53:51 -0700 (PDT)
MIME-Version: 1.0
References: <1649166091-18032-1-git-send-email-quic_vpolimer@quicinc.com>
 <1649166091-18032-3-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1649166091-18032-3-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 5 Apr 2022 16:53:40 +0300
Message-ID: <CAA8EJpogg7J8fMQH1fOmU0J2i127-wnr7rFFNoTRQTKfAin1+g@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] drm/msm/disp/dpu1: add inline rotation support for
 sc7280
To: Vinod Polimera <quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 5 Apr 2022 at 16:41, Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
>
> - Some DPU versions support inline rot90. It is supported only for
> limited amount of UBWC formats.
> - There are two versions of inline rotators, v1 (present on sm8250 and
> sm7250) and v2 (sc7280). These versions differ in the list of supported
> formats and in the scaler possibilities.
>
> Co-developed-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Few minor comments below. Otherwise it looks really good now.

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 173 +++++++++++++++----------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  16 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 129 ++++++++++++++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h      |   2 +
>  4 files changed, 226 insertions(+), 94 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index a4fe77c..65ce505 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -35,6 +35,9 @@
>         BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
>         BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
>
> +#define VIG_SC7280_MASK \
> +       (VIG_SC7180_MASK | BIT(DPU_SSPP_INLINE_ROTATION))
> +
>  #define DMA_SDM845_MASK \
>         (BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
>         BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
> @@ -203,6 +206,11 @@ static const uint32_t plane_formats_yuv[] = {
>         DRM_FORMAT_YVU420,
>  };
>
> +static const u32 rotation_v2_formats[] = {
> +       DRM_FORMAT_NV12,
> +       /* TODO add formats after validation */
> +};
> +
>  /*************************************************************
>   * DPU sub blocks config
>   *************************************************************/
> @@ -642,7 +650,6 @@ static const struct dpu_ctl_cfg qcm2290_ctl[] = {
>   *************************************************************/
>
>  /* SSPP common configuration */
> -
>  #define _VIG_SBLK(num, sdma_pri, qseed_ver) \
>         { \
>         .maxdwnscale = MAX_DOWNSCALE_RATIO, \
> @@ -660,6 +667,27 @@ static const struct dpu_ctl_cfg qcm2290_ctl[] = {
>         .num_formats = ARRAY_SIZE(plane_formats_yuv), \
>         .virt_format_list = plane_formats, \
>         .virt_num_formats = ARRAY_SIZE(plane_formats), \
> +       .rotation_cfg = NULL, \
> +       }
> +
> +#define _VIG_SBLK_ROT(num, sdma_pri, qseed_ver, rot_cfg) \
> +       { \
> +       .maxdwnscale = MAX_DOWNSCALE_RATIO, \
> +       .maxupscale = MAX_UPSCALE_RATIO, \
> +       .smart_dma_priority = sdma_pri, \
> +       .src_blk = {.name = STRCAT("sspp_src_", num), \
> +               .id = DPU_SSPP_SRC, .base = 0x00, .len = 0x150,}, \
> +       .scaler_blk = {.name = STRCAT("sspp_scaler", num), \
> +               .id = qseed_ver, \
> +               .base = 0xa00, .len = 0xa0,}, \
> +       .csc_blk = {.name = STRCAT("sspp_csc", num), \
> +               .id = DPU_SSPP_CSC_10BIT, \
> +               .base = 0x1a00, .len = 0x100,}, \
> +       .format_list = plane_formats_yuv, \
> +       .num_formats = ARRAY_SIZE(plane_formats_yuv), \
> +       .virt_format_list = plane_formats, \
> +       .virt_num_formats = ARRAY_SIZE(plane_formats), \
> +       .rotation_cfg = rot_cfg, \
>         }
>
>  #define _DMA_SBLK(num, sdma_pri) \
> @@ -684,6 +712,12 @@ static const struct dpu_sspp_sub_blks msm8998_vig_sblk_2 =
>  static const struct dpu_sspp_sub_blks msm8998_vig_sblk_3 =
>                                 _VIG_SBLK("3", 0, DPU_SSPP_SCALER_QSEED3);
>
> +static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
> +       .rot_maxheight = 1088,
> +       .rot_num_formats = ARRAY_SIZE(rotation_v2_formats),
> +       .rot_format_list = rotation_v2_formats,
> +};
> +
>  static const struct dpu_sspp_sub_blks sdm845_vig_sblk_0 =
>                                 _VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3);
>  static const struct dpu_sspp_sub_blks sdm845_vig_sblk_1 =
> @@ -707,59 +741,62 @@ static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK("11", 4);
>         .sblk = &_sblk, \
>         .xin_id = _xinid, \
>         .type = _type, \
> -       .clk_ctrl = _clkctrl \
> +       .clk_ctrl = _clkctrl, \

You don't need this change. And also you don't need to change SSPP_BLK
lines that follow. Could you please drop these changes and resend?

The only chunk in this part that you really need is the addition of
sc7280_vig_sblk_0.

>         }
>
>  static const struct dpu_sspp_cfg msm8998_sspp[] = {
> -       SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_MSM8998_MASK,
> -               msm8998_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -       SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_MSM8998_MASK,
> -               msm8998_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> -       SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_MSM8998_MASK,
> -               msm8998_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> -       SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_MSM8998_MASK,
> -               msm8998_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> -       SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_MSM8998_MASK,
> -               sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -       SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_MSM8998_MASK,
> -               sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -       SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_MSM8998_MASK,
> -               sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> -       SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_MSM8998_MASK,
> -               sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
> +       SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_MSM8998_MASK, msm8998_vig_sblk_0,
> +               0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +       SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_MSM8998_MASK, msm8998_vig_sblk_1,
> +               4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> +       SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_MSM8998_MASK, msm8998_vig_sblk_2,
> +               8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> +       SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_MSM8998_MASK, msm8998_vig_sblk_3,
> +               12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> +       SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_MSM8998_MASK, sdm845_dma_sblk_0,
> +               1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> +       SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_MSM8998_MASK, sdm845_dma_sblk_1,
> +               5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> +       SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_MSM8998_MASK, sdm845_dma_sblk_2,
> +               9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> +       SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_MSM8998_MASK, sdm845_dma_sblk_3,
> +               13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
>  };
>
>  static const struct dpu_sspp_cfg sdm845_sspp[] = {
> -       SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SDM845_MASK,
> -               sdm845_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -       SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SDM845_MASK,
> -               sdm845_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> -       SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SDM845_MASK,
> -               sdm845_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> -       SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SDM845_MASK,
> -               sdm845_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> -       SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
> -               sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -       SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
> -               sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -       SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
> -               sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> -       SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK,
> -               sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
> +       SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SDM845_MASK, sdm845_vig_sblk_0,
> +               0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +       SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SDM845_MASK, sdm845_vig_sblk_1,
> +               4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> +       SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SDM845_MASK, sdm845_vig_sblk_2,
> +               8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> +       SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SDM845_MASK, sdm845_vig_sblk_3,
> +               12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> +       SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK, sdm845_dma_sblk_0,
> +               1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> +       SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK, sdm845_dma_sblk_1,
> +               5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> +       SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK, sdm845_dma_sblk_2,
> +               9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> +       SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK, sdm845_dma_sblk_3,
> +               13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
>  };
>
>  static const struct dpu_sspp_sub_blks sc7180_vig_sblk_0 =
>                                 _VIG_SBLK("0", 4, DPU_SSPP_SCALER_QSEED4);
>
> +static const struct dpu_sspp_sub_blks sc7280_vig_sblk_0 =
> +                       _VIG_SBLK_ROT("0", 4, DPU_SSPP_SCALER_QSEED4, &dpu_rot_sc7280_cfg_v2);
> +
>  static const struct dpu_sspp_cfg sc7180_sspp[] = {
> -       SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
> -               sc7180_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -       SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
> -               sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -       SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK,
> -               sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> -       SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
> -               sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
> +       SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK, sc7180_vig_sblk_0,
> +               0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +       SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK, sdm845_dma_sblk_0,
> +               1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> +       SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK, sdm845_dma_sblk_1,
> +               5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> +       SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK, sdm845_dma_sblk_2,
> +               9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
>  };
>
>  static const struct dpu_sspp_sub_blks sm8250_vig_sblk_0 =
> @@ -772,33 +809,33 @@ static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
>                                 _VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3LITE);
>
>  static const struct dpu_sspp_cfg sm8250_sspp[] = {
> -       SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SM8250_MASK,
> -               sm8250_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -       SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SM8250_MASK,
> -               sm8250_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> -       SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SM8250_MASK,
> -               sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> -       SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SM8250_MASK,
> -               sm8250_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> -       SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
> -               sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -       SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
> -               sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -       SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
> -               sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> -       SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK,
> -               sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
> +       SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SM8250_MASK, sm8250_vig_sblk_0,
> +               0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +       SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SM8250_MASK, sm8250_vig_sblk_1,
> +               4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> +       SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SM8250_MASK, sm8250_vig_sblk_2,
> +               8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> +       SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SM8250_MASK, sm8250_vig_sblk_3,
> +               12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> +       SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK, sdm845_dma_sblk_0,
> +               1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> +       SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK, sdm845_dma_sblk_1,
> +               5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> +       SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK, sdm845_dma_sblk_2,
> +               9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> +       SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK, sdm845_dma_sblk_3,
> +               13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
>  };
>
>  static const struct dpu_sspp_cfg sc7280_sspp[] = {
> -       SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
> -               sc7180_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -       SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
> -               sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -       SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK,
> -               sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> -       SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
> -               sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
> +       SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7280_MASK, sc7280_vig_sblk_0,
> +               0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +       SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK, sdm845_dma_sblk_0,
> +               1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> +       SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK, sdm845_dma_sblk_1,
> +               5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> +       SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK, sdm845_dma_sblk_2,
> +               9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
>  };
>
>
> @@ -820,9 +857,9 @@ static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK("8", 1);
>
>  static const struct dpu_sspp_cfg qcm2290_sspp[] = {
>         SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_QCM2290_MASK,
> -                qcm2290_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +               qcm2290_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>         SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
> -                qcm2290_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> +               qcm2290_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>  };
>
>  /*************************************************************
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index b85b24b..35dd5c4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -112,6 +112,7 @@ enum {
>   * @DPU_SSPP_TS_PREFILL      Supports prefill with traffic shaper
>   * @DPU_SSPP_TS_PREFILL_REC1 Supports prefill with traffic shaper multirec
>   * @DPU_SSPP_CDP             Supports client driven prefetch
> + * @DPU_SSPP_INLINE_ROTATION Support inline rotation
>   * @DPU_SSPP_MAX             maximum value
>   */
>  enum {
> @@ -132,6 +133,7 @@ enum {
>         DPU_SSPP_TS_PREFILL,
>         DPU_SSPP_TS_PREFILL_REC1,
>         DPU_SSPP_CDP,
> +       DPU_SSPP_INLINE_ROTATION,
>         DPU_SSPP_MAX
>  };
>
> @@ -315,6 +317,18 @@ struct dpu_qos_lut_tbl {
>  };
>
>  /**
> + * struct dpu_rotation_cfg - define inline rotation config
> + * @rot_maxheight: max pre rotated height allowed for rotation
> + * @rot_num_formats: number of elements in @rot_format_list
> + * @rot_format_list: list of supported rotator formats
> + */
> +struct dpu_rotation_cfg {
> +       u32 rot_maxheight;
> +       size_t rot_num_formats;
> +       const u32 *rot_format_list;
> +};
> +
> +/**
>   * struct dpu_caps - define DPU capabilities
>   * @max_mixer_width    max layer mixer line width support.
>   * @max_mixer_blendstages max layer mixer blend stages or
> @@ -369,6 +383,7 @@ struct dpu_caps {
>   * @num_formats: Number of supported formats
>   * @virt_format_list: Pointer to list of supported formats for virtual planes
>   * @virt_num_formats: Number of supported formats for virtual planes
> + * @dpu_rotation_cfg: inline rotation configuration
>   */
>  struct dpu_sspp_sub_blks {
>         u32 creq_vblank;
> @@ -390,6 +405,7 @@ struct dpu_sspp_sub_blks {
>         u32 num_formats;
>         const u32 *virt_format_list;
>         u32 virt_num_formats;
> +       const struct dpu_rotation_cfg *rotation_cfg;
>  };
>
>  /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 3216cda..c77c3d9d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -528,11 +528,19 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
>                 struct dpu_plane_state *pstate,
>                 uint32_t src_w, uint32_t src_h, uint32_t dst_w, uint32_t dst_h,
>                 struct dpu_hw_scaler3_cfg *scale_cfg,
> -               struct dpu_hw_pixel_ext *pixel_ext,
>                 const struct dpu_format *fmt,
>                 uint32_t chroma_subsmpl_h, uint32_t chroma_subsmpl_v)
>  {
>         uint32_t i;
> +       bool inline_rotation = pstate->rotation & DRM_MODE_ROTATE_90;
> +
> +       /*
> +        * For inline rotation cases, scaler config is post-rotation,
> +        * so swap the dimensions here. However, pixel extension will
> +        * need pre-rotation settings.
> +        */
> +       if (inline_rotation)
> +               swap(src_w, src_h);
>
>         scale_cfg->phase_step_x[DPU_SSPP_COMP_0] =
>                 mult_frac((1 << PHASE_STEP_SHIFT), src_w, dst_w);
> @@ -571,11 +579,6 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
>                         scale_cfg->preload_x[i] = DPU_QSEED3_DEFAULT_PRELOAD_H;
>                         scale_cfg->preload_y[i] = DPU_QSEED3_DEFAULT_PRELOAD_V;
>                 }
> -
> -               pixel_ext->num_ext_pxls_top[i] =
> -                       scale_cfg->src_height[i];
> -               pixel_ext->num_ext_pxls_left[i] =
> -                       scale_cfg->src_width[i];
>         }
>         if (!(DPU_FORMAT_IS_YUV(fmt)) && (src_h == dst_h)
>                 && (src_w == dst_w))
> @@ -591,6 +594,24 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
>         scale_cfg->enable = 1;
>  }
>
> +static void _dpu_plane_setup_pixel_ext(struct dpu_hw_scaler3_cfg *scale_cfg,
> +                               struct dpu_hw_pixel_ext *pixel_ext,
> +                               uint32_t src_w, uint32_t src_h,
> +                               uint32_t chroma_subsmpl_h, uint32_t chroma_subsmpl_v)
> +{
> +       int i;
> +
> +       for (i = 0; i < DPU_MAX_PLANES; i++) {
> +               if (i == DPU_SSPP_COMP_1_2 || i == DPU_SSPP_COMP_2) {
> +                       src_w /= chroma_subsmpl_h;
> +                       src_h /= chroma_subsmpl_v;
> +               }
> +
> +               pixel_ext->num_ext_pxls_top[i] = src_h;
> +               pixel_ext->num_ext_pxls_left[i] = src_w;
> +       }
> +}
> +
>  static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
>         {
>                 /* S15.16 format */
> @@ -654,6 +675,10 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
>         const struct drm_format_info *info = drm_format_info(fmt->base.pixel_format);
>         struct dpu_hw_scaler3_cfg scaler3_cfg;
>         struct dpu_hw_pixel_ext pixel_ext;
> +       u32 src_width = drm_rect_width(&pipe_cfg->src_rect);
> +       u32 src_height = drm_rect_height(&pipe_cfg->src_rect);
> +       u32 dst_width = drm_rect_width(&pipe_cfg->dst_rect);
> +       u32 dst_height = drm_rect_height(&pipe_cfg->dst_rect);
>
>         memset(&scaler3_cfg, 0, sizeof(scaler3_cfg));
>         memset(&pixel_ext, 0, sizeof(pixel_ext));
> @@ -661,13 +686,17 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
>         /* don't chroma subsample if decimating */
>         /* update scaler. calculate default config for QSEED3 */
>         _dpu_plane_setup_scaler3(pdpu, pstate,
> -                       drm_rect_width(&pipe_cfg->src_rect),
> -                       drm_rect_height(&pipe_cfg->src_rect),
> -                       drm_rect_width(&pipe_cfg->dst_rect),
> -                       drm_rect_height(&pipe_cfg->dst_rect),
> -                       &scaler3_cfg, &pixel_ext, fmt,
> +                       src_width,
> +                       src_height,
> +                       dst_width,
> +                       dst_height,
> +                       &scaler3_cfg, fmt,
>                         info->hsub, info->vsub);
>
> +       /* configure pixel extension based on scalar config */
> +       _dpu_plane_setup_pixel_ext(&scaler3_cfg, &pixel_ext,
> +                       src_width, src_height, info->hsub, info->vsub);
> +
>         if (pdpu->pipe_hw->ops.setup_pe)
>                 pdpu->pipe_hw->ops.setup_pe(pdpu->pipe_hw,
>                                 &pixel_ext);
> @@ -956,6 +985,34 @@ static bool dpu_plane_validate_src(struct drm_rect *src,
>                 drm_rect_equals(fb_rect, src);
>  }
>
> +static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
> +                                               const struct dpu_sspp_sub_blks *sblk,
> +                                               struct drm_rect src, const struct dpu_format *fmt)
> +{
> +       size_t num_formats;
> +       const u32 *supported_formats;
> +
> +       if (!sblk->rotation_cfg) {
> +               DPU_ERROR("invalid rotation cfg\n");
> +               return -EINVAL;
> +       }
> +
> +       if (drm_rect_width(&src) > sblk->rotation_cfg->rot_maxheight) {
> +               DPU_DEBUG_PLANE(pdpu, "invalid height for inline rot:%d max:%d\n",
> +                               src.y2, sblk->rotation_cfg->rot_maxheight);
> +               return -EINVAL;
> +       }
> +
> +       supported_formats = sblk->rotation_cfg->rot_format_list;
> +       num_formats = sblk->rotation_cfg->rot_num_formats;
> +
> +       if (!DPU_FORMAT_IS_UBWC(fmt) ||
> +               !dpu_find_format(fmt->base.pixel_format, supported_formats, num_formats))
> +               return -EINVAL;
> +
> +       return 0;
> +}
> +
>  static int dpu_plane_atomic_check(struct drm_plane *plane,
>                                   struct drm_atomic_state *state)
>  {
> @@ -968,15 +1025,19 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>         const struct dpu_format *fmt;
>         struct drm_rect src, dst, fb_rect = { 0 };
>         uint32_t min_src_size, max_linewidth;
> +       unsigned int rotation;
> +       uint32_t supported_rotations;
> +       const struct dpu_sspp_cfg *pipe_hw_caps = pdpu->pipe_hw->cap;
> +       const struct dpu_sspp_sub_blks *sblk = pdpu->pipe_hw->cap->sblk;
>
>         if (new_plane_state->crtc)
>                 crtc_state = drm_atomic_get_new_crtc_state(state,
>                                                            new_plane_state->crtc);
>
> -       min_scale = FRAC_16_16(1, pdpu->pipe_hw->cap->sblk->maxupscale);
> +       min_scale = FRAC_16_16(1, sblk->maxupscale);
>         ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
>                                                   min_scale,
> -                                                 pdpu->pipe_hw->cap->sblk->maxdwnscale << 16,
> +                                                 sblk->maxdwnscale << 16,
>                                                   true, true);
>         if (ret) {
>                 DPU_DEBUG_PLANE(pdpu, "Check plane state failed (%d)\n", ret);
> @@ -1002,8 +1063,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>         min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
>
>         if (DPU_FORMAT_IS_YUV(fmt) &&
> -               (!(pdpu->pipe_hw->cap->features & DPU_SSPP_SCALER) ||
> -                !(pdpu->pipe_hw->cap->features & DPU_SSPP_CSC_ANY))) {
> +               (!(pipe_hw_caps->features & DPU_SSPP_SCALER) ||
> +                !(pipe_hw_caps->features & DPU_SSPP_CSC_ANY))) {
>                 DPU_DEBUG_PLANE(pdpu,
>                                 "plane doesn't have scaler/csc for yuv\n");
>                 return -EINVAL;
> @@ -1036,6 +1097,22 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>                 return -E2BIG;
>         }
>
> +       supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
> +
> +       if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
> +               supported_rotations |= DRM_MODE_ROTATE_90;
> +
> +       rotation = drm_rotation_simplify(new_plane_state->rotation,
> +                                       supported_rotations);
> +
> +       if ((pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION)) &&
> +               (rotation & DRM_MODE_ROTATE_90)) {
> +               ret = dpu_plane_check_inline_rotation(pdpu, sblk, src, fmt);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       pstate->rotation = rotation;
>         pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
>
>         return 0;
> @@ -1151,21 +1228,19 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>                                 pstate->multirect_mode);
>
>         if (pdpu->pipe_hw->ops.setup_format) {
> -               unsigned int rotation;
> +               unsigned int rotation = pstate->rotation;
>
>                 src_flags = 0x0;
>
> -               rotation = drm_rotation_simplify(state->rotation,
> -                                                DRM_MODE_ROTATE_0 |
> -                                                DRM_MODE_REFLECT_X |
> -                                                DRM_MODE_REFLECT_Y);
> -
>                 if (rotation & DRM_MODE_REFLECT_X)
>                         src_flags |= DPU_SSPP_FLIP_LR;
>
>                 if (rotation & DRM_MODE_REFLECT_Y)
>                         src_flags |= DPU_SSPP_FLIP_UD;
>
> +               if (rotation & DRM_MODE_ROTATE_90)
> +                       src_flags |= DPU_SSPP_ROT_90;
> +
>                 /* update format */
>                 pdpu->pipe_hw->ops.setup_format(pdpu->pipe_hw, fmt, src_flags,
>                                 pstate->multirect_index);
> @@ -1458,6 +1533,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>         struct dpu_kms *kms = to_dpu_kms(priv->kms);
>         int zpos_max = DPU_ZPOS_MAX;
>         uint32_t num_formats;
> +       uint32_t supported_rotations;
>         int ret = -EINVAL;
>
>         /* create and zero local structure */
> @@ -1526,12 +1602,13 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>                         BIT(DRM_MODE_BLEND_PREMULTI) |
>                         BIT(DRM_MODE_BLEND_COVERAGE));
>
> +       supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
> +
> +       if (pdpu->pipe_hw->cap->features & BIT(DPU_SSPP_INLINE_ROTATION))
> +               supported_rotations |= DRM_MODE_ROTATE_MASK;
> +
>         drm_plane_create_rotation_property(plane,
> -                       DRM_MODE_ROTATE_0,
> -                       DRM_MODE_ROTATE_0 |
> -                       DRM_MODE_ROTATE_180 |
> -                       DRM_MODE_REFLECT_X |
> -                       DRM_MODE_REFLECT_Y);
> +                   DRM_MODE_ROTATE_0, supported_rotations);
>
>         drm_plane_enable_fb_damage_clips(plane);
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> index 50781e2..e146310 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> @@ -26,6 +26,7 @@
>   * @plane_fetch_bw: calculated BW per plane
>   * @plane_clk: calculated clk per plane
>   * @needs_dirtyfb: whether attached CRTC needs pixel data explicitly flushed
> + * @rotation: simplified drm rotation hint
>   */
>  struct dpu_plane_state {
>         struct drm_plane_state base;
> @@ -40,6 +41,7 @@ struct dpu_plane_state {
>         u64 plane_clk;
>
>         bool needs_dirtyfb;
> +       unsigned int rotation;
>  };
>
>  /**
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
