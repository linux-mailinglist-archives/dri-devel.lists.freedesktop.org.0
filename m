Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7F97173EE
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 04:54:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2063E10E460;
	Wed, 31 May 2023 02:53:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B479810E460
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 02:53:53 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-56896c77434so21786837b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 19:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685501632; x=1688093632;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ViIfA1VTYU+Yivg6ZJf5R1ts4ZLw0POYEP4bI9c+UkE=;
 b=zTd/4K06RJiKkwb/mq+FXTJA3prplNzKfgdknPOO1NEXBZuEsdTvUvDtzbf4+LdOZ3
 F6tMVkCXMxKv+x2Q0u3a+7OQIsWuTiDxty86U5wKLr5tC0I+AN9IhVEXIarJ1p6tktTq
 zK9KDbWBHNU4Q7t3dN9TTasVVMnPLLtIz/LjsTbn3lyGCKQV7tTZF1BjoeS0fhi/Yq2G
 qKZyPLQgaGUpUJ1BqecnebEOHK8GGEUJUptJmE+jQJYcydHaweGX6CxB4ApCBrAEoYuj
 hTKicrmB2q7jzH/mXiMR+meq86B0+XZm66UW25tthhTZZVIXqeihDnJYQQmE9GD0lZOT
 xj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685501632; x=1688093632;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ViIfA1VTYU+Yivg6ZJf5R1ts4ZLw0POYEP4bI9c+UkE=;
 b=Ry7fjKc3Webi1xC55/4VXr1spAWObb7OUiyDVPoZwe9dhldphorQ00Eweq1boG+U0I
 kKp1MAOkBLR83Hw/UGCWtB/nRCpZPeMwTGoZF0cHy4vaogwPfwdWMX4IF/7F0aUH3xxu
 fx9GoFlRdQQL8ZSb+vPjJhp9z4Oh6Ov4ueX3Rewnc1bcGtO+/t6NatRmuiusYv8zcRvf
 AXji71+LsefQfqCJQVKJvpW+TDjJJa5pVp/l/0aChbmNVy5WyIEmtHV4AtsWWJ96zWgG
 UCefk75sL93WNGK1vA8qjmqzzcIhpi6FlcFvCV/95kGPm+RwN43QDDE93gM8ebuEJjmq
 Dj7g==
X-Gm-Message-State: AC+VfDwaisT1cXQYlzjJCd7NxDKA7Q3J6Jqxs8huQVYj0ovbh3ihnzmv
 r99Y6ZXAcc2RfIApm9Z51TWOtHcTXJhAaBsVWqCVTA==
X-Google-Smtp-Source: ACHHUZ728biKo2DvqcBWyirrVo1tJbcLxBxYyxJIDbjfmZY1pX1eelSsAlNo2jih4g90gVRlugntll0kCVm1hUBDDec=
X-Received: by 2002:a81:c310:0:b0:568:4918:a9b7 with SMTP id
 r16-20020a81c310000000b005684918a9b7mr4698875ywk.23.1685501631004; Tue, 30
 May 2023 19:53:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230531005358.18090-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20230531005358.18090-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 31 May 2023 05:53:40 +0300
Message-ID: <CAA8EJpryw0h8TgpJ+SFJ7s0=LCjkQ6oqAjCKsm60dk_Q5e+wWA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: re-introduce dpu core revision to the catalog
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
 quic_khsieh@quicinc.com, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 31 May 2023 at 03:54, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> With [1] dpu core revision was dropped in favor of using the
> compatible string from the device tree to select the dpu catalog
> being used in the device.
>
> This approach works well however also necessitates adding catalog
> entries for small register level details as dpu capabilities and/or
> features bloating the catalog unnecessarily. Examples include but
> are not limited to data_compress, interrupt register set, widebus etc.
>
> Introduce the dpu core revision back as an entry to the catalog so that
> we can just use dpu revision checks and enable those bits which
> should be enabled unconditionally and not controlled by a catalog
> and also simplify the changes to do something like:
>
> if (dpu_core_revision > xxxxx && dpu_core_revision < xxxxx)
>         enable the bit;
>
> Also, add some of the useful macros back to be able to use dpu core
> revision effectively.
>
> [1]: https://patchwork.freedesktop.org/patch/530891/?series=113910&rev=4
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  1 +
>  .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  1 +
>  .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  1 +
>  .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  1 +
>  .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  1 +
>  .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  1 +
>  .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  1 +
>  .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  1 +
>  .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  1 +
>  .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  1 +
>  .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  1 +
>  .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  1 +
>  .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  1 +
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 31 ++++++++++++++++++-
>  14 files changed, 43 insertions(+), 1 deletion(-)
>

[skipped catalog changes]

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 677048cc3b7d..cc4aa75a1219 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -19,6 +19,33 @@
>   */
>  #define MAX_BLOCKS    12
>
> +#define DPU_HW_VER(MAJOR, MINOR, STEP)\
> +                 ((((unsigned int)MAJOR & 0xF) << 28) |\
> +                 ((MINOR & 0xFFF) << 16) |\
> +                 (STEP & 0xFFFF))
> +
> +#define DPU_HW_MAJOR(rev)((rev) >> 28)
> +#define DPU_HW_MINOR(rev)(((rev) >> 16) & 0xFFF)
> +#define DPU_HW_STEP(rev)((rev) & 0xFFFF)
> +#define DPU_HW_MAJOR_MINOR(rev)((rev) >> 16)
> +
> +#define IS_DPU_MAJOR_MINOR_SAME(rev1, rev2)   \
> +(DPU_HW_MAJOR_MINOR((rev1)) == DPU_HW_MAJOR_MINOR((rev2)))
> +
> +#define DPU_HW_VER_300 DPU_HW_VER(3, 0, 0) /* 8998 v1.0 */
> +#define DPU_HW_VER_400 DPU_HW_VER(4, 0, 0) /* sdm845 v1.0 */
> +#define DPU_HW_VER_500 DPU_HW_VER(5, 0, 0) /* sm8150 v1.0 */
> +#define DPU_HW_VER_510 DPU_HW_VER(5, 1, 1) /* sc8180 */
> +#define DPU_HW_VER_600 DPU_HW_VER(6, 0, 0) /* sm8250 */
> +#define DPU_HW_VER_620 DPU_HW_VER(6, 2, 0) /* sc7180 v1.0 */
> +#define DPU_HW_VER_630 DPU_HW_VER(6, 3, 0) /* sm6115|sm4250 */
> +#define DPU_HW_VER_650 DPU_HW_VER(6, 5, 0) /* qcm2290|sm4125 */
> +#define DPU_HW_VER_700 DPU_HW_VER(7, 0, 0) /* sm8350 */
> +#define DPU_HW_VER_720 DPU_HW_VER(7, 2, 0) /* sc7280 */
> +#define DPU_HW_VER_800 DPU_HW_VER(8, 0, 0) /* sc8280xp */
> +#define DPU_HW_VER_810 DPU_HW_VER(8, 1, 0) /* sm8450 */
> +#define DPU_HW_VER_900 DPU_HW_VER(9, 0, 0) /* sm8550 */

Instead of having defines for all SoCs (which can quickly become
unmanageable) and can cause merge conflicts, I'd suggest inlining all
the defines into respective catalog files.

Also, I'm not sure that the "step" should be a part of the catalog. I
know that this follows the hardware revision. However, please correct
me if I'm wrong, different step levels are used for revisions of the
same SoC. The original code that was reading the hw revision from the
hardware register, listed both 5.0.0 and 5.0.1 for sm8150.

> +
>  #define DPU_HW_BLK_NAME_LEN    16
>
>  #define MAX_IMG_WIDTH 0x3fff
> @@ -769,7 +796,7 @@ struct dpu_perf_cfg {
>  /**
>   * struct dpu_mdss_cfg - information of MDSS HW
>   * This is the main catalog data structure representing
> - * this HW version. Contains number of instances,
> + * this HW version. Contains dpu core revision, number of instances,
>   * register offsets, capabilities of the all MDSS HW sub-blocks.
>   *
>   * @dma_formats        Supported formats for dma pipe
> @@ -778,6 +805,8 @@ struct dpu_perf_cfg {
>   * @mdss_irqs:         Bitmap with the irqs supported by the target
>   */
>  struct dpu_mdss_cfg {
> +       u32 core_rev;
> +
>         const struct dpu_caps *caps;
>
>         const struct dpu_ubwc_cfg *ubwc;
> --
> 2.40.1
>


-- 
With best wishes
Dmitry
