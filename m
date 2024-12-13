Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B71259F0795
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 10:19:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA2210E30F;
	Fri, 13 Dec 2024 09:19:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="f0iUqF3H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B7C10E30F
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 09:19:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AAFE5A42841;
 Fri, 13 Dec 2024 09:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A87C4CED0;
 Fri, 13 Dec 2024 09:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734081591;
 bh=OpDp8wtg392V2T6FnFhTswBHdj/6zqNuIVtWyPvy+28=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f0iUqF3HwJN75ISShX6IWUc85jJ5fJoIxz0rk4h4c79qFl52t0Edk4wWtoMQW+oHj
 SMs8EfwpMJjyp5c/IT4Lvpobe1d1wPIJH0WYePw20buZUWYkCwAKy/3ZI2ZNuYPDDN
 3zuOcAQaZH571Hzo/ySsX3aJ2+KHxfWVxtvW7p6KGbI0J6ZIQ1NX77Sp4D8HO5QIDt
 xXt9fQ225Q6nTxWggd5NgTzS0SIfDs4EwPIzDTgD7SUU0LUmcFjMlytnMGP5AjQ0/M
 4tbhwSXKKRxr1ZYgBH2F8Lh/jxeAlyr95DQNDP21tIYuYQjEkiRK8A51DcrL0jP7fE
 IdgQCSzVKDL/g==
Date: Fri, 13 Dec 2024 10:19:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Eric Anholt <eric@anholt.net>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
 Stefan Wahren <wahrenst@gmx.net>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 2/7] dt-bindings: display: Fix BCM2835 HVS bindings
 for BCM2712
Message-ID: <yz2wl72uagxbwbqnvfrspwy2bgrrljzg7b5zwqcg6llajybnfv@hugmruxvngxr>
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
 <20241212-dt-bcm2712-fixes-v3-2-44a7f3390331@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241212-dt-bcm2712-fixes-v3-2-44a7f3390331@raspberrypi.com>
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

On Thu, Dec 12, 2024 at 06:36:29PM +0000, Dave Stevenson wrote:
> Commit 6cfcbe548a3a ("dt-bindings: display: Add BCM2712 HVS bindings")
> added the compatible string for BCM2712, but missed out that
> the number of interrupts and clocks changed too.
> 
> Update to validate clock and interrupts for the variants.
> 
> Fixes: 6cfcbe548a3a ("dt-bindings: display: Add BCM2712 HVS bindings")
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  .../bindings/display/brcm,bcm2835-hvs.yaml         | 83 ++++++++++++++++++----
>  1 file changed, 69 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
> index f91c9dce2a44..36bf8eec88a6 100644
> --- a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
> +++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
> @@ -20,11 +20,20 @@ properties:
>      maxItems: 1
>  
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 3
> +
> +  interrupt-names:
> +    minItems: 1
> +    maxItems: 3
>  
>    clocks:
> -    maxItems: 1
> -    description: Core Clock
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 2
>  
>  required:
>    - compatible
> @@ -33,17 +42,63 @@ required:
>  
>  additionalProperties: false
>  
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        enum:
> -          - brcm,bcm2711-hvs
> -          - brcm,bcm2712-hvs
> -
> -then:
> -  required:
> -    - clocks
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: brcm,bcm2711-hvs
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Core Clock
> +        interrupts:
> +          maxItems: 1
> +
> +      required:
> +        - clocks
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: brcm,bcm2712-hvs
> +
> +    then:
> +      properties:
> +        clocks:

minItems: 2

> +          maxItems: 2
> +        clock-names:
> +          items:
> +            - const: core
> +            - const: disp
> +        interrupts:
> +          items:
> +            - description: Channel 0 End of frame
> +            - description: Channel 1 End of frame
> +            - description: Channel 2 End of frame
> +        interrupt-names:
> +          items:
> +            - const: ch0-eof
> +            - const: ch1-eof
> +            - const: ch2-eof
> +      required:
> +        - clocks
> +        - clock-names
> +        - interrupt-names

Why requiring last two names? Commit msg does not explain that.

Best regards,
Krzysztof

