Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A13D74A9AA2
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 15:05:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C35010E1D0;
	Fri,  4 Feb 2022 14:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761F610E1D0
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 14:05:30 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id d1so5212032plh.10
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 06:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2qpcRyh+24qtP2VVaX3PS7mv2lf5IWfW1neqWFvhdxM=;
 b=HjMI8iZLqfdazRpmnpfZL//MzxxnWj63vgQoTMi7jsbHxH1ssKOVpsZzSZEQnOlY6E
 wZAWPbVnJ5++71gvc3WZRhn/63ZmQAyUB0jZiJOkwwNcPxWvUETM53K37Dcw2Fu/ATWn
 Jx0H11c+ls9yn0/KiuE9h4bDVdg6X+8QFjcbPYb5FjndjsGDzGDBLMsYL9kuE6BRizKQ
 B71ju3Tpo160s0fXVOw/ZkbOpWxe4Ay+f3W05T9OY6Uli045hEVr2rC0WRQgQ+ZNNgpx
 3CfbNChebx1P8JuuOKOot8OtyCkJ3aK2q0Zy9HD1r5SdEDUGAvCLFWlABsXZBaN2MPio
 c/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2qpcRyh+24qtP2VVaX3PS7mv2lf5IWfW1neqWFvhdxM=;
 b=rWqM4fh+3MaBQFgss46bxxd+5e0aa2DRa6pCFm3eiMhaxnK8xDZpfnfMsbdd/bQWr0
 4r+d7cMSX0uZBMlWegJqZ9YkcKqo6+0krc366zK2Z6AdsqckeN3aeYrLq0lQD4OeIL7Y
 pFfJ9R2aPox+XZvuSTj/Nuh/5neP3ztzE5G1Vdie9e9oT8MwXe3hDSkUQvFpNXX7+aAr
 7T4DPCskEYnsrSFrfhzxkgnrHCZKLOp2ryz8tftzo++5TG7mX1ZeneaYf0PFFN03S8oS
 XJy2F2hIbwnGBkpihL8mJfQB7G9AU4aEMPz54bqMy4r7BlcBu6rSETQGu4Qw8WMM9vrm
 ldLg==
X-Gm-Message-State: AOAM5304MmPT0/sSKwLDQ9G4m8ACvkemDe0d3SwweTVHhUxEhOu4TvL+
 3h8pvtlJDynCLqO4vopo2OyjtaOwgV3WhBVFe24V3oraBzrQPQIS
X-Google-Smtp-Source: ABdhPJz/hl4o9naclBibn/3lZ3yW55IUCJbzoEq5EV8ShNlXxqU02ZIHt8TgohirAOEr5upB4OmCwB4CEpZUJ1U+1wU=
X-Received: by 2002:a17:90b:4a86:: with SMTP id
 lp6mr3334875pjb.152.1643983529997; 
 Fri, 04 Feb 2022 06:05:29 -0800 (PST)
MIME-Version: 1.0
References: <20220119122843.1455611-1-narmstrong@baylibre.com>
In-Reply-To: <20220119122843.1455611-1-narmstrong@baylibre.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 4 Feb 2022 15:05:16 +0100
Message-ID: <CAG3jFyv15AhfZP0HTAt73U0yvKHNAMLmKzFu-9AfX9v76h7s6g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: dw-hdmi: use safe format when first in
 bridge chain
To: Neil Armstrong <narmstrong@baylibre.com>
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
Cc: jernej.skrabec@gmail.com, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kieran.bingham@ideasonboard.com,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 laurent.pinchart@ideasonboard.com, biju.das.jz@bp.renesas.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Jan 2022 at 13:28, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> When the dw-hdmi bridge is in first place of the bridge chain, this
> means there is no way to select an input format of the dw-hdmi HW
> component.
>
> Since introduction of display-connector, negotiation was broken since
> the dw-hdmi negotiation code only worked when the dw-hdmi bridge was
> in last position of the bridge chain or behind another bridge also
> supporting input & output format negotiation.
>
> Commit 0656d1285b79 ("drm/bridge: display-connector: implement bus fmts callbacks")

I think this is the wrong hash. Is 7cd70656d128 the actual hash?

> was introduced to make negotiation work again by making display-connector
> act as a pass-through concerning input & output format negotiation.
>
> But in the case where the dw-hdmi is single in the bridge chain, for
> example on Renesas SoCs, with the display-connector bridge the dw-hdmi
> is no more single, breaking output format.
>
> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
> Bisected-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Fixes: 0656d1285b79 ("drm/bridge: display-connector: implement bus fmts callbacks").

This hash too.

> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
> Changes since v1:
> - Remove bad fix in dw_hdmi_bridge_atomic_get_input_bus_fmts
> - Fix typos in commit message
>
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 54d8fdad395f..97cdc61b57f6 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2551,8 +2551,9 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>         if (!output_fmts)
>                 return NULL;
>
> -       /* If dw-hdmi is the only bridge, avoid negociating with ourselves */
> -       if (list_is_singular(&bridge->encoder->bridge_chain)) {
> +       /* If dw-hdmi is the first or only bridge, avoid negociating with ourselves */
> +       if (list_is_singular(&bridge->encoder->bridge_chain) ||
> +           list_is_first(&bridge->chain_node, &bridge->encoder->bridge_chain)) {
>                 *num_output_fmts = 1;
>                 output_fmts[0] = MEDIA_BUS_FMT_FIXED;
>
> --
> 2.25.1
>

There are two checkstyle issues apart from the above mentioned hash
issues, and I think we can ignore those. With the above mentioned
issue fixed, feel free to add my r-b.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
