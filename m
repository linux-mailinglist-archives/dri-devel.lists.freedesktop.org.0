Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B34325848F3
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 02:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A326510E0CC;
	Fri, 29 Jul 2022 00:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7101310E1C6
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 00:18:23 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id j22so5816627ejs.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 17:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=o9Qlz38dt4Pm7UqIGc26yx76w2m2409/U8B2FImofJI=;
 b=Z/qA05wUv45cjgiTkkEsLFsOLVvS74jX49Pi+dafJVf9QFL1AXDBE+Fa6t0VX5sn7d
 T90z2o94rEC2Givhz3yrcuCFjuIS1OU94Hk2IJ3TIVZTHUz6FmOMqcqosPuzeFXE6eEz
 1HyqTz/fE9h79uoQq5YBbiWekMUdv5SUyrcfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=o9Qlz38dt4Pm7UqIGc26yx76w2m2409/U8B2FImofJI=;
 b=ogDlcTjkYSAI60NBJgWnqqn05FCeeVZs5jZPCEM0CBERmt5+PeEW40fxA7wLoQdUoM
 M6/i38jDu0PNLMNCzLI3fxhBzeKA34/numRE56wSqWnMyDx+NeQmC3xO5jrcL+0xO/m5
 zMgV9sagxJQD4HfNwWhQ7U5pHQ4AgVozTmtKIYdkqQT9kLSD7BJhh6NkyW6OjFieCtg2
 E0aMmm5EkXgkgcRpHcgLM8CnUDKY6ab6m6g/E54Q54wC74Kzh+xZ6NOvx676Lvv4NcbP
 9IO0H7p9LVCHvzdJ12LeBMdVW5GUOA1lb7C148+90B/OnJh/T6OvyRKfrbiHcR6qr2m2
 noqA==
X-Gm-Message-State: AJIora+0vRTQXvAhpHCM5E7ldAxxafg07XU04F44+t9obM/nJinWcjs4
 pPDMCF2N0oEh3l0iEPQ9pkxP+OC9gsX0ClEX
X-Google-Smtp-Source: AGRyM1sTedAVBOMLD8Wx6O0nba1/EY9JoL0Iddz+fVno/K5gTBOn2G5m5Tqt9pZ93dZNRVD66CL69A==
X-Received: by 2002:a17:907:2ce9:b0:72b:30e5:f1bc with SMTP id
 hz9-20020a1709072ce900b0072b30e5f1bcmr934743ejc.127.1659053901405; 
 Thu, 28 Jul 2022 17:18:21 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com.
 [209.85.221.43]) by smtp.gmail.com with ESMTPSA id
 v20-20020a170906339400b0072637b9c8c0sm936038eja.219.2022.07.28.17.18.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 17:18:20 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id j7so4172548wrh.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 17:18:20 -0700 (PDT)
X-Received: by 2002:adf:fb12:0:b0:20c:79b2:a200 with SMTP id
 c18-20020adffb12000000b0020c79b2a200mr737214wrr.617.1659053899738; Thu, 28
 Jul 2022 17:18:19 -0700 (PDT)
MIME-Version: 1.0
References: <1657544224-10680-1-git-send-email-quic_vpolimer@quicinc.com>
 <1657544224-10680-2-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1657544224-10680-2-git-send-email-quic_vpolimer@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 28 Jul 2022 17:18:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WW1BxjW9B9Vg99UOeTBePE32J++O24unnddecXXcaZ+Q@mail.gmail.com>
Message-ID: <CAD=FV=WW1BxjW9B9Vg99UOeTBePE32J++O24unnddecXXcaZ+Q@mail.gmail.com>
Subject: Re: [PATCH v6 01/10] drm/msm/disp/dpu: clear dpu_assign_crtc and get
 crtc from connector state instead of dpu_enc
To: Vinod Polimera <quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jul 11, 2022 at 5:57 AM Vinod Polimera
<quic_vpolimer@quicinc.com> wrote:
>
> Update crtc retrieval from dpu_enc to dpu_enc connector state,
> since new links get set as part of the dpu enc virt mode set.
> The dpu_enc->crtc cache is no more needed, hence cleaning it as
> part of this change.

I don't know this driver terribly well, but _why_ is it no longer
needed? According to the kernel-doc for the "crtc" variable you're
removing it was because we used to need it after the disable()
callback. Maybe that's no longer the case after commit a796ba2cb3dd
("drm/msm: dpu: Separate crtc assignment from vblank enable")?


> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 ----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 30 ++++++++++++++---------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  8 --------
>  3 files changed, 14 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index b56f777..f91e3d1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -972,7 +972,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
>                  */
>                 if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_VIDEO)
>                         release_bandwidth = true;
> -               dpu_encoder_assign_crtc(encoder, NULL);
>         }
>
>         /* wait for frame_event_done completion */
> @@ -1042,9 +1041,6 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
>         trace_dpu_crtc_enable(DRMID(crtc), true, dpu_crtc);
>         dpu_crtc->enabled = true;
>
> -       drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
> -               dpu_encoder_assign_crtc(encoder, crtc);
> -
>         /* Enable/restore vblank irq handling */
>         drm_crtc_vblank_on(crtc);
>  }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 52516eb..0fddc9d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -181,7 +181,6 @@ struct dpu_encoder_virt {
>
>         bool intfs_swapped;
>
> -       struct drm_crtc *crtc;

This structure is documented by kernel-doc. That means you need to
remove the documentation for "crtc".


>         struct drm_connector *connector;
>
>         struct dentry *debugfs_root;
> @@ -1245,6 +1244,7 @@ static void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
>                 struct dpu_encoder_phys *phy_enc)
>  {
>         struct dpu_encoder_virt *dpu_enc = NULL;
> +       struct drm_crtc *crtc;
>         unsigned long lock_flags;
>
>         if (!drm_enc || !phy_enc)
> @@ -1253,9 +1253,14 @@ static void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
>         DPU_ATRACE_BEGIN("encoder_vblank_callback");
>         dpu_enc = to_dpu_encoder_virt(drm_enc);
>
> +       if (!dpu_enc->connector || !dpu_enc->connector->state)
> +               return;

FWIW: your patch doesn't apply cleanly to msm-next. It conflicts with
commit c28d76d360f9 ("drm/msm/dpu: Increment vsync_cnt before waking
up userspace").

I suspect that you'll want your changes to come _after_ the increment
(AKA you want to increment even if the connector is NULL), but dunno
for sure.


> +
> +       crtc = dpu_enc->connector->state->crtc;
> +
>         spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
> -       if (dpu_enc->crtc)
> -               dpu_crtc_vblank_callback(dpu_enc->crtc);
> +       if (crtc)
> +               dpu_crtc_vblank_callback(crtc);

Effectively you are checking for NULLness at 3 levels:

1. dpu_enc->connector
2. dpu_enc->connector->state
3. dpu_enc->connector->state->crtc

You check two of those things outside of the spinlock and one of those
things inside the spinlock. Why? Should they all be inside the
spinlock, or can they all be outside of the spinlock, or is there some
reason it is the way it is?


>  void dpu_encoder_toggle_vblank_for_crtc(struct drm_encoder *drm_enc,
>                                         struct drm_crtc *crtc, bool enable)
>  {
>         struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> +       struct drm_crtc *new_crtc;
>         unsigned long lock_flags;
>         int i;
>
>         trace_dpu_enc_vblank_cb(DRMID(drm_enc), enable);
>
> +       if (!dpu_enc->connector || !dpu_enc->connector->state)
> +               return;
> +
> +       new_crtc = dpu_enc->connector->state->crtc;
>         spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
> -       if (dpu_enc->crtc != crtc) {
> +       if (!new_crtc || new_crtc != crtc) {
>                 spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);

Even if there was some reason for your choice of where you did the
spinlock in the previous case, I'm 95% sure that this one is absurd.
You're locking a spinlock around a test of local variables? I'm pretty
sure nobody else could be messing with your local variables...


-Doug
