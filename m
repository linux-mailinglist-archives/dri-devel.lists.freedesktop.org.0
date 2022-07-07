Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6DB56A705
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 17:33:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430E3112069;
	Thu,  7 Jul 2022 15:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C5D112069
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 15:33:14 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id r2so2564332qtx.6
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 08:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fLPqNOuxkhng0+VfusSfgGkkAqcB1Q6iFCv9UoVontQ=;
 b=BDKkvsKU3sn42yDWiGzbpEF9p5SV1Dz/09dCOmImNJBbAP2CeP8HMOCqAggGGxMP8W
 0UbRAdgvZA7Eg2wcj6YNM/h7ICwhoANe2veeMegkwrxmqfl+Ocge6dDwjTMN6H3K6BgI
 YbFYGc/MP2anQkgQeeH8xvKXHG1ndJqEuuLN2Fo56DIW3SYjA8RcHXTKluBhn3vEm0qW
 TNJvLy/Bvdlanl4tU4dSr2Q2fcn2rBTmuFlJZ7EI3JpzjYGVliasoq/rxodlhmDx0N5m
 ZYaPVz/wW3jGhqush/vob0PDp70Uk9f/rXPPoriWMM0TEgl9VynMo2OQNmrqz+2JO+yN
 OIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fLPqNOuxkhng0+VfusSfgGkkAqcB1Q6iFCv9UoVontQ=;
 b=czq6vVnYeo9LUThq7xN82OHBM/f/6YBWjFxUyV3Wo2YBAoxnNTnARb5RtxfBA1W49C
 7qn6zoL7juJcnfgjH4o4tVHKz85b4x8PHxmdaTk40eg9DyjeJrksgrH+r5JWWtr1+Euq
 me9tXwRMlIcMcmtEFCNClyCAWkDPVWa1nxaYl7kCBZMcXulnaLhVXprNoUzfw0kpQqOY
 JPo+V3YpUWtRmZ4MHEKwW8jwAROArpIIcyO2obdcY0n83xmHzIMDdUibTgWxZWCQuJ+F
 V9Gqrn6pJ27e4oV/Afh5YufuZ5++DbfKo9sG47yiIYd0IZjnz3zUi76KvMvn5I5WLnV7
 JZUA==
X-Gm-Message-State: AJIora8K/tz0cTVyR8oUNucsdNvxwOckin7qM3EnRH1b9heIFaLYPaSx
 tb8UpgALxHs3QQcidrU4ZYRCnC3TqCjDPo6mrzaaFQ==
X-Google-Smtp-Source: AGRyM1v2sny/0726HNQOlkXr40uwbBva0ycqSItDJC34DLwjRoq2GI9FOyav66XsWjyidLsuRaZEf1w+PSHx+h2/ceU=
X-Received: by 2002:ac8:5c96:0:b0:31a:c19a:7da1 with SMTP id
 r22-20020ac85c96000000b0031ac19a7da1mr38432079qta.62.1657207993411; Thu, 07
 Jul 2022 08:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <1657040445-13067-1-git-send-email-quic_vpolimer@quicinc.com>
 <1657040445-13067-2-git-send-email-quic_vpolimer@quicinc.com>
 <5d469759-0619-eece-902d-df8ac6583f22@linaro.org>
 <BN0PR02MB8173DF17816659868604A82EE4839@BN0PR02MB8173.namprd02.prod.outlook.com>
In-Reply-To: <BN0PR02MB8173DF17816659868604A82EE4839@BN0PR02MB8173.namprd02.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Jul 2022 18:33:02 +0300
Message-ID: <CAA8EJpoYj_-bY8CSPdE=mBkZbnffgUXX+LzEXKWHQ3yhS4GmvA@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] drm/msm/disp/dpu1: clear dpu_assign_crtc and get
 crtc from drm_enc instead of dpu_enc
To: Vinod Polimera <vpolimer@qti.qualcomm.com>
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
Cc: "Kalyan Thota \(QUIC\)" <quic_kalyant@quicinc.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Sankeerth Billakanti \(QUIC\)" <quic_sbillaka@quicinc.com>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "Vishnuvardhan Prodduturi \(QUIC\)" <quic_vproddut@quicinc.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Vinod Polimera \(QUIC\)" <quic_vpolimer@quicinc.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 7 Jul 2022 at 17:39, Vinod Polimera <vpolimer@qti.qualcomm.com> wrote:
>
> > NAK. Quoting the documentation:
> >
> > only really meaningful for non-atomic drivers. Atomic drivers should
> > instead check &drm_connector_state.crtc.
> >
> > Please adjust according to the documentation.
>    drm_enc gets the crtc info already from new connector state as part of drm_atomic_helper_update_legacy_modeset_state.
>    So drm_enc->crtc will be valid as we access it as part of modeset enable/disable.
>                          ```connector->encoder->crtc = new_conn_state->crtc;```.

drm_atomic_helper_update_legacy_modeset_state():

 * Since these updates are not synchronized with lockings, only code paths
 * called from &drm_mode_config_helper_funcs.atomic_commit_tail can look at the
 * legacy state filled out by this helper. Defacto this means this helper and
 * the legacy state pointers are only really useful for transitioning an
 * existing driver to the atomic world.

So please change the code to use drm_connector_state.crtc.

Dixi.

>
> Thanks,
> Vinod P.
>
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Sent: Wednesday, July 6, 2022 12:34 AM
> > To: Vinod Polimera (QUIC) <quic_vpolimer@quicinc.com>; dri-
> > devel@lists.freedesktop.org; linux-arm-msm@vger.kernel.org;
> > freedreno@lists.freedesktop.org; devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org; robdclark@gmail.com;
> > dianders@chromium.org; swboyd@chromium.org; Kalyan Thota (QUIC)
> > <quic_kalyant@quicinc.com>; Kuogee Hsieh (QUIC)
> > <quic_khsieh@quicinc.com>; Vishnuvardhan Prodduturi (QUIC)
> > <quic_vproddut@quicinc.com>; bjorn.andersson@linaro.org; Aravind
> > Venkateswaran (QUIC) <quic_aravindh@quicinc.com>; Abhinav Kumar
> > (QUIC) <quic_abhinavk@quicinc.com>; Sankeerth Billakanti (QUIC)
> > <quic_sbillaka@quicinc.com>
> > Subject: Re: [PATCH v4 1/7] drm/msm/disp/dpu1: clear dpu_assign_crtc and
> > get crtc from drm_enc instead of dpu_enc
> >
> > WARNING: This email originated from outside of Qualcomm. Please be wary
> > of any links or attachments, and do not enable macros.
> >
> > On 05/07/2022 20:00, Vinod Polimera wrote:
> > > Update crtc retrieval from dpu_enc to drm_enc, since new links get set
> > > as part of the update legacy mode set. The dpu_enc->crtc cache is no
> > > more needed, hence cleaning it as part of this change.
> >
> > NAK. Quoting the documentation:
> >
> > only really meaningful for non-atomic drivers. Atomic drivers should
> > instead check &drm_connector_state.crtc.
> >
> > Please adjust according to the documentation.
> > >
> > > Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 ----
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 18 +++---------------
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  8 --------
> > >   3 files changed, 3 insertions(+), 27 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > index b56f777..f91e3d1 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > @@ -972,7 +972,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
> > >                */
> > >               if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_VIDEO)
> > >                       release_bandwidth = true;
> > > -             dpu_encoder_assign_crtc(encoder, NULL);
> > >       }
> > >
> > >       /* wait for frame_event_done completion */
> > > @@ -1042,9 +1041,6 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
> > >       trace_dpu_crtc_enable(DRMID(crtc), true, dpu_crtc);
> > >       dpu_crtc->enabled = true;
> > >
> > > -     drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state-
> > >encoder_mask)
> > > -             dpu_encoder_assign_crtc(encoder, crtc);
> > > -
> > >       /* Enable/restore vblank irq handling */
> > >       drm_crtc_vblank_on(crtc);
> > >   }
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > index 52516eb..5629c0b 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > @@ -1254,8 +1254,8 @@ static void dpu_encoder_vblank_callback(struct
> > drm_encoder *drm_enc,
> > >       dpu_enc = to_dpu_encoder_virt(drm_enc);
> > >
> > >       spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
> > > -     if (dpu_enc->crtc)
> > > -             dpu_crtc_vblank_callback(dpu_enc->crtc);
> > > +     if (drm_enc->crtc)
> > > +             dpu_crtc_vblank_callback(drm_enc->crtc);
> > >       spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
> > >
> > >       atomic_inc(&phy_enc->vsync_cnt);
> > > @@ -1280,18 +1280,6 @@ static void
> > dpu_encoder_underrun_callback(struct drm_encoder *drm_enc,
> > >       DPU_ATRACE_END("encoder_underrun_callback");
> > >   }
> > >
> > > -void dpu_encoder_assign_crtc(struct drm_encoder *drm_enc, struct
> > drm_crtc *crtc)
> > > -{
> > > -     struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> > > -     unsigned long lock_flags;
> > > -
> > > -     spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
> > > -     /* crtc should always be cleared before re-assigning */
> > > -     WARN_ON(crtc && dpu_enc->crtc);
> > > -     dpu_enc->crtc = crtc;
> > > -     spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
> > > -}
> > > -
> > >   void dpu_encoder_toggle_vblank_for_crtc(struct drm_encoder
> > *drm_enc,
> > >                                       struct drm_crtc *crtc, bool enable)
> > >   {
> > > @@ -1302,7 +1290,7 @@ void dpu_encoder_toggle_vblank_for_crtc(struct
> > drm_encoder *drm_enc,
> > >       trace_dpu_enc_vblank_cb(DRMID(drm_enc), enable);
> > >
> > >       spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
> > > -     if (dpu_enc->crtc != crtc) {
> > > +     if (drm_enc->crtc != crtc) {
> > >               spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
> > >               return;
> > >       }
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > > index 781d41c..edba815 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > > @@ -39,14 +39,6 @@ struct msm_display_info {
> > >   };
> > >
> > >   /**
> > > - * dpu_encoder_assign_crtc - Link the encoder to the crtc it's assigned to
> > > - * @encoder: encoder pointer
> > > - * @crtc:    crtc pointer
> > > - */
> > > -void dpu_encoder_assign_crtc(struct drm_encoder *encoder,
> > > -                          struct drm_crtc *crtc);
> > > -
> > > -/**
> > >    * dpu_encoder_toggle_vblank_for_crtc - Toggles vblank interrupts on or
> > off if
> > >    *  the encoder is assigned to the given crtc
> > >    * @encoder:        encoder pointer
> >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry
