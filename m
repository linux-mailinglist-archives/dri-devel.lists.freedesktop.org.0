Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B40045C94E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 16:57:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF7B76E4A6;
	Wed, 24 Nov 2021 15:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7C56E4E3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 15:57:16 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id kl8so2089850qvb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 07:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CdYuE5QrzefFebInJI5P2GSiXpBChfo3witrC7Aylm0=;
 b=QkgHoKqmttx5bs5HGXCc/nhxHhXWnZm164rRR9UjzErZl7fFK+l2AOo3mnk3Vw2d0j
 BEIApYijTv8xAfl9c0orPE8u0lNVDf89U49Zj1hC2ITYGYDYpKM/47d2Z5KnU7ZiYuxv
 qpZFu16WmaTjEnrqzU8Lj/NZdvDyFijgS5jQUPziD/8gTTxs4gqmZcC1p4oe3szMCXxB
 aSrfYuVSOTmZGOQvFRgpuTfB7aQ6hPdzQHHT9ONypNKr6uFWO54dRKXOhOdmko+OR7WY
 OT7kh0kCxkHENvkIEK5MNXLgsZQR0OhhKvvijgMvgQ2DzBGGWgS7gXRGjjt0aOuoFcML
 4iog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CdYuE5QrzefFebInJI5P2GSiXpBChfo3witrC7Aylm0=;
 b=KNlk1ENih9EtfwS+Q19JBCkXSkYY8V8YZ7wDES9m0uH981AwoXpaom+5RTiabOH5s7
 o4pTKNneE0SYcFL+Y4BOAjiIyDJED71jlbA+jDZBd0RF8LeSYzz3SDjXEN7I4XvRjirF
 MR/eJVUlwMtOhF6Osd8YqIvSQlhwi13ElFCkAlsZZ+Iir83iSnRaTSw71iDAT12199Cp
 T/heOth6szqATX0oBh8aGKRWbh8FXkRQqo8ne08IB3Yk7ApKDPpzTgGqJ7lC+f4fY09N
 IZB7i3dqC6MS3WfkF2iHS24mdVXiMzzKuoSR0g4VdFNS8ZZmgOC6vqwXie/jr+iNNy9B
 2+1g==
X-Gm-Message-State: AOAM530Brc67HPIUqw1hm8wC5Aa/HFNStJYiv9mrVSzsBTieI3QVrflx
 rH96Sr6MpAtxE7Xtszpfy6Ulfga6nNDDvJun4vaqwA==
X-Google-Smtp-Source: ABdhPJzpHrcqPyGNonYh3XomO+R25xpkIROfGgGQcbfXK1J5XppVZWGg/B8uKyraD16CqXyUy4KFVQW3Yhk7evbo5HY=
X-Received: by 2002:ad4:5bc4:: with SMTP id t4mr8674092qvt.3.1637769435711;
 Wed, 24 Nov 2021 07:57:15 -0800 (PST)
MIME-Version: 1.0
References: <20211116062256.2417186-1-vkoul@kernel.org>
 <20211116062256.2417186-6-vkoul@kernel.org>
 <20269960-a753-72d4-5a1d-430af00cf562@linaro.org>
In-Reply-To: <20269960-a753-72d4-5a1d-430af00cf562@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 Nov 2021 18:57:04 +0300
Message-ID: <CAA8EJppA+cxySCFtqyihMjE0MPgioNcK8BtBS+HqUD9E141HBQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/13] drm/msm/disp/dpu1: Don't use DSC with mode_3d
To: Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 24 Nov 2021 at 18:40, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 16/11/2021 09:22, Vinod Koul wrote:
> > We cannot enable mode_3d when we are using the DSC. So pass
> > configuration to detect DSC is enabled and not enable mode_3d
> > when we are using DSC
> >
> > We add a helper dpu_encoder_helper_get_dsc() to detect dsc
> > enabled and pass this to .setup_intf_cfg()
> >
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     | 11 +++++++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  2 ++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c           |  3 ++-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h           |  2 ++
> >   4 files changed, 17 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > index e7270eb6b84b..efb85d595598 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > @@ -332,6 +332,17 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
> >       return BLEND_3D_NONE;
> >   }
> >
> > +static inline bool dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc)

Here you are returning the mask, so it should not be bool.

> > +{
> > +     struct drm_encoder *drm_enc = phys_enc->parent;
> > +     struct msm_drm_private *priv = drm_enc->dev->dev_private;
> > +
> > +     if (priv->dsc)
> > +             return priv->dsc->dsc_mask;
>
> dsc_mask doesn't exist at this point, so the patch should be moved later
> in the series.

Please ignore this comment, dsc mask already exists.

>
> > +
> > +     return 0;
> > +}
> > +
> >   /**
> >    * dpu_encoder_helper_split_config - split display configuration helper function
> >    *  This helper function may be used by physical encoders to configure
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > index 34a6940d12c5..f3f00f4d0193 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > @@ -70,6 +70,8 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
> >       intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_CMD;
> >       intf_cfg.stream_sel = cmd_enc->stream_sel;
> >       intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
> > +     intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
> > +
> >       ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
> >   }
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > index 64740ddb983e..36831457a91b 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > @@ -519,7 +519,8 @@ static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
> >
> >       intf_cfg |= (cfg->intf & 0xF) << 4;
> >
> > -     if (cfg->mode_3d) {
> > +     /* In DSC we can't set merge, so check for dsc too */
> > +     if (cfg->mode_3d && !cfg->dsc) {
> >               intf_cfg |= BIT(19);
> >               intf_cfg |= (cfg->mode_3d - 0x1) << 20;
> >       }
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> > index 806c171e5df2..9847c9c46d6f 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> > @@ -40,6 +40,7 @@ struct dpu_hw_stage_cfg {
> >    * @merge_3d:              3d merge block used
> >    * @intf_mode_sel:         Interface mode, cmd / vid
> >    * @stream_sel:            Stream selection for multi-stream interfaces
> > + * @dsc:                   DSC BIT masks
> >    */
> >   struct dpu_hw_intf_cfg {
> >       enum dpu_intf intf;
> > @@ -47,6 +48,7 @@ struct dpu_hw_intf_cfg {
> >       enum dpu_merge_3d merge_3d;
> >       enum dpu_ctl_mode_sel intf_mode_sel;
> >       int stream_sel;
> > +     unsigned int dsc;
> >   };
> >


-- 
With best wishes
Dmitry
