Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA1F4017A0
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 10:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6264989B8F;
	Mon,  6 Sep 2021 08:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ACAB89B8F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Sep 2021 08:13:19 +0000 (UTC)
Received: by mail-ua1-f44.google.com with SMTP id g16so3376361uam.7
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Sep 2021 01:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=El6II9rB5uKfaEROETT00Ms0bZLQwJYXTBT5qb9haVU=;
 b=EGuCcYXuqGLH/5ZQ8YlwSKxCDjIZiGBX7q1IT71t6bTIlDJUL0tkOwgKQ+tk/38QBL
 0HUIps7IG25qfvxI+afEtpYQRdqzwgBmF0L+Aw4C21lCocHgrEEo7kt2WKwx0x2mf7OX
 ZQ6YawNGvxI4Iaa81d0LWauGoHKEJWsCztFpImfbJKgPtphRXfPwjevprmDo4BOZ4GnJ
 8VYAOeMQvSzWRV624fGNIfggGgyjbfe/17STk6ygWJRWY3BIMpk81DWyD6+0FEwjf31H
 QdrL17MquPOHjpYXensjZvdyQkbxR4ubKzRLFCSY7E/Fqd/34Kg63O1YfO6eQvoVBQf3
 +JTg==
X-Gm-Message-State: AOAM530+eLH404wEc6XWuDhgea64U19IC05koUbLYxI92P35+QUS9AiK
 4LJ1ZdumsTN0GIVkWOrBa8RW08yeshGE94u0js0=
X-Google-Smtp-Source: ABdhPJzUfUN15fPzya4j7EGBZro+j88bO5jSNOlVlnA4bbS5/lIkX5ZUZqZnJB3cZOGBvwDoAjATKNco4f4YLMu+fbg=
X-Received: by 2002:ab0:2989:: with SMTP id u9mr4677806uap.122.1630915998555; 
 Mon, 06 Sep 2021 01:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210901233655.1602308-1-kieran.bingham@ideasonboard.com>
In-Reply-To: <20210901233655.1602308-1-kieran.bingham@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Sep 2021 10:13:07 +0200
Message-ID: <CAMuHMdXHAfg3_VoeXUBT2-QceLR9KQ3pWjz+5=-wK1QRxK14bw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: renesas,
 du: Provide bindings for r8a779a0
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
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

Hi Kieran,

On Thu, Sep 2, 2021 at 1:39 AM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> Extend the Renesas DU display bindings to support the r8a779a0 V3U.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> v2:
>  - Collected Laurent's tag
>  - Remove clock-names requirement
>  - Specify only a single clock

Thanks for the update!

> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> @@ -39,6 +39,7 @@ properties:
>        - renesas,du-r8a77980 # for R-Car V3H compatible DU
>        - renesas,du-r8a77990 # for R-Car E3 compatible DU
>        - renesas,du-r8a77995 # for R-Car D3 compatible DU
> +      - renesas,du-r8a779a0 # for R-Car V3U compatible DU
>
>    reg:
>      maxItems: 1
> @@ -773,6 +774,55 @@ allOf:
>          - reset-names
>          - renesas,vsps
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,du-r8a779a0
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Functional clock
> +
> +        clock-names:
> +          maxItems: 1
> +          items:
> +            - const: du
> +
> +        interrupts:
> +          maxItems: 2
> +
> +        resets:
> +          maxItems: 1
> +
> +        reset-names:
> +          items:
> +            - const: du.0

This is now inconsistent with clock-names, which doesn't use a suffix.

> +
> +        ports:
> +          properties:
> +            port@0:
> +              description: DSI 0
> +            port@1:
> +              description: DSI 1
> +            port@2: false
> +            port@3: false
> +
> +          required:
> +            - port@0
> +            - port@1
> +
> +        renesas,vsps:
> +          minItems: 2
> +
> +      required:
> +        - interrupts
> +        - resets
> +        - reset-names

Same here, as clock-names is not required anymore.

> +        - renesas,vsps
> +
>  additionalProperties: false
>
>  examples:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
