Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E528F3510FF
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 10:41:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F20B76E34B;
	Thu,  1 Apr 2021 08:41:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12BD6E34B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 08:41:38 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id ha17so792047pjb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Apr 2021 01:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IXNOp7cXhuLe5p1dDGf1ROatU9pUcUu1AUYD78x1H78=;
 b=KlEn+doHT/1eaDCvXo2Ezxer5ewn9NDK82VGmDpGKMDoJc54wJ8CSGLguexIjb6y6y
 vVy58LrgZuEYUx68uPZoM+HhVKClw8jJcOgBtO3Hzb6qPosf7Ijs3EbFdkx757ktICMy
 8SCE4jf4O/x+OPlMrOa9uS8SExBAhxRO/WgOV5LKAI+9bcgapztVcJ9mWjIciWKH0oJu
 Cu2kPa98lKbAsflGUxnVXpXBCazY34oDPUUgeU4azonRyZXN7YlRy2C0bAcKIinvIIpq
 abnZThBjFF27oO57Om0Zopwees74T0a+cOxjLbaHz0Wm2G9LrRqNMMXmb3TrgtYcJWej
 ZC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IXNOp7cXhuLe5p1dDGf1ROatU9pUcUu1AUYD78x1H78=;
 b=sXXhLE8PnmzabN13XDqS13vuE4nyQAKaM5YV6Rm6WuTdl3n2wDZP8r4z1gapZj0EBf
 kgZRv+WeQZzwOLwWh9BJ26QEZJSJCSBKXA74BEDT3hbZp7mGCZHwiEyIlUDyTHZKM5Bf
 mpd5GksH/7wzuRD3CClKZquVo0uDFF7fzGlw9nOG1oW612vh/g7XSTB111TuW5XkMqVe
 AeGO2FddYv0NmhtrcoXzn4d2NRK4ZOyHFD8he+UExXAAIiWs1Bf1Pn0sgLiR7Cgkx7qm
 a5/GYJKHXTqrgwUTYbLT5KqxIzi7U9d/1PGPRbCfgKJpvL60oHZzIw4t0n3PIFkSlHy4
 mFlg==
X-Gm-Message-State: AOAM533vKL1bGA+7JQQ09eh69tSk0FovxTAocC4vMgYuAaEALyBUH4qS
 g4o5z94WFphIadTpAgbmmcjwGUMHAxKUasbcl+RvNA==
X-Google-Smtp-Source: ABdhPJzYIaLiC0MYJA3XRB6eqAIr3Ww013zSL3r6maBxPLMQDTa8/OSTf3qvuQlUEYOLz89xr4IkXKa1l4xTMuHVSv4=
X-Received: by 2002:a17:902:7d8d:b029:e6:4061:b767 with SMTP id
 a13-20020a1709027d8db02900e64061b767mr7050428plm.32.1617266498537; Thu, 01
 Apr 2021 01:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210401053202.159302-1-hsinyi@chromium.org>
In-Reply-To: <20210401053202.159302-1-hsinyi@chromium.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 1 Apr 2021 10:41:27 +0200
Message-ID: <CAG3jFytABggTSGVan97Gi-9Y5N1Xf3eEBTWBrPhSmrJVu56Zpw@mail.gmail.com>
Subject: Re: [RESEND PATCH v4 1/2] dt-bindings: drm/bridge: anx7625: Add power
 supplies
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Hsin-Yi,

Thanks for the reminder, just merged the series.

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=2f240cdb23e9cde551d99c77f4e60062188d8d81

On Thu, 1 Apr 2021 at 07:32, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> anx7625 requires 3 power supply regulators.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> ---
> v3->v4: rebase to drm-misc/for-linux-next
> ---
>  .../bindings/display/bridge/analogix,anx7625.yaml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> index c789784efe306..ab48ab2f4240d 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> @@ -34,6 +34,15 @@ properties:
>      description: used for reset chip control, RESET_N pin B7.
>      maxItems: 1
>
> +  vdd10-supply:
> +    description: Regulator that provides the supply 1.0V power.
> +
> +  vdd18-supply:
> +    description: Regulator that provides the supply 1.8V power.
> +
> +  vdd33-supply:
> +    description: Regulator that provides the supply 3.3V power.
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>
> @@ -55,6 +64,9 @@ properties:
>  required:
>    - compatible
>    - reg
> +  - vdd10-supply
> +  - vdd18-supply
> +  - vdd33-supply
>    - ports
>
>  additionalProperties: false
> @@ -72,6 +84,9 @@ examples:
>              reg = <0x58>;
>              enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
>              reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
> +            vdd10-supply = <&pp1000_mipibrdg>;
> +            vdd18-supply = <&pp1800_mipibrdg>;
> +            vdd33-supply = <&pp3300_mipibrdg>;
>
>              ports {
>                  #address-cells = <1>;
> --
> 2.31.0.291.g576ba9dcdaf-goog
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
