Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 145B44FD2D2
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 10:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0729710FEFD;
	Tue, 12 Apr 2022 08:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B30010FEFD
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 08:07:38 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id n11so4743813qvl.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 01:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B3kIM+vDEOWvwfE796xa+4bsmSumR9WhkTFX0uGGX6Y=;
 b=Y3zKQcRwHTUvyXeWGSoN/oU2skOjjoodltekBY7hlEP6eba8QYQ3fo/XmcmFRQSFLI
 wMj97XS0CMzS2T/DUAqrRnpACMmjky4+JwdSLvdfFN3v1lKLXXwarFjKzZkHQHtaByZx
 T+elqk+esQNtNkpBorR8G565e935P3uh75H56wsNgVdKxiw87wEGn5F1kh5YSvNJRZg5
 f4uWO4hdNqVGQgdEUnJQoi/1cHd+UTBIpsk8KLP/7XDerS0/g0hXWfpSLLoDd4pwZwGH
 C03BjOpCXcMNAfVOpcm9Hn243oQ/sVA3rbGvAA0IYorND9O4R4OFgWuMG9wm+rfRKnvM
 CdJg==
X-Gm-Message-State: AOAM533sMRhlP6+cT7l8uUvGG7Ia/E1ptMwWXdJxv371jpD/aQNTWiyh
 EveF2oKHsyZLFCZtPOTefp1Jmsz/416IwgAV
X-Google-Smtp-Source: ABdhPJxSxALDDUyoukf60JXr1zfgF3ZWIGS+oE5zZHSmOFpwdDVoyOLHQkg0T7fpZe2puFofhD/t8Q==
X-Received: by 2002:ad4:5bc7:0:b0:441:53a2:169c with SMTP id
 t7-20020ad45bc7000000b0044153a2169cmr30548897qvt.8.1649750857062; 
 Tue, 12 Apr 2022 01:07:37 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com.
 [209.85.128.181]) by smtp.gmail.com with ESMTPSA id
 g7-20020a376b07000000b006492f19ae76sm20119499qkc.27.2022.04.12.01.07.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 01:07:36 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-2ebdf6ebd29so121645157b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 01:07:36 -0700 (PDT)
X-Received: by 2002:a81:618b:0:b0:2db:d952:8a39 with SMTP id
 v133-20020a81618b000000b002dbd9528a39mr29324182ywb.132.1649750856326; Tue, 12
 Apr 2022 01:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220411211243.11121-1-javierm@redhat.com>
 <20220411211243.11121-3-javierm@redhat.com>
 <CAMuHMdVuivPSRooR5CqTX6GQtxO6RQYwKUqfOK36zsiN8-v6kg@mail.gmail.com>
 <d37de4b1-55f7-ff4d-6230-6f0b6e65799c@redhat.com>
In-Reply-To: <d37de4b1-55f7-ff4d-6230-6f0b6e65799c@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Apr 2022 10:07:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV_4Gp2fqfCTeUigVxK=J4NF=SqJVd1hKAWpyuUv0Pnzw@mail.gmail.com>
Message-ID: <CAMuHMdV_4Gp2fqfCTeUigVxK=J4NF=SqJVd1hKAWpyuUv0Pnzw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: display: ssd1307fb: Extend schema for
 SPI controllers
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
Cc: Chen-Yu Tsai <wens@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Tue, Apr 12, 2022 at 10:01 AM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> On 4/12/22 09:16, Geert Uytterhoeven wrote:
> > On Mon, Apr 11, 2022 at 11:12 PM Javier Martinez Canillas
> > <javierm@redhat.com> wrote:
> >> The Solomon SSD130x OLED displays can either have an I2C or SPI interface,
> >> add to the schema the properties and examples for OLED devices under SPI.
> >>
> >> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

> >> --- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> >> +++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> >> @@ -39,9 +39,14 @@ properties:
> >>    reset-gpios:
> >>      maxItems: 1
> >>
> >> +  dc-gpios:
> >> +    maxItems: 1
> >> +
> >
> > Perhaps add a description, and clarify this is for SPI only?
>
> I wondered how to make it required for SPI but couldn't find another binding
> that did the same and I'm not that familiar with DT schemas to figure it out.
>
> Before, when I had compatible strings just for SPI I could do the following:
>
>   - if:
>       properties:
>         compatible:
>           contains:
>             enum:
>               - sinowealth,sh1106-spi
>               - solomon,ssd1305-spi
>               - solomon,ssd1306-spi
>               - solomon,ssd1307-spi
>               - solomon,ssd1309-spi
>     then:
>       required:
>         - spi-max-frequency
>         - dc-gpios
>
> but now that we are using the same compatible strings for I2C and SPI, the
> compatible string can't be used anymore as an indication to make required.
>
> Do you have any hints here on how I should enforce this in the schema ?
>
> Or if you think that a comment is enough, then I will add it in v3.

I don't know how to make it required for SPI, if possible at all.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
