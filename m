Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E28A18CA06
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 10:18:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88DC96EAF9;
	Fri, 20 Mar 2020 09:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611246EAF9
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 09:18:44 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id o124so1542140vkc.4
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 02:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5ISVSnKmF/MakKn5Kt0SsXbF6hSdLTpfQPG8zF5GUvw=;
 b=rq2K7aZqr5ZlhOCPpZDpZZiXqSl7sFlboUSiiy7sgodjfwz6wWG+P0EVz8CZ/UOzxa
 U0ZfibIhlKx+gZUKS8l6/75yq9SVgK0fbSTixwbezuj2CpY69I03yIgXTsdnPdhUO4Qs
 sZLenYxULnV9MLchiMUHXbkcD503elboyjYY/AHedah/zjCh9jGyjs5iRi5rpys+pweK
 196yoqvVJbB9zapDDPEiny07lhgx4MKp6VgxRDcKht3JthA8nAY7idDdkUh3i0wVlYZ9
 C7JMu/jb/gzm8L3cQRU/qAcXRyUybgZ/9+W4qWY2QZ5uuKq8+xnVAQ1aSV2XvL0II9+s
 0OXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5ISVSnKmF/MakKn5Kt0SsXbF6hSdLTpfQPG8zF5GUvw=;
 b=BcmvC+q/7OjtnsHCxtpah4SO7n7A6ZsrTCC0rx6CsV4YAGRiUiibNUA5zd36hpsOFi
 QdQrF8SySI+tYmPGj7M5ETuPvFfW+BJC75ZmVWQl3vOuW5dLJDH1F0jLSjyUhEfOA9C5
 exez/zzByfOvfo3rdVyrzhnvGlZMbGTnvWITcoa/KaUT0eVcJp7uuoqiggyc5fVolrby
 Rfo9hPhQFP2ameYuYfUOnUDUPUczM99njjjiSYOMPbLFg5/XxKELdyVIrcJ2xqgEUYFM
 IoJqHcn7mWaqsK4wG/P8R0K6/lmMBS2JUe46gBQjX86Z7yT3gnfxEqhet7gRLiSw+MEK
 ywuQ==
X-Gm-Message-State: ANhLgQ0jvDyuIC7Cjpum7kqG7o+/BFbFtVVTmiSiLxDVgmcpBfXNwy8B
 J4Py41scli4lt3+6S53hPvFMRS682Wbgn99etg/XGA==
X-Google-Smtp-Source: ADFU+vubD841oKMXD9X/IHF/SwMMr59cNF12qIJGQC98Ru0PzxwUkbXhLRuj3tsujKYP/IY02djiUsWk8Nnpg/XpzVE=
X-Received: by 2002:a1f:e9c1:: with SMTP id g184mr4605100vkh.30.1584695923452; 
 Fri, 20 Mar 2020 02:18:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200316133503.144650-1-icenowy@aosc.io>
 <20200316133503.144650-4-icenowy@aosc.io>
 <CACRpkdahrHmXWpdqoApFEq6cW2gatMfds9SMZGwsUnNHt+J0aQ@mail.gmail.com>
In-Reply-To: <CACRpkdahrHmXWpdqoApFEq6cW2gatMfds9SMZGwsUnNHt+J0aQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Mar 2020 10:18:31 +0100
Message-ID: <CACRpkdZnTf2jPrPV++1HDk4tf2BK2NJnv5gkd-1Nc5KT3pu0NQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] drm: panel: add Xingbangda XBD599 panel
To: Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>
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
Cc: Ondrej Jirman <megous@megous.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

So following up on this:

We should state in the commit message that this driver is for all
displays using the Sitronix ST770x display controllers.
The driver should be named panel-sitronix-st770x.c.

On Thu, Mar 19, 2020 at 3:08 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> > +/* Manufacturer specific Commands send via DSI */
> > +#define ST7703_CMD_ALL_PIXEL_OFF 0x22
> > +#define ST7703_CMD_ALL_PIXEL_ON         0x23
> > +#define ST7703_CMD_SETDISP      0xB2
> > +#define ST7703_CMD_SETRGBIF     0xB3
> > +#define ST7703_CMD_SETCYC       0xB4
> > +#define ST7703_CMD_SETBGP       0xB5
> > +#define ST7703_CMD_SETVCOM      0xB6
> > +#define ST7703_CMD_SETOTP       0xB7
> > +#define ST7703_CMD_SETPOWER_EXT         0xB8
> > +#define ST7703_CMD_SETEXTC      0xB9
> > +#define ST7703_CMD_SETMIPI      0xBA
> > +#define ST7703_CMD_SETVDC       0xBC
> > +#define ST7703_CMD_SETSCR       0xC0
> > +#define ST7703_CMD_SETPOWER     0xC1
> > +#define ST7703_CMD_UNK_C6       0xC6
> > +#define ST7703_CMD_SETPANEL     0xCC
> > +#define ST7703_CMD_SETGAMMA     0xE0
> > +#define ST7703_CMD_SETEQ        0xE3
> > +#define ST7703_CMD_SETGIP1      0xE9
> > +#define ST7703_CMD_SETGIP2      0xEA

I should have seen the ST7703 prefix shouldn't I...

> This actually looks very much like an Ilitek display controller.
> Some commands are clearly identical to Ilitek ILI9342:
> http://www.ampdisplay.com/documents/pdf/ILI9342_DS_V008_20100331.pdf

I'm still wondering about the apparent similarity between
ST770x and Ilitek ILI9342, haha :D

> 1. Try to determine what the actual display controller
>   is. I think it is some Ilitek.

OK so this is Sitronix ST770x.

> 2. Write a panel-ilitek-ili9342.c (if that is the actual controller)
>   and parameterize it for this display controller the same
>   way we do in e.g. panel-novatek-nt35510.c or
>   panel-ilitek-ili9322.c, so you use the compatible string
>   to set up the actual per-display settings for this display
>   controller.

This should be panel-sitronix-st770x.c

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
