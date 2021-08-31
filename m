Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B523FC92E
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 15:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EFE789FDB;
	Tue, 31 Aug 2021 13:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0357B89FDB
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 13:59:30 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id h133so24442630oib.7
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 06:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Pc6KfUdjMc8QEHIil1UQVUj3n0u1lSzF/AXdD89eq1o=;
 b=ZClPRXN6Q3+TZi+l4Uh4KizNCZGGUgJt4I2WXIkphPF4//YESl684jNA8IGs29X3dz
 KwIIeKBFmPxrup2TJ/aZ01U0RLxud9uF+cccs1Iczd1SQ5l98ZJhcJQBamlUUukvY4V8
 emSTaeiyQopGKhgLeZSG/2T+aq4qcJlrwFjzyx9k20YQ6Gwj/kiRg2aVBUqbuUt+Nwiw
 yn65TddSMAVfIEvIPTiyiKcTrqr9M2ivrcCxNzeMDwHG+0rJi6IVE/ww3nrKtMyqmg96
 u2ZG8TwNXN63EohqWq9UXuTg0T/hSkpmpyHq1cAZpgllnkIho4k+Kziqd/vKzbViTnx4
 O4Zg==
X-Gm-Message-State: AOAM533j0I16yTfQKMHkp73N3IwAqkp5qdrVTJRWKGism+Vh2e5J0oG+
 1sqzXQDi3R3MOg0oT+Eleg==
X-Google-Smtp-Source: ABdhPJxN5eTaWdeT8T1E0xvDyOiCmMJZDshPCi5xRlCx4p0/jKRlNwUg4mRaYb042F4HlZqxN/2kiw==
X-Received: by 2002:aca:1802:: with SMTP id h2mr3246052oih.146.1630418369985; 
 Tue, 31 Aug 2021 06:59:29 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id n130sm3562611oif.32.2021.08.31.06.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 06:59:29 -0700 (PDT)
Received: (nullmailer pid 75468 invoked by uid 1000);
 Tue, 31 Aug 2021 13:59:28 -0000
Date: Tue, 31 Aug 2021 08:59:28 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Christophe Branchereau <cbranchereau@gmail.com>, list@opendingux.net,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display/panel: Add AUO A030JTN01
Message-ID: <YS41wPKzZkq8Z5jo@robh.at.kernel.org>
References: <20210828112640.7248-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210828112640.7248-1-paul@crapouillou.net>
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

On Sat, Aug 28, 2021 at 12:26:39PM +0100, Paul Cercueil wrote:
> Add binding for the AUO A030JTN01 panel, which is a 320x480 3.0" 4:3
> 24-bit TFT LCD panel with non-square pixels and a delta-RGB 8-bit
> interface.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../bindings/display/panel/auo,a030jtn01.yaml | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml

This appears to be panel-simple.yaml plus 'reg' (and potentially other 
SPI properties). Perhaps rename to panel-simple-spi.yaml? Maybe there's 
others already?

> 
> diff --git a/Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml b/Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml
> new file mode 100644
> index 000000000000..21c9d62e3625
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/auo,a030jtn01.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AUO A030JTN01 3.0" (320x480 pixels) 24-bit TFT LCD
> +
> +description: |
> +  The panel must obey the rules for a SPI slave device as specified in
> +  spi/spi-controller.yaml
> +
> +maintainers:
> +  - Paul Cercueil <paul@crapouillou.net>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: auo,a030jtn01
> +
> +  backlight: true
> +  port: true
> +  power-supply: true
> +  reg: true
> +  reset-gpios: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-supply
> +  - reset-gpios
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    panel@0 {
> +      compatible = "auo,a030jtn01";
> +      reg = <0>;
> +
> +      spi-max-frequency = <10000000>;
> +
> +      reset-gpios = <&gpe 4 GPIO_ACTIVE_LOW>;
> +      power-supply = <&lcd_power>;
> +
> +      backlight = <&backlight>;
> +
> +      port {
> +        panel_input: endpoint {
> +          remote-endpoint = <&panel_output>;
> +        };
> +      };
> +    };
> -- 
> 2.33.0
> 
> 
