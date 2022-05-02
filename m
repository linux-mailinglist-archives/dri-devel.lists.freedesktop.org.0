Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2345171B2
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 16:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B5F10EFF7;
	Mon,  2 May 2022 14:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DBB10EFF7
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 14:37:59 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id p8so12440659pfh.8
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 07:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=74bxgGuHU9jSk3+QuQXZKRvlg8V04rNVxn+TIhl3ghI=;
 b=US2i16G1FslRkGzUxXxBxn5PpAczH/bRPVsvbNYjBDpAbIud3dKvEm6qAcX8D/oZ5Z
 Tk9hvG3m4vnc71cxDEuZQRK/OOh4iXy1/kZVMLznQYGfhpbxBzLaTpJr7xzbcITYCPoR
 d+Qx9Lsf6E7YpfDfJwEzuvPwbx3SMTstl+zX30Yzd5dIFyfrgjAqTESfzPSnxoKc66Pw
 HYpEOptx+COAhLTNA1avuz+BaGoEm9EBzevRp4pdPJWXXZn1dLx6adODGE0pH46ilwUT
 k2Ush7C83FevsksKSoImxQFzDDSLTI0oI+vQAzXUD4dl+j++RxPC9LjzqYDQy2FMVMrR
 uAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=74bxgGuHU9jSk3+QuQXZKRvlg8V04rNVxn+TIhl3ghI=;
 b=inmEXhUUhxM2zXWW+HAJiLGM7zjbv/2e9gr0ZPzCqJNiHX7JL8X5XL8aEFbrvzD2MO
 QqHfUsyBSw9W0lSgey5Sfq0iABChVOVmOuKymjxhDsJWgg+DXRGA3DcdogE9y2+c7PAw
 ug0NWYLJK5QxSWMb0MZ0wFkUae5tqGduXU3SEQXF58LLcd2GFa9ZoXxjz0pmnRtuu6Ff
 3BpPpt8UJCjri+lU9qDIYeeZdrIU+yjftTVLoDA7Vzze/BmnHzu+X+u0x4ZWYEmZnS+h
 ZcMoPRBRwLucp16/Ru5SgCzmz79ma3K/r/YWPwLEIzULScOu2fbddOQnOT5AQYdZlfX3
 2/qQ==
X-Gm-Message-State: AOAM532IBsBzFl6b9di6xEHmYb9EmTnv+kch2+n306oLWt+tuiZ0TZgf
 wXI/u2ZlIR4V9+hPilpDsgYMVz/CKEQcDWU1t2mgTw==
X-Google-Smtp-Source: ABdhPJxO8+87e2lHNCFbPay2aHSBemsxX2KpF1wpvTcg1JbtYVs08QwN6sikfE7I6JCo0Vr2Ph9NRx2sMzw7tPml9ys=
X-Received: by 2002:a62:6d47:0:b0:4fe:15fa:301d with SMTP id
 i68-20020a626d47000000b004fe15fa301dmr11688627pfc.29.1651502278898; Mon, 02
 May 2022 07:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220425134424.1150965-1-treapking@chromium.org>
In-Reply-To: <20220425134424.1150965-1-treapking@chromium.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 2 May 2022 16:37:48 +0200
Message-ID: <CAG3jFys-qNAER4xVhbNqE9xbsjTMEbaBR291Kc1M1SKkH5oE1w@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: it6505: Send DPCD SET_POWER to downstream
To: Pin-Yen Lin <treapking@chromium.org>
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
 Andrzej Hajda <andrzej.hajda@intel.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 25 Apr 2022 at 15:44, Pin-Yen Lin <treapking@chromium.org> wrote:
>
> Send DPCD SET_POWER command to downstream in .atomic_disable to make the
> downstream monitor enter the power down mode, so the device suspend won't
> be affected.
>
> Fixes: b5c84a9edcd418 ("drm/bridge: add it6505 driver")
> Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> ---
>
>  drivers/gpu/drm/bridge/ite-it6505.c | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 8fed30df08b0..4b673c4792d7 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -737,8 +737,9 @@ static int it6505_drm_dp_link_probe(struct drm_dp_aux *aux,
>         return 0;
>  }
>
> -static int it6505_drm_dp_link_power_up(struct drm_dp_aux *aux,
> -                                      struct it6505_drm_dp_link *link)
> +static int it6505_drm_dp_link_set_power(struct drm_dp_aux *aux,
> +                                       struct it6505_drm_dp_link *link,
> +                                       u8 mode)
>  {
>         u8 value;
>         int err;
> @@ -752,18 +753,20 @@ static int it6505_drm_dp_link_power_up(struct drm_dp_aux *aux,
>                 return err;
>
>         value &= ~DP_SET_POWER_MASK;
> -       value |= DP_SET_POWER_D0;
> +       value |= mode;
>
>         err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
>         if (err < 0)
>                 return err;
>
> -       /*
> -        * According to the DP 1.1 specification, a "Sink Device must exit the
> -        * power saving state within 1 ms" (Section 2.5.3.1, Table 5-52, "Sink
> -        * Control Field" (register 0x600).
> -        */
> -       usleep_range(1000, 2000);
> +       if (mode == DP_SET_POWER_D0) {
> +               /*
> +                * According to the DP 1.1 specification, a "Sink Device must
> +                * exit the power saving state within 1 ms" (Section 2.5.3.1,
> +                * Table 5-52, "Sink Control Field" (register 0x600).
> +                */
> +               usleep_range(1000, 2000);
> +       }
>
>         return 0;
>  }
> @@ -2624,7 +2627,8 @@ static enum drm_connector_status it6505_detect(struct it6505 *it6505)
>         if (it6505_get_sink_hpd_status(it6505)) {
>                 it6505_aux_on(it6505);
>                 it6505_drm_dp_link_probe(&it6505->aux, &it6505->link);
> -               it6505_drm_dp_link_power_up(&it6505->aux, &it6505->link);
> +               it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
> +                                            DP_SET_POWER_D0);
>                 it6505->auto_train_retry = AUTO_TRAIN_RETRY;
>
>                 if (it6505->dpcd[0] == 0) {
> @@ -2960,8 +2964,11 @@ static void it6505_bridge_atomic_disable(struct drm_bridge *bridge,
>
>         DRM_DEV_DEBUG_DRIVER(dev, "start");
>
> -       if (it6505->powered)
> +       if (it6505->powered) {
>                 it6505_video_disable(it6505);
> +               it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
> +                                            DP_SET_POWER_D3);
> +       }
>  }
>
>  static enum drm_connector_status
> --
> 2.36.0.rc2.479.g8af0fa9b8e-goog
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>

Applied to drm-misc-next.
