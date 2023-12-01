Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F918005E9
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 09:39:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA5210E826;
	Fri,  1 Dec 2023 08:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C91310E82F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 08:39:34 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-5d279bcce64so21321857b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Dec 2023 00:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701419973; x=1702024773; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QM9xhtSWl8bZod+heLo+OxtwiUVff2dCtOs0sAGegx4=;
 b=W67ZzqoqJczNy0DlfEHrrIZ2bTbIx1mYvYOozrei0PiW6sojrwk+zV1h/FfDpi9YNT
 YeVFbjpzbJjDc75rpbhhqKjpCAa43pl0MncmpoLYfbInmc1BHHvLTK9nB96E7lE/pZVf
 uZyDQwHNhgBm48Z2xuFV4GjbZwXVQXIT+69swItStZaWoz1SLR/+T9d0IZbdE81bkwc+
 0t1QyIyBgXSfHh1QMqoQ2c1ZCuGn7nqGd0jNGtgn3nDoSDO11zko0No24hqEmFheEtOn
 BbhteRhXx+qG2KMPtB2RF17uOafyQw/YbiaDt9ve58UYRgo7rRc+tNF+cFwAyWJYVulU
 AcXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701419973; x=1702024773;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QM9xhtSWl8bZod+heLo+OxtwiUVff2dCtOs0sAGegx4=;
 b=ZJgYKOw34xI7gnc/QzqyCGT8dY5rlTSmL7co9LrL0fFXTkVd5W/7g8G5arRmvz5T5e
 Yk3LDgX0L5Z+wPkT8pH49+5FwZzMeNbXC2H4p7uSaL99VoRAQlEArFSinA4UIFpLmZJm
 +ciuhZ4/TOdek/suqMw8f39pUp4kjGwRJw6MgNoIrxpI2630s+RwhQHKBzWRBqwUYDV7
 UlHaCKRTxsixqvHcjGE4qXXGjPbRs2yI26Znjrb00avizUIC8Zx10Ik8sLE88nK1j6Ok
 YRX4GMtaIMZ5ltZWP7Ff4qnOKQt76NSioMfUCVrqsqE0zzqRs9p7f4I1IqRE0JOYB4ps
 3oNQ==
X-Gm-Message-State: AOJu0YwQibB/NC3KBYxeSRGc8Zb3lgyh4/+TYkdq5xvl69s5Ui2O8AwM
 636wB175ScZ6/nM0fOEyIPbxy9VeBJpy0aDJLYsCJJrqKcLNgMf2
X-Google-Smtp-Source: AGHT+IFmyIRr/gCqW6f+UW7j7jp8SM1NhNjkR32wOxNjKbwQ4wkSgwoud6Vt7F9+XZwH/86mmn+tBWKoGO57Bl+YGDU=
X-Received: by 2002:a81:b71b:0:b0:5ca:da4c:306a with SMTP id
 v27-20020a81b71b000000b005cada4c306amr296205ywh.51.1701419973356; Fri, 01 Dec
 2023 00:39:33 -0800 (PST)
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-9-quic_abhinavk@quicinc.com>
 <CAA8EJporcrBikTob9xJe8_96AJSP1vDJNYPkt1za73PAcg1+Bw@mail.gmail.com>
 <396724e1-2c51-090e-cfa5-e516a0eea861@quicinc.com>
In-Reply-To: <396724e1-2c51-090e-cfa5-e516a0eea861@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 1 Dec 2023 10:39:22 +0200
Message-ID: <CAA8EJpqTYcPw0DqBqydZRbNZ7Mex_Q4Kkxnjni7XxKtqLomkPQ@mail.gmail.com>
Subject: Re: [PATCH 08/16] drm/msm/dpu: add support to allocate CDM from RM
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

On Fri, 1 Dec 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 8/30/2023 5:06 PM, Dmitry Baryshkov wrote:
> > On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >> Even though there is usually only one CDM block, it can be
> >> used by either HDMI, DisplayPort OR Writeback interfaces.
> >>
> >> Hence its allocation needs to be tracked properly by the
> >> resource manager to ensure appropriate availability of the
> >> block.
> >
> > It almost feels like an overkill, as up to now there is at most one CDM block.
> >
>
> Yes but even that one CDM block can be used by any connector. So as we
> discussed on IRC, this just implements the FCFS and we need RM to be the
> manager of that one block.

Yes. "almost"

>
> >>
> >> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 +-
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 45 +++++++++++++++++++--
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  4 +-
> >>   5 files changed, 48 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> index 6cf6597148fd..582680804016 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> @@ -663,7 +663,7 @@ static int dpu_encoder_virt_atomic_check(
> >>
> >>                  if (!crtc_state->active_changed || crtc_state->enable)
> >>                          ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> >> -                                       drm_enc, crtc_state, topology);
> >> +                                       drm_enc, crtc_state, topology, false);
> >>          }
> >>
> >>          trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> index 34f943102499..07f75f295844 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> @@ -98,6 +98,7 @@ enum dpu_hw_blk_type {
> >>          DPU_HW_BLK_DSPP,
> >>          DPU_HW_BLK_MERGE_3D,
> >>          DPU_HW_BLK_DSC,
> >> +       DPU_HW_BLK_CDM,
> >>          DPU_HW_BLK_MAX,
> >>   };
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> >> index b6f53ca6e962..61aa58643fda 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> >> @@ -136,6 +136,7 @@ struct dpu_global_state {
> >>          uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
> >>          uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
> >>          uint32_t dsc_to_enc_id[DSC_MAX - DSC_0];
> >> +       uint32_t cdm_to_enc_id;
> >>   };
> >>
> >>   struct dpu_global_state
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> index 7b6444a3fcb1..e7d4beb4661e 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> @@ -29,10 +29,12 @@ static inline bool reserved_by_other(uint32_t *res_map, int idx,
> >>   /**
> >>    * struct dpu_rm_requirements - Reservation requirements parameter bundle
> >>    * @topology:  selected topology for the display
> >> + * @needs_cdm: whether the display needs a CDM block for the current mode
> >>    * @hw_res:       Hardware resources required as reported by the encoders
> >>    */
> >>   struct dpu_rm_requirements {
> >>          struct msm_display_topology topology;
> >> +       bool needs_cdm;
> >>   };
> >>
> >>   int dpu_rm_destroy(struct dpu_rm *rm)
> >> @@ -505,6 +507,26 @@ static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> >>          return 0;
> >>   }
> >>
> >> +static int _dpu_rm_reserve_cdm(struct dpu_rm *rm,
> >> +                              struct dpu_global_state *global_state,
> >> +                              struct drm_encoder *enc)
> >> +{
> >> +       /* try allocating only one CDM block */
> >> +       if (!rm->cdm_blk) {
> >> +               DPU_ERROR("CDM block does not exist\n");
> >> +               return -EIO;
> >> +       }
> >> +
> >> +       if (global_state->cdm_to_enc_id) {
> >> +               DPU_ERROR("CDM_0 is already allocated\n");
> >> +               return -EIO;
> >> +       }
> >> +
> >> +       global_state->cdm_to_enc_id = enc->base.id;
> >> +
> >> +       return 0;
> >> +}
> >> +
> >>   static int _dpu_rm_make_reservation(
> >>                  struct dpu_rm *rm,
> >>                  struct dpu_global_state *global_state,
> >> @@ -530,15 +552,25 @@ static int _dpu_rm_make_reservation(
> >>          if (ret)
> >>                  return ret;
> >>
> >> +       if (reqs->needs_cdm) {
> >> +               ret = _dpu_rm_reserve_cdm(rm, global_state, enc);
> >> +               if (ret) {
> >> +                       DPU_ERROR("unable to find CDM blk\n");
> >> +                       return ret;
> >> +               }
> >> +       }
> >> +
> >>          return ret;
> >>   }
> >>
> >>   static int _dpu_rm_populate_requirements(
> >>                  struct drm_encoder *enc,
> >>                  struct dpu_rm_requirements *reqs,
> >> -               struct msm_display_topology req_topology)
> >> +               struct msm_display_topology req_topology,
> >> +               bool needs_cdm)
> >
> > Push it to the topology, please. It is a part of the topology at some
> > point of view.
> >
>
> hmmm ... ok with a pinch of salt as we somewhat deviate from the true
> topology definition that topology is just how lm, dsc and intf blocks
> are used. it was not intended to hold cdm.

Why not? I mean it is more logical compared to adding the 'needs_cdm'
argument which gets passed through together with the topology.

>
> >>   {
> >>          reqs->topology = req_topology;
> >> +       reqs->needs_cdm = needs_cdm;
> >>
> >>          DRM_DEBUG_KMS("num_lm: %d num_dsc: %d num_intf: %d\n",
> >>                        reqs->topology.num_lm, reqs->topology.num_dsc,
> >> @@ -571,6 +603,7 @@ void dpu_rm_release(struct dpu_global_state *global_state,
> >>                  ARRAY_SIZE(global_state->dsc_to_enc_id), enc->base.id);
> >>          _dpu_rm_clear_mapping(global_state->dspp_to_enc_id,
> >>                  ARRAY_SIZE(global_state->dspp_to_enc_id), enc->base.id);
> >> +       _dpu_rm_clear_mapping(&global_state->cdm_to_enc_id, 1, enc->base.id);
> >>   }
> >>
> >>   int dpu_rm_reserve(
> >> @@ -578,7 +611,8 @@ int dpu_rm_reserve(
> >>                  struct dpu_global_state *global_state,
> >>                  struct drm_encoder *enc,
> >>                  struct drm_crtc_state *crtc_state,
> >> -               struct msm_display_topology topology)
> >> +               struct msm_display_topology topology,
> >> +               bool needs_cdm)
> >>   {
> >>          struct dpu_rm_requirements reqs;
> >>          int ret;
> >> @@ -595,7 +629,7 @@ int dpu_rm_reserve(
> >>          DRM_DEBUG_KMS("reserving hw for enc %d crtc %d\n",
> >>                        enc->base.id, crtc_state->crtc->base.id);
> >>
> >> -       ret = _dpu_rm_populate_requirements(enc, &reqs, topology);
> >> +       ret = _dpu_rm_populate_requirements(enc, &reqs, topology, needs_cdm);
> >>          if (ret) {
> >>                  DPU_ERROR("failed to populate hw requirements\n");
> >>                  return ret;
> >> @@ -644,6 +678,11 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
> >>                  hw_to_enc_id = global_state->dsc_to_enc_id;
> >>                  max_blks = ARRAY_SIZE(rm->dsc_blks);
> >>                  break;
> >> +       case DPU_HW_BLK_CDM:
> >> +               hw_blks = &rm->cdm_blk;
> >> +               hw_to_enc_id = &global_state->cdm_to_enc_id;
> >> +               max_blks = 1;
> >> +               break;
> >>          default:
> >>                  DPU_ERROR("blk type %d not managed by rm\n", type);
> >>                  return 0;
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> >> index 29b221491926..74262d3cb6c3 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> >> @@ -69,13 +69,15 @@ int dpu_rm_destroy(struct dpu_rm *rm);
> >>    * @drm_enc: DRM Encoder handle
> >>    * @crtc_state: Proposed Atomic DRM CRTC State handle
> >>    * @topology: Pointer to topology info for the display
> >> + * @needs_cdm: bool to indicate whether current encoder needs CDM
> >>    * @Return: 0 on Success otherwise -ERROR
> >>    */
> >>   int dpu_rm_reserve(struct dpu_rm *rm,
> >>                  struct dpu_global_state *global_state,
> >>                  struct drm_encoder *drm_enc,
> >>                  struct drm_crtc_state *crtc_state,
> >> -               struct msm_display_topology topology);
> >> +               struct msm_display_topology topology,
> >> +               bool needs_cdm);
> >>
> >>   /**
> >>    * dpu_rm_reserve - Given the encoder for the display chain, release any
> >> --
> >> 2.40.1
> >>
> >
> >



-- 
With best wishes
Dmitry
