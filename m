Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 735AA577D28
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 10:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DCDAC660;
	Mon, 18 Jul 2022 08:08:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05DBAC658
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 08:08:49 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id s21so11010657pjq.4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 01:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CUvUySPFulLpJMe6eEU3YtP+k2lXPFdi238dz02/TnA=;
 b=pHUAhFihwGq4x+L9IFz64byctPKxMey+1jJrxWMXoIp6tYfspwIQNIMzp7YBTH00xn
 MRzfhJj8RY4NA4mFvpX/dCVWMpW27h/Njmzv7MmAtFUvpbbul8t5EAe192JoL/OYQ6/s
 zYjE+CbBzxnhn/cgTyA0Bs/GtDn+R9lbkor0iXsp+EmPI2KlVUjcMQTUQrIikQ8NHDMp
 I2FQM1xubPFVtXGRB4dZts8UYYxW5QU7vg2DfZS27wC41UjIJhTXDckFd8tPgOzwbvc4
 1cKXpRAi5A/FWLrXPzcBSgixvnKv1XZEewB7e2CcmvZHXmuVo8UORFDuotPcS3/M7CCo
 WblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CUvUySPFulLpJMe6eEU3YtP+k2lXPFdi238dz02/TnA=;
 b=guXP5I54oHqF0KqNUHm0d3QqWVHFwEvQ3sfhsG2hVFCc6bsmBdbDEf/74f1Lj5x4Gm
 pezhmr3gswaj55KdtXYSgZfM8ZZmy9fUFmWNuWrd1yDnteAJE4rdXFhWJmdA1lspBn7T
 fGW9XYjyL11dlLihM1kafI6bnyZTOjryM0NucIg/6RwO3T7OdtWZ/YbcTaWBpMRrmhzi
 jOZBV2k/XTonZOQKgp41nS21D8EjKim/IsZLTQuRes3j09cUapC/WYR0RUKJtOLEr1C5
 /BKG+JEkjrM9BD/GnL8R8+2GQIPiHe9l52j/NHidDj0Gv/1ahgGcBZkBdW/lEBR3fDzr
 gjbg==
X-Gm-Message-State: AJIora+oQQGJZpTMk7bY6jqHs1V0KIj3uJVvWg5/8HI/BctLDzF2Y/oX
 KdxOSbMcB+fYTmgktT/Irfk9ur//PNnomg==
X-Google-Smtp-Source: AGRyM1vhEQ3YQzNXVMn83J82E/AUt4UjMd+K2amzhrVvPs1pmkb06EqRlQYBGCtIVLv6eW+mUn8kbQ==
X-Received: by 2002:a17:902:e888:b0:16c:33f7:89cb with SMTP id
 w8-20020a170902e88800b0016c33f789cbmr27448255plg.2.1658131729130; 
 Mon, 18 Jul 2022 01:08:49 -0700 (PDT)
Received: from cyhuang-hp-elitebook-840-g3.rt
 ([2402:7500:587:e7ad:4982:5f13:5219:614d])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a170903124900b0016cabb9d77dsm8895028plh.169.2022.07.18.01.08.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Jul 2022 01:08:48 -0700 (PDT)
Date: Mon, 18 Jul 2022 16:08:35 +0800
From: ChiYuan Huang <u0084500@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v5 08/13] usb: typec: tcpci_mt6370: Add MediaTek MT6370
 tcpci driver
Message-ID: <20220718080831.GA31509@cyhuang-hp-elitebook-840-g3.rt>
References: <20220715112607.591-1-peterwu.pub@gmail.com>
 <20220715112607.591-9-peterwu.pub@gmail.com>
 <CAHp75VdCgdTOu-CdNo9XGY+PrhPh93v_CkAHJC6hkArsKeiXbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdCgdTOu-CdNo9XGY+PrhPh93v_CkAHJC6hkArsKeiXbA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
 ChiYuan Huang <u0084500@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Guenter Roeck <linux@roeck-us.net>,
 devicetree <devicetree@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 szuni chen <szunichen@gmail.com>, Mark Brown <broonie@kernel.org>,
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

On Fri, Jul 15, 2022 at 03:10:42PM +0200, Andy Shevchenko wrote:
> On Fri, Jul 15, 2022 at 1:28 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> 
> > The MT6370 is a highly-integrated smart power management IC, which
> > includes a single cell Li-Ion/Li-Polymer switching battery charger,
> > a USB Type-C & Power Delivery (PD) controller, dual Flash LED current
> > sources, a RGB LED driver, a backlight WLED driver, a display bias
> > driver and a general LDO for portable devices.
> >
> > This commit add support for the Type-C & Power Delivery controller in
> 
> This commit add -> Add
> 
Upper case? Or rewrite it as 'This commit is to add .....'?
> 
> > MediaTek MT6370 IC.
> 
> 
> > +static int mt6370_tcpc_probe(struct platform_device *pdev)
> > +{
> > +       struct mt6370_priv *priv;
> > +       struct device *dev = &pdev->dev;
> > +       int ret;
> > +
> > +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +       if (!priv)
> > +               return -ENOMEM;
> > +
> > +       priv->dev = dev;
> > +       platform_set_drvdata(pdev, priv);
> > +
> > +       priv->tcpci_data.regmap = dev_get_regmap(dev->parent, NULL);
> > +       if (!priv->tcpci_data.regmap)
> > +               return dev_err_probe(dev, -ENODEV, "Failed to init regmap\n");
> > +
> > +       ret = mt6370_check_vendor_info(priv);
> > +       if (ret)
> > +               return ret;
> > +
> > +       priv->irq = platform_get_irq(pdev, 0);
> > +       if (priv->irq < 0)
> > +               return priv->irq;
> > +
> > +       /* Assign TCPCI feature and ops */
> > +       priv->tcpci_data.auto_discharge_disconnect = 1;
> > +       priv->tcpci_data.init = mt6370_tcpc_init;
> > +       priv->tcpci_data.set_vconn = mt6370_tcpc_set_vconn;
> > +
> > +       priv->vbus = devm_regulator_get_optional(dev, "vbus");
> > +       if (!IS_ERR(priv->vbus))
> > +               priv->tcpci_data.set_vbus = mt6370_tcpc_set_vbus;
> > +
> > +       priv->tcpci = tcpci_register_port(dev, &priv->tcpci_data);
> > +       if (IS_ERR(priv->tcpci))
> > +               return dev_err_probe(dev, PTR_ERR(priv->tcpci),
> > +                                    "Failed to register tcpci port\n");
> > +
> > +       ret = devm_request_threaded_irq(dev, priv->irq, NULL,
> > +                                       mt6370_irq_handler, IRQF_ONESHOT,
> > +                                       dev_name(dev), priv);
> > +       if (ret) {
> 
> > +               tcpci_unregister_port(priv->tcpci);
> 
> This is wrong.
> You mixed devm_ with non-devm. Either drop devm_ *after* the first
> non-devm_ call, or convert everything to be managed.
> 
How about to add 'devm_add_action_or_reset' for tcpci_unregister_port?
This will convert all as 'devm_' version.
> > +               return dev_err_probe(dev, ret, "Failed to allocate irq\n");
> > +       }
> > +
> > +       device_init_wakeup(dev, true);
> > +       dev_pm_set_wake_irq(dev, priv->irq);
> > +
> > +       return 0;
> > +}
> > +
> > +static int mt6370_tcpc_remove(struct platform_device *pdev)
> > +{
> > +       struct mt6370_priv *priv = platform_get_drvdata(pdev);
> 
> > +       disable_irq(priv->irq);
> 
> Why?
> An ugly workaround due to ordering issues in ->probe()?
>
Yes, due to the ordering in probe.
'bus remove' will be called before device resource releases.

Like as you said, another way is to convert all as non-devm
version after 'tcpci_unregister_port'.

If to keep the original order, 'disable_irq' before
'tcpci_unregister_port' can make the flow more safe.

Or you can think one case if irq triggers after
'tcpci_unregister_port'. Null pointer occurs.

Anyway, in next revision, I'll convert all to be 'devm_' version.
For this remove callback, only 'dev_pm_clear_wake_irq' and
'device_init_wakeup' will be kept.

Is this better?

> > +       tcpci_unregister_port(priv->tcpci);
> > +       dev_pm_clear_wake_irq(&pdev->dev);
> > +       device_init_wakeup(&pdev->dev, false);
> > +
> > +       return 0;
> > +}
> 
> -- 
> With Best Regards,
> Andy Shevchenko
