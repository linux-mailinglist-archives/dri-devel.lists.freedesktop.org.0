Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8167F3B1A88
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 14:53:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE3A6E0E6;
	Wed, 23 Jun 2021 12:53:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1186E0E6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 12:53:45 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id z15so1339015vsn.13
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 05:53:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P76n6RiaHARTNJx4hBu1PTQcMcnpO5X4D5Pt6jdXVrM=;
 b=Sgq90GXE5ePpgJnKEN+4XCslIstEzPBay9d+zz9ImZ8Ji67i4ujzgGymZUW17b3QjR
 gNBHTwBfUBb0UB92qkRit8UaqfJR5Cd6wy6WRPhMzwbKy1zI/0uBRSPH6LlFwDA/LVOv
 WmKhv0eGkYWGc8jSZImkWQ2xES0xPt546Rzd/+4jvX/GrG+NflnBXh/mYkdAK4QuzeXE
 jcuKaSytocM+b+/Bz/BBxM8L29lpm0z5qTXPr5JGJmYARine9/Lk1N++gvuJzT4vBYy2
 STlSOLkkDTXDia9ohDkjJlreGPlQGPB/aNf96K336xvYUD5BBDO7NhnQPsk51M38ZXhD
 ZHLg==
X-Gm-Message-State: AOAM532j43LW6uJDxvtEgTEyf1t3p4fxmeuKveuEWU3Ug4DH60DkKVNT
 ZajPyfnq8sd1ip4i//QTUXBPJGOjqbTopNG9YRg=
X-Google-Smtp-Source: ABdhPJzQtwkx6Vol4T8y0aFn6deUBrbclNdnvtkKHC32EZvJE81p6+UAva6S9Ij1VyIOK4AEw4OeUADP2euokpub3lI=
X-Received: by 2002:a67:ba0c:: with SMTP id l12mr1120114vsn.40.1624452824812; 
 Wed, 23 Jun 2021 05:53:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210622231146.3208404-1-kieran.bingham@ideasonboard.com>
In-Reply-To: <20210622231146.3208404-1-kieran.bingham@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Jun 2021 14:53:33 +0200
Message-ID: <CAMuHMdW8vYC3+gVCv5eG_vkX79vU8RQL-6fSJd9McetDzikzSA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: renesas,
 du: Provide bindings for r8a779a0
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR RENESAS" <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kieran,

On Wed, Jun 23, 2021 at 1:11 AM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> Extend the Renesas DU display bindings to support the r8a779a0 V3U.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks for your patch!

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
> @@ -774,6 +775,57 @@ allOf:
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
> +            - description: Functional clock for DU0
> +            - description: Functional clock for DU1
> +
> +        clock-names:
> +          items:
> +            - const: du.0
> +            - const: du.1

The hardware block has only a single function clock for both channels,
like on R-Car H1.

And what about DU_DOTCLKIN?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
