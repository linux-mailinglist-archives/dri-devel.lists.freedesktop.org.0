Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D0B3DA278
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 13:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A686E25A;
	Thu, 29 Jul 2021 11:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C944D6E25A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 11:48:46 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 m10-20020a17090a34cab0290176b52c60ddso8807497pjf.4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 04:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vxhHsDrYpm2kI+mPYAlWy7FpBAReDvQpjfpTvihE1ZE=;
 b=XQRdVrXr9ifqpbu6q9ewzE9YUmb4YMlVLGs9JHdGfMbmKe4kAYHSv4WY20+0qdxfGm
 5BRybZX5w7SbfyvL9iAXSPOh+xRz8VcvSemDzrTqs4EYxxlH1Eyy7MYcKqSFAWUcrANW
 iCFxE6oY/wFgElEjL5ktNZGFCcUNqiWgxMdKfhmiVshMAGlHBWppJ0DsRjBLnNKMr0qi
 osBMKIoO2gsGMbqJSgLmJHcoHZnWU/xvWKoPelN7JheEAJoSsQG8hGpE3X5LyqjG0cgT
 n8MTJSIDHwUhsK7k+/z9x1Kx2RmeM+/xweoby9TWdXrHItl342LoXyD+wooRp4gOpf+1
 MCKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vxhHsDrYpm2kI+mPYAlWy7FpBAReDvQpjfpTvihE1ZE=;
 b=BgyWVkVC4ZVY7HHFcxt2Uea19SIuBqcJQoovZCEGoJL62/Yr9tmRkLwZ3sBtAg5tbZ
 eQI0uS13cURDyvCm14Q40h8/s9NSTkE+TrneeUtSorvsJrAx4jeKHxgf07vqNemQVgIJ
 QK67+bTLN4PJpNPiHAg730Q590ZLwhYbj311IHcmPgjE2fP1oxwjqrA5c59ObeUNWs7e
 utJCAWLxFVd1d9EQK6hvlowGIeHvYGLLzffzQXxQr1/TgaxRtriblH2G7bYQYBKgANkG
 XlJI5hS+BkzDgy1GvZ1fSMDZHn1bJ5uacCfadhwT01Aq6iq7VoxbWwid4KaGS4R/HwKl
 jckQ==
X-Gm-Message-State: AOAM532h3qqWcLe26jg1Nqutx+/AWf1hBoxbZRKjD6eWWxg22CRV/A1O
 0chE8YHqSYc8UM1O49tVdxTt13pcSgPKoWsEH+KLLQ==
X-Google-Smtp-Source: ABdhPJzmjmbRLZHOYGw8ZKDBP8QSe9qxWf7f2rEWUiJPz48ENWI7qEJjpdwkxa7mxaox1V0XGFReV7579lL4tNxFtQs=
X-Received: by 2002:a17:902:da8a:b029:12c:4261:a2d6 with SMTP id
 j10-20020a170902da8ab029012c4261a2d6mr4372829plx.50.1627559326287; Thu, 29
 Jul 2021 04:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210728164557.1882787-1-dianders@chromium.org>
 <20210728094511.3.I842d483139531aa4651da8338512fdf0171ff23c@changeid>
In-Reply-To: <20210728094511.3.I842d483139531aa4651da8338512fdf0171ff23c@changeid>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 29 Jul 2021 13:48:35 +0200
Message-ID: <CAG3jFyvwTY8azFVcHnSwgSe++ZNEfMvhbgROsLhpY00hwg5ikA@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/bridge: ti-sn65dsi86: Add some 100 us delays
To: Douglas Anderson <dianders@chromium.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, MSM <linux-arm-msm@vger.kernel.org>,
 Steev Klimaszewski <steev@kali.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 rajeevny@codeaurora.org, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Doug,

Thanks for submitting this.

On Wed, 28 Jul 2021 at 18:46, Douglas Anderson <dianders@chromium.org> wrote:
>
> The manual has always said that we need 100 us delays in a few
> places. Though it hasn't seemed to be a big deal to skip these, let's
> add them in case it makes something happier.
>
> NOTE: this fixes no known issues but it seems good to make it right.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 5e932070a1c3..cd0fccdd8dfd 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -307,6 +307,9 @@ static int __maybe_unused ti_sn65dsi86_resume(struct device *dev)
>                 return ret;
>         }
>
> +       /* td2: min 100 us after regulators before enabling the GPIO */
> +       usleep_range(100, 110);
> +
>         gpiod_set_value(pdata->enable_gpio, 1);
>
>         /*
> @@ -1096,6 +1099,9 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
>
>         if (!pdata->refclk)
>                 ti_sn65dsi86_enable_comms(pdata);
> +
> +       /* td7: min 100 us after enable before DSI data */
> +       usleep_range(100, 110);
>  }
>
>  static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
> --
> 2.32.0.432.gabb21c7263-goog
>

Acked-by: Robert Foss <robert.foss@linaro.org>
