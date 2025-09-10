Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E06D8B515D7
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 13:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3FE810E8E5;
	Wed, 10 Sep 2025 11:35:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Oyt3iiv6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B7A10E8E5
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 11:35:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9055C433A6;
 Wed, 10 Sep 2025 11:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5BAC4CEF0;
 Wed, 10 Sep 2025 11:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757504142;
 bh=i6Z2NDahm7CLx4TBaP4siTR23mUGVC+/9EIqEzuOL68=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Oyt3iiv6aPyQ25GkTyqU4y24qMajRCx/pzq+ugEir/izBj5M7pyRsA8OZStiNfH8y
 UnR9dAoBcF5GV5vSuAXDUJr2EGPrBj5A8AcXCvsuQnRCMQtzH1NbxMGgX3hr1dr1QT
 /RczUH9k53Mvt102cepRNnuIww15Os+glyKHgI+W2BsLtN1OxDVm47V5anfYpMdvSp
 hX8UCpSvTMcDRrLtuB3xXerfO6IO8xFvIcjxKS/v8Ihv7d7Sy4Y0wsMAAW9Qd1RS9w
 HEEXr4YbiFH0M7PEFAwIkTiFwEH4/D0rw/MyQsqHpfFZIaS5QJKVnqvyfV7j5xTptL
 xL6VO/GfuLEAw==
Date: Wed, 10 Sep 2025 13:35:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: display: sitronix,st7920: Add DT
 schema
Message-ID: <20250910-ant-of-angelic-vastness-b5caa5@kuoka>
References: <20250909-st7920-v2-0-409f4890fb5f@gmail.com>
 <20250909-st7920-v2-2-409f4890fb5f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250909-st7920-v2-2-409f4890fb5f@gmail.com>
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

On Tue, Sep 09, 2025 at 06:52:44PM +0200, Iker Pedrosa wrote:
> Add binding for Sitronix ST7920 display.
> 
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
>  .../bindings/display/sitronix,st7920.yaml          | 52 ++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 

Please organize the patch documenting compatible (DT bindings) before their user.
See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46

...

> +  reg:
> +    description: The chip-select number for the device on the SPI bus.

Drop description, obvious/redundant.

> +    maxItems: 1
> +
> +  spi-max-frequency:
> +    maximum: 600000
> +

I don't see how my comment about supply was addressed. You never
responded, nothing explained in the changelog, nothing explained in the
commit msg.

> +required:
> +  - compatible
> +  - reg
> +  - spi-max-frequency
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    // Example: ST7920 connected to an SPI bus

Drop comment.

> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        display@0 {
> +            compatible = "sitronix,st7920";
> +            reg = <0>;
> +            spi-max-frequency = <600000>;
> +            spi-cs-high;
> +        };
> +    };
> 
> -- 
> 2.51.0
> 
