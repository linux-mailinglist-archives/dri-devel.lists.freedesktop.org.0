Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D54A96FA3C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 19:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043E510EABA;
	Fri,  6 Sep 2024 17:59:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jKX985g5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1EB10EABB
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 17:59:03 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-690aabe2600so20978747b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2024 10:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725645543; x=1726250343; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Vwf8azTfLEVwrk4q0ZONZxCGFEEyLJBGTlFqLltUinM=;
 b=jKX985g5nC06xw2qdRoLxGZQNM3M9BQz25qDPg4TmH5G42q41RkrVh+SasPPYIyOMP
 cdOyua8Y5Aht4Jlsx6w9YpC2Y5h5qjgu81KIjVZ/quxZkGtH2VMBxtNQX5G01LGKan8f
 XTmGVg9225Ng914eOeFp8vlgG6i/9q2x7EmPeYKlPzzKlABFZzNyKFWd95FeN92l3uT/
 wMkOn5F21T9xq5hJHOR3N/IS/bQuJw8ma/7lbMn2I9O8hz7c7mLZD+ryj9OOmSRSIFa+
 VNYAwNWi+g8QRQW1Z5li/ScI78dSRLk+zRCYpOERVNEeYmzLEzR15HPSVfIUp9+v8Ypu
 tTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725645543; x=1726250343;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vwf8azTfLEVwrk4q0ZONZxCGFEEyLJBGTlFqLltUinM=;
 b=X6C9COoE5Ku7qnniRrX3pgt+cBI5yOodU9kCisBLO4s/EX+WTZFDgZ0GbF7u909UnS
 9JsNuc4+R/cPGCCwSa6+hV7RpHqNs2iawDy3hlcG+c+2SjCEBOq4Kfbg8E7/pPSCPgD1
 TNJGvfJvIDhTk/zRsKjoL641NdanVumaZ14YfWtSVzADMTbzcYpbfVSfhvf+BidmDAFU
 5mfQ8VrsuVlOKK2ln+DSIp7Ti1fyGNnyLUsMOYkiRbE8SRMEwRiJ+Ftlt4E8+OQfB3wg
 h4YNP2j4AN7Mog8ShOQBZ1KDCz+t9J98HRJnTqeAhxPEGU9XbRWOTWTp1Gsa8XguQH8T
 6x+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHYmYGdXZ5OO4Q9whjq9yicvsDaggLtU7UjVsAQGVDifoOHviLlgcrNRUG2456GB/+4b2qdEzP3jI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoopUkXX0HNqOSW0+Rs5tUbuEz1BS402EWr6pDg3t4mbf5lfPH
 UdET0Sm+vsRtIuDPJkmAdDfQbWxT+4WaC3nz5D8hjHcK9rHi/Ov69LcJ9lNEV0WPZRfO4d9CqmT
 TqIrbZCUTXcwBOb1Evqp0j+9DxDh2TdIza4HN1Q==
X-Google-Smtp-Source: AGHT+IFBvQgRTrcRyOEcfyewGa8BnP2XgpounWsqP29P1vhUU1KHc53htPzaUA3ZTCanCcbw/qeNziQdToJ9jrVBlzI=
X-Received: by 2002:a05:690c:c89:b0:6d3:a447:24c7 with SMTP id
 00721157ae682-6db45273f7amr46641107b3.44.1725645542684; Fri, 06 Sep 2024
 10:59:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-11-502b16ae2ebb@quicinc.com>
 <pf6xgu7yjanzjigfpupons4ud6jbcmbr5icnd7yur6qhh3n5sf@plj4bi3beguw>
 <665da6e9-d9f3-4a28-a53b-0f467967fc78@quicinc.com>
 <CAA8EJpo0X7yRaqYV-tTco9+9WyexiPN_ey8hKivFrE3jTojUpg@mail.gmail.com>
 <0e5dc874-0b50-4a6b-ba98-83cb01f7cce6@quicinc.com>
 <7ya6xrvbhdqddkglzzj6mtdxn735j56quguhohd5oid7vqut2w@wygb7ryzkj4r>
 <3c9a6196-ad51-4ed5-b242-cc1e0eec42fc@quicinc.com>
In-Reply-To: <3c9a6196-ad51-4ed5-b242-cc1e0eec42fc@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 6 Sep 2024 20:58:51 +0300
Message-ID: <CAA8EJpqdtK_GG-p1b4WNBAbmdnu-Nt5Z17HHnNeUyL25C0wW=w@mail.gmail.com>
Subject: Re: [PATCH 11/21] drm/msm/dpu: Add RM support for allocating CWB
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Rob Clark <robdclark@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 6 Sept 2024 at 19:53, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
>
>
> On 9/5/2024 6:30 AM, Dmitry Baryshkov wrote:
> > On Tue, Sep 03, 2024 at 06:04:13PM GMT, Jessica Zhang wrote:
> >>
> >>
> >> On 8/30/2024 3:16 PM, Dmitry Baryshkov wrote:
> >>> On Fri, 30 Aug 2024 at 22:28, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 8/30/2024 10:18 AM, Dmitry Baryshkov wrote:
> >>>>> On Thu, Aug 29, 2024 at 01:48:32PM GMT, Jessica Zhang wrote:
> >>>>>> Add support for allocating the concurrent writeback mux as part of the
> >>>>>> WB allocation
> >>>>>>
> >>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >>>>>> ---
> >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  5 ++++-
> >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 30 +++++++++++++++++++++++++++--
> >>>>>>     2 files changed, 32 insertions(+), 3 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >>>>>> index c17d2d356f7a..c43cb55fe1d2 100644
> >>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >>>>>> @@ -1,5 +1,7 @@
> >>>>>>     /* SPDX-License-Identifier: GPL-2.0-only */
> >>>>>> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> >>>>>> +/*
> >>>>>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> >>>>>> + * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> >>>>>>      */
> >>>>>>
> >>>>>>     #ifndef _DPU_HW_MDSS_H
> >>>>>> @@ -352,6 +354,7 @@ struct dpu_mdss_color {
> >>>>>>     #define DPU_DBG_MASK_DSPP     (1 << 10)
> >>>>>>     #define DPU_DBG_MASK_DSC      (1 << 11)
> >>>>>>     #define DPU_DBG_MASK_CDM      (1 << 12)
> >>>>>> +#define DPU_DBG_MASK_CWB      (1 << 13)
> >>>>>>
> >>>>>>     /**
> >>>>>>      * struct dpu_hw_tear_check - Struct contains parameters to configure
> >>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >>>>>> index bc99b04eae3a..738e9a081b10 100644
> >>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >>>>>> @@ -1,9 +1,10 @@
> >>>>>>     // SPDX-License-Identifier: GPL-2.0-only
> >>>>>>     /*
> >>>>>>      * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
> >>>>>> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> >>>>>> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> >>>>>>      */
> >>>>>>
> >>>>>> +#include <drm/drm_managed.h>
> >>>>>>     #include "msm_drv.h"
> >>>>>>     #define pr_fmt(fmt)        "[drm:%s] " fmt, __func__
> >>>>>>     #include "dpu_kms.h"
> >>>>>> @@ -34,6 +35,7 @@ int dpu_rm_init(struct drm_device *dev,
> >>>>>>                void __iomem *mmio)
> >>>>>>     {
> >>>>>>        int rc, i;
> >>>>>> +    struct dpu_hw_blk_reg_map *cwb_reg_map;
> >>>>>>
> >>>>>>        if (!rm || !cat || !mmio) {
> >>>>>>                DPU_ERROR("invalid kms\n");
> >>>>>> @@ -100,11 +102,35 @@ int dpu_rm_init(struct drm_device *dev,
> >>>>>>                rm->hw_intf[intf->id - INTF_0] = hw;
> >>>>>>        }
> >>>>>>
> >>>>>> +    if (cat->cwb_count > 0) {
> >>>>>> +            cwb_reg_map = drmm_kzalloc(dev,
> >>>>>> +                            sizeof(*cwb_reg_map) * cat->cwb_count,
> >>>>>> +                            GFP_KERNEL);
> >>>>>
> >>>>> Please move CWB block pointers to dpu_rm. There is no need to allocate a
> >>>>> separate array.
> >>>>
> >>>> Hi Dmitry,
> >>>>
> >>>> Sorry, I'm not sure what you mean here. Can you clarify your comment?
> >>>>
> >>>> This is just allocating an array of the CWB register addresses so that
> >>>> the hw_wb block can use it to configure the CWB mux registers.
> >>>
> >>> Excuse me. I asked to make the cwb_reg_map array a part of the
> >>> existing dpu_rm structure. This way other subblocks can access it
> >>> through dpu_rm API.
> >>
> >> Got it, thanks for the clarification. Just wondering, is the intent here to
> >> add CWB to rm's get_assigned_resourced?
> >>
> >> The CWB registers will be handled by hw_wb and isn't referenced anywhere
> >> outside of hw_wb (aside from when it's being allocated and passed into
> >> hw_wb_init) so I'm not sure what's the benefit of adding it to the dpu_rm
> >> struct.
> >
> > To have a single point where all the blocks are handled, pretty much
> > like we have a single catalog where all blocks are allocated. Note how
> > e.g. how MERGE_3D is handled. Or how we return harware instances for
> > INTF or WB.
>
> Got it, seems like you're leaning towards having CWB as a completely
> independent hardware block with its own dpu_hw_cwb file and struct.
>
> FWIW, we did consider this approach at the very beginning, but decided
> to go with having the CWB registers configured by dpu_hw_wb under the
> hood because we thought it would be overkill to create a completely new
> struct just to program 2 registers via 1 function op.
>
> We ended up adding the CWB mux programming to dpu_hw_wb because CWB is
> closely tied with WB and it mirrored how downstream code was programming
> CWB mux [1]
>
> If you prefer to have CWB mux completely independent, I can switch to
> that instead.

Well, I'd suggest to check a separate single-function interface
approach. The reason is pretty simple: for DPU 3.x/4.x we'd need a
completely different programming approach. And if at some point we
will consider going for an sblk / non-sblk implementation for DPU 8.x+
/ 5.x-7.x we'd also need to change that. Thus I think it's better to
have less ties between hw_wb and hw_cwb.

>
> [1]
> https://android.googlesource.com/kernel/msm-extra/display-drivers/+/e18d8e759a344ad4d86b31bbf8160cfe4c65b772/msm/sde/sde_hw_wb.c#265
>
> >
> >>
> >>>
> >>>>
> >>>> Thanks,
> >>>>
> >>>> Jessica Zhang
> >>>>
> >>>>>
> >>>>>> +
> >>>>>> +            if (!cwb_reg_map) {
> >>>>>> +                    DPU_ERROR("failed cwb object creation\n");
> >>>>>> +                    return -ENOMEM;
> >>>>>> +            }
> >>>>>> +    }
> >>>>>> +
> >>>>>> +
> >>>>>> +    for (i = 0; i < cat->cwb_count; i++) {
> >>>>>> +            struct dpu_hw_blk_reg_map *cwb = &cwb_reg_map[i];
> >>>>>> +
> >>>>>> +            cwb->blk_addr = mmio + cat->cwb[i].base;
> >>>>>> +            cwb->log_mask = DPU_DBG_MASK_CWB;
> >>>>>> +    }
> >>>>>> +
> >>>>>>        for (i = 0; i < cat->wb_count; i++) {
> >>>>>>                struct dpu_hw_wb *hw;
> >>>>>>                const struct dpu_wb_cfg *wb = &cat->wb[i];
> >>>>>>
> >>>>>> -            hw = dpu_hw_wb_init(dev, wb, mmio, cat->mdss_ver);
> >>>>>> +            if (cat->cwb)
> >>>>>> +                    hw = dpu_hw_wb_init_with_cwb(dev, wb, mmio,
> >>>>>> +                                    cat->mdss_ver, cwb_reg_map);
> >>>>>> +            else
> >>>>>> +                    hw = dpu_hw_wb_init(dev, wb, mmio, cat->mdss_ver);
> >>>>>> +
> >>>>>>                if (IS_ERR(hw)) {
> >>>>>>                        rc = PTR_ERR(hw);
> >>>>>>                        DPU_ERROR("failed wb object creation: err %d\n", rc);
> >>>>>>
> >>>>>> --
> >>>>>> 2.34.1
> >>>>>>
> >>>>>
> >>>>> --
> >>>>> With best wishes
> >>>>> Dmitry
> >>>
> >>>
> >>>
> >>> --
> >>> With best wishes
> >>> Dmitry
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry
