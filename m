Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 192C2198CA6
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 09:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE882892AA;
	Tue, 31 Mar 2020 07:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48BD89996
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 07:01:16 +0000 (UTC)
Received: by mail-vk1-xa43.google.com with SMTP id q8so5416590vka.8
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 00:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HvuAH+ZYLpn75EjzibJc7yETVLNUxZFK2JZ8MLXPA78=;
 b=b05sdn21WYjo3DK3zZJ08Q9TtPiYpAWWxAiq3/L7PYpRFs/rZNM3yw8hc22eRKyInj
 UD1o2FE+dPcLqR5R6YWgTaKL21ubz/I/91Cb+o3NdwJnYvnq0FbGmnpibJ9CQqxa9Yjb
 baslK/+CNW5WROZHoLLrT2uhkCXjBz6iTM6HA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HvuAH+ZYLpn75EjzibJc7yETVLNUxZFK2JZ8MLXPA78=;
 b=H8XS9W2SqK9eSIumll+OBkHEyXJbf7YmRzSwHh9sx/SNGWGBg0A1+HWllaUxSlrx34
 FrP/k6hTfNZ2xEPapYknQ1JMpp1HsQn5vNTj2xBv9P61OqQJf71Vofl3LW7VUfQze/2t
 RDknIevYkk5+IohYrWIIZ2Dlh3KFVmcIQ+El9wmrGIBlXc+2MromM82u/6YOMAnigmby
 NndKS6TUJ92oBlfRbfl35J2kr2Ye3NAuZOJLv4DK8bExU9Z5jOLc7Z+aOTG0h/DPkyZV
 cJ+MflKLm7HnCKrCqIVmwfykfGG0FyiD3klL00vP+hKYjOOyl6dkJVJ1Pu8V1Fiw2/Gz
 bRyQ==
X-Gm-Message-State: AGi0Pua2M8hGjqMxa9zMg77k9QOqYl2kEEWsm2C6hagGxrpwSZKSxz9l
 VwiLGghbc1AI0uA44j63Aqs+FO/qx+ESC5c/TVdCPg==
X-Google-Smtp-Source: APiQypJZp4XEKa40PUQLr268/WGLXXDcI/rS9Qr2D5ddfkZrMAM7A+tJSFJKi5kKIZ/EhuBfEg7SRBKJmqp8r6cd9h0=
X-Received: by 2002:a1f:5cc4:: with SMTP id q187mr10506325vkb.85.1585638075720; 
 Tue, 31 Mar 2020 00:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200324075734.1802-1-david.lu@bitland.com.cn>
In-Reply-To: <20200324075734.1802-1-david.lu@bitland.com.cn>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 31 Mar 2020 15:01:04 +0800
Message-ID: <CANMq1KA_iHHbCfm8AwBuj7zaazZtdtaE-nS+ZvdX5OyVTDbrmA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: boe-tv101wum-n16: extend LCD support list
To: David Lu <david.lu@bitland.com.cn>
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
Cc: David Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, jungle.chiang@bitland.com.cn,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 25, 2020 at 4:17 PM David Lu <david.lu@bitland.com.cn> wrote:
>

No very strong opinion, but for consistency, I'd have this as a title:
drm/panel: support for boe,tv105wum-nw0 dsi video mode panel

> Add entries for BOE TV105WUM-NW0 10.5" WUXGA TFT LCD panel.
>
> Signed-off-by: David Lu <david.lu@bitland.com.cn>
> Change-Id: I5b1cef259de5fb498220dcc47baa035083c41667

No Change-Id please.

Otherwise:

Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

> ---
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> index 48a164257d18..f89861c8598a 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> @@ -696,6 +696,34 @@ static const struct panel_desc auo_b101uan08_3_desc = {
>         .init_cmds = auo_b101uan08_3_init_cmd,
>  };
>
> +static const struct drm_display_mode boe_tv105wum_nw0_default_mode = {
> +       .clock = 159260,
> +       .hdisplay = 1200,
> +       .hsync_start = 1200 + 80,
> +       .hsync_end = 1200 + 80 + 24,
> +       .htotal = 1200 + 80 + 24 + 60,
> +       .vdisplay = 1920,
> +       .vsync_start = 1920 + 10,
> +       .vsync_end = 1920 + 10 + 2,
> +       .vtotal = 1920 + 10 + 2 + 14,
> +       .vrefresh = 60,
> +       .type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static const struct panel_desc boe_tv105wum_nw0_desc = {
> +       .modes = &boe_tv105wum_nw0_default_mode,
> +       .bpc = 8,
> +       .size = {
> +               .width_mm = 141,
> +               .height_mm = 226,
> +       },
> +       .lanes = 4,
> +       .format = MIPI_DSI_FMT_RGB888,
> +       .mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> +                     MIPI_DSI_MODE_LPM,
> +       .init_cmds = boe_init_cmd,
> +};
> +
>  static int boe_panel_get_modes(struct drm_panel *panel,
>                                struct drm_connector *connector)
>  {
> @@ -834,6 +862,9 @@ static const struct of_device_id boe_of_match[] = {
>         { .compatible = "auo,b101uan08.3",
>           .data = &auo_b101uan08_3_desc
>         },
> +       { .compatible = "boe,tv105wum-nw0",
> +         .data = &boe_tv105wum_nw0_desc
> +       },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, boe_of_match);
> --
> 2.24.1
>
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
