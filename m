Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD1450B96D
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 16:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C45EE10E2C7;
	Fri, 22 Apr 2022 14:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5096610E2C7
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 14:03:33 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id y14so7329288pfe.10
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 07:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yIxJ0wDa8EMSjPBeJ0MH0ee5bXLTHtfgfaqE1L8G+40=;
 b=lJxrPZlkatu783HAwlcGCkHOGo7DXQhGtEQqtJXdK1/LRl+CFmh8ejREqMzuQsb/EO
 mSWo3xSE3IyrXmkejiW/vWdGNWXHJq3XuWPVwHfOrNTHe22aLtJOSFoF9VbWxGShMkLI
 9Q+PuNjFAIycQZ3Wxp1Hlw+8+12yQNRH0GG+fNhLoV/3xJ4+LhbnZOUxx6MZEP9nSodA
 yqgCHWgXniNWxjtrX3H3On6nZ4yPcA3da8QSX9nhLRZ5IjY5tb6uARk2tJLXfFalCk4P
 xGPGUKbc8fkI0Vi0kDpxm6o08sdvcBkKHkthDdk164bksR8xqFiWBvr+aIqy948MIjR+
 97aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yIxJ0wDa8EMSjPBeJ0MH0ee5bXLTHtfgfaqE1L8G+40=;
 b=EVPy94XqKN8oNFgV7NqcQmYl8AMvevzTzCbTDgsohxvxw6ZyTMP5C6Tfa6rxH7sxo1
 l6de6L0549ReKT3SGU/5q1u1NtINoC+PsOHgMvMT5DAm2Su/EhNuD21mCI40+tyUwZos
 y919ICTXxusAbpPObGCJ+hOpM5HDhh83Fyry8FsObtqr3fBMagk42c9iUB2feYHZWLwK
 crdu/AvN0OOg/BsWClpl0xj+hBg7apUl0uye4leT/g0q/QHgNtQ62soNrceQzJnOr8Wo
 /2kawOpUSYaI9F2SbuXS4BcD4lksfz3oJDwn9p8/VP6tKq0ZesNNoadULMbSG1MCua1X
 NV4Q==
X-Gm-Message-State: AOAM532akKAp6ZljSvl7dhZJx5RxZw0s0FD1vBM71iRqfrGWPT4Y02cV
 Wa+67PiUbJrWzTsRL98+o8fP9lpR5ob9L0D7ZKEE+Q==
X-Google-Smtp-Source: ABdhPJxRtgE3RbFTfbHXqawhd/4ATwWIhmdUbK2D/ER+hiax8GwWWsOHlmE4gELgS/jXpG50IMB4XeGk31Iq3HBZuEs=
X-Received: by 2002:a05:6a00:1747:b0:505:d75c:e0b2 with SMTP id
 j7-20020a056a00174700b00505d75ce0b2mr5271101pfc.0.1650636212574; Fri, 22 Apr
 2022 07:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220422084720.959271-1-xji@analogixsemi.com>
 <20220422084720.959271-3-xji@analogixsemi.com>
In-Reply-To: <20220422084720.959271-3-xji@analogixsemi.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 22 Apr 2022 16:03:21 +0200
Message-ID: <CAG3jFysyj7sO0qh3FAAeuOQYUSz6nkZ8svX7f4xdfSY980OkCg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings:drm/bridge:anx7625: add port@0 property
To: Xin Ji <xji@analogixsemi.com>
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 qwen@analogixsemi.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, bliang@analogixsemi.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Apr 2022 at 10:48, Xin Ji <xji@analogixsemi.com> wrote:
>
> Add 'bus-type' and 'data-lanes' define, bus-type 7 for MIPI DPI
> input, others for DSI input.
>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
>
> ---
> V1 -> V2: rebase on the latest code.
> ---
>  .../display/bridge/analogix,anx7625.yaml      | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> index 35a48515836e..4590186c4a0b 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> @@ -94,7 +94,22 @@ properties:
>          $ref: /schemas/graph.yaml#/$defs/port-base
>          unevaluatedProperties: false
>          description:
> -          Video port for MIPI DSI input.
> +          MIPI DSI/DPI input.
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            type: object
> +            additionalProperties: false
> +
> +            properties:
> +              remote-endpoint: true
> +
> +              bus-type:
> +                enum: [7]
> +                default: 1
> +
> +              data-lanes: true
>
>        port@1:
>          $ref: /schemas/graph.yaml#/properties/port
> @@ -143,6 +158,8 @@ examples:
>                      reg = <0>;
>                      anx7625_in: endpoint {
>                          remote-endpoint = <&mipi_dsi>;
> +                        bus-type = <7>;
> +                        data-lanes = <0 1 2 3>;
>                      };
>                  };
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
