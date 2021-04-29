Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAD436EF4A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 20:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DC76F417;
	Thu, 29 Apr 2021 18:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B296F417;
 Thu, 29 Apr 2021 18:04:37 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id z7so15137521oix.9;
 Thu, 29 Apr 2021 11:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BGXc8n8dJgWIvZ1rgn/mp/0YVMWp8ZgJFpSUhA1n/t0=;
 b=AYGg/FurntqjSPcLeyEdPk8Mc/ZwRiAYROEmhowChAYsxV65AtPANFdRfcrrNKnCRL
 NXN++HShy3+M1CyogZyob/ENkU443aXeYV1QI/6ZTGU3hxz6HHDbbKQGwJtMRSaFltlG
 TFG8YJ78mdVGoWEUZkWeoZUF5boDPSZI973HysTN+zQtDpdWZqfUT6tgPMECa88HmGI3
 +WzsZ0SQViXpxo//qw98tuXJYcv1Wck9ucwbYr0Ks6MUbTu/nGhI3rtHxbz1p5VJCgHI
 gbiFJIo9kVQtHgWVUpfts5/p1hjr4GlXctTt9UWINwhAXy+JoWXN1mgx6I3flylb6VB9
 dDIQ==
X-Gm-Message-State: AOAM532+9Be7X68YKnYye9Db8t6AKfzB4qDc+JwJnSeqFYBlxN5tAN0o
 rS/px2+HOHJas3eCNuTlFw==
X-Google-Smtp-Source: ABdhPJxsvgDl4cmyGSZAjcy3TO96h2Gk37C2SsrChdAtgKojOCkhhcJuqRmLaS8oiHIGCS+V5p6asA==
X-Received: by 2002:aca:ed12:: with SMTP id l18mr7861083oih.24.1619719477238; 
 Thu, 29 Apr 2021 11:04:37 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q1sm114127otm.26.2021.04.29.11.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 11:04:36 -0700 (PDT)
Received: (nullmailer pid 1505463 invoked by uid 1000);
 Thu, 29 Apr 2021 18:04:35 -0000
Date: Thu, 29 Apr 2021 13:04:35 -0500
From: Rob Herring <robh@kernel.org>
To: Rajeev Nandan <rajeevny@codeaurora.org>
Subject: Re: [v3 1/2] dt-bindings: backlight: add DisplayPort aux backlight
Message-ID: <20210429180435.GA1385465@robh.at.kernel.org>
References: <1619416756-3533-1-git-send-email-rajeevny@codeaurora.org>
 <1619416756-3533-2-git-send-email-rajeevny@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1619416756-3533-2-git-send-email-rajeevny@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, mkrishn@codeaurora.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, seanpaul@chromium.org,
 abhinavk@codeaurora.org, kalyan_t@codeaurora.org, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 26, 2021 at 11:29:15AM +0530, Rajeev Nandan wrote:
> Add bindings for DisplayPort aux backlight driver.
> 
> Changes in v2:
> - New
> 
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> ---
>  .../bindings/leds/backlight/dp-aux-backlight.yaml  | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
> new file mode 100644
> index 00000000..0fa8bf0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/dp-aux-backlight.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: DisplayPort aux backlight driver bindings
> +
> +maintainers:
> +  - Rajeev Nandan <rajeevny@codeaurora.org>
> +
> +description:
> +  Backlight driver to control the brightness over DisplayPort aux channel.
> +
> +allOf:
> +  - $ref: common.yaml#
> +
> +properties:
> +  compatible:
> +    const: dp-aux-backlight
> +
> +  ddc-i2c-bus:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle to the system I2C controller connected to the DDC bus used
> +      for the DisplayPort AUX channel.
> +
> +  enable-gpios:
> +    maxItems: 1
> +    description: GPIO specifier for backlight enable pin.
> +
> +  max-brightness: true
> +
> +required:
> +  - compatible
> +  - ddc-i2c-bus
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    backlight {
> +        compatible = "dp-aux-backlight";
> +        ddc-i2c-bus = <&sn65dsi86_bridge>;
> +        enable-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;

So the DDC bus is connected to a backlight and also a panel? This 
binding is not reflecting the h/w, but rather what you want for some 
driver.

There's only one thing here and that's an eDP panel which supports 
backlight control via DP aux channel. You can figure all that out from 
the panel's compatible and/or reading the EDID. 

You might also be interested in this thread:

https://lore.kernel.org/lkml/YIKsDtjcIHGNvW0u@orome.fritz.box/

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
