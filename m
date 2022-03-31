Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 424224EDCC1
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 17:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F4610F3EF;
	Thu, 31 Mar 2022 15:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E670C10F3D5
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 15:25:54 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id y10so19049394pfa.7
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 08:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Edurs2ybl3pjHq9Rj4aJF4VI4m7AdS23TQwX/ATEuMs=;
 b=XFoAoyoPNZuVbjrTjOAU4kLFdvbGS8ePJbm+ncbclHtaoaWu+abqy05w+JLZ9MEbH4
 0S4Gxj+t8Kcx9bXIS8hisiVEAgx8AxbS0s5Ap46gNeZY/niFj46ozs6eePYolAFc7DkZ
 rqHvOShJZpzpMVVXgQTOFz5YGC4n+7rOA/9iO/2tsiG9uFOwGAJDIYMGaZg4VuozCCzj
 AL3rmCi5reF1P1PUcL9kn3NHKbrsmFXKxNFhNeLFQyCjM9XtaZ5j28MiGLKZ7d4lyVHk
 GAh7hrtshivp1aX34w2B/ViKwX9bBF08vvs2vmajzoFhQFtU5YTgMo4BIzODsGxWxR1v
 3jmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Edurs2ybl3pjHq9Rj4aJF4VI4m7AdS23TQwX/ATEuMs=;
 b=sLTQPmLLf/6De4SlbVvnWFZNhFUohijaEcNdw3mu3Y7PrlCbX/x2QZTDajaMAvhF00
 6UVGiTk42Ui7XGf/CHhvtAVoB0992Mme7XFZxhzV4StrkS6fCdi79Kj6GafgYrA3yvhc
 Vp94tGCajLvb99P0DKzJYd1BjL7JhYRIMfF4c5Mmb7JeKqRgjJ1yxBOwZU4CyB7/aaLW
 uAGTdrpA9Z2JXSoDw+Ai3mduFanVsUBbVeHBL7kSKkuX0xMAA2QNq/cs97ziDI26pNoR
 QVjxS0/B1tPKk0cnrlbJ5ArSO7lKr3J5rRUfMHgmEcS4UvmuhiEoYaYF5dPaF2Vefz6p
 alGg==
X-Gm-Message-State: AOAM531Ly9vur+sGcoAJdugrZYMuzmS8g1g+lcyfCZfhlu+HK/sbnsz7
 wqTEA2Fmo5x1N7Ccd0XEH5GE3E4t/hlBujO/rgYyUg==
X-Google-Smtp-Source: ABdhPJwmVo3ZX2tZvaUOyRcmzXdZp5u0HNnfXUWfi85PtCdhVKUpMC75GgxyKLybaBy33rh9B6yS95asXWZwuUF8tX8=
X-Received: by 2002:aa7:9110:0:b0:4fa:e388:af57 with SMTP id
 16-20020aa79110000000b004fae388af57mr6017640pfh.1.1648740354503; Thu, 31 Mar
 2022 08:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220331151952.13221-1-marex@denx.de>
In-Reply-To: <20220331151952.13221-1-marex@denx.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 31 Mar 2022 17:25:42 +0200
Message-ID: <CAG3jFysW7kaCYE7QjdHB-7vqU-8LPZr708BGahNZ3qUV_bvZww@mail.gmail.com>
Subject: Re: [PATCH v6 00/11] drm/bridge: tc358767: Add DSI-to-DPI mode support
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Mar 2022 at 17:20, Marek Vasut <marex@denx.de> wrote:
>
> The TC358767/TC358867/TC9595 are all capable of operating in multiple
> modes, DPI-to-(e)DP, DSI-to-(e)DP, DSI-to-DPI. Clean up the driver,
> switch to atomic ops, and add support for the DSI-to-DPI mode in
> addition to already supported DPI-to-(e)DP mode.
>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> To: dri-devel@lists.freedesktop.org
>
> Marek Vasut (11):
>   dt-bindings: display: bridge: tc358867: Document DPI output support
>   dt-bindings: display: bridge: tc358867: Document DSI data-lanes
>     property
>   drm/bridge: tc358767: Change tc_ prefix to tc_edp_ for (e)DP specific
>     functions
>   drm/bridge: tc358767: Convert to atomic ops
>   drm/bridge: tc358767: Implement atomic_check callback
>   drm/bridge: tc358767: Move (e)DP bridge endpoint parsing into
>     dedicated function
>   drm/bridge: tc358767: Wrap (e)DP aux I2C registration into
>     tc_aux_link_setup()
>   drm/bridge: tc358767: Move bridge ops setup into
>     tc_probe_edp_bridge_endpoint()
>   drm/bridge: tc358767: Detect bridge mode from connected endpoints in
>     DT
>   drm/bridge: tc358767: Split tc_set_video_mode() into common and (e)DP
>     part
>   drm/bridge: tc358767: Add DSI-to-DPI mode support
>
>  .../display/bridge/toshiba,tc358767.yaml      |  22 +-
>  drivers/gpu/drm/bridge/Kconfig                |   1 +
>  drivers/gpu/drm/bridge/tc358767.c             | 583 +++++++++++++++---
>  3 files changed, 530 insertions(+), 76 deletions(-)
>
> --
> 2.35.1
>

Applied to drm-misc-next.
