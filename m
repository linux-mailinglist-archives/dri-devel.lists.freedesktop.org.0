Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 552B726BE0B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 09:31:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B3DB6E9C2;
	Wed, 16 Sep 2020 07:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C33A6E984
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 04:29:44 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id w25so5445534otk.8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 21:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CbpPK/Siu+d9dTl8nIly6n0m2jPY9tJNIXsIgkbDIw4=;
 b=PHMmuZn8tH1B1bgMVfEoXDoPiabkrcZ6bbZGs9xDoF0tLy2NlnrQkkqBE8HK17mmkY
 EAVs1/DLqAl0Vy0+xa40q0htbrPg3qvNcw7g1ijYV6d9IaA8QKZmCPaipsta3RP4X+xy
 gp8P37uvp7V0sWhUIrdnx7UHVa8wzWnnaU6Ocm6ZflBzlG+4UDKykJHP2eXH0QVsjIjC
 S0j6gFks8JwCKAnYzdySzaIgCsnEIkl4oSnRg9/p1PrjTySy5rC0+x5NQwI1PCZjW/lC
 +rUhUDub8AJwUFWeg8KI2UK+VSoLECoyaRP/BLIcLHPWHsUR7K/s1hI1+L4m03EN1wwG
 yPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CbpPK/Siu+d9dTl8nIly6n0m2jPY9tJNIXsIgkbDIw4=;
 b=Te3IcjWfypySwdjyEcVjVzNw2ETIrSmBEX0kTT9LKcAbGpcROdMPE+m19+Gj/si356
 pw3E/s/ZYBSahMbwmDAPGiUo1r9KFrvnx2umHR1ubmY8apK+v8J+hg8fvCkn8aG0K/Vi
 e0SAzhy2YqGBtlru62xQnuepkuL5Qxvc4xdQ5W6o/k4abuXFZNB/D6tLnLDkitposmsD
 X8/8YwzMaoEenHE1JgFoGNzBkb8Xcs2QJZhL48er3FKDdoDQaTT/aTsMMrJub/cyDF3N
 qip+RFwIANGASwviUe9b9uASLHwTgleOdR3iTdUTW9tQdSaBtaoGc+P7Ag+5ZmDhBoFZ
 FxoA==
X-Gm-Message-State: AOAM5307V0HlNfuRfeWGiCnPy9r/NiUWi3SwJlkKww23LKTE2fkuCYy2
 JWanqxgJ8X9V2EBw6qkm58Rymw==
X-Google-Smtp-Source: ABdhPJzRiqydG/HYSbv1upl3PnSI4mgAlWvKqm4Ls2OyNROQKt+mgWEtMm3v8Ebm1p+C9lhBgSlkTA==
X-Received: by 2002:a05:6830:1ac8:: with SMTP id
 r8mr14353983otc.70.1600230582598; 
 Tue, 15 Sep 2020 21:29:42 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:7cad:6eff:fec8:37e4])
 by smtp.gmail.com with ESMTPSA id c124sm8557751oib.22.2020.09.15.21.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 21:29:41 -0700 (PDT)
Date: Tue, 15 Sep 2020 23:29:39 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH v7 1/2] dt-bindings: display: panel: Add bindings for
 Novatek nt36672a
Message-ID: <20200916042939.GC1893@yoga>
References: <20200902064407.30712-1-sumit.semwal@linaro.org>
 <20200902064407.30712-2-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200902064407.30712-2-sumit.semwal@linaro.org>
X-Mailman-Approved-At: Wed, 16 Sep 2020 07:31:48 +0000
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed 02 Sep 01:44 CDT 2020, Sumit Semwal wrote:

> Novatek nt36672a is a display driver IC that can drive DSI panel. It
> is also present in the Tianma video mode panel, which is a FHD+ panel
> with a resolution of 1080x2246 and 6.18 inches size. It is found in
> some of the Poco F1 phones.
> 
> This patch adds the display driver for the IC, with support added for
> this tianma fhd video mode panel.
> 
> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> 
> ---
> v2: remove ports node, making port@0 directly under panel@0 node.
> v3: updated to replace port@0 to just 'port'.
> v5: renamed to novatek,nt36672a, since the binding is for the IC and not
>       the panel.
> v6: v5 review comments incorporated.
>     - added enum for the compatible part, since it can be extended in
>       future.
>     - few cosmetic updates.
> ---
>  .../display/panel/novatek,nt36672a.yaml       | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
> new file mode 100644
> index 000000000000..d2170de6b723
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/novatek,nt36672a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Novatek NT36672A based DSI display Panels
> +
> +maintainers:
> +  - Sumit Semwal <sumit.semwal@linaro.org>
> +
> +description: |
> +  The nt36672a IC from Novatek is a generic DSI Panel IC used to drive dsi
> +  panels.
> +  Right now, support is added only for a Tianma FHD+ LCD display panel with a
> +  resolution of 1080x2246. It is a video mode DSI panel.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +         - tianma,fhd-video
> +      - const: novatek,nt36672a
> +    description: This indicates the panel manufacturer of the panel that is
> +      in turn using the NT36672A panel driver. This compatible string
> +      determines how the NT36672A panel driver is configured for the indicated
> +      panel. The novatek,nt36672a compatible shall always be provided as a fallback.
> +
> +  reset-gpios:
> +    description: phandle of gpio for reset line - This should be 8mA, gpio
> +      can be configured using mux, pinctrl, pinctrl-names (active high)
> +
> +  vddio-supply:
> +    description: phandle of the regulator that provides the supply voltage
> +      Power IC supply
> +
> +  vddpos-supply:
> +    description: phandle of the positive boost supply regulator
> +
> +  vddneg-supply:
> +    description: phandle of the negative boost supply regulator
> +
> +  reg: true
> +  port: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - vddi0-supply
> +  - vddpos-supply
> +  - vddneg-supply
> +  - reset-gpios
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |+
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "tianma,fhd-video", "novatek,nt36672a";
> +            reg = <0>;
> +            vddi0-supply = <&vreg_l14a_1p88>;
> +            vddpos-supply = <&lab>;
> +            vddneg-supply = <&ibb>;
> +
> +            reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            port {
> +                tianma_nt36672a_in_0: endpoint {
> +                    remote-endpoint = <&dsi0_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.28.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
