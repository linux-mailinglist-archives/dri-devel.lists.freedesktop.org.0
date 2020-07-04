Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D7A2148CC
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jul 2020 23:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E652E6EB8A;
	Sat,  4 Jul 2020 21:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE38A6EB8A
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 21:03:32 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id k22so17856554oib.0
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jul 2020 14:03:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yut0ecpXXGBYkNUyjPkKKir3ho9UA6fe0bH3wwD2YtA=;
 b=A8vz++peYJwrZQ1cSXVc6kVlSYCLI1i6IAKirWy6YjtwwHvIovBXvgsAFLW75daxaa
 t3l6dXhxPF3tTTYTmj4RVpxA1BtmGz+wKA2Lu8mJ6A2OmryK+N3A/X+x32euoLACakRp
 odW/htpbuxwt0hgb6ZGxV/FA1xFl7xuZ/qWqJJyVj5/6DhUhv/IZpcJ+qh5dRiPZybHE
 oLATaqOorpeePF42vJuk9zveuKkyVxwbeo90USIJp0QGnUFW3o3GDwUH+JbzoZj8yn6b
 +ok3dMFc++ne5nrswyUCDEGuNX0UxITIG4UDH2hWzPTkycjBGaVzYv70ohDDDHHEBplz
 +nXA==
X-Gm-Message-State: AOAM532iQifKLwpq5rSzw1FfQWrK9tFrxCWVCsZ3mbsBO6RMtLTZQe1H
 C09TBlE2lm+YKaEy+jUw0Z1/qInhqEf+/RMtuJg=
X-Google-Smtp-Source: ABdhPJyTCoq8/XCSR+AJg+1hDROJChzwPNMYZ5Lb1va9EPUV35YM2IZobwkleBvxakacYZY5XTsZ9MpukAzF2eKN250=
X-Received: by 2002:aca:1801:: with SMTP id h1mr26808470oih.148.1593896612172; 
 Sat, 04 Jul 2020 14:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200704143544.789345-1-sam@ravnborg.org>
 <20200704143544.789345-2-sam@ravnborg.org>
In-Reply-To: <20200704143544.789345-2-sam@ravnborg.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 4 Jul 2020 23:03:21 +0200
Message-ID: <CAMuHMdXWXk=QUbpFeX6bjwp+JWKgHqiQALTdQJgSgwBRkyvkRA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] dt-bindings: fix simple-framebuffer example
To: Sam Ravnborg <sam@ravnborg.org>
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
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thanks for your patch!

On Sat, Jul 4, 2020 at 4:37 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> Now that dt-extract-example gained support for using root nodes
> in examples, update the example for the simple-frambuffer binding to use it.

simple-framebuffer

> This gives us a better example and kill a long standing warning:
>
> simple-framebuffer.example.dts:23.16-39.11:
> Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
>
> Note: To get the update dt-extract-example execute:
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

> --- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
> +++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
> @@ -152,28 +152,29 @@ additionalProperties: false
>
>  examples:
>    - |
> -    aliases {
> -      display0 = &lcdc0;

Why drop the aliases example?

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
