Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42483367CBA
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 10:43:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C54E6EA4D;
	Thu, 22 Apr 2021 08:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6806EA44
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 08:43:23 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id r12so67590256ejr.5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 01:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FqiDNyS4J6V/J3OGwSYhyDd+SOw2Ixt+IYI2Uj7joGs=;
 b=XMCwYxtYxDNez0T1wLh3FfQDTOBHLoJMqlaCRUHmMyksWtApmS5yNftIcsqWnXI+Ev
 fqg6LmwZRlfd99zk7JMgmp4BuYEazclymGcfJzQlXmpXZlmXReX9naCh/0o9fm9uIULY
 HgELs0fzfyQ72dWO7HAZB3eI/TlUf4ToC8g2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FqiDNyS4J6V/J3OGwSYhyDd+SOw2Ixt+IYI2Uj7joGs=;
 b=dC2fEr6ycipyXNAJuH1m440YUwkzYxiAVt5g+Bv3v4++2Ibd0NtJtBEAn1lsARtD/r
 l6frDfVtekASI6i6FwIv9ADBPWwRyMJ2RL4r3Vz9kkT3JjWknvI5J+EMTVh6rqAlGaoZ
 7I72spmFqnqdVGN1x8xPkEkIvRPXykVNOC0WDhbT/ssHwoXbFSE+3H+zLDaOzuPeRGz7
 ZIy/e1Qj5qzHAU0aInnYPkeV33QriWSBdBLpxO9qK2BI8/QyJEh7ebeB5JRLaabXw8vM
 z/P58w3KWEJ+LblShItiS2qqoQDVARZWCgD9urT5Ceg8kqPjE9LXnDfMmMGvekglZoGv
 o2tA==
X-Gm-Message-State: AOAM5302kgHoq/XX+87nOR7YFOMcNMWBy1eHZ7T8w+9JA2WXL4fCRN70
 xUTleKm/noOXn8ykiMVAYGKuIDtpmsY3ghvcFRkEfw==
X-Google-Smtp-Source: ABdhPJwf+ZmaxufgGxquqfYcFezshd0co6gU41ZUuLA0rBxCPUZ6oAByg7aIvTPPZ/xyhWDBXOqz3AfiPfDyDW2cHBE=
X-Received: by 2002:a17:906:3018:: with SMTP id
 24mr2229023ejz.186.1619081002490; 
 Thu, 22 Apr 2021 01:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210421223122.112736-1-marex@denx.de>
In-Reply-To: <20210421223122.112736-1-marex@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 22 Apr 2021 14:13:11 +0530
Message-ID: <CAMty3ZB9iHY6-YV7JRrhekR_7yA=m2dgwR=5a+D3=h4hAMi7WQ@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add TI
 SN65DSI83 and SN65DSI84 bindings
To: Marek Vasut <marex@denx.de>
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
Cc: devicetree <devicetree@vger.kernel.org>, Claudius Heine <ch@denx.de>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 22, 2021 at 4:01 AM Marek Vasut <marex@denx.de> wrote:
>
> Add DT binding document for TI SN65DSI83 and SN65DSI84 DSI to LVDS bridge.
>
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
> ---
>  .../bindings/display/bridge/ti,sn65dsi83.yaml | 134 ++++++++++++++++++
>  1 file changed, 134 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> new file mode 100644
> index 000000000000..42d11b46a1eb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> @@ -0,0 +1,134 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SN65DSI83 and SN65DSI84 DSI to LVDS bridge chip

Can it possible to wait for my v4 to have dual-link LVDS supported
which is quite discussing points on previous versions?

Jagan.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
