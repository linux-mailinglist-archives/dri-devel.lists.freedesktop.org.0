Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 912AA5A516D
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 18:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A2E10E2EC;
	Mon, 29 Aug 2022 16:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C8610E516
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 16:19:13 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id se27so9003856ejb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 09:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=xKZFkBlVOpK0GhMeHQ8L1yZrK2swcZY5fMhyrvk6r8c=;
 b=nXcMGAe0Sx7qCNct2qX32GXkHHAkik1lhUtHLTydlQ+sCYRnIDn9ivLcY6GQzKJBGO
 sqPPfWLyDQeZEZF5IKZ36jdRI3WaVylQOFCiDR0S1d1xqspnq18JQLQI+D1rulkdoQxq
 yPbMCLYT/YpMhX0sVnk8XRuD2uyBTR1mzG0ZY76Swl8znXo6AYemvdcSxTEfyCMcvD50
 BI5BOe5x9RnUevZgYPcZbqhW0GH2SXksGI6Dp82cVEMLCkef2OkfPPfXD1LSHNUiv+Ay
 X4IiPzOwHTq83CaAd9Vrb6oU137lFzNzq5EIV4I9x9ncgpRMuo9c7Sc37sJ3lXEpbI8z
 eRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=xKZFkBlVOpK0GhMeHQ8L1yZrK2swcZY5fMhyrvk6r8c=;
 b=m8/8DtyTI0qUrFbMZe0P/jlk4CF1ff1vWPKx2VQPP1aM4R4hOBtJNx/Lux2aRzodHE
 7FnwWhbusv3O0gDo9EXJyJi4vwc1JstEgk0K1aZKRRzfZjx+8z2rjAnP+ZvxTnONSd0D
 VsDx4lOXOu91FZLcpjTq3jZUwv67SGR/xMqkUnGM3ovruvjGDeKGN25B37dBTiyfagUm
 p8HsSxmaPSPb8stVcnVbjg+kPRX/PNo1qhuL4yCWpUilSZGCmBmSGCs+wCfMoxb6ztdS
 5D0ZFagM3d7TurGVp9gSD1aQlMI0Xq/GuELgWAFaEZGv2jZh65ryC1Wl+LK0VZo6N9A2
 pMuA==
X-Gm-Message-State: ACgBeo3Xg0kSsei9lQmR+oEEXDjHoQo32WPPHF+rkE3gZ75mro7cGIjQ
 LL8HmsFOpAWa77nroqzsNjnTD9NuGJeN6Exl0XUxEg==
X-Google-Smtp-Source: AA6agR7oYPKpIAphR6tfmDgxauWAIK+Oy8CoGWkQFgVX9TRImBCAhNM5rxSPTBAOOVrthCe17IdcIEwakutVSDRLrrg=
X-Received: by 2002:a17:907:781a:b0:730:cd06:3572 with SMTP id
 la26-20020a170907781a00b00730cd063572mr14192228ejc.487.1661789952154; Mon, 29
 Aug 2022 09:19:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220330193941.3720-1-macroalpha82@gmail.com>
 <20220330193941.3720-2-macroalpha82@gmail.com>
In-Reply-To: <20220330193941.3720-2-macroalpha82@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 29 Aug 2022 18:19:01 +0200
Message-ID: <CAG3jFytgGYZWRt0K6AX-deJdXS_YR=vFc9MBQh7+tp47iZpYyA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: Add byteswap order to chrontel ch7033
To: Chris Morgan <macroalpha82@gmail.com>
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
Cc: jernej.skrabec@gmail.com, narmstrong@baylibre.com, airlied@linux.ie,
 jonas@kwiboo.se, Chris Morgan <macromorgan@hotmail.com>,
 dri-devel@lists.freedesktop.org, lkundrak@v3.sk, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Chris,

Sorry about being slow getting to this.

On Wed, 30 Mar 2022 at 21:39, Chris Morgan <macroalpha82@gmail.com> wrote:
>
> From: Chris Morgan <macromorgan@hotmail.com>
>
> Update dt-binding documentation to add support for setting byteswap of
> chrontel ch7033.
>
> New property name of chrontel,byteswap added to set the byteswap order.
> This property is optional.
>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../bindings/display/bridge/chrontel,ch7033.yaml          | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml b/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
> index bb6289c7d375..ecd3062c5215 100644
> --- a/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
> @@ -14,6 +14,14 @@ properties:
>    compatible:
>      const: chrontel,ch7033
>
> +  chrontel,byteswap:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    enum: [0, 1, 2, 3, 4, 5]
> +    description: |
> +      Set the byteswap value of the bridge. Values 0-5 correspond to
> +      BYTE_SWAP_RGB, BYTE_SWAP_RBG, BYTE_SWAP_GRB, BYTE_SWAP_GBR,
> +      BYTE_SWAP_BRG, and BYTE_SWAP_BGR respectively.

This is acceptable, but maybe we can make this a little bit nicer by
documenting the enum and it's description on the same line.

    enum:
      - 0 # automode
      - 1 # internal
      - 2 # external

> +
>    reg:
>      maxItems: 1
>      description: I2C address of the device
> --
> 2.25.1
>

With this addressed, please add my r-b.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
