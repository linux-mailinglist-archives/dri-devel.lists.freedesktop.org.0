Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BB655860E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 20:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D2310E544;
	Thu, 23 Jun 2022 18:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15DB510E544
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 18:07:56 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id g12so41647ljk.11
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 11:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pVm8MjXTsJMX8WBaTQ/Z/W23uteGk2WgxtylOJuMvn4=;
 b=ROMSf98OAyUaa6eEUsFo3GNphishFltifgt5QEQzrZNe7sjAM+HfSxcOzzy9W6RXT/
 G9dAp8BarXJwUQv1+UFIl9pO6g0/KNAziFw8OQyNNA2F7tBBoJs6F4EVswlaZ/mtrOUr
 QkvM84BF5zxaVCCNT37WNd2okHNEk6IyyAzwEh1EwAophtbnp7iFhuLKO8Z/XOD1lnUl
 suS5mf6pbLbWkjRhB9QoLtb2LLY0TBOsJTxfjC7JtzRG8wnlujGjvT+fxjiuxQ7n37lq
 7hRGbeT6p1p4iK5XNA2XXK6FCYcJpRLpc3dd/qxtlN637sF3jF8kcCu0NSjABQOuH24p
 9Wcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pVm8MjXTsJMX8WBaTQ/Z/W23uteGk2WgxtylOJuMvn4=;
 b=8KdrpDH/ybOCfpituPOGvvbgCko9MOkXRZokjl0jnvkTV7zw7oB/lmqUsltiOsmvWR
 RbZP1q+KRssV+aCgLTWhzm2VNfkgn+W3QaitXASFN7Ni6VQ8g5tZU9RqvQ3gT6JSSr2q
 zfEISLAIva+ZjbyxinVoEAIC8tJGSUklsphI7CbXdqFd0c/kEjGPf5OrBV0tIHDy2/W3
 7ODNdoUmZG51EZR4oqW9NvsrCCSDqFW11xMM09yFErB53pu8zNiVQVbu2vLimJ6WeQ89
 B42GM2dakzoBOGdDxYG6R1urgAwI5z5tzAPIU8Wx32lDrrZUJCtfJ9l5xswbP2Qpdbvt
 hZyQ==
X-Gm-Message-State: AJIora9N5B117HBgXGxvBKkZWD4ZfMeHbHsr0eEwclacZySTAxOAXMF8
 Q4DnoI1yc4P5Ga6cb0SYhErx2oD1j7xequb8v/0=
X-Google-Smtp-Source: AGRyM1vZgKzYKINQvL/hjv/QKJoSpgQjofBcH1c6rGieXJWJEFKaIjpnuwM4pmWPjKf5o83t+GJsAhFvgJCR3nJUMSQ=
X-Received: by 2002:a2e:b8d2:0:b0:255:93e3:6fb2 with SMTP id
 s18-20020a2eb8d2000000b0025593e36fb2mr5737201ljp.334.1656007673996; Thu, 23
 Jun 2022 11:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-9-peterwu.pub@gmail.com>
In-Reply-To: <20220623115631.22209-9-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 23 Jun 2022 20:07:17 +0200
Message-ID: <CAHp75Vchspgg_VaM+7JHD+2x+-JPkJXSdtLoqQGAx=kg5uAdSg@mail.gmail.com>
Subject: Re: [PATCH v3 08/14] usb: typec: tcpci_mt6370: Add Mediatek MT6370
 tcpci driver
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
 alice_chen@richtek.com, linux-iio <linux-iio@vger.kernel.org>,
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
 chiaen_wu@richtek.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 23, 2022 at 2:00 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: ChiYuan Huang <cy_huang@richtek.com>
>
> Add chip level mt6370 tcpci driver.

...

> +config TYPEC_TCPCI_MT6370
> +       tristate "Mediatek MT6370 Type-C driver"
> +       depends on MFD_MT6370
> +       help
> +         Mediatek MT6370 is a multi-functional IC that includes
> +         USB Type-C. It works with Type-C Port Controller Manager
> +         to provide USB PD and USB Type-C functionalities.

What will be the module name?

...

> +#include <linux/bits.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>

> +#include <linux/of.h>

No user of this header is found in this file.

> +#include <linux/platform_device.h>
> +#include <linux/pm_wakeup.h>
> +#include <linux/pm_wakeirq.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/usb/tcpm.h>
> +#include "tcpci.h"

...

> +       if (did == MT6370_TCPC_DID_A) {
> +               ret = regmap_write(data->regmap, TCPC_FAULT_CTRL, 0x80);
> +               if (ret)
> +                       return ret;

return regmap_write(...);

> +       }
> +
> +       return 0;

...

> +       if (ret && !source)
> +               ret = regulator_disable(priv->vbus);
> +       else if (!ret && source)
> +               ret = regulator_enable(priv->vbus);
> +       else
> +               ret = 0;
> +
> +       return ret;

Can it be

  if (ret && ...)
    return regulator_disable(...);
  if (!ret && ...)
    return regulator_enable(...);

  return 0;

?

...

> +       if (!priv->tcpci_data.regmap) {
> +               dev_err(&pdev->dev, "Failed to init regmap\n");
> +               return -ENODEV;
> +       }

return dev_err_probe(...); ?

...

> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to check vendor info (%d)\n", ret);
> +               return ret;
> +       }

Ditto.

...

> +       priv->irq = platform_get_irq(pdev, 0);
> +       if (priv->irq < 0) {

> +               dev_err(&pdev->dev, "Failed to get TCPC irq (%d)\n", priv->irq);

The message like this is printed in case of error inside
platform_get_irq(), no need to duplicate.

> +               return priv->irq;
> +       }

...

> +       priv->tcpci = tcpci_register_port(&pdev->dev, &priv->tcpci_data);
> +       if (IS_ERR(priv->tcpci)) {
> +               dev_err(&pdev->dev, "Failed to register tcpci port\n");
> +               return PTR_ERR(priv->tcpci);

return dev_err_probe(); ?

> +       }

...

> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to allocate irq (%d)\n", ret);
> +               tcpci_unregister_port(priv->tcpci);
> +               return ret;

Ditto.

> +       }

-- 
With Best Regards,
Andy Shevchenko
