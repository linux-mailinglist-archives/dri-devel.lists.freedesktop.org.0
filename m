Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA4B565EAE
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 22:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548FE10EE70;
	Mon,  4 Jul 2022 20:54:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D69510F7A4
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 20:54:00 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id o2so13328252yba.7
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jul 2022 13:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yX/+5EHmJzouiASTPWEy2vcXLPBh//GiWKeXcuGIwQ8=;
 b=B3+vMtHkh7oMCAMnDoWG8DEYz2b0JCtP5ZfXbihV47SV3dWC+3OwqEGsEMwBqAFjz7
 khAxgZHq8sJMmNaICKe6NssutaTTjWLNGJBKORgb6vraCnVB5t+OtelrciWNFx45ctsy
 JvI3604+UpHWwrRhFauDs9e1foPdkNSdzNHqlHWwdWLiIR5uNgh7cOgQIAGgo+d4nbqk
 vWBgis+eV5qV8Zk/AkWLLfaslFlFZF3eEW3XKUxRruxM5WjKyLFbe1tfQJnycOJwtO/v
 olhGLIkEl+ub8ONlqXskW875SxgXQbu+BJdjC1nw7gUrRk69EDJ2IlghqhNSArZzWIXy
 kOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yX/+5EHmJzouiASTPWEy2vcXLPBh//GiWKeXcuGIwQ8=;
 b=LaHE/b11JllXYQ7GS9XDwbFO0dFkZ0DaEKDHhxf1Cz+uRZI+v5hxJEvGNsitH7aU32
 pr8mgnXx9iA0yFpgxVPUxd9Zv9qtDDgsFVNm/qXTsPQH7jgRVDE6tIf2hrmNLS8Bi1u4
 GqE46rzC4B02saf+an6Fdqi6la0fvUQ6ZQazHf9VT+/IJRJzAbpAIfpGzZKCaj0LB8KF
 Lb4IEXJ12P4Vk45EOcOmz4pR+02sqvTMOtLXZSjXvTEdOfhcKsw6kaPAaZ8jdBOo5Iuc
 o6D/BiG0FX5+fRXU/MrcwwSqhh7wWhtafUOhTCQD56ZmDS8MVt5Zri3XwCt2e7/V+9Gt
 88iA==
X-Gm-Message-State: AJIora/CwKlDuRpV28TTa5MUSqhPe2AuNE6K252E2YbmMWbBa5esjKiY
 m1MpR2N98C46SmjXZ3pwLnqA0Zx7/trRLLF17i4=
X-Google-Smtp-Source: AGRyM1vdKb73hFj3ExY6oJ2GrDF+CZ7xFkfm6isQFNTZlGTiO++q+Ae1pyvqGIbKKpGLxpNoMkavQ8hfM3hWhEKqjS4=
X-Received: by 2002:a05:6902:c4:b0:64b:4677:331b with SMTP id
 i4-20020a05690200c400b0064b4677331bmr33612017ybs.93.1656968039226; Mon, 04
 Jul 2022 13:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220704053901.728-1-peterwu.pub@gmail.com>
 <20220704053901.728-11-peterwu.pub@gmail.com>
In-Reply-To: <20220704053901.728-11-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 4 Jul 2022 22:53:22 +0200
Message-ID: <CAHp75VfFWyvO44XjRCrx=caCLK0EX5gOfF6fnydZeegFBqJrzw@mail.gmail.com>
Subject: Re: [PATCH v4 10/13] power: supply: mt6370: Add Mediatek MT6370
 charger driver
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

On Mon, Jul 4, 2022 at 7:42 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:

> Add Mediatek MT6370 charger driver.

...

> +         This driver can also be built as a module. If so the module

If so,

> +         will be called "mt6370-charger.ko".

No ".ko" part.

...

> +#define MT6370_MIVR_IBUS_TH_100_MA     100000

mA

...

> +       if (mt6370_chg_fields[fd].range) {
> +               return linear_range_get_value(mt6370_chg_fields[fd].range,
> +                                             reg_val, val);

> +       } else {

Redundant 'else'.

> +               *val = reg_val;
> +               return 0;
> +       }

...

> +               if (fd != F_VMIVR)

Why not positive conditional?

> +                       linear_range_get_selector_within(r, val, &val);
> +               else {
> +                       ret = linear_range_get_selector_high(r, val, &val, &f);
> +                       if (!ret)
> +                               val = r->max_sel;
> +               }

Checkpatch didn't complain about the absence of {} ?

...

> +       irq_num = platform_get_irq_byname(pdev, irq_name);
> +       if (irq_num >= 0) {

  if (irq_num < 0)
    return;

> +               if (en)
> +                       enable_irq(irq_num);
> +               else
> +                       disable_irq_nosync(irq_num);
> +       }

...

> +       /* Check in otg mode or not */

OTG

...

> +static int mt6370_chg_set_online(struct mt6370_priv *priv,
> +                                const union power_supply_propval *val)
> +{
> +       unsigned int pwr_rdy = !!val->intval;

Seems you are using int as boolean, do you need it specifically for
something? Otherwise use boolean here.

> +
> +       mutex_lock(&priv->attach_lock);
> +       if (pwr_rdy == !!priv->attach) {
> +               dev_err(priv->dev, "pwr_rdy is same(%d)\n", pwr_rdy);
> +               mutex_unlock(&priv->attach_lock);
> +               return 0;
> +       }
> +
> +       priv->attach = pwr_rdy;
> +       mutex_unlock(&priv->attach_lock);
> +
> +       if (!queue_work(priv->wq, &priv->bc12_work))
> +               dev_err(priv->dev, "bc12 work has already queued\n");
> +
> +       return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko
