Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E62EBE2195
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 10:11:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5134010E0B7;
	Thu, 16 Oct 2025 08:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C3810E0B7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 08:11:42 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id
 71dfb90a1353d-54a79cadd1fso372822e0c.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 01:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760602301; x=1761207101;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hOaWu67C1VjWzsEPqOzUQCmn+iSXUetMOVFsDVhAcDg=;
 b=fswVV+46vjaXUrBbtbJmSi3u/RsXwtpO+i8432JOLgp4G1KeyPXeNVtuGIR9y419n/
 3hovJwsuEvoPOVfeqRTHSvzc3+VjXVveCnFj/l5IvQNf0WmZmsj01hoLC24ihCTKN6bo
 ay98AZmYV6ak5mH2hydMIR900m1p4861Cc8KcTpbZo74apxEp1qJOJT2OfksZljar0gW
 m8ixMscD/qRmBWnKnC4vENWKn4yznQd1y+hfNwwLnEKrH+dp/5CaCtVEIXwuhM+kk0kw
 byigtx5ir49lMHRE7axBmMIUOzmNZ0o6Pf28Kt+NvvOSNsWCLmWfF4QkIuZzTRq/e25p
 J5gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4FmsKib/9SvuGDSfg10GkIWegckb7CA2Ra+u2va70Fvr7V5mCL/6Ic+gefYeMq2LqauROnxoIBjE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJHJI/Z2eD99+s8O/TsIFBrWaCHlnB8AHbdy7/R/Zclt0T0BmO
 2rA2OTZeNBdffKavsN25DlR+PK5TwHhimeP/krVytBa6CsntiVk1FkK6UT0FtKQ7
X-Gm-Gg: ASbGncse/sY5Y4txwjMFlj17cnoHVtG8mw7fmU4N4hfUYrZrhgCWXLCOS8TkmFt2LQH
 GADNLVlhkfZzas5WwNGPRpCDC/p7Su4UZqkByBiY4WYPxTJWY3Kd0ky4c6reMTCXA5p8uBcfqqp
 LTZE01paBYtwAVF08Iv1Q/+FNN45iqcm1k0ig2EAFHvrvKH4F1VbrS4qGgIRj2D0a6ErMur3+Sb
 u9cWYI2mkG4CnucSSYufASjTfu2l6J6chiGg8/iwhBxQDE47qOdxs1trdzvzWt73nnDiMN+UAYY
 U/KDff1Mj59RF6RfDc1yjpZc6HWsadgSHWK/nwJSck17tGppoDfqLodo4I2iFOWcGYQtkbRMS8C
 JRucnfrRvx9Pt6mvlFYdRYrhgk1GXruRqXPMA9CPACVHhiFmYp2LgY/fm1reW5w0NXvmCL5EEyz
 1EYAQ6LQLiBcio/AkHQrBBoOmDn9Pzsl9pMNtzb5rZfksF67v6
X-Google-Smtp-Source: AGHT+IGityTJ25eS7SxJu3dM+s+Mcz8sIAtpVbNgBOaSCKenCz2lk2z7V4MH9htag7/RoZsbggK43w==
X-Received: by 2002:a05:6122:17a9:b0:53c:6d68:1d2f with SMTP id
 71dfb90a1353d-554b8be64d0mr12228497e0c.13.1760602301345; 
 Thu, 16 Oct 2025 01:11:41 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com.
 [209.85.222.41]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-554d80dc9e8sm5749303e0c.20.2025.10.16.01.11.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 01:11:41 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id
 a1e0cc1a2514c-930c4cd6ccbso284353241.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 01:11:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW88KcSdsAmHOV5NBEM5pNij08ff2BwkAMvZ/9KJfbtf77dSaKQndT0O/0hLpRDKs38Hgv91cwXFJQ=@lists.freedesktop.org
X-Received: by 2002:a05:6102:5f07:b0:526:db01:5fb2 with SMTP id
 ada2fe7eead31-5d5e23caf40mr12709050137.30.1760601948335; Thu, 16 Oct 2025
 01:05:48 -0700 (PDT)
MIME-Version: 1.0
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 10:05:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUwaoW97D3HOQHTO=h+-jh8WBXASfMsN_5S19UUEhs5ew@mail.gmail.com>
X-Gm-Features: AS18NWBojpV8EGtFpRhA4ksx4kN18NVJp94-AwZBKhJOeu5MaqA3XKOopME9Jaw
Message-ID: <CAMuHMdUwaoW97D3HOQHTO=h+-jh8WBXASfMsN_5S19UUEhs5ew@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: gpu: img,powervr-rogue: Document
 GX6250 GPU in Renesas R-Car M3-W/M3-W+
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>, Adam Ford <aford173@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Frank Binns <frank.binns@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Matt Coster <matt.coster@imgtec.com>, Maxime Ripard <mripard@kernel.org>, 
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Hi Marek,

On Wed, 15 Oct 2025 at 17:40, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
> present in Renesas R-Car R8A77960 M3-W and R8A77961 M3-W+ SoC.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for the update!

> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -13,6 +13,12 @@ maintainers:
>  properties:
>    compatible:
>      oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r8a7796-gpu
> +              - renesas,r8a77961-gpu

OK.

> +          - const: img,img-gx6250
> +          - const: img,img-rogue
>        - items:
>            - enum:
>                - ti,am62-gpu
> @@ -146,6 +152,29 @@ allOf:
>          clocks:
>            maxItems: 1
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,r8a7796-gpu
> +              - renesas,r8a77961-gpu
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          minItems: 3
> +        power-domains:
> +          items:
> +            - description: Power domain A
> +            - description: Power domain B
> +        power-domain-names:
> +          minItems: 2

I think:

    clocks:
        minItems: 3
    power-domains:
        minItems: 2

plus the required below should be sufficient.

As Matt said, the power-domain-names are already specified at the top level.

I guess they should be dropped from the other device-specific
constraints, and their descriptions moved to the top, too (in a separate patch).

> +      required:
> +        - power-domains
> +        - power-domain-names
> +
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/irq.h>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
