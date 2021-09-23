Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D404415938
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 09:43:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD066E0DF;
	Thu, 23 Sep 2021 07:43:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D846E0DF
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 07:43:19 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id q66so5646545vsa.4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 00:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Ha/wlFhpE3wzhxqsYVFhc8UhMgQgIXbZ52hSCO/LZU=;
 b=f6cT6A6TzjXQjLgLSWYHpkIvkt39sk0eaJj+AngKTgBxCfeC7crAlDm4Lc9M6yHVdV
 PYxdEyt+/rcYbFf+Jf/xc8BxAJtkkNNshC+YOkAdbgqxX22hVTookS+97t+x8hxopo4e
 0DwdoeEaqiFr2RGxOGMIwVXY6KX5MILBzKZ56mGP6x9qOiqxbj1coB1Nwp0cUucwJ2RB
 KvrZaAkcuNFwQkvgTX6YRZ9NgOjPZxQguxXoT7M0KOpgajSHbaz4jDLYXEG+F3AXkwjc
 vnYOGiRzI3W2R5AoQJV0HM3w5K0KU4SVi2tpKhzXF5XW7Ms0Nuctrg2lWFtdVRR7arC5
 G24w==
X-Gm-Message-State: AOAM530GDo9uKtK/lUsyc8/WE4/1BBYc/zzbXBclfpx1QvLPvl71HV+9
 q96UeXp7WeW3uDZJbS1j7YlJgx2GySKRUV8i95Q=
X-Google-Smtp-Source: ABdhPJzKQLsa6lAVIiUAQaqshZfD+cCmfuMpwO2GNU/H/yzPZqKWK1YyaY9bVHDLIhvsPRJM5ycaxYEJFPxbKcq0wx4=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr3048824vsl.9.1632382998923;
 Thu, 23 Sep 2021 00:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210922234726.3337265-1-kieran.bingham@ideasonboard.com>
 <20210922234726.3337265-2-kieran.bingham@ideasonboard.com>
In-Reply-To: <20210922234726.3337265-2-kieran.bingham@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Sep 2021 09:43:07 +0200
Message-ID: <CAMuHMdWfcxb+5uOnPMiB2Z9rUfnRAg2Pzz--H16fOoVoASP=Kw@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: display: renesas, du: Provide bindings
 for r8a779a0
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

On Thu, Sep 23, 2021 at 1:47 AM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> Extend the Renesas DU display bindings to support the r8a779a0 V3U.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> ---
> v2:
>  - Collected Laurent's tag
>  - Remove clock-names requirement
>  - Specify only a single clock
>
> v3:
>  - Use clocknames: 'du.0' instead of 'du' to remain consistent

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
> +            - const: du.0
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
> +        - renesas,vsps

clock-names, for consistency?

> +
>  additionalProperties: false
>
>  examples:

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
