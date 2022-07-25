Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B3157FB5F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 10:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B391D8B7CF;
	Mon, 25 Jul 2022 08:30:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE3B8B7CF
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 08:30:20 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id o21so8074967qkm.10
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 01:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eGTl5W3lU5EPUSxceW+3YfZM8YTmZNPLhO3+yi0Lxxo=;
 b=SchD1OSJhqZUbaDH3npCvBVhvgdsTgcai4JGkAeNGwKszMwOXVv1jP2YUfdpVF00gi
 M7W+LOBWkm3fvR7QR5Oi7Rr243ZKrwIRGyjvM4fEdp3ybWcWAtUz3ifU5jDZ2eCRBBLb
 hVRD5fVGR5o7NHR3kRn8qM+u20mgIRdugneUsK0DRfgczIFrKpOhBB+f9+/lUqaYKRv+
 zCqM+TkCzfpywtt7PK8+F+XO4TuRbG4FDiDPWiwIK0+yYxleqIJNXSwBHMHq6a6DI1r4
 IHORJbjxNq0t+3W70uo7ZSMhJhotvD3N/NslNtJkOTvO+ulZgz6/dODRy4NI0YAEC0V6
 1QjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eGTl5W3lU5EPUSxceW+3YfZM8YTmZNPLhO3+yi0Lxxo=;
 b=gsIIiWkPPZznYXrt1POL8pgXORVlp6z38lLX2+c2px8dlh60R3qMOIIhB+KmzdZIV+
 u3zicHPNTKEjuufGrMAi8T3PkQtqzUOmiPujd7aS9J3dA45uohK8WGfFaSDAABUkwEfG
 fPVj0BHfwoZDycBA6XOXlcM0NQrCYQ7DkCS5yKupTQ46j4n9sdgtJwRCrTa7gm0RH6XH
 shvTKuetzIPYvXGsX+Ee1ldAIZKz97Kic0YdwZh/xJe4D4xDxuoDU2tpSzI4WPzKhjG1
 b2JOh5RM9yJcJ7fM44BTqHgERBQhwOBDgw8cFLV95wvdmhmrIfz2+5R3LjRwFtIOJC0H
 HyiQ==
X-Gm-Message-State: AJIora/x/f3OPo2PaGNrkdPy1esfjJm0xyv+XSIfZb7/ctYZWZQfh2Xk
 8Yk78EYN0gY5nRGtiHGLNZOUuTPGHO8vNRNS9ePpf6A8Pbg=
X-Google-Smtp-Source: AGRyM1tT9zd1NbQQxCDwlfF4CX1SIOVXegpCvtscSaJImwYFwZu4GtSNklBiffb6QTC6/u0h5ukzMhHUITILaRb40TA=
X-Received: by 2002:a05:620a:2942:b0:6b5:e33a:1771 with SMTP id
 n2-20020a05620a294200b006b5e33a1771mr8042028qkp.665.1658737820011; Mon, 25
 Jul 2022 01:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-8-peterwu.pub@gmail.com>
 <CAHp75VfiKMROzxeEaCH6qCthK9qanJPqbjADLMVH-V0upKf+9Q@mail.gmail.com>
In-Reply-To: <CAHp75VfiKMROzxeEaCH6qCthK9qanJPqbjADLMVH-V0upKf+9Q@mail.gmail.com>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Mon, 25 Jul 2022 16:29:43 +0800
Message-ID: <CABtFH5++4N1mECJ0vN-79WsJJWcBTVxLFgvkiouPf1qev7LHHQ@mail.gmail.com>
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

On Mon, Jul 25, 2022 at 4:00 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>

...

>
> > +#define MT6370_REG_DEV_INFO    0x100
> > +#define MT6370_REG_CHG_IRQ1    0x1C0
> > +#define MT6370_REG_CHG_MASK1   0x1E0
> > +
> > +#define MT6370_VENID_MASK      GENMASK(7, 4)
> > +
> > +#define MT6370_NUM_IRQREGS     16
> > +#define MT6370_USBC_I2CADDR    0x4E
>
> > +#define MT6370_REG_ADDRLEN     2
> > +#define MT6370_REG_MAXADDR     0x1FF
>
> These two more logically to have near to other _REG_* definitions above.

Hi Andy,
Thanks for your review.
Do you mean that we should move '#define MT6370_USBC_I2CADDR' and
'#define MT6370_REG_MAXADDR' after the line '#define
MT6370_REG_CHG_MASK1'?
-------------------------------------------------------------------
#define MT6370_REG_DEV_INFO    0x100
#define MT6370_REG_CHG_IRQ1    0x1C0
#define MT6370_REG_CHG_MASK1   0x1E0
#define MT6370_USBC_I2CADDR    0x4E
#define MT6370_REG_MAXADDR     0x1FF

#define MT6370_VENID_MASK      GENMASK(7, 4)

#define MT6370_NUM_IRQREGS     16
#define MT6370_REG_ADDRLEN     2
-------------------------------------------------------------------
Like this?

>
> --
> With Best Regards,
> Andy Shevchenko

-- 
Best Regards,
ChiaEn Wu
