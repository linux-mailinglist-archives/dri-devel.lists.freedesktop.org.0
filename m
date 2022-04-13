Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A284FF154
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 10:04:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC3810E272;
	Wed, 13 Apr 2022 08:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0CCA10E272
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 08:04:13 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id t2so818086qtw.9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 01:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0SQtFKwvmFkbGQ+l9yQziQCJESUKXjbWruyGdBT8yb8=;
 b=A6KkPTmwJ3SSU+axDT48lX8IzNMPefcLlmNhTsMuVrR+Vf7/anL9y0XqK5VhH1Y9PB
 hjLFHC4a/dcQSjbDDr8OGXz3APHiSvAMjuSdT5DPMpffztFt9/WIjKeB4V9eWsdFpwCh
 EUY+NdfeNuzJzPusCCkTLB4/M6K++ZlbOeNunXTuWgOa9oo8IQTp7P4pwqGt+3avZTbU
 Z4BMKOF4dV+A7tDxC8M+X9lF9FtNaIp0jOgayRDtGLc4RitaP4aQYNN/c2Wl1HodxqSE
 S5oZ8dutVSk1r2tObX3eEqyref4NnPZ8H8acnbah+eiBK3Pzx/4DpqMRQEqxVPeEVyjz
 N1Pw==
X-Gm-Message-State: AOAM5333IXfg+ZDtHi+QP1ruFV8IQ0iRyuoMc1jCYzoF14ibriC8AZSv
 aFAXCA4uU41y/DBuB3STVb6Lv0LJ8sFOTQ==
X-Google-Smtp-Source: ABdhPJxDztmg+IjQl4niqYhyqVTwUISNJpkRhsaeXGgFd2eDqUGDr4FQjDIXJIPfq5VRB/Cc1LAp1Q==
X-Received: by 2002:ac8:5804:0:b0:2f1:d3eb:995f with SMTP id
 g4-20020ac85804000000b002f1d3eb995fmr320271qtg.262.1649837052706; 
 Wed, 13 Apr 2022 01:04:12 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com.
 [209.85.128.177]) by smtp.gmail.com with ESMTPSA id
 u5-20020a05620a084500b0069c3797e4fasm3340676qku.131.2022.04.13.01.04.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 01:04:12 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-2ebf3746f87so13477047b3.6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 01:04:11 -0700 (PDT)
X-Received: by 2002:a81:618b:0:b0:2db:d952:8a39 with SMTP id
 v133-20020a81618b000000b002dbd9528a39mr33617003ywb.132.1649837051663; Wed, 13
 Apr 2022 01:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220412162729.184783-1-javierm@redhat.com>
 <20220412162729.184783-3-javierm@redhat.com>
In-Reply-To: <20220412162729.184783-3-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Apr 2022 10:04:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUDxexqsGjb3B37jW_xZU1TBLq8gK5hctA+PKjL+LhQGQ@mail.gmail.com>
Message-ID: <CAMuHMdUDxexqsGjb3B37jW_xZU1TBLq8gK5hctA+PKjL+LhQGQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: display: ssd1307fb: Extend schema for
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
Cc: Chen-Yu Tsai <wens@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
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

On Tue, Apr 12, 2022 at 6:27 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> The Solomon SSD130x OLED displays can either have an I2C or SPI interface,
> add to the schema the properties and examples for OLED devices under SPI.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>
> Changes in v3:
> - Add a comment to the properties required for SPI (Geert Uytterhoeven)

Thanks for the update!

> --- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> @@ -38,9 +38,16 @@ properties:
>    reset-gpios:
>      maxItems: 1
>
> +  # Only required for SPI
> +  dc-gpios:
> +    maxItems: 1

Actually I meant to also add a description, like for vbat-supply below,
to explain the meaning of "dc".

> +
>    vbat-supply:
>      description: The supply for VBAT

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
