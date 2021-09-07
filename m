Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B03C402E68
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 20:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74566E082;
	Tue,  7 Sep 2021 18:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
 [209.85.161.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A2CC6E082
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 18:33:28 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id
 e206-20020a4a55d7000000b00291379cb2baso59958oob.9
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 11:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1Y7kz7rPiF3VaPntLj2tLYmDViv0USAD/qIq0pAgQr4=;
 b=KMPx1seo6LyREupvx6b52bjJNQf8Xuk3Atyiec65Y8U3wIZK8d2JsizA0bMGsDkU2U
 XsF/biVRVlL7mFSHhw5vbE64IWKYYemNNOv5hr+PZNxIlRlrw6r+vuQ0F2SlrEhqj/6g
 sDByOpp0/tPUTuYz9D2vnBakV4KHyRVXMhumI/AUTblxCNGBWowX9yVVRWpJK2mH3l0g
 7D4tM/JY1CkiPvw3g38eR/8B6AOi9kOu8sopwOiw+M7rcpirQ7gqxO9/S8qC4drsUQJx
 nUZqU0hqhotaMl/lRSInqYVA78u9yOoQFFV5Tfjt0HvpTJgTLztOorwEftN0WiFIkEhV
 MbqQ==
X-Gm-Message-State: AOAM531vVrEQGXCU+29aJnks1EoYgbjR+8YoEjOqFWzy7ejhY7ES4nSU
 +2CRI708/Yg9tw6VlZ5j2g==
X-Google-Smtp-Source: ABdhPJxlNBSI5uLOTxCRNzYNIaAk3qH4LtZ7Xee0x34y1IfrAyuuQA05q4QHPwlRCmrwT68IUwD7Cw==
X-Received: by 2002:a4a:966d:: with SMTP id r42mr1072671ooi.11.1631039607714; 
 Tue, 07 Sep 2021 11:33:27 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id j14sm2374895oor.33.2021.09.07.11.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 11:33:27 -0700 (PDT)
Received: (nullmailer pid 115718 invoked by uid 1000);
 Tue, 07 Sep 2021 18:33:25 -0000
Date: Tue, 7 Sep 2021 13:33:25 -0500
From: Rob Herring <robh@kernel.org>
To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: display: Add binding for LG.Philips
 SW43101
Message-ID: <YTewdZBsgmvwSTnb@robh.at.kernel.org>
References: <20210901180644.248177-1-y.oudjana@protonmail.com>
 <20210901180644.248177-3-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901180644.248177-3-y.oudjana@protonmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 01, 2021 at 06:07:30PM +0000, Yassine Oudjana wrote:
> Add a device tree binding for LG.Philips SW43101.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../display/panel/lgphilips,sw43101.yaml      | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/lgphilips,sw43101.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/lgphilips,sw43101.yaml b/Documentation/devicetree/bindings/display/panel/lgphilips,sw43101.yaml
> new file mode 100644
> index 000000000000..da049e9f244e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/lgphilips,sw43101.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: BSD-3-Clause

Not the right license(s). checkpatch.pl will tell you.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/lgphilips,sw43101.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LG.Philips SW43101 1080x1920 OLED panel
> +
> +maintainers:
> +  - Yassine Oudjana <y.oudjana@protonmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: lgphilips,sw43101

Looks like this can be added to panel-simple-dsi.yaml instead. Unless it 
has more than 1 power rail as you didn't document any.

> +
> +  port: true
> +  reg: true
> +  reset-gpios: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "lgphilips,sw43101";
> +            reg = <0>;
> +
> +            reset-gpios = <&msmgpio 8 GPIO_ACTIVE_LOW>;
> +
> +            port {
> +                panel_in: endpoint {
> +                    remote-endpoint = <&dsi_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.33.0
> 
> 
> 
