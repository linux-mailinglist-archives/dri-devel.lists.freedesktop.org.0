Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 609C755870F
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 20:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E195E10E08F;
	Thu, 23 Jun 2022 18:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9390B10E767
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 18:19:34 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id t25so373498lfg.7
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 11:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sBMGPYDRnJPeUwS8rUCcWoIIaqQNv7Xsce74kY6zINI=;
 b=BJrh0YPvvBPOk2FgsQMFRa2Mypjcm71ylJrq31IKtpANvhN4g8KLB7ntFQNq9IZHVF
 l6ZhSU+TlBFMgNnWeh7Eoj5Ib1pOugR8/ndpuPy4VRRMJ6LnlT4CTMEzgfF4vBExrKon
 Wo9h20LnpfRWOTcCAHW7Udyx6kQ1lpY2Hv/XvCOnPkvGMJrQAMlcIYbPHW/+QvkLPw/v
 z1lAydtVEKdwcueGxWsSL7la7BCLCRYzBxgeXh32PNyM7jHQtn8jXHCrjG/yF8ym1dip
 s0nAMXw5V2WlQuo+mpIp+OLG/gu7Zn8xLGMejPmMkd4+e9tWrl/+j7x7jETixBbgqiPc
 vqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sBMGPYDRnJPeUwS8rUCcWoIIaqQNv7Xsce74kY6zINI=;
 b=XDZQu7Fq7HNO+Gl8jwP0yU2dsEDY6pQpm6KmrSHcGFXbNWUEXddafuC4yIoEkLHPVI
 IjLlIvZLersaqyoWRnfphJ/hiDjnkSi/9Sk7R0rCsG9+noBsS255UohlAfaefwj/360c
 4etaP16eclEKR1t7Zelgda8pYJ5nv+P1uVMLVCGEeXLfX+xMK1nL/wZDsQ42IDDWCFwI
 OiBl0LfzF7l9rVl/L9zV4jxXiSQVjdL0qA0zalXXtGm6q/7IQQKnU1h+ym5Ph8EXpBpM
 WThspjH1J6wSsqQgn/TossVIP7aa+2VcZ2qRef39z4SGRhORA916yr2s85pBbc713lIG
 j40w==
X-Gm-Message-State: AJIora8TpE4daBN7SO34/GpVaC+AgsLMOgJ2J0EuiXK52mGyRPPOFos6
 yoKE7Bwy2RRD6IN/3tk0yHOCKtxfeMG6nnS54Pc=
X-Google-Smtp-Source: AGRyM1sSt9RqJEWu2voYn8rYod2JWrA9S0VKzO5KainJy6NBR3RGPl9JAy9lFNfNLGcH9lioXFXtCJIfjWl2wSCUbcc=
X-Received: by 2002:a05:6512:151f:b0:47d:dd0c:1d1c with SMTP id
 bq31-20020a056512151f00b0047ddd0c1d1cmr6036883lfb.207.1656008372915; Thu, 23
 Jun 2022 11:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-10-peterwu.pub@gmail.com>
In-Reply-To: <20220623115631.22209-10-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 23 Jun 2022 20:18:56 +0200
Message-ID: <CAHp75VdgxR9aFQmi_MPrX=t7RMnKDiLAwWMvxbpW9OoQMJkKyw@mail.gmail.com>
Subject: Re: [PATCH v3 09/14] regulator: mt6370: Add mt6370 DisplayBias and
 VibLDO support
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
> Add mt6370 DisplayBias and VibLDO support.

...

> +#include <linux/bits.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>

> +#include <linux/of.h>

Any users of this? (See below)

> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/machine.h>

...

> +#define MT6370_LDO_MINUV       1600000
> +#define MT6370_LDO_STPUV       200000
> +#define MT6370_LDO_N_VOLT      13
> +#define MT6370_DBVBOOST_MINUV  4000000
> +#define MT6370_DBVBOOST_STPUV  50000
> +#define MT6370_DBVBOOST_N_VOLT 45
> +#define MT6370_DBVOUT_MINUV    4000000
> +#define MT6370_DBVOUT_STPUV    50000
> +#define MT6370_DBVOUT_N_VOLT   41

If UV is a unit suffix, make it _UV.

...

> +               .of_match = of_match_ptr("dsvbst"),

Would it even be called / used if CONFIG_OF=n?

...

> +               .regulators_node = of_match_ptr("regulators"),

Ditto.

...

> +       for (i = 0; i < ARRAY_SIZE(mt6370_irqs); i++) {
> +               irq = platform_get_irq_byname(pdev, mt6370_irqs[i].name);
> +
> +               rdev = priv->rdev[mt6370_irqs[i].rid];
> +
> +               ret = devm_request_threaded_irq(priv->dev, irq, NULL,
> +                                               mt6370_irqs[i].handler, 0,
> +                                               mt6370_irqs[i].name, rdev);
> +               if (ret) {

> +                       dev_err(priv->dev,
> +                               "Failed to register (%d) interrupt\n", i);
> +                       return ret;

return dev_err_probe(...); ?

> +               }
> +       }

...

> +       for (i = 0; i < MT6370_MAX_IDX; i++) {
> +               rdev = devm_regulator_register(priv->dev,
> +                                              mt6370_regulator_descs + i,
> +                                              &cfg);
> +               if (IS_ERR(rdev)) {

> +                       dev_err(priv->dev,
> +                               "Failed to register (%d) regulator\n", i);
> +                       return PTR_ERR(rdev);

return dev_err_probe(...); ?

> +               }
> +
> +               priv->rdev[i] = rdev;
> +       }

...

> +       if (!priv->regmap) {
> +               dev_err(&pdev->dev, "Failed to init regmap\n");
> +               return -ENODEV;
> +       }

return dev_err_probe(...);

-- 
With Best Regards,
Andy Shevchenko
