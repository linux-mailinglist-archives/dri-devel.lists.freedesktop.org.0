Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFA583F434
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 06:43:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5909810E6D2;
	Sun, 28 Jan 2024 05:43:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC5E10E6D2
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 05:43:22 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-6002a655d77so13716837b3.2
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jan 2024 21:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706420542; x=1707025342; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=egHYO2YboJTsBslYYNSSEBp/RtFeA3wC7dXrTQ5aJHw=;
 b=J4LqfjFvacFZzGdMyTJ2ezXHucOrxQGG7g2JZoUYUfwtUeeJWzeOPvl7T4K6LBkCE0
 giXbdfxS+IvJDjTalWvoOKTYICvfdXOg6QBzxG3nqA8cw1dhr9ynYvRx306NRZBh6bMM
 mWgyGkrDf8B66bEe5HKDHD23scYm7rKGNrL57UN9fKGezFoHg7H+22nqetrh+Hemewci
 60KH+TpPnIdVFYvJw/1H+C9M1yLyG8Pa/i4rjUxwXbPv/NauK07McVoAhe+gSFJJYqED
 q4V4/EUuUl71HzHaWu5+/tfGQ5iLiSJ4BJC1YDKzRBOm0FgkqeiULjMIwa/vIUXy7VO9
 0mug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706420542; x=1707025342;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=egHYO2YboJTsBslYYNSSEBp/RtFeA3wC7dXrTQ5aJHw=;
 b=p+TsW9f+ytFwDnzeQ9M3o7fMO2BwxV4q/e8c8zFPnPdwqJDkmSxIGw781Kt2bbRbuS
 8LPPYu1jahGmeXCzRODz7Y/db0wf+4ruh4TOPkVX/xpOLY9jFZ/UrzOtW1hxFfl+iZ7z
 3TiWJ2fRqqlYeuvkgusDQK5BZ0uGi+r6JMyDMvMtcfJ282HIiMymmm5AiqDyLfrz4OWi
 yeTcghSkOksa4khpQ9kEqEYYOTNjqtUcwNEwujJ35uldAVNaTnRP88d/AaMS11/gbc1T
 nMC0fhCLiO3lkjnULUq0Zom1MWSWkPeVm+g6jv3mFy/GaigU/3/d/tMrw3ENnXybRbwU
 fwpw==
X-Gm-Message-State: AOJu0Yzc3RSnxRv0NGxvvgk1QoByQmhFF6cVHq6SHmhof9OR9iGi1MWe
 GCgEKW5T4fz80YzMC0GFXItrN7eX1IbMGv2ZAkmV6wFt1LXmIC4AyPGaQz3R04uc7dipz4WNNtO
 zOkQP/5EdmlpygmHR1ZePdFP+zwfM9trRT6aAfA==
X-Google-Smtp-Source: AGHT+IHEXKEoNmK/xZGYiIM4abiTi/0eqdVBwVt8tDOs1rt3NYunlgaVXkKWnfWdNbsRqahjtMQaokOFcAXlTA7vMP4=
X-Received: by 2002:a81:b665:0:b0:5ff:483d:d155 with SMTP id
 h37-20020a81b665000000b005ff483dd155mr1827621ywk.99.1706420541796; Sat, 27
 Jan 2024 21:42:21 -0800 (PST)
MIME-Version: 1.0
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-13-quic_parellan@quicinc.com>
 <96cf7370-b825-4ee9-ae17-8a6d72cb02d4@linaro.org>
 <4301fb48-7ed2-9cb4-1280-20524d15266d@quicinc.com>
In-Reply-To: <4301fb48-7ed2-9cb4-1280-20524d15266d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 28 Jan 2024 07:42:10 +0200
Message-ID: <CAA8EJpoJosKpG+BjeyZrpJGReaWiwg=qFGnv+8aCP3VWX4WxzQ@mail.gmail.com>
Subject: Re: [PATCH 12/17] drm/msm/dpu: add support of new peripheral flush
 mechanism
To: Paloma Arellano <quic_parellan@quicinc.com>
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
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, seanpaul@chromium.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 28 Jan 2024 at 07:41, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
>
> On 1/25/2024 1:49 PM, Dmitry Baryshkov wrote:
> > On 25/01/2024 21:38, Paloma Arellano wrote:
> >> From: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >>
> >> Introduce a peripheral flushing mechanism to decouple peripheral
> >> metadata flushing from timing engine related flush.
> >>
> >> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >> ---
> >>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c    |  3 +++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c      | 17 +++++++++++++++++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h      | 10 ++++++++++
> >>   3 files changed, 30 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >> index d0f56c5c4cce9..e284bf448bdda 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >> @@ -437,6 +437,9 @@ static void dpu_encoder_phys_vid_enable(struct
> >> dpu_encoder_phys *phys_enc)
> >>       if (ctl->ops.update_pending_flush_merge_3d &&
> >> phys_enc->hw_pp->merge_3d)
> >>           ctl->ops.update_pending_flush_merge_3d(ctl,
> >> phys_enc->hw_pp->merge_3d->idx);
> >>   +    if (ctl->ops.update_pending_flush_periph &&
> >> phys_enc->hw_intf->cap->type == INTF_DP)
> >> +        ctl->ops.update_pending_flush_periph(ctl,
> >> phys_enc->hw_intf->idx);
> >> +
> >>   skip_flush:
> >>       DPU_DEBUG_VIDENC(phys_enc,
> >>           "update pending flush ctl %d intf %d\n",
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> >> index e76565c3e6a43..bf45afeb616d3 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> >> @@ -39,6 +39,7 @@
> >>   #define   CTL_WB_FLUSH                  0x108
> >>   #define   CTL_INTF_FLUSH                0x110
> >>   #define   CTL_CDM_FLUSH                0x114
> >> +#define   CTL_PERIPH_FLUSH              0x128
> >>   #define   CTL_INTF_MASTER               0x134
> >>   #define   CTL_DSPP_n_FLUSH(n)           ((0x13C) + ((n) * 4))
> >>   @@ -49,6 +50,7 @@
> >>   #define  MERGE_3D_IDX   23
> >>   #define  DSC_IDX        22
> >>   #define CDM_IDX         26
> >> +#define  PERIPH_IDX     30
> >>   #define  INTF_IDX       31
> >>   #define WB_IDX          16
> >>   #define  DSPP_IDX       29  /* From DPU hw rev 7.x.x */
> >> @@ -151,6 +153,10 @@ static inline void
> >> dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
> >>                   ctx->pending_dspp_flush_mask[dspp - DSPP_0]);
> >>           }
> >>   +    if (ctx->pending_flush_mask & BIT(PERIPH_IDX))
> >> +        DPU_REG_WRITE(&ctx->hw, CTL_PERIPH_FLUSH,
> >> +                  ctx->pending_periph_flush_mask);
> >> +
> >>       if (ctx->pending_flush_mask & BIT(DSC_IDX))
> >>           DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH,
> >>                     ctx->pending_dsc_flush_mask);
> >> @@ -311,6 +317,13 @@ static void
> >> dpu_hw_ctl_update_pending_flush_intf_v1(struct dpu_hw_ctl *ctx,
> >>       ctx->pending_flush_mask |= BIT(INTF_IDX);
> >>   }
> >>   +static void dpu_hw_ctl_update_pending_flush_periph(struct
> >> dpu_hw_ctl *ctx,
> >> +        enum dpu_intf intf)
> >
> > I assume this is _v1.
> > Also the argument is misaligned.
> Ack.
> >
> >> +{
> >> +    ctx->pending_periph_flush_mask |= BIT(intf - INTF_0);
> >> +    ctx->pending_flush_mask |= BIT(PERIPH_IDX);
> >> +}
> >> +
> >>   static void dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct
> >> dpu_hw_ctl *ctx,
> >>           enum dpu_merge_3d merge_3d)
> >>   {
> >> @@ -680,6 +693,10 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops
> >> *ops,
> >>           ops->reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;
> >>           ops->update_pending_flush_intf =
> >>               dpu_hw_ctl_update_pending_flush_intf_v1;
> >> +
> >> +        ops->update_pending_flush_periph =
> >> +            dpu_hw_ctl_update_pending_flush_periph;
> >> +
> >>           ops->update_pending_flush_merge_3d =
> >>               dpu_hw_ctl_update_pending_flush_merge_3d_v1;
> >>           ops->update_pending_flush_wb =
> >> dpu_hw_ctl_update_pending_flush_wb_v1;
> >
> > What about the pre-active platforms?
> Pre-active does not need a peripheral flush.

Ack.

> >
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> >> index ff85b5ee0acf8..5d86c560b6d3f 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> >> @@ -122,6 +122,15 @@ struct dpu_hw_ctl_ops {
> >>       void (*update_pending_flush_intf)(struct dpu_hw_ctl *ctx,
> >>           enum dpu_intf blk);
> >>   +    /**
> >> +     * OR in the given flushbits to the cached
> >> pending_(periph_)flush_mask
> >> +     * No effect on hardware
> >> +     * @ctx       : ctl path ctx pointer
> >> +     * @blk       : interface block index
> >> +     */
> >> +    void (*update_pending_flush_periph)(struct dpu_hw_ctl *ctx,
> >> +        enum dpu_intf blk);
> >> +
> >>       /**
> >>        * OR in the given flushbits to the cached
> >> pending_(merge_3d_)flush_mask
> >>        * No effect on hardware
> >> @@ -264,6 +273,7 @@ struct dpu_hw_ctl {
> >>       u32 pending_flush_mask;
> >>       u32 pending_intf_flush_mask;
> >>       u32 pending_wb_flush_mask;
> >> +    u32 pending_periph_flush_mask;
> >>       u32 pending_merge_3d_flush_mask;
> >>       u32 pending_dspp_flush_mask[DSPP_MAX - DSPP_0];
> >>       u32 pending_dsc_flush_mask;
> >



-- 
With best wishes
Dmitry
