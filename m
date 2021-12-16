Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C212477571
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 16:13:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BFA10E983;
	Thu, 16 Dec 2021 15:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273A110E955
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 15:13:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 94C69B8247E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 15:13:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D300C36AE0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 15:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639667597;
 bh=REimS41qgBurbspSIkR1kMxD0grK0fDoyp2v8fHLvWU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=la1Nva7CY5Jjwk/Wm8lWv3aYBjlUl57ZAfIlbsOFzuOmJSPuKLopP/GuXByjC/AxG
 d8FYa3Cmbcy/Oncgw2P12FORplfl01xThQnV8jXaFWhGL25GidA2g8k+ManOQFoc6j
 2F+cH8UL49wJ8NB4ZXlyoHdZTi6aEKZgK9+U7WrEXbLuLIlLZdlk2gbt6H/RyH7/CX
 CQ8ZHrKOLJiH/rt4doqQ3JgqXTP2C/ix1yRkUCJNYrJm2Qapx2frWlRH0A5ZcMfOap
 zPq992A0r6cmcuhnAFlsqwmf3nGPeRJCwyKLLDEBzZvGY+fLYhDo6HiTeJwdsq/1FI
 8sMVox38pRHdw==
Received: by mail-ed1-f46.google.com with SMTP id y13so88000974edd.13
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 07:13:17 -0800 (PST)
X-Gm-Message-State: AOAM530D7sLz3U2gn4lX2v0kaNIepJ15OToI9K9wQ5wBLfDxf6tczZoL
 P8MUNF5GHC5XqutxTFSsy+a9oUnm3smaHx0ztA==
X-Google-Smtp-Source: ABdhPJzaSjcXBqry8QmxPjHdP9FMmSwW8YKfAtjQEf0G8hozeKwYCJ5n4IhU9jxoGpU1d4mPc88zqtdZC7Q7FuBNpgY=
X-Received: by 2002:a05:6402:4251:: with SMTP id
 g17mr20936069edb.89.1639667595626; 
 Thu, 16 Dec 2021 07:13:15 -0800 (PST)
MIME-Version: 1.0
References: <20211215152712.72502-1-david@ixit.cz>
In-Reply-To: <20211215152712.72502-1-david@ixit.cz>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 16 Dec 2021 09:13:03 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLyMr+apgqn31V7QPfqqxhJ1ro258WsDP=CO37zfyxVNw@mail.gmail.com>
Message-ID: <CAL_JsqLyMr+apgqn31V7QPfqqxhJ1ro258WsDP=CO37zfyxVNw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: bridge: document Toshiba TC358768
 cells and panel node
To: David Heidelberg <david@ixit.cz>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 ~okias/devicetree@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 15, 2021 at 9:38 AM David Heidelberg <david@ixit.cz> wrote:
>
> Properties #address-cells and #size-cells are valid.
> The bridge node can also contains panel node.
>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../bindings/display/bridge/toshiba,tc358768.yaml      | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> index eacfe7165083..3186d9dffd98 100644
> --- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> @@ -69,6 +69,16 @@ properties:
>        - port@0
>        - port@1
>
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  "^panel@[0-3]$":
> +    $ref: ../panel/panel-common.yaml

It's possible to attach something that doesn't use panel-common.yaml
and if it did, it would be applied by that schema.

What you need is to just reference dsi-controller.yaml at the top level.

Rob
