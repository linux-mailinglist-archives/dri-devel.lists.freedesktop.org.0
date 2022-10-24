Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CB0609BD7
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 09:54:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E6510E2C0;
	Mon, 24 Oct 2022 07:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D3A10E2C0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 07:54:12 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id e18so28088130edj.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 00:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=np2MboBXPdpCjk4yE/v8jv8Cr7DEE4vCXR9aVi6NMuQ=;
 b=CMfk1o4OzpbnoEvbhSyBTJsc/lrFji4JSwldqbnj0/xw470NWf7R+wmCYUepa+ANkJ
 5CeKo+mBrV14/fFMP8oBwYEsPOFmx0WtYZpdB4J3MFuHO2oyRtloK7Z7tkh/cC1UdlpZ
 c7a6zfTprLyLbJmyuI5W0tu6AGhJtfxkY6J3ihr1hhZq4NUoHfG0jKZPbqLU2/mFLCog
 c8nfgJncBPWcxcmDo0iowNsBIaBfTau0X7FrfJ/uM8g0rNHwu5NxkETe2Hj/euYNdwaU
 t7iXge1x2pLZqxc29oeANjgRIAa7iPWvIBDoRUqShLblruOgKxIodgqvYcacLKeIg/hN
 0wmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=np2MboBXPdpCjk4yE/v8jv8Cr7DEE4vCXR9aVi6NMuQ=;
 b=711Wj5lQkatLTfzdpsj4TCziibOwR5ycmSluKVISX6lFR36n4humLrsCJNYWHRwwWy
 OSAbKOIHzE8sFKXn/RATsYLK7WpSpWZ4trjRXD8tNCpfWXLWj1LvlSUurM8C8D/V3ni4
 LC6XdRlrcw6BdK2e9lpkcvzQc9ZwN42h1QWSVCOzmYiPu05/6VMJIsx25ebf6VBImue4
 LaCxgk4tFDFlOhXF7bHjoMzIvVVJXC9UsixjqRDGK+PjX3KYuv3rVo2TQM6jXfZaAI0L
 gN+Sj248z4PYjEaC9qyg/erLInvyqjf6asMLmWbiZDmjDXrn9A8BhZnlZDDWjdf4VCuM
 H++g==
X-Gm-Message-State: ACrzQf1GMh9oxwImzUgg0VT9xJ2+49urGM+w5YQPewJfPMtX/xIqrpyW
 nT6dopybR5fVYi8zPQk/FqlCHqB6oWFjwWrawOsFiQ==
X-Google-Smtp-Source: AMsMyM5RUZsUyR2VAgEGNQhyqaYgUWUOzkKTKiVhONd3/DbV5cnoVhbDHvfQmdSFYJzw5VqN16sbZw1Hkcd5ncPmz8k=
X-Received: by 2002:aa7:c792:0:b0:453:98b7:213c with SMTP id
 n18-20020aa7c792000000b0045398b7213cmr29135252eds.159.1666598050510; Mon, 24
 Oct 2022 00:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <20221013110411.1674359-1-treapking@chromium.org>
 <20221013110411.1674359-2-treapking@chromium.org>
In-Reply-To: <20221013110411.1674359-2-treapking@chromium.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 24 Oct 2022 09:53:59 +0200
Message-ID: <CAG3jFyusEzjGN5qmXXfQSpYoPudOGTXHsOpucqbVhN0Zr9nBbw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/bridge: it6505: Initialize AUX channel in
 it6505_i2c_probe
To: Pin-yen Lin <treapking@chromium.org>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Allen Chen <allen.chen@ite.com.tw>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Hermes Wu <hermes.wu@ite.com.tw>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 13 Oct 2022 at 13:04, Pin-yen Lin <treapking@chromium.org> wrote:
>
> During device boot, the HPD interrupt could be triggered before the DRM
> subsystem registers it6505 as a DRM bridge. In such cases, the driver
> tries to access AUX channel and causes NULL pointer dereference.
> Initializing the AUX channel earlier to prevent such error.
>
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
>
> (no changes since v1)
>
>  drivers/gpu/drm/bridge/ite-it6505.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index a4302492cf8d..f7f6c3e20fae 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -2871,10 +2871,7 @@ static int it6505_bridge_attach(struct drm_bridge *bridge,
>         }
>
>         /* Register aux channel */
> -       it6505->aux.name = "DP-AUX";
> -       it6505->aux.dev = dev;
>         it6505->aux.drm_dev = bridge->dev;
> -       it6505->aux.transfer = it6505_aux_transfer;
>
>         ret = drm_dp_aux_register(&it6505->aux);
>
> @@ -3354,6 +3351,11 @@ static int it6505_i2c_probe(struct i2c_client *client,
>         debugfs_init(it6505);
>         pm_runtime_enable(dev);
>
> +       it6505->aux.name = "DP-AUX";
> +       it6505->aux.dev = dev;
> +       it6505->aux.transfer = it6505_aux_transfer;
> +       drm_dp_aux_init(&it6505->aux);
> +
>         it6505->bridge.funcs = &it6505_bridge_funcs;
>         it6505->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
>         it6505->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
> --
> 2.38.0.rc1.362.ged0d419d3c-goog
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
