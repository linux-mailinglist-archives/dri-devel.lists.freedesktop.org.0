Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B1454CF1A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 18:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E3C510E98B;
	Wed, 15 Jun 2022 16:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D461310E927;
 Wed, 15 Jun 2022 16:56:15 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-10113b4c2b5so15596521fac.6; 
 Wed, 15 Jun 2022 09:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ocMgTzRkWH3eBYp2u/PAG0Fm6G35s0xKn8yvsRpMe88=;
 b=f9YhM52ySsPsP9RkggdjlzhlY3Kl0Zt9sCMg1sPl2ipMDfCj7Apt1+HeR26+sE7a+g
 Pd+vcOvk+nLPs7LcTOv6kyfhOmc2h1rBo8n3L9Z8TPxX3XZiVDICAlkPK5cfU77z3TRN
 oBepdA0T/Oq2wz6XGLBbg4DhivuOWkaSv6Y1KFPebi+KVrU1RyJu35M8yZ22SPCMIGOP
 tETIlAvLk5XgExpOhZBCvGy/CUM6DrtZczDyEVArLA8tDgf8IHi2mnT5XeN1gccR+lxY
 FbS14v3u5iuj2I1OzaMjRWtgbgPXwaN+S0mfG6cjh7tv5fNwI0QTYOqkxj3uScPVhjpD
 rqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ocMgTzRkWH3eBYp2u/PAG0Fm6G35s0xKn8yvsRpMe88=;
 b=hiIl2dfX0BnqxMv8y4dDirq57HIlfuRmNy4rIqx71kk4EDZpIX4krSaGZsnQa9EKuS
 dxe8REzsq2ObUfjspqYlABfkAMICe2znIgS5yTJ55dex7tnlJsS6+CfmAk62XAcKkZr5
 DGZeONpbJupzlU5kefgaS9F7teKbt4xEtdWJtrl1rBSFDZlchibrbMna6Dner02uCNZF
 KaZDCWH0Dg+WqrDO1/2N+QlU2Z9U4THnCRMDMXZX1sJF5hc0zsZR1CaMSDrb3Wsbebxk
 DE+yU2oRd6V6ISMvcOAL6XfmXjrOpm3+2Li0c2MQhtNw9fxf3bFsyLrWlGNey5db/yqB
 KiZw==
X-Gm-Message-State: AJIora+VUyX+/PVaKUr1W4RxXDuIq8iUli+dqVwPY8MMq8Xky7ahkEYW
 kww5Z40nQMQBs/FNs68SOySps4BB8bWmkqOpbQA=
X-Google-Smtp-Source: AGRyM1t2ME88iAIQzsGcfH0HXLVexL004pXS5sohWl/TRzf7/ndK7Zv2s3VsmqHQflAW2BGdKo6sVu6zokuo770HPuc=
X-Received: by 2002:a05:6870:538b:b0:101:17f2:d6e with SMTP id
 h11-20020a056870538b00b0010117f20d6emr5908958oan.200.1655312174819; Wed, 15
 Jun 2022 09:56:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220615122458.20145-1-hongao@uniontech.com>
In-Reply-To: <20220615122458.20145-1-hongao@uniontech.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 15 Jun 2022 12:56:03 -0400
Message-ID: <CADnq5_P-A2UeCu9oRpXYRTXdeeZNEKPst_gnfZf7g+QWrZWBdQ@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Replace drm_detect_hdmi_monitor() with
 drm_display_info.is_hdmi
To: hongao <hongao@uniontech.com>
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
Cc: inhui.Pan@amd.com, Dave Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 15, 2022 at 8:33 AM hongao <hongao@uniontech.com> wrote:
>
> Replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi for more
> efficiency
>
> Tested on "Oland [Radeon HD 8570 / R7 240/340 OEM]" & "Caicos [R5 230]"

Can you verify that drm_display_info.is_hdmi has been populated when
all of these functions are called?

Alex

>
> Signed-off-by: hongao <hongao@uniontech.com>
> ---
>  drivers/gpu/drm/radeon/atombios_encoders.c |  6 +++---
>  drivers/gpu/drm/radeon/radeon_connectors.c | 12 ++++++------
>  drivers/gpu/drm/radeon/radeon_display.c    |  2 +-
>  drivers/gpu/drm/radeon/radeon_encoders.c   |  4 ++--
>  4 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c b/drivers/gpu/drm/radeon/atombios_encoders.c
> index 70bd84b7ef2b..393d471ba396 100644
> --- a/drivers/gpu/drm/radeon/atombios_encoders.c
> +++ b/drivers/gpu/drm/radeon/atombios_encoders.c
> @@ -714,7 +714,7 @@ atombios_get_encoder_mode(struct drm_encoder *encoder)
>                         if (radeon_connector->use_digital &&
>                             (radeon_connector->audio == RADEON_AUDIO_ENABLE))
>                                 return ATOM_ENCODER_MODE_HDMI;
> -                       else if (drm_detect_hdmi_monitor(radeon_connector_edid(connector)) &&
> +                       else if (connector->display_info.is_hdmi &&
>                                  (radeon_connector->audio == RADEON_AUDIO_AUTO))
>                                 return ATOM_ENCODER_MODE_HDMI;
>                         else if (radeon_connector->use_digital)
> @@ -733,7 +733,7 @@ atombios_get_encoder_mode(struct drm_encoder *encoder)
>                 if (radeon_audio != 0) {
>                         if (radeon_connector->audio == RADEON_AUDIO_ENABLE)
>                                 return ATOM_ENCODER_MODE_HDMI;
> -                       else if (drm_detect_hdmi_monitor(radeon_connector_edid(connector)) &&
> +                       else if (connector->display_info.is_hdmi &&
>                                  (radeon_connector->audio == RADEON_AUDIO_AUTO))
>                                 return ATOM_ENCODER_MODE_HDMI;
>                         else
> @@ -757,7 +757,7 @@ atombios_get_encoder_mode(struct drm_encoder *encoder)
>                 } else if (radeon_audio != 0) {
>                         if (radeon_connector->audio == RADEON_AUDIO_ENABLE)
>                                 return ATOM_ENCODER_MODE_HDMI;
> -                       else if (drm_detect_hdmi_monitor(radeon_connector_edid(connector)) &&
> +                       else if (connector->display_info.is_hdmi &&
>                                  (radeon_connector->audio == RADEON_AUDIO_AUTO))
>                                 return ATOM_ENCODER_MODE_HDMI;
>                         else
> diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
> index 58db79921cd3..2fbec7bdd56b 100644
> --- a/drivers/gpu/drm/radeon/radeon_connectors.c
> +++ b/drivers/gpu/drm/radeon/radeon_connectors.c
> @@ -130,7 +130,7 @@ int radeon_get_monitor_bpc(struct drm_connector *connector)
>         case DRM_MODE_CONNECTOR_DVII:
>         case DRM_MODE_CONNECTOR_HDMIB:
>                 if (radeon_connector->use_digital) {
> -                       if (drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
> +                       if (connector->display_info.is_hdmi) {
>                                 if (connector->display_info.bpc)
>                                         bpc = connector->display_info.bpc;
>                         }
> @@ -138,7 +138,7 @@ int radeon_get_monitor_bpc(struct drm_connector *connector)
>                 break;
>         case DRM_MODE_CONNECTOR_DVID:
>         case DRM_MODE_CONNECTOR_HDMIA:
> -               if (drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
> +               if (connector->display_info.is_hdmi) {
>                         if (connector->display_info.bpc)
>                                 bpc = connector->display_info.bpc;
>                 }
> @@ -147,7 +147,7 @@ int radeon_get_monitor_bpc(struct drm_connector *connector)
>                 dig_connector = radeon_connector->con_priv;
>                 if ((dig_connector->dp_sink_type == CONNECTOR_OBJECT_ID_DISPLAYPORT) ||
>                     (dig_connector->dp_sink_type == CONNECTOR_OBJECT_ID_eDP) ||
> -                   drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
> +                   connector->display_info.is_hdmi) {
>                         if (connector->display_info.bpc)
>                                 bpc = connector->display_info.bpc;
>                 }
> @@ -171,7 +171,7 @@ int radeon_get_monitor_bpc(struct drm_connector *connector)
>                 break;
>         }
>
> -       if (drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
> +       if (connector->display_info.is_hdmi) {
>                 /* hdmi deep color only implemented on DCE4+ */
>                 if ((bpc > 8) && !ASIC_IS_DCE4(rdev)) {
>                         DRM_DEBUG("%s: HDMI deep color %d bpc unsupported. Using 8 bpc.\n",
> @@ -1500,7 +1500,7 @@ static enum drm_mode_status radeon_dvi_mode_valid(struct drm_connector *connecto
>                     (radeon_connector->connector_object_id == CONNECTOR_OBJECT_ID_DUAL_LINK_DVI_D) ||
>                     (radeon_connector->connector_object_id == CONNECTOR_OBJECT_ID_HDMI_TYPE_B))
>                         return MODE_OK;
> -               else if (ASIC_IS_DCE6(rdev) && drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
> +               else if (ASIC_IS_DCE6(rdev) && connector->display_info.is_hdmi) {
>                         /* HDMI 1.3+ supports max clock of 340 Mhz */
>                         if (mode->clock > 340000)
>                                 return MODE_CLOCK_HIGH;
> @@ -1808,7 +1808,7 @@ static enum drm_mode_status radeon_dp_mode_valid(struct drm_connector *connector
>                     (radeon_dig_connector->dp_sink_type == CONNECTOR_OBJECT_ID_eDP)) {
>                         return radeon_dp_mode_valid_helper(connector, mode);
>                 } else {
> -                       if (ASIC_IS_DCE6(rdev) && drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
> +                       if (ASIC_IS_DCE6(rdev) && connector->display_info.is_hdmi) {
>                                 /* HDMI 1.3+ supports max clock of 340 Mhz */
>                                 if (mode->clock > 340000)
>                                         return MODE_CLOCK_HIGH;
> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
> index 57ff2b723c87..c7a1e3af55cf 100644
> --- a/drivers/gpu/drm/radeon/radeon_display.c
> +++ b/drivers/gpu/drm/radeon/radeon_display.c
> @@ -1728,7 +1728,7 @@ bool radeon_crtc_scaling_mode_fixup(struct drm_crtc *crtc,
>                             (!(mode->flags & DRM_MODE_FLAG_INTERLACE)) &&
>                             ((radeon_encoder->underscan_type == UNDERSCAN_ON) ||
>                              ((radeon_encoder->underscan_type == UNDERSCAN_AUTO) &&
> -                             drm_detect_hdmi_monitor(radeon_connector_edid(connector)) &&
> +                             connector->display_info.is_hdmi &&
>                               is_hdtv_mode(mode)))) {
>                                 if (radeon_encoder->underscan_hborder != 0)
>                                         radeon_crtc->h_border = radeon_encoder->underscan_hborder;
> diff --git a/drivers/gpu/drm/radeon/radeon_encoders.c b/drivers/gpu/drm/radeon/radeon_encoders.c
> index 46549d5179ee..b999464f213a 100644
> --- a/drivers/gpu/drm/radeon/radeon_encoders.c
> +++ b/drivers/gpu/drm/radeon/radeon_encoders.c
> @@ -383,7 +383,7 @@ bool radeon_dig_monitor_is_duallink(struct drm_encoder *encoder,
>         case DRM_MODE_CONNECTOR_HDMIB:
>                 if (radeon_connector->use_digital) {
>                         /* HDMI 1.3 supports up to 340 Mhz over single link */
> -                       if (ASIC_IS_DCE6(rdev) && drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
> +                       if (ASIC_IS_DCE6(rdev) && connector->display_info.is_hdmi) {
>                                 if (pixel_clock > 340000)
>                                         return true;
>                                 else
> @@ -408,7 +408,7 @@ bool radeon_dig_monitor_is_duallink(struct drm_encoder *encoder,
>                         return false;
>                 else {
>                         /* HDMI 1.3 supports up to 340 Mhz over single link */
> -                       if (ASIC_IS_DCE6(rdev) && drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
> +                       if (ASIC_IS_DCE6(rdev) && connector->display_info.is_hdmi) {
>                                 if (pixel_clock > 340000)
>                                         return true;
>                                 else
> --
> 2.20.1
>
>
>
>
