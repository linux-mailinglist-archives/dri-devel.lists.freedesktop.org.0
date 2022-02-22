Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B32A4C045C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 23:10:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566E010E32C;
	Tue, 22 Feb 2022 22:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4800810E32C
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 22:10:07 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id i11so38628805eda.9
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 14:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ncJM2T87X2o8pTyVRveZGSOn+a2+yRMOSUhJC3B/Gq4=;
 b=Ivl+fOAzjwZVikAE//GhKXqrg3FgwasunygzL6X3K7tmMukt25sYmGH/BgwYn33eey
 2oGVVJytRTJ3g4D06lpohmTyGRsIdaXZQWvxUoiiNWjYdiWXL/9J4CrtB84gRRQ47W25
 ecpmNDu6kl1oulpWSeokNUQNW6BZAhhT25Rls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ncJM2T87X2o8pTyVRveZGSOn+a2+yRMOSUhJC3B/Gq4=;
 b=bspAN1P8vBElC+bjwRsRTPLTNxT8+jMRT3tYiWBtmdwGkHF88K/93h32+ew06enyMg
 yNs5TYQFJPZoqDsJqlI4c7VewPssWB5GeFL5oej8thUPs/cUZ9ruq8XheZw9FCFkDXcq
 JB9E6eBnRzWLT3hwc6T9bhcyltBTOeIuP4FInQgByhgfM8qtQFb0Uzw6sANRu//vKOrM
 E+XZPo2QM8uvR9ocB+SwWJ82JV28EteL5/Av6Pa5OSR9CYWMvwNbDK2gQ67ej9xQgDG+
 nnUPs9aKPFYQxel+rj9CuTyi8TRt8FnAywiviGsM23lU1iS5eD9tarsnFSdQ7CLWmGj4
 9zSQ==
X-Gm-Message-State: AOAM531KLm8IhA1zMiuAhbTcpdjxz1uSa2DtOfsM60V4E0HPVd6NTe/C
 iV8gKWJWfBAE3UhlntKONssXCWVGAeZopkZP01I=
X-Google-Smtp-Source: ABdhPJxVyNA8CuTfmYY1go5oUblsXi3OKvRgh9JTJ0y0KenPNaTe+3yDRmKm1TL9jkqvWVY0WK1eVA==
X-Received: by 2002:a50:e1c6:0:b0:410:e2e8:9d3 with SMTP id
 m6-20020a50e1c6000000b00410e2e809d3mr28555385edl.180.1645567805467; 
 Tue, 22 Feb 2022 14:10:05 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44])
 by smtp.gmail.com with ESMTPSA id pg26sm4748031ejb.194.2022.02.22.14.10.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 14:10:04 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id q23so1361612wra.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 14:10:04 -0800 (PST)
X-Received: by 2002:adf:ef07:0:b0:1e3:333f:a101 with SMTP id
 e7-20020adfef07000000b001e3333fa101mr21559376wro.301.1645567804216; Tue, 22
 Feb 2022 14:10:04 -0800 (PST)
MIME-Version: 1.0
References: <20220217144136.v3.1.I773a08785666ebb236917b0c8e6c05e3de471e75@changeid>
 <20220217144136.v3.2.I48b18ab197c9b649d376cf8cfd934e59d338f86d@changeid>
In-Reply-To: <20220217144136.v3.2.I48b18ab197c9b649d376cf8cfd934e59d338f86d@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Feb 2022 14:09:51 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UudBo7aZqD8oGHAu94LEYovMtFq7hjwOG2_8yxUeNi_w@mail.gmail.com>
Message-ID: <CAD=FV=UudBo7aZqD8oGHAu94LEYovMtFq7hjwOG2_8yxUeNi_w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/bridge: analogix_dp: Enable autosuspend
To: Brian Norris <briannorris@chromium.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sean Paul <sean@poorly.run>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Feb 17, 2022 at 2:42 PM Brian Norris <briannorris@chromium.org> wrote:
>
> DP AUX transactions can consist of many short operations. There's no
> need to power things up/down in short intervals.
>
> I pick an arbitrary 100ms; for the systems I'm testing (Rockchip
> RK3399), runtime-PM transitions only take a few microseconds.
>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>
> Changes in v3:
>  - New in v3
>
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 16be279aed2c..d82a4ddf44e7 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1121,7 +1121,7 @@ static int analogix_dp_get_modes(struct drm_connector *connector)
>
>                 pm_runtime_get_sync(dp->dev);
>                 edid = drm_get_edid(connector, &dp->aux.ddc);
> -               pm_runtime_put(dp->dev);
> +               pm_runtime_put_autosuspend(dp->dev);

So I think you can fully get rid of these ones now and rely on the
ones in the aux transfer, right?


>                 if (edid) {
>                         drm_connector_update_edid_property(&dp->connector,
>                                                            edid);
> @@ -1642,7 +1642,7 @@ static ssize_t analogix_dpaux_transfer(struct drm_dp_aux *aux,
>
>         ret = analogix_dp_transfer(dp, msg);
>  out:
> -       pm_runtime_put(dp->dev);
> +       pm_runtime_put_autosuspend(dp->dev);
>
>         return ret;
>  }
> @@ -1775,6 +1775,8 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
>         if (ret)
>                 return ret;
>
> +       pm_runtime_use_autosuspend(dp->dev);
> +       pm_runtime_set_autosuspend_delay(dp->dev, 100);

It's explicitly listed in the Documentation that you need the
corresponding pm_runtime_dont_use_autosuspend(). Specifically, it
says:

> Drivers in ->remove() callback should undo the runtime PM changes done
> in ->probe(). Usually this means calling pm_runtime_disable(),
> pm_runtime_dont_use_autosuspend() etc.

Not that it's very common to see anyone actually get it right, but I
seem to remember running into an issue when I didn't do it. I think
ti-sn65dsi86 still has it wrong since I found out about this later.
Need to write a patch up for that... Basically you want to put it
right before the two calls in your driver to pm_runtime_disable().

-Doug
