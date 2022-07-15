Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA555576EEA
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6786E10F8CB;
	Sat, 16 Jul 2022 14:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D80810E028
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 16:52:04 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-31c8a1e9e33so52552727b3.5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 09:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y3fEn7k6DEbC0BSZl5T1cKqr6t4t3jgvkJEo6o2VWJg=;
 b=MXGzp2L91pEJL+AcTAycFNXQ1RlDsP6v+gpGIgwODuesPa+p9Vkg4kB7S9nocynJGw
 Z6eSLqvXs18KQxUaf2JoIzf80wNgEBx5lb8hmQls/pYl5cmqKU6ZV2U293CPRD7pHPxN
 oVoCyNl0NZggmwruE29B+fIK5bXDrw9tjgIG3C8Nq+6m6OWBSRplWoiH96JI+OT2GKU0
 e+tCPQwL8IYMCW95SAqKMM4ZmBlz4myO2waTWwKa21CY9s4W7s12O0mKU6NbZpFIBwjv
 WQndJpk7ul+2kIlNcx4SEPMyoKdY46YyQ2MP3qjPVvRdKZ8R3yH3WQfj2xLINnsHUnDO
 ZohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y3fEn7k6DEbC0BSZl5T1cKqr6t4t3jgvkJEo6o2VWJg=;
 b=UC0fZiraObbdEI4sghO8Ljr1Rp62rdUCY61/P0fQ6hwJ+IskUMMtqtmuzx8OQHeH+O
 qZEiFK0+GAoGnmTwJuayfqG2GuiQ49jaoC0U/x1l63I9ZyZNsz9p1j3Nzpx+w8G5Tbmq
 QCSwZgjj2xcIxVmFzskqFHz6ycx7l8qaMYtXRwBp5eRc2KFZ9ki0zViMqhBp46u16ftr
 u+u9dxMZi/L3gocx9xa2Bn8Na1321lv5PeppRj0fLl7SuZwwPqdG913TpxoiG1yak3ET
 ot9dUT1/JP5CdzGPYQTI/eC8XvlAsc2bMU0qsu0X0of48nshPmBTFkfxWqHaczQCcoP/
 cDCw==
X-Gm-Message-State: AJIora++sCrmrPGDovZtuNfI2qm4o33V2MXwsRQzAZSyXoOt5k4mZv29
 jTB6Lio7m9nFT8h0OScaXsCwts96iU92vWAqShs=
X-Google-Smtp-Source: AGRyM1sCY24F2pEPhG1uDrQQmbeNKcxn2P0g2UtmOwj7faRUDuEi5O71VSZCHL0+DLUg4GOwi/Ey7mykcBwsz36AuRU=
X-Received: by 2002:a81:54c1:0:b0:31d:ec18:fd5d with SMTP id
 i184-20020a8154c1000000b0031dec18fd5dmr7130568ywb.277.1657903923745; Fri, 15
 Jul 2022 09:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220715112607.591-1-peterwu.pub@gmail.com>
 <20220715112607.591-11-peterwu.pub@gmail.com>
In-Reply-To: <20220715112607.591-11-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 15 Jul 2022 18:51:27 +0200
Message-ID: <CAHp75Ve_WRAUyy=h9_F-tC1dDkb_=-F1uf7_h7R0p7xZgBAd-w@mail.gmail.com>
Subject: Re: [PATCH v5 10/13] power: supply: mt6370: Add MediaTek MT6370
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

On Fri, Jul 15, 2022 at 1:29 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: ChiaEn Wu <chiaen_wu@richtek.com>
>
> MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
> with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
> driver, display bias voltage supply, one general purpose LDO, and the
> USB Type-C & PD controller complies with the latest USB Type-C and PD
> standards.
>
> This adds MediaTek MT6370 Charger driver support. The charger module
> of MT6370 supports High-Accuracy Voltage/Current Regulation,
> Average Input Current Regulation, Battery Temperature Sensing,
> Over-Temperature Protection, DPDM Detection for BC1.2.

...

> +static int mt6370_chg_probe(struct platform_device *pdev)
> +{
> +       int ret;
> +       struct mt6370_priv *priv;
> +
> +       priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       priv->dev = &pdev->dev;
> +
> +       priv->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +       if (!priv->regmap)
> +               return dev_err_probe(&pdev->dev, -ENODEV,
> +                                    "Failed to get regmap\n");
> +
> +       ret = mt6370_chg_init_rmap_fields(priv);
> +       if (ret)
> +               return dev_err_probe(&pdev->dev, ret,
> +                                    "Failed to init regmap fields\n");
> +
> +       platform_set_drvdata(pdev, priv);
> +
> +       priv->iio_adcs = devm_iio_channel_get_all(priv->dev);
> +       if (IS_ERR(priv->iio_adcs))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(priv->iio_adcs),
> +                                    "Failed to get iio adc\n");
> +
> +       ret = mt6370_chg_init_otg_regulator(priv);
> +       if (ret)
> +               return dev_err_probe(&pdev->dev, ret,
> +                                    "Failed to init otg regulator\n");
> +
> +       ret = mt6370_chg_init_psy(priv);
> +       if (ret)
> +               return dev_err_probe(&pdev->dev, ret, "Failed to init psy\n");
> +
> +       mutex_init(&priv->attach_lock);
> +       priv->attach = MT6370_ATTACH_STAT_DETACH;
> +
> +       priv->wq = create_singlethread_workqueue(dev_name(priv->dev));
> +       if (IS_ERR(priv->wq))

> +               return dev_err_probe(priv->dev, PTR_ERR(priv->wq),
> +                                    "Failed to create workqueue\n");

You need either wrap mutex to be deallocated by devm or don't use
dev_err_probe() here.

> +       INIT_WORK(&priv->bc12_work, mt6370_chg_bc12_work_func);
> +       INIT_DELAYED_WORK(&priv->mivr_dwork, mt6370_chg_mivr_dwork_func);
> +
> +       ret = mt6370_chg_init_setting(priv);
> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to init mt6370 charger setting\n");
> +               goto probe_out;
> +       }
> +
> +       ret = mt6370_chg_init_irq(priv);
> +       if (ret)
> +               goto probe_out;
> +
> +       mt6370_chg_pwr_rdy_check(priv);
> +
> +       return 0;
> +
> +probe_out:
> +       cancel_delayed_work_sync(&priv->mivr_dwork);
> +       flush_workqueue(priv->wq);
> +       destroy_workqueue(priv->wq);
> +       mutex_destroy(&priv->attach_lock);
> +
> +       return ret;
> +}
> +
> +static int mt6370_chg_remove(struct platform_device *pdev)
> +{
> +       struct mt6370_priv *priv = platform_get_drvdata(pdev);
> +
> +       cancel_delayed_work_sync(&priv->mivr_dwork);
> +       flush_workqueue(priv->wq);
> +       destroy_workqueue(priv->wq);
> +       mutex_destroy(&priv->attach_lock);
> +
> +       return 0;
> +}


-- 
With Best Regards,
Andy Shevchenko
