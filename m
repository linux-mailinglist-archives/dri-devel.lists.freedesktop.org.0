Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B03E44E5AD7
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 22:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED6B10E170;
	Wed, 23 Mar 2022 21:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE24E10E170
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 21:47:33 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id p15so5510837ejc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 14:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rpLwbK3ZnF+KGIeTyi7JNaXNXc/YWjWIzY7cGfQ2thU=;
 b=h9CHNPAQ59ce5gX3E3LT7N4cDZX1qchaMgh3A5YmdHQ4QDZBFl/0mMp+tdW0oqGKqU
 GTnYaCQVfa+GI9VYPsnlf2uq/sE/M1KX/IqMVW7rwPFtP0S5ops03rpEgo3PT7MDeyrS
 DLhaTFlm20CZbBmtPVCo5pv+38jIh7WjTd/KQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rpLwbK3ZnF+KGIeTyi7JNaXNXc/YWjWIzY7cGfQ2thU=;
 b=vo78P3vetmfd+7mF2LnUVnn/xH1o4JE9s8eLfQ9wiK6z3OUj9UoezfEJN7xt7N6QkL
 LrpzJm1+ENSJOQwCBm4lIm8ayL/XHNU/oWTH2MhjCrJHw+JiM1yyVFhckw+sYI905sTP
 oGePRBYIMmKxNFzPgprryzylPHu2gd4gczZO/2E/gaKAQYQ9UNBdH1M/66nCMnV/frQv
 YZdu+Rw9uURjoTGfObrHQKlxgzowyfzAU4O585oHS53NS1bkHSa/3uLNyMWb8fjgKFTP
 Gz5dex55g7IO1e5xLRph9qLZhIZhj5219wYl3Guimd8drwWhZNiTnvZNMSQuSQ94q2ol
 UMvg==
X-Gm-Message-State: AOAM530ZCGZBuSk0NOcD33uOW/fKi6ZAHiyP3XDY0CoISLWOrnWeC95H
 1nSg2q2Cm4hLucM3iv3v3ogz6Pd+DEWp0crZ
X-Google-Smtp-Source: ABdhPJwjW9USJoYAXpSqcQWDLS4xr9+xa7D6gO4uWQ9U6CT59VIOI1o8A4KaccUfGkwfaX6wW3v6PQ==
X-Received: by 2002:a17:906:94d1:b0:6df:8ac3:3eba with SMTP id
 d17-20020a17090694d100b006df8ac33ebamr2373890ejy.547.1648072051937; 
 Wed, 23 Mar 2022 14:47:31 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
 [209.85.128.44]) by smtp.gmail.com with ESMTPSA id
 l2-20020a1709060cc200b006d3d91e88c7sm374613ejh.214.2022.03.23.14.47.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 14:47:30 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id
 bi13-20020a05600c3d8d00b0038c2c33d8f3so6179013wmb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 14:47:29 -0700 (PDT)
X-Received: by 2002:a05:600c:2e02:b0:38c:8390:d8ca with SMTP id
 o2-20020a05600c2e0200b0038c8390d8camr1947078wmf.15.1648072049203; Wed, 23 Mar
 2022 14:47:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220317131250.1481275-1-kieran.bingham+renesas@ideasonboard.com>
 <20220317131250.1481275-4-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20220317131250.1481275-4-kieran.bingham+renesas@ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 23 Mar 2022 14:47:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WmkYg33qsXS4znQ8K2H0xVhJfZoPC+HjKt-rPhZ_R4KA@mail.gmail.com>
Message-ID: <CAD=FV=WmkYg33qsXS4znQ8K2H0xVhJfZoPC+HjKt-rPhZ_R4KA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] drm/bridge: ti-sn65dsi86: Support hotplug detection
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Mar 17, 2022 at 6:13 AM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
>
> @@ -1241,9 +1350,32 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
>         pdata->bridge.type = pdata->next_bridge->type == DRM_MODE_CONNECTOR_DisplayPort
>                            ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_eDP;
>
> -       if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
> +       if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort) {
>                 pdata->bridge.ops = DRM_BRIDGE_OP_EDID;
>
> +               if (!pdata->no_hpd)
> +                       pdata->bridge.ops |= DRM_BRIDGE_OP_DETECT;
> +       }
> +
> +       if (!pdata->no_hpd && pdata->irq > 0) {
> +               ret = devm_request_threaded_irq(pdata->dev, pdata->irq, NULL,
> +                                               ti_sn65dsi86_irq_handler,
> +                                               IRQF_ONESHOT, "sn65dsi86-irq",
> +                                               pdata);
> +               if (ret)
> +                       return dev_err_probe(pdata->dev, ret,
> +                                            "Failed to register DP interrupt\n");
> +
> +               /* Enable IRQ based HPD */
> +               pdata->bridge.ops |= DRM_BRIDGE_OP_HPD;
> +
> +               /*
> +                * Keep the IRQ disabled initially. It will only be enabled when
> +                * requested through ti_sn_bridge_hpd_enable().
> +                */
> +               disable_irq(pdata->irq);

Instead, I think you should use `IRQF_NO_AUTOEN` which makes sure that
no matter what the state of the hardware is your IRQ won't fire
"early". ...and, of course, it saves a line of code. ;-)

Other than that this looks nice to me now so feel free to add my
Reviewed-by tag after the above is fixed.

-Doug
