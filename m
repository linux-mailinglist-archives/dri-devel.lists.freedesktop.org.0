Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F6450BFFB
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 20:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A988110E1C1;
	Fri, 22 Apr 2022 18:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B045710E25D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 18:54:08 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id i20so16094633ybj.7
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 11:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9YHJM4YSyPU4ShN8I2MCFA2mEojWaULyzaHXPSBQZNM=;
 b=a0PkppKDVNWkQka3hKZqpGSgBIC80Iiah9BKKc5IHAo8gwIecX5V71Qq+hFjGEeH8g
 LZGHTwGept3WN6K1pxh0BqxLhzPno5QT7sTUAxWdC+NkgefT68/vPuzkZGcP0GN6g2Sg
 3EtnWdXR/xADEe57ZLmrb9TBWmHo2YBmG8w/J7nTsxcLbgKScgvPyN1mvZH1FLuHDV5k
 b6Pup7BnYEsNjfhlfVJcAwFqLz259DTzbLT6CsYD4k5ykXRbKUwWfpLU7OwB0OVAuEgv
 vab5//9QrUuHERGsdDOCGIlzCjcr9fiFWkexBMDHwH9/ho+49T5Do+k2F3J/UHzSfHUe
 euaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9YHJM4YSyPU4ShN8I2MCFA2mEojWaULyzaHXPSBQZNM=;
 b=05SPbvLsK0rySnjmKhptCfIujWKwlgKUSR96WSwKuGIhbvu2lx7lm0mqo02JhTpfuf
 D9SrnmhqAmNWc33Mf0bekIn5H+gIBv0IA4kTiSRjUMFQk3dJVCstV5ghnPSjRoJYgukX
 Fsdke/SEftIVcTfPHf+oyWQLA2KSmkRsjmydhrtqNMRwmvU3Rq09pK2/AxyEi+4PLik3
 fzT79+E1xdnPK3iJKmuw2O927E+G4z37Ap7Yf+EUP+RC0/tRVboHdVVZ3BTqpBpoWj+n
 +SsPTIu0M+N6RRhKW79ecwhaneWghlzBuddWT5714mtqhtKDwYu6TifQwDxmzhxSOzh6
 HIfA==
X-Gm-Message-State: AOAM531+Satf9FZFcvQ6KaApE6tKZ+3igwQ3+NRpggVuvciddr4nVt3q
 4eTJg7VzinDI/VB3oNH4vhoT9ZZEZ3oKAYfZeazHmg==
X-Google-Smtp-Source: ABdhPJwTW0fqLXKTEnute4NOs4AbziHoEVz8NrHNUs20Qtt+OzF+OuFnRMU3o8bJDlQgQVN2P1yVzyYmt/5pGBW2kDY=
X-Received: by 2002:a5b:98a:0:b0:633:c93e:3e17 with SMTP id
 c10-20020a5b098a000000b00633c93e3e17mr6117800ybq.512.1650653647783; Fri, 22
 Apr 2022 11:54:07 -0700 (PDT)
MIME-Version: 1.0
References: <1650574112-25294-1-git-send-email-quic_abhinavk@quicinc.com>
 <1650574112-25294-2-git-send-email-quic_abhinavk@quicinc.com>
 <f3c788b1-e7d8-f13a-e4f9-b96e069fe700@linaro.org>
 <da2b917f-d7c0-e9a2-61a0-df2a88a441e4@quicinc.com>
 <CAA8EJpov5N1q-uB_iCrHMPXZV59UmrMFV17ihXPjfEzknRsXSQ@mail.gmail.com>
 <353a3eb8-c559-7697-27d4-059495db1422@quicinc.com>
 <CAA8EJprWNKVVt62ukqoQcq29ukeK7KcNpZ+c1gE9yH01CWj3VA@mail.gmail.com>
 <df46ee44-ccec-c2ea-1279-ca3e9e964408@quicinc.com>
In-Reply-To: <df46ee44-ccec-c2ea-1279-ca3e9e964408@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Apr 2022 21:53:56 +0300
Message-ID: <CAA8EJpoL1d0hLyEAZL1RhZb8ggPgLfmBF24_RJpCqveA6nerEg@mail.gmail.com>
Subject: Re: [RFC 1/4] drm/msm/dpu: introduce a wb_idx to be used for
 writeback interfaces
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
Cc: markyacoub@chromium.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Apr 2022 at 21:18, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Hi Dmitry
>
> On 4/22/2022 3:37 AM, Dmitry Baryshkov wrote:
> > On Fri, 22 Apr 2022 at 04:59, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 4/21/2022 5:22 PM, Dmitry Baryshkov wrote:
> >>> On Fri, 22 Apr 2022 at 02:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>>>
> >>>> Hi Dmitry
> >>>>
> >>>> Thanks for the review.
> >>>>
> >>>> One question below.
> >>>>
> >>>> On 4/21/2022 3:40 PM, Dmitry Baryshkov wrote:
> >>>>> On 21/04/2022 23:48, Abhinav Kumar wrote:
> >>>>>> Using intf_idx even for writeback interfaces is confusing
> >>>>>> because intf_idx is of type enum dpu_intf but the index used
> >>>>>> for writeback is of type enum dpu_wb.
> >>>>>>
> >>>>>> In addition, this makes it easier to separately check the
> >>>>>> availability of the two as its possible that there are boards
> >>>>>> which don't have any physical display connected but can still
> >>>>>> work in writeback mode.
> >>>>>>
> >>>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>>>>
> >>>>> Looks good, two minor issues bellow.
> >>>>>
> >>>>> With them fixed, I'd even squash this patch into the corresponding patch
> >>>>> of the previous patchset.
> >>>>>
> >>>>>> ---
> >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 62
> >>>>>> +++++++++++++-----------
> >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  4 ++
> >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h           |  2 +-
> >>>>>>     3 files changed, 40 insertions(+), 28 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>>>>> index 9c12841..054d7e4 100644
> >>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>>>>> @@ -962,7 +962,6 @@ static void
> >>>>>> dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >>>>>>         struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> >>>>>>         int num_lm, num_ctl, num_pp, num_dsc;
> >>>>>>         unsigned int dsc_mask = 0;
> >>>>>> -    enum dpu_hw_blk_type blk_type;
> >>>>>>         int i;
> >>>>>>         if (!drm_enc) {
> >>>>>> @@ -1044,17 +1043,11 @@ static void
> >>>>>> dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >>>>>>             phys->hw_pp = dpu_enc->hw_pp[i];
> >>>>>>             phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
> >>>>>> -        if (dpu_encoder_get_intf_mode(&dpu_enc->base) ==
> >>>>>> INTF_MODE_WB_LINE)
> >>>>>> -            blk_type = DPU_HW_BLK_WB;
> >>>>>> -        else
> >>>>>> -            blk_type = DPU_HW_BLK_INTF;
> >>>>>> +        if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
> >>>>>> +            phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm,
> >>>>>> phys->intf_idx);
> >>>>>> -        if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX) {
> >>>>>> -            if (blk_type == DPU_HW_BLK_INTF)
> >>>>>> -                phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm,
> >>>>>> phys->intf_idx);
> >>>>>> -            else if (blk_type == DPU_HW_BLK_WB)
> >>>>>> -                phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm,
> >>>>>> phys->intf_idx);
> >>>>>> -        }
> >>>>>> +        if (phys->wb_idx >= WB_0 && phys->wb_idx < WB_MAX)
> >>>>>> +            phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm, phys->wb_idx);
> >>>>>
> >>>>> We also need a check for if (phus->hw_intf && phys->hw_wb) HERE
> >>>>
> >>>> So there is an error if
> >>>>
> >>>> 1) Neither wb NOR intf are present
> >>>> 2) Both wb AND intf are present for the physical encoder?
> >>>>
> >>>> The second check is okay for now to add but considering concurrent
> >>>> writeback then that wouldn't assumption be wrong since both physical and
> >>>> wb interfaces can go with the same encoder?
> >>>
> >>> To the same encoder, but not to the same physical encoder. Here we
> >>> check the phys_enc parameters.
> >>
> >> Ok got it, let me re-spin this RFC with patches 2 & 3 squashed.
> >> Get the acks on them.
> >>
> >> Then will absorb into WB series and re-post it.
> >
> > Sounds like a good plan!
> >
> >>
> >>>
> >>>>
> >>>>>
> >>>>>>             if (!phys->hw_intf && !phys->hw_wb) {
> >>>>>>                 DPU_ERROR_ENC(dpu_enc,
> >>>>>> @@ -1201,7 +1194,7 @@ static void dpu_encoder_virt_disable(struct
> >>>>>> drm_encoder *drm_enc)
> >>>>>>         mutex_unlock(&dpu_enc->enc_lock);
> >>>>>>     }
> >>>>>> -static enum dpu_intf dpu_encoder_get_intf_or_wb(struct dpu_mdss_cfg
> >>>>>> *catalog,
> >>>>>> +static enum dpu_intf dpu_encoder_get_intf(struct dpu_mdss_cfg *catalog,
> >>>>>>             enum dpu_intf_type type, u32 controller_id)
> >>>>>>     {
> >>>>>>         int i = 0;
> >>>>>> @@ -1213,16 +1206,28 @@ static enum dpu_intf
> >>>>>> dpu_encoder_get_intf_or_wb(struct dpu_mdss_cfg *catalog,
> >>>>>>                     return catalog->intf[i].id;
> >>>>>>                 }
> >>>>>>             }
> >>>>>> -    } else {
> >>>>>> -        for (i = 0; i < catalog->wb_count; i++) {
> >>>>>> -            if (catalog->wb[i].id == controller_id)
> >>>>>> -                return catalog->wb[i].id;
> >>>>>> -        }
> >>>>>>         }
> >>>>>>         return INTF_MAX;
> >>>>>>     }
> >>>>>> +static enum dpu_wb dpu_encoder_get_wb(struct dpu_mdss_cfg *catalog,
> >>>>>> +        enum dpu_intf_type type, u32 controller_id)
> >>>>>> +{
> >>>>>> +    int i = 0;
> >>>>>> +
> >>>>>> +    if (type != INTF_WB)
> >>>>>> +        goto end;
> >>>>>> +
> >>>>>> +    for (i = 0; i < catalog->wb_count; i++) {
> >>>>>> +        if (catalog->wb[i].id == controller_id)
> >>>>>> +            return catalog->wb[i].id;
> >>>>>> +    }
> >>>>>> +
> >>>>>> +end:
> >>>>>> +    return WB_MAX;
> >>>>>
> >>>>> I'd return INTF_NONE/WB_NONE if the interface or WB unit was not found.
> >>>> ack, i guess in that case even the places checking the return value of
> >>>> this function need to be changed.
> >>>
> >>> Yes, of course.
>
> INTF_NONE/WB_NONE is not of enum dpu_intf or enum dpu_wb, its of type
> enum dpu_intf_mode
>
> Do we want to add them to dpu_intf/dpu_wb with a -1 value OR leave it
> as-it-is.

Let's leave it as is then.

>
> >>>
> >>>>>
> >>>>>> +}
> >>>>>> +
> >>>>>>     static void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
> >>>>>>             struct dpu_encoder_phys *phy_enc)
> >>>>>>     {
> >>>>>> @@ -2249,18 +2254,21 @@ static int dpu_encoder_setup_display(struct
> >>>>>> dpu_encoder_virt *dpu_enc,
> >>>>>>             DPU_DEBUG("h_tile_instance %d = %d, split_role %d\n",
> >>>>>>                     i, controller_id, phys_params.split_role);
> >>>>>> -        /*
> >>>>>> -         * FIXME: have separate intf_idx and wb_idx to avoid using
> >>>>>> -         * enum dpu_intf type for wb_idx and also to be able to
> >>>>>> -         * not bail out when there is no intf for boards which dont
> >>>>>> -         * have a display connected to them.
> >>>>>> -         * Having a valid wb_idx but not a intf_idx can be a valid
> >>>>>> -         * combination moving forward.
> >>>>>> -         */
> >>>>>> -        phys_params.intf_idx =
> >>>>>> dpu_encoder_get_intf_or_wb(dpu_kms->catalog,
> >>>>>> +        phys_params.intf_idx = dpu_encoder_get_intf(dpu_kms->catalog,
> >>>>>>                                                         intf_type,
> >>>>>>                                                         controller_id);
> >>>>>> -        if (phys_params.intf_idx == INTF_MAX) {
> >>>>>> +
> >>>>>> +        phys_params.wb_idx = dpu_encoder_get_wb(dpu_kms->catalog,
> >>>>>> +                intf_type, controller_id);
> >>>>>> +        /*
> >>>>>> +         * For boards which have no physical displays, having no
> >>>>>> interface
> >>>>>> +         * is fine because it can still be used with just writeback.
> >>>>>> +         * If we try without a display on a board which uses a DPU in
> >>>>>> which
> >>>>>> +         * writeback is not supported, then this will still fail as
> >>>>>> it will not
> >>>>>> +         * find any writeback in the catalog.
> >>>>>> +         */
> >>>>>> +        if ((phys_params.intf_idx == INTF_MAX) &&
> >>>>>> +                (phys_params.wb_idx == WB_MAX)) {
> >>>>>>                 DPU_ERROR_ENC(dpu_enc, "could not get intf or wb: type
> >>>>>> %d, id %d\n",
> >>>>>>                               intf_type, controller_id);
> >>>>>>                 ret = -EINVAL;
> >>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >>>>>> index 04d037e..f2af07d 100644
> >>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >>>>>> @@ -181,6 +181,7 @@ enum dpu_intr_idx {
> >>>>>>      * @split_role:        Role to play in a split-panel configuration
> >>>>>>      * @intf_mode:        Interface mode
> >>>>>>      * @intf_idx:        Interface index on dpu hardware
> >>>>>> + * @wb_idx:            Writeback index on dpu hardware
> >>>>>>      * @enc_spinlock:    Virtual-Encoder-Wide Spin Lock for IRQ purposes
> >>>>>>      * @enable_state:    Enable state tracking
> >>>>>>      * @vblank_refcount:    Reference count of vblank request
> >>>>>> @@ -209,6 +210,7 @@ struct dpu_encoder_phys {
> >>>>>>         enum dpu_enc_split_role split_role;
> >>>>>>         enum dpu_intf_mode intf_mode;
> >>>>>>         enum dpu_intf intf_idx;
> >>>>>> +    enum dpu_wb wb_idx;
> >>>>>>         spinlock_t *enc_spinlock;
> >>>>>>         enum dpu_enc_enable_state enable_state;
> >>>>>>         atomic_t vblank_refcount;
> >>>>>> @@ -275,6 +277,7 @@ struct dpu_encoder_phys_cmd {
> >>>>>>      * @parent_ops:        Callbacks exposed by the parent to the phys_enc
> >>>>>>      * @split_role:        Role to play in a split-panel configuration
> >>>>>>      * @intf_idx:        Interface index this phys_enc will control
> >>>>>> + * @wb_idx:            Writeback index this phys_enc will control
> >>>>>>      * @enc_spinlock:    Virtual-Encoder-Wide Spin Lock for IRQ purposes
> >>>>>>      */
> >>>>>>     struct dpu_enc_phys_init_params {
> >>>>>> @@ -283,6 +286,7 @@ struct dpu_enc_phys_init_params {
> >>>>>>         const struct dpu_encoder_virt_ops *parent_ops;
> >>>>>>         enum dpu_enc_split_role split_role;
> >>>>>>         enum dpu_intf intf_idx;
> >>>>>> +    enum dpu_wb wb_idx;
> >>>>>>         spinlock_t *enc_spinlock;
> >>>>>>     };
> >>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> >>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> >>>>>> index ba82e54..2f34a31 100644
> >>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> >>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> >>>>>> @@ -103,7 +103,7 @@ static inline struct dpu_hw_intf
> >>>>>> *dpu_rm_get_intf(struct dpu_rm *rm, enum dpu_in
> >>>>>>      * @rm: DPU Resource Manager handle
> >>>>>>      * @wb_idx: WB index
> >>>>>>      */
> >>>>>> -static inline struct dpu_hw_wb *dpu_rm_get_wb(struct dpu_rm *rm, enum
> >>>>>> dpu_intf wb_idx)
> >>>>>> +static inline struct dpu_hw_wb *dpu_rm_get_wb(struct dpu_rm *rm, enum
> >>>>>> dpu_wb wb_idx)
> >>>>>>     {
> >>>>>>         return rm->hw_wb[wb_idx - WB_0];
> >>>>>>     }
> >>>>>
> >>>>>
> >>>
> >>>
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry
