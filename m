Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9693484C7
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 23:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45DB16EA9D;
	Wed, 24 Mar 2021 22:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B6D6EA9D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 22:44:52 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id q9so229874qvm.6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/iyW6kwjqi6FG66ikBN1bNiA6NtYOMym2acDaBscWVA=;
 b=fBlP6kmzrfU3NAufyoAyG4cACwfZnJQ4BYRgdN0kxccpCHnDPb8RAmlw7DXSg7HANx
 3iWcU420zI3miyS8v2if3Cd/0w+ItcKRB7FwcKiDnF6rweijaHFGVbRA5qxoS/iP0Uax
 d4ZBAaaX60UYNq/27clkv6hvgjYwXiUh8vUrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/iyW6kwjqi6FG66ikBN1bNiA6NtYOMym2acDaBscWVA=;
 b=gFEYbApVFfwMZgkfe4+1k6O1pT/8zVl6ap2HduE6Pnx+UEEzL7Jrdx0AvdZfi/VYL6
 QhoTLdW0+IFFLzs+TqhCrvur/RrdUwA94GN3oeV5bEk9om2I59h6v0ltoqPJYMPZyiwC
 ZsdR5MwkU4AldCRwWlqgRRErvGNfAOI6n2N1H9c3XUYBrkFV36wy+ni2rQzRj7VoQ9N7
 MpeCABl+g/jkXKiYHwHtbYhyJ+tDN0ISIjlLNTsddIhgAbTOqH69/pwshbebQxGx2S/4
 HUVzxdgnwf2gxVtCuzO0Q2/TFUn8sQYYh6yyzBHIJ5kqMhDJzpeY2bOpx3Rce6EzzxbJ
 sdng==
X-Gm-Message-State: AOAM53007O6G7bZl144uzyl1zBCubdId9wIUcFgW1AE7uskHKjmtMtsd
 8cfycTKPqZY+WoMwom5E2MsbhuB4glnKtA==
X-Google-Smtp-Source: ABdhPJyXOa46DlhNFPJTxmY6h6+vcTEjCx+AEt2lVE5loixh96ne7m9gsAVcocPV5CCRsw1rk/YtyA==
X-Received: by 2002:ad4:59c6:: with SMTP id el6mr5195395qvb.15.1616625891732; 
 Wed, 24 Mar 2021 15:44:51 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182])
 by smtp.gmail.com with ESMTPSA id j12sm2402620qtn.36.2021.03.24.15.44.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 15:44:51 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id m132so299767ybf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:44:51 -0700 (PDT)
X-Received: by 2002:a5b:54a:: with SMTP id r10mr7016215ybp.476.1616625890751; 
 Wed, 24 Mar 2021 15:44:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-6-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20210322030128.2283-6-laurent.pinchart+renesas@ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 24 Mar 2021 15:44:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VFwphwow7W_v7XHn+1dQHq0zwT-TyJyp9BaFgcs_t9VQ@mail.gmail.com>
Message-ID: <CAD=FV=VFwphwow7W_v7XHn+1dQHq0zwT-TyJyp9BaFgcs_t9VQ@mail.gmail.com>
Subject: Re: [RFC PATCH 05/11] drm/bridge: ti-sn65dsi86: Wrap panel with
 panel-bridge
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
> To simplify interfacing with the panel, wrap it in a panel-bridge and
> let the DRM bridge helpers handle chaining of operations.
>
> This also prepares for support of DRM_BRIDGE_ATTACH_NO_CONNECTOR, which
> requires all components in the display pipeline to be represented by
> bridges.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 30 +++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 1d1be791d5ba..c21a7f7d452b 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -124,6 +124,7 @@
>   * @edid:         Detected EDID of eDP panel.
>   * @refclk:       Our reference clock.
>   * @panel:        Our panel.
> + * @next_bridge:  The next bridge.

To make it easier for folks who don't work with DRM all day, could you
somehow clarify which direction "next" is talking about. AKA the next
"outward" (towards the sink) or the next "inward" (toward the source)?


>   * @enable_gpio:  The GPIO we toggle to enable the bridge.
>   * @supplies:     Data for bulk enabling/disabling our regulators.
>   * @dp_lanes:     Count of dp_lanes we're using.
> @@ -152,6 +153,7 @@ struct ti_sn_bridge {
>         struct mipi_dsi_device          *dsi;
>         struct clk                      *refclk;
>         struct drm_panel                *panel;
> +       struct drm_bridge               *next_bridge;

There's no reason to store the "panel" pointer anymore, right? It can
just be a local variable in probe?


> @@ -850,8 +856,6 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
>          */
>         regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
>                            HPD_DISABLE);
> -
> -       drm_panel_prepare(pdata->panel);

Ugh, I guess conflicts with my EDID patch [1] which assumes that this
function will directly turn the panel on. I'll see if I can find some
solution...

[1] https://lore.kernel.org/r/20210304155144.3.I60a7fb23ce4589006bc95c64ab8d15c74b876e68@changeid/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
