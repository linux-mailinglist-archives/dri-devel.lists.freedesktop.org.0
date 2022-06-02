Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7483D53B449
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 09:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EEF110F610;
	Thu,  2 Jun 2022 07:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D155C10F2D6
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 07:25:16 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 u12-20020a17090a1d4c00b001df78c7c209so8589035pju.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 00:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=axdfeb3veqsO/0PdqzxhfJ9vWc2HahszyQjVcIyPcms=;
 b=NIy5KKH5yt/zDJvIMWRj/3ygjBcHV7KbF2kI/oXa0I1g6DpfaZMOeKMmSDGE5ZSnro
 ZSeQbke07rplyC85LWPsqApgX8i8VBUqtl7f6rTiBW67Zj+16SnGEcVpkJPaORadNYMF
 9Yeqm7BfrA3qmBm5f+UqzcWtAXz20Xan77z/uYfqtDUHwuTQ5pDifdAMHL41Z9riLenX
 xTEanRChGa1DAFZoU0z4+2LBDHtDENxDCL6ax/WOKjtCGZUsXve93AaxnrQ5DliIeXQm
 A37hKvXXhti8jq4JxhmjlyDB5zj4LCcVjPnPDFIppEyDLI8TbVrphPKlN0nIA6SlZnxq
 dDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=axdfeb3veqsO/0PdqzxhfJ9vWc2HahszyQjVcIyPcms=;
 b=a/66HHfB4RX0x+cXuCMu6fc/JM7Mzevg1w/bDF+LE1lxfq/SGTlUh9aloKAQ7FEJXg
 9BXC8TPPGSXeQq04AUBXhqbGf23lt0wp13yM2B5tPlmTkT249+OlUAtpoB7KDPRofv9+
 BwtDqtYKdzx+OwcLy/VZOTA7tmlLk6vyNe9c+LbqZgfUAtqAu4ikgysSyQb1YuuFzub6
 MI4HD7UtMenpOo1bgZg2qYPjZynAunj34rzllYbZsoTngsdswEG1E3xBZfHu2xyXgUIa
 fFkFylZWtiV4KlvmX4DU0X02V/RQWRzWUUSzZEjp1Pd287RoOFSgDqg0Df3Gj50PjPof
 keuQ==
X-Gm-Message-State: AOAM530O9M3xtKe+I+iEsRU8VeAyJufX1INXOCTpVYvveEJrgnoFA0d3
 oSOTkKm0DQKjU5bYfHZ/tMo9UeQaZBJODWcXDxI=
X-Google-Smtp-Source: ABdhPJyhNb565xEaMzyhi09p04W6CA8Vyt1nZduCRFP5NpXKHAAHC0SuccLzzj6P1s3z5GtubkbcFLHsCMBcu7Qd5rI=
X-Received: by 2002:a17:90a:c202:b0:1e2:e772:5f0a with SMTP id
 e2-20020a17090ac20200b001e2e7725f0amr3782593pjt.109.1654154716440; Thu, 02
 Jun 2022 00:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220531111502.4470-1-tzimmermann@suse.de>
 <20220531111502.4470-4-tzimmermann@suse.de>
In-Reply-To: <20220531111502.4470-4-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 2 Jun 2022 09:25:05 +0200
Message-ID: <CAMeQTsanbu5ryO-Oxp4nCQuV+J8CD+rSYmDie=MFGWb-VG7oWQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] drm/ast: Support output polling
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
 dri-devel <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 31, 2022 at 1:15 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Enable output polling for all connectors. VGA always uses EDID for this. As
> there's currently no interrupt handling for the ast devices, we have to use
> that trick for the various DP and DVI ports as well.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/ast/ast_mode.c     | 14 ++++++++----
>  drivers/gpu/drm/drm_probe_helper.c | 35 ++++++++++++++++++++++++++++++
>  include/drm/drm_probe_helper.h     |  3 +++
>  3 files changed, 48 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 4ff8ec1c8931..bbc566c4c768 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1319,6 +1319,7 @@ static int ast_vga_connector_helper_get_modes(struct drm_connector *connector)
>
>  static const struct drm_connector_helper_funcs ast_vga_connector_helper_funcs = {
>         .get_modes = ast_vga_connector_helper_get_modes,
> +       .detect_ctx = drm_connector_helper_detect_ctx_from_edid,
>  };
>
>  static const struct drm_connector_funcs ast_vga_connector_funcs = {
> @@ -1354,7 +1355,7 @@ static int ast_vga_connector_init(struct drm_device *dev,
>         connector->interlace_allowed = 0;
>         connector->doublescan_allowed = 0;
>
> -       connector->polled = DRM_CONNECTOR_POLL_CONNECT;
> +       connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
>
>         return 0;
>  }
> @@ -1390,6 +1391,7 @@ static int ast_vga_output_init(struct ast_private *ast)
>
>  static const struct drm_connector_helper_funcs ast_sil164_connector_helper_funcs = {
>         .get_modes = ast_vga_connector_helper_get_modes, // same as VGA connector
> +       .detect_ctx = drm_connector_helper_detect_ctx_from_edid,
>  };
>
>  static const struct drm_connector_funcs ast_sil164_connector_funcs = {
> @@ -1425,7 +1427,7 @@ static int ast_sil164_connector_init(struct drm_device *dev,
>         connector->interlace_allowed = 0;
>         connector->doublescan_allowed = 0;
>
> -       connector->polled = DRM_CONNECTOR_POLL_CONNECT;
> +       connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
>
>         return 0;
>  }
> @@ -1488,6 +1490,7 @@ static int ast_dp501_connector_helper_get_modes(struct drm_connector *connector)
>
>  static const struct drm_connector_helper_funcs ast_dp501_connector_helper_funcs = {
>         .get_modes = ast_dp501_connector_helper_get_modes,
> +       .detect_ctx = drm_connector_helper_detect_ctx_from_edid,
>  };
>
>  static const struct drm_connector_funcs ast_dp501_connector_funcs = {
> @@ -1512,7 +1515,7 @@ static int ast_dp501_connector_init(struct drm_device *dev, struct drm_connector
>         connector->interlace_allowed = 0;
>         connector->doublescan_allowed = 0;
>
> -       connector->polled = DRM_CONNECTOR_POLL_CONNECT;
> +       connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
>
>         return 0;
>  }
> @@ -1575,6 +1578,7 @@ static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
>
>  static const struct drm_connector_helper_funcs ast_astdp_connector_helper_funcs = {
>         .get_modes = ast_astdp_connector_helper_get_modes,
> +       .detect_ctx = drm_connector_helper_detect_ctx_from_edid,
>  };
>
>  static const struct drm_connector_funcs ast_astdp_connector_funcs = {
> @@ -1599,7 +1603,7 @@ static int ast_astdp_connector_init(struct drm_device *dev, struct drm_connector
>         connector->interlace_allowed = 0;
>         connector->doublescan_allowed = 0;
>
> -       connector->polled = DRM_CONNECTOR_POLL_CONNECT;
> +       connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
>
>         return 0;
>  }
> @@ -1709,5 +1713,7 @@ int ast_mode_config_init(struct ast_private *ast)
>
>         drm_mode_config_reset(dev);
>
> +       drm_kms_helper_poll_init(dev);
> +
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 425f56280d51..4440a7b6b240 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -1031,3 +1031,38 @@ int drm_connector_helper_get_modes_from_ddc(struct drm_connector *connector)
>         return count;
>  }
>  EXPORT_SYMBOL(drm_connector_helper_get_modes_from_ddc);
> +
> +/**
> + * drm_connector_helper_detect_ctx_from_edid -
> + *     Updates the connector's status by reading EDID data
> + * @connector: The connector.
> + * @ctx: The lock-acquisition context.
> + * @force: True if the operation was requested by userspace, false otherwise.
> + *
> + * Returns:
> + * The connector's status as enum drm_connector_status.
> + *
> + * Updates the connector's EDID property by reading the display modes
> + * and returns the connector's status. If the EDID property is set, the
> + * connector is assumed to be connected; and disconnected otherwise.
> + * If the get_modes helper is missing, the default status is 'unknown'.
> + *
> + * See struct drm_connector_helper_funcs.detect_ctx.
> + */
> +int drm_connector_helper_detect_ctx_from_edid(struct drm_connector *connector,
> +                                             struct drm_modeset_acquire_ctx *ctx,
> +                                             bool force)
> +{
> +       const struct drm_connector_helper_funcs *helper_funcs = connector->helper_private;
> +
> +       if (!helper_funcs || !helper_funcs->get_modes)
> +               return connector_status_unknown;
> +
> +       helper_funcs->get_modes(connector);
> +
> +       if (!connector->edid_blob_ptr)
> +               return connector_status_disconnected;

This depends on EDID not being cached or other trickery happening in
helper_funcs->get_modes(). Perhaps the docs should mention this?



> +
> +       return connector_status_connected;
> +}
> +EXPORT_SYMBOL(drm_connector_helper_detect_ctx_from_edid);
> diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
> index c80cab7a53b7..7408cf010794 100644
> --- a/include/drm/drm_probe_helper.h
> +++ b/include/drm/drm_probe_helper.h
> @@ -27,5 +27,8 @@ void drm_kms_helper_poll_enable(struct drm_device *dev);
>  bool drm_kms_helper_is_poll_worker(void);
>
>  int drm_connector_helper_get_modes_from_ddc(struct drm_connector *connector);
> +int drm_connector_helper_detect_ctx_from_edid(struct drm_connector *connector,
> +                                             struct drm_modeset_acquire_ctx *ctx,
> +                                             bool force);
>
>  #endif
> --
> 2.36.1
>
