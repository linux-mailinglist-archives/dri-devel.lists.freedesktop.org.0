Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6934FD284
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 09:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D13610FB56;
	Tue, 12 Apr 2022 07:16:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54D610FC79
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 07:16:55 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id z19so18509964qtw.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 00:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rxaeyf8gbGoNuQoaq4wl2Y+6pdc5/JQoS19NqHJuW/8=;
 b=d1KDrczHO2x/KK7piAkxGQJs3QXW7CifO5FBmpGJS3YJ2Uc/xyt83xcU7KNOhLy4Ys
 v2YcqbMYIuzdx3EccnfqEOSV+PlA6EVR+3sb7Fvu9qVzj4AfpFttrLGH7YbS1PhMMZsW
 lQO/kC+/s/KdqQVvXfiSDqGfBvKPtXr4cTO2uVd7UlMBbyBYofWyKDCnzUuUXkIV7ZAA
 gsO5X9HcO80Iu2Gg+DeDpZfsWpMx/XCcRCKgFUrJzCnj0BGJRzTkVapx9qrZ8drUK1gt
 4y60jjyBYzvunyXPPRjM4Sc3RGMdQyouLNlnL51JOcgDmWHva5Mrc8quTNBtF1SBumJy
 2MJA==
X-Gm-Message-State: AOAM533SnuwgYpKRWyb/hU8ucnrl8VWe6LD7PASrvUW2Q3v1a7jDitl3
 sEpOyCdpN4YPYxUPO58V3jinbt+ODZBwC9CY
X-Google-Smtp-Source: ABdhPJzaO75J9lYSHwLYb4TJ2fufPBn1FFoRcPqmPcROEza9P7SdlEji+CCmOVMyRsEh8Vhkk3bz+w==
X-Received: by 2002:ac8:698a:0:b0:2ed:260f:b751 with SMTP id
 o10-20020ac8698a000000b002ed260fb751mr2222635qtq.89.1649747814478; 
 Tue, 12 Apr 2022 00:16:54 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com.
 [209.85.128.176]) by smtp.gmail.com with ESMTPSA id
 e15-20020ac8670f000000b002e22d9c756dsm23855886qtp.30.2022.04.12.00.16.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 00:16:54 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-2eafabbc80aso190859597b3.11
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 00:16:53 -0700 (PDT)
X-Received: by 2002:a81:618b:0:b0:2db:d952:8a39 with SMTP id
 v133-20020a81618b000000b002dbd9528a39mr29212275ywb.132.1649747813680; Tue, 12
 Apr 2022 00:16:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220411211243.11121-1-javierm@redhat.com>
 <20220411211243.11121-3-javierm@redhat.com>
In-Reply-To: <20220411211243.11121-3-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Apr 2022 09:16:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVuivPSRooR5CqTX6GQtxO6RQYwKUqfOK36zsiN8-v6kg@mail.gmail.com>
Message-ID: <CAMuHMdVuivPSRooR5CqTX6GQtxO6RQYwKUqfOK36zsiN8-v6kg@mail.gmail.com>
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

On Mon, Apr 11, 2022 at 11:12 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> The Solomon SSD130x OLED displays can either have an I2C or SPI interface,
> add to the schema the properties and examples for OLED devices under SPI.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> ---
>
> Changes in v2:
> - Don't add compatible strings with an "-spi" suffix (Geert Uytterhoeven).

Thanks for the update!

> --- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> @@ -39,9 +39,14 @@ properties:
>    reset-gpios:
>      maxItems: 1
>
> +  dc-gpios:
> +    maxItems: 1
> +

Perhaps add a description, and clarify this is for SPI only?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
