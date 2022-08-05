Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 031EF58AB5D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 15:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1696210F306;
	Fri,  5 Aug 2022 13:10:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E096C967F5
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 13:10:16 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id i24so1761158qkg.13
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Aug 2022 06:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=9J24cDKKqsOduTS9UUyGj2I+dc2JXq9COm3ho1bp/NE=;
 b=NZ/lhCyR9M4uoWmE11gXdKIY5QHCgnKHevuKo4TMG1DjXmtxuHL9IGeJwZ4LfPJ5Sx
 An9X10WyEwlH6gobWrRkcQrihAvfFo/NEkJHppMNCjVysFpqBcUQppBPmmWv/gJlRwNJ
 AJ5R5hBz/6Z6zt3zcMCzNBlOWAFcgddiIbDO26176idaVxtdAeLEwOB83fyRhNgFshT0
 PgEvwdsJAJBc7N5GmC3tSOdTGVFK5PY33vJvxUo6aKPI13T8ZPWktLxzYyY8DyD7/CRd
 N6n68KF39/cpPvRO/LCj/Zk8AkuXDm7CeFfWTupOMgC5Oh24O5OoP7ydY1qxP317WUAG
 zV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=9J24cDKKqsOduTS9UUyGj2I+dc2JXq9COm3ho1bp/NE=;
 b=2x5F6Jcm+iQqwUMWeNTJHGbDmgzOSMo/kq2lqqeM/urIglRaec5LzNXoB/vtvTEfNa
 rS+yfg322bBjVWWN1wv7oog3IyCN9CSsN9ofD/U0fJRJee2/MpBxmtT5BQRST448+aIx
 A964uH2bkYkE3irs/EVz4X6vV1nuoIwXFoDj43/i1xRKk/ns4hXIOaaLNzONVruaqx5T
 WjdRCKjPYm6s38oiXljALFK3rwn8v5BZrVISmg7TQqwXc36Uz7Myy+Tu4f1j+5BGQMTy
 s3W0qkwPkpXXjEZoBu90XwoVbPPpeUDUuvo1XAjG00muRDyZ0AL/dyKtNpa9ezWqvVXG
 ADkg==
X-Gm-Message-State: ACgBeo3JYPkPQpmsLAnzZf2014ddK9n/M50KTxUI4m+Y1ifsdGlF0aZ8
 fBACf4fqu3EBF3hw3D6oIyeJW6RBrvzHwjE/So4=
X-Google-Smtp-Source: AA6agR6KCeqnEoqyKUTU9bwzHJxmJAXoC1uA/8jBqjS4KNKKgC3bBRK/UzGUzHpzrq29/PrSFNdU8y5czcT3jzWXnGE=
X-Received: by 2002:a05:620a:254d:b0:6ab:84b8:25eb with SMTP id
 s13-20020a05620a254d00b006ab84b825ebmr5054205qko.383.1659705015729; Fri, 05
 Aug 2022 06:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220805070610.3516-1-peterwu.pub@gmail.com>
 <20220805070610.3516-13-peterwu.pub@gmail.com>
In-Reply-To: <20220805070610.3516-13-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 5 Aug 2022 15:09:39 +0200
Message-ID: <CAHp75VcdU6AVdksuhsHkzvD6mOBJ6G=yrmuHA9zAXLroXDFAjg@mail.gmail.com>
Subject: Re: [PATCH v7 12/13] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
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

On Fri, Aug 5, 2022 at 9:07 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: Alice Chen <alice_chen@richtek.com>
>
> The MediaTek MT6370 is a highly-integrated smart power management IC,
> which includes a single cell Li-Ion/Li-Polymer switching battery
> charger, a USB Type-C & Power Delivery (PD) controller, dual Flash
> LED current sources, a RGB LED driver, a backlight WLED driver,
> a display bias driver and a general LDO for portable devices.
>
> Add a support for the MT6370 Flash LED driver. Flash LED in MT6370
> has 2 channels and support torch/strobe mode.

Same comments as per previous LED related patch.

...

> +       /*
> +        * For the flash to turn on/off, we need to wait HW ramping up/down time
> +        * 5ms/500us to prevent the unexpected problem.
> +        */
> +       if (!priv->fled_strobe_used && curr)
> +               usleep_range(5000, 6000);
> +       else if (priv->fled_strobe_used && !curr)
> +               usleep_range(500, 600);

Now it's much better!

...

> +       /*
> +        * Always configure as min level when off to
> +        * prevent flash current spike

/*
 * You need to check the style
 * of multi-line comments like
 * this one.
 */

> +        */

-- 
With Best Regards,
Andy Shevchenko
