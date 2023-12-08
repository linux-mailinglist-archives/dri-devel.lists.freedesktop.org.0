Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A2280AE53
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 21:55:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E11510EB44;
	Fri,  8 Dec 2023 20:55:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D5410EB42
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 20:55:17 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-5d852ac9bb2so24092327b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 12:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702068916; x=1702673716; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TQzHpfrHOWGfN7UNq/R7uW/DvZhDh0am3NZ/OUUi5T0=;
 b=MGv/1l+ElapX8lq2LDlgULyNvrPMQCVm/g4Bbyt1g2XWFA8BzPo9cfECGYvLgmi2OK
 2+JDyUkoNiU9Evnt6Dwo/qQBsCo0SsHSZwYDNRqJT1/lDj1RiZyy/7SxK2aOui7usk5b
 O+zmwrcF86ZGwGViJwXb6MJ8YPkB4qniZxsqB+7cN1JlK12/shfpx3xGLt+FSrhuZPAT
 bKN4OLFe1UUsaKRrtzteFPwsduP7Mlt1kTW612ffJn9Cep6pSpoT3+/mXj4DuLr+Bvch
 WP0gDPZ+GyTa1BJkMOZxBinEhIIkzCTgHGhZUtSYODK1LjVs5StVPk7UD6uSstd7hHe0
 XEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702068916; x=1702673716;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TQzHpfrHOWGfN7UNq/R7uW/DvZhDh0am3NZ/OUUi5T0=;
 b=uHpu1Ydyfe3EHDyd3tHRBKrEt5TXqggdQfdHgbCgykNxcZ5zmLWw6yZoW6ehuPbBJ0
 Qp9TsUPufyMYCbmxwP343mC/7gBmKEFDhVgw/mh720lR5yq8TPfRAwwX8AoLuBhIPEbE
 O+UIjRnnhwsQf0H64DI+UxfTHYLurCL3V1GVEy891+VyugU6JMRN18HuEH0GDBNv7e1c
 Lg1B9zjB4P9ft3mVTUeItT30oPkzkgWye7rPy8uAAVZ2Enji3V7utEBPJmRxwXipz+C6
 1CmwI7WtvsihS9n7HcoB3epGynVyrWsc4gmB5lq7BNPmEEBEL51uz7q2kLebSsY938vd
 Zcsg==
X-Gm-Message-State: AOJu0Yy2vW+cFiscJPd96RsAthaiq8ectsvchIS7QjNo1B8Er0+nJ9AN
 UjIVQQFp4zfTv3D4BGX7ZEI/DttTAkWMPVsn+6Koxg==
X-Google-Smtp-Source: AGHT+IGGLxshaXoCY2Kipq/uxkVNndbEN+67ARqrjRok5egzFm6ZEbozEh7YD40KZR3BrP4Mk+ZvA3GpaSrmGnkjPl4=
X-Received: by 2002:a05:690c:93:b0:5df:4992:4f79 with SMTP id
 be19-20020a05690c009300b005df49924f79mr210161ywb.6.1702068916294; Fri, 08 Dec
 2023 12:55:16 -0800 (PST)
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
 <20231208050641.32582-13-quic_abhinavk@quicinc.com>
 <CAA8EJpr5FyYaGQpQX_MBK6y9kLz_UHsLmsKrV2tF6ukz6sU8YQ@mail.gmail.com>
 <55564921-5e52-d254-1909-d2ebdc6cea1b@quicinc.com>
In-Reply-To: <55564921-5e52-d254-1909-d2ebdc6cea1b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 22:55:05 +0200
Message-ID: <CAA8EJppi8+t3uti9qvupfVq1SJwstQHBNPX5RO4g9asgxOAGWA@mail.gmail.com>
Subject: Re: [PATCH v2 12/16] drm/msm/dpu: add an API to setup the CDM block
 for writeback
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
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 Dec 2023 at 19:28, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> On 12/8/2023 3:52 AM, Dmitry Baryshkov wrote:
> > On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >> Add an API dpu_encoder_helper_phys_setup_cdm() which can be used by
> >> the writeback encoder to setup the CDM block.
> >>
> >> Currently, this is defined and used within the writeback's physical
> >> encoder layer however, the function can be modified to be used to setup
> >> the CDM block even for non-writeback interfaces.
> >>
> >> Until those modifications are planned and made, keep it local to
> >> writeback.
> >>
> >> changes in v2:
> >>          - add the RGB2YUV CSC matrix to dpu util as needed by CDM
> >>          - use dpu_hw_get_csc_cfg() to get and program CSC
> >>          - drop usage of setup_csc_data() and setup_cdwn() cdm ops
> >>            as they both have been merged into enable()
> >>          - drop reduntant hw_cdm and hw_pp checks
> >>
> >> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> ---
> >>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  3 +
> >>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 96 ++++++++++++++++++-
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   | 17 ++++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |  1 +
> >>   4 files changed, 116 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >> index 410f6225789c..1d6d1eb642b9 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >> @@ -16,6 +16,7 @@
> >>   #include "dpu_hw_pingpong.h"
> >>   #include "dpu_hw_ctl.h"
> >>   #include "dpu_hw_top.h"
> >> +#include "dpu_hw_cdm.h"
> >>   #include "dpu_encoder.h"
> >>   #include "dpu_crtc.h"
> >>
> >> @@ -210,6 +211,7 @@ static inline int dpu_encoder_phys_inc_pending(struct dpu_encoder_phys *phys)
> >>    * @wbirq_refcount:     Reference count of writeback interrupt
> >>    * @wb_done_timeout_cnt: number of wb done irq timeout errors
> >>    * @wb_cfg:  writeback block config to store fb related details
> >> + * @cdm_cfg: cdm block config needed to store writeback block's CDM configuration
> >>    * @wb_conn: backpointer to writeback connector
> >>    * @wb_job: backpointer to current writeback job
> >>    * @dest:   dpu buffer layout for current writeback output buffer
> >> @@ -219,6 +221,7 @@ struct dpu_encoder_phys_wb {
> >>          atomic_t wbirq_refcount;
> >>          int wb_done_timeout_cnt;
> >>          struct dpu_hw_wb_cfg wb_cfg;
> >> +       struct dpu_hw_cdm_cfg cdm_cfg;
> >>          struct drm_writeback_connector *wb_conn;
> >>          struct drm_writeback_job *wb_job;
> >>          struct dpu_hw_fmt_layout dest;
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >> index 4665367cf14f..85429c62d727 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >> @@ -259,6 +259,99 @@ static void dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
> >>          }
> >>   }
> >>
> >> +/**
> >> + * dpu_encoder_phys_wb_setup_cdp - setup chroma down sampling block
> >> + * @phys_enc:Pointer to physical encoder
> >> + */
> >> +static void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc)
> >> +{
> >> +       struct dpu_hw_cdm *hw_cdm;
> >> +       struct dpu_hw_cdm_cfg *cdm_cfg;
> >> +       struct dpu_hw_pingpong *hw_pp;
> >> +       struct dpu_encoder_phys_wb *wb_enc;
> >> +       const struct msm_format *format;
> >> +       const struct dpu_format *dpu_fmt;
> >> +       struct drm_writeback_job *wb_job;
> >> +       int ret;
> >> +
> >> +       if (!phys_enc)
> >> +               return;
> >> +
> >> +       wb_enc = to_dpu_encoder_phys_wb(phys_enc);
> >> +       cdm_cfg = &wb_enc->cdm_cfg;
> >> +       hw_pp = phys_enc->hw_pp;
> >> +       hw_cdm = phys_enc->hw_cdm;
> >> +       wb_job = wb_enc->wb_job;
> >> +
> >> +       format = msm_framebuffer_format(wb_enc->wb_job->fb);
> >> +       dpu_fmt = dpu_get_dpu_format_ext(format->pixel_format, wb_job->fb->modifier);
> >> +
> >> +       if (!hw_cdm)
> >> +               return;
> >> +
> >> +       if (!DPU_FORMAT_IS_YUV(dpu_fmt)) {
> >> +               DPU_DEBUG("[enc:%d] cdm_disable fmt:%x\n", DRMID(phys_enc->parent),
> >> +                         dpu_fmt->base.pixel_format);
> >> +               if (hw_cdm->ops.disable)
> >> +                       hw_cdm->ops.disable(hw_cdm);
> >> +
> >> +               return;
> >> +       }
> >> +
> >> +       memset(cdm_cfg, 0, sizeof(struct dpu_hw_cdm_cfg));
> >> +
> >> +       cdm_cfg->output_width = wb_job->fb->width;
> >> +       cdm_cfg->output_height = wb_job->fb->height;
> >> +       cdm_cfg->output_fmt = dpu_fmt;
> >> +       cdm_cfg->output_type = CDM_CDWN_OUTPUT_WB;
> >> +       cdm_cfg->output_bit_depth = DPU_FORMAT_IS_DX(dpu_fmt) ?
> >> +                       CDM_CDWN_OUTPUT_10BIT : CDM_CDWN_OUTPUT_8BIT;
> >> +       cdm_cfg->csc_cfg = dpu_hw_get_csc_cfg(DPU_HW_RGB2YUV_601L_10BIT);
> >> +       if (!cdm_cfg->csc_cfg) {
> >> +               DPU_ERROR("valid csc not found\n");
> >> +               return;
> >> +       }
> >> +
> >> +       /* enable 10 bit logic */
> >> +       switch (cdm_cfg->output_fmt->chroma_sample) {
> >> +       case DPU_CHROMA_RGB:
> >> +               cdm_cfg->h_cdwn_type = CDM_CDWN_DISABLE;
> >> +               cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
> >> +               break;
> >> +       case DPU_CHROMA_H2V1:
> >> +               cdm_cfg->h_cdwn_type = CDM_CDWN_COSITE;
> >> +               cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
> >> +               break;
> >> +       case DPU_CHROMA_420:
> >> +               cdm_cfg->h_cdwn_type = CDM_CDWN_COSITE;
> >> +               cdm_cfg->v_cdwn_type = CDM_CDWN_OFFSITE;
> >> +               break;
> >> +       case DPU_CHROMA_H1V2:
> >> +       default:
> >> +               DPU_ERROR("[enc:%d] unsupported chroma sampling type\n",
> >> +                         DRMID(phys_enc->parent));
> >> +               cdm_cfg->h_cdwn_type = CDM_CDWN_DISABLE;
> >> +               cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
> >
> > If it is unsupported, we should return an error here.
> >
>
> The caller of this API and the caller of the API even before that do not
> have error checking as they are all void. Disabling CDWN is the
> appropriate corrective action for this case and should be sufficient.

Ack. Could you please document that DPU_CHROMA_H1V2 is invalid for this API?

>
> >> +               break;
> >> +       }
> >> +
> >> +       DPU_DEBUG("[enc:%d] cdm_enable:%d,%d,%X,%d,%d,%d,%d]\n",
> >> +                 DRMID(phys_enc->parent), cdm_cfg->output_width,
> >> +                 cdm_cfg->output_height, cdm_cfg->output_fmt->base.pixel_format,
> >> +                 cdm_cfg->output_type, cdm_cfg->output_bit_depth,
> >> +                 cdm_cfg->h_cdwn_type, cdm_cfg->v_cdwn_type);
> >> +
> >> +       if (hw_cdm->ops.enable) {
> >> +               cdm_cfg->pp_id = hw_pp->idx;
> >> +               ret = hw_cdm->ops.enable(hw_cdm, cdm_cfg);
> >> +               if (ret < 0) {
> >> +                       DPU_ERROR("[enc:%d] failed to enable CDM; ret:%d\n",
> >> +                                 DRMID(phys_enc->parent), ret);
> >> +                       return;
> >> +               }
> >> +       }
> >> +}
> >> +
> >>   /**
> >>    * dpu_encoder_phys_wb_atomic_check - verify and fixup given atomic states
> >>    * @phys_enc:  Pointer to physical encoder
> >> @@ -382,8 +475,9 @@ static void dpu_encoder_phys_wb_setup(
> >>
> >>          dpu_encoder_phys_wb_setup_fb(phys_enc, fb);
> >>
> >> -       dpu_encoder_phys_wb_setup_ctl(phys_enc);
> >> +       dpu_encoder_helper_phys_setup_cdm(phys_enc);
> >>
> >> +       dpu_encoder_phys_wb_setup_ctl(phys_enc);
> >>   }
> >>
> >>   /**
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> >> index 59a153331194..34143491aba2 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> >> @@ -87,6 +87,8 @@ static u32 dpu_hw_util_log_mask = DPU_DBG_MASK_NONE;
> >>   #define QOS_QOS_CTRL_VBLANK_EN            BIT(16)
> >>   #define QOS_QOS_CTRL_CREQ_VBLANK_MASK     GENMASK(21, 20)
> >>
> >> +#define TO_S15D16(_x_)((_x_) << 7)
> >
> > Huh? I don't understand why it is shifted by 7. If you have data in
> > S8.9 format, I'd say that it makes things less obvious compared to
> > S15.16 (where you can perform division on the fly).
> >
>
> I was referring to below comment and also because the values are in
> S15.16 in
>
> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/clo/main/msm/sde/sde_encoder_phys_wb.c?ref_type=heads#L35

Yes, I saw that. My first thought was that <<7 looked
counterintuitive. You can not perform maths easily with S4.9 values.
At least I can not guess the actual value of 0x083 or 0xff37.

I thought about writing data in S15.16 directly (e.g. 0x4180 instead
of 0x083, 0x8100 instead of 0x102). This way it would be easier to
understand that the first row is 65.5 / 256, 128 / 256, 25 / 256. And
this is what we had for existing DPU CSC tables.

But after looking at the dpu_hw_csc_setup() I actually fail to
understand why we need the S15.16 values. The hardware works with S4.9
in the end. So it looks pretty strange to convert S4.9 to S15.16 via
the macro only to convert it back to S4.9 in the CSC setup code.

Maybe we can go the following route:
- Merge this series using CSC tables as is (with your TO_S15D16 macro)
- Drop the <<7 from dpu_hw_csc_setup() (and drop the macro too)
- Define S4P9(floor, nom, den) and S4P9_NEG(floor, nom, den) macros to
be used for the matrix values
- Merge the DPU tables with MDP tables (which use S4.9 already)

I'd also like to check if we can drop two versions of clamp values
(for 8bit and for 10bit) and convert those values on the fly.

>
> 428 struct dpu_csc_cfg {
> 429     /* matrix coefficients in S15.16 format */
> 430     uint32_t csc_mv[DPU_CSC_MATRIX_COEFF_SIZE];
> 431     uint32_t csc_pre_bv[DPU_CSC_BIAS_SIZE];
> 432     uint32_t csc_post_bv[DPU_CSC_BIAS_SIZE];
> 433     uint32_t csc_pre_lv[DPU_CSC_CLAMP_SIZE];
> 434     uint32_t csc_post_lv[DPU_CSC_CLAMP_SIZE];
> 435 };
> 436
>
>
> >> +
> >>   static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
> >>          {
> >>                  /* S15.16 format */
> >> @@ -117,6 +119,18 @@ static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
> >>          { 0x00, 0x3ff, 0x00, 0x3ff, 0x00, 0x3ff,},
> >>   };
> >>
> >> +static const struct dpu_csc_cfg dpu_csc10_rgb2yuv_601l = {
> >> +       {
> >> +               TO_S15D16(0x0083), TO_S15D16(0x0102), TO_S15D16(0x0032),
> >> +               TO_S15D16(0x1fb5), TO_S15D16(0x1f6c), TO_S15D16(0x00e1),
> >> +               TO_S15D16(0x00e1), TO_S15D16(0x1f45), TO_S15D16(0x1fdc)
> >> +       },
> >> +       { 0x00, 0x00, 0x00 },
> >> +       { 0x0040, 0x0200, 0x0200 },
> >> +       { 0x000, 0x3ff, 0x000, 0x3ff, 0x000, 0x3ff },
> >> +       { 0x040, 0x3ac, 0x040, 0x3c0, 0x040, 0x3c0 },
> >> +};
> >> +
> >>   /**
> >>    * dpu_hw_get_csc_cfg - get the CSC matrix based on the request type
> >>    * @type:              type of the requested CSC matrix from caller
> >> @@ -133,6 +147,9 @@ const struct dpu_csc_cfg *dpu_hw_get_csc_cfg(enum dpu_hw_csc_cfg_type type)
> >>          case DPU_HW_YUV2RGB_601L_10BIT:
> >>                  csc_cfg = &dpu_csc10_YUV2RGB_601L;
> >>                  break;
> >> +       case DPU_HW_RGB2YUV_601L_10BIT:
> >> +               csc_cfg = &dpu_csc10_rgb2yuv_601l;
> >> +               break;
> >>          default:
> >>                  DPU_ERROR("unknown csc_cfg type\n");
> >>                  break;
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> >> index 49f2bcf6de15..ed153d66f660 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> >> @@ -22,6 +22,7 @@
> >>   enum dpu_hw_csc_cfg_type {
> >>          DPU_HW_YUV2RGB_601L,
> >>          DPU_HW_YUV2RGB_601L_10BIT,
> >> +       DPU_HW_RGB2YUV_601L_10BIT,
> >>   };
> >>
> >>   /*
> >> --
> >> 2.40.1
> >>
> >
> >



--
With best wishes
Dmitry
