Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC22C2D9F0D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 19:31:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B036E0C4;
	Mon, 14 Dec 2020 18:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2A16E0BA;
 Mon, 14 Dec 2020 18:30:56 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w5so13697792wrm.11;
 Mon, 14 Dec 2020 10:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eapH8sLEY+OHuqAvw2Pr2nBh8E1YNPTb492AKMx5gjc=;
 b=VNSoXW6xVOpYjQdbSiFZmPv3azVBqzhNApx/foaodU/BrASK86hSARIt0X1wqTL/67
 hCg3cfqrx4bo1qqUbTbADc3zqM9JI0HEQy1o+AmmBRdm/0b0Jh0Yjq556MDuoSa03QEg
 QNz4dePEEFd8/nXQYj/v5FbDQ2yUzbnNk9MlYDYO6O0bNJ7uT0HeJVj14TMz0r1fVYB3
 mAL52Qtx4pV47J77iOh9ZLp0QPLwEfkXc9FIklYuBIpahfSVOdil8l+S+R9+9kCyfoTH
 L0ni5Mw5lFHkfBsGN9BrXAICgJb4VfaDalBJhOFY9MNhjrMaElDPYbKpkcrpxJzsQpn6
 ewhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eapH8sLEY+OHuqAvw2Pr2nBh8E1YNPTb492AKMx5gjc=;
 b=Zc7qOqvBwWF8cQ3kGzfUZxxP2IkEMtRtzwBggLJsDI11vj9IzSpTcM22dQiniTGknm
 IleoLBQzUyLppuzb+zFrM27a4bA5uJS5dkHmnIywkwpxQTHPdEP70tc6YKD3DukKvPvj
 WePxqvgVD0NoZdvADUnqq+fDu3DUuHgSFQD2nGIgpc7r6tQYvic30awKLu8nmGUDqnDa
 H23+As0QqYrs4TDUwKHVyOVuFwVOpv96j00NmJnJJPw/vPwoOr9YoMjjUX7OVHlO4xLs
 0iIYE39tooExJga2mGJNz/D0xYM5LKdocyJe5CpgtLoCKBRhkNVxK7N9idEK7+m78wsi
 eT6w==
X-Gm-Message-State: AOAM531TvUGTb6uj5ydn+tTMU8uDu1O5JLU+gcOrjyJBAjOcsm4v1+1Q
 C/sPc8/QnHK01ESMJi1oqqoSImKpNjoahfAw3oc=
X-Google-Smtp-Source: ABdhPJxsdT2+DVGdOvxIo7w4VdHI5wCzc1nPcM91fVZICMU17yThviWq5d++7OkCf/8Tv2rjEgtWNe+uSxtx2Xg1P6U=
X-Received: by 2002:a5d:54cc:: with SMTP id x12mr29866110wrv.132.1607970654808; 
 Mon, 14 Dec 2020 10:30:54 -0800 (PST)
MIME-Version: 1.0
References: <1607946066-16276-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1607946066-16276-1-git-send-email-kalyan_t@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 14 Dec 2020 10:32:57 -0800
Message-ID: <CAF6AEGutj5SSdqjgZoQHAeg82QD0_+Sqog5vqN4SM0N_5X1Myw@mail.gmail.com>
Subject: Re: [v1] drm/msm/disp/dpu1: turn off vblank irqs aggressively in dpu
 driver
To: Kalyan Thota <kalyan_t@codeaurora.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Krishna Manikandan <mkrishn@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Drew Davenport <ddavenport@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 14, 2020 at 3:41 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> Turn off vblank irqs immediately as soon as drm_vblank_put is
> requested so that there are no irqs triggered during idle state.
>
> This will reduce cpu wakeups and help in power saving. The change
> also enable driver timestamp for vblanks.
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 69 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 15 +++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  6 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  4 ++
>  4 files changed, 94 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index d4662e8..a4a5733 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -65,6 +65,73 @@ static void dpu_crtc_destroy(struct drm_crtc *crtc)
>         kfree(dpu_crtc);
>  }
>
> +static struct drm_encoder *get_encoder_from_crtc(struct drm_crtc *crtc)
> +{
> +       struct drm_device *dev = crtc->dev;
> +       struct drm_encoder *encoder;
> +
> +       drm_for_each_encoder(encoder, dev)
> +               if (encoder->crtc == crtc)
> +                       return encoder;
> +
> +       return NULL;
> +}
> +
> +static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
> +                                          bool in_vblank_irq,
> +                                          int *vpos, int *hpos,
> +                                          ktime_t *stime, ktime_t *etime,
> +                                          const struct drm_display_mode *mode)
> +{
> +       unsigned int pipe = crtc->index;
> +       struct drm_encoder *encoder;
> +       int line, vsw, vbp, vactive_start, vactive_end, vfp_end;
> +
> +
> +       encoder = get_encoder_from_crtc(crtc);
> +       if (!encoder) {
> +               DRM_ERROR("no encoder found for crtc %d\n", pipe);
> +               return false;
> +       }
> +
> +       vsw = mode->crtc_vsync_end - mode->crtc_vsync_start;
> +       vbp = mode->crtc_vtotal - mode->crtc_vsync_end;
> +
> +       /*
> +        * the line counter is 1 at the start of the VSYNC pulse and VTOTAL at
> +        * the end of VFP. Translate the porch values relative to the line
> +        * counter positions.
> +        */
> +
> +       vactive_start = vsw + vbp + 1;
> +
> +       vactive_end = vactive_start + mode->crtc_vdisplay;
> +
> +       /* last scan line before VSYNC */
> +       vfp_end = mode->crtc_vtotal;
> +
> +       if (stime)
> +               *stime = ktime_get();
> +
> +       line = dpu_encoder_get_linecount(encoder);
> +
> +       if (line < vactive_start)
> +               line -= vactive_start;
> +       else if (line > vactive_end)
> +               line = line - vfp_end - vactive_start;
> +       else
> +               line -= vactive_start;
> +
> +       *vpos = line;
> +       *hpos = 0;
> +
> +       if (etime)
> +               *etime = ktime_get();
> +
> +       return true;
> +}
> +
> +
>  static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
>                 struct dpu_plane_state *pstate, struct dpu_format *format)
>  {
> @@ -1243,6 +1310,7 @@ static const struct drm_crtc_funcs dpu_crtc_funcs = {
>         .early_unregister = dpu_crtc_early_unregister,
>         .enable_vblank  = msm_crtc_enable_vblank,
>         .disable_vblank = msm_crtc_disable_vblank,
> +       .get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
>  };
>
>  static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
> @@ -1251,6 +1319,7 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
>         .atomic_check = dpu_crtc_atomic_check,
>         .atomic_begin = dpu_crtc_atomic_begin,
>         .atomic_flush = dpu_crtc_atomic_flush,
> +       .get_scanout_position = dpu_crtc_get_scanout_position,
>  };

I'm happy to see get_vblank_timestamp/get_scanout_position wired up, I
had a WIP patch for this somewhere but never got around to finishing
it.

But you probably should mention in the commit msg why this is part of this patch

>
>  /* initialize crtc */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index f7f5c25..6c7c7fd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -425,6 +425,21 @@ int dpu_encoder_helper_unregister_irq(struct dpu_encoder_phys *phys_enc,
>         return 0;
>  }
>
> +int dpu_encoder_get_linecount(struct drm_encoder *drm_enc)
> +{
> +       struct dpu_encoder_virt *dpu_enc = NULL;
> +       struct dpu_encoder_phys *phys = NULL;
> +       int linecount = 0;
> +
> +       dpu_enc = to_dpu_encoder_virt(drm_enc);
> +       phys = dpu_enc ? dpu_enc->cur_master : NULL;
> +
> +       if (phys && phys->ops.get_line_count)
> +               linecount = phys->ops.get_line_count(phys);
> +
> +       return linecount;
> +}
> +
>  void dpu_encoder_get_hw_resources(struct drm_encoder *drm_enc,
>                                   struct dpu_encoder_hw_resources *hw_res)
>  {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index b491346..2c4804c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -156,5 +156,11 @@ void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc);
>   */
>  void dpu_encoder_set_idle_timeout(struct drm_encoder *drm_enc,
>                                                         u32 idle_timeout);
> +/**
> + * dpu_encoder_get_linecount - get interface line count for the encoder.
> + * @drm_enc:    Pointer to previously created drm encoder structure
> + */
> +

nit: remove extra line

BR,
-R

> +int dpu_encoder_get_linecount(struct drm_encoder *drm_enc);
>
>  #endif /* __DPU_ENCODER_H__ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 374b0e8..49bd0729 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -14,6 +14,7 @@
>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_file.h>
> +#include <drm/drm_vblank.h>
>
>  #include "msm_drv.h"
>  #include "msm_mmu.h"
> @@ -1020,6 +1021,9 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>          */
>         dev->mode_config.allow_fb_modifiers = true;
>
> +       /* Disable vblank irqs aggressively for power-saving */
> +       dev->vblank_disable_immediate = true;
> +
>         /*
>          * _dpu_kms_drm_obj_init should create the DRM related objects
>          * i.e. CRTCs, planes, encoders, connectors and so forth
> --
> 2.7.4
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
