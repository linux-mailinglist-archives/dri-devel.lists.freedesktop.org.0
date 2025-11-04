Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F670C2F9E6
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 08:30:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4241B10E086;
	Tue,  4 Nov 2025 07:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s/H7G7Nj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65EB710E086
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 07:30:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 267F240900;
 Tue,  4 Nov 2025 07:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70578C4CEF8;
 Tue,  4 Nov 2025 07:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762241439;
 bh=FYc4ZiYYxtHCsGxHWLiNUb6waNPfZYfSpHrij9pfVEk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s/H7G7NjSKeDBXViihoB12JOvfdrQyfO9//RG4Fm2gg9EbHG9idT0lmSQh5ADXkJo
 2y2zORuy9FCw8haXVlB7XLXPsqFC+xITKnIYzQTMSikav0oNeKdSJjFSujtKm4q1lL
 0xoKs2ga1cRQyLAYt+mIQKmrZg6Dhval/huZyZtp8CMWyhLkxTNqGPhNo+77GuHEyf
 A29e8eRMzwJIXwjLufiRFlb7qwNB6RPHp1B2vIFHajr0bGu//2gXPfs6D30bLnJkKK
 qEH5wZxi8dLqknBz9ixCq1FyTjtO77PQenNM1Ly48x5YqxHvVB2iNep6aCvLjNG8TO
 NQlvC3isX123g==
Date: Tue, 4 Nov 2025 08:30:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Junjie Cao <caojunjie650@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Helge Deller <deller@gmx.de>, 
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Pengyu Luo <mitltlatltl@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: backlight: Add Awinic AW99706
 backlight
Message-ID: <20251104-dancing-panda-of-patience-49bcc7@kuoka>
References: <20251103110648.878325-1-caojunjie650@gmail.com>
 <20251103110648.878325-2-caojunjie650@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251103110648.878325-2-caojunjie650@gmail.com>
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

On Mon, Nov 03, 2025 at 07:06:47PM +0800, Junjie Cao wrote:
> From: Pengyu Luo <mitltlatltl@gmail.com>
> 
> Add Awinic AW99706 backlight binding documentation.
> 
> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>

Messed DCO chain. This wasn't here, so you must have altered v1 to add
some weird change.

This is a blocker, please read carefully submitting patches and DCO.

> ---
> Changes in v2:
> - use proper units for properties (Krzysztof)
> - drop non-fixed properties (Krzysztof)
> - add properties(max-brightness, default-brightness) (Krzysztof)
> - Link to v1: https://lore.kernel.org/linux-leds/20251026123923.1531727-2-caojunjie650@gmail.com

...

> +  awinic,dim-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: >
> +      Select dimming mode of the device.
> +        0 = Bypass mode.
> +        1 = DC mode.
> +        2 = MIX mode(PWM at low brightness and DC at high brightness).
> +        3 = MIX-26k mode(MIX mode with different PWM frequency).
> +    enum: [ 0, 1, 2, 3 ]
> +    default: 1
> +
> +  awinic,sw-freq-hz:
> +    description: Boost switching frequency in Hz.
> +    enum: [ 300000, 400000, 500000, 600000, 660000, 750000, 850000, 1000000, 1200000, 1330000, 1500000, 1700000 ]

Please wrap code according to the preferred limit expressed in Kernel
coding style (checkpatch is not a coding style description, but only a
tool).

> +    default: 750000
> +
> +  awinic,sw-ilmt-microamp:
> +    description: Switching current limitation in uA.
> +    enum: [ 1500000, 2000000, 2500000, 3000000 ]
> +    default: 3000000
> +
> +  awinic,iled-max-microamp:
> +    description: Maximum LED current setting in uA.
> +    minimum: 5000
> +    maximum: 50000
> +    multipleOf: 500
> +    default: 20000
> +
> +  awinic,uvlo-thres-microvolt:
> +    description: UVLO(Under Voltage Lock Out) in uV.
> +    enum: [ 2200000, 5000000 ]
> +    default: 2200000
> +
> +  awinic,ramp-ctl:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: >
> +      Select ramp control and filter of the device.
> +        0 = Fade in/fade out.
> +        1 = Light filter.
> +        2 = Medium filter.
> +        3 = Heavy filter.
> +    enum: [ 0, 1, 2, 3 ]
> +    default: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - enable-gpios
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        aw99706@76 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

> +            compatible = "awinic,aw99706";
> +            reg = <0x76>;
> +            enable-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
> +            default-brightness = <2047>;
> +            max-brightness = <4095>;
> +            awinic,dim-mode = <1>;
> +            awinic,sw-freq-hz = <750000>;
> +            awinic,sw-ilmt-microamp = <3000000>;
> +            awinic,uvlo-thres-microvolt = <2200000>;
> +            awinic,iled-max-microamp = <20000>;
> +            awinic,ramp-ctl = <2>;
> +        };
> +    };
> +
> +...
> -- 
> 2.51.1.dirty
> 
