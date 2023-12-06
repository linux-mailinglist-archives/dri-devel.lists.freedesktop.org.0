Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B74807B48
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 23:24:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A2610E7CA;
	Wed,  6 Dec 2023 22:24:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DC510E7CA
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 22:24:08 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-db5311eab29so345105276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Dec 2023 14:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701901447; x=1702506247; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OFW1BtHzKKyWMjTKsTgJeCE0JqHRAauG27klyOmROjc=;
 b=VSLIPRdszbMucuES9w9tL9sNrPBhhtE0q0ZaKNLN5ZKiuZ4+N4/wfE4DLzBGgnI7Oc
 6QsIjDreX6YVgr8ae88sICFFUO5LNMq4rtybAC1Cw1fy7JStJbo75HeS5WdGgBIpQaYa
 X2WprmzHt0KQUdIb70Yc82dBMFLTzI3X1hzPEC2sgADm6FSB4kELXn71E1ckBWDUFOJM
 P5ZETT7VXFlRU/ZHb9FmVAOj56phuPCoK170qrfxtmTr4WaRre36KUCRYohbx9ANEAJO
 rjzYVQHQFMCFqGPUppUGz/qKyv9YfVOtrDfkYwwVSi3YMsHLrTf9mw675efh75ZxzK0k
 wDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701901447; x=1702506247;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OFW1BtHzKKyWMjTKsTgJeCE0JqHRAauG27klyOmROjc=;
 b=EQb4grsxlP9TlH50QuqCRkgRHyVhDeBEj0gZPlnK2in+C27GmfF53Z5vPi4VjYtmJJ
 MpezLmaYZQ2JsR1KKRTBiz+/8O0h+0w5grT2UFSbYK1nbuK/VChyvmvTDf2APHMGaR9V
 sHHEiAjL9paR7IHJZsZGNjj1jjeEUTdzN5yFmWcArdzD31cFI/gFWfuWxWySZc5iZ2z1
 a7BTZVQr/zC3rixhn+a3EQK90mxzu3EV2+XBiQPWkf9qoyKkIFS4AMUvUi4Am7WUpAih
 ZYMUf+bwSjx+WZYb4lyYrz1zkU2PrGVuXyg8JmVwdbGeEz5nlNSACSSg5nrYIrGV7mby
 jEwA==
X-Gm-Message-State: AOJu0YxO5RWmHsIv0+wZrkbqmWK5nAsrkMQVz98GTqNRtyyLsVkgWpad
 BhT/D2a2ceIR5xZXhl9expQOLI7UXx6PN/La+5WPXw==
X-Google-Smtp-Source: AGHT+IEHcerkxXFp1Wf9mkkpYSruKLDzVFs7vUbnsFJMGyrEWX2GOTzqPWBuAvK/kL7CD3Fu11efxf1XOn9R17miGKI=
X-Received: by 2002:a25:8102:0:b0:db5:3f84:25f4 with SMTP id
 o2-20020a258102000000b00db53f8425f4mr1484992ybk.65.1701901447301; Wed, 06 Dec
 2023 14:24:07 -0800 (PST)
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-8-quic_abhinavk@quicinc.com>
 <CAA8EJpoRcdHtyp3mym5HB2A=O6V4qUNTpnMkvm+OiSt7nHuXJw@mail.gmail.com>
 <5bcbb092-1d29-f795-3be4-5ab1c708cba0@quicinc.com>
 <27074b58-25ed-dbcc-1048-dbd9ba3135c9@quicinc.com>
In-Reply-To: <27074b58-25ed-dbcc-1048-dbd9ba3135c9@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Dec 2023 00:23:56 +0200
Message-ID: <CAA8EJppKG=Jxd1rh3UB4qUhrVW2SYOiwBiXum-RD-10T63yPmg@mail.gmail.com>
Subject: Re: [PATCH 07/16] drm/msm/dpu: add cdm blocks to RM
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

On Wed, 6 Dec 2023 at 23:02, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 11/30/2023 3:47 PM, Abhinav Kumar wrote:
> >
> >
> > On 8/30/2023 4:48 PM, Dmitry Baryshkov wrote:
> >> On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar
> >> <quic_abhinavk@quicinc.com> wrote:
> >>>
> >>> Add the RM APIs necessary to initialize and allocate CDM
> >>> blocks by the rest of the DPU pipeline.
> >>
> >> ... to be used by the rest?
> >>
> >
> > Yes, thanks.
> >
> >
> >>>
> >>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>> ---
> >>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 17 +++++++++++++++++
> >>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  2 ++
> >>>   2 files changed, 19 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >>> index f9215643c71a..7b6444a3fcb1 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >>> @@ -8,6 +8,7 @@
> >>>   #include "dpu_kms.h"
> >>>   #include "dpu_hw_lm.h"
> >>>   #include "dpu_hw_ctl.h"
> >>> +#include "dpu_hw_cdm.h"
> >>>   #include "dpu_hw_pingpong.h"
> >>>   #include "dpu_hw_sspp.h"
> >>>   #include "dpu_hw_intf.h"
> >>> @@ -90,6 +91,9 @@ int dpu_rm_destroy(struct dpu_rm *rm)
> >>>                  }
> >>>          }
> >>>
> >>> +       if (rm->cdm_blk)
> >>> +               dpu_hw_cdm_destroy(to_dpu_hw_cdm(rm->cdm_blk));
> >>> +
> >>>          for (i = 0; i < ARRAY_SIZE(rm->hw_wb); i++)
> >>>                  dpu_hw_wb_destroy(rm->hw_wb[i]);
> >>>
> >>> @@ -240,6 +244,19 @@ int dpu_rm_init(struct dpu_rm *rm,
> >>>                  rm->hw_sspp[sspp->id - SSPP_NONE] = hw;
> >>>          }
> >>>
> >>> +       if (cat->cdm) {
> >>> +               struct dpu_hw_cdm *hw;
> >>> +
> >>> +               hw = dpu_hw_cdm_init(cat->cdm, mmio);
> >>> +               /* CDM is optional so no need to bail out */
> >>> +               if (IS_ERR(hw)) {
> >>> +                       rc = PTR_ERR(hw);
> >>> +                       DPU_DEBUG("failed cdm object creation: err
> >>> %d\n", rc);
> >>
> >> No. If it is a part of the catalog, we should fail here as we do in
> >> other cases.
> >>
> >
> > I guess, the only reason for not failing here was other hw blocks are
> > needed even for basic display to come up but cdm is only for YUV formats.
> >
> > Thats the only reason to mark this a failure which is "OK" to ignore.
> >
> > But I see your point that if someone is listing this in the catalog but
> > still RM fails thats an error.
> >
> > Hence, ack.
> >
> >>
> >>> +               } else {
> >>> +                       rm->cdm_blk = &hw->base;
> >>> +               }
> >>> +       }
> >>> +
> >>>          return 0;
> >>>
> >>>   fail:
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> >>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> >>> index 2b551566cbf4..29b221491926 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> >>> @@ -22,6 +22,7 @@ struct dpu_global_state;
> >>>    * @hw_wb: array of wb hardware resources
> >>>    * @dspp_blks: array of dspp hardware resources
> >>>    * @hw_sspp: array of sspp hardware resources
> >>> + * @cdm_blk: cdm hardware resource
> >>>    */
> >>>   struct dpu_rm {
> >>>          struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
> >>> @@ -33,6 +34,7 @@ struct dpu_rm {
> >>>          struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
> >>>          struct dpu_hw_blk *dsc_blks[DSC_MAX - DSC_0];
> >>>          struct dpu_hw_sspp *hw_sspp[SSPP_MAX - SSPP_NONE];
> >>> +       struct dpu_hw_blk *cdm_blk;
> >>
> >> struct dpu_hw_cdm *cdm (or cdm_blk), please.
> >
> > Ack.
> >
>
> I was going through this more. I think its better we leave this as a
> dpu_hw_blk because if you see the other blks in struct dpu_rm, all the
> blocks which are allocated dynamically / can change dynamically are of
> dpu_hw_blk type. That way the dpu_rm_get_assigned_resources() remains
> generic. Hence I would prefer to leave it this way.

Ack

>
> >>
> >>>   };
> >>>
> >>>   /**
> >>> --
> >>> 2.40.1
> >>>
> >>
> >>
> >> --
> >> With best wishes
> >> Dmitry



-- 
With best wishes
Dmitry
