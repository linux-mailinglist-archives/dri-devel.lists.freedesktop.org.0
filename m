Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9191D47B3
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 10:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623B86EC11;
	Fri, 15 May 2020 08:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0356EC11
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 08:05:24 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id 63so1230813oto.8
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 01:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZEpA70iF3bES9GlgcA7awTeuPj9zwltDrnzx8CT3Qlc=;
 b=ZeI42wAjcNQM9VmXqmPwzjgSE5o6Ry7dWetsNCbvD3q9+Nw/M/X6x+aF8qxZwcNyEl
 3kL/wiHdd6L3By2UZqF1ml8HiavFXtty7z/0LuFA5V2xWTajGSCX+Mynn9RAF89P7OU/
 zinCw+T9Y+QvzSOQtZXHq+ll/UElNq8+XwBJ1/rEI6jmdv3vQDSMs2ViKT0VLMz0lDcS
 es7jRKj3+InlAQrOLbK3n8WvRjywIZ5JsxWdLcZS3PUjpdHchkPeWblheN97xMZyDAsQ
 m377ADIT1T7DyiiW6cQfbbYN9IGKnuMq/qJup2Tvz0ksuBL1t82t72QnmeVScOTDa6ts
 flwA==
X-Gm-Message-State: AOAM532MEE/pgTCsjep5OHzsSAUQUYgjvkCfFtzB9csKekCLqQWLysqp
 r+umTCyf87WVpQ3kEthM9oc8/VEwWj+tglj2uXzf0xOc
X-Google-Smtp-Source: ABdhPJxuP0fTJNvKox9xSUGV0JDypK2O0/t8XLimIPfWdM/EU+Ip7j+cJCm+twmwwx18e8m01353J0vPXApeFQY7jEw=
X-Received: by 2002:a9d:7e92:: with SMTP id m18mr1318186otp.145.1589529923703; 
 Fri, 15 May 2020 01:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200515012432.31326-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200515012432.31326-2-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2020 10:05:12 +0200
Message-ID: <CAMuHMdU8hjKM7uLgkVUZQ43Yywh73iuQfPNiNaLPUM1Fn0cSwA@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: media: renesas,
 fcp: Convert binding to YAML
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
 Rob Herring <robh+dt@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Fri, May 15, 2020 at 3:42 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Convert the Renesas R-Car FCP text binding to YAML.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/renesas,fcp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car Frame Compression Processor (FCP)
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +
> +description: |
> +  The FCP is a companion module of video processing modules in the Renesas
> +  R-Car Gen3 and RZ/G2 SoCs. It provides data compression and decompression,
> +  data caching, and conversion of AXI transactions in order to reduce the
> +  memory bandwidth.
> +
> +  There are three types of FCP: FCP for Codec (FCPC), FCP for VSP (FCPV) and
> +  FCP for FDP (FCPF). Their configuration and behaviour depend on the module
> +  they are paired with. These DT bindings currently support the FCPV and FCPF.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,fcpv # for 'FCP for VSP'
> +      - renesas,fcpf # for 'FCP for FDP'

I would drop the "for" part, and just write e.g. "# FCP for VSP".

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
