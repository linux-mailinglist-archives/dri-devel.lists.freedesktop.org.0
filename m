Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E3B5A5DD7
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 10:15:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6000810EBB5;
	Tue, 30 Aug 2022 08:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7BB810EBB5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 08:15:34 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id og21so20546974ejc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 01:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=s+gdl9H5n8j4hKv3w97SJ726qTudg1e81QWIUDUaB48=;
 b=pNqWd8jFVhhrMDvbwttW3wGMsTlmWu5+Q3CZG0rQLkWDO2fqB/7QUzz0Jp6Lv4TF7p
 MfaN1jd5T8UBxVpJMjaScALQPXXksv7qJo4Unz1ZDS7fG6NdGsBmq47t1c6ZbJQTiPo2
 ZX1nx7beoEhFLn5QI3x4is034HNKHwEuiqW0+vNEDKHUeLJNYlCJJm0v7udvPBAK60eJ
 TQG0qGHkFDIbBW9Nn8eQg0H7LLCWDw7B2z6SpF5Ph5OPA16fL/HEa4mt3eu8WNUvOJxG
 /mnusbaU0Bh32ixzvGu7DbDwomf4nh0fE/f1QHJj/8QmfrSTNLyNHXtjJ1srRHMfd4nS
 FDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=s+gdl9H5n8j4hKv3w97SJ726qTudg1e81QWIUDUaB48=;
 b=gV5mBygQat+SQYOPDeNaNcOFSEfO3YkoECXSN7WZH4Q9VozZls8cUUoulfmY8EAOjO
 mMQZLybkd5nJKkEjlQdP46g793e402aIvpypBnbFNxZ72L8jbbfPPezmzR9k9E9UpShf
 Ev+rqtLR1a3rXtyFWuvL3DzId66wd9m+obXA62Jyi9y0MM+q/rUsRJQr4RhHHUArCwII
 BF57zU4DcEsEGA6NACoOX6QTFOxgpwPl4zNikL4LzV6G65Wgv71WRtxFF9bMKp3CYwZT
 +C87yKy9LhMWE3bS0o6f4qAtk61xv+TkNtXI8dbZfOI+FTq0Ektc0WuvMScgOb+nV4pw
 hNkg==
X-Gm-Message-State: ACgBeo05zUPcGRh66lY6pAiGbZY/xsgUVyuYZcHjJRca8HMXP7RPgMAY
 vYB89hDYCzmIpUrXIo2xrtwTLE7PvUcWaL0DMMUKfg==
X-Google-Smtp-Source: AA6agR7c/Yn6ztwSwjOFO/3EFw4sNtHKHsxhBfWJr74L8Ao8x8881pMcSw1YmFEJRpnxwLgiv4Xl5r5p3ger0qeh6Kk=
X-Received: by 2002:a17:907:7d91:b0:731:7ecb:1e5b with SMTP id
 oz17-20020a1709077d9100b007317ecb1e5bmr16189024ejc.78.1661847333431; Tue, 30
 Aug 2022 01:15:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220830045756.1655954-1-treapking@chromium.org>
In-Reply-To: <20220830045756.1655954-1-treapking@chromium.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 30 Aug 2022 10:15:21 +0200
Message-ID: <CAG3jFysagrW_SKFmO1CEbwpOQhCmWGSVgghvEQcFgfPSdaFv0w@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: it6505: Fix the order of DP_SET_POWER
 commands
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
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Hsin-Yi Wang <hsinyi@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 30 Aug 2022 at 06:58, Pin-yen Lin <treapking@chromium.org> wrote:
>
> Send DP_SET_POWER_D3 command to the downstream before stopping DP, so the
> suspend process will not be interrupted by the HPD interrupt. Also modify
> the order in .atomic_enable callback to make the callbacks symmetric.
>
> Fixes: 46ca7da7f1e8 ("drm/bridge: it6505: Send DPCD SET_POWER to downstream")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> ---
>
> Changes in v2:
> - Correct "fixes" tag.
> - Collect "Reviewed-by" tag.
>
>  drivers/gpu/drm/bridge/ite-it6505.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index f9251ec49bf0..2bb957cffd94 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -2951,9 +2951,6 @@ static void it6505_bridge_atomic_enable(struct drm_bridge *bridge,
>         if (ret)
>                 dev_err(dev, "Failed to setup AVI infoframe: %d", ret);
>
> -       it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
> -                                    DP_SET_POWER_D0);
> -
>         it6505_update_video_parameter(it6505, mode);
>
>         ret = it6505_send_video_infoframe(it6505, &frame);
> @@ -2963,6 +2960,9 @@ static void it6505_bridge_atomic_enable(struct drm_bridge *bridge,
>
>         it6505_int_mask_enable(it6505);
>         it6505_video_reset(it6505);
> +
> +       it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
> +                                    DP_SET_POWER_D0);
>  }
>
>  static void it6505_bridge_atomic_disable(struct drm_bridge *bridge,
> @@ -2974,9 +2974,9 @@ static void it6505_bridge_atomic_disable(struct drm_bridge *bridge,
>         DRM_DEV_DEBUG_DRIVER(dev, "start");
>
>         if (it6505->powered) {
> -               it6505_video_disable(it6505);
>                 it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
>                                              DP_SET_POWER_D3);
> +               it6505_video_disable(it6505);
>         }
>  }
>
> --
> 2.37.2.672.g94769d06f0-goog
>

Applied to drm-misc-next.
