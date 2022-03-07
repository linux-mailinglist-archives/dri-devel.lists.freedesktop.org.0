Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFED4D07F9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 20:52:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3EBE10E147;
	Mon,  7 Mar 2022 19:52:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D16410E147
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 19:52:23 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id hw13so34248015ejc.9
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 11:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SLhnZ7fcJxcYqZ1fq0jluBmo+axHuvOeflUJPS9b+ZI=;
 b=RTexsYkgBQ6u0VMOpTBAYhcV6TBvMux5Z4pN7bJxYj3MpE9uYXper5vCsQML8pT54a
 ArpMG0CK+jFdRuBR4IPKHKZPbb3cODzxjNbfslwd8aWwv805kL/Nwo87LjWH/34RwX8G
 zDtYlTVGT75OAnERWp7RDN3khBcjZzrz2iCo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SLhnZ7fcJxcYqZ1fq0jluBmo+axHuvOeflUJPS9b+ZI=;
 b=dAax4LuBLNp9BlpmMQAjbdXyr+JS68EIXZv/rAwZScnoWvbxxcLuR/q8gSOwmTdoEN
 RGMkWuSUwnN48xGLXJ0XmwoMw13TMhYtixT96qDpks1pV0KM6xaS6Srnvsiufb0Hu20e
 vKdpaXIfoRelJEhBsWCoRkraFVepG4j8PDQzIerK0nGdbTUOIat9GxvEkDsP4i9lepJ2
 Ih0fXuUxf+WoKNEBa1E5HOxVHzaj2vH5f8JCGbcG6p8NcEHhYsaJAqliFGl4RIViyErV
 0b43ruQ4Qy184H99B1PUridOKMVGXLyU8c3141OxCywgC2ML4EtXijGEKROiPJNUX5TI
 A/jQ==
X-Gm-Message-State: AOAM53311KhURQDydn6e5TYujqhCzwJVKmgXAsWf41ZkA58YTsH967NZ
 pmDRzrH78UXzL7UymWLSOkSrTOkMMIPfVw==
X-Google-Smtp-Source: ABdhPJwskk/bjZPtGz4abeNNK7aQHAqNjiw+z//4pRIVNmRuBBLIEZR7C2NYfRxRndfYEEsccXboIQ==
X-Received: by 2002:a17:906:fc10:b0:6cd:84e:7248 with SMTP id
 ov16-20020a170906fc1000b006cd084e7248mr10617131ejb.281.1646682741680; 
 Mon, 07 Mar 2022 11:52:21 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45]) by smtp.gmail.com with ESMTPSA id
 d1-20020a17090694c100b006da91d57e93sm4990940ejy.207.2022.03.07.11.52.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 11:52:21 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so101555wmb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 11:52:20 -0800 (PST)
X-Received: by 2002:a05:600c:1d08:b0:381:6eda:67d1 with SMTP id
 l8-20020a05600c1d0800b003816eda67d1mr498335wms.88.1646682740331; Mon, 07 Mar
 2022 11:52:20 -0800 (PST)
MIME-Version: 1.0
References: <20220307175955.363057-1-kieran.bingham+renesas@ideasonboard.com>
 <20220307175955.363057-2-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20220307175955.363057-2-kieran.bingham+renesas@ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 7 Mar 2022 11:52:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VAwCzQvCPzAOk9i8u7-pfbO3cGVa8nqj6V1eQc8mRwFA@mail.gmail.com>
Message-ID: <CAD=FV=VAwCzQvCPzAOk9i8u7-pfbO3cGVa8nqj6V1eQc8mRwFA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/bridge: ti-sn65dsi86: Implement bridge
 connector operations
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Mar 7, 2022 at 10:00 AM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
>
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Implement the bridge connector-related .get_edid() operation, and report
> the related bridge capabilities and type.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> Changes since v1:
>
> - The connector .get_modes() operation doesn't rely on EDID anymore,
>   __ti_sn_bridge_get_edid() and ti_sn_bridge_get_edid() got merged
>   together
>
> Notes from Kieran:
>
> RB Tags collected from:
>  https://lore.kernel.org/all/20210322030128.2283-9-laurent.pinchart+renesas@ideasonboard.com/
>
> However this was over a year ago, so let me know if other patches now
> superceed this one or otherwise invalidate this update.
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index c55848588123..ffb6c04f6c46 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1154,6 +1154,19 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
>         pm_runtime_put_sync(pdata->dev);
>  }
>
> +static struct edid *ti_sn_bridge_get_edid(struct drm_bridge *bridge,
> +                                         struct drm_connector *connector)
> +{
> +       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> +       struct edid *edid;
> +
> +       pm_runtime_get_sync(pdata->dev);
> +       edid = drm_get_edid(connector, &pdata->aux.ddc);
> +       pm_runtime_put_autosuspend(pdata->dev);
> +
> +       return edid;
> +}
> +
>  static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
>         .attach = ti_sn_bridge_attach,
>         .detach = ti_sn_bridge_detach,
> @@ -1162,6 +1175,7 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
>         .enable = ti_sn_bridge_enable,
>         .disable = ti_sn_bridge_disable,
>         .post_disable = ti_sn_bridge_post_disable,
> +       .get_edid = ti_sn_bridge_get_edid,
>  };
>
>  static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
> @@ -1248,6 +1262,8 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
>
>         pdata->bridge.funcs = &ti_sn_bridge_funcs;
>         pdata->bridge.of_node = np;
> +       pdata->bridge.ops = DRM_BRIDGE_OP_EDID;
> +       pdata->bridge.type = DRM_MODE_CONNECTOR_eDP;

This doesn't look right to me. In the eDP case the EDID reading is
driven by the panel.

-Doug
