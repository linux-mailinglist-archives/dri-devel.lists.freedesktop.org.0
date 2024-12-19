Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF7F9F779F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 09:42:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D65010E47B;
	Thu, 19 Dec 2024 08:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bSVwBsXZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2D510E47B
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 08:42:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0D0A85C6717;
 Thu, 19 Dec 2024 08:41:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8EA9C4CED0;
 Thu, 19 Dec 2024 08:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734597720;
 bh=EkcnPB9WBd/TNqG00+8vwrlF/Hfm2d74IUOXRibreB4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bSVwBsXZOOPUXdDt31Z0SB68MwUpAMHI+qUtla7oQExLQYez0KZvnNrfUsrvp2ESs
 w+n2m/laXsCukY5YwQO6A4kMcLHru0ZgYbCLUSUvgA7nj6tZXUZlFh1ZetxzoaFAQv
 HgjS1uh1MT87iOL39Ky6GtLgF4cyJXgyMs5kca5QA6zflbbqeFyVpZQTRoiu4pkQ16
 k/eTsTQxAL53LWip218huMV7Q3eP0OG1ujQPOSqSwpreuXrMjnLYLiuaQNPo39nFPG
 uNG5GItgnfImkpkd1GeAQwhj/rewb8bULqqaTlNr7EMt4Rh6NvfzBdCCp3tTTYZBS2
 Nh7l6IBxEymEA==
Date: Thu, 19 Dec 2024 09:41:57 +0100
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
Subject: Re: [PATCH v4 2/3] dt-bindings: display: Fix BCM2835 HVS bindings
 for BCM2712
Message-ID: <lzvcaspulvsulbulqinzftt3xtdyro64hi674u2bnkpvbrihri@e2o247mjom5s>
References: <20241218-dt-bcm2712-fixes-v4-0-54cc88b6c229@raspberrypi.com>
 <20241218-dt-bcm2712-fixes-v4-2-54cc88b6c229@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241218-dt-bcm2712-fixes-v4-2-54cc88b6c229@raspberrypi.com>
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

On Wed, Dec 18, 2024 at 02:48:33PM +0000, Dave Stevenson wrote:
> Commit 6cfcbe548a3a ("dt-bindings: display: Add BCM2712 HVS bindings")
> added the compatible string for BCM2712, but missed out that
> the number of interrupts and clocks changed too, and both need to be
> named.
> 
> Update to validate clock, interrupts, and their names for the variants.
> 
> Fixes: 6cfcbe548a3a ("dt-bindings: display: Add BCM2712 HVS bindings")
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  .../bindings/display/brcm,bcm2835-hvs.yaml         | 84 ++++++++++++++++++----
>  1 file changed, 70 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
> index f91c9dce2a44..fd25ee5ce301 100644
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
> @@ -33,17 +42,64 @@ required:
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


clock-names and interrupt-names: false, unless driver needs them but all
this should be explained in the commit msg because it would be a change
to the binding.

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
> +          minItems: 2
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

My previous comment still stands. Reply to people's feedback instead of
ignoring it.

Best regards,
Krzysztof

