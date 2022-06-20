Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1323F552708
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 00:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A54F10FA9F;
	Mon, 20 Jun 2022 22:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E7310FA9F;
 Mon, 20 Jun 2022 22:42:35 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id x38so21451019ybd.9;
 Mon, 20 Jun 2022 15:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9UBZf/WrUZigGCpE+FJm1ayNac+a9HAc8uWPKnLIa6k=;
 b=B2OI4dsjmIhddRn2+TMElqK9s13pjIMh6k2G/qtJKOD5ciAXj69EIB2J6tb054Kxeu
 356jLMz9Bk27459DnAYlLGpGmgpSFNxjK5xOjK/vu0Rexd6oJYansWchfkV4HLucoKyU
 f69cK1pQdZGdJnCQX6Z60rTrCN7v0gQGkDza7NbLzapN0SWZWRw98QySbT1VhSIjbZJ8
 h7d75pOGraCzcLU6D7fFNc4bkR5hRD6NAytocLz8oMv3Az2sbivyYCl0zrWJ7SNIu1wJ
 xjclGm0JDv6ZiOCdb1sTnCctSFdYc1GrmTfGLHA6eWR080B8/wEugTuOAQQVOvTx3k7P
 QKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9UBZf/WrUZigGCpE+FJm1ayNac+a9HAc8uWPKnLIa6k=;
 b=AvsNsQzvkjYoaeBptL9ObIWlksqMD2sjAD6xY4QS5dP/gSpaSUm7CWXd8SPmwVf5XV
 efb+ma28s6i3DWwaO0xaSvrncafXE0U05TDuLB8q75kNxOXmgeJZnhan2hNt69Kl3eMP
 DdmBrDsJT7yGq/V4ZuJi4xyY00IASz7myU4FZxeZ6C9PxFMhkrGDa6bW8Ol2nVtoiaUq
 bWIkWX8u1CR1vcJomBztkpZ5dBez83DzLuRXuL4zRnsq6m2nixUnX8Jr0JbZeV9WPnli
 wKkutoFeGaQ2CTeJ7dlI7AMVSv2+mucCbWEydnoi9vTlX2EOYayX1ITT+3AqPuH6l4VC
 OLhw==
X-Gm-Message-State: AJIora/9P0GWJ2q/Uk+L+yNo1QX+PFKCNbojaVurU02we0PCYdl29KJO
 /ThU0y3z/RfnER2Xl22Df1wnvPfhuNBYu7bI4Ns=
X-Google-Smtp-Source: AGRyM1vpCzPle++lZtBEf0NHwY249KRzUvhVH59oQAF2IMjJRhtBCy97PCDPc2oRZRH/5Ab0cAgYlVkRnMZanln3rEw=
X-Received: by 2002:a25:cfc2:0:b0:668:a42d:de48 with SMTP id
 f185-20020a25cfc2000000b00668a42dde48mr26213186ybg.523.1655764954420; Mon, 20
 Jun 2022 15:42:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220620094336.9633-1-hdegoede@redhat.com>
 <20220620094336.9633-2-hdegoede@redhat.com>
In-Reply-To: <20220620094336.9633-2-hdegoede@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 20 Jun 2022 18:42:23 -0400
Message-ID: <CADnq5_Po=Fab1j_wqyNSZnyT2PueRYh2mB7+nj_rHmTshFYaeA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/radeon: Drop CONFIG_BACKLIGHT_CLASS_DEVICE ifdefs
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: Pan@freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied the series.  Thanks,

Alex

On Mon, Jun 20, 2022 at 5:44 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The DRM_RADEON Kconfig code contains:
>
>         select BACKLIGHT_CLASS_DEVICE
>
> So the condition these ifdefs test for is always true, drop them.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/radeon/atombios_encoders.c      | 14 --------------
>  drivers/gpu/drm/radeon/radeon_acpi.c            |  2 --
>  drivers/gpu/drm/radeon/radeon_legacy_encoders.c | 15 ---------------
>  drivers/gpu/drm/radeon/radeon_mode.h            |  4 ----
>  4 files changed, 35 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c b/drivers/gpu/drm/radeon/atombios_encoders.c
> index f82577dc25e8..160a309e1048 100644
> --- a/drivers/gpu/drm/radeon/atombios_encoders.c
> +++ b/drivers/gpu/drm/radeon/atombios_encoders.c
> @@ -143,8 +143,6 @@ atombios_set_backlight_level(struct radeon_encoder *radeon_encoder, u8 level)
>         }
>  }
>
> -#if defined(CONFIG_BACKLIGHT_CLASS_DEVICE) || defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE)
> -
>  static u8 radeon_atom_bl_level(struct backlight_device *bd)
>  {
>         u8 level;
> @@ -293,18 +291,6 @@ static void radeon_atom_backlight_exit(struct radeon_encoder *radeon_encoder)
>         }
>  }
>
> -#else /* !CONFIG_BACKLIGHT_CLASS_DEVICE */
> -
> -void radeon_atom_backlight_init(struct radeon_encoder *encoder)
> -{
> -}
> -
> -static void radeon_atom_backlight_exit(struct radeon_encoder *encoder)
> -{
> -}
> -
> -#endif
> -
>  static bool radeon_atom_mode_fixup(struct drm_encoder *encoder,
>                                    const struct drm_display_mode *mode,
>                                    struct drm_display_mode *adjusted_mode)
> diff --git a/drivers/gpu/drm/radeon/radeon_acpi.c b/drivers/gpu/drm/radeon/radeon_acpi.c
> index 1baef7b493de..b603c0b77075 100644
> --- a/drivers/gpu/drm/radeon/radeon_acpi.c
> +++ b/drivers/gpu/drm/radeon/radeon_acpi.c
> @@ -391,7 +391,6 @@ static int radeon_atif_handler(struct radeon_device *rdev,
>
>                         radeon_set_backlight_level(rdev, enc, req.backlight_level);
>
> -#if defined(CONFIG_BACKLIGHT_CLASS_DEVICE) || defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE)
>                         if (rdev->is_atom_bios) {
>                                 struct radeon_encoder_atom_dig *dig = enc->enc_priv;
>                                 backlight_force_update(dig->bl_dev,
> @@ -401,7 +400,6 @@ static int radeon_atif_handler(struct radeon_device *rdev,
>                                 backlight_force_update(dig->bl_dev,
>                                                        BACKLIGHT_UPDATE_HOTKEY);
>                         }
> -#endif
>                 }
>         }
>         if (req.pending & ATIF_DGPU_DISPLAY_EVENT) {
> diff --git a/drivers/gpu/drm/radeon/radeon_legacy_encoders.c b/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
> index d2180f5c80fa..1d207c76f53e 100644
> --- a/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
> +++ b/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
> @@ -320,8 +320,6 @@ radeon_legacy_set_backlight_level(struct radeon_encoder *radeon_encoder, u8 leve
>         radeon_legacy_lvds_update(&radeon_encoder->base, dpms_mode);
>  }
>
> -#if defined(CONFIG_BACKLIGHT_CLASS_DEVICE) || defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE)
> -
>  static uint8_t radeon_legacy_lvds_level(struct backlight_device *bd)
>  {
>         struct radeon_backlight_privdata *pdata = bl_get_data(bd);
> @@ -495,19 +493,6 @@ static void radeon_legacy_backlight_exit(struct radeon_encoder *radeon_encoder)
>         }
>  }
>
> -#else /* !CONFIG_BACKLIGHT_CLASS_DEVICE */
> -
> -void radeon_legacy_backlight_init(struct radeon_encoder *encoder)
> -{
> -}
> -
> -static void radeon_legacy_backlight_exit(struct radeon_encoder *encoder)
> -{
> -}
> -
> -#endif
> -
> -
>  static void radeon_lvds_enc_destroy(struct drm_encoder *encoder)
>  {
>         struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
> diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
> index 3485e7f142e9..b34cffc162e2 100644
> --- a/drivers/gpu/drm/radeon/radeon_mode.h
> +++ b/drivers/gpu/drm/radeon/radeon_mode.h
> @@ -281,15 +281,11 @@ struct radeon_mode_info {
>
>  #define RADEON_MAX_BL_LEVEL 0xFF
>
> -#if defined(CONFIG_BACKLIGHT_CLASS_DEVICE) || defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE)
> -
>  struct radeon_backlight_privdata {
>         struct radeon_encoder *encoder;
>         uint8_t negative;
>  };
>
> -#endif
> -
>  #define MAX_H_CODE_TIMING_LEN 32
>  #define MAX_V_CODE_TIMING_LEN 32
>
> --
> 2.36.0
>
