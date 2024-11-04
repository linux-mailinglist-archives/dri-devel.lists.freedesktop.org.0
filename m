Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B919BB9AB
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 17:01:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D93F10E479;
	Mon,  4 Nov 2024 16:01:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Hb9Ekhoj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED8B310E47D
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 16:01:08 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-e30d517c82fso4062697276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2024 08:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1730736068; x=1731340868;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=r32SkwEDEGyM8KRubZcTgZf56txRY/08O0Oc/h8gpfM=;
 b=Hb9Ekhoj42AC95jOkINK/MFCTL9xpmzIXhGW3jeNdGq/W4YrZGfJIfHdpvb2iXOr/s
 byRBgKhZwK9CyhRuKJftHxKa7JF67SXwLe04i2/jfZeJRQUa9ymEisA0WHo678+WHsRI
 TJGMX9IVbxlz8Tgm7SwhGLe/ufNy8v+BJ/vDkNx7fb2T/5miYbdpCVFM504UFV8d1guy
 JnBDvpFWuANoUsGZqDwkBTvvCkIFU07Zrz2mtd4CQmRsFfQg6FDWx4Uqdk+VDr78a08B
 AzLch7PrYCxVACpvt0taMAiKJ3FclErbWDN25IEbNJOF3rPYQd4LnZUUYTUiboxsDvgS
 D06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730736068; x=1731340868;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r32SkwEDEGyM8KRubZcTgZf56txRY/08O0Oc/h8gpfM=;
 b=fRiLgCuS3moUqLNt+eUI3GlFEALZ367Tz4F9WwHB5Wu6by8Wlx/MakjuWobDykTIBv
 7nXZ9H4AZgeoTVSHbdfo0kma5VKvOm0YSnCpi88YyVG5Hr6kaEy13yjXYb0/fBA7QAnO
 lZT/EyiJXfxW/cGcoBsM9ZR2Yh2bHxqStUq1mHXtPthcDwdgJ5pCM1LK6qx7qaDIvhaN
 thriXaoropcxfL6QBOyxLflHItpb5DybWOgUjt+b1VpSu+r1xDL8PuM1y8UiCDbBRpul
 0NsAM4SfHQnLBe92be86FSjNYmIhhtp/5nkh0jUejrr6nhxTM1r9pAX5h8a6BdHb0rNv
 fZ7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSL0jNiy5sb7LtzJxfn5Qlaiw9Z09it4rwbtU/r0F+nGSxzfFSyIJFC/IlTAl/FyEPWu3ebi59TGA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxzf8A2fpuA4FdH+KrAAuk6HokyjwigUxpLlA+yeb+vY6uxBmuB
 WeQ7P6jte7XDHE2O9j2YdH76cYSDrN3PN9kJAXjS5xkTkXZMAoL0MKtlQJ3B6QbwDVlE2y0EzxE
 UIRceJPVce6IkPYEmHeBKTT/34de4ZWowXzGjwg==
X-Google-Smtp-Source: AGHT+IFujurUNdBIc2jhl5l4ausb7S50k/V0Wx+SJ0D+7ItaEAYASme79PTW2iU/NqOUarwZskVPOJUg2kPhSceaIIM=
X-Received: by 2002:a05:690c:9c10:b0:6ea:4e1f:2b40 with SMTP id
 00721157ae682-6ea4e1f3d77mr171184117b3.9.1730736067813; Mon, 04 Nov 2024
 08:01:07 -0800 (PST)
MIME-Version: 1.0
References: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org>
 <20241101-hdmi-mode-valid-v2-3-a6478fd20fa6@linaro.org>
In-Reply-To: <20241101-hdmi-mode-valid-v2-3-a6478fd20fa6@linaro.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 4 Nov 2024 16:00:51 +0000
Message-ID: <CAPY8ntCyg7P2gZ9QpLFUQxZY52e4-MSA=6PM1ZfVBKWwgoxXjw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] drm/vc4: use drm_hdmi_connector_mode_valid()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Nov 2024 at 00:25, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Use new drm_hdmi_connector_mode_valid() helper instead of a
> module-specific copy.
>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 62b82b1eeb3694d1685969c49b2760cbbddc840e..486e513b898d7f761e8615f2afc193ca44b23200 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1752,7 +1752,6 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
>                             const struct drm_display_mode *mode)
>  {
>         struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
> -       unsigned long long rate;
>
>         if (vc4_hdmi->variant->unsupported_odd_h_timings &&
>             !(mode->flags & DRM_MODE_FLAG_DBLCLK) &&
> @@ -1760,8 +1759,7 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
>              (mode->hsync_end % 2) || (mode->htotal % 2)))
>                 return MODE_H_ILLEGAL;
>
> -       rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
> -       return vc4_hdmi_connector_clock_valid(&vc4_hdmi->connector, mode, rate);
> +       return drm_hdmi_connector_mode_valid(&vc4_hdmi->connector, mode);
>  }
>
>  static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
>
> --
> 2.39.5
>
