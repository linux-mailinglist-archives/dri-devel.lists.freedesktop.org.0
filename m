Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CCF423AD1
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 11:48:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D886E52E;
	Wed,  6 Oct 2021 09:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7D36E52E
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 09:48:02 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so1909594pjb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 02:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C8nV0IP/S7QSan27DkZ7e7zL8tgQM1N2fr9j15Ocmyc=;
 b=NKhWtZc6w/9z1Q50+Xi0ww8j8yu+FIKhFkJHOOldty22w2KVUrhNhH6f/lBoNVQq8P
 pq35IU9wKYDDu63N3zUwt3b6oeYuR23If54y8h1g0maYGel1lCJunRW5zmodMRVRRCva
 LSDSrjkNoB5tansYtuRMYYL38Ecb9/CTLAI3Kr3JX0SNNJQoQq22D3eclbTdEjiUx4Ut
 7hS57lzCorv9yqCczw29spt+TVpwJQPRCfHzKsTXbR7tz0TOe7+jW0newaI3o1fd2OGo
 NvILrGsqQhgLVRPuGLStl3gobMNNsw3mHDH4MHumG3bxpgROfh3bVihYYwLAaZPTKEXn
 3uIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C8nV0IP/S7QSan27DkZ7e7zL8tgQM1N2fr9j15Ocmyc=;
 b=aKoib1pjq700wx6eyCpgsJMU6A0jyqWa1ej0S9DSW1IslZFvHJ8dKdQvqPnnkedT6m
 oxtWdGCoLzg/hN9xUt0LVZI8WLg60iSLdMfaJ75Jnv8mdtfdzr8Ro6wdibBm2ElJmrLB
 krfKHbK5uBCsBjRzJ8o7RDfP5FlcWXahLuhER+mNVp7iLAbUbV68V+Pzl3IrSJFmfcSI
 I0P36xFuBoxWrg+KsDTaKmpiOol/rWcEH+9JaFrZCPFyr1nVBpsF13sLgCp+pIrBG0Vc
 R8+VXIUxAOktRLcQx3mNsSWlLTt8Bsbr8IPov4xIdQr/b/jA4ve1E0YPwGqdy3qG18tD
 VKhg==
X-Gm-Message-State: AOAM530k27zjRci4V8hM+ThbayLIN6jjIMjaRMdGTSqgUowzEAiYWshS
 4W2T3eH/UKO0h/WHLQUFuUCyIoKx6XBUTXsf35ruqg==
X-Google-Smtp-Source: ABdhPJzZCb0MP3uUWNYYfr1BrNi0ZR4A8uaAVaph2MomlMNuPbjkfhIGc0AqpBIKJRep336IWhwFzUQ8VktF6rv3PyM=
X-Received: by 2002:a17:90a:190:: with SMTP id
 16mr9988293pjc.152.1633513681791; 
 Wed, 06 Oct 2021 02:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210907024038.871299-1-marex@denx.de>
In-Reply-To: <20210907024038.871299-1-marex@denx.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 6 Oct 2021 11:47:50 +0200
Message-ID: <CAG3jFyv-dHKn1HmMSU25zT1wfU0Zur_u45kD47KXrsz_pPEu0Q@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Implement .detach callback
To: Marek Vasut <marex@denx.de>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
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

>
On Tue, 7 Sept 2021 at 04:40, Marek Vasut <marex@denx.de> wrote:
>
> Move detach implementation from sn65dsi83_remove() to dedicated
 .detach callback. There is no functional change to the code, but
> that detach is now in the correct location.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index 4ea71d7f0bfbc..13ee313daba96 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -288,6 +288,19 @@ static int sn65dsi83_attach(struct drm_bridge *bridge,
>         return ret;
>  }
>
> +static void sn65dsi83_detach(struct drm_bridge *bridge)
> +{
> +       struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
> +
> +       if (!ctx->dsi)
> +               return;
> +
> +       mipi_dsi_detach(ctx->dsi);
> +       mipi_dsi_device_unregister(ctx->dsi);
> +       drm_bridge_remove(&ctx->bridge);
> +       ctx->dsi = NULL;

Is this assignment necessary? I'm not seeing it in the other drivers.

WIth this cleared up feel free to add my r-b.
Reviewed-by: Robert Foss <robert.foss@linaro.org>
