Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EF4508F91
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 20:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01EC610E22E;
	Wed, 20 Apr 2022 18:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA37710E1E8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 18:37:21 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2edbd522c21so27650217b3.13
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 11:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VvbevRCMPFNZXRtMOXK7oq7w6vOGKrR9J186mnHn5tc=;
 b=N5jcPDd9+5EzVlb8yskUfOr2B6Pi1v8TVLix1hwUSoN0K5a7Mj8z2Z9o70KaiHWwtq
 eZcsQP+hastCy+9xkL3TLBvgloOJaCKU4lVHOxpPqvC/y/Ma1Vwa/kGZMAQ5+VCnGYdq
 YTWruTwuCF6xME+MU/A5IBbSagYu63D2pqnyLI63sbYMr0l+XOoriqi8dqPaoWLuwZyM
 n9tv986UBDrf7ucfinnbXBNFqjOLaOH5xF43zasOgZZL74c3hJTL3vMs6+WaToopi2cP
 uqQM/gB43TZ2Xx55mfr8w2EfzgqsgAVkjVg03BrnHVSfyUXp+JFO9kajPcvpYSCwMfms
 U3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VvbevRCMPFNZXRtMOXK7oq7w6vOGKrR9J186mnHn5tc=;
 b=hcXZnte5o7sYYzl0IM+tEqx3qnVOaXGg99IC7WioKR3qELyVqrnr8rBnRTypIjVD2q
 gu043wEb8Aucxememj4rPY7TQOcccePV++UZpVYjLlYPkIx2xvvo88rV2L8uu2SvXUFk
 I+QyxFZcUKJSfi2V/rDAuZjf1zaah5ogEZjzkPRd6cwIjs9xQJIbsGj7gOGJ9UVUodk6
 Sko7e2dlMuqLhREAN5/2aqOJZ6hTAZOXt43L0x+8KCZzHQ5T0zuYQGGe0EPe3kZd7vzE
 tmuOAbd9jctovu6v+K1fK8RKQNrYU12tpYhdrdPSpSNeY6gXgv8a865i0xmwOMuw2Z7E
 MF2A==
X-Gm-Message-State: AOAM533h/tHpPdMAaF0fE4zKTEUwP5iQByz0l7rT2La72yc/tQe7VKcf
 1/DB86jtsBYKRJba9hcvewfqCg9d1De+KhPfEBlYoA==
X-Google-Smtp-Source: ABdhPJyOs5MnyDfT6t0oh/QvnAk25du9Vrwpi/BDdEphYsErJfIsa0fucL2u4+tYya8s1jG7F9t7fZCrh8HOKkW5hfY=
X-Received: by 2002:a81:650:0:b0:2f4:cc5b:c510 with SMTP id
 77-20020a810650000000b002f4cc5bc510mr2000284ywg.113.1650479840945; Wed, 20
 Apr 2022 11:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <1650419169-13760-1-git-send-email-quic_abhinavk@quicinc.com>
 <1650419169-13760-11-git-send-email-quic_abhinavk@quicinc.com>
 <d31094f8-c067-567e-3fcb-d2ae31fff3c0@linaro.org>
 <05c75f88-8b76-f931-7162-850827de5baf@quicinc.com>
In-Reply-To: <05c75f88-8b76-f931-7162-850827de5baf@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 20 Apr 2022 21:37:09 +0300
Message-ID: <CAA8EJpoMMRPhuU00JWfGe68qkVrL4-EMqm79so+zagTaW8GSkA@mail.gmail.com>
Subject: Re: [PATCH v2 10/17] drm/msm/dpu: make changes to dpu_encoder to
 support virtual encoder
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
Cc: markyacoub@chromium.org, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 20 Apr 2022 at 20:41, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 4/20/2022 12:44 AM, Dmitry Baryshkov wrote:
> > On 20/04/2022 04:46, Abhinav Kumar wrote:
> >> Make changes to dpu_encoder to support virtual encoder needed
> >> to support writeback for dpu.
> >>
> >> changes in v2:
> >>     - add the writeback parts to dpu_encoder_helper_phys_cleanup
> >>     - rebase on tip of msm-next and fix related dependencies
> >>     - get the writeback blocks directly from RM
> >>
> >> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 71
> >> +++++++++++++++++-------
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  3 +
> >>   2 files changed, 54 insertions(+), 20 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> index 0e31ad3..06b8631 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> @@ -928,6 +928,7 @@ static void
> >> dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >>       struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> >>       int num_lm, num_ctl, num_pp, num_dsc;
> >>       unsigned int dsc_mask = 0;
> >> +    enum dpu_hw_blk_type blk_type;
> >>       int i;
> >>       if (!drm_enc) {
> >> @@ -1009,12 +1010,21 @@ static void
> >> dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >>           phys->hw_pp = dpu_enc->hw_pp[i];
> >>           phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
> >> -        if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
> >> -            phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm,
> >> phys->intf_idx);
> >> +        if (dpu_encoder_get_intf_mode(&dpu_enc->base) ==
> >> INTF_MODE_WB_LINE)
> >> +            blk_type = DPU_HW_BLK_WB;
> >> +        else
> >> +            blk_type = DPU_HW_BLK_INTF;
> >> +
> >> +        if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX) {
> >> +            if (blk_type == DPU_HW_BLK_INTF)
> >> +                phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm,
> >> phys->intf_idx);
> >> +            else if (blk_type == DPU_HW_BLK_WB)
> >> +                phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm,
> >> phys->intf_idx);
> >> +        }
> >> -        if (!phys->hw_intf) {
> >> +        if (!phys->hw_intf && !phys->hw_wb) {
> >>               DPU_ERROR_ENC(dpu_enc,
> >> -                      "no intf block assigned at idx: %d\n", i);
> >> +                      "no intf ow wb block assigned at idx: %d\n", i);
> >
> > or wb
> ack
> >
> >>               return;
> >>           }
> >> @@ -1157,15 +1167,22 @@ static void dpu_encoder_virt_disable(struct
> >> drm_encoder *drm_enc)
> >>       mutex_unlock(&dpu_enc->enc_lock);
> >>   }
> >> -static enum dpu_intf dpu_encoder_get_intf(struct dpu_mdss_cfg *catalog,
> >> +static enum dpu_intf dpu_encoder_get_intf_or_wb(struct dpu_mdss_cfg
> >> *catalog,
> >>           enum dpu_intf_type type, u32 controller_id)
> >>   {
> >>       int i = 0;
> >> -    for (i = 0; i < catalog->intf_count; i++) {
> >> -        if (catalog->intf[i].type == type
> >> -            && catalog->intf[i].controller_id == controller_id) {
> >> -            return catalog->intf[i].id;
> >> +    if (type != INTF_WB) {
> >> +        for (i = 0; i < catalog->intf_count; i++) {
> >> +            if (catalog->intf[i].type == type
> >> +                && catalog->intf[i].controller_id == controller_id) {
> >> +                return catalog->intf[i].id;
> >> +            }
> >> +        }
> >> +    } else {
> >> +        for (i = 0; i < catalog->wb_count; i++) {
> >> +            if (catalog->wb[i].id == controller_id)
> >> +                return catalog->wb[i].id;
> >>           }
> >>       }
> >> @@ -1886,16 +1903,27 @@ void dpu_encoder_helper_phys_cleanup(struct
> >> dpu_encoder_phys *phys_enc)
> >>       dpu_encoder_helper_reset_mixers(phys_enc);
> >> -    for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> >> -        if (dpu_enc->phys_encs[i] &&
> >> phys_enc->hw_intf->ops.bind_pingpong_blk)
> >> -            phys_enc->hw_intf->ops.bind_pingpong_blk(
> >> -                    dpu_enc->phys_encs[i]->hw_intf, false,
> >> -                    dpu_enc->phys_encs[i]->hw_pp->idx);
> >> +    if (phys_enc->hw_wb) {
> >
> > I think this adds a hidden knowledge here. That there is always just a
> > single phys_enc for the WB encoder. I'd still do this cleanup in a loop
> > together with the INTF cleanup.
> alright, I can make this change.
> >
> >> +        /* disable the PP block */
> >> +        if (phys_enc->hw_wb->ops.bind_pingpong_blk)
> >> +            phys_enc->hw_wb->ops.bind_pingpong_blk(phys_enc->hw_wb,
> >> false,
> >> +                    phys_enc->hw_pp->idx);
> >> -        /* mark INTF flush as pending */
> >> -        if (phys_enc->hw_ctl->ops.update_pending_flush_intf)
> >> -
> >> phys_enc->hw_ctl->ops.update_pending_flush_intf(phys_enc->hw_ctl,
> >> -                    dpu_enc->phys_encs[i]->hw_intf->idx);
> >> +        /* mark WB flush as pending */
> >> +        if (phys_enc->hw_ctl->ops.update_pending_flush_wb)
> >> +            phys_enc->hw_ctl->ops.update_pending_flush_wb(ctl,
> >> phys_enc->hw_wb->idx);
> >> +    } else {
> >> +        for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> >> +            if (dpu_enc->phys_encs[i] &&
> >> phys_enc->hw_intf->ops.bind_pingpong_blk)
> >> +                phys_enc->hw_intf->ops.bind_pingpong_blk(
> >> +                        dpu_enc->phys_encs[i]->hw_intf, false,
> >> +                        dpu_enc->phys_encs[i]->hw_pp->idx);
> >> +
> >> +            /* mark INTF flush as pending */
> >> +            if (phys_enc->hw_ctl->ops.update_pending_flush_intf)
> >> +
> >> phys_enc->hw_ctl->ops.update_pending_flush_intf(phys_enc->hw_ctl,
> >> +                        dpu_enc->phys_encs[i]->hw_intf->idx);
> >> +        }
> >>       }
> >>       /* reset the merge 3D HW block */
> >> @@ -2111,6 +2139,9 @@ static int dpu_encoder_setup_display(struct
> >> dpu_encoder_virt *dpu_enc,
> >>       case DRM_MODE_ENCODER_TMDS:
> >>           intf_type = INTF_DP;
> >>           break;
> >> +    case DRM_MODE_ENCODER_VIRTUAL:
> >> +        intf_type = INTF_WB;
> >> +        break;
> >>       }
> >>       WARN_ON(disp_info->num_of_h_tiles < 1);
> >> @@ -2145,11 +2176,11 @@ static int dpu_encoder_setup_display(struct
> >> dpu_encoder_virt *dpu_enc,
> >>           DPU_DEBUG("h_tile_instance %d = %d, split_role %d\n",
> >>                   i, controller_id, phys_params.split_role);
> >> -        phys_params.intf_idx = dpu_encoder_get_intf(dpu_kms->catalog,
> >> +        phys_params.intf_idx =
> >> dpu_encoder_get_intf_or_wb(dpu_kms->catalog,
> >>                                                       intf_type,
> >>                                                       controller_id);
> >
> > I'd prefer to be more explicit here. intf_idx is of type enum dpu_intf,
> > while WBs are enumerated with enum dpu_wb.
> >
> > I's suggest adding a separate phys_params.wb_idx and a
> > dpu_encoder_get_wb() and calling one here depending on intf_type.
> >
> > Then at the dpu_encoder_virt_atomic_mode_set() you don't need to check
> > intf_mode, but get both intf and wb and report an error if none was
> > provided.
>
> Your suggestion is valid and I also thought about it.
>
> Let me explain what prevented me from making the change here and put it
> in a to-do bucket.
>
> 1) This needs a slighly bigger cleanup including the traces, debug
> prints and some helpers as none of them are aware of the wb_idx
>
> 2) Some of the checks need to be adjusted like this one
>
> if (phys_params.intf_idx == INTF_MAX) {
>              DPU_ERROR_ENC(dpu_enc, "could not get intf or wb: type %d,
> id %d\n",
>                            intf_type, controller_id);
>              ret = -EINVAL;
>          }
>
> So, when we have a separate intf_idx and a wb_idx, having either one of
> them is enough . Consider a case where a board has no physical display.
> That would have no intf_idx but wb_idx can be valid.
>
> So i think this needs a little careful cleanup.
>
> Considering that I need to test that out more, I decided that for a
> short-term we can live with the fact that wb_idx is of type enum
> dpu_intf because dpu_encoder layer understands only that.
>
> Let me know if you agree on this separation to go as a follow-up.

Actually both your points vote for the immediate separation rather
than doing it in a follow-up.
For example, if you see an error reported against INTF_2 on a board
where INTF_2 is actually used, you can not determine whether it is an
issue with INTF_2 or with WB_2.

In fact even reporting an error (or a trace) against INTF_NONE (or
INTF_MAX) might be a better option. It would clearly denote that the
issue is related to the non-INTF.

I think we can merge the patch as is, but I'd strongly prefer either
to see an update or a (nearly) immediate followup.

What do you think about an interim solution? We split the
intf_idx/wb_idx in these series, but all the debugging can be updated
later. This way once we see the report against INTF_NONE, we can
deduce that it's WB.

> >
> >>           if (phys_params.intf_idx == INTF_MAX) {
> >> -            DPU_ERROR_ENC(dpu_enc, "could not get intf: type %d, id
> >> %d\n",
> >> +            DPU_ERROR_ENC(dpu_enc, "could not get intf or wb: type
> >> %d, id %d\n",
> >>                             intf_type, controller_id);
> >>               ret = -EINVAL;
> >>           }
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >> index 544a9a4..0b80af4 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >> @@ -11,6 +11,7 @@
> >>   #include "dpu_kms.h"
> >>   #include "dpu_hw_intf.h"
> >> +#include "dpu_hw_wb.h"
> >>   #include "dpu_hw_pingpong.h"
> >>   #include "dpu_hw_ctl.h"
> >>   #include "dpu_hw_top.h"
> >> @@ -165,6 +166,7 @@ enum dpu_intr_idx {
> >>    * @hw_ctl:        Hardware interface to the ctl registers
> >>    * @hw_pp:        Hardware interface to the ping pong registers
> >>    * @hw_intf:        Hardware interface to the intf registers
> >> + * @hw_wb:        Hardware interface to the wb registers
> >>    * @dpu_kms:        Pointer to the dpu_kms top level
> >>    * @cached_mode:    DRM mode cached at mode_set time, acted on in
> >> enable
> >>    * @enabled:        Whether the encoder has enabled and running a mode
> >> @@ -193,6 +195,7 @@ struct dpu_encoder_phys {
> >>       struct dpu_hw_ctl *hw_ctl;
> >>       struct dpu_hw_pingpong *hw_pp;
> >>       struct dpu_hw_intf *hw_intf;
> >> +    struct dpu_hw_wb *hw_wb;
> >>       struct dpu_kms *dpu_kms;
> >>       struct drm_display_mode cached_mode;
> >>       enum dpu_enc_split_role split_role;
> >
> >



-- 
With best wishes
Dmitry
