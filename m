Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D29580A95C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 17:38:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEFE110E0A6;
	Fri,  8 Dec 2023 16:38:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D149910EACF
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 16:38:41 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-5d4f71f7e9fso21734747b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 08:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702053521; x=1702658321; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ji4v7G4p0p7zJuYWPDTvhXpo4RLr1EyE104kr2B7NEU=;
 b=yCcPa8+suWXFF5eIeZAMhsgo1kmxC/JV9vVsKXVWtXXEiv4VMlLGB/Oz7iw5DBmbP6
 Y9k+47K7hTdS2hOBnWvkbHm5G3zEsLSonmC3ptCDaP1C4RjFD+AQoMmkxxe4VdtMYWBh
 lI/zdzHsOBW7slW9RTeiakmMpPRgDq/j58m+ODfXApho9B3sqn5H0lH4eiXStdq1L/YE
 Wz4mC6T36FbFgliWiIJWIxAcOkXWFuZS4HqUtp9ae4Ya4j+uERpFyCp1D7Ipirzp/xHo
 AinIQ+38JvjWyHK+Y+1LRMXf00Mcos/Rw22qiicpy8NWTNe31zHUxSE9bODB23+Sq/lm
 kcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702053521; x=1702658321;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ji4v7G4p0p7zJuYWPDTvhXpo4RLr1EyE104kr2B7NEU=;
 b=NuS5U2t+N6ZtJ1adyMU7iDj1YjB7SjfdSfZWmu01w7snokmPDEvpD0NLcYHOJd1AkC
 giTGns59/P1wwxf2f2q34NPbq+YtJAFW3rPpi/iKa+l4sxL08zgdWQxm0T7gUqZe5q6I
 Vtdb2M+j583MWTZEABkiGt6v/1RxQNsYU3CttmT+/R2ISSFKp5fLZD4X/dCkgnNuZwMF
 h44OFVwvZ9k8gwpNY9L+ch8igBIhOODcZEWOk5ytcweL8PLeQn15CbkbWEAAAf1jEVX/
 7WpTqhvw1B89cC8R7CZga28UZKWFNzXJ0oy8/+M3awItxkHai5qKsXhSbxWZ8T9q/chf
 ZGLA==
X-Gm-Message-State: AOJu0YxxFeyKVAliE+1Mk3qF7ZCPyhdpOFJpAqHNWzkyu2XdU7Ct+3Yg
 Xf5yUKifTwgjm105JmE0D87Kk2JhJZaNdmAyrwq/zQ==
X-Google-Smtp-Source: AGHT+IEvYbq7K1eeqmyuZnnDkuzmbkh66toRMLSzb8ok2h+sAB1ZVWMOBC1b8B8acmgDXqymCAogc6DISZj4odbbYrc=
X-Received: by 2002:a25:b904:0:b0:d9b:2ca7:4cd8 with SMTP id
 x4-20020a25b904000000b00d9b2ca74cd8mr257694ybj.31.1702053520888; Fri, 08 Dec
 2023 08:38:40 -0800 (PST)
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
 <20231208050641.32582-15-quic_abhinavk@quicinc.com>
 <CAA8EJpo4XVMJ7RqsZZ6Eh_PjoPeWiMmAW3P1a4dkZ_EHqz7GkQ@mail.gmail.com>
 <188e0168-a45b-6e38-ac49-8b0fd41e9110@quicinc.com>
In-Reply-To: <188e0168-a45b-6e38-ac49-8b0fd41e9110@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 18:38:30 +0200
Message-ID: <CAA8EJpoVfuybVPddKy2Sn-YsovkbiWmoNa48jKjdpKg4HiJaAg@mail.gmail.com>
Subject: Re: [PATCH v2 14/16] drm/msm/dpu: reserve cdm blocks for writeback in
 case of YUV output
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

On Fri, 8 Dec 2023 at 18:34, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/8/2023 3:54 AM, Dmitry Baryshkov wrote:
> > On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >> Reserve CDM blocks for writeback if the format of the output fb
> >> is YUV. At the moment, the reservation is done only for writeback
> >> but can easily be extended by relaxing the checks once other
> >> interfaces are ready to output YUV.
> >>
> >> changes in v2:
> >>          - use needs_cdm from topology struct
> >>          - drop fb related checks from atomic_mode_set()
> >
> > It looks like this should be squashed with the patch 11. The 'unbind
> > CDM' doesn't really make sense without this patch. We need to allocate
> > it first,  before touching it.
> >
>
> The way I was thinking was that patch just completes the
> dpu_encoder_phys_cleanup() and yes it was intentionally kept ahead
> because that will not kick in till hw_cdm is assigned.
>
> Then, this patch only handles reserving/assignment of hw_cdm when needed.
>
> That was the motivation behind this split.

It leaves a leaf code that is not used at all. There is no need to
cleanup anything if it was not allocated. Please remove the split and
squash it with allocation.

>
> >>
> >> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 27 +++++++++++++++++++++
> >>   1 file changed, 27 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> index 862912727925..a576e3e62429 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> @@ -16,6 +16,7 @@
> >>   #include <drm/drm_crtc.h>
> >>   #include <drm/drm_file.h>
> >>   #include <drm/drm_probe_helper.h>
> >> +#include <drm/drm_framebuffer.h>
> >>
> >>   #include "msm_drv.h"
> >>   #include "dpu_kms.h"
> >> @@ -583,6 +584,7 @@ static int dpu_encoder_virt_atomic_check(
> >>          struct drm_display_mode *adj_mode;
> >>          struct msm_display_topology topology;
> >>          struct dpu_global_state *global_state;
> >> +       struct drm_framebuffer *fb;
> >>          struct drm_dsc_config *dsc;
> >>          int i = 0;
> >>          int ret = 0;
> >> @@ -623,6 +625,22 @@ static int dpu_encoder_virt_atomic_check(
> >>
> >>          topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
> >>
> >> +       /*
> >> +        * Use CDM only for writeback at the moment as other interfaces cannot handle it.
> >> +        * if writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
> >> +        * earlier.
> >> +        */
> >> +       if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
> >> +               fb = conn_state->writeback_job->fb;
> >> +
> >> +               if (fb && DPU_FORMAT_IS_YUV(to_dpu_format(msm_framebuffer_format(fb))))
> >> +                       topology.needs_cdm = true;
> >> +               if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
> >> +                       crtc_state->mode_changed = true;
> >> +               else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
> >> +                       crtc_state->mode_changed = true;
> >> +       }
> >> +
> >>          /*
> >>           * Release and Allocate resources on every modeset
> >>           * Dont allocate when active is false.
> >> @@ -1063,6 +1081,15 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >>
> >>          dpu_enc->dsc_mask = dsc_mask;
> >>
> >> +       if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
> >> +               struct dpu_hw_blk *hw_cdm = NULL;
> >> +
> >> +               dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >> +                                             drm_enc->base.id, DPU_HW_BLK_CDM,
> >> +                                             &hw_cdm, 1);
> >> +               dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
> >> +       }
> >> +
> >>          cstate = to_dpu_crtc_state(crtc_state);
> >>
> >>          for (i = 0; i < num_lm; i++) {
> >> --
> >> 2.40.1
> >>
> >
> >
> > --
> > With best wishes
> >
> > Dmitry



-- 
With best wishes
Dmitry
