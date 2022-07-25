Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7958757FC0A
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 11:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F12E8F8D2;
	Mon, 25 Jul 2022 09:10:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92CF18F8D2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 09:10:05 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id bp15so19391755ejb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 02:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BSEtgg8+Hpw/EtiHjL5IRktNHYkZQ4l9B8QMcHNKzRs=;
 b=DvY9h9DoO0kblI5Gb7JOwMF5uAXyYh+0N98faLjkVtDpKYgYiZXw8rUpaon1Qsb+x/
 y8PR5FRgsPRxbCvYRmi6JyQZHxlbh7MXccC1nAKDIdus48fm9phu/mVPu5c/7jnzpiUa
 CeYdC3SruNmPOz8QR4pQRYz+9lbX/PiafhwNwu9n1G7QLCs3uqxyNxwD3CM2frokPBsH
 DkjmmlsnQziUrFfN7mDBzyVBjS82vigYVYvIcaX8uI8LEUmNiadHmdk5ix5lNuZ/1UZ/
 NGL0Cy1cT3KvSr2YKUSTaA8mjLj8kGwovaeEc5qHPC+CgkPbA4CYf9Td2TeI9EthK4eN
 F2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BSEtgg8+Hpw/EtiHjL5IRktNHYkZQ4l9B8QMcHNKzRs=;
 b=aQKMEO8v2U2O+eXO27fOYzrKenBzHc03M4zYGNo8VnCg3uNKehut5W35mUvIH46eMp
 000wIbUrEUBL/o1FFkpOKQq7pdV0tGg5ElMLvDzf2eoK3l3P8POzONreaZzjhGJRYCLi
 VRob5KZWhSa3whi1tYAhJGAY7XSGYQOVhJeHi/gZlmI+2FhxBbQ82SUmM4YUi4ClSJw/
 gKiCoU0AHS+qkwrc3S4Vi7/IomEiWa5eIdjEQIWUrYNU4oEIZjqjcOTg0NFaLt4wZ7Tv
 I8Y8I6yKA/SfW3SheeE26IgQfnlPTTmq88A52/BSe31RE2gug7NWWLHezniZB1g9nKFf
 pPJQ==
X-Gm-Message-State: AJIora/4PEvDDje2VBeUTqDVK/JwYtsmnks7GTYrCPwXD1pgcovl9wqS
 T0kaJhfI1sfzuozWMNpeOoPcaXhKStKi5+EQrIg=
X-Google-Smtp-Source: AGRyM1u9Nn1gh/K3al7D9YTYNDVE3nZB3C3o2fD7AeOdyqGaPbXnVSlqvpk1KEgMM6wZM2t+cB6cSp8E5+GGA2PWOz8=
X-Received: by 2002:a17:907:6297:b0:72f:9aad:fcb with SMTP id
 nd23-20020a170907629700b0072f9aad0fcbmr9108533ejc.161.1658740203874; Mon, 25
 Jul 2022 02:10:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-8-peterwu.pub@gmail.com>
 <CAHp75VfiKMROzxeEaCH6qCthK9qanJPqbjADLMVH-V0upKf+9Q@mail.gmail.com>
 <CABtFH5++4N1mECJ0vN-79WsJJWcBTVxLFgvkiouPf1qev7LHHQ@mail.gmail.com>
 <CAHp75VfKihBLjUFqe_Sj5dqTO7-wjLehAF+9_8-sbUeyJ-ZAmg@mail.gmail.com>
 <CABtFH5+LvvcVscRotyRYXhXs1pPkCahbVe0NcSFxC4k_WMMsuQ@mail.gmail.com>
In-Reply-To: <CABtFH5+LvvcVscRotyRYXhXs1pPkCahbVe0NcSFxC4k_WMMsuQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 25 Jul 2022 11:09:26 +0200
Message-ID: <CAHp75Vd53faWJ8oD2WGQEMAVc-NfoceUUjpOJwy7piaraH8CNA@mail.gmail.com>
Subject: Re: [PATCH v6 07/13] mfd: mt6370: Add MediaTek MT6370 support
To: ChiaEn Wu <peterwu.pub@gmail.com>
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

On Mon, Jul 25, 2022 at 11:06 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> On Mon, Jul 25, 2022 at 4:43 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:

...

> > > > > +#define MT6370_REG_DEV_INFO    0x100
> > > > > +#define MT6370_REG_CHG_IRQ1    0x1C0
> > > > > +#define MT6370_REG_CHG_MASK1   0x1E0
> > > > > +
> > > > > +#define MT6370_VENID_MASK      GENMASK(7, 4)
> > > > > +
> > > > > +#define MT6370_NUM_IRQREGS     16
> > > > > +#define MT6370_USBC_I2CADDR    0x4E
> > > >
> > > > > +#define MT6370_REG_ADDRLEN     2
> > > > > +#define MT6370_REG_MAXADDR     0x1FF
> > > >
> > > > These two more logically to have near to other _REG_* definitions above.

...

> > You lost me. Namespace has a meaning, i.e. grouping items of a kind.
> > In your proposal I don't see that. If REG_MAXADDR and REG_ADDRLEN are
> > _not_ of the _REG_ kind as per above, why do they have this namespace
> > in the first place?

> oh... Sorry, I just got the wrong meaning
> maybe it should be revised like this, right??

I don't know. I am not an author of the code, I do not have access
(and don't want to) to the hardware datasheets, all up to you. From
the style perspective below looks good.

> -------------------------------------------------------------------
> #define MT6370_REG_DEV_INFO    0x100
> #define MT6370_REG_CHG_IRQ1    0x1C0
> #define MT6370_REG_CHG_MASK1   0x1E0
> #define MT6370_REG_MAXADDR     0x1FF // Move it to here
>
> #define MT6370_VENID_MASK      GENMASK(7, 4)
>
> #define MT6370_NUM_IRQREGS     16
> #define MT6370_USBC_I2CADDR    0x4E
>
> #define MT6370_MAX_ADDRLEN     2    // Rename



-- 
With Best Regards,
Andy Shevchenko
