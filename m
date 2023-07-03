Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3987465DB
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 00:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D95F10E242;
	Mon,  3 Jul 2023 22:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0B010E242
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 22:54:00 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-c4d04d50c4cso1932050276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 15:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688424839; x=1691016839;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KU4Q5nLPTbo7DcrJVa3jLzxBiRlPKBE2IeGUDMFxbN4=;
 b=PkeU46X/8ID3JKvjrCz6qQsr7zcA8Eq82P4KQx8GJ1nKIPeeLXu2MqeqijGkHRsv4p
 kMj4TsyDgyGVkwinssDIdw5wpUkZJvJNePYRAFlqvIFHIPzxn8JU9XKlD3WFxv67U1h6
 yOxq8JDOsFczSGg1OT6eGQRNpCVwkJzfXPt28X3ffREtiFsyRH7g7zu2qndcqx4SXLq6
 VbHcPw5rBkS7t6h0k92qVm/d4+Sy1I4FeQzRvei+a0X+SExwY8CbIRONJtx+sZkw3GcX
 USDcm7FE1hHc8X/dZOCodH1z6+X/ht/GfkPn6sDKIrp3PP3B4s7FwedaNRdXQNKq2T6z
 euCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688424839; x=1691016839;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KU4Q5nLPTbo7DcrJVa3jLzxBiRlPKBE2IeGUDMFxbN4=;
 b=Ctl2Mu3LRBqkF7btVh5HIi4K74quMhsPRUXuPsf9tEkiIkgmA/i7eJq60/GpODN0KN
 XE2MbbCpytOwUnB6PwYwcBkdpB3OeeWbsPC0dmLkRSDQghNuELi/fRbNjMLZqVvG7oPt
 Aog8uGcbcCedHqezj2GsugiuilKxT2pdIrbBDsRCfx/68xm/HnZLVd058gSsUSsT5uwK
 JDFDfz3l80DFAELJa20f//1ZnGs7/fbsO7FoRPASLooGmlinmxDv9stHBmaROfbSZe6e
 hVVwsMoTwHB5qNHzv962uiOBYYZt4pQPO7uRH7KunqOFHjYc8a4XDLVaBTCY6I+yM3+/
 u57w==
X-Gm-Message-State: ABy/qLbY6XVT2or4DBaZXT7pLJRkBNZVy/V9+FfW3HhzQKSBB6GZnNOO
 nW6J7DygihoiWHCpVeQHOMhbkVelsLPwCAxtg34fnw==
X-Google-Smtp-Source: APBJJlGPKTROsf7PoMmq7Vr0rQzk8byw6iUVnTBL23FGt4nmXwfxY5m0P4u0rM8nN+8t3ukoE+ieA32EBpPKyU059gg=
X-Received: by 2002:a25:ad60:0:b0:bc7:de19:4dd1 with SMTP id
 l32-20020a25ad60000000b00bc7de194dd1mr10042289ybe.45.1688424839416; Mon, 03
 Jul 2023 15:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
 <20230620000846.946925-6-dmitry.baryshkov@linaro.org>
 <61760ea5-92a4-2150-033f-7d8a9b167eb7@quicinc.com>
In-Reply-To: <61760ea5-92a4-2150-033f-7d8a9b167eb7@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Jul 2023 01:53:48 +0300
Message-ID: <CAA8EJprDwLhVQv1peOt71t-RTDBx2k72WqS0kpOsQudav=dhtw@mail.gmail.com>
Subject: Re: [PATCH 5/8] drm/msm/dpu: drop the dpu_core_perf_crtc_update()'s
 stop_req param
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 4 Jul 2023 at 01:37, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/19/2023 5:08 PM, Dmitry Baryshkov wrote:
> > The stop_req is true only in the dpu_crtc_disable() case, when
> > crtc->enable has already been set to false. This renders the stop_req
> > argument useless. Remove it completely.
> >
>
> What about the enable case?
>
> That time dpu_crtc->enabled  will be false but you need valid clock and
> BW that time when you want to enable.

Maybe I'm missing something here. The driver sets dpu_crtc->enabled in
atomic_enable, while dpu_core_perf_crtc_update() is called further,
during atomic_flush, or from the CRTC event handler. And both these
cases have stop_req as false.

>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 12 ++++++------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  3 +--
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  6 +++---
> >   3 files changed, 10 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > index f8d5c87d0915..773e641eab28 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > @@ -277,7 +277,7 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
> >   }
> >
> >   int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
> > -             int params_changed, bool stop_req)
> > +                           int params_changed)
> >   {
> >       struct dpu_core_perf_params *new, *old;
> >       bool update_bus = false, update_clk = false;
> > @@ -301,13 +301,13 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
> >       dpu_crtc = to_dpu_crtc(crtc);
> >       dpu_cstate = to_dpu_crtc_state(crtc->state);
> >
> > -     DRM_DEBUG_ATOMIC("crtc:%d stop_req:%d core_clk:%llu\n",
> > -                     crtc->base.id, stop_req, kms->perf.core_clk_rate);
> > +     DRM_DEBUG_ATOMIC("crtc:%d enabled:%d core_clk:%llu\n",
> > +                     crtc->base.id, crtc->enabled, kms->perf.core_clk_rate);
> >
> >       old = &dpu_crtc->cur_perf;
> >       new = &dpu_cstate->new_perf;
> >
> > -     if (crtc->enabled && !stop_req) {
> > +     if (crtc->enabled) {
> >               /*
> >                * cases for bus bandwidth update.
> >                * 1. new bandwidth vote - "ab or ib vote" is higher
> > @@ -337,7 +337,7 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
> >       }
> >
> >       trace_dpu_perf_crtc_update(crtc->base.id, new->bw_ctl,
> > -             new->core_clk_rate, stop_req, update_bus, update_clk);
> > +             new->core_clk_rate, !crtc->enabled, update_bus, update_clk);
> >
> >       if (update_bus) {
> >               ret = _dpu_core_perf_crtc_update_bus(kms, crtc);
> > @@ -355,7 +355,7 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
> >       if (update_clk) {
> >               clk_rate = _dpu_core_perf_get_core_clk_rate(kms);
> >
> > -             trace_dpu_core_perf_update_clk(kms->dev, stop_req, clk_rate);
> > +             trace_dpu_core_perf_update_clk(kms->dev, !crtc->enabled, clk_rate);
> >
> >               clk_rate = min(clk_rate, kms->perf.max_core_clk_rate);
> >               ret = dev_pm_opp_set_rate(&kms->pdev->dev, clk_rate);
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > index 2bf7836f79bb..c29ec72984b8 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > @@ -58,11 +58,10 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
> >    * dpu_core_perf_crtc_update - update performance of the given crtc
> >    * @crtc: Pointer to crtc
> >    * @params_changed: true if crtc parameters are modified
> > - * @stop_req: true if this is a stop request
> >    * return: zero if success, or error code otherwise
> >    */
> >   int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
> > -             int params_changed, bool stop_req);
> > +                           int params_changed);
> >
> >   /**
> >    * dpu_core_perf_crtc_release_bw - release bandwidth of the given crtc
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > index ff5d306b95ed..214229d11e3e 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -718,7 +718,7 @@ static void dpu_crtc_frame_event_cb(void *data, u32 event)
> >   void dpu_crtc_complete_commit(struct drm_crtc *crtc)
> >   {
> >       trace_dpu_crtc_complete_commit(DRMID(crtc));
> > -     dpu_core_perf_crtc_update(crtc, 0, false);
> > +     dpu_core_perf_crtc_update(crtc, 0);
> >       _dpu_crtc_complete_flip(crtc);
> >   }
> >
> > @@ -884,7 +884,7 @@ static void dpu_crtc_atomic_flush(struct drm_crtc *crtc,
> >               return;
> >
> >       /* update performance setting before crtc kickoff */
> > -     dpu_core_perf_crtc_update(crtc, 1, false);
> > +     dpu_core_perf_crtc_update(crtc, 1);
> >
> >       /*
> >        * Final plane updates: Give each plane a chance to complete all
> > @@ -1100,7 +1100,7 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
> >               atomic_set(&dpu_crtc->frame_pending, 0);
> >       }
> >
> > -     dpu_core_perf_crtc_update(crtc, 0, true);
> > +     dpu_core_perf_crtc_update(crtc, 0);
> >
> >       drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
> >               dpu_encoder_register_frame_event_callback(encoder, NULL, NULL);



-- 
With best wishes
Dmitry
