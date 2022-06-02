Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 893F953BF75
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 22:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4905F112EEB;
	Thu,  2 Jun 2022 20:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34DB112E59
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 20:15:46 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id v1so4206105qtx.5
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 13:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=11/VXJZ5+PDAg8KiVoWPiVtmrogeqL0Gtp9raI/dmQU=;
 b=nXh2N0Rs852FwUUicJzJ7XNHCXWGI80DlhTnFd1XWsETQPrf/DPbrLStBIKQQxecnL
 g3oYUHF3jaaUMk8RsQDbUBpWcg09qr+2KziKLZbxNke0gd1eIj9SjrpkCAkOLFituZnd
 fE+acn9LO52kryL1qohpGRI63Kr2qhWTUVTzPUoCS4MF4PwcoorxUpOowvQDndaPN9rt
 z7XXINFXrQu2SXSjcXaRrH4dD8Bw3LjxbcD9/4ITI5FR2fCXSiHQFpc4ufpzHej9+RJ9
 JBOVM5YvovdqwrycStcqnsfh4Pqt1ADOn5UwI1mLbuSWXm8QlwBAX8w7MnA4+hZ6Pzp8
 FWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=11/VXJZ5+PDAg8KiVoWPiVtmrogeqL0Gtp9raI/dmQU=;
 b=5v8TOvUAkwydpywaS0vZgiLsK/D/9t62wnHykAEbaysUjekXOyC6YQgHUzkusNl4Bc
 pM8xV8Xzx9dl3p5CLdbMQ9ACsUYmwebGxyCi1nfuJI3NKNMFBdywSapzI/NlCRZGKyor
 rcJm79ipi04s4yFWFw1k4m4v7y1d7SxEUKY832LdwsOLz7/9rdmMFdJCAl3ZsFm7CHvf
 pXji/0L+iui90fjo+beB03Nqzrs8VdH08afotrnHzlKjkj8X+0VgWRKHSCnPOMz3WCfR
 CreQ/xctxHN1KxZhqTLiowYRQ7IbtkyBRBp9D73eM5s3e4/1wVdxnlfWb7/ZbzN+241u
 8y/A==
X-Gm-Message-State: AOAM532hlcgTkopxuMw+nabtCm1CFj37sjLPQCrQZeCfrIplNvHU9zLf
 QCgHuEHlHT33CGO6+FiQgqBBqrw8ztLN8YNpQ4oHvQ==
X-Google-Smtp-Source: ABdhPJwQC5oj1uGwjMqP/kuSzWwv05cDEC3cFG0gRivQN3Jgs6a2Ro5rNvB0MBm8nFlPUsljBXwb5LY8OBq9jsBP2Q0=
X-Received: by 2002:a05:622a:4e:b0:301:8a1f:b89b with SMTP id
 y14-20020a05622a004e00b003018a1fb89bmr5067697qtw.62.1654200946063; Thu, 02
 Jun 2022 13:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220602133039.1739490-1-dmitry.baryshkov@linaro.org>
 <20220602133039.1739490-2-dmitry.baryshkov@linaro.org>
 <4a041600-5ff2-9f95-52c9-ebd5f1f10a81@quicinc.com>
In-Reply-To: <4a041600-5ff2-9f95-52c9-ebd5f1f10a81@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 2 Jun 2022 23:15:35 +0300
Message-ID: <CAA8EJpp0McfrrHL0zrLTt0vn4J1RYYnHMVfdoH+FkXvLWWGm9A@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] drm/msm/dpu: use feature bit for LM combined alpha
 check
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2 Jun 2022 at 21:37, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/2/2022 6:30 AM, Dmitry Baryshkov wrote:
> > Rather than checking hwversion, follow the usual patter and add special
> > bit to the lm->features to check whether the LM has combined or separate
> > alpha registers. While we are at it, rename
> > dpu_hw_lm_setup_blend_config_sdm845() to
> > dpu_hw_lm_setup_blend_config_combined_alpha().
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 17 ++++++++++-------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  2 ++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c      |  6 +++---
> >   3 files changed, 15 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > index 400ebceb56bb..78c7d987c2ca 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > @@ -50,9 +50,12 @@
> >   #define DMA_CURSOR_MSM8998_MASK \
> >       (DMA_MSM8998_MASK | BIT(DPU_SSPP_CURSOR))
> >
> > -#define MIXER_SDM845_MASK \
> > +#define MIXER_MSM8998_MASK \
> >       (BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER))
> >
> > +#define MIXER_SDM845_MASK \
> > +     (BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
> > +
> >   #define MIXER_SC7180_MASK \
> >       (BIT(DPU_DIM_LAYER))
> >
> > @@ -936,17 +939,17 @@ static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
> >   };
> >
> >   static const struct dpu_lm_cfg msm8998_lm[] = {
> > -     LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> > +     LM_BLK("lm_0", LM_0, 0x44000, MIXER_MSM8998_MASK,
> >               &msm8998_lm_sblk, PINGPONG_0, LM_2, DSPP_0),
> > -     LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
> > +     LM_BLK("lm_1", LM_1, 0x45000, MIXER_MSM8998_MASK,
> >               &msm8998_lm_sblk, PINGPONG_1, LM_5, DSPP_1),
> > -     LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
> > +     LM_BLK("lm_2", LM_2, 0x46000, MIXER_MSM8998_MASK,
> >               &msm8998_lm_sblk, PINGPONG_2, LM_0, 0),
> > -     LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
> > +     LM_BLK("lm_3", LM_3, 0x47000, MIXER_MSM8998_MASK,
> >               &msm8998_lm_sblk, PINGPONG_MAX, 0, 0),
> > -     LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
> > +     LM_BLK("lm_4", LM_4, 0x48000, MIXER_MSM8998_MASK,
> >               &msm8998_lm_sblk, PINGPONG_MAX, 0, 0),
> > -     LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
> > +     LM_BLK("lm_5", LM_5, 0x49000, MIXER_MSM8998_MASK,
> >               &msm8998_lm_sblk, PINGPONG_3, LM_1, 0),
> >   };
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > index 8cb6d1f25bf9..80bc09b1f1b3 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > @@ -145,6 +145,7 @@ enum {
> >    * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
> >    * @DPU_MIXER_GC              Gamma correction block
> >    * @DPU_DIM_LAYER             Layer mixer supports dim layer
> > + * @DPU_MIXER_COMBINED_ALPHA  Layer mixer has combined alpha register
> >    * @DPU_MIXER_MAX             maximum value
> >    */
> >   enum {
> > @@ -152,6 +153,7 @@ enum {
> >       DPU_MIXER_SOURCESPLIT,
> >       DPU_MIXER_GC,
> >       DPU_DIM_LAYER,
> > +     DPU_MIXER_COMBINED_ALPHA,
> >       DPU_MIXER_MAX
> >   };
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> > index 462f5082099e..25d2eba28e71 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> > @@ -148,7 +148,7 @@ static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *misr_value)
> >       return 0;
> >   }
> >
> > -static void dpu_hw_lm_setup_blend_config_sdm845(struct dpu_hw_mixer *ctx,
> > +static void dpu_hw_lm_setup_blend_config_combined_alpha(struct dpu_hw_mixer *ctx,
> >       u32 stage, u32 fg_alpha, u32 bg_alpha, u32 blend_op)
> >   {
> >       struct dpu_hw_blk_reg_map *c = &ctx->hw;
> > @@ -204,8 +204,8 @@ static void _setup_mixer_ops(const struct dpu_mdss_cfg *m,
> >               unsigned long features)
> >   {
> >       ops->setup_mixer_out = dpu_hw_lm_setup_out;
> > -     if (m->hwversion >= DPU_HW_VER_400)
> > -             ops->setup_blend_config = dpu_hw_lm_setup_blend_config_sdm845;
> > +     if (test_bit(DPU_MIXER_COMBINED_ALPHA, &features))
> > +             ops->setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
>
> This will not work for all chipsets.
>
> In the catalog you have added BIT(DPU_MIXER_COMBINED_ALPHA) only for
> MIXER_SDM845_MASK but MIXER_SC7180_MASK is not updated.
>
> HW version of sc7180 is > DPU_HW_VER_400 so this would break both sc7180
> and sc7280.
>
> Please update all the relevant chipset masks.

Argh, I missed the fact that the sc7180 mixer mask doesn't inherit the
sdm845 one.
BTW: I see that atoll-sde declares support for src-split. Is there any
reason why it is omitted from sc7180's mixer mask?
If there is one, could you please send a patch adding a short comment there?

>
> >       else
> >               ops->setup_blend_config = dpu_hw_lm_setup_blend_config;
> >       ops->setup_alpha_out = dpu_hw_lm_setup_color3;

-- 
With best wishes
Dmitry
