Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E3D576EC5
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E2510F2C4;
	Sat, 16 Jul 2022 14:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99F610E06A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 15:00:08 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id i206so8859722ybc.5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 08:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cjk0QcLK7Qj7+zbxyz81ybo9xTsZsUl/7XEcNiCSZlk=;
 b=I/KxJOarbkD3CTr6bI1+GX+R+0NK3NiJOovyOkNmpfsXSDv2vhcKk5NI+vZftnkbGg
 MwrvPAOczLpV/PzuzznMkxCSxJ+6WcBxz2SeXhuGLsY0hH+bxgIA+vAWaqy8gXKWAq2A
 uzFOe2j4x3jy2QIvV7SK11B49LyIqafJ56HKzoiej9S7S0ggTmMqLI8tQrHvAJsSRq/z
 rNeHJ2pSwMUMYzeC8dNaH6ecQWQOtzNB7/eDnb0GxvTouw5w6xHmU0P81MLtH8ioFMQA
 fU5zDFovh6s+bvTishJ0zl5v/l4nnJ809RZNoyuqT7PXEo9cUMjGqySfB+fn2ERJmoLs
 3duw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cjk0QcLK7Qj7+zbxyz81ybo9xTsZsUl/7XEcNiCSZlk=;
 b=Q12AzoTR6/siLj8XuCBoRh/Zip30Ks3OGnnYHMB7uMxDwFwZkwmWpkKE0lEraO0ONl
 2rls7Er/a1joZuEiSmXPln/klbd1rEaswwkVtZW723JPTD77urpLxDfOzwuHZOLmOpMz
 EUDoB2XXJaKZZx0e7GS+VA/w49nzRs8bWuPl5DCcaED7D/SYoWYUX6vQa7glJ6qpKsks
 6e2aUbltffZZ6qsFs4GukbHKLNFndo9rpLqEpsJTVZKUElsaB+vG/x6nuMq9S0iruRev
 oNG1wctQwwrtz0w3CTb65b3dnXFIiOYXArPpK67zLLnDybxKMiW2r0MBjq6d48rRHpoT
 7+vQ==
X-Gm-Message-State: AJIora+0VM/5qnv7kEnCDPn7BpEIriOyEOinHrCtdRULKN2kJjbpDHRJ
 QsZ3n3XgcEKM0F2erUsSgbFJigeAb3GDBhg7PtJVdTyfLEI=
X-Google-Smtp-Source: AGRyM1u3gUyh808T1Pv3+nx4gv3OvZpiRmNXNk53IV5K4A6JGQG9S+KaILzgC03cdHtsws8VU8kBi0pySHUZ77kiRtY=
X-Received: by 2002:a05:6902:1143:b0:66e:eb08:4c23 with SMTP id
 p3-20020a056902114300b0066eeb084c23mr14488436ybu.570.1657890376848; Fri, 15
 Jul 2022 06:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220715112607.591-1-peterwu.pub@gmail.com>
 <20220715112607.591-12-peterwu.pub@gmail.com>
 <d7157483-a6c6-1883-6fc1-d518c7095288@collabora.com>
In-Reply-To: <d7157483-a6c6-1883-6fc1-d518c7095288@collabora.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 15 Jul 2022 15:05:40 +0200
Message-ID: <CAHp75VdzG4hjcMDv5Qro25gJx+adO-rNTiCx9ez30uVoUX-odg@mail.gmail.com>
Subject: Re: [PATCH v5 11/13] leds: mt6370: Add MediaTek MT6370 current sink
 type LED Indicator support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, "Krogerus,
 Heikki" <heikki.krogerus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>,
 Alice Chen <alice_chen@richtek.com>, linux-iio <linux-iio@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, cy_huang <cy_huang@richtek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>,
 Rob Herring <robh+dt@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree <devicetree@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, szuni chen <szunichen@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ChiaEn Wu <peterwu.pub@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Jingoo Han <jingoohan1@gmail.com>, USB <linux-usb@vger.kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ChiaEn Wu <chiaen_wu@richtek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 15, 2022 at 2:40 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> Il 15/07/22 13:26, ChiaEn Wu ha scritto:

...

> > +#define STATE_OFF                            0
> > +#define STATE_KEEP                           1
> > +#define STATE_ON                             2
>
> I propose, instead:
>
> enum mt6370_state {
>         STATE_OFF = 0,
>         STATE_KEEP,
>         STATE_ON,

>         STATE_MAX,

Usually we don't put commas at the terminator entries.

> };

-- 
With Best Regards,
Andy Shevchenko
