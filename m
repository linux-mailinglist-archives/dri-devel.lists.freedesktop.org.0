Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3442858AB40
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 15:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E512B180;
	Fri,  5 Aug 2022 13:07:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AA511B5D8
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 13:06:58 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id m7so1778781qkk.6
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Aug 2022 06:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=3FEi1CuKFHPWHETXS5rrQ8s9GwbgPfiuBefvLvAoBsk=;
 b=KgL/Ti/Sw5zH9EmMfo00bYbabUMlHnfPxzlYp138btnOZ5iHJws2jxCG33uwIKAM57
 ZH9pcxSaQ3WAvKMK+rlXSIpmF9goTDadcJBOaraf9vF+AYXYuuUCk1nn9mZTAv7A84VS
 IGN53sF6SexwC9WgkegcjbT+ydEtt7SJLKzuOXSjM7pv7pItuF3vkyrASesCL/DMFAma
 rvrzVZQfTooocv0qvKbynXnxhJZQrwyBscixkLCW31xTQ5ekgGyzVfdw4/3LfOktLn40
 aBpsyR98kiE/cfno9Vr7LLF4YuYZgav13rVMy6A3nxoUQo28k9pfuse69foAmsjNPvze
 VLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=3FEi1CuKFHPWHETXS5rrQ8s9GwbgPfiuBefvLvAoBsk=;
 b=hFmopxi10XOW4V+RoAxaFEyE5dFAHlu3tZJ+2NNVqoJ6xCDz4qFmOD53JQAVNyKyND
 /QvgVjVEXl96QX45hEIc7nUzVBg55zp28EKK80DCN9PuGNUbUm8T8CcBofZrdTkZcPHc
 /dNWINxOdt3n+6N+Wm/6xREMKAyX9Bt2SZKUEnjpg6v8de0bfZTbHd1WYSReG5Eb8mmG
 0l7Uu5vV/cySCamDoRvNQlO/h9029XH+Xtse/c8xOVUGv2rLPuRaQKHXu5Ripw3DLhYZ
 bAwtTPdSR1h629wBX2zHqD5LpqoYIBSODpDoJqUlbuUFSaVFexEdo9CifX1dta2epClK
 pgOQ==
X-Gm-Message-State: ACgBeo2l93p1pfY3RvFVorTfiNWNEeKVIMB300SVyC8KqtVgvjgo0Imu
 Ny4/mF8vr3PkUCGh8ITtcZrkZ5xIVj11LgmztKo=
X-Google-Smtp-Source: AA6agR4j0zsJqZaQf0Yu4UVNEf1JelHQhvwq9j519MOA8iXjVXlQvyGrJ/GntjcmyE7xYpQsU0Y5iOHVvVZTTJcjLGA=
X-Received: by 2002:a05:620a:31a:b0:6b9:1f1a:7e13 with SMTP id
 s26-20020a05620a031a00b006b91f1a7e13mr727146qkm.748.1659704817063; Fri, 05
 Aug 2022 06:06:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220805070610.3516-1-peterwu.pub@gmail.com>
 <20220805070610.3516-14-peterwu.pub@gmail.com>
In-Reply-To: <20220805070610.3516-14-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 5 Aug 2022 15:06:19 +0200
Message-ID: <CAHp75VfiYNzmcPN8LNqvU0jKuWVFR3ODY3iWaJwpDxUdSORTOg@mail.gmail.com>
Subject: Re: [PATCH v7 13/13] video: backlight: mt6370: Add MediaTek MT6370
 support
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

On Fri, Aug 5, 2022 at 9:08 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: ChiaEn Wu <chiaen_wu@richtek.com>
>
> MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
> with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
> driver, display bias voltage supply, one general purpose LDO, and the
> USB Type-C & PD controller complies with the latest USB Type-C and PD
> standards.
>
> Add a support for the MediaTek MT6370 backlight driver.
> It controls 4 channels of 8 series WLEDs in
> 2048 (only for MT6370/MT6371) / 16384 (only for MT6372)
> current steps (30 mA) in exponential or linear mapping curves.

...

> +#include <linux/backlight.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/kernel.h>
> +#include <linux/minmax.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>

> +#include <linux/of_device.h>

Why? Since below drop this and use fully fwnode / device property APIs.

> +#include <linux/platform_device.h>

Missed property.h which is heavily used in.the driver

> +#include <linux/regmap.h>

...

> +       /*
> +        * MT6372 uses 14 bits to control the brightness but MT6370 and MT6371
> +        * use 11 bits. They are different so we have to use this function to
> +        * check the vendor ID and use different mask, shift and default
> +        * maxiimum brightness value.

Use spell-checker for all your patches.

> +        */

-- 
With Best Regards,
Andy Shevchenko
