Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3894A4D8C87
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 20:35:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B7D10E2BD;
	Mon, 14 Mar 2022 19:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB8C10E26F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 19:35:23 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id r1so220464qvr.12
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 12:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vDbKdm+9Gq8y2h4+5UWlBvnbRk5t+H+cJMEqLrAE1aY=;
 b=M1vgtUseKCOfeEJG05cmNBWXnjNVH7c5wsr0c3GuqMoqkhntIfmIeDUnFAmIJGjdKj
 hW2J4uUmPMTN9hsL/IhL1Pj5E4JSohNZBHkiudfw4t0i/VP+yE0Qi2VZY8fsfJ8WpQiF
 /2a7V9UKf7SD4j2zrCh9BhqopihI3iqXCCP/0uvSz7lYgSjyy889qrEhw2A/hZy9OE7K
 azY0EEWmTmuoLdHyTORZEZPQUcf9Uy9E73VqOPw+YXC82MFhwmllhvAvYbN1KpmXqwKK
 Q/tES0GJmp5A8OUPBCy0C948rXQA0+QvrfXh6FGOFIZmSCXkhUj2wifPe4gNciyUJkri
 ho9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vDbKdm+9Gq8y2h4+5UWlBvnbRk5t+H+cJMEqLrAE1aY=;
 b=x6YqbMsSRA7ZUB6XjODs0NHDrBwxwA1gL11nNt833hmgKPiqobi7zaG4hPJZCediyi
 igzS4yCvB4FFBlQxHOmV85Y2OHu4mrRS/as1e9/pSb70w7z4e3AbbWdM+BtKst8qvJNO
 CFnGLgtrx6gB5yLnjBzDAAHVOJeQTehFAmiTFucbdC5QcAPClfMmuOrwLDjfolOeg7/8
 a+UKI5GvEvhRRrl/ylMWnlIS5zszOTlqwLBjDI96aasXP6xU0yXi3tuU3Si5W+BZGuLu
 uBbXgHZJM4GG6w2O1l9dPk3fHXpqAnVoZzsJPnz4tU23OybM4vrgeqEuDn1/FumKFjW+
 mTKA==
X-Gm-Message-State: AOAM530O+gb/LWuCXg9MgNfkQ+JPUzdKOsxrjMk1dDlfwqBDA1ypaPac
 U2OxF3lfM5aFz/BwBjQv/DSXFumaOq1XOk8OuTb+qg==
X-Google-Smtp-Source: ABdhPJw3Rfe6z8JS+vyIxM3JATkJerBr0Wz/f7FMG/8CWnypCnemwcZhSelMdHNHiBHMdIOyydD0euweqqhS56K0i8U=
X-Received: by 2002:a05:6214:c24:b0:440:a01f:c77b with SMTP id
 a4-20020a0562140c2400b00440a01fc77bmr7974544qvd.55.1647286522297; Mon, 14 Mar
 2022 12:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <1647278803-24611-1-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1647278803-24611-1-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 14 Mar 2022 22:35:11 +0300
Message-ID: <CAA8EJppA2K_8wMXOcvLS2sAcO72KnSBQS8hph4oc_9EN6pwyxA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/disp/dpu1: add inline rotation support for
 sc7280 target
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

On Mon, 14 Mar 2022 at 20:27, Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
>
> - Some DPU versions support inline rot90. It is supported only for
> limited amount of UBWC formats.
> - There are two versions of inline rotators, v1 (present on sm8250 and
> sm7250) and v2 (sc7280). These versions differ in the list of supported
> formats and in the scaler possibilities.
>
> Changes in RFC:
> - Rebase changes to the latest code base.
> - Append rotation config variables with v2 and
> remove unused variables.(Dmitry)
> - Move pixel_ext setup separately from scaler3 config.(Dmitry)
> - Add 270 degree rotation to supported rotation list.(Dmitry)
>
> Changes in V2:
> - Remove unused macros and fix indentation.
> - Add check if 90 rotation is supported and
> add supported rotations to rot_cfg.
>
> Changes in V3:
> - Fix indentation.
> - Move rot_supported to sspp capabilities. (Dmitry)
> - Config pixel_ext based on src_h/src_w directly. (Dmitry)
> - Misc changes.
>
> Co-developed-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  arch/arm64/configs/defconfig                   |   4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 218 +++++++++++++++----------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  18 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 119 +++++++++++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h      |   2 +
>  5 files changed, 253 insertions(+), 108 deletions(-)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 040420b..3bd91f7 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig

Unrelated. Please drop.

> @@ -696,7 +696,7 @@ CONFIG_VIDEO_RCAR_DRIF=m
>  CONFIG_VIDEO_IMX219=m
>  CONFIG_VIDEO_OV5640=m
>  CONFIG_VIDEO_OV5645=m
> -CONFIG_DRM=m
> +CONFIG_DRM=y
>  CONFIG_DRM_I2C_NXP_TDA998X=m
>  CONFIG_DRM_MALI_DISPLAY=m
>  CONFIG_DRM_NOUVEAU=m
> @@ -721,7 +721,7 @@ CONFIG_DRM_SUN4I=m
>  CONFIG_DRM_SUN6I_DSI=m
>  CONFIG_DRM_SUN8I_DW_HDMI=m
>  CONFIG_DRM_SUN8I_MIXER=m
> -CONFIG_DRM_MSM=m
> +CONFIG_DRM_MSM=y
>  CONFIG_DRM_TEGRA=m
>  CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=m
>  CONFIG_DRM_PANEL_LVDS=m
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index a4fe77c..f591e63 100644
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
> @@ -642,8 +650,7 @@ static const struct dpu_ctl_cfg qcm2290_ctl[] = {
>   *************************************************************/
>
>  /* SSPP common configuration */
> -
> -#define _VIG_SBLK(num, sdma_pri, qseed_ver) \
> +#define _VIG_SBLK(num, sdma_pri, qseed_ver, rot_cfg) \
>         { \
>         .maxdwnscale = MAX_DOWNSCALE_RATIO, \
>         .maxupscale = MAX_UPSCALE_RATIO, \
> @@ -660,6 +667,7 @@ static const struct dpu_ctl_cfg qcm2290_ctl[] = {
>         .num_formats = ARRAY_SIZE(plane_formats_yuv), \
>         .virt_format_list = plane_formats, \
>         .virt_num_formats = ARRAY_SIZE(plane_formats), \
> +       .rotation_cfg = rot_cfg, \
>         }
>
>  #define _DMA_SBLK(num, sdma_pri) \
> @@ -676,22 +684,28 @@ static const struct dpu_ctl_cfg qcm2290_ctl[] = {
>         }
>
>  static const struct dpu_sspp_sub_blks msm8998_vig_sblk_0 =
> -                               _VIG_SBLK("0", 0, DPU_SSPP_SCALER_QSEED3);
> +                               _VIG_SBLK("0", 0, DPU_SSPP_SCALER_QSEED3, NULL);
>  static const struct dpu_sspp_sub_blks msm8998_vig_sblk_1 =
> -                               _VIG_SBLK("1", 0, DPU_SSPP_SCALER_QSEED3);
> +                               _VIG_SBLK("1", 0, DPU_SSPP_SCALER_QSEED3, NULL);
>  static const struct dpu_sspp_sub_blks msm8998_vig_sblk_2 =
> -                               _VIG_SBLK("2", 0, DPU_SSPP_SCALER_QSEED3);
> +                               _VIG_SBLK("2", 0, DPU_SSPP_SCALER_QSEED3, NULL);
>  static const struct dpu_sspp_sub_blks msm8998_vig_sblk_3 =
> -                               _VIG_SBLK("3", 0, DPU_SSPP_SCALER_QSEED3);
> +                               _VIG_SBLK("3", 0, DPU_SSPP_SCALER_QSEED3, NULL);
> +
> +static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
> +       .rot_maxheight = 1088,
> +       .rot_num_formats = ARRAY_SIZE(rotation_v2_formats),
> +       .rot_format_list = rotation_v2_formats,
> +};
>
>  static const struct dpu_sspp_sub_blks sdm845_vig_sblk_0 =
> -                               _VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3);
> +                               _VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3, NULL);
>  static const struct dpu_sspp_sub_blks sdm845_vig_sblk_1 =
> -                               _VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED3);
> +                               _VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED3, NULL);
>  static const struct dpu_sspp_sub_blks sdm845_vig_sblk_2 =
> -                               _VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED3);
> +                               _VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED3, NULL);
>  static const struct dpu_sspp_sub_blks sdm845_vig_sblk_3 =
> -                               _VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3);
> +                               _VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3, NULL);
>
>  static const struct dpu_sspp_sub_blks sdm845_dma_sblk_0 = _DMA_SBLK("8", 1);
>  static const struct dpu_sspp_sub_blks sdm845_dma_sblk_1 = _DMA_SBLK("9", 2);
> @@ -699,7 +713,7 @@ static const struct dpu_sspp_sub_blks sdm845_dma_sblk_2 = _DMA_SBLK("10", 3);
>  static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK("11", 4);
>
>  #define SSPP_BLK(_name, _id, _base, _features, \
> -               _sblk, _xinid, _type, _clkctrl) \
> +               _sblk, _xinid, _type, _clkctrl, _rotsupported) \
>         { \
>         .name = _name, .id = _id, \
>         .base = _base, .len = 0x1c8, \
> @@ -707,98 +721,134 @@ static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK("11", 4);
>         .sblk = &_sblk, \
>         .xin_id = _xinid, \
>         .type = _type, \
> -       .clk_ctrl = _clkctrl \
> +       .clk_ctrl = _clkctrl, \
> +       .rot_supported = _rotsupported \

I'd suggest changing to:
 .rot_supported = _rotsupported ?
    DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_180 |
DRM_MODE_REFLECT_MASK :
    DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK;

Then you can pass boolean to SSPP_BLK rather than a repeating set of
DRM_MODE_ROTATE constants.

Or you can add & use two defines: one for the SSPPs supporting
rotation, another one for SSPPs not supporting inline rotation.

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
> +       SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SDM845_MASK, sdm845_vig_sblk_0,
> +               0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
> +       SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SDM845_MASK, sdm845_vig_sblk_1,
> +               4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
> +       SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SDM845_MASK, sdm845_vig_sblk_2,
> +               8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
> +       SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SDM845_MASK, sdm845_vig_sblk_3,
> +               12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
> +       SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK, sdm845_dma_sblk_0,
> +               1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
> +       SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK, sdm845_dma_sblk_1,
> +               5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
> +       SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK, sdm845_dma_sblk_2,
> +               9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
> +       SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK, sdm845_dma_sblk_3,
> +               13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
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
> +               0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
> +       SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SDM845_MASK, sdm845_vig_sblk_1,
> +               4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
> +       SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SDM845_MASK, sdm845_vig_sblk_2,
> +               8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
> +       SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SDM845_MASK, sdm845_vig_sblk_3,
> +               12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
> +       SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK, sdm845_dma_sblk_0,
> +               1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
> +       SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK, sdm845_dma_sblk_1,
> +               5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
> +       SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK, sdm845_dma_sblk_2,
> +               9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
> +       SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK, sdm845_dma_sblk_3,
> +               13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
>  };
>
>  static const struct dpu_sspp_sub_blks sc7180_vig_sblk_0 =
> -                               _VIG_SBLK("0", 4, DPU_SSPP_SCALER_QSEED4);
> +                               _VIG_SBLK("0", 4, DPU_SSPP_SCALER_QSEED4, NULL);
> +
> +static const struct dpu_sspp_sub_blks sc7280_vig_sblk_0 =
> +                               _VIG_SBLK("0", 4, DPU_SSPP_SCALER_QSEED4, &dpu_rot_sc7280_cfg_v2);
>
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
> +               0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
> +       SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK, sdm845_dma_sblk_0,
> +               1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
> +       SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK, sdm845_dma_sblk_1,
> +               5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
> +       SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK, sdm845_dma_sblk_2,
> +               9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
>  };
>
>  static const struct dpu_sspp_sub_blks sm8250_vig_sblk_0 =
> -                               _VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3LITE);
> +                               _VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3LITE, NULL);
>  static const struct dpu_sspp_sub_blks sm8250_vig_sblk_1 =
> -                               _VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED3LITE);
> +                               _VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED3LITE, NULL);
>  static const struct dpu_sspp_sub_blks sm8250_vig_sblk_2 =
> -                               _VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED3LITE);
> +                               _VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED3LITE, NULL);
>  static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
> -                               _VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3LITE);
> +                               _VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3LITE, NULL);
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
> +               0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
> +       SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SM8250_MASK, sm8250_vig_sblk_1,
> +               4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
> +       SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SM8250_MASK, sm8250_vig_sblk_2,
> +               8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
> +       SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SM8250_MASK, sm8250_vig_sblk_3,
> +               12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
> +       SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK, sdm845_dma_sblk_0,
> +               1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
> +       SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK, sdm845_dma_sblk_1,
> +               5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
> +       SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK, sdm845_dma_sblk_2,
> +               9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
> +       SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK, sdm845_dma_sblk_3,
> +               13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
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
> +               0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0, DRM_MODE_ROTATE_MASK |
> +               DRM_MODE_REFLECT_MASK),
> +       SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK, sdm845_dma_sblk_0,
> +               1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
> +       SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK, sdm845_dma_sblk_1,
> +               5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
> +       SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK, sdm845_dma_sblk_2,
> +               9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
>  };
>
>
> @@ -820,9 +870,11 @@ static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK("8", 1);
>
>  static const struct dpu_sspp_cfg qcm2290_sspp[] = {
>         SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_QCM2290_MASK,
> -                qcm2290_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +               qcm2290_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
>         SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
> -                qcm2290_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> +               qcm2290_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0, DRM_MODE_ROTATE_0 |
> +               DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_MASK),
>  };
>
>  /*************************************************************
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index b85b24b..d009d83 100644
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
> @@ -492,6 +508,7 @@ struct dpu_ctl_cfg {
>   * @xin_id:            bus client identifier
>   * @clk_ctrl           clock control identifier
>   * @type               sspp type identifier
> + * @rot_supported      allowed rotations
>   */
>  struct dpu_sspp_cfg {
>         DPU_HW_BLK_INFO;
> @@ -499,6 +516,7 @@ struct dpu_sspp_cfg {
>         u32 xin_id;
>         enum dpu_clk_ctrl_type clk_ctrl;
>         u32 type;
> +       u32 rot_supported;
>  };
>
>  /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 6565682..ab959b2 100644
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
> @@ -665,7 +686,12 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
>                         drm_rect_height(&pipe_cfg->src_rect),
>                         drm_rect_width(&pipe_cfg->dst_rect),
>                         drm_rect_height(&pipe_cfg->dst_rect),
> -                       &scaler3_cfg, &pixel_ext, fmt,
> +                       &scaler3_cfg, fmt,
> +                       info->hsub, info->vsub);
> +
> +       /* configure pixel extension based on scalar config */
> +       _dpu_plane_setup_pixel_ext(&scaler3_cfg, &pixel_ext,
> +                       drm_rect_width(&pipe_cfg->src_rect), drm_rect_height(&pipe_cfg->src_rect),
>                         info->hsub, info->vsub);
>
>         if (pdpu->pipe_hw->ops.setup_pe)
> @@ -956,6 +982,41 @@ static bool dpu_plane_validate_src(struct drm_rect *src,
>                 drm_rect_equals(fb_rect, src);
>  }
>
> +static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
> +                                               const struct dpu_sspp_sub_blks *sblk,
> +                                               struct drm_rect src, const struct dpu_format *fmt)
> +{
> +       bool found = false;
> +       size_t i, num_formats;
> +       const u32 *supported_formats;
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
> +       for (i = 0; i < num_formats; i++) {
> +               /* check for valid formats supported by inline rotation */
> +               if (fmt->base.pixel_format == supported_formats[i] &&
> +                       DPU_FORMAT_IS_UBWC(fmt)) {
> +                       found = true;
> +                       break;
> +               }
> +       }
> +
> +       if (!found || !num_formats) {
> +               DPU_DEBUG_PLANE(pdpu, "supported_format not found num: %zu\n",
> +                               num_formats);
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
>  static int dpu_plane_atomic_check(struct drm_plane *plane,
>                                   struct drm_atomic_state *state)
>  {
> @@ -968,15 +1029,18 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>         const struct dpu_format *fmt;
>         struct drm_rect src, dst, fb_rect = { 0 };
>         uint32_t min_src_size, max_linewidth;
> +       unsigned int rotation = 0;
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
> @@ -1002,8 +1066,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
> @@ -1036,6 +1100,17 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>                 return -E2BIG;
>         }
>
> +       rotation = drm_rotation_simplify(new_plane_state->rotation,
> +                                       pipe_hw_caps->rot_supported);
> +
> +       if ((pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION)) &&
> +               rotation & DRM_MODE_ROTATE_90) {

Please put the (rotation & DRM_MODE_ROTATE_90 into the parentheses.

> +               ret = dpu_plane_check_inline_rotation(pdpu, sblk, src, fmt);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       pstate->rotation = rotation;
>         pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
>
>         return 0;
> @@ -1151,21 +1226,18 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>                                 pstate->multirect_mode);
>
>         if (pdpu->pipe_hw->ops.setup_format) {
> -               unsigned int rotation;
> -
> +               unsigned int rotation = pstate->rotation;

Please restore the empty line.

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
> @@ -1463,6 +1535,8 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>         int zpos_max = DPU_ZPOS_MAX;
>         uint32_t num_formats;
>         int ret = -EINVAL;
> +       unsigned int supported_rotations = DRM_MODE_ROTATE_0 |
> +                       DRM_MODE_ROTATE_180 | DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y;
>
>         /* create and zero local structure */
>         pdpu = kzalloc(sizeof(*pdpu), GFP_KERNEL);
> @@ -1530,12 +1604,11 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>                         BIT(DRM_MODE_BLEND_PREMULTI) |
>                         BIT(DRM_MODE_BLEND_COVERAGE));
>
> +       if (pdpu->pipe_hw->cap->features & BIT(DPU_SSPP_INLINE_ROTATION))
> +               supported_rotations |= DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270;

Can we use pdpu->pipe_hw->cap->rot_supported here instead?

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
