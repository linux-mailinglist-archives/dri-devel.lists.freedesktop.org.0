Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6168387B7A
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 16:42:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D1F6EB93;
	Tue, 18 May 2021 14:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806436EB93
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 14:42:50 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 b9-20020a17090a9909b029015cf9effaeaso1652362pjp.5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 07:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b3DMt2F3yR1S8LhJiSdAhlPcYPUp2f9kxGSREUS+xFY=;
 b=hrKuPisLxc8CgXd9G6ghQ6FBg4IJtnIX7kOnnpJojVxnuLnLTdp7lfi3kHnxK9dz0+
 v+gfHV/vAujTUbSAZUMzTXMkFkS06vjZKGpIpbupOJ0CQzyDiB9qEwDG9gBbYwNjwB4d
 4/Sf3gbt9uYnMkgDd4vJ4RAplDIoz0rt8sNrsoWPDkLadtBj8lQDAplYoqANqXtRTxxB
 9Uu38T6Ax0+/znT5ex5MKtIhfm+jjo6r6sCDk+5rEXrNF0dGBmJcQq2cfYm3W6e2PAML
 +bdCUUIS3x+IPNlwCBnwGWge0nKbJeB1ZSjS4dDyFnma0emXEP+2ooA+vRqNc1qdezZ/
 xQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b3DMt2F3yR1S8LhJiSdAhlPcYPUp2f9kxGSREUS+xFY=;
 b=lLrIPKil3zzo785GYEfhTraeXJ/uM1ntg7G3Ve/fIkUr5gcP7koQhKvmEuT2DJC98T
 sOmUbr9Nb7lyqtQTnGywNYQGUcUvRlJBoaevM9J4iEdOb3fYnJ7D7pK6X95r3qo2Pakj
 dsq2ghhr5nBAqqG+qCgR087YxXuNQaJM89wwYie536eseXIpPvDGrZNNgyInw13CxWWy
 9d+aOtJSWuTvPtA91d0dY3kMuiEpwnImpdJrBL8Gnk+2ESiwYvy92oI2DbOdjJrpXQqC
 75YT1Zn9CCbU+cqxlXdPPG2lTByESdvs6QVxd6/dxd1f/d77QzLiLBZy1lEyHpDR8q5y
 3o1g==
X-Gm-Message-State: AOAM533ajss+cv8hDiLkcegWotqIpc3UrHAkqVWYFzpa/3cXHJskf0pV
 q/JkGtNhnXg/nq1706/J9zC0Mm4MMUtoDHWDsjaBjg==
X-Google-Smtp-Source: ABdhPJz6HxDCbuqQzC6kuOWJ/Z4wKk+gxz+hYXy740zOMxhRX6CV1XDh880v/3VEjfhmUyaukGJCeYabreKqbOSypV0=
X-Received: by 2002:a17:90a:e391:: with SMTP id
 b17mr1086553pjz.75.1621348970117; 
 Tue, 18 May 2021 07:42:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210518141927.24795-1-dafna.hirschfeld@collabora.com>
 <20210518141927.24795-2-dafna.hirschfeld@collabora.com>
In-Reply-To: <20210518141927.24795-2-dafna.hirschfeld@collabora.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 18 May 2021 16:42:38 +0200
Message-ID: <CAG3jFyuu7Vvd3QtKpfVg+uSFB9JJmKOAovxpX_gs=BoBUYuamw@mail.gmail.com>
Subject: Re: [PATCH v6 RESEND 1/2] dt-bindings: display: add google,
 cros-ec-anx7688.yaml
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
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
Cc: megous@megous.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 enric.balletbo@collabora.com, linux-usb@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 kernel@collabora.com, dafna3@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Series applied to drm-misc-next.

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=b67f7599c90ae36a5174826132f7690fa13d462c

On Tue, 18 May 2021 at 16:19, Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> ChromeOS EC ANX7688 is a display bridge that converts HDMI 2.0 to
> DisplayPort 1.3 Ultra-HDi (4096x2160p60). It is an Analogix ANX7688 chip
> which is connected to and operated by the ChromeOS Embedded Controller
> (See google,cros-ec.yaml). It is accessed using I2C tunneling through
> the EC and therefore its node should be a child of an EC I2C tunnel node
> (See google,cros-ec-i2c-tunnel.yaml).
>
> ChromOS EC ANX7688 is found on Acer Chromebook R13 (elm)
>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bridge/google,cros-ec-anx7688.yaml        | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> new file mode 100644
> index 000000000000..9f7cc6b757cb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/google,cros-ec-anx7688.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ChromeOS EC ANX7688 HDMI to DP Converter through Type-C Port
> +
> +maintainers:
> +  - Nicolas Boichat <drinkcat@chromium.org>
> +  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
> +
> +description: |
> +  ChromeOS EC ANX7688 is a display bridge that converts HDMI 2.0 to
> +  DisplayPort 1.3 Ultra-HDi (4096x2160p60). It is an Analogix ANX7688 chip
> +  which is connected to and operated by the ChromeOS Embedded Controller
> +  (See google,cros-ec.yaml). It is accessed using I2C tunneling through
> +  the EC and therefore its node should be a child of an EC I2C tunnel node
> +  (See google,cros-ec-i2c-tunnel.yaml).
> +
> +properties:
> +  compatible:
> +    const: google,cros-ec-anx7688
> +
> +  reg:
> +    maxItems: 1
> +    description: I2C address of the device.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Video port for HDMI input.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: USB Type-c connector.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c_tunnel_b: i2c-tunnel1 {
> +        compatible = "google,cros-ec-i2c-tunnel";
> +        google,remote-bus = <1>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        anx7688: anx7688@2c {
> +            compatible = "google,cros-ec-anx7688";
> +            reg = <0x2c>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                port@0 {
> +                    reg = <0>;
> +                    anx7688_in: endpoint {
> +                        remote-endpoint = <&hdmi0_out>;
> +                    };
> +                };
> +                port@1 {
> +                    reg = <1>;
> +                    anx7688_out: endpoint {
> +                        remote-endpoint = <&typec_connector>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +
> --
> 2.17.1
>
