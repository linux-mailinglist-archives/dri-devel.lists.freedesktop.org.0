Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 482D93FC96F
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 16:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8897C89FF7;
	Tue, 31 Aug 2021 14:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B2689FF7
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 14:12:01 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 j4-20020a17090a734400b0018f6dd1ec97so2513256pjs.3
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 07:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DwBG0kbYLoprwx2xDskuGjAg4KxbwGBk3fVvkOflJfY=;
 b=n4plaO9ZqXTMabwQQad7OQWiFxsARGV7/IksaEq0V+fk0Zar3ZT8MUTLoE2UWcX4MU
 zrVz9ULgAArOMtdajOyS0NRgdYmASL0E3tULikziScQjHqXjdDxNJe8F3UuhQ5DCFetJ
 SEjUA0AznWEznLoyb4A+/Bp9ZQWGW+j2Wi4KjQWGqZ/+PuIH8uulXO87Q40BX/X/C9Ji
 VCkkkixVthgv0kfgThJ3bvFwJ2rmHkmipXXtLzc4YtwSC1Eot/27pCBts9+zBhgCXaZb
 YfbUSJPuTMOYkdYUSs1GXJ3NX3d2DI4yxeCMPM+avwPD8BP70QqkWLTTS/lNdppx7Rkm
 mVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DwBG0kbYLoprwx2xDskuGjAg4KxbwGBk3fVvkOflJfY=;
 b=cH6MiKfGhYV61bydOZoe64y7NhEVAmJVRCxW7dJXlwt4U8TaK2g0Cc9Q0a3c31YGkp
 CDsmOdQkQglprME9JtFQX0lXUoTk6+Rup8sV04ijinHgo+YpbgETUY8votVSoKuEDrIl
 etFs2QKImN//7wkSHxS9DFdMO6fYp8gjCynaz3L30M2pvnta3oNkFfh+EdUXN9181bO/
 PyhCdwLB7M4T8YkkCH5IzEgzVyELC19k1PcvkL/BhEOr5yHkbfVssgcV95ZjSiiqGa7T
 wr1kv7U3Fzgx1UGFaXgmeNUIvjO4h3ZoqQDBz3GXx37IL2sfwlh8C3ORriBSSoIg5j1A
 Rylg==
X-Gm-Message-State: AOAM532WCBMAuJcJVyBz/TFrvZSsgBozr3HE98V4rCqV3EFuw2Si4MxE
 g52jc/EWMW406lIZQIjSYSpP6PolpiUCpwOJTgQ5Pg==
X-Google-Smtp-Source: ABdhPJx5yHJTTzBrXq2AUYXsGcTAO5IKtUmnDI+oVOLx/pegeMs0loQRWMfDgCq3QQK52OVn5wqzTEChmIVQ8Q2ox7A=
X-Received: by 2002:a17:902:a513:b029:11a:9be6:f1b9 with SMTP id
 s19-20020a170902a513b029011a9be6f1b9mr4831914plq.55.1630419120987; Tue, 31
 Aug 2021 07:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210819060110.3427256-1-xji@analogixsemi.com>
In-Reply-To: <20210819060110.3427256-1-xji@analogixsemi.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 31 Aug 2021 16:11:49 +0200
Message-ID: <CAG3jFytk21cSVKiFcu859CBvUW593XQw5_D97Uydsf798jyWDg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: anx7625: enable DSI EOTP
To: Xin Ji <xji@analogixsemi.com>
Cc: Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Dan Carpenter <dan.carpenter@oracle.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Torsten Duwe <duwe@lst.de>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Bernie Liang <bliang@analogixsemi.com>, Qilin Wen <qwen@analogixsemi.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, devel@driverdev.osuosl.org
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

On Thu, 19 Aug 2021 at 08:01, Xin Ji <xji@analogixsemi.com> wrote:
>
> Enable DSI EOTP feature for fixing some panel screen constant shift issue.
> Removing MIPI flag MIPI_DSI_MODE_NO_EOT_PACKET to enable DSI EOTP.
>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index abc8db77bfd3..1a871f6b6822 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1335,7 +1335,6 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
>         dsi->format = MIPI_DSI_FMT_RGB888;
>         dsi->mode_flags = MIPI_DSI_MODE_VIDEO   |
>                 MIPI_DSI_MODE_VIDEO_SYNC_PULSE  |
> -               MIPI_DSI_MODE_NO_EOT_PACKET     |
>                 MIPI_DSI_MODE_VIDEO_HSE;
>
>         if (mipi_dsi_attach(dsi) < 0) {

Applied to drm-misc-next
