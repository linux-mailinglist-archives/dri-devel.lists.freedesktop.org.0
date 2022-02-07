Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA47A4ACBF4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 23:20:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A931C10E2DD;
	Mon,  7 Feb 2022 22:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 169EC10E2DD
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 22:20:12 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id w7so18834290ioj.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 14:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EtYr7Jj5sq3xwAnYOv4FQ5TLaTA8GY9tiLCw/rUQmTQ=;
 b=hpVslQLujvrgisfxQ5oyFRgRdbqLXuAYB7FboE1snn29lmRfW42y0MAxo2ZbpMiYW+
 ZavwZ9yegnD2p8/BwLY+2JkUELPfglHbf6CoR4nu8W3RE8xJVSuFzX51jUdk+qfTw/Fp
 xJwvaA+vzzCEIjs0wnGp+B15cKwmS+YuXLQwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EtYr7Jj5sq3xwAnYOv4FQ5TLaTA8GY9tiLCw/rUQmTQ=;
 b=XA2l2yEHn6gYlbuiPVdYxoWEPbET37upAh+p+UnZkPG5nyehVj2pzyN8Ue6XS3wnDS
 EOgzK8+p1xTV0TiUydt20dARKg67rgKFJHH756DS79ukzNCVQqth7BpU2NeClGj1yvtC
 iV8chmMdSFxbcC22EEPzahRhewbToq0LCCDYhIXsc0O/A7Ia43JgEl+nK64TIwDPG2Z1
 kEO7aYWDwWAi9d2TOMkd/oPISwMWaVR4Njwcu0jx0k68rDfyxlDsJ/OVfQC0Mtlnecns
 y+IdANqbBFArvvEQOec6z5zzmUuqeVcZOHv9jFFhHHNYRASQ1IvYbu2T3eNa7yn/QB49
 WTdg==
X-Gm-Message-State: AOAM532GS91RpRzs/NxMG1SFsSbLYtHfInJin9PduK8wfUoNh/R6OY2N
 D3DxmRWfvQawHN0WmL3Nqg0aEL6cWnVm+g==
X-Google-Smtp-Source: ABdhPJwOLOvPNYM4uMpRimMjk9YiFcvnEWHw1M35uFA/gseCATAVZUnzHK+9mJh5qPia1Xckk0xSKA==
X-Received: by 2002:a02:93cb:: with SMTP id z69mr855747jah.116.1644272411231; 
 Mon, 07 Feb 2022 14:20:11 -0800 (PST)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com.
 [209.85.166.181])
 by smtp.gmail.com with ESMTPSA id c13sm2428817ilq.50.2022.02.07.14.20.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 14:20:09 -0800 (PST)
Received: by mail-il1-f181.google.com with SMTP id z4so12383491ilz.4
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 14:20:09 -0800 (PST)
X-Received: by 2002:a92:d648:: with SMTP id x8mr754373ilp.142.1644272409096;
 Mon, 07 Feb 2022 14:20:09 -0800 (PST)
MIME-Version: 1.0
References: <20220206154405.1243333-1-sam@ravnborg.org>
 <20220206154405.1243333-2-sam@ravnborg.org>
In-Reply-To: <20220206154405.1243333-2-sam@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 7 Feb 2022 14:19:56 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WrhWCGrr5gegtFGShPeTNhsOo43=N7FydpRvAuHFDDmw@mail.gmail.com>
Message-ID: <CAD=FV=WrhWCGrr5gegtFGShPeTNhsOo43=N7FydpRvAuHFDDmw@mail.gmail.com>
Subject: Re: [PATCH v1 1/9] drm/bridge: add DRM_BRIDGE_STATE_OPS macro
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Philip Chen <philipchen@chromium.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Feb 6, 2022 at 7:44 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> The DRM_BRIDGE_STATE_OPS can be used as shortcut for bridge drivers that
> do not subclass drm_bridge_state to assign the default operations for
> reset, duplicate and destroy of the state.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  include/drm/drm_bridge.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 061d87313fac..fc00304be643 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -935,4 +935,16 @@ static inline struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
>  }
>  #endif
>
> +/**
> + * DRM_BRIDGE_STATE_OPS - Default drm_bridge state funcs
> + *
> + * Bridge driver that do not subclass &drm_bridge_state can use the helpers
> + * for reset, duplicate, and destroy. This macro provides a shortcut for
> + * setting the helpers in the &drm_bridge_funcs structure.
> + */
> +#define DRM_BRIDGE_STATE_OPS \
> +       .atomic_reset = drm_atomic_helper_bridge_reset,                         \
> +       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,     \
> +       .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state

Reviewed-by: Douglas Anderson <dianders@chromium.org>
