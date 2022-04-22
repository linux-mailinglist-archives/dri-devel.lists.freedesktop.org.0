Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B2C50ACBF
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 02:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD5F10EF2A;
	Fri, 22 Apr 2022 00:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F36210EF51
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 00:23:10 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2ec0bb4b715so69640347b3.5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 17:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5wK8X/KaV2zyY4rlGHZW5btZQPlB51wP1QcuUCYPnYo=;
 b=oI/lr9qlw00tRcMl7IaFb4yPt1JsWsls8ph5TW/36KmyksMu+9b5Pym3c2Hnn5FKUG
 HyoSu9RX5orBgGir9dM0hCbKa50b/i1SusaQ7gM/Jpf/7tfFRre6PTsG/dgGM+zyftTp
 YpcgIEnGXVG4ZyXfbD3WZq8jVhZeeNg8Qjp9ZX8vtw31dNSjHOLFJmiLblP39sYqjDDk
 TVQVQV7Z32hrJX2q/pZ8riZQPdpT3t3zxf2sd5Q7RDKrk0b4Y1WKxvipKWJXFdsYWQh4
 4qyWtmJGV2f2miRelqUyXFJEFQmj14ckblc+WAXLEng+4QX4UPEhz39YjIpkmJJtxuhJ
 hIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5wK8X/KaV2zyY4rlGHZW5btZQPlB51wP1QcuUCYPnYo=;
 b=S4ZqxBer6rFC7lleOzn6qkIldfIZR04dgayfaC8yHoToUp0diE8II++lrGtqpcfP3X
 9iOicnDFHEIiqiS/roa+8WIQzKpG9i62lzHnKrlNjYD7wKMBQDIhkErZg9CATfL3HtV0
 X1NL0mc3I4c/9+HE7tIUgtzwyEH7yxTTvUacaKxc0ONDGjoV5T8oWn9AuQ/NLtafxlz+
 SFj+7AtNnUSWXVqUxHsoza15P6llvgoJGzuaAHVAKEKxMzqPYm+G5OqaaAvpIX1O3+KM
 u08/v61NPxTk1J5boT3O7tD7FJ9YsiiVITBavpr0U/vfOLCxRprnWleQardeus06KP6x
 S3AA==
X-Gm-Message-State: AOAM530DlO0CZe6yhBL4m87zMVUiUOsHjymHklnQS4iKT21oT3OqAZ6c
 suUOPtaM2wk2bD8Ep3NOM9/acwH4nRM15ma2UxYlR9UHlWo=
X-Google-Smtp-Source: ABdhPJxOn8NKaNLDcJ1LY9rPv6hHyEcizW79hdBt9MC7X/wRgBGg/SkBHIAt8bx1I7Jib/UcySNxkGDvcEx0Q9rQKf0=
X-Received: by 2002:a81:324e:0:b0:2f1:d8f4:40df with SMTP id
 y75-20020a81324e000000b002f1d8f440dfmr2380767ywy.289.1650586989524; Thu, 21
 Apr 2022 17:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <1650574112-25294-1-git-send-email-quic_abhinavk@quicinc.com>
 <1650574112-25294-2-git-send-email-quic_abhinavk@quicinc.com>
 <f3c788b1-e7d8-f13a-e4f9-b96e069fe700@linaro.org>
 <da2b917f-d7c0-e9a2-61a0-df2a88a441e4@quicinc.com>
In-Reply-To: <da2b917f-d7c0-e9a2-61a0-df2a88a441e4@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Apr 2022 03:22:58 +0300
Message-ID: <CAA8EJpov5N1q-uB_iCrHMPXZV59UmrMFV17ihXPjfEzknRsXSQ@mail.gmail.com>
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

On Fri, 22 Apr 2022 at 02:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Hi Dmitry
>
> Thanks for the review.
>
> One question below.
>
> On 4/21/2022 3:40 PM, Dmitry Baryshkov wrote:
> > On 21/04/2022 23:48, Abhinav Kumar wrote:
> >> Using intf_idx even for writeback interfaces is confusing
> >> because intf_idx is of type enum dpu_intf but the index used
> >> for writeback is of type enum dpu_wb.
> >>
> >> In addition, this makes it easier to separately check the
> >> availability of the two as its possible that there are boards
> >> which don't have any physical display connected but can still
> >> work in writeback mode.
> >>
> >> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >
> > Looks good, two minor issues bellow.
> >
> > With them fixed, I'd even squash this patch into the corresponding patch
> > of the previous patchset.
> >
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 62
> >> +++++++++++++-----------
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  4 ++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h           |  2 +-
> >>   3 files changed, 40 insertions(+), 28 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> index 9c12841..054d7e4 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> @@ -962,7 +962,6 @@ static void
> >> dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >>       struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> >>       int num_lm, num_ctl, num_pp, num_dsc;
> >>       unsigned int dsc_mask = 0;
> >> -    enum dpu_hw_blk_type blk_type;
> >>       int i;
> >>       if (!drm_enc) {
> >> @@ -1044,17 +1043,11 @@ static void
> >> dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >>           phys->hw_pp = dpu_enc->hw_pp[i];
> >>           phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
> >> -        if (dpu_encoder_get_intf_mode(&dpu_enc->base) ==
> >> INTF_MODE_WB_LINE)
> >> -            blk_type = DPU_HW_BLK_WB;
> >> -        else
> >> -            blk_type = DPU_HW_BLK_INTF;
> >> +        if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
> >> +            phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm,
> >> phys->intf_idx);
> >> -        if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX) {
> >> -            if (blk_type == DPU_HW_BLK_INTF)
> >> -                phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm,
> >> phys->intf_idx);
> >> -            else if (blk_type == DPU_HW_BLK_WB)
> >> -                phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm,
> >> phys->intf_idx);
> >> -        }
> >> +        if (phys->wb_idx >= WB_0 && phys->wb_idx < WB_MAX)
> >> +            phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm, phys->wb_idx);
> >
> > We also need a check for if (phus->hw_intf && phys->hw_wb) HERE
>
> So there is an error if
>
> 1) Neither wb NOR intf are present
> 2) Both wb AND intf are present for the physical encoder?
>
> The second check is okay for now to add but considering concurrent
> writeback then that wouldn't assumption be wrong since both physical and
> wb interfaces can go with the same encoder?

To the same encoder, but not to the same physical encoder. Here we
check the phys_enc parameters.

>
> >
> >>           if (!phys->hw_intf && !phys->hw_wb) {
> >>               DPU_ERROR_ENC(dpu_enc,
> >> @@ -1201,7 +1194,7 @@ static void dpu_encoder_virt_disable(struct
> >> drm_encoder *drm_enc)
> >>       mutex_unlock(&dpu_enc->enc_lock);
> >>   }
> >> -static enum dpu_intf dpu_encoder_get_intf_or_wb(struct dpu_mdss_cfg
> >> *catalog,
> >> +static enum dpu_intf dpu_encoder_get_intf(struct dpu_mdss_cfg *catalog,
> >>           enum dpu_intf_type type, u32 controller_id)
> >>   {
> >>       int i = 0;
> >> @@ -1213,16 +1206,28 @@ static enum dpu_intf
> >> dpu_encoder_get_intf_or_wb(struct dpu_mdss_cfg *catalog,
> >>                   return catalog->intf[i].id;
> >>               }
> >>           }
> >> -    } else {
> >> -        for (i = 0; i < catalog->wb_count; i++) {
> >> -            if (catalog->wb[i].id == controller_id)
> >> -                return catalog->wb[i].id;
> >> -        }
> >>       }
> >>       return INTF_MAX;
> >>   }
> >> +static enum dpu_wb dpu_encoder_get_wb(struct dpu_mdss_cfg *catalog,
> >> +        enum dpu_intf_type type, u32 controller_id)
> >> +{
> >> +    int i = 0;
> >> +
> >> +    if (type != INTF_WB)
> >> +        goto end;
> >> +
> >> +    for (i = 0; i < catalog->wb_count; i++) {
> >> +        if (catalog->wb[i].id == controller_id)
> >> +            return catalog->wb[i].id;
> >> +    }
> >> +
> >> +end:
> >> +    return WB_MAX;
> >
> > I'd return INTF_NONE/WB_NONE if the interface or WB unit was not found.
> ack, i guess in that case even the places checking the return value of
> this function need to be changed.

Yes, of course.

> >
> >> +}
> >> +
> >>   static void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
> >>           struct dpu_encoder_phys *phy_enc)
> >>   {
> >> @@ -2249,18 +2254,21 @@ static int dpu_encoder_setup_display(struct
> >> dpu_encoder_virt *dpu_enc,
> >>           DPU_DEBUG("h_tile_instance %d = %d, split_role %d\n",
> >>                   i, controller_id, phys_params.split_role);
> >> -        /*
> >> -         * FIXME: have separate intf_idx and wb_idx to avoid using
> >> -         * enum dpu_intf type for wb_idx and also to be able to
> >> -         * not bail out when there is no intf for boards which dont
> >> -         * have a display connected to them.
> >> -         * Having a valid wb_idx but not a intf_idx can be a valid
> >> -         * combination moving forward.
> >> -         */
> >> -        phys_params.intf_idx =
> >> dpu_encoder_get_intf_or_wb(dpu_kms->catalog,
> >> +        phys_params.intf_idx = dpu_encoder_get_intf(dpu_kms->catalog,
> >>                                                       intf_type,
> >>                                                       controller_id);
> >> -        if (phys_params.intf_idx == INTF_MAX) {
> >> +
> >> +        phys_params.wb_idx = dpu_encoder_get_wb(dpu_kms->catalog,
> >> +                intf_type, controller_id);
> >> +        /*
> >> +         * For boards which have no physical displays, having no
> >> interface
> >> +         * is fine because it can still be used with just writeback.
> >> +         * If we try without a display on a board which uses a DPU in
> >> which
> >> +         * writeback is not supported, then this will still fail as
> >> it will not
> >> +         * find any writeback in the catalog.
> >> +         */
> >> +        if ((phys_params.intf_idx == INTF_MAX) &&
> >> +                (phys_params.wb_idx == WB_MAX)) {
> >>               DPU_ERROR_ENC(dpu_enc, "could not get intf or wb: type
> >> %d, id %d\n",
> >>                             intf_type, controller_id);
> >>               ret = -EINVAL;
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >> index 04d037e..f2af07d 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >> @@ -181,6 +181,7 @@ enum dpu_intr_idx {
> >>    * @split_role:        Role to play in a split-panel configuration
> >>    * @intf_mode:        Interface mode
> >>    * @intf_idx:        Interface index on dpu hardware
> >> + * @wb_idx:            Writeback index on dpu hardware
> >>    * @enc_spinlock:    Virtual-Encoder-Wide Spin Lock for IRQ purposes
> >>    * @enable_state:    Enable state tracking
> >>    * @vblank_refcount:    Reference count of vblank request
> >> @@ -209,6 +210,7 @@ struct dpu_encoder_phys {
> >>       enum dpu_enc_split_role split_role;
> >>       enum dpu_intf_mode intf_mode;
> >>       enum dpu_intf intf_idx;
> >> +    enum dpu_wb wb_idx;
> >>       spinlock_t *enc_spinlock;
> >>       enum dpu_enc_enable_state enable_state;
> >>       atomic_t vblank_refcount;
> >> @@ -275,6 +277,7 @@ struct dpu_encoder_phys_cmd {
> >>    * @parent_ops:        Callbacks exposed by the parent to the phys_enc
> >>    * @split_role:        Role to play in a split-panel configuration
> >>    * @intf_idx:        Interface index this phys_enc will control
> >> + * @wb_idx:            Writeback index this phys_enc will control
> >>    * @enc_spinlock:    Virtual-Encoder-Wide Spin Lock for IRQ purposes
> >>    */
> >>   struct dpu_enc_phys_init_params {
> >> @@ -283,6 +286,7 @@ struct dpu_enc_phys_init_params {
> >>       const struct dpu_encoder_virt_ops *parent_ops;
> >>       enum dpu_enc_split_role split_role;
> >>       enum dpu_intf intf_idx;
> >> +    enum dpu_wb wb_idx;
> >>       spinlock_t *enc_spinlock;
> >>   };
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> >> index ba82e54..2f34a31 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> >> @@ -103,7 +103,7 @@ static inline struct dpu_hw_intf
> >> *dpu_rm_get_intf(struct dpu_rm *rm, enum dpu_in
> >>    * @rm: DPU Resource Manager handle
> >>    * @wb_idx: WB index
> >>    */
> >> -static inline struct dpu_hw_wb *dpu_rm_get_wb(struct dpu_rm *rm, enum
> >> dpu_intf wb_idx)
> >> +static inline struct dpu_hw_wb *dpu_rm_get_wb(struct dpu_rm *rm, enum
> >> dpu_wb wb_idx)
> >>   {
> >>       return rm->hw_wb[wb_idx - WB_0];
> >>   }
> >
> >



-- 
With best wishes
Dmitry
