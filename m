Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1297D8005C1
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 09:36:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203FD10E810;
	Fri,  1 Dec 2023 08:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E85B10E810
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 08:36:13 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-5cfc3a48ab2so20378007b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Dec 2023 00:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701419772; x=1702024572; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MtZ5IdIBvkCmVfZiZm9xTlVCWifoa/NZ8bzDIOX3Xng=;
 b=SNfm0+3hGv7gwBwfjDdqVwsc33KiACnCjSkz2PCI7HXEzX8cUMhj2Ru1eZ5Rp/eNPA
 SFtxj1s/mq4guFKqgJ4/ia31vEF0UVTLBa01CqCrDAaVX/O7xOsgO1bm8Qc3FhdMd160
 zBK822ATqNWFvywoYV1jekj91eT9ACZQ2gapC+pvElsL6BmFlXs8B1boXKTYtzIZfdDJ
 HzEBKy/FsJ1JOx+Dyy9ciANFlCoNZ9673z78+POpGYSXjARcmd/SamBzL0EfanMsisyB
 RH3dzO1KzrbPh1rbMu0Tyrm4HjzniO2jQUUE8JqhlGqtgFjuqpJItkXo8WcQWLQMOaZf
 HU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701419772; x=1702024572;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MtZ5IdIBvkCmVfZiZm9xTlVCWifoa/NZ8bzDIOX3Xng=;
 b=tokFci/vIYbxnby6hPfcrKK4uEoBJTkiC32Eyf5456wmnAJxdRUXSSEjN7fnj8YdV9
 +egCpSV5FO6PMmB4vyTLFq0OcLN/EEWe8miknmr6EFsLbWnZUW49mG4hvqSEi/CapJ4F
 eqweFxv4PETO1rZc0WLrZ32ROic6Xal7BKxUOZawFrhsa7OEmCy+0pHVP4OGsIGvwseM
 SgXgmBigJL/B+cLHleRTUsnrYoL0WUlGEVfuayvJuCFcc5/k+qEXgLlW5M6NEv0Ytbor
 I5djerpQJS5GCIpfLyzLiqcxJzjjIVeLmlpBz+0rJzauKjoeFfFbFRSSNdVIUInk+npA
 cR2g==
X-Gm-Message-State: AOJu0YwxQMBy67mKOgLHEyllrDI4BZxoAGMCL2CF32ucKTokALXTJOFk
 m1YP+2D/BjXH9JfEkrWr2LifFQEXIT//9fue1sRYwA==
X-Google-Smtp-Source: AGHT+IFMKwL0EhOV6pMJyoqRG37zW+mNZpW1h9u5bFubBHrQFVO1YAmlDYEKlF7TviFe0+hAEAjElbTHB1G3GbvZyuA=
X-Received: by 2002:a81:4e86:0:b0:5d3:ba75:758d with SMTP id
 c128-20020a814e86000000b005d3ba75758dmr3335760ywb.2.1701419772391; Fri, 01
 Dec 2023 00:36:12 -0800 (PST)
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-11-quic_abhinavk@quicinc.com>
 <CAA8EJpoUDjTEytGnx0NUKD_grY=azoXgm_sqwNBJVTD7LwCe0g@mail.gmail.com>
 <5c16e398-4010-718b-d91d-5fc3781b9c0a@quicinc.com>
In-Reply-To: <5c16e398-4010-718b-d91d-5fc3781b9c0a@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 1 Dec 2023 10:36:01 +0200
Message-ID: <CAA8EJpob=mmo1LsyOydMV8RTChYA5P41s1H4xfxkqjRLBWscwQ@mail.gmail.com>
Subject: Re: [PATCH 10/16] drm/msm/dpu: add support to disable CDM block
 during encoder cleanup
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

On Fri, 1 Dec 2023 at 01:58, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 8/30/2023 5:14 PM, Dmitry Baryshkov wrote:
> > On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >> In preparation of setting up CDM block, add the logic to disable it
> >> properly during encoder cleanup.
> >>
> >> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 8 ++++++++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h | 2 ++
> >>   2 files changed, 10 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> index 582680804016..1b1e07292a9e 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> @@ -26,6 +26,7 @@
> >>   #include "dpu_hw_dspp.h"
> >>   #include "dpu_hw_dsc.h"
> >>   #include "dpu_hw_merge3d.h"
> >> +#include "dpu_hw_cdm.h"
> >>   #include "dpu_formats.h"
> >>   #include "dpu_encoder_phys.h"
> >>   #include "dpu_crtc.h"
> >> @@ -2097,6 +2098,13 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
> >>                                          phys_enc->hw_pp->merge_3d->idx);
> >>          }
> >>
> >> +       if (phys_enc->hw_cdm && phys_enc->hw_cdm->ops.bind_pingpong_blk && phys_enc->hw_pp) {
> >> +               phys_enc->hw_cdm->ops.bind_pingpong_blk(phys_enc->hw_cdm,
> >> +                                                       false, phys_enc->hw_pp->idx);
> >
> > But it was already bound in the cdm->enable, wasn't it?

Yes :-(

> >
>
> This is disable. I think you missed the "false" parameter.
>
> > Also the update_pending_flush_cdm should be called even for DPU < 5.0,
> > where there should be no bind_pingpong_blk callback.
> >
>
> Ack. This is a good catch!
>
> >> +               if (phys_enc->hw_ctl->ops.update_pending_flush_cdm)
> >> +                       phys_enc->hw_ctl->ops.update_pending_flush_cdm(phys_enc->hw_ctl);
> >> +       }
> >> +
> >>          if (dpu_enc->dsc) {
> >>                  dpu_encoder_unprep_dsc(dpu_enc);
> >>                  dpu_enc->dsc = NULL;
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >> index 24dbc28be4f8..510c1c41ddbc 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >> @@ -150,6 +150,7 @@ enum dpu_intr_idx {
> >>    * @hw_pp:             Hardware interface to the ping pong registers
> >>    * @hw_intf:           Hardware interface to the intf registers
> >>    * @hw_wb:             Hardware interface to the wb registers
> >> + * @hw_cdm:            Hardware interface to the CDM registers
> >>    * @dpu_kms:           Pointer to the dpu_kms top level
> >>    * @cached_mode:       DRM mode cached at mode_set time, acted on in enable
> >>    * @enabled:           Whether the encoder has enabled and running a mode
> >> @@ -178,6 +179,7 @@ struct dpu_encoder_phys {
> >>          struct dpu_hw_pingpong *hw_pp;
> >>          struct dpu_hw_intf *hw_intf;
> >>          struct dpu_hw_wb *hw_wb;
> >> +       struct dpu_hw_cdm *hw_cdm;
> >>          struct dpu_kms *dpu_kms;
> >>          struct drm_display_mode cached_mode;
> >>          enum dpu_enc_split_role split_role;
> >> --
> >> 2.40.1
> >>
> >
> >



-- 
With best wishes
Dmitry
