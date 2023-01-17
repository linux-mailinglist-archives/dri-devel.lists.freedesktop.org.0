Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D52D867195D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 11:42:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD4AB10E707;
	Wed, 18 Jan 2023 10:42:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E6110E465
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 14:27:30 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id q9so22080419pgq.5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 06:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/wAjm4lS10HgUJLm0Th42PdGl6ITPn76MtUbapp87lY=;
 b=fPZRLdQAAUyzM7c37jr3ONsaBuqZNfW8jdyWJf3e47FYY+eMvUe62hcJvNFEIT9wI9
 +aYQZ+1AhCvo1tWmKauq6/kefRZHXC5Ndp6PpuNQnsTKXUBrZq7259i6P6NKHIbGCEm2
 oUyrGAdU5oHEDgxZkmCdoNmveAXa+2mh1k1c91lQEAXYateyLG3RRAFO9P+8+W5/TpGN
 kbhuthUe2c2FLYl9r4CJR0fMlLz62xDsEFG5KzGJxgkKSr33PJ6pso6Jvwkm1aqNITpZ
 hUcRFo/KQCGWyMPF4rd11fkzpmFeAqOQztVdlcP95DEF4y+mXwTmzX15juOc8d8+d/qp
 P61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/wAjm4lS10HgUJLm0Th42PdGl6ITPn76MtUbapp87lY=;
 b=6TyphG6eUvT7qOs8pLSXk5Nb1sdwoqk+cJpdFsN35zmfyHyl/JaulIrjca1SBRiYLq
 pbjEf4bwg+8UVtujy9OatzR40i2FJwex6WjHi4XekIfSG0aQvDi+x+/wsGKRbJDCUf4w
 REkFkZS6VCj57W4GqbKRo9OPXg9uElsB9F0p7fqUiAe9ympSRseksSM7TuGeCt8UlPsC
 aGbyq7NVdekhLhlYlWTgqosz/yzVBKy9hInAYywn2INhNaN85LMI6hUUs6QBCuwhXGZx
 2TUxFRRdANcxHH6hWJn4Ue30lu9N0Lkny5CRiVrVwRBkepxGGvQYDfoEfGo4PyKH8/C5
 wV1w==
X-Gm-Message-State: AFqh2krPIqVRYVcTpCei+pDZl4YU8nJaF3bCQ94LFeEJqksT1lex/5IS
 S/PplLU6mLJoE1l7zPuEeeA=
X-Google-Smtp-Source: AMrXdXtZhFaK22c6A/K6XbPnHmwDiY00Yu63fNedu4I8HEdO9kKbgmkA8su7raejpBEPBibThdEoBA==
X-Received: by 2002:a05:6a00:1da3:b0:563:cc80:fb66 with SMTP id
 z35-20020a056a001da300b00563cc80fb66mr3647881pfw.0.1673965649774; 
 Tue, 17 Jan 2023 06:27:29 -0800 (PST)
Received: from Gentoo (n220246252084.netvigator.com. [220.246.252.84])
 by smtp.gmail.com with ESMTPSA id
 h124-20020a628382000000b0058bb2f12080sm8006446pfe.48.2023.01.17.06.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 06:27:29 -0800 (PST)
Date: Tue, 17 Jan 2023 22:27:22 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: leds: backlight: Add Kinetic KTZ8866
 backlight
Message-ID: <Y8awSrqiWLoPQvIa@Gentoo>
References: <20230117134742.23238-1-lujianhua000@gmail.com>
 <20230117134742.23238-2-lujianhua000@gmail.com>
 <Y8avDJj5PCy8OVWV@aspen.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8avDJj5PCy8OVWV@aspen.lan>
X-Mailman-Approved-At: Wed, 18 Jan 2023 10:42:12 +0000
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 17, 2023 at 02:22:04PM +0000, Daniel Thompson wrote:
> On Tue, Jan 17, 2023 at 09:47:42PM +0800, Jianhua Lu wrote:
> > Add Kinetic KTZ8866 backlight binding documentation.
> >
> > Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> 
> Might be a good idea to take a look at this bit of the docs because
> the patchset is not in the right order (I.5):
> https://docs.kernel.org/devicetree/bindings/submitting-patches.html
Thanks, I will read it.
> 
> 
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
> >  .../leds/backlight/kinetic,ktz8866.yaml       | 54 +++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
> > new file mode 100644
> > index 000000000000..18571d69accb
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
> > @@ -0,0 +1,54 @@
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
> > +
> > +  current-ramping-time:
> > +    description: LED current ramping time.
> 
> Needs to document know what units this value is expressed in. IIRC
> this should be expressed in SI units and included the property name.
> Something like:
> 
>   current-ramping-time-us:
>     description: LED current ramping time in microseconds.
> 
Get it, I will send a new version patch.
> 
> > +
> > +  led-ramping-time:
> > +    description: LED on/off ramping time.
> 
> +1
> 
> 
> Daniel.
