Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C81095713F3
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 10:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E4E12AAC0;
	Tue, 12 Jul 2022 08:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE5AF12AA52
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 08:07:54 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id ez10so12882678ejc.13
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 01:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ITVhnqo1Cv9/rj2IS2OAC3zsa28ryV/5jfshq0IqbrM=;
 b=HH5x+ipYuSILhjaCqwXRHRGdn8R2iE9it0Raabx0zG7RiLVbQD6paOyfsCyl0WDrLF
 R5XoZ7aTaJTnZF2x2seTAP7qb0LiLkKUyC2nOuXmKzTmbCJKcHdw/ptEKclRERYOF59E
 KkgJPwoxfu4c024UgrISFxVoaiqk4HGG+APntuIOEfWfWK0uJ0Fe04lJ7YsuHkyG28Gt
 vjqKag19IHw0lh3qsOIFh0pPk0Ebm7SZFO8ZG7+2xbLVN3FtyxP3znjVJjuWLOR1dUQ6
 SrMUgw6oy2EcLYRYJYR8M0smp2b9tKiy0ctybyRv/i9Rd+x1x8vRuZzkT/BNsSvGu0fg
 iJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ITVhnqo1Cv9/rj2IS2OAC3zsa28ryV/5jfshq0IqbrM=;
 b=5t0S2ZmQQmZMvwSamocz8XcSxv4jQXu3KrB7intkmBdbxXoZbQsTNQr+PTzQIoJmlh
 FASTFxleHl1jYVpEQC+LD9n8cF59sVnh3BfY4Y0RyNLQwtPcpNlGFPvUyiieKGpP5JDS
 NRTcKeq5OtSVzulSAK1hUwhrHDfmjeeMHV2naZnIwdkTqY4i5tasS7Xs48od/MHu0iWT
 /Yv8WM0N4u7UC4D+qlcBeSAix+CfyiOXBSjbcgrWpoj08cEJbAYigzx2BIGKMfqH5Qdz
 Jx2rLSL+bhXIr3NBVNylKBu8XyfzLuWZ9zItLwu0VyK1a6Sergn2en9HgQKGwk48aGVn
 xgHg==
X-Gm-Message-State: AJIora9JigGsr4LjB2mEYn3YxmzBZyIraNWz19P1fBx2pP+0Oo4vk9W3
 EqhUXmaQyuch+qlL0WDLWOPF5k6iP247CRxlMxiSMw==
X-Google-Smtp-Source: AGRyM1tPaVDQ4QKhpXmcSUkc8kF1eeRMrVHZYwDUL9byPNuSCRXq7stKql2iScJzi/bvVrwBvpPq0VXb013QRxtlSks=
X-Received: by 2002:a17:906:b6c7:b0:726:60aa:1b81 with SMTP id
 ec7-20020a170906b6c700b0072660aa1b81mr22449356ejb.383.1657613273439; Tue, 12
 Jul 2022 01:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220707080600.49041-1-allen.chen@ite.com.tw>
 <20220707080600.49041-2-allen.chen@ite.com.tw>
In-Reply-To: <20220707080600.49041-2-allen.chen@ite.com.tw>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 12 Jul 2022 10:07:41 +0200
Message-ID: <CAG3jFystTA3sD2nWJHPYq39WxRwjVt4qj2DMDk2Khh1kR=8ntg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/bridge: it6505: Modified power sequence
To: allen <allen.chen@ite.com.tw>
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
Cc: Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Pin-yen Lin <treapking@google.com>, open list <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Pin-Yen Lin <treapking@chromium.org>,
 Hermes Wu <Hermes.Wu@ite.com.tw>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Allen,

On Thu, 7 Jul 2022 at 10:06, allen <allen.chen@ite.com.tw> wrote:
>
> From: allen chen <allen.chen@ite.com.tw>
>
> Change power sequence to meet it6505 data sheet requirement when boot on.
>
> Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 2d119e3016b3..aa5e0aa1af85 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -3029,7 +3029,7 @@ static int it6505_init_pdata(struct it6505 *it6505)
>                 return PTR_ERR(pdata->ovdd);
>         }
>
> -       pdata->gpiod_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +       pdata->gpiod_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);

Making this change is problematic since it requires a corresponding
change in all of the device trees that use this device. It's against
policy to change this interface after it has been introduced.

Unless anyone thinks otherwise, I would like to see this patch dropped.

>         if (IS_ERR(pdata->gpiod_reset)) {
>                 dev_err(dev, "gpiod_reset gpio not found");
>                 return PTR_ERR(pdata->gpiod_reset);
> --
> 2.25.1
>
