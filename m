Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A4E585E81
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jul 2022 12:50:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF81CBC9CC;
	Sun, 31 Jul 2022 10:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5BABC9BA
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jul 2022 10:49:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DBBDE60BC9;
 Sun, 31 Jul 2022 10:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF50C433C1;
 Sun, 31 Jul 2022 10:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659264588;
 bh=PUNN+rCT3YXN5pehv7cULkzpQnreNsgjU2b4qW3dOto=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bejCl17Yd2Tvvo8nEdqDOHsy6MvrBm2YL4gdQtABzahCWd1IyD+yGqMbF12AxcAWe
 qAygk10Ha3H7fLFiBYQSB4iWD8kP2ijEKXmypi14eeKaUCHteH4bhwLNmaBA6Bp2vT
 niOdnThWuwAMSrAFmciEp7SwuJkvJCdV+xSsz1NR8TnBHwOFi3s9AmyHhKwNiUfI87
 T1Eg1ckCHjMqwRXwMk+cHD9wlP1VYfhCv1AU0WOBX5W9xX7nAp1xgR06+kSBUCF73O
 oDuiVbu2X4nk0Ec512FsjObYmYNNDOTvLjek+grtmp63BtCjYzqdbVEJqFNsla+Vqc
 Rw/q6SHFNAfjA==
Date: Sun, 31 Jul 2022 11:59:55 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/1] spi/panel: dt-bindings: drop CPHA and CPOL from
 common properties
Message-ID: <20220731115955.1977f429@jic23-huawei>
In-Reply-To: <20220722191539.90641-2-krzysztof.kozlowski@linaro.org>
References: <20220722191539.90641-1-krzysztof.kozlowski@linaro.org>
 <20220722191539.90641-2-krzysztof.kozlowski@linaro.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Marek Belisko <marek@goldelico.com>, Sam Ravnborg <sam@ravnborg.org>,
 Pratyush Yadav <p.yadav@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Jul 2022 21:15:39 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> The spi-cpha and spi-cpol properties are device specific and should be
> accepted only if device really needs them.  Drop them from common
> spi-peripheral-props.yaml schema, mention in few panel drivers which use
> them and include instead in the SPI controller bindings.  The controller
> bindings will provide CPHA/CPOL type validation and one place for
> description.  Each device schema must list the properties if they are
> applicable.
> 
> Suggested-by: Jonathan Cameron <jic23@kernel.org>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

This seems like a good solution to me.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  .../bindings/display/panel/lgphilips,lb035q02.yaml    |  3 +++
>  .../bindings/display/panel/samsung,ld9040.yaml        |  3 +++
>  .../bindings/display/panel/sitronix,st7789v.yaml      |  3 +++
>  .../devicetree/bindings/display/panel/tpo,td.yaml     |  3 +++
>  .../devicetree/bindings/spi/spi-controller.yaml       | 11 +++++++++++
>  .../devicetree/bindings/spi/spi-peripheral-props.yaml | 10 ----------
>  6 files changed, 23 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml b/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
> index 5e4e0e552c2f..628c4b898111 100644
> --- a/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
> @@ -21,6 +21,9 @@ properties:
>    enable-gpios: true
>    port: true
>  
> +  spi-cpha: true
> +  spi-cpol: true
> +
>  required:
>    - compatible
>    - enable-gpios
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml
> index d525165d6d63..c0fabeb38628 100644
> --- a/Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml
> @@ -42,6 +42,9 @@ properties:
>    panel-height-mm:
>      description: physical panel height [mm]
>  
> +  spi-cpha: true
> +  spi-cpol: true
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
> index 9e1d707c2ace..d984b59daa4a 100644
> --- a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
> @@ -23,6 +23,9 @@ properties:
>    backlight: true
>    port: true
>  
> +  spi-cpha: true
> +  spi-cpol: true
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/display/panel/tpo,td.yaml b/Documentation/devicetree/bindings/display/panel/tpo,td.yaml
> index f902a9d74141..e8c8ee8d7c88 100644
> --- a/Documentation/devicetree/bindings/display/panel/tpo,td.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/tpo,td.yaml
> @@ -28,6 +28,9 @@ properties:
>    backlight: true
>    port: true
>  
> +  spi-cpha: true
> +  spi-cpol: true
> +
>  required:
>    - compatible
>    - port
> diff --git a/Documentation/devicetree/bindings/spi/spi-controller.yaml b/Documentation/devicetree/bindings/spi/spi-controller.yaml
> index 678cee68b52a..655713fba7e2 100644
> --- a/Documentation/devicetree/bindings/spi/spi-controller.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-controller.yaml
> @@ -95,6 +95,17 @@ patternProperties:
>      type: object
>      $ref: spi-peripheral-props.yaml
>  
> +    properties:
> +      spi-cpha:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description:
> +          The device requires shifted clock phase (CPHA) mode.
> +
> +      spi-cpol:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description:
> +          The device requires inverse clock polarity (CPOL) mode.
> +
>      required:
>        - compatible
>        - reg
> diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> index 5e32928c4fc3..2349f83c07f3 100644
> --- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> @@ -34,16 +34,6 @@ properties:
>      description:
>        The device requires 3-wire mode.
>  
> -  spi-cpha:
> -    $ref: /schemas/types.yaml#/definitions/flag
> -    description:
> -      The device requires shifted clock phase (CPHA) mode.
> -
> -  spi-cpol:
> -    $ref: /schemas/types.yaml#/definitions/flag
> -    description:
> -      The device requires inverse clock polarity (CPOL) mode.
> -
>    spi-cs-high:
>      $ref: /schemas/types.yaml#/definitions/flag
>      description:

