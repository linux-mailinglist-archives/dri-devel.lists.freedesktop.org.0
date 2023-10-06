Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7225E7BB79F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 14:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFC110E205;
	Fri,  6 Oct 2023 12:30:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C12B710E205
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 12:30:18 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-53447d0241eso3801435a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 05:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696595417; x=1697200217; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sYSZgor/RBGjf4wuXsOz+ucEbF12Vj/yAHNRuHZ3l+Q=;
 b=jxC8e6FzeAQdFdz6xkmqx2L17Ogw6FCacElflQzObdVHldU1izchH04Yw2JL2tVZOI
 SyfTDvGBbOKJyr92HBnBs+D//1JawGfelNFEHs/xokMhG/2GtwikNl7RnqWc+gLhRl0L
 Wb3vZxBuF+GmTC7RQ4B/siWKffFTnoa3C95h0ovMkDHqRtU+PNghnljJFFTV/FtV6meQ
 /WDTzxl9Y6Hie5TP3vwI5NOGXSBEDQ2CPB34E8bSRYxskgepuYnFiFXgLoIsX1wrmqhr
 co1Yq/ujm4WkRoCWZk6EY387DNIFQVgfvTURXgihIdrY91vCpx0kZJjtoMivt+KcjLj3
 PCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696595417; x=1697200217;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sYSZgor/RBGjf4wuXsOz+ucEbF12Vj/yAHNRuHZ3l+Q=;
 b=sgWmoX24OaNPq6RvZcv7eFq/57mHSHHhd2OYChJJEZm81bEQ2fkliKSJSniDHv7bvE
 qFpS037Zpo/uw4vouDwLnIn0YLAsebSRgcbSnBR1CZC59RLqGIJI4M0XrE8l2EvO+10z
 MngnU54L76FlcI7n7DJqo0BgYUhMej2tYU/2/FKCWZK9jSXAe0kikjS++8Le1IdyTzNe
 qi2ltiYYmyJtjpMpgArK7OGcry95/QQOnBVi1ITHjVYLBg1cqdKNmL/6dQDfEbdn+mC6
 eOk+Jk4SlW42Ku3q8c9QEqPTDlBQEmTYrJ2T0H0j8pCwuHB3PMZUTy31owEGJqvgTiCm
 kH9Q==
X-Gm-Message-State: AOJu0Yy7wT4MGRZdPaR88CpDdH2r28vwD4l6FE6gxufgRw72rHGXgthZ
 0eTE540ZVEwJ84uZoTWLY7Sq6Q==
X-Google-Smtp-Source: AGHT+IHTOw/VY6TBFq65jsChMS223mo3Uv9ez720nz2z/rFj0PF94m9QIFEGrTuIdcUQuzYKV9Ty9Q==
X-Received: by 2002:a50:ee91:0:b0:51e:53eb:88a3 with SMTP id
 f17-20020a50ee91000000b0051e53eb88a3mr6699147edr.25.1696595417011; 
 Fri, 06 Oct 2023 05:30:17 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 v4-20020aa7d9c4000000b0052284228e3bsm2511897eds.8.2023.10.06.05.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 05:30:16 -0700 (PDT)
Date: Fri, 6 Oct 2023 13:30:14 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Subject: Re: [PATCH 1/2] dt-bindings: backlight: add Kinetic KTD2801 binding
Message-ID: <20231006123014.GA96854@aspen.lan>
References: <20231005-ktd2801-v1-0-43cd85b0629a@skole.hr>
 <20231005-ktd2801-v1-1-43cd85b0629a@skole.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231005-ktd2801-v1-1-43cd85b0629a@skole.hr>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Karel Balej <balejk@matfyz.cz>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 05, 2023 at 08:49:08PM +0200, Duje Mihanović wrote:
> Add the dt binding for the Kinetic KTD2801 backlight driver.
>
> Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
> ---
>  .../bindings/leds/backlight/kinetic,ktd2801.yaml   | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd2801.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd2801.yaml
> new file mode 100644
> index 000000000000..970d54bac18e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd2801.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/kinetic,ktd2801.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Kinetic Technologies KTD2801 one-wire backlight
> +
> +maintainers:
> +  - Duje Mihanović <duje.mihanovic@skole.hr>
> +
> +description: |
> +  The Kinetic Technologies KTD2801 is a LED backlight driver controlled
> +  by a single GPIO line. The driver can be controlled with a PWM signal
> +  or by pulsing the GPIO line to set the backlight level. This is called
> +  "ExpressWire".
> +
> +allOf:
> +  - $ref: common.yaml#
> +
> +properties:
> +  compatible:
> +    const: kinetic,ktd2801
> +
> +  enable-gpios:
> +    maxItems: 1

Why "enable"? This is the line we are going to us to bitbang the
ExpressWire protocol. Doesn't that make it a control or data pin?


Daniel.
