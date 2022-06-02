Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 129E653B44D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 09:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2845F10F867;
	Thu,  2 Jun 2022 07:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9605F10F612
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 07:25:34 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id j7so4160469pjn.4
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 00:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=koMXpc2rmrfLXTYMm1SPN0tA+ViraozppC8muJXqL0E=;
 b=i1YuAyYvelaUnawkHb1VTmDlDig697lO2w7y7mfDe/0qyt0W66VpYXgTAKGzvraFsq
 pAUeK3fn9JTek8b9P6L8cQTsNuF/Rp9EZfhMAEHXBZxQVvJgaK3lF8e1GlnpC1eDnpyt
 4efZnfamagCtj0pVAUChBzcHI3/TELqeSQ+6N6NTnYeTpjzB5aXsJe5TarE5IttLOAjY
 kElVA0ePcT9B9PQCScZE34fk6JlAC5KfBsOcNxBe8mnLj1HK1lJ380Fi2zxGOATxpskd
 5a3Upk50OBZz+GmMLVSQBrgkN7CWw1VjHzFgklRWvdlC5rku7WWPk5Z712+GDwtOE3Kg
 DJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=koMXpc2rmrfLXTYMm1SPN0tA+ViraozppC8muJXqL0E=;
 b=R0h1chjz/nPnPzL9lRn1zoL2kgsNmML/Pq8YIIP5tCb1peJbo2/7jN4SMpUTWQu/Aa
 4DQAUYZl1Cokh47qI6QmUOfZk86G0CnJimwfoZfipxJCtRUQLc0rHuAOz1Bw5nzCxK8U
 v6ZqcqwhF4w80KPWKQ1lrn7ljpoxblF95CBuJLl89lXNUpp+quVGLFusTacYBi+jUvjL
 TdD/px1GxNLBY5mYruClmFCZJI97x+jRMOI09oq7YH0PGcM/10EOCZ9TuL8omLeIsKff
 679cxV+hpt/FEpqfTDZIvuLV99HzBxx9/4AqnitjKHe++IuO5ZlszVLtAMSSHwqZLlY+
 SvGw==
X-Gm-Message-State: AOAM533VEG0tNqo9kclcBI5+gIyjq4zZRMNdBzdgIqLfoSeXjTkyM8VQ
 W091Lxp4bdzaT9zI0jDP0qOOQMLS2/Pobz3M5rk=
X-Google-Smtp-Source: ABdhPJzaBDLr37n1pHgiNjqZiGzqGWbixMEyLBZGFwSJ55fDc9WmeMjvppc10qC2I+Xnqo2A4D0Y4RfiPz0a3RhA1y4=
X-Received: by 2002:a17:90b:503:b0:1e2:f129:5135 with SMTP id
 r3-20020a17090b050300b001e2f1295135mr3779053pjz.22.1654154734205; Thu, 02 Jun
 2022 00:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220531111502.4470-1-tzimmermann@suse.de>
 <20220531111502.4470-6-tzimmermann@suse.de>
In-Reply-To: <20220531111502.4470-6-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 2 Jun 2022 09:25:22 +0200
Message-ID: <CAMeQTsbVRwJfTF75phOuH+joQS_wdpcomxrDUYCJr7eY-JVxWQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] drm/ast: Remove struct ast_{vga,sil164}_connector
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
> Both, struct ast_vga_connector and struct ast_sil164_connector, are
> now wrappers around struct drm_connector. Remove them.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>


> ---
>  drivers/gpu/drm/ast/ast_drv.h  | 24 ++----------------------
>  drivers/gpu/drm/ast/ast_mode.c | 18 ++++++------------
>  2 files changed, 8 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 2a55fc7303b9..d456f6bc4b2c 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -130,26 +130,6 @@ struct ast_i2c_chan {
>         struct i2c_algo_bit_data bit;
>  };
>
> -struct ast_vga_connector {
> -       struct drm_connector base;
> -};
> -
> -static inline struct ast_vga_connector *
> -to_ast_vga_connector(struct drm_connector *connector)
> -{
> -       return container_of(connector, struct ast_vga_connector, base);
> -}
> -
> -struct ast_sil164_connector {
> -       struct drm_connector base;
> -};
> -
> -static inline struct ast_sil164_connector *
> -to_ast_sil164_connector(struct drm_connector *connector)
> -{
> -       return container_of(connector, struct ast_sil164_connector, base);
> -}
> -
>  /*
>   * Device
>   */
> @@ -174,11 +154,11 @@ struct ast_private {
>         struct {
>                 struct {
>                         struct drm_encoder encoder;
> -                       struct ast_vga_connector vga_connector;
> +                       struct drm_connector connector;
>                 } vga;
>                 struct {
>                         struct drm_encoder encoder;
> -                       struct ast_sil164_connector sil164_connector;
> +                       struct drm_connector connector;
>                 } sil164;
>                 struct {
>                         struct drm_encoder encoder;
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 5f273b5dd769..326f29dae844 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1330,10 +1330,8 @@ static const struct drm_connector_funcs ast_vga_connector_funcs = {
>         .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>  };
>
> -static int ast_vga_connector_init(struct drm_device *dev,
> -                                 struct ast_vga_connector *ast_vga_connector)
> +static int ast_vga_connector_init(struct drm_device *dev, struct drm_connector *connector)
>  {
> -       struct drm_connector *connector = &ast_vga_connector->base;
>         struct ast_i2c_chan *i2c;
>         int ret;
>
> @@ -1364,8 +1362,7 @@ static int ast_vga_output_init(struct ast_private *ast)
>         struct drm_device *dev = &ast->base;
>         struct drm_crtc *crtc = &ast->crtc;
>         struct drm_encoder *encoder = &ast->output.vga.encoder;
> -       struct ast_vga_connector *ast_vga_connector = &ast->output.vga.vga_connector;
> -       struct drm_connector *connector = &ast_vga_connector->base;
> +       struct drm_connector *connector = &ast->output.vga.connector;
>         int ret;
>
>         ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DAC);
> @@ -1373,7 +1370,7 @@ static int ast_vga_output_init(struct ast_private *ast)
>                 return ret;
>         encoder->possible_crtcs = drm_crtc_mask(crtc);
>
> -       ret = ast_vga_connector_init(dev, ast_vga_connector);
> +       ret = ast_vga_connector_init(dev, connector);
>         if (ret)
>                 return ret;
>
> @@ -1401,10 +1398,8 @@ static const struct drm_connector_funcs ast_sil164_connector_funcs = {
>         .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>  };
>
> -static int ast_sil164_connector_init(struct drm_device *dev,
> -                                    struct ast_sil164_connector *ast_sil164_connector)
> +static int ast_sil164_connector_init(struct drm_device *dev, struct drm_connector *connector)
>  {
> -       struct drm_connector *connector = &ast_sil164_connector->base;
>         struct ast_i2c_chan *i2c;
>         int ret;
>
> @@ -1435,8 +1430,7 @@ static int ast_sil164_output_init(struct ast_private *ast)
>         struct drm_device *dev = &ast->base;
>         struct drm_crtc *crtc = &ast->crtc;
>         struct drm_encoder *encoder = &ast->output.sil164.encoder;
> -       struct ast_sil164_connector *ast_sil164_connector = &ast->output.sil164.sil164_connector;
> -       struct drm_connector *connector = &ast_sil164_connector->base;
> +       struct drm_connector *connector = &ast->output.sil164.connector;
>         int ret;
>
>         ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_TMDS);
> @@ -1444,7 +1438,7 @@ static int ast_sil164_output_init(struct ast_private *ast)
>                 return ret;
>         encoder->possible_crtcs = drm_crtc_mask(crtc);
>
> -       ret = ast_sil164_connector_init(dev, ast_sil164_connector);
> +       ret = ast_sil164_connector_init(dev, connector);
>         if (ret)
>                 return ret;
>
> --
> 2.36.1
>
