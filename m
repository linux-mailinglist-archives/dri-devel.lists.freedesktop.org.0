Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB979F778E
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 09:38:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C2FD10E29E;
	Thu, 19 Dec 2024 08:38:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PFfIWyK6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880A610E29E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 08:38:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DBABAA41F59;
 Thu, 19 Dec 2024 08:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA01C4CECE;
 Thu, 19 Dec 2024 08:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734597526;
 bh=z973hMVDazsCaCVq8CENGRtlOUvc9ByRfPeM4Ms7dU0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PFfIWyK61aTMR54PQitKrC2N0LdJnnRc9g/5O97Q2QYgZuPDulZXoqcwcO0IlnNLh
 TYDzDy2UD3Y68bObfHSnA3lC9/76U8eKKTgALWeU/Kbws9yxPKEy69eRz+JTbGclw+
 FbTY+dDeSyqllmVgCWuS+GD/U/8j37bRPvROwG4ay/3R2uDoRpb2n+d5BAEpuP/TJj
 Ie3pwJbpc0O7+DQsW2bmEpiu1cXDIMOq/ayX6Bhjqvz5NPFVO525izpn0AV+7EvELL
 UcnH5t3nuA/LTsr207BNNHzb7NwK90S58hjjFHRUbETCt3qr2YoWdpGN1j3ghmJ92B
 K6ztB/94y6/Og==
Date: Thu, 19 Dec 2024 09:38:42 +0100
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
Subject: Re: [PATCH v4 1/3] dt-bindings: display: bcm2711-hdmi: Add interrupt
 details for BCM2712
Message-ID: <7sgvdwyu2o7kli4eslg6o4mmzystoszrd6srw5pp6ikrmgq5ox@bvjz7j4d7v3l>
References: <20241218-dt-bcm2712-fixes-v4-0-54cc88b6c229@raspberrypi.com>
 <20241218-dt-bcm2712-fixes-v4-1-54cc88b6c229@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241218-dt-bcm2712-fixes-v4-1-54cc88b6c229@raspberrypi.com>
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

On Wed, Dec 18, 2024 at 02:48:32PM +0000, Dave Stevenson wrote:
> Commit 62948c62abca ("dt-bindings: display: Add BCM2712 HDMI bindings")
> added the compatible strings for BCM2712, but missed out that the
> number of interrupts changed.
> 
> Update the schema to include the interrupt requirements.
> 
> Fixes: 62948c62abca ("dt-bindings: display: Add BCM2712 HDMI bindings")
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  .../bindings/display/brcm,bcm2711-hdmi.yaml        | 81 ++++++++++++++++++----
>  1 file changed, 67 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> index 6d11f5955b51..83c058728ef1 100644
> --- a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> @@ -56,22 +56,12 @@ properties:
>        - const: cec
>  
>    interrupts:
> -    items:
> -      - description: CEC TX interrupt
> -      - description: CEC RX interrupt
> -      - description: CEC stuck at low interrupt
> -      - description: Wake-up interrupt
> -      - description: Hotplug connected interrupt
> -      - description: Hotplug removed interrupt
> +    minItems: 5
> +    maxItems: 6
>  
>    interrupt-names:
> -    items:
> -      - const: cec-tx
> -      - const: cec-rx
> -      - const: cec-low
> -      - const: wakeup
> -      - const: hpd-connected
> -      - const: hpd-removed
> +    minItems: 5
> +    maxItems: 6
>  
>    ddc:
>      $ref: /schemas/types.yaml#/definitions/phandle
> @@ -112,6 +102,66 @@ required:
>  
>  additionalProperties: false
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - brcm,bcm2711-hdmi0
> +              - brcm,bcm2711-hdmi1
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: CEC TX interrupt
> +            - description: CEC RX interrupt
> +            - description: CEC stuck at low interrupt
> +            - description: Wake-up interrupt
> +            - description: Hotplug connected interrupt
> +            - description: Hotplug removed interrupt
> +        interrupt-names:
> +          items:
> +            - const: cec-tx
> +            - const: cec-rx
> +            - const: cec-low
> +            - const: wakeup
> +            - const: hpd-connected
> +            - const: hpd-removed
> +
> +

Only one blank line

> +      required:
> +        - interrupts
> +        - interrupt-names

But anyway this is unusual. Why this was added? Nothing in commit msg
explains this.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - brcm,bcm2712-hdmi0
> +              - brcm,bcm2712-hdmi1
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: CEC TX interrupt
> +            - description: CEC RX interrupt
> +            - description: CEC stuck at low interrupt
> +            - description: Hotplug connected interrupt
> +            - description: Hotplug removed interrupt
> +        interrupts-names:
> +          items:
> +            - const: cec-tx
> +            - const: cec-rx
> +            - const: cec-low
> +            - const: hpd-connected
> +            - const: hpd-removed
> +
> +      required:
> +        - interrupts
> +        - interrupt-names

Same question.

> +
>  examples:
>    - |
>      hdmi0: hdmi@7ef00700 {
> @@ -136,6 +186,9 @@ examples:
>                      "hd";
>          clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
>          clock-names = "hdmi", "bvb", "audio", "cec";
> +        interrupts = <0>, <1>, <2>, <3>, <4>, <5>;
> +        interrupt-names = "cec-tx", "cec-rx", "cec-low", "wakeup",
> +                "hpd-connected", "hpd-removed";

Fix alignment with opening " from earlier line (see DTS coding style).

Best regards,
Krzysztof

