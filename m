Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E096F22A9
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 05:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAEAF10E36A;
	Sat, 29 Apr 2023 03:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBCF110E269
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Apr 2023 03:21:38 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-b9a6f17f2b6so11914219276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 20:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682738497; x=1685330497;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vDuPzT+GMO6mQpKkfAPvIiAmR/VpbxCnW7e/d+2Ig78=;
 b=MGwrsgr+EFtSSwdx5Uu+gg6i1YIJCk2kVGt7il6TRZAaZKELK02ARtp4XNob+N5VbW
 IjKL8E12AO+cL6wa2qGckU+gLHvX+3VxyvEPDodTBHVyykWWbIHEdaQsRKYCJpsOtaZ+
 I1aN/idagbTTTMQ+yt1xBbaWexIG9FQtW4Qt2H+TEqxVYdgd3rxDZQcc4R02ePhPZI0o
 5tILGhUXiZSU4ONupQMZ2S7FfA5CnioW+zb02q9UHBYTVflMVNFILgGoqOLw+HWSUuRA
 NpJNBi/dB+SvwUKC4suRf7Nfq2uHtcoGZQKST/s/ks4NLwRXKRV/jsK+Sb32wdG8LbUC
 8uHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682738497; x=1685330497;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vDuPzT+GMO6mQpKkfAPvIiAmR/VpbxCnW7e/d+2Ig78=;
 b=bWeF1vdCQDviKdfw/Qt4B5Bm4/5Eo6vmEDOwhCWpjO5NmItfae8KQDPRumaHrz/20m
 Zf3r53H2Gdx3jBv9VZ9lTBpbCFPJmB5PQ/7JJOQwPuq57VtePo5bkIeJQuH4rCndr6Bs
 bNsgDpac6gciKnNhO7s5CKeg3SenADV+2S8pCwre0LzR2fmEXoYVMnDSOHudj+QuPLzI
 A3Oo2SiKRRXYLgmwPJlUyfKBw+Wb64Xt58PZxFAH1Vjl13THtypQ77g+cD7p9u0BC9So
 9UaXlbes3A30OzBa1wN4tpiSJuFJHnCplhZEUd5pduQ5DUEC8lTy1edhW7mjA3xQYvGb
 cGTQ==
X-Gm-Message-State: AC+VfDwUrV1770zi1oeAPOunoQshriZmbeJPq7lDhJe9vG3lWCJKkRQ3
 VwntVFrxtxe0OrqhxuQB3BZNBA/KI0UrGPai+ztPNA==
X-Google-Smtp-Source: ACHHUZ7VPVikCxk0LZ+p2oouNQ5Ar7P6fYdbwVibaqiPI0bVF5QGNkNcl+Yez4v4chqyUB8mb2d8he/FLRSpSfSvpsM=
X-Received: by 2002:a81:1643:0:b0:52e:e90b:5e2 with SMTP id
 64-20020a811643000000b0052ee90b05e2mr8867973yww.1.1682738497388; Fri, 28 Apr
 2023 20:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <1682725511-18185-1-git-send-email-quic_khsieh@quicinc.com>
 <1682725511-18185-6-git-send-email-quic_khsieh@quicinc.com>
 <ad672cff-3355-97af-24b4-3626efebc284@linaro.org>
 <e9f493fa-77f2-0a5b-5e09-bd1baae8a8d0@quicinc.com>
 <772a63ca-9b88-3c98-e769-7e614968c127@linaro.org>
 <09d34749-d571-ed04-9681-4abf48c7f053@quicinc.com>
In-Reply-To: <09d34749-d571-ed04-9681-4abf48c7f053@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 29 Apr 2023 06:21:26 +0300
Message-ID: <CAA8EJpo-+UYv2Roctu=7U09V3u6kJ_q64M1i_R7DBGCGCK=U7A@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] drm/msm/dpu: add DPU_PINGPONG_DSC feature PP_BLK
 and PP_BLK_TE
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, andersson@kernel.org,
 freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, marijn.suijten@somainline.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 29 Apr 2023 at 05:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 4/28/2023 6:41 PM, Dmitry Baryshkov wrote:
> > On 29/04/2023 04:08, Abhinav Kumar wrote:
> >>
> >>
> >> On 4/28/2023 5:45 PM, Dmitry Baryshkov wrote:
> >>> On 29/04/2023 02:45, Kuogee Hsieh wrote:
> >>>> Legacy DPU requires PP hardware block involved into setting up DSC
> >>>
> >>> Nit: to be envolved
> >>>
> >>>> data path. This patch add DDPU_PINGPONG_DSC feature bit to both
> >>>
> >>> adds
> >>>
> >>>> PP_BLK and PP_BLK_TE so that both dpu_hw_pp_setup_dsc() and
> >>>> dpu_hw_pp_dsc_enable() will be executed during DSC path setup.
> >>>
> >>> Would it be easier to add PP_BLK_NO_DSC instead and make DSC enabled
> >>> by default for PP_BLK / PP_BLK_TE?
> >>>
> >>
> >> No because for some chipsets like qcm2290, it has a ping pong block
> >> but no DSC.
> >
> > And so it will use PP_BLK_NO_DSC (like msm8998 for PP_2/_3). But this
>
> Ok so you meant adding another PP_BLK_* macro. I mistook it for a
> feature flag.
>
> This is getting a bit confusing with many PP_BLK_* variations.

Yes. As I wrote it might be not the optimal solution.

>
> > might be not the optimal solution. Let's check all possible cases:
> >
> > - PP (or PP_TE?) with no DSC support,
>
> Yes correct for chipsets like qcm2290.
>
> > - PP/PP_TE tightly bound to the particular DSC instance, should be
> > allocated together,
>
> I need to check which exact chipset does this (I recall one does) but
> perhaps msm8998 fits here.

All targets earlier than sm8150. SDE driver sets SDE_DSC_OUTPUT_CTRL
if for v1 CTL blocks (sm8150+).

>
> > - PP/PP_TE which can use any DSC block.
>
> This is what DPU_PINGPONG_DSC feature flag should mean today and should
> cover most of the DSC 1.1 chipsets present in upstream today.

Then it should probably be renamed to DPU_PINGPONG_ANY_DSC

> > - all PP_DITHER probably support any DSC?
> >
>
> No, PP_DITHER means that there is no DSC in ping-pong block. Its
> actually DSC 1.2. From our standpoint, this is same as PP_BLK_NO_DSC
> then as the PP blk has no DSC. This is where the confusion will come.

But we should still bind the DSC to the PP block, shouldn't we? So
from the software point of view it is the same situation: PP_DITHER
supports any DSC (1.2) and should be bound to it.

> > Is this list correct? If so, we'd need to be able to specify the DSC id
> > in the PP block description.
> >
>
> Is this for the PP bound to a particular DSC case? If so, the goal of
> this is then you want to not allocate DSCs from RM for this case or what
> would be the purpose of specifying the DSC id in the ping-pong?

I think it would be better to still return PP from the RM. It's that
the RM will have to return PP/DSC in pairs.

>
>  From this classification, it looks like this case shall fit
> PP_BLK_NO_DSC but we have to then migrate PP_BLK_DITHER to this as well
> and add dither to that.
>
> Seems like this can be a separate effort to cleanup the PP_BLK_* macros
> first and go with this feature flag first instead of undertaking a
> PP_BLK_* macro cleanup in this series.
>
> >>
> >>>>
> >>>> Reported-by : Marijn Suijten <marijn.suijten@somainline.org>
> >>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >>>> ---
> >>>>   .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    | 12 +++++-----
> >>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  8 +++----
> >>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 26
> >>>> ++++++++++------------
> >>>>   .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 24
> >>>> ++++++++++----------
> >>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 26
> >>>> ++++++++++------------
> >>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  4 ++--
> >>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  2 +-
> >>>>   .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  2 +-
> >>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  8 +++----
> >>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  2 ++
> >>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |  9 +++++---
> >>>>   11 files changed, 62 insertions(+), 61 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> >>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> >>>> index 17f821c..b7cd746 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> >>>> @@ -112,16 +112,16 @@ static const struct dpu_lm_cfg msm8998_lm[] = {
> >>>>   };
> >>>>   static const struct dpu_pingpong_cfg msm8998_pp[] = {
> >>>> -    PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te,
> >>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> >>>> +    PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000,
> >>>> BIT(DPU_PINGPONG_DSC), 0,
> >>>> +            sdm845_pp_sblk_te, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> >>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> >>>> -    PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te,
> >>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> >>>> +    PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800,
> >>>> BIT(DPU_PINGPONG_DSC), 0,
> >>>> +            sdm845_pp_sblk_te, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> >>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> >>>> -    PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, sdm845_pp_sblk,
> >>>> +    PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, 0, sdm845_pp_sblk,
> >>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> >>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> >>>> -    PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, sdm845_pp_sblk,
> >>>> +    PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, 0, sdm845_pp_sblk,
> >>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> >>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> >>>>   };
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> >>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> >>>> index ceca741..8888bd9 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> >>>> @@ -110,16 +110,16 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
> >>>>   };
> >>>>   static const struct dpu_pingpong_cfg sdm845_pp[] = {
> >>>> -    PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te,
> >>>> +    PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000,
> >>>> BIT(DPU_PINGPONG_DSC), 0, sdm845_pp_sblk_te,
> >>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> >>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> >>>> -    PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te,
> >>>> +    PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800,
> >>>> BIT(DPU_PINGPONG_DSC), 0, sdm845_pp_sblk_te,
> >>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> >>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> >>>> -    PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, sdm845_pp_sblk,
> >>>> +    PP_BLK("pingpong_2", PINGPONG_2, 0x71000,
> >>>> BIT(DPU_PINGPONG_DSC), 0, sdm845_pp_sblk,
> >>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> >>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> >>>> -    PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, sdm845_pp_sblk,
> >>>> +    PP_BLK("pingpong_3", PINGPONG_3, 0x71800,
> >>>> BIT(DPU_PINGPONG_DSC), 0, sdm845_pp_sblk,
> >>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> >>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> >>>>   };
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> >>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> >>>> index 42b0e58..3a7dffa 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> >>>> @@ -128,24 +128,22 @@ static const struct dpu_dspp_cfg sm8150_dspp[]
> >>>> = {
> >>>>   };
> >>>>   static const struct dpu_pingpong_cfg sm8150_pp[] = {
> >>>> -    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0,
> >>>> sdm845_pp_sblk,
> >>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> >>>> +    PP_BLK("pingpong_0", PINGPONG_0, 0x70000,
> >>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_0,
> >>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> >>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> >>>> -    PP_BLK("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0,
> >>>> sdm845_pp_sblk,
> >>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> >>>> +    PP_BLK("pingpong_1", PINGPONG_1, 0x70800,
> >>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_0,
> >>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> >>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> >>>> -    PP_BLK("pingpong_2", PINGPONG_2, 0x71000, MERGE_3D_1,
> >>>> sdm845_pp_sblk,
> >>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> >>>> +    PP_BLK("pingpong_2", PINGPONG_2, 0x71000,
> >>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_1,
> >>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> >>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> >>>> -    PP_BLK("pingpong_3", PINGPONG_3, 0x71800, MERGE_3D_1,
> >>>> sdm845_pp_sblk,
> >>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> >>>> +    PP_BLK("pingpong_3", PINGPONG_3, 0x71800,
> >>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_1,
> >>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> >>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> >>>> -    PP_BLK("pingpong_4", PINGPONG_4, 0x72000, MERGE_3D_2,
> >>>> sdm845_pp_sblk,
> >>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> >>>> -            -1),
> >>>> -    PP_BLK("pingpong_5", PINGPONG_5, 0x72800, MERGE_3D_2,
> >>>> sdm845_pp_sblk,
> >>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> >>>> -            -1),
> >>>> +    PP_BLK("pingpong_4", PINGPONG_4, 0x72000,
> >>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_2,
> >>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30), -1),
> >>>> +    PP_BLK("pingpong_5", PINGPONG_5, 0x72800,
> >>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_2,
> >>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31), -1),
> >>>>   };
> >>>>   static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> >>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> >>>> index 5bb9882..e766a2d 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> >>>> @@ -116,23 +116,23 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
> >>>>   };
> >>>>   static const struct dpu_pingpong_cfg sc8180x_pp[] = {
> >>>> -    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0,
> >>>> sdm845_pp_sblk,
> >>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> >>>> +    PP_BLK("pingpong_0", PINGPONG_0, 0x70000,
> >>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_0,
> >>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> >>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> >>>> -    PP_BLK("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0,
> >>>> sdm845_pp_sblk,
> >>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> >>>> +    PP_BLK("pingpong_1", PINGPONG_1, 0x70800,
> >>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_0,
> >>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> >>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> >>>> -    PP_BLK("pingpong_2", PINGPONG_2, 0x71000, MERGE_3D_1,
> >>>> sdm845_pp_sblk,
> >>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> >>>> +    PP_BLK("pingpong_2", PINGPONG_2, 0x71000,
> >>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_1,
> >>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> >>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> >>>> -    PP_BLK("pingpong_3", PINGPONG_3, 0x71800, MERGE_3D_1,
> >>>> sdm845_pp_sblk,
> >>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> >>>> +    PP_BLK("pingpong_3", PINGPONG_3, 0x71800,
> >>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_1,
> >>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> >>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> >>>> -    PP_BLK("pingpong_4", PINGPONG_4, 0x72000, MERGE_3D_2,
> >>>> sdm845_pp_sblk,
> >>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> >>>> +    PP_BLK("pingpong_4", PINGPONG_4, 0x72000,
> >>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_2,
> >>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> >>>>               -1),
> >>>> -    PP_BLK("pingpong_5", PINGPONG_5, 0x72800, MERGE_3D_2,
> >>>> sdm845_pp_sblk,
> >>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> >>>> +    PP_BLK("pingpong_5", PINGPONG_5, 0x72800,
> >>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_2,
> >>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> >>>>               -1),
> >>>>   };
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> >>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> >>>> index ed130582..137b151 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> >>>> @@ -129,24 +129,22 @@ static const struct dpu_dspp_cfg sm8250_dspp[]
> >>>> = {
> >>>>   };
> >>>>   static const struct dpu_pingpong_cfg sm8250_pp[] = {
> >>>> -    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0,
> >>>> sdm845_pp_sblk,
> >>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> >>>> +    PP_BLK("pingpong_0", PINGPONG_0, 0x70000,
> >>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_0,
> >>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> >>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> >>>> -    PP_BLK("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0,
> >>>> sdm845_pp_sblk,
> >>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> >>>> +    PP_BLK("pingpong_1", PINGPONG_1, 0x70800,
> >>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_0,
> >>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> >>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> >>>> -    PP_BLK("pingpong_2", PINGPONG_2, 0x71000, MERGE_3D_1,
> >>>> sdm845_pp_sblk,
> >>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> >>>> +    PP_BLK("pingpong_2", PINGPONG_2, 0x71000,
> >>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_1,
> >>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> >>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> >>>> -    PP_BLK("pingpong_3", PINGPONG_3, 0x71800, MERGE_3D_1,
> >>>> sdm845_pp_sblk,
> >>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> >>>> +    PP_BLK("pingpong_3", PINGPONG_3, 0x71800,
> >>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_1,
> >>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> >>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> >>>> -    PP_BLK("pingpong_4", PINGPONG_4, 0x72000, MERGE_3D_2,
> >>>> sdm845_pp_sblk,
> >>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> >>>> -            -1),
> >>>> -    PP_BLK("pingpong_5", PINGPONG_5, 0x72800, MERGE_3D_2,
> >>>> sdm845_pp_sblk,
> >>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> >>>> -            -1),
> >>>> +    PP_BLK("pingpong_4", PINGPONG_4, 0x72000,
> >>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_2,
> >>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30), -1),
> >>>> +    PP_BLK("pingpong_5", PINGPONG_5, 0x72800,
> >>>> BIT(DPU_PINGPONG_DSC), MERGE_3D_2,
> >>>> +            sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31), -1),
> >>>>   };
> >>>>   static const struct dpu_merge_3d_cfg sm8250_merge_3d[] = {
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> >>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> >>>> index a46b117..e5631a2 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> >>>> @@ -80,8 +80,8 @@ static const struct dpu_dspp_cfg sc7180_dspp[] = {
> >>>>   };
> >>>>   static const struct dpu_pingpong_cfg sc7180_pp[] = {
> >>>> -    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
> >>>> -1, -1),
> >>>> -    PP_BLK("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk,
> >>>> -1, -1),
> >>>> +    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, 0, sdm845_pp_sblk,
> >>>> -1, -1),
> >>>> +    PP_BLK("pingpong_1", PINGPONG_1, 0x70800, 0, 0, sdm845_pp_sblk,
> >>>> -1, -1),
> >>>>   };
> >>>>   static const struct dpu_intf_cfg sc7180_intf[] = {
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> >>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> >>>> index 988d820..7b4ad0f 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> >>>> @@ -60,7 +60,7 @@ static const struct dpu_dspp_cfg sm6115_dspp[] = {
> >>>>   };
> >>>>   static const struct dpu_pingpong_cfg sm6115_pp[] = {
> >>>> -    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
> >>>> +    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, 0, sdm845_pp_sblk,
> >>>>           DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> >>>>           DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> >>>>   };
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> >>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> >>>> index c9003dc..20d4d14 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> >>>> @@ -57,7 +57,7 @@ static const struct dpu_dspp_cfg qcm2290_dspp[] = {
> >>>>   };
> >>>>   static const struct dpu_pingpong_cfg qcm2290_pp[] = {
> >>>> -    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
> >>>> +    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, 0, sdm845_pp_sblk,
> >>>>           DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> >>>>           DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> >>>>   };
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>> index 91bfc8a..83c0cd9 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>> @@ -501,21 +501,21 @@ static const struct dpu_pingpong_sub_blks
> >>>> sc7280_pp_sblk = {
> >>>>       .intr_done = _done, \
> >>>>       .intr_rdptr = _rdptr, \
> >>>>       }
> >>>> -#define PP_BLK_TE(_name, _id, _base, _merge_3d, _sblk, _done,
> >>>> _rdptr) \
> >>>> +#define PP_BLK_TE(_name, _id, _base, _features, _merge_3d, _sblk,
> >>>> _done, _rdptr) \
> >>>>       {\
> >>>>       .name = _name, .id = _id, \
> >>>>       .base = _base, .len = 0xd4, \
> >>>> -    .features = PINGPONG_SDM845_SPLIT_MASK, \
> >>>> +    .features = PINGPONG_SDM845_SPLIT_MASK | _features, \
> >>>>       .merge_3d = _merge_3d, \
> >>>>       .sblk = &_sblk, \
> >>>>       .intr_done = _done, \
> >>>>       .intr_rdptr = _rdptr, \
> >>>>       }
> >>>> -#define PP_BLK(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
> >>>> +#define PP_BLK(_name, _id, _base, _features, _merge_3d, _sblk,
> >>>> _done, _rdptr) \
> >>>>       {\
> >>>>       .name = _name, .id = _id, \
> >>>>       .base = _base, .len = 0xd4, \
> >>>> -    .features = PINGPONG_SDM845_MASK, \
> >>>> +    .features = PINGPONG_SDM845_MASK | _features, \
> >>>>       .merge_3d = _merge_3d, \
> >>>>       .sblk = &_sblk, \
> >>>>       .intr_done = _done, \
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>>> index fc87db1..6b49171 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>>> @@ -144,6 +144,7 @@ enum {
> >>>>    * @DPU_PINGPONG_SPLIT      PP block supports split fifo
> >>>>    * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split
> >>>> fifo
> >>>>    * @DPU_PINGPONG_DITHER,    Dither blocks
> >>>> + * @DPU_PINGPONG_DSC,        PP block binding to DSC
> >>>>    * @DPU_PINGPONG_MAX
> >>>>    */
> >>>>   enum {
> >>>> @@ -152,6 +153,7 @@ enum {
> >>>>       DPU_PINGPONG_SPLIT,
> >>>>       DPU_PINGPONG_SLAVE,
> >>>>       DPU_PINGPONG_DITHER,
> >>>> +    DPU_PINGPONG_DSC,
> >>>>       DPU_PINGPONG_MAX
> >>>>   };
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> >>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> >>>> index 3822e06..f255a04 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> >>>> @@ -264,9 +264,12 @@ static void _setup_pingpong_ops(struct
> >>>> dpu_hw_pingpong *c,
> >>>>       c->ops.get_autorefresh = dpu_hw_pp_get_autorefresh_config;
> >>>>       c->ops.poll_timeout_wr_ptr = dpu_hw_pp_poll_timeout_wr_ptr;
> >>>>       c->ops.get_line_count = dpu_hw_pp_get_line_count;
> >>>> -    c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
> >>>> -    c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
> >>>> -    c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
> >>>> +
> >>>> +    if (features & BIT(DPU_PINGPONG_DSC)) {
> >>>> +        c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
> >>>> +        c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
> >>>> +        c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
> >>>> +    }
> >>>>       if (test_bit(DPU_PINGPONG_DITHER, &features))
> >>>>           c->ops.setup_dither = dpu_hw_pp_setup_dither;
> >>>
> >



-- 
With best wishes
Dmitry
