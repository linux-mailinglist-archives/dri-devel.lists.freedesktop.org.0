Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 186B280150A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 22:16:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648F510E146;
	Fri,  1 Dec 2023 21:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87EB010E146
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 21:15:26 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6d7eb7ff384so690359a34.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Dec 2023 13:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701465325; x=1702070125; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=P5Nsgw7Fsbf0MtthNfgpXOXTqUhR9kk0U40KgyN6HaA=;
 b=ksgYkCztFbUketxWS+Sid7vgG7RRLZOFU4ODUWVUui4rREX3aQ6vpWOCWHjgppPdnA
 jti9p0l4Z2LRhanFfiuPWcaefRZ+g2PdLbJoS8UAWChYhvQ9vhHLW6lAsx8Y/VyX2pR5
 u+gbWYtFbdscHHTpso2vOxYOP/8FjtpWHB0sLaE6X3wrkologz5KTvHjBpjpv5W/g6rL
 wI6Gu3B3i/VNqesnHt0Ui+yH1sQOlWvk+N14JvCd2m1YVRM3xTpaehHnUQ+Fidoq2t/O
 M6uw8gaALq4B+gm58XnkIBgnIjuuXExgP9PTZZjlqrp2RJ4CgsmRZTgvuf42H0RPL5DZ
 79uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701465325; x=1702070125;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P5Nsgw7Fsbf0MtthNfgpXOXTqUhR9kk0U40KgyN6HaA=;
 b=vpeiHZVigucoE6naqZ/FmYpCsfhMWo3oUuDavOn5NnVbrP6TtUz2RNEiURJX3YkeK1
 VuXgB3Pl7ut+cwIaBkiODmVeZ1n0HD08BxHTxvcohvlapzRJ9dfiMUF+pxfPCOgNm1cW
 kp4eSn0duUP3CrcLLsQg3HmZ5XRGAJI9LR4XEqMiA5xSIvErtOeWJnP7TiJnUMeKvoFy
 8jd+4CSB2Jvb3ThksYRmQMCpCVvToCyJgCyJU8tGHFRglIcIah1KJRq+sRYpbK9zb8GJ
 BAqxStdTti9HNgr3EXcAm7lYvKSNMjpkCPkXmQD7rvSFbT5/GPst5z32NAIQ7WmLbMw3
 j5jg==
X-Gm-Message-State: AOJu0YybCcFb5onrKuO567pdxqXSXorQlBLLPTGHR0/CslmjGGD8CDsO
 hbplk0N3YnnpHf9/1OIwS5fgV07Cvp3aD9PmZFD8AQ==
X-Google-Smtp-Source: AGHT+IHuwhLn+zInww9mxHxJCEBy2e8xfh60Ea2qqSiB+aC5hbbbaK5duJQYb6+BMmXOqHk8swOKkjxoJxIzjJzNXcM=
X-Received: by 2002:a9d:674d:0:b0:6d8:1308:97fb with SMTP id
 w13-20020a9d674d000000b006d8130897fbmr155520otm.35.1701465325595; Fri, 01 Dec
 2023 13:15:25 -0800 (PST)
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-12-quic_abhinavk@quicinc.com>
 <CAA8EJppBskavOzn4_vUa=kvyYi2zn2XR70Ft-6ZyuOdGYWWL2A@mail.gmail.com>
 <3085d544-b6d9-5064-2789-2bbccf4b6818@quicinc.com>
 <CAA8EJpoP1T3SRT+7i+P7iuKEdCW5D76sEdLpVvBzHWvrqQCe3g@mail.gmail.com>
 <12490147-d9f9-2695-7a0b-04961003de38@quicinc.com>
In-Reply-To: <12490147-d9f9-2695-7a0b-04961003de38@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 1 Dec 2023 23:15:14 +0200
Message-ID: <CAA8EJpoJERnM=URhfODO73Z816PBfF9q930yLdBJF3-jtL6jYA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 11/16] drm/msm/dpu: add an API to setup the
 CDM block for writeback
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, quic_parellan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Dec 2023 at 21:04, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 11/30/2023 11:20 PM, Dmitry Baryshkov wrote:
> > On Fri, 1 Dec 2023 at 02:41, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 8/30/2023 5:11 PM, Dmitry Baryshkov wrote:
> >>> On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>>>
> >>>> Add an API dpu_encoder_helper_phys_setup_cdm() which can be used by
> >>>> the writeback encoder to setup the CDM block.
> >>>>
> >>>> Currently, this is defined and used within the writeback's physical
> >>>> encoder layer however, the function can be modified to be used to setup
> >>>> the CDM block even for non-writeback interfaces.
> >>>>
> >>>> Until those modifications are planned and made, keep it local to
> >>>> writeback.
> >>>>
> >>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>>> ---
> >>>>    .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |   3 +
> >>>>    .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 123 +++++++++++++++++-
> >>>>    2 files changed, 125 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >>>> index 510c1c41ddbc..93a8ae67beff 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >>>> @@ -16,6 +16,7 @@
> >>>>    #include "dpu_hw_pingpong.h"
> >>>>    #include "dpu_hw_ctl.h"
> >>>>    #include "dpu_hw_top.h"
> >>>> +#include "dpu_hw_cdm.h"
> >>>>    #include "dpu_encoder.h"
> >>>>    #include "dpu_crtc.h"
> >>>>
> >>>> @@ -209,6 +210,7 @@ static inline int dpu_encoder_phys_inc_pending(struct dpu_encoder_phys *phys)
> >>>>     * @wbirq_refcount:     Reference count of writeback interrupt
> >>>>     * @wb_done_timeout_cnt: number of wb done irq timeout errors
> >>>>     * @wb_cfg:  writeback block config to store fb related details
> >>>> + * @cdm_cfg: cdm block config needed to store writeback block's CDM configuration
> >>>>     * @wb_conn: backpointer to writeback connector
> >>>>     * @wb_job: backpointer to current writeback job
> >>>>     * @dest:   dpu buffer layout for current writeback output buffer
> >>>> @@ -218,6 +220,7 @@ struct dpu_encoder_phys_wb {
> >>>>           atomic_t wbirq_refcount;
> >>>>           int wb_done_timeout_cnt;
> >>>>           struct dpu_hw_wb_cfg wb_cfg;
> >>>> +       struct dpu_hw_cdm_cfg cdm_cfg;
> >>>>           struct drm_writeback_connector *wb_conn;
> >>>>           struct drm_writeback_job *wb_job;
> >>>>           struct dpu_hw_fmt_layout dest;
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >>>> index 4c2736c3ee6d..11935aac9fd5 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >>>> @@ -24,6 +24,20 @@
> >>>>    #define to_dpu_encoder_phys_wb(x) \
> >>>>           container_of(x, struct dpu_encoder_phys_wb, base)
> >>>>
> >>>> +#define TO_S15D16(_x_)((_x_) << 7)
> >>>> +
> >>>> +static struct dpu_csc_cfg dpu_encoder_phys_wb_rgb2yuv_601l = {
> >>>> +       {
> >>>> +               TO_S15D16(0x0083), TO_S15D16(0x0102), TO_S15D16(0x0032),
> >>>> +               TO_S15D16(0x1fb5), TO_S15D16(0x1f6c), TO_S15D16(0x00e1),
> >>>> +               TO_S15D16(0x00e1), TO_S15D16(0x1f45), TO_S15D16(0x1fdc)
> >>>> +       },
> >>>> +       { 0x00, 0x00, 0x00 },
> >>>> +       { 0x0040, 0x0200, 0x0200 },
> >>>> +       { 0x000, 0x3ff, 0x000, 0x3ff, 0x000, 0x3ff },
> >>>> +       { 0x040, 0x3ac, 0x040, 0x3c0, 0x040, 0x3c0 },
> >>>> +};
> >>>
> >>> Nit: we probably need to have a single place with all dpu_csc_cfg entries.
> >>>
> >>
> >> hmmm ... so we have YUV2RGB matrices for dpu plane and RGB2YUV matrices
> >> for WB and DP.
> >>
> >> We can move all this to dpu_hw_util.c but lets do that in the DP series
> >> as that completes the consumer list of these matrices.
> >
> > Doing it earlier is usually better. Can we please do it as a part of
> > this series?
> >
>
> Would be strange as RGB2YUV matrix is not used by anyone other than WB
> till DP lands.
>
> If you are fine with that anomaly, no concerns.

Yes. Because it keeps all instances in a single place.

>
> >>
> >>>> +
> >>>>    /**
> >>>>     * dpu_encoder_phys_wb_is_master - report wb always as master encoder
> >>>>     * @phys_enc:  Pointer to physical encoder
> >>>> @@ -225,6 +239,112 @@ static void dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
> >>>>           }
> >>>>    }
> >>>>
> >>>> +/**
> >>>> + * dpu_encoder_phys_wb_setup_cdp - setup chroma down sampling block
> >>>> + * @phys_enc:Pointer to physical encoder
> >>>> + */
> >>>> +static void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc)
> >>>> +{
> >>>> +       struct dpu_hw_cdm *hw_cdm;
> >>>> +       struct dpu_hw_cdm_cfg *cdm_cfg;
> >>>> +       struct dpu_hw_pingpong *hw_pp;
> >>>> +       struct dpu_encoder_phys_wb *wb_enc;
> >>>> +       const struct msm_format *format;
> >>>> +       const struct dpu_format *dpu_fmt;
> >>>> +       struct drm_writeback_job *wb_job;
> >>>> +       int ret;
> >>>> +
> >>>> +       if (!phys_enc)
> >>>> +               return;
> >>>> +
> >>>> +       wb_enc = to_dpu_encoder_phys_wb(phys_enc);
> >>>> +       cdm_cfg = &wb_enc->cdm_cfg;
> >>>> +       hw_pp = phys_enc->hw_pp;
> >>>> +       hw_cdm = phys_enc->hw_cdm;
> >>>> +       wb_job = wb_enc->wb_job;
> >>>> +
> >>>> +       format = msm_framebuffer_format(wb_enc->wb_job->fb);
> >>>> +       dpu_fmt = dpu_get_dpu_format_ext(format->pixel_format, wb_job->fb->modifier);
> >>>> +
> >>>> +       if (!hw_cdm)
> >>>> +               return;
> >>>> +
> >>>> +       if (!DPU_FORMAT_IS_YUV(dpu_fmt)) {
> >>>> +               DPU_DEBUG("[enc:%d] cdm_disable fmt:%x\n", DRMID(phys_enc->parent),
> >>>> +                         dpu_fmt->base.pixel_format);
> >>>> +               if (hw_cdm->ops.disable)
> >>>> +                       hw_cdm->ops.disable(hw_cdm);
> >>>> +
> >>>> +               return;
> >>>> +       }
> >>>> +
> >>>> +       memset(cdm_cfg, 0, sizeof(struct dpu_hw_cdm_cfg));
> >>>> +
> >>>> +       cdm_cfg->output_width = wb_job->fb->width;
> >>>> +       cdm_cfg->output_height = wb_job->fb->height;
> >>>> +       cdm_cfg->output_fmt = dpu_fmt;
> >>>> +       cdm_cfg->output_type = CDM_CDWN_OUTPUT_WB;
> >>>> +       cdm_cfg->output_bit_depth = DPU_FORMAT_IS_DX(dpu_fmt) ?
> >>>> +                       CDM_CDWN_OUTPUT_10BIT : CDM_CDWN_OUTPUT_8BIT;
> >>>> +
> >>>> +       /* enable 10 bit logic */
> >>>> +       switch (cdm_cfg->output_fmt->chroma_sample) {
> >>>> +       case DPU_CHROMA_RGB:
> >>>> +               cdm_cfg->h_cdwn_type = CDM_CDWN_DISABLE;
> >>>> +               cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
> >>>> +               break;
> >>>> +       case DPU_CHROMA_H2V1:
> >>>> +               cdm_cfg->h_cdwn_type = CDM_CDWN_COSITE;
> >>>> +               cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
> >>>> +               break;
> >>>> +       case DPU_CHROMA_420:
> >>>> +               cdm_cfg->h_cdwn_type = CDM_CDWN_COSITE;
> >>>> +               cdm_cfg->v_cdwn_type = CDM_CDWN_OFFSITE;
> >>>> +               break;
> >>>> +       case DPU_CHROMA_H1V2:
> >>>> +       default:
> >>>> +               DPU_ERROR("[enc:%d] unsupported chroma sampling type\n",
> >>>> +                         DRMID(phys_enc->parent));
> >>>> +               cdm_cfg->h_cdwn_type = CDM_CDWN_DISABLE;
> >>>> +               cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
> >>>> +               break;
> >>>> +       }
> >>>> +
> >>>> +       DPU_DEBUG("[enc:%d] cdm_enable:%d,%d,%X,%d,%d,%d,%d]\n",
> >>>> +                 DRMID(phys_enc->parent), cdm_cfg->output_width,
> >>>> +                 cdm_cfg->output_height, cdm_cfg->output_fmt->base.pixel_format,
> >>>> +                 cdm_cfg->output_type, cdm_cfg->output_bit_depth,
> >>>> +                 cdm_cfg->h_cdwn_type, cdm_cfg->v_cdwn_type);
> >>>> +
> >>>> +       if (hw_cdm && hw_cdm->ops.setup_csc_data) {
> >>>> +               ret = hw_cdm->ops.setup_csc_data(hw_cdm, &dpu_encoder_phys_wb_rgb2yuv_601l);
> >>>> +               if (ret < 0) {
> >>>> +                       DPU_ERROR("[enc:%d] failed to setup CSC; ret:%d\n",
> >>>> +                                 DRMID(phys_enc->parent), ret);
> >>>> +                       return;
> >>>> +               }
> >>>> +       }
> >>>> +
> >>>> +       if (hw_cdm && hw_cdm->ops.setup_cdwn) {
> >>>
> >>> You have checked for (!hw_cdm) several lines above. We can drop this
> >>> condition here.
> >>>
> >>
> >> Ack.
> >>
> >>>> +               ret = hw_cdm->ops.setup_cdwn(hw_cdm, cdm_cfg);
> >>>> +               if (ret < 0) {
> >>>> +                       DPU_ERROR("[enc:%d] failed to setup CDWN; ret:%d\n",
> >>>> +                                 DRMID(phys_enc->parent), ret);
> >>>> +                       return;
> >>>> +               }
> >>>> +       }
> >>>> +
> >>>> +       if (hw_cdm && hw_pp && hw_cdm->ops.enable) {
> >>>
> >>> And what if !hw_pp ? Can it happen here? No, if I understand correctly.
> >>>
> >>
> >> I dont see any other protection for !hw_pp in this flow so would prefer
> >> to keep it.
> >
> > But can we end up in this function if we have no hw_pp at all?
> >
>
> Just from code flow yes,
>
> dpu_encoder_prepare_for_kickoff ---> phys->ops.prepare_for_kickoff --->
> this function
>
> None of them have !hw_pp.
>
> But, if hw_pp failed allocation, then atomic_check will fail so the
> commit will not happen.
>
> I was thinking of the former, if we are fine with the latter we can drop.

Yes, I'm fine with that, unless there is any special mode (like
ppsplit, cwb, etc.) where we can end up with no PP assigned on
purpose.

>
> >>
> >>>> +               cdm_cfg->pp_id = hw_pp->idx;
> >>>> +               ret = hw_cdm->ops.enable(hw_cdm, cdm_cfg);
> >>>
> >>> As we are calling these three ops in a row, can we merge them together
> >>> into a single callback to be called from dpu_encoder.c?
> >>>
> >>
> >> Good idea. I can add a csc_cfg entry to cdm_cfg and merge all three into
> >> the enable() op itself and drop the other two.
> >>
> >>>> +               if (ret < 0) {
> >>>> +                       DPU_ERROR("[enc:%d] failed to enable CDM; ret:%d\n",
> >>>> +                                 DRMID(phys_enc->parent), ret);
> >>>> +                       return;
> >>>> +               }
> >>>> +       }
> >>>> +}
> >>>> +
> >>>>    /**
> >>>>     * dpu_encoder_phys_wb_atomic_check - verify and fixup given atomic states
> >>>>     * @phys_enc:  Pointer to physical encoder
> >>>> @@ -348,8 +468,9 @@ static void dpu_encoder_phys_wb_setup(
> >>>>
> >>>>           dpu_encoder_phys_wb_setup_fb(phys_enc, fb);
> >>>>
> >>>> -       dpu_encoder_phys_wb_setup_ctl(phys_enc);
> >>>> +       dpu_encoder_helper_phys_setup_cdm(phys_enc);
> >>>>
> >>>> +       dpu_encoder_phys_wb_setup_ctl(phys_enc);
> >>>>    }
> >>>>
> >>>>    static void _dpu_encoder_phys_wb_frame_done_helper(void *arg)
> >>>> --
> >>>> 2.40.1
> >>>>
> >>>
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry
