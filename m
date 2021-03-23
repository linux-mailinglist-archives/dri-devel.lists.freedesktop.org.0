Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 280FB345860
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 08:14:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC38A6E833;
	Tue, 23 Mar 2021 07:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F325E6E833
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 07:14:06 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id h3so13346412pfr.12
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 00:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=fYWO1UsVoh/R8XZE64RM/Jl8z5zWy63u5I7GZoSU3SQ=;
 b=Xo69Mt6/kL/aCKLvYa4Fwr/j/tKHmX3zlRj4mQ3UYyxt4TqESg+DiZQnhQRNho9iLu
 fndUjnKmf/vMdACOm13Pfy6MjDrsvVWzg8vDSZRIP26TGx6oNw3kzcRJL8lJXA2rZPFz
 VTrXDP9Vdje6a6md8xr1UxBXIy7JKO+7oGkgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=fYWO1UsVoh/R8XZE64RM/Jl8z5zWy63u5I7GZoSU3SQ=;
 b=LyC3IhNvuFICwRk1VgE1wIqPiyfp6D6vyv2koLllDsz0ahSe8XHqC0filnIZ5HxvwO
 lH+jBlzvVugQ+D3rTA9In6w2VWDHTJgNLuc4nN2Al6oyFQPLMxfC5W07+BjF32rEzOu6
 IQNsa5snd+xF/kRLYJI4pckr9HCI1Xg7W7d2e8Oer+w/zD+3Haa35JTIT5faBjQfZSc+
 Z6QRRD1Vg0KC3Pn6BUWpSMYY8ggAOHfQQ8o0YJijL8u35WLpY8Ruj5nJbCLr44PjyHbc
 gG4yilucGJOb1W9ozumPDs0ZeQExb9Z13qIJm3nABxcXSFneQrSoDnXo3h+iLI7Wjm8u
 fYZA==
X-Gm-Message-State: AOAM530yB1GUjU8EODOfrMF3DsCS+sxTtWem/C+fKsYZwZXbA1Ec71BJ
 i0ykS0d2gycDcK2yMEty4zvzSQ==
X-Google-Smtp-Source: ABdhPJw9WwH3T40f83xyLQqcJ7XwWyC7xDQSJ3yvrXZrrL8RcVUYTZujJS7eHt23lV3STFi5M+ZCBQ==
X-Received: by 2002:a17:902:7fc8:b029:e4:32af:32da with SMTP id
 t8-20020a1709027fc8b02900e432af32damr4224131plb.24.1616483646679; 
 Tue, 23 Mar 2021 00:14:06 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e90d:d453:87ae:2e10])
 by smtp.gmail.com with ESMTPSA id o19sm3550978pgh.62.2021.03.23.00.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 00:14:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20210322030128.2283-6-laurent.pinchart+renesas@ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-6-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [RFC PATCH 05/11] drm/bridge: ti-sn65dsi86: Wrap panel with
 panel-bridge
From: Stephen Boyd <swboyd@chromium.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Date: Tue, 23 Mar 2021 00:14:04 -0700
Message-ID: <161648364484.3012082.8827104507556270267@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Laurent Pinchart (2021-03-21 20:01:22)
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 1d1be791d5ba..c21a7f7d452b 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -418,8 +420,18 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>         }
>         pdata->dsi = dsi;
>  
> +       /* Attach the next bridge */
> +       ret = drm_bridge_attach(bridge->encoder, pdata->next_bridge,
> +                               &pdata->bridge, flags);
> +       if (ret < 0) {
> +               DRM_ERROR("failed to attach next bridge\n");

Can this be pushed into drm_bridge_attach() instead of in each caller?

> +               goto err_dsi_detach;
> +       }
> +
>         return 0;
>  
> +err_dsi_detach:
> +       mipi_dsi_detach(dsi);
>  err_dsi_attach:
>         mipi_dsi_device_unregister(dsi);
>  err_dsi_host:
>  static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
> @@ -1245,6 +1249,14 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
>                 return ret;
>         }
>  
> +       pdata->next_bridge = devm_drm_panel_bridge_add(pdata->dev,
> +                                                      pdata->panel);
> +       if (IS_ERR(pdata->next_bridge)) {
> +               DRM_ERROR("failed to create panel bridge\n");
> +               ret = PTR_ERR(pdata->next_bridge);
> +               return ret;

Just return PTR_ERR(pdata->next_bridge)?

> +       }
> +
>         dev_set_drvdata(&client->dev, pdata);
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
