Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF836F719D
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 19:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45CF010E0D7;
	Thu,  4 May 2023 17:53:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC2E10E1AB
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 17:53:45 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-b9d9dad9edfso1141256276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 May 2023 10:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683222824; x=1685814824;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DleFQq1oL9r36GMXOPBcUsW/20e1e8t7I+9BlpN+sCk=;
 b=nSKYERY581rq0+fH1rj/XgdvvW1miOwKrorm++ur/riaFolZ8Qu8RxY1zJdm3iHl16
 xrcyqU0nkodV+b/acpd8NbVq4V5F0kt83HDegFSQCJnf0cuftENIO9Qu1BYCnk+bYZDw
 8BUUr/qBDWO2YegH22muuKGbSXYIIHMNJcQ0E2w32C1l/Xf1UXpJQlEgyiat/h+yz+ov
 c/p44/TA+Dxxal4cOy4PMh//Z/cj5rL8bu5eer+Cov79cyvYYYhgbqOYnr+PyfCpHkQ/
 1nN5IoIxo+XH/GoCi0JOC/j23YUF6jHM2g7EJXsXyqG9xTmAagGe9whv3ahQOQ9bE0ST
 Tttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683222824; x=1685814824;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DleFQq1oL9r36GMXOPBcUsW/20e1e8t7I+9BlpN+sCk=;
 b=FqvEEmuNmvBqtc8cjLMtG+tVHNs8U9IuZudaRTXQ1NkJfKFLmdKX1+Nby8dJTX2OA/
 dppJ1RP8/NiiwaDzBZrPtwPlcyQLLnZDtMT2NEVvdsqy/UeZe5ZqcsfNTTb5ykS/VN0W
 SdUREgiiycG3AJrqXj100+QSw2ALTOkkRDylZAxf3gJ6kqBeO12LYUAJo8KEsWt6uBa+
 viG/8KGsUb1XeX24eyiHrbkvyuqdbqZeFN/yVHQs+0AJJQo1ciWp8PyhWJAaM/bWk3Lu
 64OW3AIoREZHCaaUduO4LY4XIS9ACT0lMU7vHFMHM/DrWLTGranpjMdWcP7o13aHhYlg
 0pag==
X-Gm-Message-State: AC+VfDxMiIh2H05QzB/090yx922lNz2mluUciB2pe6zYMJRNMzDkHxUL
 XvsPUTRIhdq5J47kxujR7srl3tT2bav3YuBIq0xxAw==
X-Google-Smtp-Source: ACHHUZ79fDJqpGmfrZECGd1NEh1tSyAcxGKREgdkcAlZ4KJyY0q2AkOClWG+ulUUzuGAJAXThrIcJ9RZi7O4tHeOijE=
X-Received: by 2002:a25:2590:0:b0:b9e:8172:5860 with SMTP id
 l138-20020a252590000000b00b9e81725860mr756576ybl.20.1683222824564; Thu, 04
 May 2023 10:53:44 -0700 (PDT)
MIME-Version: 1.0
References: <1683218805-23419-1-git-send-email-quic_khsieh@quicinc.com>
 <1683218805-23419-4-git-send-email-quic_khsieh@quicinc.com>
 <ljt5mp4ew5lcrrrdd7xyof3jv3friafbmr3im35ddwxjc42ekh@toez7xfdreg2>
In-Reply-To: <ljt5mp4ew5lcrrrdd7xyof3jv3friafbmr3im35ddwxjc42ekh@toez7xfdreg2>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 4 May 2023 20:53:33 +0300
Message-ID: <CAA8EJpreM9i3DUp+93K7p14f_tNMy-m+C-WdyN5_drmmkGV66g@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] drm/msm/dpu: add DPU_PINGPONG_DSC bits into PP_BLK
 and PP_BLK_TE marcos
To: Marijn Suijten <marijn.suijten@somainline.org>
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com,
 andersson@kernel.org, freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 4 May 2023 at 20:49, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> PP_BLK_TE is no longer there.
>
> marcos -> macros.
>
> On 2023-05-04 09:46:41, Kuogee Hsieh wrote:
> > At legacy chipsets, it required DPU_PINGPONG_DSC bit be set to indicate
>
> I may have not made this clear, but the comments on patch 2/7
> (introducing the DPU_PINGPONG_DSC bit) also apply to this patch: clarify
> DPU 7.0.0 exactly in favour of "legacy", which has no definition at all
> and changes over time.
>
> > pingpong ops functions are required to complete DSC data path setup if
> > this chipset has DSC hardware block presented. This patch add
> > DPU_PINGPONG_DSC bit to both PP_BLK and PP_BLK_TE marcos if it has DSC
> > hardware block presented.
>
> Strictly speaking this patch together with 2/7 is not bisectable, as 2/7
> first disables the callbacks for _all_ hardware and then this patch adds
> it back by adding the flag to all DPU < 7.0.0 catalog descriptions.

I asked to split these into two patches, but I see your point and
partially agree with it. However if we mix the catalog changes with
functional changes, it is too easy to overlook or misjudge the
functional changes.

As you are correct about bisectability, I'd probably suggest either
having three patches (define flag, update catalog, handle flag in the
driver) or squashing first two patches to have two patches (add flag +
catalog, separate functional changes).

>
> To solve that, as we do in other DPU patch-series, just squash this
> patch into 2/7.  That way you also don't have to spend extra time
> rewording this commit message either to match the improvements we made
> in 2/7 (for example, you mention that "ops functions are required to
> complete DSC data path setup", but those were already available before
> 2/7, despite sounding as if this is a new thing that was previously
> missing entirely).
>
> But please wait at least a couple days before sending v6.  I only have a
> few hours every day/week but would appreciate to review and test all the
> other patches.
>
> > Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> > ---
> >  .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    | 16 +++++++--------
> >  .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h | 16 +++++++--------
> >  .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 24 +++++++++++-----------
> >  .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 24 +++++++++++-----------
> >  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 24 +++++++++++-----------
> >  5 files changed, 52 insertions(+), 52 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> > index 521cfd5..ef92545 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> > @@ -112,17 +112,17 @@ static const struct dpu_lm_cfg msm8998_lm[] = {
> >  };
> >
> >  static const struct dpu_pingpong_cfg msm8998_pp[] = {
> > -     PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SDM845_TE2_MASK, 0, sdm845_pp_sblk_te,
> > -                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> > +     PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SDM845_TE2_MASK|BIT(DPU_PINGPONG_DSC),
>
> This should be added to the MASK (add new #define's where necessary).
>
> - Marijn
>
> > +                     0, sdm845_pp_sblk_te, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> >                       DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> > -     PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SDM845_TE2_MASK, 0, sdm845_pp_sblk_te,
> > -                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> > +     PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SDM845_TE2_MASK|BIT(DPU_PINGPONG_DSC),
> > +                      0, sdm845_pp_sblk_te, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> >                       DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> > -     PP_BLK("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SDM845_MASK, 0, sdm845_pp_sblk,
> > -                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> > +     PP_BLK("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SDM845_MASK|BIT(DPU_PINGPONG_DSC),
> > +                     0, sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> >                       DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> > -     PP_BLK("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SDM845_MASK, 0, sdm845_pp_sblk,
> > -                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> > +     PP_BLK("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SDM845_MASK|BIT(DPU_PINGPONG_DSC),
> > +                     0, sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> >                       DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> >  };
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> > index b109757..697fbd8 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> > @@ -110,17 +110,17 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
> >  };
> >
> >  static const struct dpu_pingpong_cfg sdm845_pp[] = {
> > -     PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SDM845_TE2_MASK, 0, sdm845_pp_sblk_te,
> > -                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> > +     PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SDM845_TE2_MASK|BIT(DPU_PINGPONG_DSC),
> > +                     0, sdm845_pp_sblk_te, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> >                       DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> > -     PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SDM845_TE2_MASK, 0, sdm845_pp_sblk_te,
> > -                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> > +     PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SDM845_TE2_MASK|BIT(DPU_PINGPONG_DSC),
> > +                     0, sdm845_pp_sblk_te, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> >                       DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> > -     PP_BLK("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SDM845_MASK, 0, sdm845_pp_sblk,
> > -                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> > +     PP_BLK("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SDM845_MASK|BIT(DPU_PINGPONG_DSC),
> > +                     0, sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> >                       DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> > -     PP_BLK("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SDM845_MASK, 0, sdm845_pp_sblk,
> > -                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> > +     PP_BLK("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SDM845_MASK|BIT(DPU_PINGPONG_DSC),
> > +                     0, sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> >                       DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> >  };
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> > index 30aff2b..cb117ca 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> > @@ -128,23 +128,23 @@ static const struct dpu_dspp_cfg sm8150_dspp[] = {
> >  };
> >
> >  static const struct dpu_pingpong_cfg sm8150_pp[] = {
> > -     PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
> > -                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> > +     PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK|BIT(DPU_PINGPONG_DSC),
> > +                     MERGE_3D_0, sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> >                       -1),
> > -     PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
> > -                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> > +     PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK|BIT(DPU_PINGPONG_DSC),
> > +                     MERGE_3D_0, sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> >                       -1),
> > -     PP_BLK("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
> > -                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> > +     PP_BLK("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SM8150_MASK|BIT(DPU_PINGPONG_DSC),
> > +                     MERGE_3D_1, sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> >                       -1),
> > -     PP_BLK("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
> > -                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> > +     PP_BLK("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SM8150_MASK|BIT(DPU_PINGPONG_DSC),
> > +                     MERGE_3D_1, sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> >                       -1),
> > -     PP_BLK("pingpong_4", PINGPONG_4, 0x72000, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
> > -                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> > +     PP_BLK("pingpong_4", PINGPONG_4, 0x72000, PINGPONG_SM8150_MASK|BIT(DPU_PINGPONG_DSC),
> > +                     MERGE_3D_2, sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> >                       -1),
> > -     PP_BLK("pingpong_5", PINGPONG_5, 0x72800, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
> > -                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> > +     PP_BLK("pingpong_5", PINGPONG_5, 0x72800, PINGPONG_SM8150_MASK|BIT(DPU_PINGPONG_DSC),
> > +                     MERGE_3D_2, sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> >                       -1),
> >  };
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> > index fec1665..27eda6a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> > @@ -116,23 +116,23 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
> >  };
> >
> >  static const struct dpu_pingpong_cfg sc8180x_pp[] = {
> > -     PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
> > -                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> > +     PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK|BIT(DPU_PINGPONG_DSC),
> > +                     MERGE_3D_0, sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> >                       -1),
> > -     PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
> > -                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> > +     PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK|BIT(DPU_PINGPONG_DSC),
> > +                     MERGE_3D_0, sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> >                       -1),
> > -     PP_BLK("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
> > -                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> > +     PP_BLK("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SM8150_MASK|BIT(DPU_PINGPONG_DSC),
> > +                     MERGE_3D_1, sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> >                       -1),
> > -     PP_BLK("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
> > -                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> > +     PP_BLK("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SM8150_MASK|BIT(DPU_PINGPONG_DSC),
> > +                     MERGE_3D_1, sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> >                       -1),
> > -     PP_BLK("pingpong_4", PINGPONG_4, 0x72000, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
> > -                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> > +     PP_BLK("pingpong_4", PINGPONG_4, 0x72000, PINGPONG_SM8150_MASK|BIT(DPU_PINGPONG_DSC),
> > +                     MERGE_3D_2, sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> >                       -1),
> > -     PP_BLK("pingpong_5", PINGPONG_5, 0x72800, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
> > -                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> > +     PP_BLK("pingpong_5", PINGPONG_5, 0x72800, PINGPONG_SM8150_MASK|BIT(DPU_PINGPONG_DSC),
> > +                     MERGE_3D_2, sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> >                       -1),
> >  };
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> > index 37716b8..70fdd4d 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> > @@ -129,23 +129,23 @@ static const struct dpu_dspp_cfg sm8250_dspp[] = {
> >  };
> >
> >  static const struct dpu_pingpong_cfg sm8250_pp[] = {
> > -     PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
> > -                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> > +     PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK|BIT(DPU_PINGPONG_DSC),
> > +                     MERGE_3D_0, sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> >                       -1),
> > -     PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
> > -                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> > +     PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK|BIT(DPU_PINGPONG_DSC),
> > +                     MERGE_3D_0, sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> >                       -1),
> > -     PP_BLK("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
> > -                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> > +     PP_BLK("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SM8150_MASK|BIT(DPU_PINGPONG_DSC),
> > +                     MERGE_3D_1, sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> >                       -1),
> > -     PP_BLK("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
> > -                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> > +     PP_BLK("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SM8150_MASK|BIT(DPU_PINGPONG_DSC),
> > +                     MERGE_3D_1, sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> >                       -1),
> > -     PP_BLK("pingpong_4", PINGPONG_4, 0x72000, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
> > -                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> > +     PP_BLK("pingpong_4", PINGPONG_4, 0x72000, PINGPONG_SM8150_MASK|BIT(DPU_PINGPONG_DSC),
> > +                     MERGE_3D_2, sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> >                       -1),
> > -     PP_BLK("pingpong_5", PINGPONG_5, 0x72800, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
> > -                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> > +     PP_BLK("pingpong_5", PINGPONG_5, 0x72800, PINGPONG_SM8150_MASK|BIT(DPU_PINGPONG_DSC),
> > +                     MERGE_3D_2, sdm845_pp_sblk, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> >                       -1),
> >  };
> >
> > --
> > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > a Linux Foundation Collaborative Project
> >



-- 
With best wishes
Dmitry
