Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 298C3565E5D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 22:20:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D1910E238;
	Mon,  4 Jul 2022 20:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ACF610E144
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 20:20:33 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id l11so18449420ybu.13
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jul 2022 13:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6/OYescpC12d20RwbBmj4WBQ3v7OC1u9RlDvkq13ckI=;
 b=cegCCcDkUoo9P6FNcssziPe3wSPrKUvAGCjIOIIy9fhcj35RkgxKJl+LbBpnuq3wjU
 JtZm3oS9OqN+sojHrPwB50NIagpcab7QJIX1ILsQ1nJ3StpvjNnYljM49uisc2SiVCWu
 j+rtopNKTrfSTkSrCEj5pkG8bfUOxmoh6VMMD0Z3C7+zk3OYZ7p4bcaWrLSOEPhtwFjV
 ukHS++YJVwKW7lmRgBitYGThBKP4TMSFRMAMUNaen1amEPS1C+rGOUMq/TS5XsdgdxNa
 DPHYNnx/8ldISZwxJH+AJ4LPwa6A5JV5wzs0BLypkdYT38ysetCoOfRolw7meRpF0evK
 WYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6/OYescpC12d20RwbBmj4WBQ3v7OC1u9RlDvkq13ckI=;
 b=B8EQBPUUbfwBevg0SP7glULEWVy4/TBDgXiNvXG8/TcCvcZI4S9YZkdHSCmYi5/hML
 6qZjin/LvWdRcKncY048V5f5DuxqH9AWTJ4nRIsLB9woMUA3dP17u4JjqrhFv7OvQ8Ei
 n/On2Mxbud6M9xo+qv0oFccIkj6sEQxyWRd7y8nrsHoRzkoiMqtMYd0O+MmZdoL/v+6l
 1DuAtFb/g2bCRSry6VN2EsLqhAGFho6JkuYEXW/UTgMwZHPMcqHnCwF5E43zyVZzlaiM
 EEjE1uANZzygDNfLejRk41kpT+CkmQqWxQ6d7ev5yH8/mZAQHGxm8is4qbSkfovvl+ts
 rlug==
X-Gm-Message-State: AJIora8K/Lqo6bz29TGKRUTruqzWxPv2FHa9XNPG/4Q2mdwi+fO0c6t0
 QmfWoyFotA0GnmDlfAEV1YtjW2Kl7kOe45k9lxk=
X-Google-Smtp-Source: AGRyM1vGN87zp2vOQSkYPHdy4U3iFiPDyi3SOwkZWy9X2zeUnXbmXLO8oItZWKupT1Gp6nG69Gr+SrGEdJWU94cJNCE=
X-Received: by 2002:a5b:68a:0:b0:66e:472a:83f4 with SMTP id
 j10-20020a5b068a000000b0066e472a83f4mr8514627ybq.570.1656966032191; Mon, 04
 Jul 2022 13:20:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220704053901.728-1-peterwu.pub@gmail.com>
 <20220704053901.728-9-peterwu.pub@gmail.com>
In-Reply-To: <20220704053901.728-9-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 4 Jul 2022 22:19:55 +0200
Message-ID: <CAHp75VeNRVHr-LorfnWAkwfXzT+ix6S9sZ623OBA8+0Zi8Xucg@mail.gmail.com>
Subject: Re: [PATCH v4 08/13] usb: typec: tcpci_mt6370: Add Mediatek MT6370
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

On Mon, Jul 4, 2022 at 7:42 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> Add chip level mt6370 tcpci driver.

...

> +static const struct reg_sequence mt6370_reg_init[] = {
> +       REG_SEQ(0xA0, 0x1, 1000),
> +       REG_SEQ(0x81, 0x38, 0),
> +       REG_SEQ(0x82, 0x82, 0),
> +       REG_SEQ(0xBA, 0xFC, 0),
> +       REG_SEQ(0xBB, 0x50, 0),
> +       REG_SEQ(0x9E, 0x8F, 0),
> +       REG_SEQ(0xA1, 0x5, 0),
> +       REG_SEQ(0xA2, 0x4, 0),
> +       REG_SEQ(0xA3, 0x4A, 0),
> +       REG_SEQ(0xA4, 0x01, 0),
> +       REG_SEQ(0x95, 0x01, 0),
> +       REG_SEQ(0x80, 0x71, 0),
> +       REG_SEQ(0x9B, 0x3A, 1000)

Keep a comma here in case something would be added later on.

> +};

...

> +       if (ret && !source)
> +               return regulator_disable(priv->vbus);
> +       else if (!ret && source)
> +               return regulator_enable(priv->vbus);
> +       else
> +               return 0;

'else' is redundant in both cases.

...

> +static int mt6370_check_vendor_info(struct mt6370_priv *priv)
> +{
> +       struct regmap *regmap = priv->tcpci_data.regmap;
> +       u16 vid;
> +       int ret;
> +
> +       ret = regmap_raw_read(regmap, TCPC_VENDOR_ID, &vid, sizeof(u16));
> +       if (ret)
> +               return ret;
> +
> +       if (vid != MT6370_VENDOR_ID) {
> +               dev_err(priv->dev, "Vendor ID not correct 0x%02x\n", vid);
> +               return -ENODEV;

return dev_err_probe(...);

> +       }
> +
> +       return 0;
> +}
> +
> +static int mt6370_tcpc_probe(struct platform_device *pdev)
> +{
> +       struct mt6370_priv *priv;
> +       int ret;
> +
> +       priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       priv->dev = &pdev->dev;
> +       platform_set_drvdata(pdev, priv);
> +
> +       priv->tcpci_data.regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +       if (!priv->tcpci_data.regmap)

> +               return dev_err_probe(&pdev->dev, -ENODEV,
> +                                    "Failed to init regmap\n");

You may save some LoCs by introducing a temporary variable

  struct device *dev = &pdev->dev;

and here on a single line

  return dev_err_probe(dev, ...);

Ditto for the rest.

...

> +       ret = mt6370_check_vendor_info(priv);
> +       if (ret)

> +               return dev_err_probe(&pdev->dev, ret,
> +                                    "Failed to check vendor info\n");

This duplicates (with less info given) the message from the callee.

...

> +       { .compatible = "mediatek,mt6370-tcpc", },

Inner comma is not needed.

-- 
With Best Regards,
Andy Shevchenko
