Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9241321C30
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 17:06:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76AC16E951;
	Mon, 22 Feb 2021 16:06:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020216E94F;
 Mon, 22 Feb 2021 16:06:01 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v1so19635489wrd.6;
 Mon, 22 Feb 2021 08:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nbAcmhlGdjKSXvwOTcRLldAj5yGwOd44DYbhKMd4N98=;
 b=rbaSKiu1dCcBLjobCvCLJk5Wyfoqo2Q9/mjM0yBMS2aIEwlCJ2geyVEqoY3uPIY4F+
 +XiarhhQcXnHgnvAfR+uEh15t5Sqw3t7TEo3HJiT8pkbOFrbDZLR/xEAg3QbqvuxC5Fu
 mmJaXIQ3R+xvh4pbU72lEnHplzR5fMSVCS0mxa+uut8d2tZY9Neq8tPYh1i/Q/o5IWrh
 PDLmGDDtHWT9b16yvp+YWKkqMyedwBTODRZULViwiM+LZcW0/ZSnhs7uzFEIQRQsYISJ
 ET0e2xN4awPAFpTipJGEs2dmrPOHoTX0AXtVTYwPAZMYumEM6l+PI2amluSorouQmzFE
 qwdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nbAcmhlGdjKSXvwOTcRLldAj5yGwOd44DYbhKMd4N98=;
 b=on8vyQiawxO4T1wBduQAmtL0mEHFx/tkjxDcfqA7U6cb/0jDR5rCxQz/0D/2SvT7jP
 uXv2ddbVB41W47FkpQUDqnZSGhTz0VgmzjxQbKHDEIoyohb45vx/P7Yu++kIpNn5EMF8
 NMFRuvasa7Xteltt4Vo/jTtWDY5eMvINU8Q+q1q/ALKVnDt8YD8zxID+6Z5jKfib/whg
 ZzEgsJoDgmOCbf9eR8Im2oxc6+FnjoLq8idI9lm3Uz/zK70ncunXkOuPuGtzD2sm2FBs
 ZpRcHkhtt7SEAPWiLt2Zp6xepKpW9+6pcAFXb29Lj6Y5GKxn/nm3gezZGK35HY2VQLLN
 kqQw==
X-Gm-Message-State: AOAM530SaAvqtK1pN6lFJd4Q3itruw446sKolbpJpb6eP2B6KfftRUeG
 n8sDopndmvyMgumoqMLIaA96tTLnk+yi5ODPtGOpM6uXthg=
X-Google-Smtp-Source: ABdhPJyHopO6mHb5EqDxulpT9Kha5K6c7fkNDS9RDfIbaq/fasNvz9dIU6/yCZ0mtcRfR7Y+jsJJYiajcjUQhBWEM9k=
X-Received: by 2002:adf:dd44:: with SMTP id u4mr4590975wrm.327.1614009960544; 
 Mon, 22 Feb 2021 08:06:00 -0800 (PST)
MIME-Version: 1.0
References: <1613651746-12783-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1613651746-12783-1-git-send-email-kalyan_t@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 22 Feb 2021 08:08:58 -0800
Message-ID: <CAF6AEGuyGf2qXK-obqVfj8utKUh5uKVn8Pc-4Uk7h0S3eZme5g@mail.gmail.com>
Subject: Re: [v4] drm/msm/disp/dpu1: turn off vblank irqs aggressively in dpu
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

On Thu, Feb 18, 2021 at 4:36 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> Set the flag vblank_disable_immediate = true to turn off vblank irqs
> immediately as soon as drm_vblank_put is requested so that there are
> no irqs triggered during idle state. This will reduce cpu wakeups
> and help in power saving.
>
> To enable vblank_disable_immediate flag the underlying KMS driver
> needs to support high precision vblank timestamping and also a
> reliable way of providing vblank counter which is incrementing
> at the leading edge of vblank.
>
> This patch also brings in changes to support vblank_disable_immediate
> requirement in dpu driver.
>
> Changes in v1:
>  - Specify reason to add vblank timestamp support. (Rob).
>  - Add changes to provide vblank counter from dpu driver.
>
> Changes in v2:
>  - Fix warn stack reported by Rob Clark with v2 patch.
>
> Changes in v3:
>  - Move back to HW frame counter (Rob).
>

could you let me know what the delta was in v4?  (No need to resend
yet, if needed I can amend the commit msg when applying)

BR,
-R

>  Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 80 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 30 ++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        | 11 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  1 +
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 26 +++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  5 ++
>  8 files changed, 155 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index d4662e8..9a80981 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -65,6 +65,83 @@ static void dpu_crtc_destroy(struct drm_crtc *crtc)
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
> +static u32 dpu_crtc_get_vblank_counter(struct drm_crtc *crtc)
> +{
> +       struct drm_encoder *encoder;
> +
> +       encoder = get_encoder_from_crtc(crtc);
> +       if (!encoder) {
> +               DRM_ERROR("no encoder found for crtc %d\n", crtc->index);
> +               return false;
> +       }
> +
> +       return dpu_encoder_get_frame_count(encoder);
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
>  static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
>                 struct dpu_plane_state *pstate, struct dpu_format *format)
>  {
> @@ -1243,6 +1320,8 @@ static const struct drm_crtc_funcs dpu_crtc_funcs = {
>         .early_unregister = dpu_crtc_early_unregister,
>         .enable_vblank  = msm_crtc_enable_vblank,
>         .disable_vblank = msm_crtc_disable_vblank,
> +       .get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
> +       .get_vblank_counter = dpu_crtc_get_vblank_counter,
>  };
>
>  static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
> @@ -1251,6 +1330,7 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
>         .atomic_check = dpu_crtc_atomic_check,
>         .atomic_begin = dpu_crtc_atomic_begin,
>         .atomic_flush = dpu_crtc_atomic_flush,
> +       .get_scanout_position = dpu_crtc_get_scanout_position,
>  };
>
>  /* initialize crtc */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index f7f5c25..5cd3f31 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -425,6 +425,36 @@ int dpu_encoder_helper_unregister_irq(struct dpu_encoder_phys *phys_enc,
>         return 0;
>  }
>
> +int dpu_encoder_get_frame_count(struct drm_encoder *drm_enc)
> +{
> +       struct dpu_encoder_virt *dpu_enc;
> +       struct dpu_encoder_phys *phys;
> +       int framecount = 0;
> +
> +       dpu_enc = to_dpu_encoder_virt(drm_enc);
> +       phys = dpu_enc ? dpu_enc->cur_master : NULL;
> +
> +       if (phys && phys->ops.get_frame_count)
> +               framecount = phys->ops.get_frame_count(phys);
> +
> +       return framecount;
> +}
> +
> +int dpu_encoder_get_linecount(struct drm_encoder *drm_enc)
> +{
> +       struct dpu_encoder_virt *dpu_enc;
> +       struct dpu_encoder_phys *phys;
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
> index b491346..99a5d73 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -156,5 +156,16 @@ void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc);
>   */
>  void dpu_encoder_set_idle_timeout(struct drm_encoder *drm_enc,
>                                                         u32 idle_timeout);
> +/**
> + * dpu_encoder_get_linecount - get interface line count for the encoder.
> + * @drm_enc:    Pointer to previously created drm encoder structure
> + */
> +int dpu_encoder_get_linecount(struct drm_encoder *drm_enc);
> +
> +/**
> + * dpu_encoder_get_frame_count - get interface frame count for the encoder.
> + * @drm_enc:    Pointer to previously created drm encoder structure
> + */
> +int dpu_encoder_get_frame_count(struct drm_encoder *drm_enc);
>
>  #endif /* __DPU_ENCODER_H__ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index f8f2515..ecbc4be 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -143,6 +143,7 @@ struct dpu_encoder_phys_ops {
>         void (*prepare_idle_pc)(struct dpu_encoder_phys *phys_enc);
>         void (*restore)(struct dpu_encoder_phys *phys);
>         int (*get_line_count)(struct dpu_encoder_phys *phys);
> +       int (*get_frame_count)(struct dpu_encoder_phys *phys);
>  };
>
>  /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index 9a69fad..0e06b7e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -658,6 +658,31 @@ static int dpu_encoder_phys_vid_get_line_count(
>         return phys_enc->hw_intf->ops.get_line_count(phys_enc->hw_intf);
>  }
>
> +static int dpu_encoder_phys_vid_get_frame_count(
> +               struct dpu_encoder_phys *phys_enc)
> +{
> +       struct intf_status s = {0};
> +       u32 fetch_start = 0;
> +       struct drm_display_mode mode = phys_enc->cached_mode;
> +
> +       if (!dpu_encoder_phys_vid_is_master(phys_enc))
> +               return -EINVAL;
> +
> +       if (!phys_enc->hw_intf || !phys_enc->hw_intf->ops.get_status)
> +               return -EINVAL;
> +
> +       phys_enc->hw_intf->ops.get_status(phys_enc->hw_intf, &s);
> +
> +       if (s.is_prog_fetch_en && s.is_en) {
> +               fetch_start = mode.vtotal - (mode.vsync_start - mode.vdisplay);
> +               if ((s.line_count > fetch_start) &&
> +                       (s.line_count <= mode.vtotal))
> +                       return s.frame_count + 1;
> +       }
> +
> +       return s.frame_count;
> +}
> +
>  static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
>  {
>         ops->is_master = dpu_encoder_phys_vid_is_master;
> @@ -676,6 +701,7 @@ static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
>         ops->handle_post_kickoff = dpu_encoder_phys_vid_handle_post_kickoff;
>         ops->needs_single_flush = dpu_encoder_phys_vid_needs_single_flush;
>         ops->get_line_count = dpu_encoder_phys_vid_get_line_count;
> +       ops->get_frame_count = dpu_encoder_phys_vid_get_frame_count;
>  }
>
>  struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 6f0f545..717178b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -256,6 +256,7 @@ static void dpu_hw_intf_get_status(
>         struct dpu_hw_blk_reg_map *c = &intf->hw;
>
>         s->is_en = DPU_REG_READ(c, INTF_TIMING_ENGINE_EN);
> +       s->is_prog_fetch_en = !!(DPU_REG_READ(c, INTF_CONFIG) & BIT(31));
>         if (s->is_en) {
>                 s->frame_count = DPU_REG_READ(c, INTF_FRAME_COUNT);
>                 s->line_count = DPU_REG_READ(c, INTF_LINE_COUNT);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index 0ead64d..3568be8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -40,6 +40,7 @@ struct intf_prog_fetch {
>
>  struct intf_status {
>         u8 is_en;               /* interface timing engine is enabled or not */
> +       u8 is_prog_fetch_en;    /* interface prog fetch counter is enabled or not */
>         u32 frame_count;        /* frame count since timing engine enabled */
>         u32 line_count;         /* current line count including blanking */
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 374b0e8..ed636f1 100644
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
> @@ -1020,6 +1021,10 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>          */
>         dev->mode_config.allow_fb_modifiers = true;
>
> +       dev->max_vblank_count = 0xffffffff;
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
