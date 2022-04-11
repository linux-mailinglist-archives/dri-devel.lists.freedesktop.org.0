Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5564FBDB8
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 15:47:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C2510F5CE;
	Mon, 11 Apr 2022 13:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A8D10F5CD
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 13:47:26 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id a11so16139394qtb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 06:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tCnkeyoKwqeX0JN+o8L5AX58NLvdx+Oy98J9n9irz2I=;
 b=LQAtj7v9qNMyjjgWInEtk5C7b7UbGnXWXLRohgxmRLLWUkoHLA4QTiNF7M6R5OdiMq
 2pP1QMkJcdXgur7RsOCqSBOiywzrj5FvPpjkXJ2tMEeIhOhOrlJu5YYJ9cqr3+wlqfX4
 ZGCbqYtsMoAQGkZouBKnhaFQJeE80lBFvvzZnl4Q8vCGlq3GhW+0q+h2zGJk/u/2GB+I
 cDoz3N+yTTTkpleyJQtGlwtXi3JYIoSOiXxZZ+Z3HFnXiNU5uiQqCL6mU7r5mXYiccst
 90I00KrP4mB/CShczBj7LbaBqRH5UvS2BSDaVGK33T7Npdjo22EMOBCyU94qBUquGKTB
 oasw==
X-Gm-Message-State: AOAM532/CE9FRhMczUNA2IplXiRGBS9Kd14hmE7yZkA9igQRGzIWkpRb
 uy9g3Vbj3QIGRVnMGvTcaMgJmG6vYIS5/g==
X-Google-Smtp-Source: ABdhPJzGcVO/19dGci5MT1VHBRfhevqU5SLIXgOtQVv+Rjp+CaomW68sEbMVKVTvxA267CHfaQRaWg==
X-Received: by 2002:a05:622a:1a9c:b0:2e1:e23b:2374 with SMTP id
 s28-20020a05622a1a9c00b002e1e23b2374mr25901632qtc.447.1649684845103; 
 Mon, 11 Apr 2022 06:47:25 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172]) by smtp.gmail.com with ESMTPSA id
 g4-20020ac87d04000000b002e06b4674a1sm25344379qtb.61.2022.04.11.06.47.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 06:47:24 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id z33so27574798ybh.5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 06:47:24 -0700 (PDT)
X-Received: by 2002:a5b:984:0:b0:63f:8c38:676c with SMTP id
 c4-20020a5b0984000000b0063f8c38676cmr11998194ybq.393.1649684844325; Mon, 11
 Apr 2022 06:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220407200205.28838-1-javierm@redhat.com>
 <20220407200205.28838-2-javierm@redhat.com>
In-Reply-To: <20220407200205.28838-2-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Apr 2022 15:47:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGQ6qabs_xD6kQeDruQLG-OX17UEVrgeGu3Eo6C2dEgw@mail.gmail.com>
Message-ID: <CAMuHMdUGQ6qabs_xD6kQeDruQLG-OX17UEVrgeGu3Eo6C2dEgw@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: display: ssd1307fb: Deprecate fbdev
 compatible strings
To: Javier Martinez Canillas <javierm@redhat.com>
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
 <devicetree@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Thu, Apr 7, 2022 at 10:03 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> The current compatible strings for SSD130x I2C controllers contain an -fb
> suffix, this seems to indicate that are for a fbdev driver. But the DT is
> supposed to describe the hardware and not Linux implementation details.
>
> Let's deprecate those compatible strings and add a new enum that contains
> compatible strings that don't have a -fb suffix. These will be matched by
> the ssd130x-i2c DRM driver.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

> --- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> @@ -12,12 +12,24 @@ maintainers:
>
>  properties:
>    compatible:
> -    enum:
> -      - sinowealth,sh1106-i2c
> -      - solomon,ssd1305fb-i2c
> -      - solomon,ssd1306fb-i2c
> -      - solomon,ssd1307fb-i2c
> -      - solomon,ssd1309fb-i2c
> +    oneOf:
> +      # Deprecated compatible strings
> +      - items:
> +          - enum:
> +              - solomon,ssd1305fb-i2c
> +              - solomon,ssd1306fb-i2c
> +              - solomon,ssd1307fb-i2c
> +              - solomon,ssd1309fb-i2c

Please drop the "-i2c" suffixes, too.
We already have plenty of IIO sensors and audio codecs using the
same compatible value for spi and i2c, cfr.
'git grep compatible -- "*-[si][p2][ic].c"'

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
