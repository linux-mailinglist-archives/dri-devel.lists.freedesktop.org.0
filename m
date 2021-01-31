Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F24D9309E45
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jan 2021 20:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC28C6E092;
	Sun, 31 Jan 2021 19:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64FF76E069;
 Sun, 31 Jan 2021 19:14:15 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id a1so14320116wrq.6;
 Sun, 31 Jan 2021 11:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U8nxXe5xQj88timd/Lo9joFBv5MwWgjwhtJrqP+H1LA=;
 b=PpZG9Um3B5zQzzVBP4tZXzoaRyIDdUka0v1dnX5DpkSQFrDs6d0FOyIp63qoKhEAVi
 wDUhd6XzZYPXASFCzgigMWar3dMPFW+3n3KoewTD9OB2Twu/vnjlt0y73KpgITh5gAmd
 rDW3BotZae1IbyhjdkqL7whfRnJlcNPOuITFAV0Yhz++toJyabMQLTG03vhIaYOhrCY8
 1gLZFnWo4HINzKRRT9Lxo+3T+5RVip8t86ghb+sNf+dq6QCrW7a3joLNGVc1v9yzJXN7
 gKvxRoB2t6tjHJosmpXFqkzhm845f6ey6+2MAWXyDBQT5CpqpMiqNR86jm/b+8X1N+tB
 N80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U8nxXe5xQj88timd/Lo9joFBv5MwWgjwhtJrqP+H1LA=;
 b=OJvreMfcGMLvcGSCZe4G0ksi3+JpoVzFUboNBKxz0bnRjNuPlPihVOH7NmbUhmd1n5
 muZ2I7G/MkGY6GKN0z4ZKMNluLModOs87YLMOuHo1W51aVq3YO2hY4uE0h0oXJyTiVpz
 lCgfImhAyVcTgI/uFtrvqeuh4dc19eVSfB9+4nXb67EssQoKo0ybX8uebOYLm3jWm5cD
 7tPzulsNObnSJ2mY6r5naFWqpSNqe+FCxu//imj0PFHQb07yJVA7YbcYuJwwsZmHcFkb
 VmQ52/t6P56UfXS7b3si50OoiKWgd61G1w7KpDBCNhsFcgVnGeN1iFVhxWoTm+QJ52XQ
 K78A==
X-Gm-Message-State: AOAM530hR1nTDHvwS6fh3kkXaGm7IxnrKcJm1IsE7qTUV8JXYFJnzTw/
 TUv5TemwXlGjo3WlYgvU1Tjtc3keEYKeW6S7IL4=
X-Google-Smtp-Source: ABdhPJx7aikstHF7jYM5WihovsVBq8rhOwGcSN53yHKapUYVbJGwnm8IdsCa8NPnjjJW8tiTbHYX3O0vEIMmNF27qfw=
X-Received: by 2002:adf:9148:: with SMTP id j66mr15325996wrj.28.1612120453708; 
 Sun, 31 Jan 2021 11:14:13 -0800 (PST)
MIME-Version: 1.0
References: <1608287227-17685-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1608287227-17685-1-git-send-email-kalyan_t@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 31 Jan 2021 11:16:48 -0800
Message-ID: <CAF6AEGvvtDq7FK4NcKCc2FG2sbArBU-YboEA4u73oPR9o3coag@mail.gmail.com>
Subject: Re: [v2] drm/msm/disp/dpu1: turn off vblank irqs aggressively in dpu
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

On Fri, Dec 18, 2020 at 2:27 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
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
>  - Specify reason to add vblank timestamp support. (Rob)
>  - Add changes to provide vblank counter from dpu driver.
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>

This seems to be triggering:

[  +0.032668] ------------[ cut here ]------------
[  +0.004759] msm ae00000.mdss: drm_WARN_ON_ONCE(cur_vblank != vblank->last)
[  +0.000024] WARNING: CPU: 0 PID: 362 at
drivers/gpu/drm/drm_vblank.c:354 drm_update_vblank_count+0x1e4/0x258
[  +0.017154] Modules linked in: joydev
[  +0.003784] CPU: 0 PID: 362 Comm: frecon Not tainted
5.11.0-rc5-00037-g33d3504871dd #2
[  +0.008135] Hardware name: Google Lazor (rev1 - 2) with LTE (DT)
[  +0.006167] pstate: 60400089 (nZCv daIf +PAN -UAO -TCO BTYPE=--)
[  +0.006169] pc : drm_update_vblank_count+0x1e4/0x258
[  +0.005105] lr : drm_update_vblank_count+0x1e4/0x258
[  +0.005106] sp : ffffffc010003b70
[  +0.003409] x29: ffffffc010003b70 x28: ffffff80855d9d98
[  +0.005466] x27: 0000000000000000 x26: 0000000000fe502a
[  +0.005458] x25: 0000000000000001 x24: 0000000000000001
[  +0.005466] x23: 0000000000000001 x22: ffffff808561ce80
[  +0.005465] x21: 0000000000000000 x20: 0000000000000000
[  +0.005468] x19: ffffff80850d6800 x18: 0000000000000000
[  +0.005466] x17: 0000000000000000 x16: 0000000000000000
[  +0.005465] x15: 000000000000000a x14: 000000000000263b
[  +0.005466] x13: 0000000000000006 x12: ffffffffffffffff
[  +0.005465] x11: 0000000000000010 x10: ffffffc090003797
[  +0.005466] x9 : ffffffed200e2a8c x8 : 0000000000000000
[  +0.005466] x7 : 00000000ffffffff x6 : ffffffed213b2b51
[  +0.005465] x5 : c0000000ffffdfff x4 : ffffffed21218048
[  +0.005465] x3 : 0000000000000000 x2 : 0000000000000000
[  +0.005465] x1 : 0000000000000000 x0 : 0000000000000000
[  +0.005466] Call trace:
[  +0.002520]  drm_update_vblank_count+0x1e4/0x258
[  +0.004748]  drm_handle_vblank+0xd0/0x35c
[  +0.004130]  drm_crtc_handle_vblank+0x24/0x30
[  +0.004487]  dpu_crtc_vblank_callback+0x3c/0xc4
[  +0.004662]  dpu_encoder_vblank_callback+0x70/0xc4
[  +0.004931]  dpu_encoder_phys_vid_vblank_irq+0x50/0x12c
[  +0.005378]  dpu_core_irq_callback_handler+0xf4/0xfc
[  +0.005107]  dpu_hw_intr_dispatch_irq+0x100/0x120
[  +0.004834]  dpu_core_irq+0x44/0x5c
[  +0.003597]  dpu_irq+0x1c/0x28
[  +0.003141]  msm_irq+0x34/0x40
[  +0.003153]  __handle_irq_event_percpu+0xfc/0x254
[  +0.004838]  handle_irq_event_percpu+0x3c/0x94
[  +0.004574]  handle_irq_event+0x54/0x98
[  +0.003944]  handle_level_irq+0xa0/0xd0
[  +0.003943]  generic_handle_irq+0x30/0x48
[  +0.004131]  dpu_mdss_irq+0xe4/0x118
[  +0.003684]  generic_handle_irq+0x30/0x48
[  +0.004127]  __handle_domain_irq+0xa8/0xac
[  +0.004215]  gic_handle_irq+0xdc/0x150
[  +0.003856]  el1_irq+0xb4/0x180
[  +0.003237]  dpu_encoder_vsync_time+0x78/0x230
[  +0.004574]  dpu_encoder_kickoff+0x190/0x354
[  +0.004386]  dpu_crtc_commit_kickoff+0x194/0x1a0
[  +0.004748]  dpu_kms_flush_commit+0xf4/0x108
[  +0.004390]  msm_atomic_commit_tail+0x2e8/0x384
[  +0.004661]  commit_tail+0x80/0x108
[  +0.003588]  drm_atomic_helper_commit+0x118/0x11c
[  +0.004834]  drm_atomic_commit+0x58/0x68
[  +0.004033]  drm_atomic_helper_set_config+0x70/0x9c
[  +0.005018]  drm_mode_setcrtc+0x390/0x584
[  +0.004131]  drm_ioctl_kernel+0xc8/0x11c
[  +0.004035]  drm_ioctl+0x2f8/0x34c
[  +0.003500]  drm_compat_ioctl+0x48/0xe8
[  +0.003945]  __arm64_compat_sys_ioctl+0xe8/0x104
[  +0.004750]  el0_svc_common.constprop.0+0x114/0x188
[  +0.005019]  do_el0_svc_compat+0x28/0x38
[  +0.004031]  el0_svc_compat+0x20/0x30
[  +0.003772]  el0_sync_compat_handler+0x104/0x18c
[  +0.004749]  el0_sync_compat+0x178/0x180
[  +0.004034] ---[ end trace 2959d178e74f2555 ]---


BR,
-R

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 80 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 30 ++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        | 11 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  1 +
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 17 +++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  5 ++
>  6 files changed, 144 insertions(+)
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
> index 9a69fad..f983595 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -658,6 +658,22 @@ static int dpu_encoder_phys_vid_get_line_count(
>         return phys_enc->hw_intf->ops.get_line_count(phys_enc->hw_intf);
>  }
>
> +static int dpu_encoder_phys_vid_get_frame_count(
> +               struct dpu_encoder_phys *phys_enc)
> +{
> +       struct intf_status s = {0};
> +
> +       if (!dpu_encoder_phys_vid_is_master(phys_enc))
> +               return -EINVAL;
> +
> +       if (!phys_enc->hw_intf || !phys_enc->hw_intf->ops.get_status)
> +               return -EINVAL;
> +
> +       phys_enc->hw_intf->ops.get_status(phys_enc->hw_intf, &s);
> +
> +       return s.frame_count;
> +}
> +
>  static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
>  {
>         ops->is_master = dpu_encoder_phys_vid_is_master;
> @@ -676,6 +692,7 @@ static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
>         ops->handle_post_kickoff = dpu_encoder_phys_vid_handle_post_kickoff;
>         ops->needs_single_flush = dpu_encoder_phys_vid_needs_single_flush;
>         ops->get_line_count = dpu_encoder_phys_vid_get_line_count;
> +       ops->get_frame_count = dpu_encoder_phys_vid_get_frame_count;
>  }
>
>  struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 374b0e8..764a773 100644
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
> +       dev->max_vblank_count = 0;
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
