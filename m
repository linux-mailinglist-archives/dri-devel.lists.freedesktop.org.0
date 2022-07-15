Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3A2576EB2
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB6A10F1A7;
	Sat, 16 Jul 2022 14:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C172F10E06A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 15:03:21 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id r3so8863320ybr.6
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 08:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+LrkSO95PVy8bw27Iig3QT1GOG3G5eqBwe6wxhmR/uU=;
 b=QWPiN1LWPmuijdMKT5AAJLiDd75nqTOhtxH5ERUnVqh8bmSoNBzZIgc24Y12QYZbiK
 ZZZ1bonJ6bNj4/7dxSkAiOrS74VCGiXGhWZIxtov9goqlOn5pRrD8dZwQ+LVOT0zjsij
 ZycSe0JZLJo499082g+stfHqVo3HUWmZ9oHqx7dbKQi8DMpwGjlvzsbhEjxZCPUX1VBE
 Uc1tcbJmyRqjXmP4pv/MISV2Q52lQXTzxZ5gH/ZSlXdpnNalR9OhXt02d2SnPVWsqiq1
 Uz2U49YRfc8nBIp8fjPbkLZZkI0e8nu+6vgIwXaucQUeg5o34WZ1leokFfUD1AZgptQc
 30zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+LrkSO95PVy8bw27Iig3QT1GOG3G5eqBwe6wxhmR/uU=;
 b=0XfkK6riAqwyeqqxvls1920H7czW8yLU8Y/Gfhj/GgHB9emcoA411bF5W5v2z+2low
 raFmYCWL/kYxXoPs8QYByr1Kxe8bUwjG9bBGmjmJaL7KzhtvfFssA4NfOSWbVZK+asKd
 NN0YNquzuCYiLjfxwIIuUHXsJpIUYEUg5JOfR9Tdl46p8i+CuxvmOYku3MPjT8i9K+DT
 eVmpNp7NUFetNqn7NjCZ4rqHLLZGoeQCe/oWi3N3tC5BS7CHzMv+cjcVE69TgELovUUQ
 DWWEzhNqfCxoPTNAhcGyiSd1r1Ykje2qpmHf3L6Mhs9LVDD5Uqq3OhgWmwKCYimtd/q0
 Rc8g==
X-Gm-Message-State: AJIora+PwsdAyb0m/jwnEeWkfw6TseO05pBaPre49v1e5aHifyp3fqHp
 D9Cd2+JkZA3SKtIh2wPpaWUxC5vdJTBiSn40rsWms2SmWas=
X-Google-Smtp-Source: AGRyM1vwE3NLxsUuIe5Aj+Ad86KoIRk0zfg8IwPNre3toXOXDCYSWjHhTiLXCjbb3wl3KhuodPQdkjLVkGMg2Yk7hJQ=
X-Received: by 2002:a81:72c4:0:b0:31c:b309:c4e8 with SMTP id
 n187-20020a8172c4000000b0031cb309c4e8mr15864875ywc.520.1657890678612; Fri, 15
 Jul 2022 06:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220715112607.591-1-peterwu.pub@gmail.com>
 <20220715112607.591-9-peterwu.pub@gmail.com>
In-Reply-To: <20220715112607.591-9-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 15 Jul 2022 15:10:42 +0200
Message-ID: <CAHp75VdCgdTOu-CdNo9XGY+PrhPh93v_CkAHJC6hkArsKeiXbA@mail.gmail.com>
Subject: Re: [PATCH v5 08/13] usb: typec: tcpci_mt6370: Add MediaTek MT6370
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

On Fri, Jul 15, 2022 at 1:28 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:

> The MT6370 is a highly-integrated smart power management IC, which
> includes a single cell Li-Ion/Li-Polymer switching battery charger,
> a USB Type-C & Power Delivery (PD) controller, dual Flash LED current
> sources, a RGB LED driver, a backlight WLED driver, a display bias
> driver and a general LDO for portable devices.
>
> This commit add support for the Type-C & Power Delivery controller in

This commit add -> Add


> MediaTek MT6370 IC.


> +static int mt6370_tcpc_probe(struct platform_device *pdev)
> +{
> +       struct mt6370_priv *priv;
> +       struct device *dev = &pdev->dev;
> +       int ret;
> +
> +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       priv->dev = dev;
> +       platform_set_drvdata(pdev, priv);
> +
> +       priv->tcpci_data.regmap = dev_get_regmap(dev->parent, NULL);
> +       if (!priv->tcpci_data.regmap)
> +               return dev_err_probe(dev, -ENODEV, "Failed to init regmap\n");
> +
> +       ret = mt6370_check_vendor_info(priv);
> +       if (ret)
> +               return ret;
> +
> +       priv->irq = platform_get_irq(pdev, 0);
> +       if (priv->irq < 0)
> +               return priv->irq;
> +
> +       /* Assign TCPCI feature and ops */
> +       priv->tcpci_data.auto_discharge_disconnect = 1;
> +       priv->tcpci_data.init = mt6370_tcpc_init;
> +       priv->tcpci_data.set_vconn = mt6370_tcpc_set_vconn;
> +
> +       priv->vbus = devm_regulator_get_optional(dev, "vbus");
> +       if (!IS_ERR(priv->vbus))
> +               priv->tcpci_data.set_vbus = mt6370_tcpc_set_vbus;
> +
> +       priv->tcpci = tcpci_register_port(dev, &priv->tcpci_data);
> +       if (IS_ERR(priv->tcpci))
> +               return dev_err_probe(dev, PTR_ERR(priv->tcpci),
> +                                    "Failed to register tcpci port\n");
> +
> +       ret = devm_request_threaded_irq(dev, priv->irq, NULL,
> +                                       mt6370_irq_handler, IRQF_ONESHOT,
> +                                       dev_name(dev), priv);
> +       if (ret) {

> +               tcpci_unregister_port(priv->tcpci);

This is wrong.
You mixed devm_ with non-devm. Either drop devm_ *after* the first
non-devm_ call, or convert everything to be managed.

> +               return dev_err_probe(dev, ret, "Failed to allocate irq\n");
> +       }
> +
> +       device_init_wakeup(dev, true);
> +       dev_pm_set_wake_irq(dev, priv->irq);
> +
> +       return 0;
> +}
> +
> +static int mt6370_tcpc_remove(struct platform_device *pdev)
> +{
> +       struct mt6370_priv *priv = platform_get_drvdata(pdev);

> +       disable_irq(priv->irq);

Why?
An ugly workaround due to ordering issues in ->probe()?

> +       tcpci_unregister_port(priv->tcpci);
> +       dev_pm_clear_wake_irq(&pdev->dev);
> +       device_init_wakeup(&pdev->dev, false);
> +
> +       return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko
