Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC38B494C96
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 12:15:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9837510E37D;
	Thu, 20 Jan 2022 11:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9430E10E335
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 11:15:02 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id j2so27054749edj.8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 03:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iCGbnSIdeVbc+bdXt5zsiojMkCxV5VpYtP9a9mDjURU=;
 b=FT7qC5sPu+G1OIfrLGzhNGP+P1cPEnYbuJkYByoReQfid0NZ7HxsgC9qC2YGLtgdHp
 C2p7aktVbPdVexnAAX9rTbxTVDCIOyMc7PaesN3OWvw9LET1QlycXuzgU5P3f+Hs44wR
 gsZhHmatoEmOwZ46sMLQdUM3vzmMe3Mxkhk8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iCGbnSIdeVbc+bdXt5zsiojMkCxV5VpYtP9a9mDjURU=;
 b=CE4r9jHrlYRBm3Ed6v8GbtFEr8sGbuWT3IpYGZ/W6PxmG4GRVou4u7pEh413apBOQv
 fUDRT2jLfBpm2rWQCl5UzH1QLzOY7/Up24l+izo1EoAaCBrx0z0Jxrz7SXysuoWxv4GO
 fnw7XSfNn2ubAWyBAKWCSxVINb55gaazFYUt3j3OGhKpYgqFtP/lYcMUa65ISnoij7Q5
 CjLTs6Mhf7Bc9XnO5mbfRn/O1Nyoh+ZnxGuSk+O2GY+Ywto/njmrJ1EuG0zW6vtk0Qeh
 Vd3CWqihhZyLeS+U3ddQZW4sBkxUNKDCHN4cOYXg+EnvLDRc5Sx4OmrAoJdA8IFfJ5VK
 BIaA==
X-Gm-Message-State: AOAM530WXob+r4q2q/ZCy4EeNVFZAHsx2rrIqDh4LcsLBt6sXuVoM3jW
 +LgSwFQV2s1OxBxNqWblw7y3X6ZAEDEE0PVwZoDBJA==
X-Google-Smtp-Source: ABdhPJy0Rw3dNudsqr44tsK3H1wq7yJrlB7b/cPD/JGratpsbyDUX3QaW1JHCSJhFUXeCVCWwXV8lL0DwW+oi82UKkE=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr12693422edb.271.1642677301085; 
 Thu, 20 Jan 2022 03:15:01 -0800 (PST)
MIME-Version: 1.0
References: <20220119122843.1455611-1-narmstrong@baylibre.com>
In-Reply-To: <20220119122843.1455611-1-narmstrong@baylibre.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 20 Jan 2022 16:44:50 +0530
Message-ID: <CAMty3ZBHSt2jjOxhQWpyYviTM3-uF0HXFtbGPjVddk4PP8Npsw@mail.gmail.com>
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
Cc: jonas@kwiboo.se, robert.foss@linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kieran.bingham@ideasonboard.com,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 jernej.skrabec@gmail.com, biju.das.jz@bp.renesas.com,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 19, 2022 at 5:58 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
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

What if we use bridge helper, drm_bridge_chain_get_first_bridge in
order to find the first bridge in chain?

Thanks,
Jagan.
