Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2369E3EA960
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 19:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F94389256;
	Thu, 12 Aug 2021 17:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B4389256
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 17:22:29 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id 188so9408312ioa.8
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 10:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=shNhrzerEsE2zV1N+PkQAZcTS3bJIsjxwVv+ONT+kpc=;
 b=dthu5PluI8SIpcGHuz8JNqyfTKjTeq/PS3sko15q/c71jvM7uhnrzAmMOkoByfl71N
 SGjlDrMO8rYb/Kmzko0/UOldzVK7JeHMMSmwx3uxViyzeVS7PjaN25w0RmOHmBxMajfo
 kZLqVaYoQlmpVWITeDANdz+vB1B1iSCXQtLr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=shNhrzerEsE2zV1N+PkQAZcTS3bJIsjxwVv+ONT+kpc=;
 b=CqdaKmhjm+IqsboS0oKdBFy7b6RIyXACcwMhMyfTIFtgJZMeVaYjj8CGzFqKZQgDnh
 xlPKD3s+dF/xXLz/sWOEigEs/Lj+hBpR3z+q3eSiugIkqMYEh2fHYfybz6iBKHx52/Iq
 fCYq7WGqEdGe+svQ7/r213tCHGTCBg7/5YyBRBR2CpybxYTitZY1cL6VfQk6ddcp/erZ
 Xf5dBbvafwIFIF3k3Sz2VieWeCLXcHMHijgBPWWtKzx7upKgQz7ciKmJycQ7F4RjVwy2
 N4gO1aYF53U3oAl8yyrLaSVCn3TW9QKxeJVEFVkUv5iR+5Fa8A3GN6bpqM8gnU5lbpXG
 6GVw==
X-Gm-Message-State: AOAM533o4/TAcCzuNhiXsBa/C1l+pflMzen96SXztZVtHH4NM43eBm67
 h+SthgRt00h2Ck4grN4eA6Nyly4n8B111w==
X-Google-Smtp-Source: ABdhPJwP1DAQX6gm065ZhNwiC4FKBVdtsE/DT4qy/DxywfJA+bCt4qAwa0vY+LPN/yKPDVG+Qg/+8w==
X-Received: by 2002:a05:6638:3293:: with SMTP id
 f19mr4732902jav.20.1628788949048; 
 Thu, 12 Aug 2021 10:22:29 -0700 (PDT)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com.
 [209.85.166.48])
 by smtp.gmail.com with ESMTPSA id d18sm1938896ile.32.2021.08.12.10.22.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 10:22:28 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id r72so9431186iod.6
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 10:22:28 -0700 (PDT)
X-Received: by 2002:a05:6602:2159:: with SMTP id
 y25mr3762841ioy.61.1628788948245; 
 Thu, 12 Aug 2021 10:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210811235253.924867-1-robdclark@gmail.com>
 <20210811235253.924867-5-robdclark@gmail.com>
In-Reply-To: <20210811235253.924867-5-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Aug 2021 10:22:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V_bE0MfHDZn=u98UZ1eDw7vQXMpG=btwW6XGGqCF4brw@mail.gmail.com>
Message-ID: <CAD=FV=V_bE0MfHDZn=u98UZ1eDw7vQXMpG=btwW6XGGqCF4brw@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/bridge: ti-sn65dsi86: Add NO_CONNECTOR support
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Stephen Boyd <swboyd@chromium.org>, 
 Rob Clark <robdclark@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 open list <linux-kernel@vger.kernel.org>
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

Hi,

On Wed, Aug 11, 2021 at 4:51 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Slightly awkward to fish out the display_info when we aren't creating
> own connector.  But I don't see an obvious better way.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 34 +++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 38dcc49eccaf..dc8112bab3d3 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -693,9 +693,11 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>                 return ret;
>         }
>
> -       ret = ti_sn_bridge_connector_init(pdata);
> -       if (ret < 0)
> -               goto err_conn_init;
> +       if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> +               ret = ti_sn_bridge_connector_init(pdata);
> +               if (ret < 0)
> +                       goto err_conn_init;
> +       }
>
>         /*
>          * TODO: ideally finding host resource and dsi dev registration needs
> @@ -757,7 +759,8 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>  err_dsi_attach:
>         mipi_dsi_device_unregister(dsi);
>  err_dsi_host:
> -       drm_connector_cleanup(&pdata->connector);
> +       if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
> +               drm_connector_cleanup(&pdata->connector);
>  err_conn_init:
>         drm_dp_aux_unregister(&pdata->aux);
>         return ret;
> @@ -806,9 +809,30 @@ static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
>         regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
>  }
>
> +/*
> + * Find the connector and fish out the bpc from display_info.  It would
> + * be nice if we could get this instead from drm_bridge_state, but that
> + * doesn't yet appear to be the case.
> + */
>  static unsigned int ti_sn_bridge_get_bpp(struct ti_sn65dsi86 *pdata)
>  {
> -       if (pdata->connector.display_info.bpc <= 6)
> +       struct drm_bridge *bridge = &pdata->bridge;
> +       struct drm_connector_list_iter conn_iter;
> +       struct drm_connector *connector;
> +       unsigned bpc = 0;
> +
> +       drm_connector_list_iter_begin(bridge->dev, &conn_iter);
> +       drm_for_each_connector_iter(connector, &conn_iter) {
> +               if (drm_connector_has_possible_encoder(connector, bridge->encoder)) {
> +                       bpc = connector->display_info.bpc;
> +                       break;
> +               }
> +       }
> +       drm_connector_list_iter_end(&conn_iter);

This looks reasonable to me. I'll plan to apply it to drm-misc-next
sometime next week to give Laurent a chance to comment on whether this
causes any problems with his planned support for full DP using this
bridge chip. IIUC that means it'll hit mainline 1 rev later, but as
per IRC comments this should be fine.

Reviewed-by: Douglas Anderson <dianders@chromium.org>


-Doug
