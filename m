Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A57379375
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 18:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A5A6E878;
	Mon, 10 May 2021 16:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD09E6E878
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 16:14:35 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 d25-20020a0568300459b02902f886f7dd43so1478372otc.6
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 09:14:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VxXypLnnfQFx2W7ZW08m5m+Mn54EAOFIda0OqddCe0U=;
 b=ekK1UYs4E3MFrfHMjQfy2pK50rMc1e5SYVnJLCpvGAleYrVUiNAgd6Cl6buquZl82Q
 1+8sc788XgAWZjMmVEeKw2V4Z/FsjPiC0d6U+g5s5P4M4bVw4biDPKNr15MZp7TRyEBT
 qv5yci45rakoIhSSAhEPyOKJwoJ4lwrO0eJwctlqEEx3fBxC12RCvDUTh3TG6vlcFkX1
 fxDVUPpY9/zLybPH3/W1QCp2epwvdeAQz7h+oYK8RqN1Y/+fngdpfenSByzVFXuQkOWl
 wvK5TCzd5y3XMstNz85Zdj2PeTWFDNS6W4PznYUHggtDC0pFgQaS0LwIooYjB77wdg7d
 yYdw==
X-Gm-Message-State: AOAM531+tTs3Ue9XTmPdqYR8lv6C3fGqi9PvJhp4vNdq8+cHNFplgdNl
 b++l4iIYMJDucNs+PrgWrg==
X-Google-Smtp-Source: ABdhPJz7B3XsxLud7dSbrtxvTm2xPO+u3x5Y2fG9bhxNk3sKPgG8eoO41ErbV9RR1FK5OZqh4EHZgg==
X-Received: by 2002:a05:6830:1bd4:: with SMTP id
 v20mr22887188ota.101.1620663274976; 
 Mon, 10 May 2021 09:14:34 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q26sm3283265otn.0.2021.05.10.09.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 09:14:33 -0700 (PDT)
Received: (nullmailer pid 219647 invoked by uid 1000);
 Mon, 10 May 2021 16:14:32 -0000
Date: Mon, 10 May 2021 11:14:32 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V4 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add TI
 SN65DSI83 and SN65DSI84 bindings
Message-ID: <20210510161432.GA219593@robh.at.kernel.org>
References: <20210508202251.474729-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210508202251.474729-1-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, ch@denx.de,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 08 May 2021 22:22:50 +0200, Marek Vasut wrote:
> Add DT binding document for TI SN65DSI83 and SN65DSI84 DSI to LVDS bridge.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
> V2: Add compatible string for SN65DSI84, since this is now tested on it
> V3: - Add 0x2c as valid i2c address
>     - Switch to schemas/graph.yaml
>     - Constraint data-lanes to <1>, <1 2>, <1 2 3>, <1 2 3 4> only
>     - Indent example by 4 spaces
>     - Handle dual-link LVDS with two ports and describe the second DSI
>       channel-B port as well. Based on the register defaults of DSI83
>       and DSI84, it is likely that the LVDS-channel-B and DSI-channel-B
>       hardware is present in all the chips, so just reuse port@0 and 2
>       for DSI83, port@0,2,3 for DSI84 and all of 0,1,2,3 for DSI85 when
>       that is supported
> V4: - Fix typo in port@3 description
>     - Add RB from Linus Walleij
>     - Replace oneOf: and const with enum:
>     - ref /schemas/media/video-interfaces.yaml#
>     - Drop empty endpoint: and properties:
> ---
>  .../bindings/display/bridge/ti,sn65dsi83.yaml | 159 ++++++++++++++++++
>  1 file changed, 159 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
