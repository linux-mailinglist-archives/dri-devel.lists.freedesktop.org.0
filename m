Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 687B75AEBF0
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 16:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8682D10E68E;
	Tue,  6 Sep 2022 14:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD79210E68E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 14:27:24 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 br15-20020a056830390f00b0061c9d73b8bdso8164771otb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 07:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=0oc/efpNyK02TA049vRdVuq+a16ZNo/nBU3UNBlbLlA=;
 b=G5ah5A6yLGDkJmUTG92As1XstileBCjc+paGFnm69jZwDUM7ey2j59z4q7ryRXMENy
 6ELFYkCJtjGBchN2iH5vU3g16MDBiShwV+MdKNIOnIEvNktBuaRQ6W2tcQdh5SfXBgZX
 ojYTpQ/jIzmT3spoGTbnprwDWwQktNJv5Wj+3kt/xEtA1SE8gkWRG/knfqdEcbmtdthY
 OMgG2vxGx7RJqBVStOuhvwKWOYGDDB1bx4u/2WtriqftTeDvf11MNDgF/uDInEwMoYtD
 ZTVFvbFa/ZtcVLcQlseDFwWzWibY8pBKUFusVofOW0OkMSE3cXgfTK1rohLm3VZfzDzo
 jLgg==
X-Gm-Message-State: ACgBeo3fOreDCQuY27gEfLOMAhEiyy5L6bWUNA2/q8S0jIxeSzGPcE6K
 xxfpNqbmwFt7THKB2U9O1g==
X-Google-Smtp-Source: AA6agR5MNLEe98jQgQIHK50PgdC2yea2wXhfxxelbBN17o+lzcVRNee4Gc6KiaqLgekEcrc451ilLw==
X-Received: by 2002:a05:6830:1281:b0:636:d7e9:1906 with SMTP id
 z1-20020a056830128100b00636d7e91906mr21706186otp.116.1662474443952; 
 Tue, 06 Sep 2022 07:27:23 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 k5-20020a056830168500b0063922f00ee2sm5961637otr.39.2022.09.06.07.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 07:27:22 -0700 (PDT)
Received: (nullmailer pid 439485 invoked by uid 1000);
 Tue, 06 Sep 2022 14:27:21 -0000
Date: Tue, 6 Sep 2022 09:27:21 -0500
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: reserved-memory: Support framebuffer
 reserved memory
Message-ID: <20220906142721.GA427176-robh@kernel.org>
References: <20220905163300.391692-1-thierry.reding@gmail.com>
 <20220905163300.391692-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220905163300.391692-3-thierry.reding@gmail.com>
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
 dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 05, 2022 at 06:32:56PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Document the "framebuffer" compatible string for reserved memory nodes
> to annotate reserved memory regions used for framebuffer carveouts.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/reserved-memory/framebuffer.yaml | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml b/Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml
> new file mode 100644
> index 000000000000..80574854025d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reserved-memory/framebuffer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: /reserved-memory framebuffer node bindings
> +
> +maintainers:
> +  - devicetree-spec@vger.kernel.org
> +
> +allOf:
> +  - $ref: "reserved-memory.yaml"

Don't need quotes.

> +
> +properties:
> +  compatible:
> +    const: framebuffer
> +    description: >
> +      This indicates a region of memory meant to be used as a framebuffer for
> +      a set of display devices. It can be used by an operating system to keep
> +      the framebuffer from being overwritten and use it as the backing memory
> +      for a display device (such as simple-framebuffer).

I'm on the fence whether we need this. It doesn't really add anything 
because 'simple-framebuffer' will reference this node and you can find 
it that way. I guess a bootloader may not setup 'simple-framebuffer', 
but then it should probably not have this node either.

On the flip side, better to have compatibles than not to identify nodes.

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |

Use '/ {' to skip the boilerplate causing the error.

> +      chosen {
> +        framebuffer {
> +          compatible = "simple-framebuffer";
> +          memory-region = <&fb>;
> +        };
> +      };
> +
> +      reserved-memory {
> +          #address-cells = <1>;
> +          #size-cells = <1>;
> +          ranges;
> +
> +          fb: framebuffer@80000000 {
> +              compatible = "framebuffer";
> +              reg = <0x80000000 0x007e9000>;
> +          };
> +      };
> +
> +...
> -- 
> 2.37.2
> 
> 
