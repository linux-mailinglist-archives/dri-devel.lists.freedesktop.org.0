Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DDD686324
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 10:51:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 793ED10E3E0;
	Wed,  1 Feb 2023 09:51:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4068810E3E0
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 09:51:24 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id j7so19001988vsl.11
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Feb 2023 01:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=J/VlM7cprC4lMoay4b4iDq0wmzylPk+HkhDJk/zhG2Y=;
 b=H3SQNrssQf8a9mTT6XChvo0/W1NYkCLCBXshDml7DWgkvDYxMHwm3SC1Spd2lhiXKz
 uqQse5Gqzkvx46gI2HD/aq6q60VRJ1LYYGzlhCIW/bsZ8DqRa32+jqSw1NSfiXJZMPku
 FTTzBF0TKGM6zy3JEmmFBiESFxzq9OuUtyPPZEE4oynJCKrWauGmBcn23ItXCkhqRcJ6
 f0JUMeeVAzoFk5xR5dqiDz7wzkc3F+25pY+GVDVxJF2vz3hWnvytxNQ/XaxCVx9gTTnU
 bulEHDn9yZzFvHsawWaSIa/q66TkSaCCPty63/w5PoFd6gfWMVKsv128YlaS6NIp1lCv
 gyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J/VlM7cprC4lMoay4b4iDq0wmzylPk+HkhDJk/zhG2Y=;
 b=mCBYpGamHA41OKPW3tOMRBoC2Ko+56ek2dANPaHU7UIGXz6M8LMsVK8FqX31bomx53
 HL0sLRGkP3913LI9ICk1AxVIIl2PmUa6poDXUKnqBJHe5kQD3Ta2hItHKbMx5bVmHISt
 XhJuq2dLxOYix9D5gNpatdtAz4to2wem3nCdd+CCzQXJsFjHuQZxowsnlQTzt7xnQR3z
 5yTwB+obqh/QJsXV+6/IOaOVnxzcFkI/PPO5vWSXPHvyoGbrc/JBCKen5J/S1Fia0y01
 4jUME1eyWv2kg+CuKgUKJDHmsutjgS2ZizXlaj+qCXw4dfOy6LFNItA1Y6PnlpvHWMf7
 KseA==
X-Gm-Message-State: AO0yUKV0qi47oWdIERG6deW462+UB0YHc2J2QzEYH3o3Jhzc5O8ApKDz
 8OHVeFPi9IGuucxZ5iOrFjAvs7gONI3z6KKS0R/cvg==
X-Google-Smtp-Source: AK7set86IzPhUo1uZ+cu7Tw/u3cqoDAPwj0LQna9LX1UbPlTaCnreZPgZXNal+QPDxwu/wJrvnP7JMh4zKK+BBpDqY8=
X-Received: by 2002:a05:6102:1609:b0:3ed:2cb7:5695 with SMTP id
 cu9-20020a056102160900b003ed2cb75695mr375015vsb.84.1675245083209; Wed, 01 Feb
 2023 01:51:23 -0800 (PST)
MIME-Version: 1.0
References: <20230131141756.RFT.v2.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
In-Reply-To: <20230131141756.RFT.v2.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 1 Feb 2023 09:51:06 +0000
Message-ID: <CAPY8ntAUhVB6UtQTeHAcxNW950Ou+NcEoGwk3JnVWLay89_0Nw@mail.gmail.com>
Subject: Re: [RFT PATCH v2 1/3] drm/bridge: tc358762: Set pre_enable_prev_first
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
Cc: Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 31 Jan 2023 at 22:22, Douglas Anderson <dianders@chromium.org> wrote:
>
> Set the "pre_enable_prev_first" as provided by commit 4fb912e5e190
> ("drm/bridge: Introduce pre_enable_prev_first to alter bridge init
> order"). This should allow us to revert commit ec7981e6c614
> ("drm/msm/dsi: don't powerup at modeset time for parade-ps8640") and
> commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
> time").

I see no reference in the TC358762 datasheet to requiring the DSI
interface to be in any particular state.
However, setting this flag does mean that the DSI host doesn't need to
power up and down for each host_transfer request from
tc358762_pre_enable/tc358762_init, so on that basis I'm good with it.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> (no changes since v1)
>
>  drivers/gpu/drm/bridge/tc358762.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
> index 0b6a28436885..77f7f7f54757 100644
> --- a/drivers/gpu/drm/bridge/tc358762.c
> +++ b/drivers/gpu/drm/bridge/tc358762.c
> @@ -229,6 +229,7 @@ static int tc358762_probe(struct mipi_dsi_device *dsi)
>         ctx->bridge.funcs = &tc358762_bridge_funcs;
>         ctx->bridge.type = DRM_MODE_CONNECTOR_DPI;
>         ctx->bridge.of_node = dev->of_node;
> +       ctx->bridge.pre_enable_prev_first = true;
>
>         drm_bridge_add(&ctx->bridge);
>
> --
> 2.39.1.456.gfc5497dd1b-goog
>
