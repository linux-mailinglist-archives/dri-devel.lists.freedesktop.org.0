Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4621B57FBF0
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 11:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6758B18B354;
	Mon, 25 Jul 2022 09:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 817B711B3A7
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 09:06:57 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id l14so7769778qtv.4
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 02:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IY0j+H2edk5UsmI6A7sNzAv0qZHfigoVGkZeFtNqZD0=;
 b=OAft5TUYAXK6FHwdudrZ3/ylDTgyd7ApXgH3mCQQrEy/AppLvKLTFrPAuRaeFgFtA7
 It8xo2DsjfOuep3j9cWzIbiJND3QEGySnwIZHLW7+dtLSlt+35HbGtRezBb37b4ET1YA
 T08HOavE/cN4KrCVfDqvDb9AfqV938ASpM6+DesVsCpK+wJIO8i1UyBgvsftmWjtDjOG
 FhD3Z5NBfgipr391g2noPdoBVxJJl+Zl02FqMF/RSg8CvI8FVka2TxagkUfxCYyIA8lN
 BEkxNh5JboG7/J/TGmZM68ALnFQGOS8vaYU/EgWzrbg9AQ2GE7pMqCpLXdsGFwSSNDLe
 gkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IY0j+H2edk5UsmI6A7sNzAv0qZHfigoVGkZeFtNqZD0=;
 b=EllveUakpHw56yCQQO3RHTDLa2UEwHgvwvDygfTFzr2VwaXOLYfnA2WmV5+UGnED4Z
 QmyEN9KG1/eagxgugSUcygGzJ1tvlfFyNaS1+oyYueebmWyrejVmoNPhJrXdHpQo/oY3
 XyAeaO4fpsgVklP0xH3VIJRlzKcQlSSxC2q75Wb244JID3vPXyOsbxX86iqIOiLGw/dW
 F0e/88CcxYHro4odtxYObr9Gly2GWjLYmm1GS1B2d1Tk9oZSMM4FdN8EtrnP+LGJK47t
 XelFmNfsxQW4uhPc0isSnQfUip2+BRKhOecGYlCsgEdoXdUku7582OUTgc5HfVAbYTgg
 0A2A==
X-Gm-Message-State: AJIora/GGFXzwNBIVOmYijT/gcpr1LpY0ZYKfN5JekQde5lic0B1uYF0
 9odY9Tc3qYtjoMYjoLb9LU973w+4/r8QpRioZ3w=
X-Google-Smtp-Source: AGRyM1tJSXMumghoATC65twYRnzaQxdiBNYaldY1M9f4DosemyPp1f+IvX7cbVFcEYtBJ2DRVha2cAhiDgReWJ+n9ic=
X-Received: by 2002:ac8:5d49:0:b0:31f:aa:e632 with SMTP id
 g9-20020ac85d49000000b0031f00aae632mr9318617qtx.427.1658740016501; 
 Mon, 25 Jul 2022 02:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-8-peterwu.pub@gmail.com>
 <CAHp75VfiKMROzxeEaCH6qCthK9qanJPqbjADLMVH-V0upKf+9Q@mail.gmail.com>
 <CABtFH5++4N1mECJ0vN-79WsJJWcBTVxLFgvkiouPf1qev7LHHQ@mail.gmail.com>
 <CAHp75VfKihBLjUFqe_Sj5dqTO7-wjLehAF+9_8-sbUeyJ-ZAmg@mail.gmail.com>
In-Reply-To: <CAHp75VfKihBLjUFqe_Sj5dqTO7-wjLehAF+9_8-sbUeyJ-ZAmg@mail.gmail.com>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Mon, 25 Jul 2022 17:06:20 +0800
Message-ID: <CABtFH5+LvvcVscRotyRYXhXs1pPkCahbVe0NcSFxC4k_WMMsuQ@mail.gmail.com>
Subject: Re: [PATCH v6 07/13] mfd: mt6370: Add MediaTek MT6370 support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
 Heikki" <heikki.krogerus@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alice Chen <alice_chen@richtek.com>, linux-iio <linux-iio@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, cy_huang <cy_huang@richtek.com>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>,
 Rob Herring <robh+dt@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree <devicetree@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, szuni chen <szunichen@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Jingoo Han <jingoohan1@gmail.com>, USB <linux-usb@vger.kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ChiaEn Wu <chiaen_wu@richtek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 25, 2022 at 4:43 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> ...
>
> > > > +#define MT6370_REG_DEV_INFO    0x100
> > > > +#define MT6370_REG_CHG_IRQ1    0x1C0
> > > > +#define MT6370_REG_CHG_MASK1   0x1E0
> > > > +
> > > > +#define MT6370_VENID_MASK      GENMASK(7, 4)
> > > > +
> > > > +#define MT6370_NUM_IRQREGS     16
> > > > +#define MT6370_USBC_I2CADDR    0x4E
> > >
> > > > +#define MT6370_REG_ADDRLEN     2
> > > > +#define MT6370_REG_MAXADDR     0x1FF
> > >
> > > These two more logically to have near to other _REG_* definitions above.
> >

...

>
> You lost me. Namespace has a meaning, i.e. grouping items of a kind.
> In your proposal I don't see that. If REG_MAXADDR and REG_ADDRLEN are
> _not_ of the _REG_ kind as per above, why do they have this namespace
> in the first place?

oh... Sorry, I just got the wrong meaning
maybe it should be revised like this, right??
-------------------------------------------------------------------
#define MT6370_REG_DEV_INFO    0x100
#define MT6370_REG_CHG_IRQ1    0x1C0
#define MT6370_REG_CHG_MASK1   0x1E0
#define MT6370_REG_MAXADDR     0x1FF // Move it to here

#define MT6370_VENID_MASK      GENMASK(7, 4)

#define MT6370_NUM_IRQREGS     16
#define MT6370_USBC_I2CADDR    0x4E

#define MT6370_MAX_ADDRLEN     2    // Rename
-------------------------------------------------------------------

Thanks!

-- 
Best Regards,
ChiaEn Wu
