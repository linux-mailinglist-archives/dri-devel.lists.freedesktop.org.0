Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E19F3484D8
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 23:46:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6810A6EAA7;
	Wed, 24 Mar 2021 22:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CF36EAA7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 22:46:41 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id s2so321290qtx.10
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vXm7c9BC1Iwf8wNKP3RctSCWQluCcE+3yvxP3P18/PY=;
 b=RbXEwuTTAG125sZM23dAkqMoDE3mi7AnoEM7poj8yZ0c6k5NAh5uG/ls/WKDasGUj1
 yP2r7KdX4A/0gsgF3nauoJ3xx6gIC/JfbNP+zEvGK3RgakiCjORs1gsieksWb//wXpLM
 n7UuTcsvKuDXTfm7kJMLYq/BdgjFxUApBbQJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vXm7c9BC1Iwf8wNKP3RctSCWQluCcE+3yvxP3P18/PY=;
 b=fxwWVhsLDnfZzYHQyZ7a5g+tAXTbY22ZNyW9XfkVhCCNHrQd1jE1nTIoIToxPEUQw9
 5EHEyeIDknVji7A8EPw5MVJkWBoYmB2+KKmUBtQQAo7n2VufSG0Z5x/gG7ttNPISMiuj
 X+Fai4FQQ4pr/TLHWfNuxeJf6UDCG+5SC1H0JiE2vUF6kJ3Tp7bv1dAKHfRYSPxptuxL
 VvotTEEpvHBwmN/HjJrEwRSllSSQCifslrs0qEP07smbZg2/pnaJVUfcDP6IBzPwEuxe
 UOmhbau9BxnrYrec0+/JWHfFGN4mSnRu8HRUSEBwkNiw6wqyzCbLTrc+MXoQz0htdeGf
 m9jA==
X-Gm-Message-State: AOAM531AjLjrpBho9XKS0Sp2HAHDssK78rezF/Vxlzfb1i+N1W0sgskN
 8FmK01g2G3uJuVPE9IpZA2zMY61VSVKcCQ==
X-Google-Smtp-Source: ABdhPJw/HiJuJAgmtkcNSzDVFcoi/ubl3shaAuDPTPAjthbzHlRWiJ9XD04GsdpLtQh9fV1MCyNfjQ==
X-Received: by 2002:ac8:702:: with SMTP id g2mr5234740qth.215.1616626000186;
 Wed, 24 Mar 2021 15:46:40 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180])
 by smtp.gmail.com with ESMTPSA id s6sm2827156qke.44.2021.03.24.15.46.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 15:46:39 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id m132so303586ybf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:46:39 -0700 (PDT)
X-Received: by 2002:a25:2f4b:: with SMTP id v72mr7835505ybv.79.1616625999188; 
 Wed, 24 Mar 2021 15:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-9-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20210322030128.2283-9-laurent.pinchart+renesas@ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 24 Mar 2021 15:46:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UPqg0CnA1ZFR70Ym+m6ROemdFbYwk_=C3+SemP1X9hYw@mail.gmail.com>
Message-ID: <CAD=FV=UPqg0CnA1ZFR70Ym+m6ROemdFbYwk_=C3+SemP1X9hYw@mail.gmail.com>
Subject: Re: [RFC PATCH 08/11] drm/bridge: ti-sn65dsi86: Implement bridge
 connector operations
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Mar 21, 2021 at 8:02 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> Implement the bridge connector-related .get_edid() operation, and report
> the related bridge capabilities and type. The .get_edid() operation is
> implemented with the same backend as the EDID retrieval from the
> connector .get_modes() operation.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 30 ++++++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index dc300fab4319..6f6e075544e8 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -261,6 +261,18 @@ static void ti_sn_debugfs_remove(struct ti_sn_bridge *pdata)
>         pdata->debugfs = NULL;
>  }
>
> +static struct edid *__ti_sn_bridge_get_edid(struct ti_sn_bridge *pdata,
> +                                           struct drm_connector *connector)
> +{
> +       struct edid *edid;
> +
> +       pm_runtime_get_sync(pdata->dev);
> +       edid = drm_get_edid(connector, &pdata->aux.ddc);
> +       pm_runtime_put(pdata->dev);

As mentioned in my patch [1], the above is a bit iffy for eDP.
Specifically just doing a pm_runtime_get_sync() isn't enough to
actually be able to read the EDID. We also need to do any panel power
sequencing and potentially set the "ignore HPD" bit in the bridge to
actually read the EDID.

I'll try to find some time to make this better--let's see if I get
distracted before I manage it.


> +
> +       return edid;
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * DRM Connector Operations
>   */
> @@ -277,11 +289,8 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
>         struct edid *edid = pdata->edid;
>         int num, ret;
>
> -       if (!edid) {
> -               pm_runtime_get_sync(pdata->dev);
> -               edid = pdata->edid = drm_get_edid(connector, &pdata->aux.ddc);
> -               pm_runtime_put(pdata->dev);
> -       }
> +       if (!edid)
> +               edid = pdata->edid = __ti_sn_bridge_get_edid(pdata, connector);

It feels weird to me that we are now exposing the get_edid() function
directly but we still need to implement get_modes(). I guess this is
because we might need to fallback to the hardcoded modes? ...but that
seems like it would be a common pattern for eDP bridges...


>         if (edid && drm_edid_is_valid(edid)) {
>                 ret = drm_connector_update_edid_property(connector, edid);
> @@ -871,12 +880,21 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
>         pm_runtime_put_sync(pdata->dev);
>  }
>
> +static struct edid *ti_sn_bridge_get_edid(struct drm_bridge *bridge,
> +                                         struct drm_connector *connector)
> +{
> +       struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> +
> +       return __ti_sn_bridge_get_edid(pdata, connector);
> +}
> +
>  static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
>         .attach = ti_sn_bridge_attach,
>         .pre_enable = ti_sn_bridge_pre_enable,
>         .enable = ti_sn_bridge_enable,
>         .disable = ti_sn_bridge_disable,
>         .post_disable = ti_sn_bridge_post_disable,
> +       .get_edid = ti_sn_bridge_get_edid,
>  };
>
>  /* -----------------------------------------------------------------------------
> @@ -1335,6 +1353,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
>
>         pdata->bridge.funcs = &ti_sn_bridge_funcs;
>         pdata->bridge.of_node = client->dev.of_node;
> +       pdata->bridge.ops = DRM_BRIDGE_OP_EDID;
> +       pdata->bridge.type = DRM_MODE_CONNECTOR_eDP;

Even with the few comments above, I think this is still fine to move
us in the right direction. Unless I manage to fix up the EDID reading
(in which case your patch would conflict and would need to be
tweaked), then:

Reviewed-by: Douglas Anderson <dianders@chromium.org>


[1] https://lore.kernel.org/r/20210304155144.3.I60a7fb23ce4589006bc95c64ab8d15c74b876e68@changeid/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
