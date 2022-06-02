Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5350753B447
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 09:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 759A410EFF4;
	Thu,  2 Jun 2022 07:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC21F10EFDE
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 07:24:45 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id e66so4029695pgc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 00:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x8Vbs61daxKxC81RdkHr2YNi/qkjfIq9G9us0XQvjY0=;
 b=MDVMZEGmuKsGYQR1y7V/9rnqsFnXMrbuAUGKkhY28WQObgRAFQzgTtCEkeMiyBALSk
 XbwQTAa8MaZU8GmiwkkNlZK4pWFiwmrpPi58ZEqpQEMl7qxtvdHNy7zU2Cq8nMeT/nOg
 UMinioOMU9/ftJtQhTpVMSaKBXO68Tg98ku3+N9pTSpOlDHgJxpmdTE00y48we4Hz4EM
 CFU76A3F4jfT8Io9bXmHRN/JJroSA/Knzmnwk+IgRpPeQm5REWkWdovtwuN5tliy5NSQ
 8PDTOlZ3gxG62ZMhAN89TJs7fwH3VTEuSeh7fqdF64u7V7wETkEbWHDrA2iavXddiKaz
 9O5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x8Vbs61daxKxC81RdkHr2YNi/qkjfIq9G9us0XQvjY0=;
 b=oNuHPJnZP2KOzdSHVbB0DzLQQFhf433WzwJ7A404mFTAqdtNlrzCbO4svGUjRs36WB
 PF3ksMaVOHWt794aY6cxmZuf5eFkuTZfxhIZtRVt1A0jn09tH+CRRG5YSLFKHmIrpE4K
 k7gCWJx5MYComoS5IIh2CIbWI2Zcij5gFsPOxOhkKzMPwc/sUjoU1j0GbuvP2XxYvxlh
 5Zk8aKf6mW1yhzrrTvJRhOIMbDnqhJTfn19eIn0J57XMUXTvmWr/OoqWhVep5KJhfrW7
 Nbr9D7bdYYIPuKsC6lqHBJiYBsVfdE7ykeBgUll95TDmyKru2mv+l3hdKLapn1q25TIJ
 sKgw==
X-Gm-Message-State: AOAM532m710EJRxtPazQC35S1IAO+WHD3zvNOXeuEh8PrUrbEUK5Hy05
 JegEofEO1X4SYczINhiObdk4UHST/REmlZF6XIQ=
X-Google-Smtp-Source: ABdhPJzCOitF0JawrrdIwcrQz04GOhSETmxaIae5+MBQp5Wy1iNGpSdWyyqminnpYBNnFbm3Z4pXWMKGQU5o/k7FQBs=
X-Received: by 2002:a63:8749:0:b0:3fc:9fd7:1e20 with SMTP id
 i70-20020a638749000000b003fc9fd71e20mr3090323pge.619.1654154685285; Thu, 02
 Jun 2022 00:24:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220531111502.4470-1-tzimmermann@suse.de>
 <20220531111502.4470-2-tzimmermann@suse.de>
In-Reply-To: <20220531111502.4470-2-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 2 Jun 2022 09:24:33 +0200
Message-ID: <CAMeQTsa7wTzY4LcM4E-kM2y4AaTVEVSSfppmwdV9jpqAZbNQJQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] drm/ast: Support multiple outputs
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 31, 2022 at 1:15 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Systems with AST graphics can have multiple output; typically VGA
> plus some other port. Record detected output chips in a bitmask and
> initialize each output on its own.
>
> Assume a VGA output by default and use SIL164 and DP501 if available.
> For ASTDP assume that it can run in parallel with VGA.
>
> Tested on AST2100.
>
> v2:
>         * make VGA/SIL164/DP501 mutually exclusive
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: a59b026419f3 ("drm/ast: Initialize encoder and connector for VGA in helper function")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/ast/ast_dp.c    |  5 ++---
>  drivers/gpu/drm/ast/ast_dp501.c |  2 +-
>  drivers/gpu/drm/ast/ast_drv.h   |  4 ++--
>  drivers/gpu/drm/ast/ast_main.c  | 21 ++++++++----------
>  drivers/gpu/drm/ast/ast_mode.c  | 38 ++++++++++++++++++---------------
>  drivers/gpu/drm/ast/ast_post.c  |  2 +-
>  6 files changed, 36 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> index 4551bc8a3ecf..f573d582407e 100644
> --- a/drivers/gpu/drm/ast/ast_dp.c
> +++ b/drivers/gpu/drm/ast/ast_dp.c
> @@ -160,13 +160,12 @@ void ast_dp_launch(struct drm_device *dev, u8 bPower)
>                 }
>
>                 if (bDPExecute)
> -                       ast->tx_chip_type = AST_TX_ASTDP;
> +                       ast->tx_chip_types |= BIT(AST_TX_ASTDP);

Hi Thomas,
Just a matter of taste but an alternative to using the BIT macro
everywhere is to just define all the AST_TX_* as bits directly and get
rid of the enum ast_tx_chip.

Either way is fine with me.

Reviewed-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>


>
>                 ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE5,
>                                                         (u8) ~ASTDP_HOST_EDID_READ_DONE_MASK,
>                                                         ASTDP_HOST_EDID_READ_DONE);
> -       } else
> -               ast->tx_chip_type = AST_TX_NONE;
> +       }
>  }
>
>
> diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
> index 204c926a18ea..4f75a9efb610 100644
> --- a/drivers/gpu/drm/ast/ast_dp501.c
> +++ b/drivers/gpu/drm/ast/ast_dp501.c
> @@ -450,7 +450,7 @@ void ast_init_3rdtx(struct drm_device *dev)
>                         ast_init_dvo(dev);
>                         break;
>                 default:
> -                       if (ast->tx_chip_type == AST_TX_SIL164)
> +                       if (ast->tx_chip_types & BIT(AST_TX_SIL164))
>                                 ast_init_dvo(dev);
>                         else
>                                 ast_init_analog(dev);
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index afebe35f205e..3055b0be7b67 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -173,7 +173,7 @@ struct ast_private {
>         struct drm_plane primary_plane;
>         struct ast_cursor_plane cursor_plane;
>         struct drm_crtc crtc;
> -       union {
> +       struct {
>                 struct {
>                         struct drm_encoder encoder;
>                         struct ast_vga_connector vga_connector;
> @@ -199,7 +199,7 @@ struct ast_private {
>                 ast_use_defaults
>         } config_mode;
>
> -       enum ast_tx_chip tx_chip_type;
> +       unsigned long tx_chip_types;            /* bitfield of enum ast_chip_type */
>         u8 *dp501_fw_addr;
>         const struct firmware *dp501_fw;        /* dp501 fw */
>  };
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index d770d5a23c1a..50b8d51382c7 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -216,7 +216,7 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)
>         }
>
>         /* Check 3rd Tx option (digital output afaik) */
> -       ast->tx_chip_type = AST_TX_NONE;
> +       ast->tx_chip_types |= BIT(AST_TX_NONE);
>
>         /*
>          * VGACRA3 Enhanced Color Mode Register, check if DVO is already
> @@ -229,7 +229,7 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)
>         if (!*need_post) {
>                 jreg = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xa3, 0xff);
>                 if (jreg & 0x80)
> -                       ast->tx_chip_type = AST_TX_SIL164;
> +                       ast->tx_chip_types = BIT(AST_TX_SIL164);
>         }
>
>         if ((ast->chip == AST2300) || (ast->chip == AST2400) || (ast->chip == AST2500)) {
> @@ -241,7 +241,7 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)
>                 jreg = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd1, 0xff);
>                 switch (jreg) {
>                 case 0x04:
> -                       ast->tx_chip_type = AST_TX_SIL164;
> +                       ast->tx_chip_types = BIT(AST_TX_SIL164);
>                         break;
>                 case 0x08:
>                         ast->dp501_fw_addr = drmm_kzalloc(dev, 32*1024, GFP_KERNEL);
> @@ -254,22 +254,19 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)
>                         }
>                         fallthrough;
>                 case 0x0c:
> -                       ast->tx_chip_type = AST_TX_DP501;
> +                       ast->tx_chip_types = BIT(AST_TX_DP501);
>                 }
>         } else if (ast->chip == AST2600)
>                 ast_dp_launch(&ast->base, 0);
>
>         /* Print stuff for diagnostic purposes */
> -       switch(ast->tx_chip_type) {
> -       case AST_TX_SIL164:
> +       if (ast->tx_chip_types & BIT(AST_TX_NONE))
> +               drm_info(dev, "Using analog VGA\n");
> +       if (ast->tx_chip_types & BIT(AST_TX_SIL164))
>                 drm_info(dev, "Using Sil164 TMDS transmitter\n");
> -               break;
> -       case AST_TX_DP501:
> +       if (ast->tx_chip_types & BIT(AST_TX_DP501))
>                 drm_info(dev, "Using DP501 DisplayPort transmitter\n");
> -               break;
> -       default:
> -               drm_info(dev, "Analog VGA only\n");
> -       }
> +
>         return 0;
>  }
>
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 323af2746aa9..e19dd2f9b3ce 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -997,10 +997,10 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
>         case DRM_MODE_DPMS_ON:
>                 ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT,  0x01, 0xdf, 0);
>                 ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb6, 0xfc, 0);
> -               if (ast->tx_chip_type == AST_TX_DP501)
> +               if (ast->tx_chip_types & BIT(AST_TX_DP501))
>                         ast_set_dp501_video_output(crtc->dev, 1);
>
> -               if (ast->tx_chip_type == AST_TX_ASTDP) {
> +               if (ast->tx_chip_types & BIT(AST_TX_ASTDP)) {
>                         ast_dp_power_on_off(crtc->dev, AST_DP_POWER_ON);
>                         ast_wait_for_vretrace(ast);
>                         ast_dp_set_on_off(crtc->dev, 1);
> @@ -1012,17 +1012,17 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
>         case DRM_MODE_DPMS_SUSPEND:
>         case DRM_MODE_DPMS_OFF:
>                 ch = mode;
> -               if (ast->tx_chip_type == AST_TX_DP501)
> +               if (ast->tx_chip_types & BIT(AST_TX_DP501))
>                         ast_set_dp501_video_output(crtc->dev, 0);
> -               break;
>
> -               if (ast->tx_chip_type == AST_TX_ASTDP) {
> +               if (ast->tx_chip_types & BIT(AST_TX_ASTDP)) {
>                         ast_dp_set_on_off(crtc->dev, 0);
>                         ast_dp_power_on_off(crtc->dev, AST_DP_POWER_OFF);
>                 }
>
>                 ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT,  0x01, 0xdf, 0x20);
>                 ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb6, 0xfc, ch);
> +               break;
>         }
>  }
>
> @@ -1155,7 +1155,7 @@ ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
>                 ast_crtc_load_lut(ast, crtc);
>
>         //Set Aspeed Display-Port
> -       if (ast->tx_chip_type == AST_TX_ASTDP)
> +       if (ast->tx_chip_types & BIT(AST_TX_ASTDP))
>                 ast_dp_set_mode(crtc, vbios_mode_info);
>
>         mutex_unlock(&ast->ioregs_lock);
> @@ -1739,22 +1739,26 @@ int ast_mode_config_init(struct ast_private *ast)
>
>         ast_crtc_init(dev);
>
> -       switch (ast->tx_chip_type) {
> -       case AST_TX_NONE:
> +       if (ast->tx_chip_types & BIT(AST_TX_NONE)) {
>                 ret = ast_vga_output_init(ast);
> -               break;
> -       case AST_TX_SIL164:
> +               if (ret)
> +                       return ret;
> +       }
> +       if (ast->tx_chip_types & BIT(AST_TX_SIL164)) {
>                 ret = ast_sil164_output_init(ast);
> -               break;
> -       case AST_TX_DP501:
> +               if (ret)
> +                       return ret;
> +       }
> +       if (ast->tx_chip_types & BIT(AST_TX_DP501)) {
>                 ret = ast_dp501_output_init(ast);
> -               break;
> -       case AST_TX_ASTDP:
> +               if (ret)
> +                       return ret;
> +       }
> +       if (ast->tx_chip_types & BIT(AST_TX_ASTDP)) {
>                 ret = ast_astdp_output_init(ast);
> -               break;
> +               if (ret)
> +                       return ret;
>         }
> -       if (ret)
> -               return ret;
>
>         drm_mode_config_reset(dev);
>
> diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
> index 0aa9cf0fb5c3..2e1c343b70a3 100644
> --- a/drivers/gpu/drm/ast/ast_post.c
> +++ b/drivers/gpu/drm/ast/ast_post.c
> @@ -391,7 +391,7 @@ void ast_post_gpu(struct drm_device *dev)
>
>                 ast_init_3rdtx(dev);
>         } else {
> -               if (ast->tx_chip_type != AST_TX_NONE)
> +               if (ast->tx_chip_types & BIT(AST_TX_SIL164))
>                         ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xa3, 0xcf, 0x80);        /* Enable DVO */
>         }
>  }
> --
> 2.36.1
>
