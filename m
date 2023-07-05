Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 968C9747C1C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 06:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BE910E034;
	Wed,  5 Jul 2023 04:45:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E014910E034
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 04:45:38 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-635eb5b0320so46143806d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 21:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688532337; x=1691124337;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZvfvXAVyob3htxlBCjHDC3d0cF9EwxU5FiwqJrsNIFQ=;
 b=h85RDU5faMJMQFRpL11aGFUvNF/ofs+2e1lUAoBYP8SLsCQG3po2qN0EcgfzDFwIBW
 BzJNoYc7bPOIh3frqeehvRErPNng/ZJBR2F39EflnmYKKm6DTzb/3bJcr9hAhBhde9m0
 zwEjKFR+OYjRIakJntOIQn1gpnPMeYhebdCLAlsSV1hbUwow1dZC0oJ0jFqPyyaVnVys
 /XhUDt1TCqEjSEyTswOrSLWS9xN1FOQ1NJQ5gU2oY4dS3UbKAnZ2tXnDtRrX9DXHhJch
 dHAfi/nlrITlGVNXKe0zxMCLQH6gJ4jzJBZZMFPtOQftUYfdDCv8RiuLOu1NQw5RfO9V
 xrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688532337; x=1691124337;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZvfvXAVyob3htxlBCjHDC3d0cF9EwxU5FiwqJrsNIFQ=;
 b=UOopsHTI21A1Aixdl4fvy3P+OMQluinSl3SFqp7kFoVJMtYn4jr691QmNxRA8y0tfD
 NY68souhdSiYu15k3vZ96B9Noy3YivEvgnJ3DI3M3e9d3sQLKXowJ/o1ixcZwYyMaOGz
 oEQIcdF3/Tb0FE8lZTMCPY2jaxGKLox3OtHOrVA2/YoLL0GY+arGZ/nxJfDZt6LokDAR
 JXbrKOcIj4SRAIVw7f0NrcYhHcBC6w3FUFCKzHWgxOI66KNfl6NEK+/9HxGf0QhF00/f
 RZzEtJWONTsEhirkNfo0dPSuyUv7Caa9RQ3zEbetFSOju0BwhgrhChI06WLiwIXyokM/
 YfGQ==
X-Gm-Message-State: ABy/qLZUMRt9snM3TSXgtVdMUPgLR92aX3ys2vzheiRvL4Sc5qaTVmli
 CzPjALYL4AWz+FnMMg9dl7mCInRanTvfFhNkdvQINw==
X-Google-Smtp-Source: APBJJlGJ2wHlfkfB3ZQ1QzikScAKQ6X408nThkn6EJ0gQwXU34hiTOLxSmGlh70SM1vVx/GFl+3ylm2hqxwKnXlu9vc=
X-Received: by 2002:a05:6214:27c4:b0:635:df49:719c with SMTP id
 ge4-20020a05621427c400b00635df49719cmr19427849qvb.22.1688532337691; Tue, 04
 Jul 2023 21:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230403221233.500485-1-marex@denx.de>
 <20230403221233.500485-2-marex@denx.de>
In-Reply-To: <20230403221233.500485-2-marex@denx.de>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Wed, 5 Jul 2023 10:15:01 +0530
Message-ID: <CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
 EOT packet
To: Marek Vasut <marex@denx.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Michael Walle <michael@walle.cc>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Wed, 5 Jul 2023 at 01:48, Marek Vasut <marex@denx.de> wrote:
>
> Do not generate the HS front and back porch gaps, the HSA gap and
> EOT packet, as these packets are not required. This makes the bridge
> work with Samsung DSIM on i.MX8MM and i.MX8MP.

This patch broke display on Dragonboard 845c (SDM845) devboard running
AOSP. This is what I see
https://people.linaro.org/~amit.pundir/db845c-userdebug/v6.5-broken-display/PXL_20230704_150156326.jpg.
Reverting this patch fixes this regression for me.

Regards,
Amit Pundir

>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Michael Walle <michael@walle.cc>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index a25d21a7d5c19..151efe92711c4 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -774,7 +774,9 @@ static struct mipi_dsi_device *lt9611_attach_dsi(struct lt9611 *lt9611,
>         dsi->lanes = 4;
>         dsi->format = MIPI_DSI_FMT_RGB888;
>         dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> -                         MIPI_DSI_MODE_VIDEO_HSE;
> +                         MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO_NO_HSA |
> +                         MIPI_DSI_MODE_VIDEO_NO_HFP | MIPI_DSI_MODE_VIDEO_NO_HBP |
> +                         MIPI_DSI_MODE_NO_EOT_PACKET;
>
>         ret = devm_mipi_dsi_attach(dev, dsi);
>         if (ret < 0) {
> --
> 2.39.2
>
