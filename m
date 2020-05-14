Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4581D2819
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 08:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70AC06EAB2;
	Thu, 14 May 2020 06:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6183E6EAB2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 06:44:32 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id m18so1492120otq.9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 23:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g1s0XB9H+uh7sdHu3xSmDUQrpxyudnsMCE9Ul5AyP3g=;
 b=Ed8W5dLL7UwwjcAICBmFQYedHTlmjexqPcs+A+Av8CP6TL7JB5oEkc7hghPabuyx6p
 sBieTOzJ46hszxfRhPkvDCf/jzljklw8mvRjsv69C2VrKCWWX9Hcdz7Ek+VVD03VIpo+
 an8zRwzbVG+/MJg8Yq19mzLfccrDQm7PkLGGAiTSnkda2CayLknJK/5JqU4Zr8BXFckA
 y32gtKRgDLrRRCrEaS+WejLlEGLOhaWaWuG9SdZmUPF3sviN10zlpYnCpOLSx4VUxYO4
 aFyghUSIISnvQZguLh8sMDscm5TVV9k5NvU6as79Ex+heqAHkc8/8bGNwbVvVjmMHjst
 k++A==
X-Gm-Message-State: AOAM5307BARY4i0jpvK+v7kbTyZmbtlnGpxLuXXfMF7xlmykmrpTxi49
 JumCHG39yGsmmy5J/tP/R3/1X8YYssuqJ3REAaQ=
X-Google-Smtp-Source: ABdhPJx5VgiH2lgK0AW+wxYBnbzZDA7oqs3hGnSiQ28a5Q5TwOi3q+2ndSDzKIx6x4YhkjH5tlwRaRC9RY+atYYrLv0=
X-Received: by 2002:a9d:564:: with SMTP id 91mr2434708otw.250.1589438671372;
 Wed, 13 May 2020 23:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200513233908.23629-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200513233908.23629-1-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 May 2020 08:44:19 +0200
Message-ID: <CAMuHMdWL9xhzbVhZ6N1xbh+YmP_RBMO4H1uMXXexbJXq6amcLA@mail.gmail.com>
Subject: Re: [PATCH 6/4] dt-bindings: display: renesas: lvds: RZ/G2E needs
 renesas,companion too
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 1:39 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>
> Document RZ/G2E support for property renesas,companion.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> @@ -81,9 +81,9 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
>        phandle to the companion LVDS encoder. This property is mandatory
> -      for the first LVDS encoder on D3 and E3 SoCs, and shall point to
> -      the second encoder to be used as a companion in dual-link mode. It
> -      shall not be set for any other LVDS encoder.
> +      for the first LVDS encoder on D3, R-Car E3 and RZ/G2E SoCs, and shall

R-Car D3 and E3, and RZ/G2E SoCs

> +      point to the second encoder to be used as a companion in dual-link mode.
> +      It shall not be set for any other LVDS encoder.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
