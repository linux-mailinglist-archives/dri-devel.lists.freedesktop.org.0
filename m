Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EE25AAD20
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 13:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E45A10E7FA;
	Fri,  2 Sep 2022 11:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9172510E7FC
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 11:09:44 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id 62so1311832iov.5
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Sep 2022 04:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=rnQqxt9RdPdB0yUEssxLU4y2HHyz75pTKHB4+46VEDk=;
 b=YKMkFg2wcPO+GodKwxrdiBk5aFGvc4yu22RjgCrVptcEBKO6OgdpYUwKn8VSn7WS3S
 ffZNZuofiRlmNSKy8Hcck8r7/Y9wNBKmAXu0E04iAcB3PTicRO6pT6IenW5tLn9NZ2CZ
 isXEYIaH4L0RE60P0q2N/Yhk/2OQnldSjH3VhjtZ1ZPlYHSaUGEIVWCk0KSzWI7U9cSQ
 ddfLFuAdVc9qdOq+nR6uLx6S/7IVBahR2Q+GBW6rHK8p2v439nzodxdoJ87U3VnsVCQ3
 lm7Yt364E06teOxa6lNvMH90SpIs91MEdBPtGlZMWlidcKFuMZW8/KIlOy4Ak45sFgcH
 AWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=rnQqxt9RdPdB0yUEssxLU4y2HHyz75pTKHB4+46VEDk=;
 b=a65oZA9wbvmGkVA+tpL39reBiKiG6SyAYrOuQSqbSSvShEKI16erjz0lmeyzLA9JyM
 nLvOdU9TuXnguClCadbUqsqxc/TBMw4GWz/CL+wdieLDSEhazfeLrlxySJdwKaqDDkp8
 n1u2jlHL9xLLEXxmHP40ZZPxCHgTEoaSlmhtuC+B/Krb8SyjpFJPXRjww4eD90SrQ9zD
 fH5/5FTQPwS5IX+EcyFhjTiIPdnjedC6CYniKzqerIE8Zqyv9Vz8gbFYogxVJUd3epIY
 idAwuCdv+QH/HEWGXHKMFYYob6Mzd3lxHaCIVrecuxcGfkH2Ra2P3L6s0vvZL9+T1B2z
 JvvA==
X-Gm-Message-State: ACgBeo1ngyHds9rnxRS4yMLThmFwvQ+sFayvEDxqovodGjc6Ez9+yVBE
 T5/UBhCGmhxjT6xD40YFz7m+knafIHgx/8XdR+HgXQ==
X-Google-Smtp-Source: AA6agR4qznCELC8Uk9g2P6txc/sJEZSXNo9TqSMZMSDnKvqiRarJOjhs/bocMU285biwzGnSM19C+Sc/gMDUmmDPcOg=
X-Received: by 2002:a05:6638:3792:b0:346:82f6:a9f4 with SMTP id
 w18-20020a056638379200b0034682f6a9f4mr19375402jal.102.1662116983612; Fri, 02
 Sep 2022 04:09:43 -0700 (PDT)
MIME-Version: 1.0
References: <1662111486-15021-1-git-send-email-quic_kalyant@quicinc.com>
In-Reply-To: <1662111486-15021-1-git-send-email-quic_kalyant@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 2 Sep 2022 14:09:32 +0300
Message-ID: <CAA8EJpqwB9Skq_DVwHERn0Soz=4hHLDiyzyeEteWfb6QbePU4g@mail.gmail.com>
Subject: Re: [v2] drm/msm/disp/dpu1: add support for dspp sub block flush in
 sc7280
To: Kalyan Thota <quic_kalyant@quicinc.com>
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
Cc: devicetree@vger.kernel.org, quic_abhinavk@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org, quic_vpolimer@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2 Sept 2022 at 12:38, Kalyan Thota <quic_kalyant@quicinc.com> wrote:
>
> Flush mechanism for DSPP blocks has changed in sc7280 family, it
> allows individual sub blocks to be flushed in coordination with
> master flush control.
>
> Representation: master_flush && (PCC_flush | IGC_flush .. etc )
>
> This change adds necessary support for the above design.
>
> Changes in v1:
> - Few nits (Doug, Dmitry)
> - Restrict sub-block flush programming to dpu_hw_ctl file (Dmitry)
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  5 +++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 35 +++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h     | 10 ++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h    |  7 ++++++
>  6 files changed, 56 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 601d687..ab38a52 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -766,7 +766,7 @@ static void _dpu_crtc_setup_cp_blocks(struct drm_crtc *crtc)
>
>                 /* stage config flush mask */
>                 ctl->ops.update_pending_flush_dspp(ctl,
> -                       mixer[i].hw_dspp->idx);
> +                       mixer[i].hw_dspp->idx, DPU_DSPP_SUB_PCC);
>         }
>  }
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 27f029f..0eecb2f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -65,7 +65,10 @@
>         (PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
>
>  #define CTL_SC7280_MASK \
> -       (BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE) | BIT(DPU_CTL_VM_CFG))
> +       (BIT(DPU_CTL_ACTIVE_CFG) | \
> +        BIT(DPU_CTL_FETCH_ACTIVE) | \
> +        BIT(DPU_CTL_VM_CFG) | \
> +        BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
>
>  #define MERGE_3D_SM8150_MASK (0)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 38aa38a..6a0b784 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -191,6 +191,7 @@ enum {
>   * @DPU_CTL_SPLIT_DISPLAY:     CTL supports video mode split display
>   * @DPU_CTL_FETCH_ACTIVE:      Active CTL for fetch HW (SSPPs)
>   * @DPU_CTL_VM_CFG:            CTL config to support multiple VMs
> + * @DPU_CTL_DSPP_BLOCK_FLUSH: CTL config to support dspp sub-block flush
>   * @DPU_CTL_MAX
>   */
>  enum {
> @@ -198,6 +199,7 @@ enum {
>         DPU_CTL_ACTIVE_CFG,
>         DPU_CTL_FETCH_ACTIVE,
>         DPU_CTL_VM_CFG,
> +       DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
>         DPU_CTL_MAX
>  };
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index a35ecb6..3b14c30 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -33,6 +33,7 @@
>  #define   CTL_INTF_FLUSH                0x110
>  #define   CTL_INTF_MASTER               0x134
>  #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
> +#define   CTL_DSPP_n_FLUSH             0x13C

CTL_DSPP_n_FLUSH(n)

>
>  #define CTL_MIXER_BORDER_OUT            BIT(24)
>  #define CTL_FLUSH_MASK_CTL              BIT(17)
> @@ -82,6 +83,31 @@ static int _mixer_stages(const struct dpu_lm_cfg *mixer, int count,
>         return stages;
>  }
>
> +static u32 _set_dspp_sub_block_flush(struct dpu_hw_ctl *ctx,
> +       enum dpu_dspp dspp, enum dpu_dspp_sub_blk dspp_sub_blk)
> +{
> +       uint32_t flushbits = 0, active;
> +
> +       switch (dspp_sub_blk) {
> +       case DPU_DSPP_SUB_IGC:
> +               flushbits = BIT(2);
> +               break;
> +       case DPU_DSPP_SUB_PCC:
> +               flushbits = BIT(4);
> +               break;
> +       case DPU_DSPP_SUB_GC:
> +               flushbits = BIT(5);
> +               break;
> +       default:
> +               return 0;
> +       }
> +
> +       active = DPU_REG_READ(&ctx->hw, CTL_DSPP_n_FLUSH + ((dspp - 1) * 4));
> +       DPU_REG_WRITE(&ctx->hw, CTL_DSPP_n_FLUSH + ((dspp - 1) * 4), active | flushbits);
> +
> +       return BIT(29);
> +}
> +
>  static inline u32 dpu_hw_ctl_get_flush_register(struct dpu_hw_ctl *ctx)
>  {
>         struct dpu_hw_blk_reg_map *c = &ctx->hw;
> @@ -287,8 +313,15 @@ static void dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,
>  }
>
>  static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx,
> -       enum dpu_dspp dspp)
> +       enum dpu_dspp dspp, enum dpu_dspp_sub_blk dspp_sub_blk)
>  {
> +
> +       if ((test_bit(DPU_CTL_DSPP_SUB_BLOCK_FLUSH, &ctx->caps->features))) {
> +               ctx->pending_flush_mask |=
> +                       _set_dspp_sub_block_flush(ctx, dspp, dspp_sub_blk);
> +               return;
> +       }

Please  inline _set_dspp_sub_block_flush(), split this if to a
separate function (e.g.
dpu_hw_ctl_update_pending_flush_dspp_subblocks()), and use it instead
of dpu_hw_ctl_update_pending_flush_dspp like it was done before.

> +
>         switch (dspp) {
>         case DSPP_0:
>                 ctx->pending_flush_mask |= BIT(13);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index 96c012e..227f1bd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -149,12 +149,18 @@ struct dpu_hw_ctl_ops {
>
>         /**
>          * OR in the given flushbits to the cached pending_flush_mask
> -        * No effect on hardware
> +        *
> +        * If the hardware supports dspp sub block flush, then sub-block
> +        * flushes are written to the hardware and main dspp flush will
> +        * be cached in the pending_flush_mask.
> +        *
>          * @ctx       : ctl path ctx pointer
>          * @blk       : DSPP block index
> +        * @dspp_sub_blk : DSPP sub-block index
>          */
>         void (*update_pending_flush_dspp)(struct dpu_hw_ctl *ctx,
> -               enum dpu_dspp blk);
> +               enum dpu_dspp blk,  enum dpu_dspp_sub_blk dspp_sub_blk);
> +
>         /**
>          * Write the value of the pending_flush_mask to hardware
>          * @ctx       : ctl path ctx pointer
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index d3b0ed0..c113d52 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -167,6 +167,13 @@ enum dpu_dspp {
>         DSPP_MAX
>  };
>
> +enum dpu_dspp_sub_blk{
> +       DPU_DSPP_SUB_PCC = 1,
> +       DPU_DSPP_SUB_IGC,
> +       DPU_DSPP_SUB_GC,
> +       DPU_DSPP_SUB_MAX
> +};

Can we please use the existing enum DPU_DSPP_foo instead of adding a
new enum for no particular reason?

> +
>  enum dpu_ctl {
>         CTL_0 = 1,
>         CTL_1,
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
