Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C971D28C5
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 09:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4356EACC;
	Thu, 14 May 2020 07:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63B96EACC
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 07:32:14 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id v17so1629016ote.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 00:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vhc1vPOe6XCEp9cAZAiq6WN1cflOAJVbZDflQFJ2vjQ=;
 b=L/yXBaDbZV+k5R/D7SD21SmcRiF9Q4kloHmLNwPegIYEkZnb66LK6SQpoqiGYxNZxs
 R7xHgZb8WxrifI0xGqN6aL7ikCNYorVuMZqrT+skFa91u6nS3mbpESPnJJQwysYWZzwP
 KAjTwpPZJ8oGC7IMSyegUZvaY/zRkfNQNyd4hR50YGZw0IHaOsXQngYC8/5c6yCkOKWj
 45DrGHPB1tfLjhO1STB+ksZfaqKeEhGoINgKxMyW7BYmH7bvw8/PY3CbtuObw6wuxK6J
 51R9MabGRyv+krbBKb8AjhVJYMQz9PH/lFkokqseGUW4VpNuZfpyZjAS/DYFkQtx9vuP
 UOBA==
X-Gm-Message-State: AOAM532ba3SkLTs6ne3Gr80xCTJoMa0UmrPUJIXCn/yTWMqaE+MBiLKa
 4J+6wrXkHTjR4vCQY/lvS69G+lgO0oEpuc5Umeo=
X-Google-Smtp-Source: ABdhPJyGBQa7yUxMaeUUyVrVubTEBO6u7aeAiflupj4yZkSBefIq/PXr26WIZz78ucQ0WiPzpHtHcVIgcxumEbzSbis=
X-Received: by 2002:a9d:564:: with SMTP id 91mr2543922otw.250.1589441534036;
 Thu, 14 May 2020 00:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200405232318.26833-5-laurent.pinchart+renesas@ideasonboard.com>
 <20200513232840.22687-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200513232840.22687-1-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 May 2020 09:31:53 +0200
Message-ID: <CAMuHMdXRiP3topBOeLdLhJ9wMBAMFEnLYJPPpdmmdK7TKN4X6g@mail.gmail.com>
Subject: Re: [PATCH v1.1 4/4] dt-bindings: display: bridge: renesas,lvds:
 Convert binding to YAML
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
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Thu, May 14, 2020 at 1:29 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Convert the Renesas R-Car LVDS encoder text binding to YAML.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml

> +examples:
> +  - |
> +    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> +    #include <dt-bindings/power/r8a7795-sysc.h>
> +
> +    lvds@feb90000 {
> +        compatible = "renesas,r8a7795-lvds";
> +        reg = <0 0xfeb90000 0 0x14>;

#{address,size}-cells = <1> for examples.
Applies to all nodes below, too.

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
