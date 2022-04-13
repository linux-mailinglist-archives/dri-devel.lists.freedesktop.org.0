Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D352E4FF4E9
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 12:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2692010E06C;
	Wed, 13 Apr 2022 10:38:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9527610E06C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 10:38:39 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id a10so1245811qvm.8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 03:38:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3iDGAJ5ErJY5+DCJE/DoojvcRcjppzMgRco5mDjRgB4=;
 b=0KnJxLgLVWXjL9c+RgxOwUXVzlqlzP9Q2Bvu7CHprjLTJYtzrAfNnR+H/cw6Ju2AGI
 ZiBKDaiPsE4up1WR/WXeyCfxc+awREbM/5dVSTDmc/yQQB8OFCPFI++M+qejj+b4uKLg
 cgu2hIdu0ijslbQakQcAspxRh2Ab8DvGyDcKYasUuMjoRXx4F+kZ9Wl1Werbz95eU0vB
 tdPS542wA5piMUGA6MhSaF1V9czuUNfPuG6K2jclr9H3ZrUpRKv5ONY2icbv4XSFJ2Or
 6DzUdq11mH4oQrQZDQ29J76aBOSpcX3ZA+olh4gdTnjaDGVti7319tFlzje1lfIHGdHi
 wmSA==
X-Gm-Message-State: AOAM532SE6/PdQjQzDJaxtqw2eORWovS+xC/lc8LfzyyFZmEkS0zbPAg
 ual63PFJzFdokJksUhNrnhpUOnlkDXpdNw==
X-Google-Smtp-Source: ABdhPJxKqOhfxe5T6ZqnKvSnMLnbCbPPFnUHSC9jCafR1ar+5H/sxnAJMJosRpep5vc3vrNHV4+lNg==
X-Received: by 2002:a05:6214:d4a:b0:444:39bc:dfbd with SMTP id
 10-20020a0562140d4a00b0044439bcdfbdmr16016497qvr.81.1649846318098; 
 Wed, 13 Apr 2022 03:38:38 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com.
 [209.85.128.169]) by smtp.gmail.com with ESMTPSA id
 g72-20020a379d4b000000b0069c0f9b1325sm6507217qke.21.2022.04.13.03.38.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 03:38:37 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-2ec05db3dfbso17073077b3.7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 03:38:37 -0700 (PDT)
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id
 m3-20020a81c703000000b002d0cc6b3092mr33591611ywi.449.1649846317128; Wed, 13
 Apr 2022 03:38:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220412162729.184783-1-javierm@redhat.com>
 <20220412162729.184783-3-javierm@redhat.com>
 <CAMuHMdUDxexqsGjb3B37jW_xZU1TBLq8gK5hctA+PKjL+LhQGQ@mail.gmail.com>
 <ddf107c7-5108-f366-45a8-e7244cdcd209@redhat.com>
In-Reply-To: <ddf107c7-5108-f366-45a8-e7244cdcd209@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Apr 2022 12:38:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVTPquOXGwf3YcMDHYyW9=UjRyk7Qhy+HNVThbk355wcQ@mail.gmail.com>
Message-ID: <CAMuHMdVTPquOXGwf3YcMDHYyW9=UjRyk7Qhy+HNVThbk355wcQ@mail.gmail.com>
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

On Wed, Apr 13, 2022 at 11:44 AM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> On 4/13/22 10:04, Geert Uytterhoeven wrote:
> > On Tue, Apr 12, 2022 at 6:27 PM Javier Martinez Canillas
> > <javierm@redhat.com> wrote:
> >> The Solomon SSD130x OLED displays can either have an I2C or SPI interface,
> >> add to the schema the properties and examples for OLED devices under SPI.
> >>
> >> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> >> Acked-by: Mark Brown <broonie@kernel.org>
> >> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> ---
> >>
> >> Changes in v3:
> >> - Add a comment to the properties required for SPI (Geert Uytterhoeven)
> >
> > Thanks for the update!
> >
> >> --- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> >> +++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> >> @@ -38,9 +38,16 @@ properties:
> >>    reset-gpios:
> >>      maxItems: 1
> >>
> >> +  # Only required for SPI
> >> +  dc-gpios:
> >> +    maxItems: 1
> >
> > Actually I meant to also add a description, like for vbat-supply below,
> > to explain the meaning of "dc".
> >
>
> Ahh, sorry for misunderstanding you! Something like the following looks good ?
>
>   # Only required for SPI
>   dc-gpios:
>     description:
>       GPIO connected to the controller's D/C# (Data/Command) pin,
>       that is needed for 4-wire SPI to tell the controller if the
>       data sent is for a command register or the display data RAM
>     maxItems: 1
>
> If you agree with that, then can squash before pushing or add it to a v4
> if another revision is needed.

Thanks, LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
