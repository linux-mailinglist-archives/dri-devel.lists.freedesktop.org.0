Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D57730F6BE
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 16:51:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6146EE05;
	Thu,  4 Feb 2021 15:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582426EBC4
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 12:05:28 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id e12so1656381pls.4
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 04:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3gCwnJ3I9TFynlXEE8EgeDSc39OV8tdTTKcZtSs6Ob4=;
 b=pMVNR9XQ5X8T87rmsm48JCoslRIqG0EnlWBjAb6WHAvZOeIxyj2TRJh9wRqraexw/g
 ziQJ35MJ8oLcyIL8gD73cX9x0S3QP3ZHCsXx1d9apIGe3IP2QhCrsODgomRmEuF/BM/s
 TNiQTIGJWqXuqvTeF8rUedp93b/6llTNJfLExHC8WCB/2nLPdtBDEzD/KoXxLR2diMwW
 cTtzZ8waYaNGVVS0S52ML3lY5B8vxdKUH8BHnp8l6/zclOWgJOio+28qUntlf8pp+Z+L
 xn1NRzQ4BguP4n7giKheAxDsLeSPx5BnXRz9nbMgO81daLgjLIeuHQOF9gfltTISKdTl
 8xxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3gCwnJ3I9TFynlXEE8EgeDSc39OV8tdTTKcZtSs6Ob4=;
 b=XgdJpieK+zzuArfmLrLjWNNe+utdWcb1kyVNhec5lL/Q5gUGFKX02AmJSwm0kW4XNN
 4K35Bh9xJrCl/g6bCtvbDOaYGLPEuH5j6x6/5VAB6JKkr6VS2Hwli63SxvzHUa/WkLnv
 JqewKkjG6r3G15BXuCJplNek2X6n94juEu/0MFRJ7c/qlMeZ+Zaw+Td/0BW0rInuLVPG
 6/aekh6BJIoCJxxSjJ8MqebAIR8Uee3n6q0BPkR07JslttU9NyVbTJ/NI4DRVGbMYs3q
 WKV+c4vqi/H4m+XJbfouvYGJBWczNya2clQsvC3BAOog87GzSVNL5hS+nFN6Ucy3x9RJ
 tPUQ==
X-Gm-Message-State: AOAM532A6pbrCIdyM2jZV8MURoFgIL74FXOmAzkKDjh39mw7PTmy7ra3
 aB/j7x4iKmGcBZTScsiWaib6aSklR3BBMU88mwV22g==
X-Google-Smtp-Source: ABdhPJwzDbuoQicSrDC63yyRE+e3cv4bXJqhpUMqxqgXg7BPyh+dk863cUQABNYOGRT+4bP925wm4mKt33lqmX4ll5A=
X-Received: by 2002:a17:90a:4ecb:: with SMTP id
 v11mr8360759pjl.75.1612440327917; 
 Thu, 04 Feb 2021 04:05:27 -0800 (PST)
MIME-Version: 1.0
References: <20210128111549.GA8174@zhaomy-pc>
In-Reply-To: <20210128111549.GA8174@zhaomy-pc>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 4 Feb 2021 13:05:16 +0100
Message-ID: <CAG3jFysU4epjS3A85ZojrJn3TAC78O_jx5p_4SWsCdRBrQ5GXQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: enable DSI EOTP
To: Xin Ji <xji@analogixsemi.com>
X-Mailman-Approved-At: Thu, 04 Feb 2021 15:50:48 +0000
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
Cc: devel@driverdev.osuosl.org, Nicolas Boichat <drinkcat@google.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Sheng Pan <span@analogixsemi.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Xin,

Thanks for the patch.

On Thu, 28 Jan 2021 at 12:17, Xin Ji <xji@analogixsemi.com> wrote:
>
> Enable DSI EOTP feature for fixing some panel screen constance
> shift issue.
> Removing MIPI flag MIPI_DSI_MODE_EOT_PACKET to enable DSI EOTP.

I don't think I quite understand how removing the
MIPI_DSI_MODE_EOT_PACKET flag will cause DSI EOTP to be enabled. Could
you extrapolate on this in the commit message?

>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 65cc059..e31eeb1b 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1334,7 +1334,6 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
>         dsi->format = MIPI_DSI_FMT_RGB888;
>         dsi->mode_flags = MIPI_DSI_MODE_VIDEO   |
>                 MIPI_DSI_MODE_VIDEO_SYNC_PULSE  |
> -               MIPI_DSI_MODE_EOT_PACKET        |
>                 MIPI_DSI_MODE_VIDEO_HSE;
>
>         if (mipi_dsi_attach(dsi) < 0) {
> --
> 2.7.4
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
