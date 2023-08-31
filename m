Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB9D78E3C3
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 02:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C7410E15F;
	Thu, 31 Aug 2023 00:11:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2A410E15F
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 00:11:17 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-d7e387c33f3so93381276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 17:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693440677; x=1694045477; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gIBwcu9asHhKTNXvUBuLlfNgStaSIK7100qTPTBSgtE=;
 b=rAfc/16LBizEL05sjlCCi57Jp4Q9C8MIk+GrchgjbRxIpXsBzP4ugmvlFkYug/AzAE
 KRNeG6+tREbcmnNAmYV96t85GuTUjRsbMeJZ0zuzhQnkDmRHduYIo4ZNryEgnJNFJ3bC
 JPWXEAT3jWmfszSO4faiXiWDsv9USNu1BMvwVEbtgjYSFrtf/trTu/tdsLHWfQhl5sWS
 4lncaWUnH4joCilxvUYi1ZsTUIwySPG5gkcXWTOMiuGFTkPTsp5CmbjOHVDT4RYL24qn
 G4ACkKfRktL8rtYZx0TTl1LaNmw6BO/UxyF9+1zFCxAbAuscdIbMh/VyBSzL6w3iVOBL
 tJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693440677; x=1694045477;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gIBwcu9asHhKTNXvUBuLlfNgStaSIK7100qTPTBSgtE=;
 b=KiBmpHWaHKzsoDFy6ThMx/Cin3Icc9ZAq3E4de4hYmPVp4Kj6yL3hQ6oyuq5LhOkgK
 QEMs7IQYrTdH1Q4yWMXXgpRbLTjOkoKXen9pWYHddWrqRyqrk175P60vbPZ5YxTD7vC5
 kWiyoFSeaEcpa4B4r4+/+66QOySJlFjekdyeRJm6aXNV/c2reZ7YIhT5JeHcjiwcdMNo
 8l5j0F8XV7RjjsRpMU4C99EW8jO7jkAcfJMuHyG/cVbiyqfts62Jz6774qO22buw1++K
 s9Zu4CwIO1BFi3wDtmVhLUGjWASxW98zTsgDgdBLP6sqXT0Sd1ZI5OwGrUFPuFP6Oxkw
 D69g==
X-Gm-Message-State: AOJu0YxSoXJ+9ZzKAdJ4wj79hKLmBpbEhYyVA+UCC0y5Iz7tvJ6QaMff
 l+Dde4qXalyXtOtKJBb3+CFVzzYxL0xmddU2AkEyqA==
X-Google-Smtp-Source: AGHT+IFOm47/Wg0hyuL558fbKI7vPtAQEGDnPC23HR2eYIJX98zqsB0H68hv3/vj5TnMMY1cTcgA5vjvMLwrDmG5GzY=
X-Received: by 2002:a25:c586:0:b0:d06:f0ab:e17b with SMTP id
 v128-20020a25c586000000b00d06f0abe17bmr3426273ybe.55.1693440676746; Wed, 30
 Aug 2023 17:11:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-12-quic_abhinavk@quicinc.com>
In-Reply-To: <20230830224910.8091-12-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Aug 2023 03:11:05 +0300
Message-ID: <CAA8EJppBskavOzn4_vUa=kvyYi2zn2XR70Ft-6ZyuOdGYWWL2A@mail.gmail.com>
Subject: Re: [PATCH 11/16] drm/msm/dpu: add an API to setup the CDM block for
 writeback
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
 quic_khsieh@quicinc.com, quic_parellan@quicinc.com, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Add an API dpu_encoder_helper_phys_setup_cdm() which can be used by
> the writeback encoder to setup the CDM block.
>
> Currently, this is defined and used within the writeback's physical
> encoder layer however, the function can be modified to be used to setup
> the CDM block even for non-writeback interfaces.
>
> Until those modifications are planned and made, keep it local to
> writeback.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |   3 +
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 123 +++++++++++++++++-
>  2 files changed, 125 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 510c1c41ddbc..93a8ae67beff 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -16,6 +16,7 @@
>  #include "dpu_hw_pingpong.h"
>  #include "dpu_hw_ctl.h"
>  #include "dpu_hw_top.h"
> +#include "dpu_hw_cdm.h"
>  #include "dpu_encoder.h"
>  #include "dpu_crtc.h"
>
> @@ -209,6 +210,7 @@ static inline int dpu_encoder_phys_inc_pending(struct dpu_encoder_phys *phys)
>   * @wbirq_refcount:     Reference count of writeback interrupt
>   * @wb_done_timeout_cnt: number of wb done irq timeout errors
>   * @wb_cfg:  writeback block config to store fb related details
> + * @cdm_cfg: cdm block config needed to store writeback block's CDM configuration
>   * @wb_conn: backpointer to writeback connector
>   * @wb_job: backpointer to current writeback job
>   * @dest:   dpu buffer layout for current writeback output buffer
> @@ -218,6 +220,7 @@ struct dpu_encoder_phys_wb {
>         atomic_t wbirq_refcount;
>         int wb_done_timeout_cnt;
>         struct dpu_hw_wb_cfg wb_cfg;
> +       struct dpu_hw_cdm_cfg cdm_cfg;
>         struct drm_writeback_connector *wb_conn;
>         struct drm_writeback_job *wb_job;
>         struct dpu_hw_fmt_layout dest;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index 4c2736c3ee6d..11935aac9fd5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -24,6 +24,20 @@
>  #define to_dpu_encoder_phys_wb(x) \
>         container_of(x, struct dpu_encoder_phys_wb, base)
>
> +#define TO_S15D16(_x_)((_x_) << 7)
> +
> +static struct dpu_csc_cfg dpu_encoder_phys_wb_rgb2yuv_601l = {
> +       {
> +               TO_S15D16(0x0083), TO_S15D16(0x0102), TO_S15D16(0x0032),
> +               TO_S15D16(0x1fb5), TO_S15D16(0x1f6c), TO_S15D16(0x00e1),
> +               TO_S15D16(0x00e1), TO_S15D16(0x1f45), TO_S15D16(0x1fdc)
> +       },
> +       { 0x00, 0x00, 0x00 },
> +       { 0x0040, 0x0200, 0x0200 },
> +       { 0x000, 0x3ff, 0x000, 0x3ff, 0x000, 0x3ff },
> +       { 0x040, 0x3ac, 0x040, 0x3c0, 0x040, 0x3c0 },
> +};

Nit: we probably need to have a single place with all dpu_csc_cfg entries.

> +
>  /**
>   * dpu_encoder_phys_wb_is_master - report wb always as master encoder
>   * @phys_enc:  Pointer to physical encoder
> @@ -225,6 +239,112 @@ static void dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
>         }
>  }
>
> +/**
> + * dpu_encoder_phys_wb_setup_cdp - setup chroma down sampling block
> + * @phys_enc:Pointer to physical encoder
> + */
> +static void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc)
> +{
> +       struct dpu_hw_cdm *hw_cdm;
> +       struct dpu_hw_cdm_cfg *cdm_cfg;
> +       struct dpu_hw_pingpong *hw_pp;
> +       struct dpu_encoder_phys_wb *wb_enc;
> +       const struct msm_format *format;
> +       const struct dpu_format *dpu_fmt;
> +       struct drm_writeback_job *wb_job;
> +       int ret;
> +
> +       if (!phys_enc)
> +               return;
> +
> +       wb_enc = to_dpu_encoder_phys_wb(phys_enc);
> +       cdm_cfg = &wb_enc->cdm_cfg;
> +       hw_pp = phys_enc->hw_pp;
> +       hw_cdm = phys_enc->hw_cdm;
> +       wb_job = wb_enc->wb_job;
> +
> +       format = msm_framebuffer_format(wb_enc->wb_job->fb);
> +       dpu_fmt = dpu_get_dpu_format_ext(format->pixel_format, wb_job->fb->modifier);
> +
> +       if (!hw_cdm)
> +               return;
> +
> +       if (!DPU_FORMAT_IS_YUV(dpu_fmt)) {
> +               DPU_DEBUG("[enc:%d] cdm_disable fmt:%x\n", DRMID(phys_enc->parent),
> +                         dpu_fmt->base.pixel_format);
> +               if (hw_cdm->ops.disable)
> +                       hw_cdm->ops.disable(hw_cdm);
> +
> +               return;
> +       }
> +
> +       memset(cdm_cfg, 0, sizeof(struct dpu_hw_cdm_cfg));
> +
> +       cdm_cfg->output_width = wb_job->fb->width;
> +       cdm_cfg->output_height = wb_job->fb->height;
> +       cdm_cfg->output_fmt = dpu_fmt;
> +       cdm_cfg->output_type = CDM_CDWN_OUTPUT_WB;
> +       cdm_cfg->output_bit_depth = DPU_FORMAT_IS_DX(dpu_fmt) ?
> +                       CDM_CDWN_OUTPUT_10BIT : CDM_CDWN_OUTPUT_8BIT;
> +
> +       /* enable 10 bit logic */
> +       switch (cdm_cfg->output_fmt->chroma_sample) {
> +       case DPU_CHROMA_RGB:
> +               cdm_cfg->h_cdwn_type = CDM_CDWN_DISABLE;
> +               cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
> +               break;
> +       case DPU_CHROMA_H2V1:
> +               cdm_cfg->h_cdwn_type = CDM_CDWN_COSITE;
> +               cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
> +               break;
> +       case DPU_CHROMA_420:
> +               cdm_cfg->h_cdwn_type = CDM_CDWN_COSITE;
> +               cdm_cfg->v_cdwn_type = CDM_CDWN_OFFSITE;
> +               break;
> +       case DPU_CHROMA_H1V2:
> +       default:
> +               DPU_ERROR("[enc:%d] unsupported chroma sampling type\n",
> +                         DRMID(phys_enc->parent));
> +               cdm_cfg->h_cdwn_type = CDM_CDWN_DISABLE;
> +               cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
> +               break;
> +       }
> +
> +       DPU_DEBUG("[enc:%d] cdm_enable:%d,%d,%X,%d,%d,%d,%d]\n",
> +                 DRMID(phys_enc->parent), cdm_cfg->output_width,
> +                 cdm_cfg->output_height, cdm_cfg->output_fmt->base.pixel_format,
> +                 cdm_cfg->output_type, cdm_cfg->output_bit_depth,
> +                 cdm_cfg->h_cdwn_type, cdm_cfg->v_cdwn_type);
> +
> +       if (hw_cdm && hw_cdm->ops.setup_csc_data) {
> +               ret = hw_cdm->ops.setup_csc_data(hw_cdm, &dpu_encoder_phys_wb_rgb2yuv_601l);
> +               if (ret < 0) {
> +                       DPU_ERROR("[enc:%d] failed to setup CSC; ret:%d\n",
> +                                 DRMID(phys_enc->parent), ret);
> +                       return;
> +               }
> +       }
> +
> +       if (hw_cdm && hw_cdm->ops.setup_cdwn) {

You have checked for (!hw_cdm) several lines above. We can drop this
condition here.

> +               ret = hw_cdm->ops.setup_cdwn(hw_cdm, cdm_cfg);
> +               if (ret < 0) {
> +                       DPU_ERROR("[enc:%d] failed to setup CDWN; ret:%d\n",
> +                                 DRMID(phys_enc->parent), ret);
> +                       return;
> +               }
> +       }
> +
> +       if (hw_cdm && hw_pp && hw_cdm->ops.enable) {

And what if !hw_pp ? Can it happen here? No, if I understand correctly.

> +               cdm_cfg->pp_id = hw_pp->idx;
> +               ret = hw_cdm->ops.enable(hw_cdm, cdm_cfg);

As we are calling these three ops in a row, can we merge them together
into a single callback to be called from dpu_encoder.c?

> +               if (ret < 0) {
> +                       DPU_ERROR("[enc:%d] failed to enable CDM; ret:%d\n",
> +                                 DRMID(phys_enc->parent), ret);
> +                       return;
> +               }
> +       }
> +}
> +
>  /**
>   * dpu_encoder_phys_wb_atomic_check - verify and fixup given atomic states
>   * @phys_enc:  Pointer to physical encoder
> @@ -348,8 +468,9 @@ static void dpu_encoder_phys_wb_setup(
>
>         dpu_encoder_phys_wb_setup_fb(phys_enc, fb);
>
> -       dpu_encoder_phys_wb_setup_ctl(phys_enc);
> +       dpu_encoder_helper_phys_setup_cdm(phys_enc);
>
> +       dpu_encoder_phys_wb_setup_ctl(phys_enc);
>  }
>
>  static void _dpu_encoder_phys_wb_frame_done_helper(void *arg)
> --
> 2.40.1
>


-- 
With best wishes
Dmitry
