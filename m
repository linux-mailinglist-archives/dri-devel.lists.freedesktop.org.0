Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 601791A2CFE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 02:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449FB6EB1E;
	Thu,  9 Apr 2020 00:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF18C6EB1E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 00:44:11 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id z7so2064272wmk.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 17:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UrFJbX5QUnC1F5EZcY/0F9Wd5dk2POQ8j91y5JKB14Y=;
 b=WFP70uAn9FltTW6hCcis8UnVdfP0SJKRvuuZMd2qrhk/07YKe23uh2Cm3N48yCPVve
 pmNsQ8JXayT0xHxaAWgAKgwOtXasHzy9GrghhLzrUHtmKNVDWt0Q0wtJBn4m68Q/qhCc
 SUpQg1RWiZ8KzTSQqSYsx8TCtSahWvd6d41mGUTaknYqGF3qil20WU+9UzFYHSon7z7X
 YcOG8hzZEe7wifnYmxUUQTqHbfRjKzrWVXTeZKeBeTY/Ty9jAzuOx1tLUs5iYvVnmAK9
 HMEn+qMRy6WaOnX6kUE5qpAqEzdAt/CY3OzeRVzZvJA5q4qFArzd0pxf5Lzut7fvjYce
 UZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UrFJbX5QUnC1F5EZcY/0F9Wd5dk2POQ8j91y5JKB14Y=;
 b=FB4/w29LOHhqYN6v3mRvoC1AlsVWof5sSTGsuNAXY635V3aNoKI0TqxCbd/f2kDHh1
 18r3mAbCBnqv4fNwDbsz3IdRdf1qjwfpyQJIsL7/IGp+x9S7JaWamnHKl04OPvvvq+JP
 cnADjc9f6HkLlcJyOEmhnz25yOBwm/WEI5bqjcASGsA9qZHz6Zbu25sSZr/7AMX0WnhJ
 S9QBXx000nuGuCFiNXoUCkUfvyG/x5Ym7NkJUMZ7fFeWsiMsyx3K6v7oDzb001sZ8Cmm
 1ovVm1aasqqw1v5GKNtOmdHd2RXALsyaHq2v/dOCCBWotOmw2l7HVPzKI1cmxwONgZUM
 MMAA==
X-Gm-Message-State: AGi0PubN3hKNrly4629008GfQNpB+vyddp8jwERc/9uQ+Z8bYs7fuNtC
 FSjJ3DndIeKmFCnL3YaYpbKHIn4z80evhTmkBHFYfA==
X-Google-Smtp-Source: APiQypKGHfreOoY7ISM7lXZtkxyXml+xyGG3Wl3e7jLxhaaZZtYWqRaVqQQD6o6xbypLie2MwgR0s5eCI6kKUGefdIA=
X-Received: by 2002:a1c:cc11:: with SMTP id h17mr7252848wmb.39.1586393049742; 
 Wed, 08 Apr 2020 17:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <1585044079-358-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1585044079-358-1-git-send-email-kalyan_t@codeaurora.org>
From: Fritz Koenig <frkoenig@google.com>
Date: Wed, 8 Apr 2020 17:43:57 -0700
Message-ID: <CAMfZQby+bhjq9pLEAqeOCf1VwAAx=0-kUVNkxTUewOy+8z34PA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: add support for color processing blocks
 in dpu driver
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
Cc: mkrishn@codeaurora.org, travitej@codeaurora.org,
 linux-arm-msm@vger.kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
 hoegsberg@chromium.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 25, 2020 at 1:17 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> This change adds support to configure dspp blocks in
> the dpu driver.
>
> Macro description of the changes coming in this patch.
> 1) Add dspp definitions in the hw catalog.
> 2) Add capability to reserve dspp blocks in the display data path.
> 3) Attach the reserved block to the encoder.
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>

Tested-by: Fritz Koenig <frkoenig@google.com>

> ---
>  drivers/gpu/drm/msm/Makefile                   |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h       |  2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c    | 12 +++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 39 ++++++++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 39 ++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 26 ++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h     |  3 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c    | 82 ++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h    | 69 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h    |  2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h        |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         | 58 ++++++++++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h         |  2 +
>  drivers/gpu/drm/msm/msm_drv.h                  |  1 +
>  14 files changed, 322 insertions(+), 15 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
>
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 1579cf0..42f8aae 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -65,6 +65,7 @@ msm-y := \
>         disp/dpu1/dpu_hw_lm.o \
>         disp/dpu1/dpu_hw_pingpong.o \
>         disp/dpu1/dpu_hw_sspp.o \
> +       disp/dpu1/dpu_hw_dspp.o \
>         disp/dpu1/dpu_hw_top.o \
>         disp/dpu1/dpu_hw_util.o \
>         disp/dpu1/dpu_hw_vbif.o \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index 5174e86..cec3474 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -73,12 +73,14 @@ struct dpu_crtc_smmu_state_data {
>   * struct dpu_crtc_mixer: stores the map for each virtual pipeline in the CRTC
>   * @hw_lm:     LM HW Driver context
>   * @lm_ctl:    CTL Path HW driver context
> + * @lm_dspp:   DSPP HW driver context
>   * @mixer_op_mode:     mixer blending operation mode
>   * @flush_mask:        mixer flush mask for ctl, mixer and pipe
>   */
>  struct dpu_crtc_mixer {
>         struct dpu_hw_mixer *hw_lm;
>         struct dpu_hw_ctl *lm_ctl;
> +       struct dpu_hw_dspp *hw_dspp;
>         u32 mixer_op_mode;
>         u32 flush_mask;
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 42bf5c8..deebbba 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -20,6 +20,7 @@
>  #include "dpu_hw_catalog.h"
>  #include "dpu_hw_intf.h"
>  #include "dpu_hw_ctl.h"
> +#include "dpu_hw_dspp.h"
>  #include "dpu_formats.h"
>  #include "dpu_encoder_phys.h"
>  #include "dpu_crtc.h"
> @@ -537,6 +538,7 @@ static struct msm_display_topology dpu_encoder_get_topology(
>          * 1 LM, 1 INTF
>          * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
>          *
> +        * Adding color blocks only to primary interface
>          */
>         if (intf_count == 2)
>                 topology.num_lm = 2;
> @@ -545,6 +547,9 @@ static struct msm_display_topology dpu_encoder_get_topology(
>         else
>                 topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
>
> +       if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI)
> +               topology.num_dspp = topology.num_lm;
> +
>         topology.num_enc = 0;
>         topology.num_intf = intf_count;
>
> @@ -960,7 +965,8 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>         struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
>         struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
>         struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> -       int num_lm, num_ctl, num_pp;
> +       struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
> +       int num_lm, num_ctl, num_pp, num_dspp;
>         int i, j;
>
>         if (!drm_enc) {
> @@ -1009,6 +1015,9 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>                 drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
>         num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>                 drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> +       num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +               drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
> +               ARRAY_SIZE(hw_dspp));
>
>         for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
>                 dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
> @@ -1021,6 +1030,7 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>
>                 cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
>                 cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
> +               cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
>         }
>
>         cstate->num_mixers = num_lm;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index c567917..19d065a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -41,6 +41,8 @@
>  #define PINGPONG_SDM845_SPLIT_MASK \
>         (PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
>
> +#define DSPP_SC7180_MASK 0
> +
>  #define DEFAULT_PIXEL_RAM_SIZE         (50 * 1024)
>  #define DEFAULT_DPU_LINE_WIDTH         2048
>  #define DEFAULT_DPU_OUTPUT_LINE_WIDTH  2560
> @@ -291,29 +293,30 @@
>         },
>  };
>
> -#define LM_BLK(_name, _id, _base, _fmask, _sblk, _pp, _lmpair) \
> +#define LM_BLK(_name, _id, _base, _fmask, _sblk, _pp, _lmpair, _dspp) \
>         { \
>         .name = _name, .id = _id, \
>         .base = _base, .len = 0x320, \
>         .features = _fmask, \
>         .sblk = _sblk, \
>         .pingpong = _pp, \
> -       .lm_pair_mask = (1 << _lmpair) \
> +       .lm_pair_mask = (1 << _lmpair), \
> +       .dspp = _dspp \
>         }
>
>  static const struct dpu_lm_cfg sdm845_lm[] = {
>         LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> -               &sdm845_lm_sblk, PINGPONG_0, LM_1),
> +               &sdm845_lm_sblk, PINGPONG_0, LM_1, 0),
>         LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
> -               &sdm845_lm_sblk, PINGPONG_1, LM_0),
> +               &sdm845_lm_sblk, PINGPONG_1, LM_0, 0),
>         LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
> -               &sdm845_lm_sblk, PINGPONG_2, LM_5),
> +               &sdm845_lm_sblk, PINGPONG_2, LM_5, 0),
>         LM_BLK("lm_3", LM_3, 0x0, MIXER_SDM845_MASK,
> -               &sdm845_lm_sblk, PINGPONG_MAX, 0),
> +               &sdm845_lm_sblk, PINGPONG_MAX, 0, 0),
>         LM_BLK("lm_4", LM_4, 0x0, MIXER_SDM845_MASK,
> -               &sdm845_lm_sblk, PINGPONG_MAX, 0),
> +               &sdm845_lm_sblk, PINGPONG_MAX, 0, 0),
>         LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
> -               &sdm845_lm_sblk, PINGPONG_3, LM_2),
> +               &sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
>  };
>
>  /* SC7180 */
> @@ -328,12 +331,26 @@
>
>  static const struct dpu_lm_cfg sc7180_lm[] = {
>         LM_BLK("lm_0", LM_0, 0x44000, MIXER_SC7180_MASK,
> -               &sc7180_lm_sblk, PINGPONG_0, LM_1),
> +               &sc7180_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
>         LM_BLK("lm_1", LM_1, 0x45000, MIXER_SC7180_MASK,
> -               &sc7180_lm_sblk, PINGPONG_1, LM_0),
> +               &sc7180_lm_sblk, PINGPONG_1, LM_0, 0),
>  };
>
>  /*************************************************************
> + * DSPP sub blocks config
> + *************************************************************/
> +#define DSPP_BLK(_name, _id, _base) \
> +               {\
> +               .name = _name, .id = _id, \
> +               .base = _base, .len = 0x1800, \
> +               .features = DSPP_SC7180_MASK, \
> +               .sblk = NULL, \
> +               }
> +
> +static const struct dpu_dspp_cfg sc7180_dspp[] = {
> +       DSPP_BLK("dspp_0", DSPP_0, 0x54000),
> +};
> +/*************************************************************
>   * PINGPONG sub blocks config
>   *************************************************************/
>  static const struct dpu_pingpong_sub_blks sdm845_pp_sblk_te = {
> @@ -587,6 +604,8 @@ static void sc7180_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>                 .sspp = sc7180_sspp,
>                 .mixer_count = ARRAY_SIZE(sc7180_lm),
>                 .mixer = sc7180_lm,
> +               .dspp_count = ARRAY_SIZE(sc7180_dspp),
> +               .dspp = sc7180_dspp,
>                 .pingpong_count = ARRAY_SIZE(sc7180_pp),
>                 .pingpong = sc7180_pp,
>                 .intf_count = ARRAY_SIZE(sc7180_intf),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 09df7d8..f7de438 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -146,6 +146,17 @@ enum {
>  };
>
>  /**
> + * DSPP sub-blocks
> + * @DPU_DSPP_PCC             Panel color correction block
> + * @DPU_DSPP_GC              Gamma correction block
> + */
> +enum {
> +       DPU_DSPP_PCC = 0x1,
> +       DPU_DSPP_GC,
> +       DPU_DSPP_MAX
> +};
> +
> +/**
>   * PINGPONG sub-blocks
>   * @DPU_PINGPONG_TE         Tear check block
>   * @DPU_PINGPONG_TE2        Additional tear check block for split pipes
> @@ -377,6 +388,16 @@ struct dpu_lm_sub_blks {
>         struct dpu_pp_blk gc;
>  };
>
> +/**
> + * struct dpu_dspp_sub_blks: Information of DSPP block
> + * @gc : gamma correction block
> + * @pcc: pixel color correction block
> + */
> +struct dpu_dspp_sub_blks {
> +       struct dpu_pp_blk gc;
> +       struct dpu_pp_blk pcc;
> +};
> +
>  struct dpu_pingpong_sub_blks {
>         struct dpu_pp_blk te;
>         struct dpu_pp_blk te2;
> @@ -471,10 +492,24 @@ struct dpu_lm_cfg {
>         DPU_HW_BLK_INFO;
>         const struct dpu_lm_sub_blks *sblk;
>         u32 pingpong;
> +       u32 dspp;
>         unsigned long lm_pair_mask;
>  };
>
>  /**
> + * struct dpu_dspp_cfg - information of DSPP blocks
> + * @id                 enum identifying this block
> + * @base               register offset of this block
> + * @features           bit mask identifying sub-blocks/features
> + *                     supported by this block
> + * @sblk               sub-blocks information
> + */
> +struct dpu_dspp_cfg  {
> +       DPU_HW_BLK_INFO;
> +       const struct dpu_dspp_sub_blks *sblk;
> +};
> +
> +/**
>   * struct dpu_pingpong_cfg - information of PING-PONG blocks
>   * @id                 enum identifying this block
>   * @base               register offset of this block
> @@ -688,6 +723,9 @@ struct dpu_mdss_cfg {
>
>         u32 ad_count;
>
> +       u32 dspp_count;
> +       const struct dpu_dspp_cfg *dspp;
> +
>         /* Add additional block data structures here */
>
>         struct dpu_perf_cfg perf;
> @@ -716,6 +754,7 @@ struct dpu_mdss_hw_cfg_handler {
>  #define BLK_PINGPONG(s) ((s)->pingpong)
>  #define BLK_INTF(s) ((s)->intf)
>  #define BLK_AD(s) ((s)->ad)
> +#define BLK_DSPP(s) ((s)->dspp)
>
>  /**
>   * dpu_hw_catalog_init - dpu hardware catalog init API retrieves
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 831e5f7..613ae8f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -272,6 +272,31 @@ static int dpu_hw_ctl_active_get_bitmask_intf(struct dpu_hw_ctl *ctx,
>         return 0;
>  }
>
> +static uint32_t dpu_hw_ctl_get_bitmask_dspp(struct dpu_hw_ctl *ctx,
> +       enum dpu_dspp dspp)
> +{
> +       uint32_t flushbits = 0;
> +
> +       switch (dspp) {
> +       case DSPP_0:
> +               flushbits = BIT(13);
> +               break;
> +       case DSPP_1:
> +               flushbits = BIT(14);
> +               break;
> +       case DSPP_2:
> +               flushbits = BIT(15);
> +               break;
> +       case DSPP_3:
> +               flushbits = BIT(21);
> +               break;
> +       default:
> +               return 0;
> +       }
> +
> +       return flushbits;
> +}
> +
>  static u32 dpu_hw_ctl_poll_reset_status(struct dpu_hw_ctl *ctx, u32 timeout_us)
>  {
>         struct dpu_hw_blk_reg_map *c = &ctx->hw;
> @@ -548,6 +573,7 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
>         ops->setup_blendstage = dpu_hw_ctl_setup_blendstage;
>         ops->get_bitmask_sspp = dpu_hw_ctl_get_bitmask_sspp;
>         ops->get_bitmask_mixer = dpu_hw_ctl_get_bitmask_mixer;
> +       ops->get_bitmask_dspp = dpu_hw_ctl_get_bitmask_dspp;
>  };
>
>  static struct dpu_hw_blk_ops dpu_hw_ops;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index 09e1263..ec579b47 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -139,6 +139,9 @@ struct dpu_hw_ctl_ops {
>         uint32_t (*get_bitmask_mixer)(struct dpu_hw_ctl *ctx,
>                 enum dpu_lm blk);
>
> +       uint32_t (*get_bitmask_dspp)(struct dpu_hw_ctl *ctx,
> +               enum dpu_dspp blk);
> +
>         /**
>          * Query the value of the intf flush mask
>          * No effect on hardware
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> new file mode 100644
> index 0000000..75c82e9
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> @@ -0,0 +1,82 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> + */
> +
> +#include "dpu_hwio.h"
> +#include "dpu_hw_catalog.h"
> +#include "dpu_hw_lm.h"
> +#include "dpu_hw_dspp.h"
> +#include "dpu_kms.h"
> +
> +
> +static void _setup_dspp_ops(struct dpu_hw_dspp *c,
> +               unsigned long features)
> +{
> +       return;
> +}
> +
> +static const struct dpu_dspp_cfg *_dspp_offset(enum dpu_dspp dspp,
> +               const struct dpu_mdss_cfg *m,
> +               void __iomem *addr,
> +               struct dpu_hw_blk_reg_map *b)
> +{
> +       int i;
> +
> +       if (!m || !addr || !b)
> +               return ERR_PTR(-EINVAL);
> +
> +       for (i = 0; i < m->dspp_count; i++) {
> +               if (dspp == m->dspp[i].id) {
> +                       b->base_off = addr;
> +                       b->blk_off = m->dspp[i].base;
> +                       b->length = m->dspp[i].len;
> +                       b->hwversion = m->hwversion;
> +                       b->log_mask = DPU_DBG_MASK_DSPP;
> +                       return &m->dspp[i];
> +               }
> +       }
> +
> +       return ERR_PTR(-EINVAL);
> +}
> +
> +static struct dpu_hw_blk_ops dpu_hw_ops;
> +
> +struct dpu_hw_dspp *dpu_hw_dspp_init(enum dpu_dspp idx,
> +                       void __iomem *addr,
> +                       const struct dpu_mdss_cfg *m)
> +{
> +       struct dpu_hw_dspp *c;
> +       const struct dpu_dspp_cfg *cfg;
> +
> +       if (!addr || !m)
> +               return ERR_PTR(-EINVAL);
> +
> +       c = kzalloc(sizeof(*c), GFP_KERNEL);
> +       if (!c)
> +               return ERR_PTR(-ENOMEM);
> +
> +       cfg = _dspp_offset(idx, m, addr, &c->hw);
> +       if (IS_ERR_OR_NULL(cfg)) {
> +               kfree(c);
> +               return ERR_PTR(-EINVAL);
> +       }
> +
> +       /* Assign ops */
> +       c->idx = idx;
> +       c->cap = cfg;
> +       _setup_dspp_ops(c, c->cap->features);
> +
> +       dpu_hw_blk_init(&c->base, DPU_HW_BLK_DSPP, idx, &dpu_hw_ops);
> +
> +       return c;
> +}
> +
> +void dpu_hw_dspp_destroy(struct dpu_hw_dspp *dspp)
> +{
> +       if (dspp)
> +               dpu_hw_blk_destroy(&dspp->base);
> +
> +       kfree(dspp);
> +}
> +
> +
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
> new file mode 100644
> index 0000000..09807ea
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
> @@ -0,0 +1,69 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DPU_HW_DSPP_H
> +#define _DPU_HW_DSPP_H
> +
> +#include "dpu_hw_blk.h"
> +
> +struct dpu_hw_dspp;
> +
> +/**
> + * struct dpu_hw_dspp_ops - interface to the dspp hardware driver functions
> + * Caller must call the init function to get the dspp context for each dspp
> + * Assumption is these functions will be called after clocks are enabled
> + */
> +struct dpu_hw_dspp_ops {
> +
> +       void (*dummy)(struct dpu_hw_dspp *ctx);
> +};
> +
> +/**
> + * struct dpu_hw_dspp - dspp description
> + * @base: Hardware block base structure
> + * @hw: Block hardware details
> + * @idx: DSPP index
> + * @cap: Pointer to layer_cfg
> + * @ops: Pointer to operations possible for this DSPP
> + */
> +struct dpu_hw_dspp {
> +       struct dpu_hw_blk base;
> +       struct dpu_hw_blk_reg_map hw;
> +
> +       /* dspp */
> +       int idx;
> +       const struct dpu_dspp_cfg *cap;
> +
> +       /* Ops */
> +       struct dpu_hw_dspp_ops ops;
> +};
> +
> +/**
> + * dpu_hw_dspp - convert base object dpu_hw_base to container
> + * @hw: Pointer to base hardware block
> + * return: Pointer to hardware block container
> + */
> +static inline struct dpu_hw_dspp *to_dpu_hw_dspp(struct dpu_hw_blk *hw)
> +{
> +       return container_of(hw, struct dpu_hw_dspp, base);
> +}
> +
> +/**
> + * dpu_hw_dspp_init - initializes the dspp hw driver object.
> + * should be called once before accessing every dspp.
> + * @idx:  DSPP index for which driver object is required
> + * @addr: Mapped register io address of MDP
> + * @Return: pointer to structure or ERR_PTR
> + */
> +struct dpu_hw_dspp *dpu_hw_dspp_init(enum dpu_dspp idx,
> +       void __iomem *addr, const struct dpu_mdss_cfg *m);
> +
> +/**
> + * dpu_hw_dspp_destroy(): Destroys DSPP driver context
> + * @dspp: Pointer to DSPP driver context
> + */
> +void dpu_hw_dspp_destroy(struct dpu_hw_dspp *dspp);
> +
> +#endif /*_DPU_HW_DSPP_H */
> +
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index 6868821..402dc58 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -95,6 +95,7 @@ enum dpu_hw_blk_type {
>         DPU_HW_BLK_PINGPONG,
>         DPU_HW_BLK_INTF,
>         DPU_HW_BLK_WB,
> +       DPU_HW_BLK_DSPP,
>         DPU_HW_BLK_MAX,
>  };
>
> @@ -425,5 +426,6 @@ struct dpu_mdss_color {
>  #define DPU_DBG_MASK_TOP      (1 << 7)
>  #define DPU_DBG_MASK_VBIF     (1 << 8)
>  #define DPU_DBG_MASK_ROT      (1 << 9)
> +#define DPU_DBG_MASK_DSPP     (1 << 10)
>
>  #endif  /* _DPU_HW_MDSS_H */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index 211f5de9..4e32d04 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -158,6 +158,7 @@ struct dpu_global_state {
>         uint32_t mixer_to_enc_id[LM_MAX - LM_0];
>         uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
>         uint32_t intf_to_enc_id[INTF_MAX - INTF_0];
> +       uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
>  };
>
>  struct dpu_global_state
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 9b62451..9b2b504 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -9,6 +9,7 @@
>  #include "dpu_hw_ctl.h"
>  #include "dpu_hw_pingpong.h"
>  #include "dpu_hw_intf.h"
> +#include "dpu_hw_dspp.h"
>  #include "dpu_encoder.h"
>  #include "dpu_trace.h"
>
> @@ -174,6 +175,23 @@ int dpu_rm_init(struct dpu_rm *rm,
>                 rm->ctl_blks[ctl->id - CTL_0] = &hw->base;
>         }
>
> +       for (i = 0; i < cat->dspp_count; i++) {
> +               struct dpu_hw_dspp *hw;
> +               const struct dpu_dspp_cfg *dspp = &cat->dspp[i];
> +
> +               if (dspp->id < DSPP_0 || dspp->id >= DSPP_MAX) {
> +                       DPU_ERROR("skip dspp %d with invalid id\n", dspp->id);
> +                       continue;
> +               }
> +               hw = dpu_hw_dspp_init(dspp->id, mmio, cat);
> +               if (IS_ERR_OR_NULL(hw)) {
> +                       rc = PTR_ERR(hw);
> +                       DPU_ERROR("failed dspp object creation: err %d\n", rc);
> +                       goto fail;
> +               }
> +               rm->dspp_blks[dspp->id - DSPP_0] = &hw->base;
> +       }
> +
>         return 0;
>
>  fail:
> @@ -222,12 +240,17 @@ static bool _dpu_rm_check_lm_peer(struct dpu_rm *rm, int primary_idx,
>   *      if lm, and all other hardwired blocks connected to the lm (pp) is
>   *      available and appropriate
>   * @pp_idx: output parameter, index of pingpong block attached to the layer
> - *      mixer in rm->pongpong_blks[].
> + *      mixer in rm->pingpong_blks[].
> + * @dspp_idx: output parameter, index of dspp block attached to the layer
> + *      mixer in rm->dspp_blks[].
> + * @reqs: input parameter, rm requirements for HW blocks needed in the
> + *      datapath.
>   * @Return: true if lm matches all requirements, false otherwise
>   */
>  static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
>                 struct dpu_global_state *global_state,
> -               uint32_t enc_id, int lm_idx, int *pp_idx)
> +               uint32_t enc_id, int lm_idx, int *pp_idx, int *dspp_idx,
> +               struct dpu_rm_requirements *reqs)
>  {
>         const struct dpu_lm_cfg *lm_cfg;
>         int idx;
> @@ -251,6 +274,23 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
>                 return false;
>         }
>         *pp_idx = idx;
> +
> +       if (!reqs->topology.num_dspp)
> +               return true;
> +
> +       idx = lm_cfg->dspp - DSPP_0;
> +       if (idx < 0 || idx >= ARRAY_SIZE(rm->dspp_blks)) {
> +               DPU_ERROR("failed to get dspp on lm %d\n", lm_cfg->dspp);
> +               return false;
> +       }
> +
> +       if (reserved_by_other(global_state->dspp_to_enc_id, idx, enc_id)) {
> +               DPU_DEBUG("lm %d dspp %d already reserved\n", lm_cfg->id,
> +                               lm_cfg->dspp);
> +               return false;
> +       }
> +       *dspp_idx = idx;
> +
>         return true;
>  }
>
> @@ -262,6 +302,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>  {
>         int lm_idx[MAX_BLOCKS];
>         int pp_idx[MAX_BLOCKS];
> +       int dspp_idx[MAX_BLOCKS] = {0};
>         int i, j, lm_count = 0;
>
>         if (!reqs->topology.num_lm) {
> @@ -279,7 +320,8 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>                 lm_idx[lm_count] = i;
>
>                 if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,
> -                               enc_id, i, &pp_idx[lm_count])) {
> +                               enc_id, i, &pp_idx[lm_count],
> +                               &dspp_idx[lm_count], reqs)) {
>                         continue;
>                 }
>
> @@ -299,7 +341,8 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>
>                         if (!_dpu_rm_check_lm_and_get_connected_blks(rm,
>                                         global_state, enc_id, j,
> -                                       &pp_idx[lm_count])) {
> +                                       &pp_idx[lm_count], &dspp_idx[lm_count],
> +                                       reqs)) {
>                                 continue;
>                         }
>
> @@ -316,6 +359,8 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>         for (i = 0; i < lm_count; i++) {
>                 global_state->mixer_to_enc_id[lm_idx[i]] = enc_id;
>                 global_state->pingpong_to_enc_id[pp_idx[i]] = enc_id;
> +               global_state->dspp_to_enc_id[dspp_idx[i]] =
> +                       reqs->topology.num_dspp ? enc_id : 0;
>
>                 trace_dpu_rm_reserve_lms(lm_idx[i] + LM_0, enc_id,
>                                          pp_idx[i] + PINGPONG_0);
> @@ -560,6 +605,11 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>                 hw_to_enc_id = global_state->intf_to_enc_id;
>                 max_blks = ARRAY_SIZE(rm->intf_blks);
>                 break;
> +       case DPU_HW_BLK_DSPP:
> +               hw_blks = rm->dspp_blks;
> +               hw_to_enc_id = global_state->dspp_to_enc_id;
> +               max_blks = ARRAY_SIZE(rm->dspp_blks);
> +               break;
>         default:
>                 DPU_ERROR("blk type %d not managed by rm\n", type);
>                 return 0;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> index 6d2b04f..08726bb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> @@ -19,6 +19,7 @@
>   * @mixer_blks: array of layer mixer hardware resources
>   * @ctl_blks: array of ctl hardware resources
>   * @intf_blks: array of intf hardware resources
> + * @dspp_blks: array of dspp hardware resources
>   * @lm_max_width: cached layer mixer maximum width
>   * @rm_lock: resource manager mutex
>   */
> @@ -27,6 +28,7 @@ struct dpu_rm {
>         struct dpu_hw_blk *mixer_blks[LM_MAX - LM_0];
>         struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
>         struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
> +       struct dpu_hw_blk *dspp_blks[DSPP_MAX - DSPP_0];
>
>         uint32_t lm_max_width;
>  };
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 740bf7c..94f1607 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -105,6 +105,7 @@ struct msm_display_topology {
>         u32 num_lm;
>         u32 num_enc;
>         u32 num_intf;
> +       u32 num_dspp;
>  };
>
>  /**
> --
> 1.9.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
