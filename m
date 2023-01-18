Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E66476733C9
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 09:36:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD60D10E8D5;
	Thu, 19 Jan 2023 08:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CDE110E752
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 14:00:39 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 x2-20020a17090a46c200b002295ca9855aso2440058pjg.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 06:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=X9t7ufkd2EkdshQLKnA3SFrv5rmVPIr/Hi7nOCZDw5c=;
 b=EBzEL7qb0k674EUQUfYhxoHectKIbEkxILdLeZMsthCgCpqziD8YYeh+ISEUK+H0rt
 yBKg4w6JKskKG3aMTV3z48OBmalZW41eI3ToSjmxoFpQ0whb7zsYF9YWGQkN1tXYd+5r
 3WQFY0AFq8KERF8NYtUVrOnjYyU0VhhJfALB99l+6dS1xm3NV+HvawPJiPfZp1Xqgi5T
 FEGZ5aG/7aOHKbUpnFmyj0vKL3IY8j91QYHRYQsGpLGKiFXiP/MZp4A39UwHNGtjVREj
 YE2+vwyFcC2uj+L/dLo8y0j4rDaTtxKtreqinNPoMrred0acZ74OWjTaolWQS9d1vtRy
 +UDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X9t7ufkd2EkdshQLKnA3SFrv5rmVPIr/Hi7nOCZDw5c=;
 b=FpW2XaaJeKgn70bAaYTXDKl+9fJxm74oDtgcYnUabX4LC6EPQu9Zisvu5FTNP0sjLk
 SMawkKJG3zxB4DHiqktRHgUSWklINwWOOdbP7ytP2phX9Ydnivn0i0vW0YN4yUcdKz6x
 0eZPpms3BXYQkg/kQ1ayI3HKpf5kl1RJpHYr/88g6UPUi1fBXTUYJzlOCW/t91K5XngX
 MbW+iUqQ000EiwLB4Cz7KhQiWv0x2mBHKpluf1FJkbLjAfbiwjS2YmfyssLmHSNjNJax
 CI0tMugwmVKeLzWN1Svu30uTninob0/vvrHXkYc45MDOoLAZZ4YgDNi3TuA7+IDqVr/U
 MfLQ==
X-Gm-Message-State: AFqh2kr0ZWuxvjI5VKvz93OX8FEX6VtAIkrmJ9wV6tPZ14Y0eSMtG8iW
 IvxXn3JQpAglH874ANio99M=
X-Google-Smtp-Source: AMrXdXuhQmSrA8Cqhd01EKQ9K+DXdyRft3dUY4vZYmOODnEXwQbp2dOgQ3iZ3YnS/+ERzdF/gwlF0A==
X-Received: by 2002:a17:90b:3586:b0:229:772c:a00b with SMTP id
 mm6-20020a17090b358600b00229772ca00bmr7100810pjb.14.1674050438708; 
 Wed, 18 Jan 2023 06:00:38 -0800 (PST)
Received: from Gentoo (n220246252084.netvigator.com. [220.246.252.84])
 by smtp.gmail.com with ESMTPSA id
 w7-20020a17090a4f4700b002298e0641b6sm1357081pjl.27.2023.01.18.06.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 06:00:37 -0800 (PST)
Date: Wed, 18 Jan 2023 22:00:29 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: leds: backlight: Add Kinetic KTZ8866
 backlight
Message-ID: <Y8f7fbEJ0E6QQ0lZ@Gentoo>
References: <20230118131002.15453-1-lujianhua000@gmail.com>
 <1a8c006d-c9b9-9fd0-147e-7e511cb236fe@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a8c006d-c9b9-9fd0-147e-7e511cb236fe@linaro.org>
X-Mailman-Approved-At: Thu, 19 Jan 2023 08:35:53 +0000
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 18, 2023 at 02:40:00PM +0100, Krzysztof Kozlowski wrote:
> On 18/01/2023 14:10, Jianhua Lu wrote:
> > Add Kinetic KTZ8866 backlight binding documentation.
> > 
> > Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> > ---
> > Changes in v2:
> >   - Remove "items" between "compatible" and "const: kinetic,ktz8866"
> >   - Change "additionalProperties" to "unevaluatedProperties"
> > 
> > Changes in v3:
> >   - Add Krzysztof's R-b
> > 
> > Changes in v4:
> >   - Drop Krzysztof's R-b
> >   - Add some new properties
> > 
> > Changes in v5:
> >   - Add missing enum under property description.
> >   - Rename uncorrect properties.
> > 
> > Changes in v6:
> >   - Correct wrong property suffix and description.
> > 
> >  .../leds/backlight/kinetic,ktz8866.yaml       | 59 +++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
> > new file mode 100644
> > index 000000000000..ca0deba14523
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
> > @@ -0,0 +1,59 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/backlight/kinetic,ktz8866.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Kinetic Technologies KTZ8866 backlight
> > +
> > +maintainers:
> > +  - Jianhua Lu <lujianhua000@gmail.com>
> > +
> > +description: |
> > +  The Kinetic Technologies KTZ8866 is a high efficiency 6-sinks led backlight
> > +  with dual lcd bias power.
> > +  https://www.kinet-ic.com/ktz8866/
> > +
> > +allOf:
> > +  - $ref: common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: kinetic,ktz8866
> > +
> > +  current-num-sinks:
> > +    description: Number of LED current sinks.
> > +    enum: [1, 2, 3, 4, 5, 6]
> > +
> > +  current-ramping-time-ms:
> > +    description: LED current ramping time in milliseconds.
> > +    enum: [2, 4, 8, 16, 32, 64, 128, 192, 256, 320, 384, 448, 512, 576, 640]
> > +
> > +  led-ramping-time-ms:
> > +    description: |
> > +      LED on/off ramping time in milliseconds, note that the case 0 will be mapped
> > +      to 512μs because ktz8866 can't ramp faster than it.
> 
> Aren't you just missing supplies here and their ramp up time?
>
backlight ic supply bias power to panel, but downsteam devicetree adds power supplies node to panel node, 
so I'm not sure if need to add power supplies to backlight node.
> > +    enum: [0, 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384]
> > +
> > +  enable-lcd-bias:
> > +    description: Set if we want to output bias power supply for LCD.
> 
> Is it a generic property? I don't see any other users, so this looks
> device specific thus needs vendor prefix.
> 
> This applies to all of the properties. They might be generic or might
> not, I don't know the backlight hardware that much.
It surely is device specific, thanks.
> 
> > +    type: boolean
> > +
> > +required:
> > +  - compatible
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    backlight {
> > +        compatible = "kinetic,ktz8866";
> > +
> > +        pinctrl-names = "default";
> > +        pinctrl-0 = <&bl_en_default>;
> > +
> > +        current-num-sinks = <5>;
> > +        current-ramping-time-ms = <128>;
> > +        led-ramping-time-ms = <1>;
> > +        enable-lcd-bias;
> > +    };
> 
> Best regards,
> Krzysztof
> 
