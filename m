Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D2D11EE85
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 00:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241E188784;
	Fri, 13 Dec 2019 23:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E846E88784
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 23:29:13 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id a124so2044229oii.13
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:29:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DXJwQPhSwM1+cucOFg3CYds/NSYGmXNcRDzsn2xt8Tc=;
 b=Z3ThwuHrYWFMKHbCrLYJW9cuXyS9xnxv460r3FXnJexYd0aghgd7OaWREIFTSErlrG
 g7FuRkFFwCwMX6zwQL4ZQq9+z2zwAUNHnEKG4Q4GQ80SP+xVKhq4yh4eMwxn4lN30rgB
 HP+SG01XU8KnGE1vCrdRxDIYwSC9OATkwS0hhTRHBuRe173H2paTuqMAWKMmqELS5Fah
 uD+ZZErWBHS1R0DRZXBFkagbcLbZ/jbVBuydaJoC0aB3C8gz1e27ITZqFpI3l9cNBbJm
 WV/pPduIWFsdJOdA7XVwA0HFPi9Fjs/HGl4C5NuBlcclBJEch+aarF/z+g3Jg5MVIlWG
 LXgA==
X-Gm-Message-State: APjAAAUI0IAb6vS9EI3ywNC7paeBewA+CVt2Gdj2iGVa5fdYzwlAnd81
 lzGo9z3L9au9I+PCLENp7g==
X-Google-Smtp-Source: APXvYqyFi7kee8lkyjSw4gkTsHA5YEMwIJOCDy42tK/sBpC3CtzjbDjua0Z+vcUr1fu145eAoBD+/A==
X-Received: by 2002:aca:5ad4:: with SMTP id o203mr8130704oib.73.1576279753143; 
 Fri, 13 Dec 2019 15:29:13 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y139sm3906864oie.18.2019.12.13.15.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 15:29:12 -0800 (PST)
Date: Fri, 13 Dec 2019 17:29:11 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 2/3] dt-bindings: panel: Document Frida FRD350H54004
 LCD panel
Message-ID: <20191213232911.GA24142@bogus>
References: <20191202154123.64139-1-paul@crapouillou.net>
 <20191202154123.64139-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191202154123.64139-2-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, od@zcrc.me,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 02, 2019 at 04:41:22PM +0100, Paul Cercueil wrote:
> Add bindings documentation for the Frida 3.5" (320x240 pixels) 24-bit
> TFT LCD panel.
> 
> v2: Switch documentation from plain text to YAML
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../display/panel/frida,frd350h54004.yaml     | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/frida,frd350h54004.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/frida,frd350h54004.yaml b/Documentation/devicetree/bindings/display/panel/frida,frd350h54004.yaml
> new file mode 100644
> index 000000000000..a29c3daf0c78
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/frida,frd350h54004.yaml
> @@ -0,0 +1,31 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings please:

(GPL-2.0-only OR BSD-2-Clause)

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/frida,frd350h54004.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Frida 3.5" (320x240 pixels) 24-bit TFT LCD panel
> +
> +maintainers:
> +  - Paul Cercueil <paul@crapouillou.net>
> +  - Thierry Reding <thierry.reding@gmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: frida,frd350h54004
> +
> +  power-supply: true
> +  backlight: true
> +  enable-gpios: true
> +  port: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - power-supply
> +
> +...
> -- 
> 2.24.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
