Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F79675CA0
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 19:20:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8850A10EAC1;
	Fri, 20 Jan 2023 18:19:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27BE610E26C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 12:10:47 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id d9so5131613pll.9
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 04:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EKSavZcLgXER2Rs1R2Q0x8yB6aB9z1+lbShiy/SvYys=;
 b=Zo3Ysk2ltDD5uVeoi1c0r1TnX+tcTOrp//osdZN4GUTjtHCDNpK9CstlqX3zrjJ0Ym
 GH9wl0Qh30NS/KzHGFrgBPnFaHfD92XXY79ka7WAhzkOgxjZQCEWWTjIabhPc8GNXevO
 ZzgCLIPk8vRxGjh3bu0cHEKz3cnoAocU12o6MwpGL7Aj0cViuVitSgaUNart0P1PkDId
 RvvkRy5XqpVFkmKy8rgeiHtBZXg4uPatXC5HQCId1EWn7rBKAEvuAw/taaeX1aZyJFSx
 Tx5713hXdgE7EyQMSHIxebs50ZJrVNtQXhzFxxLMWSIGbJYQ0CdUfTUPXMymD3pJbCH9
 JHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EKSavZcLgXER2Rs1R2Q0x8yB6aB9z1+lbShiy/SvYys=;
 b=ZNnsIpfpuK9kihIRWgFuymnvjTCJfVQzO6r8meB70snbM9r07AevcIo9749pm8Zqxe
 S6s4XpFu8EI38rWgt/8hiWVWdoUPP+nfURvI9068ddDU2EYYGpF9xuLoZ9VA+rRm/V16
 eHhKGREsbF5nWpg7Ym8YjsC6gSKxQmHcL100H3KCh8rlb7Z5d8MsP6zPwwieyQXlOYGZ
 RP6ohVUa0hby4WwoSjWwrnSHhNhutc5lSJDHIcoJA3ZL8wYLxheyR9AvUh6poRbaNXlr
 AsC5PfV6X9mQqWYGXP52J/ktd6TXHbqFWdiWHWKxD+1fo5mZv0mazS7QFgX/zJNxrCHw
 wolA==
X-Gm-Message-State: AFqh2koG72DgUAbAD1GbHVC7JXQ+wxQuqFJL8bEaJ4A8/yLSDo14zcxU
 eU3geGrqFy1lC44NyYnDOSc=
X-Google-Smtp-Source: AMrXdXspfd5ZJN1kn8YC0qz+35IV6j45HHmp/5WR4FbgQ3/MFKaCAjof+44x8SVDjo5vAh+Uvo+H9A==
X-Received: by 2002:a05:6a21:9993:b0:b6:1425:55df with SMTP id
 ve19-20020a056a21999300b000b6142555dfmr19047879pzb.59.1674216646665; 
 Fri, 20 Jan 2023 04:10:46 -0800 (PST)
Received: from Gentoo (n220246252084.netvigator.com. [220.246.252.84])
 by smtp.gmail.com with ESMTPSA id
 r30-20020aa7989e000000b0058e12bbb560sm1594542pfl.15.2023.01.20.04.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 04:10:46 -0800 (PST)
Date: Fri, 20 Jan 2023 20:10:39 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v7 1/2] dt-bindings: leds: backlight: Add Kinetic KTZ8866
 backlight
Message-ID: <Y8qEv9pUVA+1beTt@Gentoo>
References: <20230120094728.19967-1-lujianhua000@gmail.com>
 <a9c47e2f-aacb-4c8f-3a0b-67274ef15376@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9c47e2f-aacb-4c8f-3a0b-67274ef15376@linaro.org>
X-Mailman-Approved-At: Fri, 20 Jan 2023 18:19:29 +0000
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

On Fri, Jan 20, 2023 at 11:18:56AM +0100, Krzysztof Kozlowski wrote:
> On 20/01/2023 10:47, Jianhua Lu wrote:
> > Add Kinetic KTZ8866 backlight binding documentation.
> > 
> > Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> > ---
> > Changes in v2:
> >   - Remove "items" between "compatible" and "const: kinetic,ktz8866".
> >   - Change "additionalProperties" to "unevaluatedProperties".
> > 
> > Changes in v3:
> >   - Add Krzysztof's R-b.
> > 
> > Changes in v4:
> >   - Drop Krzysztof's R-b.
> >   - Add some new properties.
> > 
> > Changes in v5:
> >   - Add missing enum under property description.
> >   - Rename uncorrect properties.
> > 
> > Changes in v6:
> >   - Correct wrong property suffix and description.
> > 
> > Changes in v7:
> >   - Add vddpos and vddeg supply.
> >   - Use enable-gpios instead of defining enable pin.
> > 
> >  .../leds/backlight/kinetic,ktz8866.yaml       | 74 +++++++++++++++++++
> >  1 file changed, 74 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
> > new file mode 100644
> > index 000000000000..b1d0ade0dfb6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
> > @@ -0,0 +1,74 @@
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
> > +  The Kinetic Technologies KTZ8866 is a high efficiency 6-channels-current-sinks
> > +  led backlight with dual lcd bias power.
> > +  https://www.kinet-ic.com/ktz8866/
> > +
> > +allOf:
> > +  - $ref: common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: kinetic,ktz8866
> > +
> > +  vddpos-supply:
> > +    description: positive boost supply regulator.
> > +
> > +  vddneg-supply:
> > +    description: negative boost supply regulator.
> > +
> > +  enable-gpios:
> > +    description: GPIO to use to enable/disable the backlight (HWEN pin).
> > +    maxItems: 1
> > +
> > +  current-num-sinks:
> > +    description: number of the LED current sinks' channels.
> > +    enum: [1, 2, 3, 4, 5, 6]
> > +
> > +  current-ramping-time-ms:
> > +    description: LED current ramping time in milliseconds.
> > +    enum: [2, 4, 8, 16, 32, 64, 128, 192, 256, 320, 384, 448, 512, 576, 640]
> 
> kinetic,current-ramp-delay-ms
> 
> > +
> > +  led-ramping-time-ms:
> 
> kinetic,led-enable-ramp-delay-ms
> 
> So both are similar to existing regulator properties.
> 
reasonable suggestion.
> Best regards,
> Krzysztof
> 
